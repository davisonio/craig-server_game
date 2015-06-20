local TIMER = 0
minetest.register_globalstep(function(dtime)
	TIMER = TIMER + dtime
	if TIMER < 60 then return end -- 1 minute
	TIMER = 0
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		if not minetest.check_player_privs(name, {interact=true}) then
			minetest.chat_send_player(name, name .. ", to build on this server you need to accept the rules. Type /rules")
		end
	end
end)

local TIMEFORACTION = 0
minetest.register_globalstep(function(dtime)
	TIMEFORACTION = TIMEFORACTION + dtime
	if TIMEFORACTION < 900 then return end -- 15 minutes 900
	TIMEFORACTION = 0
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		if not welcome.emails[name] then
			minetest.chat_send_player(name, name .. ", you have not set your email. Setting your email is important if you forget your password we can reset your password if you forget it. Type /profile. To stop these messages type /profile nomail.")
		end
	end
end)
