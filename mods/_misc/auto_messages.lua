local interacttimer = 0
minetest.register_globalstep(function(dtime)
	interacttimer = interacttimer + dtime
	if interacttimer < 60 then return end -- every 1 minute
	interacttimer = 0
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		if not minetest.check_player_privs(name, {interact=true}) then
			minetest.chat_send_player(name, name .. ", to interact (build) you need to accept the rules. Type /rules")
		end
	end
end)
