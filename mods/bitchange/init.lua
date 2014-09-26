-- BitChange mod by Krock

-- Load Files
dofile(minetest.get_modpath("bitchange").."/coins.lua")
dofile(minetest.get_modpath("bitchange").."/shop.lua")
dofile(minetest.get_modpath("bitchange").."/donationbox.lua")
dofile(minetest.get_modpath("bitchange").."/old.lua")

-- Access
function bitchange_has_access(owner, player_name)
	return (player_name == owner or owner == "" or minetest.get_player_privs(player_name).server or minetest.get_player_privs(player_name).access)
end

-- Income
players_income = {}

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 720 then -- One day
		timer = 0
		for _,player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			if players_income[name] == nil then
				players_income[name] = 0
			end
			players_income[name] = 5
		end
	end
end)

earn_income = function(player)
	if not player then return end
	local name = player:get_player_name()
	if players_income[name] == nil then
		players_income[name] = 0
	end
	if players_income[name] > 0 then
		count = players_income[name]
		local inv = player:get_inventory()
		inv:add_item("main", {name="bitchange:bitcoin", count=count})
		players_income[name] = 0
	end
end

minetest.register_on_dignode(function(pos, oldnode, digger)
	earn_income(digger)
end)

minetest.register_on_placenode(function(pos, node, placer)
	earn_income(placer)
end)

print("BitChange [bitchange] has loaded!")
