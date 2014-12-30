--Created by Krock for the BitChange mod
--Parts of codes, images and ideas from Dan Duncombe's exchange shop
--  https://forum.minetest.net/viewtopic.php?id=7002
--License: WTFPL

local exchange_shop = {}

local function get_exchange_shop_formspec(number,pos,title)
	local formspec = ""
	local name = "nodemeta:"..pos.x..","..pos.y..","..pos.z
	if number == 1 then
		-- customer
		formspec = ("size[8,9;]"..
				"label[0,0;Exchange shop]"..
				"label[1,0.5;Owner needs:]"..
				"list["..name..";cust_ow;1,1;2,2;]"..
				"button[3,2.4;2,1;exchange;Exchange]"..
				"label[5,0.5;Owner gives:]"..
				"list["..name..";cust_og;5,1;2,2;]"..
				"label[0.7,3.5;Ejected items:]"..
				"label[0.7,3.8;(Remove me!)]"..
				"list["..name..";cust_ej;3,3.5;4,1;]"..
				"list[current_player;main;0,5;8,4;]")
	elseif number == 2 or number == 3 then
		-- owner
		formspec = ("size[11,10;]"..
				"label[0.3,0.1;Title:]"..
				"field[1.5,0.5;3,0.5;title;;"..title.."]"..
				"button[4.1,0.24;1,0.5;set_title;Set]"..
				"label[0,0.7;You need:]"..
				"list["..name..";cust_ow;0,1.2;2,2;]"..
				"label[3,0.7;You give:]"..
				"list["..name..";cust_og;3,1.2;2,2;]"..
				"label[0.3,3.5;Ejected items: (Remove me!)]"..
				"list["..name..";custm_ej;0,4;4,1;]"..
				"label[6,0;You are viewing:]"..
				"label[6,0.3;(Click to switch)]")
		if number == 2 then
			formspec = (formspec.."button[8.5,0.2;2.5,0.5;vstock;Customers stock]"..
				"list["..name..";custm;6,1;5,4;]")
		else
			formspec = (formspec.."button[8.5,0.2;2.5,0.5;vcustm;Your stock]"..
				"list["..name..";stock;6,1;5,4;]")
		end
		formspec = (formspec..
				"label[1,5;What does the customer see? Right-click on this shop whilst holding (E)]"..
				"list[current_player;main;1,6;8,4;]")
	end
	return formspec
end

local function get_exchange_shop_tube_config(mode)
	if minetest.get_modpath("pipeworks") then
		if mode == 1 then
			return {choppy=2, oddly_breakable_by_hand=2, tubedevice=1, tubedevice_receiver=1}
		else
			return {
				insert_object = function(pos, node, stack, direction)
					local meta = minetest.get_meta(pos)
					local inv = meta:get_inventory()
					return inv:add_item("stock",stack)
				end,
				can_insert = function(pos, node, stack, direction)
					local meta = minetest.get_meta(pos)
					local inv = meta:get_inventory()
					return inv:room_for_item("stock",stack)
				end,
				input_inventory="custm",
				connect_sides = {left=1, right=1, back=1, top=1, bottom=1}
			}
		end
	else
		if mode == 1 then
			return {choppy=2,oddly_breakable_by_hand=2}
		else
			return {
				insert_object = function(pos, node, stack, direction)
					return false
				end,
				can_insert = function(pos, node, stack, direction)
					return false
				end,
				connect_sides = {}
			}
		end
	end
end

