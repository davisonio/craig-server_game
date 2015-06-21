minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		if player:get_hp() > 0 or not minetest.setting_getbool("enable_damage") then
			local pos = player:getpos()
			local inv = player:get_inventory()
			
			for _,object in ipairs(minetest.get_objects_inside_radius(pos, 0.75)) do
				if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
					if inv and inv:room_for_item("main", ItemStack(object:get_luaentity().itemstring)) then
						inv:add_item("main", ItemStack(object:get_luaentity().itemstring))
						object:get_luaentity().itemstring = ""
						object:remove()
					end
				end
			end
			
			for _,object in ipairs(minetest.get_objects_inside_radius(pos, 0.75)) do
				if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
					if object:get_luaentity().collect then
						if inv and inv:room_for_item("main", ItemStack(object:get_luaentity().itemstring)) then
							local pos1 = pos
							pos1.y = pos1.y+0.2
							local pos2 = object:getpos()
							local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
							vec.x = vec.x*3
							vec.y = vec.y*3
							vec.z = vec.z*3
							object:setvelocity(vec)
							object:get_luaentity().physical_state = false
							object:get_luaentity().object:set_properties({
								physical = false
							})
							
							minetest.after(1, function(args)
								local lua = object:get_luaentity()
								if object == nil or lua == nil or lua.itemstring == nil then
									return
								end
								if inv:room_for_item("main", ItemStack(object:get_luaentity().itemstring)) then
									inv:add_item("main", ItemStack(object:get_luaentity().itemstring))
									object:get_luaentity().itemstring = ""
									object:remove()
								else
									object:setvelocity({x = 0,y = 0,z = 0})
									object:get_luaentity().physical_state = true
									object:get_luaentity().object:set_properties({
										physical = true
									})
								end
							end, {player, object})
							
						end
					end
				end
			end
		end
	end
end)
