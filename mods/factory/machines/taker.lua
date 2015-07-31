function factory.register_taker(prefix, suffix, speed, name, ctiles)
	-- Backwards compatiblity for any version below 0.5
	minetest.register_alias("factory:"..prefix.."taker"..suffix, "factory:"..prefix.."taker"..suffix.."_on")

	local nodeon = {
		drawtype = "nodebox",
		tiles = ctiles,
		paramtype = "light",
		description = name,
		groups = {cracky=3, mesecon_effector_off = 1},
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
		mesecons = {effector = {
			action_on = function(pos, node)
				minetest.swap_node(pos, {name="factory:"..prefix.."taker"..suffix.."_off", param2 = node.param2})
			end
		}}
	}

	local nodeoff = {
		drawtype = "nodebox",
		tiles = ctiles,
		paramtype = "light",
		description = name,
		groups = {cracky=3, not_in_creative_inventory=1, mesecon_effector_on = 1},
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		drop="factory:"..prefix.."taker"..suffix.."_on",
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
		mesecons = {effector = {
			action_off = function(pos, node)
				minetest.swap_node(pos, {name="factory:"..prefix.."taker"..suffix.."_on", param2 = node.param2})
			end
		}}
	}
	minetest.register_node("factory:"..prefix.."taker"..suffix.."_on", nodeon)
	minetest.register_node("factory:"..prefix.."taker"..suffix.."_off", nodeoff)

	minetest.register_abm({
		nodenames = {"factory:"..prefix.."taker"..suffix.."_on"},
		neighbors = nil,
		interval = speed,
		chance = 1,
		action = function(pos, node, active_object_count, active_object_count_wider)
			local facedir = minetest.get_node(pos).param2
			local a = minetest.facedir_to_dir(minetest.get_node(pos).param2)
			local b = {x = pos.x + a.x, y = pos.y + a.y, z = pos.z + a.z,}
			local target = minetest.get_node(b)
			if target.name == "default:chest" or target.name == "default:chest_locked" then
				local meta = minetest.env:get_meta(b)
				local inv = meta:get_inventory()
				if not inv:is_empty("main") then
					local list = inv:get_list("main")
					local i,item
					for i,item in ipairs(inv:get_list("main")) do
						if item:get_name() ~= "" then
							local droppos = {x = pos.x - (a.x/1.25), y = pos.y + 0.65, z = pos.z - (a.z/1.25)}
							if factory.logTaker then print(name.." at "..pos.x..", "..pos.y..", "..pos.z.." takes "..item:get_name().." from "..target.name) end
							minetest.item_drop(item:peek_item(1), "", droppos)
							item:take_item()
							inv:set_stack("main", i, item)
							return
						end
					end
				end
			end
			local targetp
			if facedir == 1 then
				targetp = {x = pos.x + 1, y = pos.y, z = pos.z}
			elseif facedir == 2 then
				targetp = {x = pos.x, y = pos.y, z = pos.z - 1}
			elseif facedir == 3 then
				targetp = {x = pos.x - 1, y = pos.y, z = pos.z}
			elseif facedir == 0 then
				targetp = {x = pos.x, y = pos.y, z = pos.z + 1}
			end
			taker_from_swapper(pos, targetp, facedir, a)
			for i,v in ipairs(takerDevicesFurnacelike) do
				if target.name == v then
					local meta = minetest.env:get_meta(b)
					local inv = meta:get_inventory()
					if not inv:is_empty("dst") then
						local list = inv:get_list("dst")
						for k,item in ipairs(inv:get_list("dst")) do
							if item:get_name() ~= "" then
								local droppos = {x = pos.x - (a.x/1.25), y = pos.y + 0.65, z = pos.z - (a.z/1.25)}
								if factory.logTaker then print(name.." at "..pos.x..", "..pos.y..", "..pos.z.." takes "..item:get_name().." from "..target.name) end
								minetest.item_drop(item:peek_item(1), "", droppos)
								item:take_item()
								inv:set_stack("dst", k, item)
								return
							end
						end
					end
				end
			end
		end,
	})
end

function taker_from_swapper(pos, target, facedir, offset)
	local node = minetest.get_node(target)
	local takefrom = ""
	-- 0 = none
	-- 1 = left
	-- 2 = middle
	-- 3 = right
	if node == nil or node.name ~= "factory:swapper" then return end
	if facedir == 1 then
		if node.param2 == 0 then takefrom = "loverflow" end
		if node.param2 == 3 then takefrom = "overflow" end
		if node.param2 == 2 then takefrom = "roverflow" end
	end
	if facedir == 2 then
		if node.param2 == 1 then takefrom = "loverflow" end
		if node.param2 == 0 then takefrom = "overflow" end
		if node.param2 == 3 then takefrom = "roverflow" end
	end
	if facedir == 3 then
		if node.param2 == 2 then takefrom = "loverflow" end
		if node.param2 == 1 then takefrom = "overflow" end
		if node.param2 == 0 then takefrom = "roverflow" end
	end
	if facedir == 0 then
		if node.param2 == 3 then takefrom = "loverflow" end
		if node.param2 == 2 then takefrom = "overflow" end
		if node.param2 == 1 then takefrom = "roverflow" end
	end
	local meta = minetest.env:get_meta(target)
	local inv = meta:get_inventory()
	if takefrom ~= "" then
		if not inv:is_empty(takefrom) then
			local list = inv:get_list(takefrom)
			for k,item in ipairs(inv:get_list(takefrom)) do
				if not item:is_empty() and item:get_name() ~= "" then
					local droppos = {x = pos.x - (offset.x/1.25), y = pos.y + 0.65, z = pos.z - (offset.z/1.25)}
					if factory.logTaker then print("Taker at "..pos.x..", "..pos.y..", "..pos.z.." takes "..item:get_name().." from swapper") end
					minetest.item_drop(item:peek_item(1), "", droppos)
					item:take_item()
					inv:set_stack(takefrom, k, item)
					return
				end
			end
		end
	end
end

factory.register_taker("", "", 2.5, "Pneumatic Taker", {"factory_steel_noise_red.png"})
factory.register_taker("", "_gold", 1.8, "Pneumatic Taker Mk II", {"factory_steel_noise_gold.png"})
factory.register_taker("", "_diamond", 1.2, "Pneumatic Taker Mk III", {"factory_steel_noise_diamond.png"})