minetest.register_on_player_receive_fields(function(sender, formname, fields)
	if formname ~= "bitchange:shop_formspec" then
		return
	end
	local player_name = sender:get_player_name()
	local pos = exchange_shop[player_name]
	local meta = minetest.get_meta(pos)
	local title = meta:get_string("title") or ""
	local shop_owner = meta:get_string("owner")
	if fields.quit then
		exchange_shop[player_name] = nil
		return
	end
	
	if fields.set_title then
		if fields.title and title ~= fields.title then
			if fields.title ~= "" then
				meta:set_string("infotext", "'"..fields.title.."' (owned by "..shop_owner..")")
			else
				meta:set_string("infotext", "Exchange shop (owned by "..shop_owner..")")
			end
			meta:set_string("title", fields.title)
		end
	end
	
	if fields.exchange then
		local shop_inv = meta:get_inventory()
		if shop_inv:is_empty("cust_ow") and shop_inv:is_empty("cust_og") then
			return
		end
		if not shop_inv:is_empty("cust_ej") or not shop_inv:is_empty("custm_ej") then
			minetest.chat_send_player(player_name, "Exchange shop: Error, ejected items detected!")
		end
		local player_inv = sender:get_inventory()
		local err_msg = ""
		local cust_ow = shop_inv:get_list("cust_ow")
		local cust_og = shop_inv:get_list("cust_og")
		local cust_ow_legal = true
		local cust_og_legal = true
		--?shop configured well
		for i1, item1 in pairs(cust_ow) do
			for i2, item2 in pairs(cust_ow) do
				if item1:get_name() == item2:get_name() and i1 ~= i2 and item1:get_name() ~= "" then
					cust_ow_legal = false
					--break
				end
			end
			if not cust_ow_legal then
				break
			end
		end
		if not cust_ow_legal then
			err_msg = "The 'Owner needs' field can not contain multiple times the same items, contact the shop owner."
		end
		if err_msg == "" then --?shop configured well
			for i1, item1 in pairs(cust_og) do
				for i2, item2 in pairs(cust_og) do
					if item1:get_name() == item2:get_name() and i1 ~= i2 and item1:get_name() ~= "" then
						cust_og_legal = false
						break
					end
				end
				if not cust_og_legal then
					break
				end
			end
			if not cust_og_legal then
				err_msg = "The 'Owner gives' field can not contain multiple times the same items, contact the shop owner."
			end
		end
		if err_msg == "" then --?shop has space
			local shop_has_space = true
			for i, item in pairs(cust_ow) do
				if not shop_inv:room_for_item("custm", item) then
					shop_has_space = false
					break
				end
			end
			if not shop_has_space then
				err_msg = "The stock in the shop is full."
			end
		end
		if err_msg == "" then --?shop has items
			local shop_has_items = true
			for i, item in pairs(cust_og) do
				if not shop_inv:contains_item("stock", item) then
					shop_has_items = false
					break
				end
			end
			if not shop_has_items then
				err_msg = "The shop is empty and can not give you anything."
			end
		end
		if err_msg == "" then --?player has space
			local player_has_space = true
			for i, item in pairs(cust_og) do
				if not player_inv:room_for_item("main", item) then
					player_has_space = false
					break
				end
			end
			if not player_has_space then
				err_msg = "You do not have the space in your inventory."
			end
		end
		if err_msg == "" then --?player has items
			local player_has_items = true
			for i, item in pairs(cust_ow) do
				if not player_inv:contains_item("main", item) then
					player_has_items = false
					break
				end
			end
			if not player_has_items then
				err_msg = "You do not have the needed items."
			end
		end
		if err_msg == "" then --?exchange
			local fully_exchanged = true
			for i, item in pairs(cust_ow) do
				player_inv:remove_item("main", item) --player inv. to stock else to eject fields
				if shop_inv:room_for_item("custm", item) then
					shop_inv:add_item("custm", item)
				else
					shop_inv:add_item("custm_ej", item)
					fully_exchanged = false
				end
			end
			for i, item in pairs(cust_og) do
				shop_inv:remove_item("stock", item) --stock to player inv. else to eject fields
				if player_inv:room_for_item("main", item) then
					player_inv:add_item("main", item)
				else
					shop_inv:add_item("cust_ej", item)
					fully_exchanged = false
				end
			end
			if not fully_exchanged then
				err_msg = "Fatal error! Stocks are overflowing somewhere!"
			end
		end
		if err_msg ~= "" then
			minetest.chat_send_player(player_name, "Exchange shop: "..err_msg)
		end
	elseif bitchange_has_access(shop_owner, player_name) then
		local num = 0
		if fields.vcustm then
			num = 2
		elseif fields.vstock then
			num = 3
		else
			return
		end
		minetest.show_formspec(player_name, "bitchange:shop_formspec", get_exchange_shop_formspec(num, pos, title))
	end
end)

minetest.register_node("bitchange:shop", {
	description = "Shop",
	tiles = {"bitchange_shop_top.png", "bitchange_shop_top.png",
			 "bitchange_shop_side.png", "bitchange_shop_side.png",
			 "bitchange_shop_side.png", "bitchange_shop_front.png"},
	paramtype2 = "facedir",
	groups = get_exchange_shop_tube_config(1),
	tube = get_exchange_shop_tube_config(2),
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
		if (inv:is_empty("stock") and inv:is_empty("custm") and 
			inv:is_empty("custm_ej") and inv:is_empty("cust_ow") and 
			inv:is_empty("cust_og") and inv:is_empty("cust_ej")) then
			return true
		end
		minetest.chat_send_player(player:get_player_name(), "Can not dig exchange shop, one or multiple stocks are in use.")
		return false
	end,
	on_rightclick = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		local player_name = clicker:get_player_name()
		local view = 0
		exchange_shop[player_name] = pos
		if player_name == meta:get_string("owner") then
			if clicker:get_player_control().aux1 then
				view = 1
			else
				view = 2
			end
		else
			view = 1
		end
		minetest.show_formspec(player_name, "bitchange:shop_formspec", get_exchange_shop_formspec(view, pos, meta:get_string("title")))
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if bitchange_has_access(meta:get_string("owner"), player:get_player_name()) then
			return count
		end
		return 0
	end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if player:get_player_name() == ":pipeworks" then
			return stack:get_count()
		end
		if listname == "custm" then
			minetest.chat_send_player(player:get_player_name(), "Exchange shop: Please press 'Customers stock' and insert your items there.")
			return 0
		end
		local meta = minetest.get_meta(pos)
		if bitchange_has_access(meta:get_string("owner"), player:get_player_name()) and 
				listname ~= "cust_ej" and listname ~= "custm_ej" then
			return stack:get_count()
		end
		return 0
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if player:get_player_name() == ":pipeworks" then
			return stack:get_count()
		end
		local meta = minetest.get_meta(pos)
		if bitchange_has_access(meta:get_string("owner"), player:get_player_name()) or listname == "cust_ej" then
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
