--[[
	Exchange Shop [bitchange]

This code is based on the idea of Dan Duncombe's exchange shop
	https://web.archive.org/web/20160403113102/https://forum.minetest.net/viewtopic.php?id=7002
You do not need the entire bitchange mod to use this code.
Make sure you've got all textures to use it in a separate mod.

License: WTFPL
]]


if not bitchange then
	-- Default values, if bitchange wasn't found.
	bitchange = {}
	bitchange.exchangeshop_pipeworks = true

	function bitchange.has_access(owner, player_name)
		if player_name == owner or owner == "" then
			return true
		end
		local privs = minetest.get_player_privs(player_name)
		return privs.server or privs.protection_bypass
	end
end

local exchange_shop = {}

-- Tool wear aware replacement for contains_item.
local function list_contains_item(inv, listname, stack)
	local count = stack:get_count()
	if count == 0 then
		return true
	end

	local list = inv:get_list(listname)
	local name = stack:get_name()
	local wear = stack:get_wear()
	for _, list_stack in pairs(list) do
		if list_stack:get_name() == name and
		   list_stack:get_wear() <= wear then
			if list_stack:get_count() >= count then
				return true
			else
				count = count - list_stack:get_count()
			end
		end
	end
end

-- Tool wear aware replacement for remove_item.
local function list_remove_item(inv, listname, stack)
	local wanted = stack:get_count()
	if wanted == 0 then
		return stack
	end

	local list = inv:get_list(listname)
	local name = stack:get_name()
	local wear = stack:get_wear()
	local remaining = wanted
	local removed_wear = 0

	for index, list_stack in pairs(list) do
		if list_stack:get_name() == name and
		   list_stack:get_wear() <= wear then
			local taken_stack = list_stack:take_item(remaining)
			inv:set_stack(listname, index, list_stack)

			removed_wear = math.max(removed_wear, taken_stack:get_wear())
			remaining = remaining - taken_stack:get_count()
			if remaining == 0 then
				break
			end
		end
	end

	-- Todo: Also remove kebab
	local removed_stack = ItemStack(name)
	removed_stack:set_count(wanted - remaining)
	removed_stack:set_wear(removed_wear)
	return removed_stack
end

local function get_exchange_shop_formspec(mode, pos, title)
	local name = "nodemeta:"..pos.x..","..pos.y..","..pos.z

	if mode == "customer" then
		-- customer
		return (
			"size[8,9;]"..
			"label[0,0;Exchange shop]"..
			"label[1,0.5;Owner needs:]"..
			"list["..name..";cust_ow;1,1;2,2;]"..
			"button[3,2.4;2,1;exchange;Exchange]"..
			"label[5,0.5;Owner gives:]"..
			"list["..name..";cust_og;5,1;2,2;]"..
			"label[0.7,3.5;Ejected items:]"..
			"label[0.7,3.8;(Remove me!)]"..
			"list["..name..";cust_ej;3,3.5;4,1;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring["..name..";custm_ej]"..
			"listring[current_player;main]"
		)
	end
	if mode == "owner_custm"
			or mode == "owner_stock" then
		-- owner
		local formspec = (
			"size[11,10;]"..
			"label[0.3,0.1;Title:]"..
			"field[1.5,0.5;3,0.5;title;;"..title.."]"..
			"field_close_on_enter[title;false]"..
			"button[4.1,0.2;1,0.5;set_title;Set]"..
			"label[0,0.7;You need:]"..
			"list["..name..";cust_ow;0,1.2;2,2;]"..
			"label[3,0.7;You give:]"..
			"list["..name..";cust_og;3,1.2;2,2;]"..
			"label[0,3.5;Ejected items: (Remove me!)]"..
			"list["..name..";custm_ej;0,4;4,1;]"..
			"label[6,0;You are viewing:]"..
			"label[6,0.3;(Click to switch)]"..
			"listring["..name..";custm_ej]"..
			"listring[current_player;main]"
		)
		if mode == "owner_custm" then
			formspec = (formspec..
				"button[8.5,0.2;2.5,0.5;vstock;Customers stock]"..
				"list["..name..";custm;6,1;5,4;]"..
				"listring["..name..";custm]"..
				"listring[current_player;main]")
		else
			formspec = (formspec..
				"button[8.5,0.2;2.5,0.5;vcustm;Your stock]"..
				"list["..name..";stock;6,1;5,4;]"..
				"listring["..name..";stock]"..
				"listring[current_player;main]")
		end
		return (formspec..
			"label[1,5;Use (E) + (Right click) for customer interface]"..
			"list[current_player;main;1,6;8,4;]")
	end
	return ""
end

