minetest.register_abm({
	label = "Flower spread 2",
	nodenames = {"group:flora"},
	interval = 13,
	chance = 50,
	action = function(pos, node)
		pos.y = pos.y - 1
		local under = minetest.get_node(pos)
		pos.y = pos.y + 1
		-- Replace flora with dry shrub in desert sand and silver sand,
		-- as this is the only way to generate them.
		-- However, preserve grasses in sand dune biomes.
		if minetest.get_item_group(under.name, "sand") == 1 and
				under.name ~= "default:sand" then
			minetest.set_node(pos, {name = "default:dry_shrub"})
			return
		end

		if minetest.get_item_group(under.name, "soil") == 0 then
			return
		end

		local light = minetest.get_node_light(pos)
		if not light or light < 13 then
			return
		end

		local pos0 = vector.subtract(pos, 4)
		local pos1 = vector.add(pos, 4)
		if #minetest.find_nodes_in_area(pos0, pos1, "group:flora") > 12 then
			return
		end

		local soils = minetest.find_nodes_in_area_under_air(
			pos0, pos1, "group:soil")
		if #soils > 0 then
			local seedling = soils[math.random(#soils)]
			local seedling_above =
				{x = seedling.x, y = seedling.y + 1, z = seedling.z}
			light = minetest.get_node_light(seedling_above)
			if not light or light < 13 or
					-- Desert sand is in the soil group
					minetest.get_node(seedling).name == "default:desert_sand" then
				return
			end

			minetest.set_node(seedling_above, {name = node.name})
		end
	end,
})

