--
-- Chat plus
--

chatplus = {
	log_file = minetest.get_worldpath().."/chatlog.txt",
}

function chatplus.init()
	chatplus.load()
	chatplus.clean_players()
	
	if not chatplus.players then
		chatplus.players = {}
	end
	chatplus.count = 0
	chatplus.loggedin = {}
	chatplus._handlers = {}
end

function chatplus.load()
	-- Initialize the log
	chatplus.log_handle = io.open(chatplus.log_file,"a+")

	-- Load player data
	local file = io.open(minetest.get_worldpath().."/chatplus.db", "r")
	if file then
		local table = minetest.deserialize(file:read("*all"))
		file:close()
		if type(table) == "table" then
			chatplus.players = table
			return
		end
	end	
end

function chatplus.save()
	local file = io.open(minetest.get_worldpath().."/chatplus.db", "w")
	if file then
		file:write(minetest.serialize(chatplus.players))
		file:close()
	end
end

function chatplus.clean_players()
	if not chatplus.players then
		chatplus.players = {}
		return
	end

	for key,value in pairs(chatplus.players) do
		if value.messages then
			value.inbox = value.messages
			value.messages = nil			
		end
		
		if (not value.inbox or #value.inbox==0) then
			minetest.log("Deleting blank player "..key)
			value[key] = nil
		end
	end

	chatplus.save()
end

function chatplus.poke(name,player)
	local function check(name,value)
		if not chatplus.players[name][value] then
			chatplus.players[name][value] = {}
		end
	end
	if not chatplus.players[name] then
		chatplus.players[name] = {}
	end
	check(name,"inbox")
	
	chatplus.players[name].enabled = true
	
	if player then
		if player=="end" then
			chatplus.players[name].enabled = false
			chatplus.loggedin[name] = nil
		else
			if not chatplus.loggedin[name] then
				chatplus.loggedin[name] = {}				
			end
			chatplus.loggedin[name].player = player
		end
	end
	
	chatplus.save()
	
	return chatplus.players[name]
end

function chatplus.register_handler(func,place)
	if not place then
		table.insert(chatplus._handlers,func)
	else
		table.insert(chatplus._handlers,place,func)
	end
end

function chatplus.send(from,msg)
	-- Log chat message
	if chatplus.log_handle ~= nil then
		chatplus.log_handle:write(
			"\r\n"..
			os.date("%d/%m/%Y %H:%M")..
			" ["..from.."]: "..
			msg
		)
		chatplus.log_handle:flush()
	end
	
	-- Loop through senders
	for key,value in pairs(chatplus.loggedin) do
		local res = nil
		for i=1,#chatplus._handlers do
			if chatplus._handlers[i] then
				res = chatplus._handlers[i](from,key,msg)
				
				if res ~= nil then
					break
				end
			end
		end
		if (res == nil or res == true) and key~=from then
			minetest.chat_send_player(key,"<"..from.."> "..msg,false)
		end
	end

	return true
end

-- Minetest callbacks
minetest.register_on_chat_message(chatplus.send)
minetest.register_on_joinplayer(function(player)
	local _player = chatplus.poke(player:get_player_name(),player)

	if _player.inbox and #_player.inbox>0 then
		minetest.after(10,minetest.chat_send_player,player:get_player_name(),"("..#_player.inbox..") You have mail! Type /inbox to view them")	
	end
end)
minetest.register_on_leaveplayer(function(player)
	chatplus.poke(player:get_player_name(),"end")
end)

-- Init
chatplus.init()

-- Inbox
function chatplus.showInbox(name)
	if not chatplus.players[name] then
		return false
	end

	local player = chatplus.players[name]

	if not player.inbox or #player.inbox==0 then
		minetest.chat_send_player(name,"Your inbox is empty!")
		return false
	end
	minetest.chat_send_player(name,"Showing your inbox...")
	local fs = "size[10,8]textarea[0.25,0.25;10.15,8;inbox;You have " .. #player.inbox .. " messages in your inbox:;"
	
	for i=1,#player.inbox do
		fs = fs .. minetest.formspec_escape(player.inbox[i])
		fs = fs .. "\n"
	end

	fs = fs .. "]"
	fs = fs .. "button_exit[8.1,7.25;2,1;close;Close]"
	fs = fs .. "button[0,7.25;3,1;clear;Clear Inbox]"
	minetest.show_formspec(name, "chatplus:inbox", fs)
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	if fields.clear then
		local name = player:get_player_name()
		chatplus.poke(name).inbox = {}
		chatplus.save()
		minetest.chat_send_player(name,"Inbox cleared!")
		chatplus.showInbox(name)
	end
end)

minetest.register_chatcommand("inbox", {
	params = "",
	description = "Show the items in your inbox",
	func = function(name, param)
		chatplus.showInbox(name)
	end,
})

minetest.register_chatcommand("mail", {
	params = "name msg",
	description = "Add a message to a player's inbox",
	func = function(name, param)
		chatplus.poke(name)
		local to, msg = string.match(param, "([%a%d_]+) (.+)")
		
		if not to or not msg then
			minetest.chat_send_player(name,"/mail <playername> <msg>",false)
			return
		end

		if chatplus.log_handle ~= nil then
			chatplus.log_handle:write("\r\n"..os.date("%d/%m/%Y %H:%M").." [Mail] To: "..to..", From: "..name..", Message: "..msg)
			chatplus.log_handle:flush()
		end

		if chatplus.players[to] then
			table.insert(chatplus.players[to].inbox,os.date("%d/%m/%Y").." ["..name.."]: "..msg)
			minetest.chat_send_player(name,"Message sent.")
			chatplus.save()
		else
			minetest.chat_send_player(name,"Player "..to.." does not exist")
		end
	end,
})

minetest.register_globalstep(function(dtime)
	chatplus.count = chatplus.count + dtime
	if chatplus.count > 5 then
		chatplus.count = 0
		-- loop through player list
		for key,value in pairs(chatplus.players) do
			if (
				chatplus.loggedin and
				chatplus.loggedin[key] and
				chatplus.loggedin[key].player and
				value and
				value.inbox and
				chatplus.loggedin[key].player.hud_add and
				chatplus.loggedin[key].lastcount ~= #value.inbox
			) then				
				if chatplus.loggedin[key].msgicon then
					chatplus.loggedin[key].player:hud_remove(chatplus.loggedin[key].msgicon)
				end

				if chatplus.loggedin[key].msgicon2 then
					chatplus.loggedin[key].player:hud_remove(chatplus.loggedin[key].msgicon2)
				end

				if #value.inbox>0 then
					chatplus.loggedin[key].msgicon = chatplus.loggedin[key].player:hud_add({
						hud_elem_type = "image",
						name = "MailIcon",
						position = {x=0.52, y=0.52},
						text="chatplus_mail.png",
						scale = {x=1,y=1},
						alignment = {x=0.5, y=0.5},
					})
					chatplus.loggedin[key].msgicon2 = chatplus.loggedin[key].player:hud_add({
						hud_elem_type = "text",
						name = "MailText",
						position = {x=0.55, y=0.52},
						text=#value.inbox,
						scale = {x=1,y=1},
						alignment = {x=0.5, y=0.5},
					})					
				end
				chatplus.loggedin[key].lastcount = #value.inbox
			end
		end
	end
end)