local function get_exchange_shop_tube_config(mode)
	if mode == "groups" then
		if bitchange.exchangeshop_pipeworks then
			return {choppy=2, oddly_breakable_by_hand=2, 
				tubedevice=1, tubedevice_receiver=1}
		end
		return {choppy=2, oddly_breakable_by_hand=2}
	end
	if mode == "tube" then
		if bitchange.exchangeshop_pipeworks then
			return {
				insert_object = function(pos, node, stack, direction)
					local meta = minetest.get_meta(pos)
					local inv = meta:get_inventory()
					return inv:add_item("stock", stack)
				end,
				can_insert = function(pos, node, stack, direction)
					local meta = minetest.get_meta(pos)
					local inv = meta:get_inventory()
					return inv:room_for_item("stock", stack)
				end,
				input_inventory = "custm",
				connect_sides = {left=1, right=1, back=1, top=1, bottom=1}
			}
		end
		return {
			insert_object = function()
				return false
			end,
			can_insert = function()
				return false
			end,
			connect_sides = {}
		}
	end
end

minetest.register_on_player_receive_fields(function(sender, formname, fields)
	if formname ~= "bitchange:shop_formspec" then
		return
	end

	local player_name = sender:get_player_name()
	local pos = exchange_shop[player_name]
	if not pos then
		return
	end

	if fields.quit then
		exchange_shop[player_name] = nil
		return
	end
	local meta = minetest.get_meta(pos)
	local title = meta:get_string("title")
	local shop_owner = meta:get_string("owner")

	if fields.title and bitchange.has_access(shop_owner, player_name) then
		-- Limit title length
		fields.title = fields.title:sub(1, 80)
		if title ~= fields.title then
			if fields.title ~= "" then
				meta:set_string("infotext", "'" .. fields.title
					.. "' (owned by " .. shop_owner .. ")")
			else
				meta:set_string("infotext", "Exchange shop (owned by "
					.. shop_owner ..")")
			end
			meta:set_string("title", minetest.formspec_escape(fields.title))
		end
	end

	if fields.exchange then
		local shop_inv = meta:get_inventory()
		if shop_inv:is_empty("cust_ow")
				and shop_inv:is_empty("cust_og") then
			return
		end
		if not shop_inv:is_empty("cust_ej")
				or not shop_inv:is_empty("custm_ej") then
			minetest.chat_send_player(player_name,
					"One or multiple ejection fields are filled. "..
					"Please empty them or contact the shop owner.")
			return
		end
		local player_inv = sender:get_inventory()
		local err_msg = ""
		local cust_ow = shop_inv:get_list("cust_ow")
		local cust_og = shop_inv:get_list("cust_og")

		-- Check validness of stack "owner wants"
		local cust_ow_ok = true
		for i1, item1 in pairs(cust_ow) do
			local name1 = item1:get_name()
			for i2, item2 in pairs(cust_ow) do
				if name1 == "" then
					break
				end
				if i1 ~= i2 and name1 == item2:get_name() then
					cust_ow_ok = false
					break
				end
			end
			if not cust_ow_ok then
				err_msg = "The field 'Owner needs' can not contain multiple "..
					"times the same items. Please contact the shop owner."
				break
			end
		end

		-- Check validness of stack "owner gives"
		if err_msg == "" then
			local cust_og_ok = true
			for i1, item1 in pairs(cust_og) do
				local name1 = item1:get_name()
				for i2, item2 in pairs(cust_og) do
					if name1 == "" then
						break
					end
					if i1 ~= i2 and name1 == item2:get_name() then
						cust_og_ok = false
						break
					end
				end
				if not cust_og_ok then
					err_msg = "The field 'Owner gives' can not contain multiple "..
						"times the same items. Please contact the shop owner."
					break
				end
			end
		end

		-- Check for space in the shop
		if err_msg == "" then
			for i, item in pairs(cust_ow) do
				if not shop_inv:room_for_item("custm", item) then
					err_msg = "The stock in this shop is full. "..
							"Please contact the shop owner."
					break
				end
			end
		end

		-- Check availability of the shop's items
		if err_msg == "" then
			for i, item in pairs(cust_og) do
				if not list_contains_item(shop_inv, "stock", item) then
					err_msg = "This shop is sold out."
					break
				end
			end
		end

		-- Check for space in the player's inventory
		if err_msg == "" then
			for i, item in pairs(cust_og) do
				if not player_inv:room_for_item("main", item) then
					err_msg = "You do not have enough space in your inventory."
					break
				end
			end
		end

		-- Check availability of the player's items
		if err_msg == "" then
			for i, item in pairs(cust_ow) do
				if not list_contains_item(player_inv, "main", item) then
					err_msg = "You do not have the required items."
					break
				end
			end
		end

		-- Do the exchange!
		if err_msg == "" then
			local fully_exchanged = true
			for i, item in pairs(cust_ow) do
				local stack = list_remove_item(player_inv, "main", item)
				if shop_inv:room_for_item("custm", stack) then
					shop_inv:add_item("custm", stack)
				else
					-- Move to ejection field
					shop_inv:add_item("custm_ej", stack)
					fully_exchanged = false
				end
			end
			for i, item in pairs(cust_og) do
				local stack = list_remove_item(shop_inv, "stock", item)
				if player_inv:room_for_item("main", stack) then
					player_inv:add_item("main", stack)
				else
					-- Move to ejection field
					shop_inv:add_item("cust_ej", stack)
					fully_exchanged = false
				end
			end
			if not fully_exchanged then
				err_msg = "Warning! Stacks are overflowing somewhere!"
			end
		end

		-- Throw error message
		if err_msg ~= "" then
			minetest.chat_send_player(player_name, "Exchange shop: "..err_msg)
		end
	elseif bitchange.has_access(shop_owner, player_name) then
		local mode
		if fields.vcustm then
			mode = "owner_custm"
		elseif fields.vstock then
			mode = "owner_stock"
		else
			return
		end
		minetest.show_formspec(player_name, "bitchange:shop_formspec",
			get_exchange_shop_formspec(mode, pos, title))
	end
end)

