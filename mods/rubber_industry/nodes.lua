-----------
-- Nodes --
-----------

-- Rubber Storage
minetest.register_node("rubber_industry:rubber_storage", {
	description = "Rubber Storage",
	tiles = {
		"rubber_industry_rubber_storage_top.png",
		"rubber_industry_rubber_storage_bottom.png",
		"rubber_industry_rubber_storage_side.png",
		"rubber_industry_rubber_storage_side.png",
		"rubber_industry_rubber_storage_side.png",
		"rubber_industry_rubber_storage_side.png"
	},
	groups = {cracky=2},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function (pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Rubber Storage")
		local inv = meta:get_inventory()
		inv:set_size("main", 8 * 4)
	end,
	on_punch = function(pos, node, puncher)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local pwield = puncher:get_wielded_item()
		if pwield:get_name() == "rubber:bucket_rubber" then
			local itst = ItemStack("rubber_sheet:rubber_base")
			if inv:room_for_item("main", itst) then
				inv:add_item("main", itst)
				puncher:set_wielded_item(ItemStack("bucket:bucket_empty"))
			end
		end
	end
})

-- Rubber Storage Craft
minetest.register_craft({
	output = "rubber_industry:rubber_storage",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"rubber_industry:rubber_sheet", "rubber_industry:rubber_sheet", "rubber_industry:rubber_sheet"},
		{"rubber_industry:rubber_sheet", "rubber_industry:rubber_sheet", "rubber_industry:rubber_sheet"}
	}
})

--Register autocrafter node
minetest.register_node("rubber_industry:autocrafter", {
	description = "Autocrafter",
	tiles = {
		"rubber_industry_autocrafter_top.png",
		"rubber_industry_autocrafter_bottom.png",
		"rubber_industry_autocrafter_side.png",
		"rubber_industry_autocrafter_side.png",
		"rubber_industry_autocrafter_side.png",
		"rubber_industry_autocrafter_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "size[10,10;]" ..
			"label[0.8,0;Source Material]" ..
			"list[context;src;1,1;2,4;]" ..
			"label[4.4,0;Recipe to Use]" ..
			"list[context;rec;4,1;3,3;]" ..
			"label[4.7,4;Fuel Source]" ..
			"list[context;fuel;5,4.5;1,1;]" ..
			"label[7.7,0;Craft Output]" ..
			"list[context;dst;8,1;1,4;]" ..
			"list[current_player;main;1,6;8,4;]" )
		meta:set_string("infotext", "Autocrafter")
		meta:set_int("timeleft", 0)
		local inv = meta:get_inventory()
		inv:set_size("src", 2 * 4)
		inv:set_size("fuel", 1 * 1)
		inv:set_size("rec", 3 * 3)
		inv:set_size("dst", 1 * 4)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("src") and inv:is_empty("fuel") and inv:is_empty("rec") and inv:is_empty("dst")
	end
})

-- functions
local get_recipe = function(inv)
	local result, needed, input
	needed = inv:get_list("rec")
	result, input = minetest.get_craft_result({
		method = "normal",
		width = 3,
		items = needed
	})
	
	local totalneed = {}
	
	if result.item:is_empty() then
		result = nil
	else
		result = result.item
		for _, item in ipairs(needed) do
			if item ~= nil and not item:is_empty() and not inv:contains_item("src", item) then
				result = nil
				break
			end
			if item ~= nil and not item:is_empty() then
				if totalneed[item:get_name()] == nil then
					totalneed[item:get_name()] = 1
				else
					totalneed[item:get_name()] = totalneed[item:get_name()] + 1
				end
			end
		end
		for name, number in pairs(totalneed) do
			local totallist = inv:get_list("src")
			for i, srcitem in pairs(totallist) do
				if srcitem:get_name() == name then
					local taken = srcitem:take_item(number)
					number = number - taken:get_count()
					totallist[i] = srcitem
				end
				if number <= 0 then
					break
				end
			end
			if number > 0 then
				result = nil
				break
			end
		end
	end

	return needed, input, result
end

-- Autocrafter ABM
minetest.register_abm({
	nodenames = {"rubber_industry:autocrafter"},
	interval = 1,
	chance = 1,
	action = function (pos, node)
		local meta = minetest.get_meta(pos)
		local timeleft = meta:get_int("timeleft")
		local inv = meta:get_inventory()
		local fuel, cresult, newinput, needed

		if timeleft <= 0 and not inv:is_empty("fuel") then
			fuel = inv:get_list("fuel")
			cresult, _ = minetest.get_craft_result({
				method = "fuel",
				width = 1,
				items = fuel
			})
			if cresult.time ~= 0 then
				timeleft = cresult.time * 2
				local thestack = inv:get_stack("fuel", 1)
				thestack:take_item()
				inv:set_stack("fuel", 1, thestack)
			end
		end

		if timeleft ~= 0 and not inv:is_empty("src") then
			-- Check for a valid recipe and sufficient resources to craft it
			needed, newinput, result = get_recipe(inv)
			if result ~= nil and inv:room_for_item("dst", result) then
				timeleft = timeleft - 1
				inv:add_item("dst", result)
				for i, item in pairs(needed) do
					if item ~= nil and item ~= "" then
						inv:remove_item("src", ItemStack(item))
					end
					if newinput[i] ~= nil and not newinput[i]:is_empty() then
						inv:add_item("src", newinput[i])
					end
				end
			end
		end

		meta:set_int("timeleft", timeleft)
	end
})

minetest.register_craft({
	output = "rubber_industry:autocrafter",
	recipe = {
		{"factory:craft_performer", "factory:craft_performer", "factory:craft_performer"},
		{"hopper:hopper", "", "hopper:hopper"},
		{"transactor:transactor", "dumbwaiter:dumbwaiter", "transactor:transactor"}
	}
})

-- Gear, can also be placed on the wall
minetest.register_node("rubber_industry:gear", {
	description = "Gear",
	drawtype = "signlike",
	tiles = {"rubber_industry_gear.png"},
	inventory_image = "rubber_industry_gear.png",
	wieldimage = "rubber_industry_gear.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky=2},
})

-- Gear craft
minetest.register_craft({
	output = "rubber_industry:gear",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

-- Conveyor Belt
minetest.register_node("rubber_industry:conveyor_belt", {
	description = "Conveyor Belt",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "rubber_industry_conveyor_belt_top.png",
	wieldimage = "rubber_industry_conveyor_belt_top.png",
	tiles = {
			{name="rubber_industry_conveyor_belt_top_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.5}},
		"rubber_industry_conveyor_belt_side.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.0,0.5,0.5,0.5},
		},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

-- Conveyor Belt Craft
minetest.register_craft({
	output = "conveyor:conveyor",
	recipe = {
		{"rubber_industry:rubber_sheet", "rubber_industry:rubber_sheet", "rubber_industry:rubber_sheet"},
		{"rubber_industry:gear", "rubber_industry:gear", "rubber_industry:gear"},
		{"rubber_industry:rubber_sheet", "rubber_industry:rubber_sheet", "rubber_industry:rubber_sheet"}
	}
})
