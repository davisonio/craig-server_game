--
-- Edited chat commands from core
--

-- /me
-- /help
-- /privs
-- /grant
-- /revoke
-- /setpassword
-- /clearpassword
-- /auth_reload
-- /teleport
-- /set
-- /mods
-- /give
-- /giveme
-- /spawnentity
-- /pulverize
-- /rollback_check
-- /rollback
-- /status

minetest.register_chatcommand("time", {
	params = "<0...24000>",
	description = "set time of day",
	privs = {settime=true},
	func = function(name, param)
		if param == "" then
			return false, "Missing time."
		end
		local newtime = tonumber(param)
		if newtime == nil then
			return false, "Invalid time."
		end
		minetest.set_timeofday((newtime % 24000) / 24000)
		minetest.log("action", name .. " sets time " .. newtime)
		minetest.chat_send_all(name .. " changed the time of day.")
	end,
})

minetest.register_chatcommand("shutdown", {
	description = "shutdown server",
	privs = {server=true},
	func = function(name, param)
		minetest.log("action", name .. " shuts down server")
		minetest.request_shutdown()
		minetest.chat_send_all(name .. " just shut down the server.")
	end,
})

minetest.register_chatcommand("ban", {
	params = "<name>",
	description = "Ban IP of player",
	privs = {ban=true},
	func = function(name, param)
		if param == "" then
			return true, "Ban list: " .. minetest.get_ban_list()
		end
		if not minetest.get_player_by_name(param) then
			return false, "This player is not online at the moment. Use a /future_ban instead."
		end
		if not minetest.ban_player(param) then
			return false, "Failed to ban player."
		end
		local desc = minetest.get_ban_description(param)
		minetest.log("action", name .. " bans " .. desc .. ".")
		return true, "Banned " .. desc .. "."
	end,
})

-- /unban
-- /kick
-- /clearobjects
-- /msg

--
-- Other chat commands
--

-- Spawn command
minetest.register_chatcommand("spawn", {
    params = "",
    description = "Teleport to the spawn location.",
    privs = {shout=true},
    func = function(name, param)
            local player = minetest.env:get_player_by_name(name)
            minetest.chat_send_player(name, "Teleported to spawn!")
            player:setpos({x=0.0, y=5.0, z=0.0})
            return true
    end,
})

-- Sethome command
minetest.register_chatcommand("sethome", {
        params = "",
        description = "Set your home location.",
        privs = {shout=true},
        func = function(name, param)
                local player = minetest.env:get_player_by_name(name)
                test = player:getpos()
                local file = io.open(minetest.get_worldpath().."/home/"..player:get_player_name().."_home", "w")
                if not file then
                        minetest.chat_send_player(name, "There was an error, please contact the server owner.")
                        return
                end
                file:write(minetest.pos_to_string(test))
                file:close()
                minetest.chat_send_player(name, "Your home location is set! Type /home to teleport back here.")
        end
})

-- Home command
minetest.register_chatcommand("home", {
	params = "",
	description = "Teleport to your home location.",
	privs = {shout=true},
	func = function(name, param)
		local player = minetest.env:get_player_by_name(name)
		local file = io.open(minetest.get_worldpath().."/home/"..player:get_player_name().."_home", "r")
		if not file then
			minetest.chat_send_player(name, "You haven't set your home! Set one using /sethome.")
			return
		end
		local line = file:read("*line")
		file:close()
		local pos = minetest.string_to_pos(string.sub(line, 1, string.find(line, ")")))
		if not pos or type(pos) ~= "table" then
			minetest.chat_send_player(name, "There was an error, please contact the server owner.")
			return
		end
		minetest.env:get_player_by_name(name):setpos(pos)
		minetest.chat_send_player(name, "Home sweet home.")
	end
})

-- Wiki command
minetest.register_chatcommand("wiki",{
	params = "",
	description = "Shows the wiki main page",
	func = function(name, param)
		minetest.chat_send_player(name, "Showing wiki main page... if this doesn't work please try again.")
		if minetest.get_player_privs(name).wiki then
			wikilib.show_wiki_page(name, "#Main")
		else
			wikilib.show_wiki_page(name, "Main")
		end
	end,
})

-- Rules command
minetest.register_chatcommand("rules",{
	params = "accept",
	description = "Shows the server rules",
	privs = {shout=true},
	func = function(name, params)
		minetest.chat_send_player(name, "Showing server rules... if this doesn't work please try again.")
		if params == "" then
			wikilib.show_wiki_page(name, "Rules")
		elseif params == "accept" then
			if minetest.check_player_privs(name, {interact=true}) then
				minetest.chat_send_player(name, "You have already accepted the rules!")
			else
				minetest.chat_send_player(name, "Thanks for accepting the rules, you now are able to interact with things.")
				minetest.chat_send_player(name, "Happy building!")
				minetest.chat_send_player(name, "If you need any help feel free to ask :)")
				local privs = minetest.get_player_privs(name)
				privs.interact = true
				minetest.set_player_privs(name, privs)
			end
		end
	end,
})
