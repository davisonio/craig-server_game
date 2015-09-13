minetest.register_chatcommand("change-player-channel", {
	description = "Manages chat channels",
	privs = {basic_privs = true},
	func = function(name, param)
		local player_name, to_channel = string.match(param, "([^ ]+) (.+)")
		if not player_name then
			return false, "Player does not exist!"
		elseif not to_channel then
			return false, "Channel not specified!"
		end
		channels.command_set(player_name, to_channel)
		return true, player_name .. " moved to channel " .. to_channel .. "!"
	end,
})

minetest.register_chatcommand("channel", {
	description = "Manages chat channels",
	privs = {
		interact = true, 
		shout = true
	},
	func = function(name, param)
		if param == "" then
			minetest.chat_send_player(name, "Online players: /channel online")
			minetest.chat_send_player(name, "Join/switch:    /channel set <channel>")
			minetest.chat_send_player(name, "Leave channel:  /channel leave")
			return
		elseif param == "online" then
			channels.command_online(name)
			return
		elseif param == "leave" then
			channels.command_leave(name)
			return
		end
		local args = param:split(" ")
		if args[1] == "set" then
			if #args >= 2 then
				 channels.command_set(name, args[2])
				 return
			end
		end
		minetest.chat_send_player(name, "Error: Please check again '/channel' for correct usage.")
	end,
})

function channels.say_chat(name, message, channel)
	for k,v in pairs(channels.players) do
		if v == channel and k ~= name then
			minetest.chat_send_player(k, message)
		end
	end
end

function channels.command_online(name)
	local channel = channels.players[name]
	local players = "You"
	if channel then
		for k,v in pairs(channels.players) do
			if v == channel and k ~= name then
				players = players..", "..k
			end
		end
	else
		local oplayers = minetest.get_connected_players()
		for _,player in ipairs(oplayers) do
			local p_name = player:get_player_name()
			if not channels.players[p_name] and p_name ~= name then
				players = players..", "..p_name
			end
		end
		return
	end
	
	minetest.chat_send_player(name, "Online players in this channel: "..players)
end

function channels.command_set(name, param)
	if param == "" then
		minetest.chat_send_player(name, "Error: Empty channel name")
		return
	end
	
	local channel_old = channels.players[name]
	if channel_old then
		if channel_old == param then
			minetest.chat_send_player(name, "Error: You are already in this channel")
			return
		end
		channels.say_chat(name, "# "..name.." left the channel", channel_old)
	else
		local oplayers = minetest.get_connected_players()
		for _,player in ipairs(oplayers) do
			local p_name = player:get_player_name()
			if not channels.players[p_name] and p_name ~= name then
				minetest.chat_send_player(p_name, "# "..name.." left the global chat")
			end
		end
	end
	
	local player = minetest.get_player_by_name(name)
	if not player then
		return
	end
	
	if channels.huds[name] then
		player:hud_remove(channels.huds[name])
	end
	
	channels.players[name] = param
	channels.huds[name] = player:hud_add({
		hud_elem_type	= "text",
		name		= "Channel",
		number		= 0xFFFFFF,
		position = {x=0, y=1},
		offset = {x=5, y=-85},
		direction = 0,
		text		= "Channel: "..param,
		scale = {x=200, y=60},
		alignment = {x=1, y=1},
	})
	channels.say_chat("", "# "..name.." joined the channel", param)
end

function channels.command_leave(name)
	local player = minetest.get_player_by_name(name)
	if not player then
		channels.players[name] = nil
		channels.huds[name] = nil
		return
	end
	
	if not (channels.players[name] and channels.huds[name]) then
		minetest.chat_send_player(name, "Please join a channel first to leave it")
		return
	end
	
	if channels.players[name] then
		channels.say_chat("", "# "..name.." left the channel", channels.players[name])
		channels.players[name] = nil
	end
	
	if channels.huds[name] then
		player:hud_remove(channels.huds[name])
		channels.huds[name] = nil
	end
end