minetest.register_node(":bitchange:shop", {
	description = "Shop",
	tiles = {"bitchange_shop_top.png", "bitchange_shop_top.png",
			 "bitchange_shop_side.png", "bitchange_shop_side.png",
			 "bitchange_shop_side.png", "bitchange_shop_front.png"},
	paramtype2 = "facedir",
	groups = get_exchange_shop_tube_config("groups"),
	tube = get_exchange_shop_tube_config("tube"),
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name())
		meta:set_string("infotext", "Exchange shop (owned by "..
				meta:get_string("owner")..")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Exchange shop (constructing)")
		meta:set_string("formspec", "")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("stock", 5*4) -- needed stock for exchanges
		inv:set_size("custm", 5*4) -- stock of the customers exchanges
		inv:set_size("custm_ej", 4) -- ejected items if shop has no inventory room
		inv:set_size("cust_ow", 2*2) -- owner wants
		inv:set_size("cust_og", 2*2) -- owner gives
		inv:set_size("cust_ej", 4) -- ejected items if player has no inventory room
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if inv:is_empty("stock") and inv:is_empty("custm")
				and inv:is_empty("cust_ow") and inv:is_empty("custm_ej")
				and inv:is_empty("cust_og") and inv:is_empty("cust_ej") then
			return true
		end
		minetest.chat_send_player(player:get_player_name(),
			"Cannot dig exchange shop: one or multiple stocks are in use.")
		return false
	end,
	on_rightclick = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		local player_name = clicker:get_player_name()

		local mode = "customer"
		if bitchange.has_access(meta:get_string("owner"), player_name) and
				not clicker:get_player_control().aux1 then
			mode = "owner_custm"
		end
		exchange_shop[player_name] = pos
		minetest.show_formspec(player_name, "bitchange:shop_formspec",
			get_exchange_shop_formspec(mode, pos, meta:get_string("title")))
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if bitchange.has_access(meta:get_string("owner"), player:get_player_name()) then
			return count
		end
		return 0
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if player:get_player_name() == ":pipeworks" then
			return stack:get_count()
		end
		if listname == "custm" then
			minetest.chat_send_player(player:get_player_name(),
				"Exchange shop: Please press 'Customers stock' and insert your items there.")
			return 0
		end
		local meta = minetest.get_meta(pos)
		if bitchange.has_access(meta:get_string("owner"), player:get_player_name())
				and listname ~= "cust_ej"
				and listname ~= "custm_ej" then
			return stack:get_count()
		end
		return 0
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if player:get_player_name() == ":pipeworks" then
			return stack:get_count()
		end
		local meta = minetest.get_meta(pos)
		if bitchange.has_access(meta:get_string("owner"), player:get_player_name())
				or listname == "cust_ej" then
			return stack:get_count()
		end
		return 0
	end,
})

minetest.register_craft({
	output = "bitchange:shop",
	recipe = {
		{"default:sign_wall"},
		{"default:chest_locked"},
	}
})

minetest.register_on_leaveplayer(function(player)
	local player_name = player:get_player_name()
	exchange_shop[player_name] = nil
end)

if minetest.get_modpath("wrench") and wrench then
	local STRING = wrench.META_TYPE_STRING
	wrench:register_node("bitchange:shop", {
		lists = {"stock", "custm", "custm_ej", "cust_ow", "cust_og", "cust_ej"},
		metas = {
			owner = STRING,
			infotext = STRING,
			title = STRING,
		},
		owned = true
	})
end
