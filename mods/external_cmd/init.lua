-- External Command (external_cmd) mod by Menche
-- Allows server commands / chat from outside minetest
-- License: LGPL

minetest.register_globalstep(
	function(dtime)
		local f = (io.open(minetest.get_worldpath().."/message", "r"))
		if f ~= nil then
			local message = f:read("*line")
			f:close()
			os.remove(minetest.get_worldpath().."/message")

			if message ~= nil then
				minetest.chat_send_all(message)
				if minetest.get_modpath("irc") then
					-- Also show message in IRC if IRC mod is installed
					irc:say(message)
				end
			end
		end
	end
)
