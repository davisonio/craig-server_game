minetest.register_node("factory:storage_tank", {
	description = "Storage Tank (right-click with a filled bucket)",
	drawtype = "glasslike_framed",
	tiles = {"factory_steel_noise.png","factory_glass.png^factory_measure.png","factory_glass.png^factory_port.png", "factory_steel_noise.png"},
	inventory_image = "factory_storage_tank.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {oddly_breakable_by_hand = 2},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local stack = ItemStack(itemstack)
		if stack:get_name() == "bucket:bucket_water" then
			minetest.swap_node(pos, {name = "factory:storage_tank_water", param2 = 3 + 64 + 128})
			local meta = minetest.get_meta(pos)
			meta:set_int("stored", 3)
			return ItemStack("bucket:bucket_empty")
		end
		if stack:get_name() == "bucket:bucket_lava" then
			minetest.swap_node(pos, {name = "factory:storage_tank_lava", param2 = 7 + 64 + 128})
			local meta = minetest.get_meta(pos)
			meta:set_int("stored", 7)
			return ItemStack("bucket:bucket_empty")
		end
	end,
})

function factory.register_storage_tank(name, increment, tiles, plaintile, light, bucket_full, bucket_empty)
	minetest.register_node("factory:storage_tank_" .. name, {	
		drawtype = "glasslike_framed",
		tiles = {"factory_steel_noise.png","factory_glass.png^factory_measure.png","factory_glass.png^factory_port.png", "factory_steel_noise.png"},
		special_tiles = tiles,
		paramtype = "light",
		sunlight_propagates = true,
		light_source = light,
		groups = {oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},
		drop = nil,
		on_dig = function(pos, node, digger)
			local inv = digger:get_inventory()
			local meta = minetest.get_meta(pos)
			local stored = meta:get_int("stored")
			local stack = ItemStack({name="factory:storage_tank_" .. name .. "_inventory", count=1, metadata=stored})
			if inv:room_for_item("main", stack) then
				inv:add_item("main", stack)
			else
				minetest.add_item(pos, stack)
			end
			minetest.set_node(pos, {name = "air"})
		end,
		on_rightclick = function(pos, node, player, itemstack, pointed_thing)
			local stack = ItemStack(itemstack)
			if stack:get_name() == bucket_full then
				local meta = minetest.get_meta(pos)
				local stored = meta:get_int("stored")
				if stored < 63 then
					stored = stored + increment
					meta:set_int("stored", stored)
					meta:set_string("infotext", "Storage Tank (" .. name .. "): "..math.floor((100/63)*stored).."% full")
					minetest.swap_node(pos, {name = "factory:storage_tank_" .. name, param2 = stored + 64 + 128})
					return ItemStack(bucket_empty)
				end
			end
			if stack:get_name() == bucket_empty then
				local meta = minetest.get_meta(pos)
				local stored = meta:get_int("stored")
				if stored > increment then
					stored = stored - increment
					meta:set_int("stored", stored)
					meta:set_string("infotext", "Storage Tank (" .. name .. "): "..math.floor((100/63)*stored).."% full")
					minetest.swap_node(pos, {name = "factory:storage_tank_" .. name, param2 = stored + 64 + 128})
					return ItemStack(bucket_full)
				elseif stored <= increment then
					meta:set_string("infotext", nil)
					minetest.swap_node(pos, {name = "factory:storage_tank"})
					return ItemStack(bucket_full)
				end
			end
		end,
	})

	minetest.register_abm({
		nodenames = {"factory:storage_tank_" .. name},
		neighbors = nil,
		interval = 1,
		chance = 1,
		action = function(pos, node, active_object_count, active_object_count_wider)
			local meta = minetest.get_meta(pos)
			local stored = meta:get_int("stored")
			minetest.swap_node(pos, {name = "factory:storage_tank_" .. name, param2 = stored + 64 + 128})
		end,
	})

	minetest.register_craftitem("factory:storage_tank_" .. name .. "_inventory", {
		description = "Storage Tank (" .. name .. ")",
		inventory_image = plaintile .. "^factory_storage_tank.png",
		wield_image = "factory_storage_tank.png",
		groups = {not_in_creative_inventory = 1},
		stack_max = 1,
		on_place = function(itemstack, placer, pointed_thing)
			local pt = pointed_thing
			if not pt then
				return
			end
			if pt.type ~= "node" then
				return
			end
			local under = minetest.get_node(pt.under)
			local above = minetest.get_node(pt.above)
			if not minetest.registered_nodes[under.name] then
				return
			end
			if not minetest.registered_nodes[above.name] then
				return
			end
			if pt.above.y ~= pt.under.y+1 then
				return
			end
			if not minetest.registered_nodes[above.name].buildable_to then
				return
			end

			minetest.place_node(pt.above, {name="factory:storage_tank_" .. name, param2 = tonumber(itemstack:get_metadata()) + 64 + 128})
			local meta = minetest.get_meta(pt.above)
			meta:set_int("stored", tonumber(itemstack:get_metadata()))
			meta:set_string("infotext", "Storage Tank (" .. name .. "): "..math.floor((100/63)*tonumber(itemstack:get_metadata())).."% full")
			return ""
		end
	})
end

-- don't forget to add your liquid to the initial node around line 10
-- I may improve this later

factory.register_storage_tank("water", 4, {{name="default_water_source_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}}, "default_water.png", 0, "bucket:bucket_water", "bucket:bucket_empty")
factory.register_storage_tank("lava", 8, {{name="default_lava_source_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}}, "default_lava.png", 13, "bucket:bucket_lava", "bucket:bucket_empty")