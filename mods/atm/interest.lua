-- adapted from the income.lua file from the currency mod.
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 1000 then
		timer = 0
		atm.readaccounts()
		for _,player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			if not (atm.balance[name] == nil) then
				atm.balance[name] = math.floor(atm.balance[name] + 20)
			end
		end
		atm.saveaccounts()
	end
end)
