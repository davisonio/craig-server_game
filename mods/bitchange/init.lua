bitchange = {}
bitchange.mod_path = minetest.get_modpath("bitchange")
local world_path = minetest.get_worldpath()

dofile(bitchange.mod_path.."/config.default.txt")
-- Copied from moretrees mod
if not io.open(world_path.."/bitchange_config.txt", "r") then
	io.input(bitchange.mod_path.."/config.default.txt")
	io.output(world_path.."/bitchange_config.txt")
	
	while true do
		local block = io.read(256) -- 256B at once
		if not block then
			io.close()
			break
		end
		io.write(block)
	end
else
	dofile(world_path.."/bitchange_config.txt")
end

dofile(bitchange.mod_path.."/minecoins.lua")
dofile(bitchange.mod_path.."/moreores.lua")
if bitchange.enable_exchangeshop then
	dofile(bitchange.mod_path.."/shop.lua")
end
if bitchange.enable_moneychanger then
	dofile(bitchange.mod_path.."/moneychanger.lua")
end
if bitchange.enable_warehouse then
	dofile(bitchange.mod_path.."/warehouse.lua")
end
if bitchange.enable_toolrepair then
	dofile(bitchange.mod_path.."/toolrepair.lua")
end
if bitchange.enable_donationbox then
	dofile(bitchange.mod_path.."/donationbox.lua")
end

if not minetest.setting_getbool("creative_mode") and bitchange.initial_give > 0 then
	-- Giving initial money
	minetest.register_on_newplayer(function(player)
		player:get_inventory():add_item("main", "bitchange:mineninth "..bitchange.initial_give)
	end)
end

-- Privs
function bitchange.has_access(owner, player_name)
	if player_name == owner or owner == "" then
		return true
	end
	local privs = minetest.get_player_privs(player_name)
	return privs.server or privs.protection_bypass
end

minetest.log("action", "[BitChange] Loaded.")
