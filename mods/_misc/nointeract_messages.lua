local TIMER = 0
minetest.register_globalstep(function(dtime)
	TIMER = TIMER + dtime
	if TIMER < 30 then return end
	TIMER = 0
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		if not minetest.check_player_privs(name, {interact=true}) then
			minetest.chat_send_player(name, "Hi " .. name .. "! To build on this server you need to accept the rules. Type /rules")
		end
	end
end)
