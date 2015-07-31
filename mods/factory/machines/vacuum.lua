minetest.register_node("factory:vacuum_on", {
	description = "Vacuum",
	tiles = {"factory_machine_steel_dark.png^factory_ring_green.png", "factory_machine_steel_dark.png^factory_8x8_black_square_32x32.png", "factory_machine_steel_dark.png",
		"factory_machine_steel_dark.png", "factory_machine_steel_dark.png", "factory_machine_steel_dark.png"},
	groups = {cracky=2},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	legacy_facedir_simple = true,
	node_box = {
		type = "fixed",
		fixed = {{-0.25, 0.3125, -0.25, 0.25, 0.375, 0.25},
		{-0.3125, 0.4375, -0.375, 0.3125, 0.5, -0.3125},
		{-0.3125, 0.4375, 0.3125, 0.3125, 0.5, 0.375}, 
		{0.3125, 0.4375, -0.375, 0.375, 0.5, 0.375},
		{-0.375, 0.4375, -0.375, -0.3125, 0.5, 0.375}, 
		{-0.3125, 0.375, 0.25, 0.3125, 0.4375, 0.3125}, 
		{-0.3125, 0.375, -0.3125, 0.3125, 0.4375, -0.25}, 
		{0.25, 0.375, -0.25, 0.3125, 0.4375, 0.25},
		{-0.3125, 0.375, -0.25, -0.25, 0.4375, 0.25},
		{-0.25, 0.375, 0.3125, -0.1875, 0.4375, 0.5},
		{0.1875, 0.375, 0.25, 0.25, 0.4375, 0.5}, 
		{-0.25, 0.375, -0.5, -0.1875, 0.4375, -0.3125}, 
		{0.1875, 0.375, -0.5, 0.25, 0.4375, -0.3125}, 
		{0.3125, 0.375, -0.25, 0.5, 0.4375, -0.1875},
		{0.3125, 0.375, 0.1875, 0.5, 0.4375, 0.25}, 
		{-0.5, 0.375, 0.1875, -0.3125, 0.4375, 0.25},
		{-0.5, 0.375, -0.25, -0.3125, 0.4375, -0.1875},
		{-0.125, -0.4375, -0.125, 0.125, 0.3125, 0.125},
		{-0.125, 0, -0.1875, 0.1875, 0.0625, -0.125},
		{0.125, 0.0625, -0.1875, 0.1875, 0.25, -0.125},
		{0.125, 0.1875, -0.25, 0.1875, 0.3125, -0.1875},
		{0.125, 0, -0.1875, 0.1875, 0.0625, 0.125},
		{-0.125, -0.375, -0.1875, -0.0625, 0, -0.125},}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
		}
	},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.swap_node(pos, {name = "factory:vacuum_off", param2 = node.param2})
	end,
})

minetest.register_node("factory:vacuum_off", {
	description = "Vacuum",
	tiles = {"factory_machine_steel_dark.png^factory_ring_red.png", "factory_machine_steel_dark.png^factory_8x8_black_square_32x32.png", "factory_machine_steel_dark.png",
		"factory_machine_steel_dark.png", "factory_machine_steel_dark.png", "factory_machine_steel_dark.png"},
	groups = {cracky=2, not_in_creative_inventory = 1},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	legacy_facedir_simple = true,
	node_box = {
		type = "fixed",
		fixed = {{-0.25, 0.3125, -0.25, 0.25, 0.375, 0.25},
		{-0.3125, 0.4375, -0.375, 0.3125, 0.5, -0.3125},
		{-0.3125, 0.4375, 0.3125, 0.3125, 0.5, 0.375}, 
		{0.3125, 0.4375, -0.375, 0.375, 0.5, 0.375},
		{-0.375, 0.4375, -0.375, -0.3125, 0.5, 0.375}, 
		{-0.3125, 0.375, 0.25, 0.3125, 0.4375, 0.3125}, 
		{-0.3125, 0.375, -0.3125, 0.3125, 0.4375, -0.25}, 
		{0.25, 0.375, -0.25, 0.3125, 0.4375, 0.25},
		{-0.3125, 0.375, -0.25, -0.25, 0.4375, 0.25},
		{-0.25, 0.375, 0.3125, -0.1875, 0.4375, 0.5},
		{0.1875, 0.375, 0.25, 0.25, 0.4375, 0.5}, 
		{-0.25, 0.375, -0.5, -0.1875, 0.4375, -0.3125}, 
		{0.1875, 0.375, -0.5, 0.25, 0.4375, -0.3125}, 
		{0.3125, 0.375, -0.25, 0.5, 0.4375, -0.1875},
		{0.3125, 0.375, 0.1875, 0.5, 0.4375, 0.25}, 
		{-0.5, 0.375, 0.1875, -0.3125, 0.4375, 0.25},
		{-0.5, 0.375, -0.25, -0.3125, 0.4375, -0.1875},
		{-0.125, -0.4375, -0.125, 0.125, 0.3125, 0.125},
		{-0.125, 0, -0.1875, 0.1875, 0.0625, -0.125},
		{0.125, 0.0625, -0.1875, 0.1875, 0.25, -0.125},
		{0.125, 0.1875, -0.25, 0.1875, 0.3125, -0.1875},
		{0.125, 0, -0.1875, 0.1875, 0.0625, 0.125},
		{-0.125, -0.375, -0.1875, -0.0625, 0, -0.125},}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
		}
	},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.swap_node(pos, {name = "factory:vacuum_on", param2 = node.param2})
	end,
})

minetest.register_abm({
	nodenames = {"factory:vacuum_on"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local all_objects = factory.get_objects_with_square_radius({x = pos.x, y = pos.y + 3, z = pos.z}, 2)
		local _,obj
		for _,obj in ipairs(all_objects) do
			if not obj:is_player() and obj:get_luaentity() and (obj:get_luaentity().name == "__builtin:item" or obj:get_luaentity().name == "factory:moving_item") then
				obj:moveto({x = pos.x, y = pos.y - 0.5, z = pos.z})
			end
		end
	end,
})