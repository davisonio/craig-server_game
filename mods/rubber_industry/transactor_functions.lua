--------------------------
-- Transactor Functions --
--------------------------

-- transactor across ABM
minetest.register_abm({
	nodenames = {"transactor:transactor_across"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node)
		local frompos = {x = pos.x, y = pos.y, z = pos.z}
		local topos = {x = pos.x, y = pos.y, z = pos.z}
		local facedir = node.param2
		if facedir == 0 then
			frompos.x = frompos.x - 1
			topos.x = topos.x + 1
		elseif facedir == 1 then
			frompos.z = frompos.z + 1
			topos.z = topos.z - 1
		elseif facedir == 2 then
			frompos.x = frompos.x + 1
			topos.x = topos.x - 1
		elseif facedir == 3 then
			frompos.z = frompos.z - 1
			topos.z = topos.z + 1
		end

		local fromnode = minetest.get_node(frompos).name
		local tonode = minetest.get_node(topos).name

		if transactor_transactions[fromnode] and transactor_transactions[tonode] then
			local wl = transactor_transactions[tonode].wishlist
			if wl == nil and transactor_transactions[tonode].get_wishlist ~= nil then
				wl = transactor_transactions[tonode].get_wishlist(topos)
			end
			transactor_transactions[tonode].add(
				topos,
				transactor_transactions[fromnode].get(frompos, wl),
				function (thing)
					transactor_transactions[fromnode].add(frompos, thing)
				end
			)
		end
	end
})