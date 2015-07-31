minetest.register_node("factory:arm",{
	drawtype = "nodebox",
	tiles = {"factory_steel_noise.png"},
	paramtype = "light",
	description = "Pneumatic Mover",
	groups = {cracky=3},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.4375,0.5}, --base1
			{-0.125,-0.5,-0.375,0.125,0.0625,0.375}, --base2
			{-0.125,0.25,-0.5,0.125,0.3125,0.375}, --tube
			{-0.375,-0.5,-0.0625,0.375,0.0625,0.0625}, --base3
			{-0.125,-0.125,0.375,0.125,0.125,0.5}, --tube2
			{-0.125,0.0625,0.3125,0.125,0.25,0.375}, --NodeBox6
			{-0.125,0.0625,-0.5,-0.0625,0.25,0.3125}, --NodeBox7
			{0.0625,0.0625,-0.5,0.125,0.25,0.3125}, --NodeBox8
			{-0.0625,0.0625,-0.5,0.0625,0.125,0.3125}, --NodeBox9
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
		}
	},
})

minetest.register_abm({
	nodenames = {"factory:arm"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local all_objects = minetest.get_objects_inside_radius(pos, 0.8)
		local _,obj
		for _,obj in ipairs(all_objects) do
			if not obj:is_player() and obj:get_luaentity() and (obj:get_luaentity().name == "__builtin:item" or obj:get_luaentity().name == "factory:moving_item") then
				local a = minetest.facedir_to_dir(minetest.get_node(pos).param2)
				local b = {x = pos.x + a.x, y = pos.y + a.y, z = pos.z + a.z,}
				local target = minetest.get_node(b)
				local stack = ItemStack(obj:get_luaentity().itemstring)
				if target.name == "default:chest" or target.name == "default:chest_locked" then
					local meta = minetest.env:get_meta(b)
					local inv = meta:get_inventory()
					if inv:room_for_item("main", stack) then
						inv:add_item("main", stack)
						obj:remove()
					else
						obj:moveto({x = pos.x + (a.x * 2), y = pos.y + 0.5, z = pos.z + (a.z * 2)}, false)
					end
				end
				if target.name == "factory:swapper" then
					local meta = minetest.env:get_meta(b)
					local inv = meta:get_inventory()
					if inv:room_for_item("input", stack) then
						inv:add_item("input", stack)
						obj:remove()
					else
						obj:moveto({x = pos.x + a.x, y = pos.y + 1, z = pos.z + a.z}, false)
					end
				end
				for i,v in ipairs(armDevicesFurnacelike) do
					if target.name == v then
						local a = minetest.facedir_to_dir(minetest.get_node(pos).param2)
						local b = {x = pos.x + a.x, y = pos.y + a.y, z = pos.z + a.z,}
						local meta = minetest.env:get_meta(b)
						local inv = meta:get_inventory()

						if minetest.dir_to_facedir({x = -a.x, y = -a.y, z = -a.z}) == minetest.get_node(b).param2 then
							-- back, fuel
							if inv:room_for_item("fuel", stack) then
								inv:add_item("fuel", stack)
								obj:remove()
							else
								obj:moveto({x = pos.x + (a.x * 2), y = pos.y + 0.5, z = pos.z + (a.z * 2)}, false)
							end
						else
							-- everytin else, src
							if inv:room_for_item("src", stack) then
								inv:add_item("src", stack)
								obj:remove()
							else
								obj:moveto({x = pos.x + (a.x * 2), y = pos.y + 0.5, z = pos.z + (a.z * 2)}, false)
							end
						end
					end
				end
			end
		end
	end,
})