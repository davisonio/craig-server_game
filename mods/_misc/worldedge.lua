local worldtimer = 0
minetest.register_globalstep(function(dtime)
   worldtimer = worldtimer + dtime
   
   -- Every 2 seconds
   if worldtimer < 2 then return end
   worldtimer = 0
   
   for _,player in ipairs(minetest.get_connected_players()) do

   	-- Where am I?
   	local pos = player:getpos()

   	if pos.x < -30500 or pos.x > 30500 or pos.y < -30500 or pos.y > 30500 or pos.z < -30500 or pos.z > 30500 then
      		local statspawn = (minetest.setting_get_pos("static_spawnpoint") or {x = 0, y = 5, z = 0})
      		player:setpos(statspawn)
      		minetest.chat_send_player(player:get_player_name(), "You Passed the map limits, returning to Spawn")
   	end

   end
end)