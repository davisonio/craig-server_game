factory.stp_formspec =
	"size[8,8.5]"..
	factory_gui_bg..
	factory_gui_bg_img_2..
	factory_gui_slots..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	"image[3.75,1.5;1,1;gui_ind_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;4.75,0.5;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	factory.get_hotbar_bg(0,4.25)

minetest.register_node("factory:sapling_fertilizer", {
	tiles = {
		"default_dirt.png"
	},
	inventory_image = "factory_sapling_fertilizer.png",
	description = "Sapling Fertilizer",
	drawtype = "nodebox",
	paramtype = "light",
	is_ground_content = true,
	groups = {seed = 1, snappy = 3, attached_node = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875},
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125},
			{0, -0.375, -0.0625, 0.0625, -0.3125, 0.0625},
			{0, -0.3125, -0.0625, 0.0625, -0.25, 0},
			{-0.0625, -0.375, -0.0625, 0, -0.3125, 0},
		}
	}
})

minetest.register_abm({
	nodenames = {"factory:sapling_fertilizer"},
	neighbors = nil,
	interval = 3,
	chance = 6,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.add_particlespawner({
			amount = 3,
			time = 1,
			minpos = {x = pos.x - 0.05, y = pos.y, z = pos.z - 0.05},
			maxpos = {x = pos.x + 0.05, y = pos.y, z = pos.z + 0.05},
			minvel = {x=-0.25, y=0.02, z=-0.25},
			maxvel = {x=0.25, y=0.10, z=0.25},
			minacc = {x=0, y=0, z=0},
			maxacc = {x=0, y=0, z=0},
			minexptime = 0.8,
			maxexptime = 2,
			minsize = 0.05,
			maxsize = 0.23,
			collisiondetection = true,
			vertical = false,
			texture = "factory_flies.png",
			playername = nil,
		})
	end,
})

minetest.register_node("factory:stp", {
	description = "Sapling Treatment Plant",
	tiles = {"factory_machine_brick_1.png", "factory_machine_brick_2.png", "factory_machine_side_1.png",
		"factory_machine_side_1.png", "factory_machine_side_1.png", "factory_stp_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", factory.ind_furnace_inactive_formspec)
		meta:set_string("infotext", "Sapling Treatment Plant")
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "fuel" then
			if stack:get_name() == "factory:sapling_fertilizer" then
				return stack:get_count()
			end
		elseif listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		if to_list == "fuel" then
			return count
		elseif to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
})

minetest.register_abm({
	nodenames = {"factory:stp"},
	interval = 2.5,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		local srclist = inv:get_list("src")
				
		if inv:contains_item("fuel", ItemStack("factory:sapling_fertilizer 1")) then
			for i,v in ipairs(factory.stpIO) do
				local rand = math.random(v.min, v.max)
				if inv:contains_item("src", ItemStack({name = v.input})) and inv:room_for_item("dst", {name = v.output, count = rand}) then
					minetest.add_particlespawner({
						amount = 4,
						time = 1,
						minpos = {x = pos.x - 0.2, y = pos.y, z = pos.z - 0.2},
						maxpos = {x = pos.x + 0.2, y = pos.y, z = pos.z + 0.2},
						minvel = {x=-0.4, y=0.4, z=-0.4},
						maxvel = {x=0.4, y=0.7, z=0.4},
						minacc = {x=0, y=0, z=0},
						maxacc = {x=0, y=0, z=0},
						minexptime = 0.8,
						maxexptime = 2,
						minsize = 2,
						maxsize = 4,
						collisiondetection = false,
						vertical = false,
						texture = "factory_smoke.png",
						playername = nil,
					})

					inv:add_item("dst", ItemStack({name = v.output, count = rand}))

					inv:remove_item("src", ItemStack({name = inv:get_stack("src", 1):get_name(), count = 1}))
					inv:remove_item("fuel", ItemStack({name = inv:get_stack("fuel", 1):get_name(), count = 1}))
				end
			end
		end
	end,
})