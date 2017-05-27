-- Admin pick
minetest.register_tool("_misc:pick_admin", {
	description = "Admin Pickaxe [Digs blocks instantly - returns in inv]",
	inventory_image = "misc_admin_pick.png",
	tool_capabilities = {
		full_punch_interval = 0,
		max_drop_level=3,
		groupcaps={
			unbreakable={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			fleshy = {times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			choppy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			bendy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			cracky={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			crumbly={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			snappy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
		}
	},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

-- Remove stick
minetest.register_craftitem("_misc:remove_stick", {
	description = "Remove Stick [Removes items not removable normally - does not return in inv]",
	inventory_image = "misc_remove_stick.png",
	on_use = function(item, user, pointed_thing)
		if pointed_thing.type == "node" then
			minetest.remove_node(pointed_thing.under)
		elseif pointed_thing.type == "object" then
			obj = pointed_thing.ref
			if obj ~= nil then
				if obj:get_player_name() ~= nil then
					-- Player
					obj:set_hp(-1)
				else
					-- Mob or other entity
					obj:remove()
				end
			end
		end
	end,
	on_drop = function(itemstack, dropper, pos)
		return
	end,
	stack_max = 1,
	liquids_pointable = true,
})
