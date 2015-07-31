minetest.register_node("factory:fan_on", {
	description = "Fan",
	tiles = {{name="factory_fan.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}}, "factory_belt_bottom.png", "factory_belt_side.png",
		"factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
	groups = {cracky=3, mesecon_effector_off = 1},
	drawtype = "nodebox",
	paramtype = "light",
	is_ground_content = true,
	node_box = {
			type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.0625,0.5},}
		},
	mesecons = {effector = {
		action_on = function(pos, node)
			minetest.swap_node(pos, {name = "factory:fan_off", param2 = node.param2})
		end
	}}
})

minetest.register_node("factory:fan_off", {
	description = "Fan",
	tiles = {{name="factory_fan.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0}}, "factory_belt_bottom.png", "factory_belt_side.png",
		"factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
	groups = {cracky=3, not_in_creative_inventory=1, mesecon_effector_on = 1},
	drawtype = "nodebox",
	paramtype = "light",
	is_ground_content = true,
	drop="factory:fan_on",
	node_box = {
			type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.0625,0.5},}
		},
	mesecons = {effector = {
		action_off = function(pos, node)
			minetest.swap_node(pos, {name = "factory:fan_on", param2 = node.param2})
		end
	}}
})

minetest.register_abm({
	nodenames = {"factory:fan_on"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local all_objects = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		local _,obj
		for _,obj in ipairs(all_objects) do
			if not obj:is_player() and obj:get_luaentity() and (obj:get_luaentity().name == "__builtin:item" or obj:get_luaentity().name == "factory:moving_item") then
				obj:moveto({x = obj:getpos().x, y = obj:getpos().y + 3, z = obj:getpos().z})
			end
		end
	end,
})




minetest.register_node("factory:fan_wall_on", {
	description = "Wall Fan",
	tiles = {"factory_belt_side.png^[transformFY", "factory_belt_side.png", "factory_belt_side.png^[transformR90",
		"factory_belt_side.png^[transformR270", "factory_belt_bottom.png", {name="factory_fan.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}}},
	groups = {cracky=3, mesecon_effector_off = 1},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	legacy_facedir_simple = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.5},
		}
	},
	mesecons = {effector = {
		action_on = function(pos, node)
			minetest.swap_node(pos, {name = "factory:fan_wall_off", param2 = node.param2})
		end
	}}
})

minetest.register_node("factory:fan_wall_off", {
	description = "Wall Fan",
	tiles = {"factory_belt_side.png^[transformFY", "factory_belt_side.png", "factory_belt_side.png^[transformR90",
		"factory_belt_side.png^[transformR270", "factory_belt_bottom.png", {name="factory_fan.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0}}},
	groups = {cracky=3, not_in_creative_inventory=1, mesecon_effector_on = 1},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	legacy_facedir_simple = true,
	drop="factory:fan_wall_on",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.5},
		}
	},
	mesecons = {effector = {
		action_off = function(pos, node)
			minetest.swap_node(pos, {name = "factory:fan_wall_on", param2 = node.param2})
		end
	}}
})

minetest.register_abm({
	nodenames = {"factory:fan_wall_on"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local a = minetest.facedir_to_dir(minetest.get_node(pos).param2)
		local all_objects = minetest.get_objects_inside_radius({x = pos.x - a.x/2, y = pos.y, z = pos.z - a.z/2}, 1)
		local _,obj
		for _,obj in ipairs(all_objects) do
			if not obj:is_player() and obj:get_luaentity() and (obj:get_luaentity().name == "__builtin:item" or obj:get_luaentity().name == "factory:moving_item") then
				obj:moveto({x = obj:getpos().x - a.x*2.0, y = obj:getpos().y, z = obj:getpos().z - a.z*2.0})
			end
		end
	end,
})