--[[
-- Memo by ShadowNinja
-- License: WTFPL
-- Modified by CraigyDavi to use /msg instead, an inbox and other things.
--]]


local worldpath = minetest.get_worldpath()
local memo = {}
memo.filename = worldpath.."/memos.txt"
memo.memos = {}

function memo:save()
	local file, err = io.open(memo.filename, "w")
	if err then
		return err
	end
	file:write(minetest.serialize(memo.memos))
	file:close()
end

function memo:load()
	local file, err = io.open(memo.filename, "r")
	if err then
		memo.memos = memo.memos or {}
		return err
	end
	memo.memos = minetest.deserialize(file:read("*a"))
	if type(memo.memos) ~= "table" then memo.memos = {} end
	file:close()
end

memo:load()

minetest.register_on_joinplayer(function(player)
	minetest.after(15, memo.player_print, memo, player:get_player_name())
end)

function memo:player_print(name)
	if minetest.get_player_privs(name).ban then
		if not memo.memos["staff"] then
			return
		end
		if #memo.memos["staff"] > 1 then
			-- Staff has multiple messages
			minetest.chat_send_player(name, "Staff have "..#memo.memos["staff"].." messages!")
			minetest.chat_send_player(name, "Type `/inbox staff` to view the messages.")
		elseif #memo.memos["staff"] > 0 then
			-- They only have one message
			minetest.chat_send_player(name, "Staff have a message!")
			minetest.chat_send_player(name, "Type `/inbox staff` to view the message.")
		end
	end
	if not memo.memos[name] then
		return
	end
	if #memo.memos[name] > 1 then
		-- They have multiple messages
		minetest.chat_send_player(name, "You have "..#memo.memos[name].." messages!")
		minetest.chat_send_player(name, "Type /inbox to view the messages.")
	elseif #memo.memos[name] > 0 then
		-- They only have one message
		minetest.chat_send_player(name, "You have a message!")
		minetest.chat_send_player(name, "Type /inbox to view the message.")
	end
end

-- Based on code from chatplus - https://github.com/rubenwardy/chatplus
function memo.show_inbox(name)
	if not memo.memos[name] then
		minetest.chat_send_player(name,"Your have no messages in your inbox.")
		return
	end
	if #memo.memos[name] == 0 then
		minetest.chat_send_player(name,"Your have no messages in your inbox.")
		return
	end
	minetest.chat_send_player(name,"Showing your inbox...")
	local formspec = "size[10,8]textarea[0.25,0.25;10.15,7.5;memo_inbox;You have " .. #memo.memos[name] .. " messages:;"
	for i, t in pairs(memo.memos[name]) do
		formspec = formspec .. ("(%s) (%s) Message from %s: %s"):format(i, t.date, t.from, t.message)
		formspec = formspec .. "\n"
	end
	formspec = formspec .. "]"
	formspec = formspec .. "button_exit[8.1,6.75;2,1;memo_inbox_clear;Clear Inbox]"
	formspec = formspec .. "button_exit[8.1,7.5;2,1;close;Close]"
	formspec = formspec .. "label[0,6.7;To message a player, type: /msg PlayerName Hi!]"
	formspec = formspec .. "label[0,7.2;To message the staff, type: /msg staff Hi!]"
	minetest.show_formspec(name, "memo:inbox", formspec)
end

function memo.show_staff_inbox(name)
	if not memo.memos["staff"] then
		minetest.chat_send_player(name,"There are no staff messages in the inbox.")
		return
	end
	if #memo.memos["staff"] == 0 then
		minetest.chat_send_player(name,"There are no staff messages in the inbox.")
		return
	end
	minetest.chat_send_player(name,"Showing staff inbox...")
	local formspec = "size[10,8]textarea[0.25,0.25;10.15,7.5;memo_inbox_staff;There are " .. #memo.memos["staff"] .. " messages:;"
	for i, t in pairs(memo.memos["staff"]) do
		formspec = formspec .. ("(%s) (%s) Message from %s: %s"):format(i, t.date, t.from, t.message)
		formspec = formspec .. "\n"
	end
	formspec = formspec .. "]"
	formspec = formspec .. "button_exit[8.1,6.75;2,1;memo_inbox_staff_clear;Clear Inbox]"
	formspec = formspec .. "button_exit[8.1,7.5;2,1;close;Close]"
	formspec = formspec .. "label[0,6.7;To message a player, type: /msg PlayerName Hi!]"
	formspec = formspec .. "label[0,7.2;To message the staff, type: /msg staff Hi!]"
	minetest.show_formspec(name, "memo:inbox", formspec)
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	if fields.memo_inbox_clear then
		local name = player:get_player_name()
		if not memo.memos[name] then
			minetest.chat_send_player(name, "You have no messages.")
			return
		end
		local deletedmessages = #memo.memos[name]
		memo.memos[name] = {}
		memo:save()
		minetest.chat_send_player(name, deletedmessages.." messages have been deleted.")
	end
	if fields.memo_inbox_staff_clear then
		local name = player:get_player_name()
		if not memo.memos["staff"] then
			minetest.chat_send_player(name, "There are no messages.")
			return
		end
		local deletedmessages = #memo.memos["staff"]
		memo.memos["staff"] = {}
		memo:save()
		minetest.chat_send_player(name, deletedmessages.." messages have been deleted.")
	end
end)

minetest.register_chatcommand("msg", {
	params = "<name> <message>",
	description = "Send a message to someone",
	privs = {shout=true},
	func = function(name, param)
		local sendto, message = param:match("^(%S+)%s(.+)$")
		if not sendto or not message then
			return false, "Invalid usage, see /help msg."
		end
		if sendto == "staff" or sendto == "STAFF" or sendto == "Staff" then
			-- Send to staff mailbox
			memo.memos["staff"] = memo.memos["staff"] or {}
			table.insert(memo.memos["staff"], {from=name, message=message, date=os.date("%Y-%m-%d")})
			memo:save()
			minetest.log("action", "Message from " .. name .. " to " .. "staff" .. " (offline): " .. message)
			minetest.chat_send_player(name, "Message sent!")
		elseif minetest.get_player_by_name(sendto) then
			-- Player is online
			minetest.chat_send_player(sendto, "Message from " .. name .. ": ".. message)
			minetest.log("action", "Message from " .. name .. " to " .. sendto .. " (online): " .. message)
			minetest.chat_send_player(name, "Message sent!")
		else
			-- Player is offline
			if not minetest.auth_table[sendto] then
				minetest.chat_send_player(name, "Player does not exist.")
				return
			end
			memo.memos[sendto] = memo.memos[sendto] or {}
			table.insert(memo.memos[sendto], {from=name, message=message, date=os.date("%Y-%m-%d")})
			memo:save()
			minetest.log("action", "Message from " .. name .. " to " .. sendto .. " (offline): " .. message)
			minetest.chat_send_player(name, "Message sent!")
		end
	end,
})

minetest.register_chatcommand("inbox", {
	params = "",
	description = "Show the messages in your inbox",
	privs = {shout=true},
	func = function(name, param)
		if param == "staff" then
			if minetest.get_player_privs(name).ban then
				memo.show_staff_inbox(name)
			else
				minetest.chat_send_player(name, "You don't have permission to access the staff inbox.")
			end
		else
			memo.show_inbox(name)
		end
	end,
})

local count = 0
minetest.register_globalstep(function(dtime)
    count = count + dtime
    if count > 5 then
        count = 0
        for _,player in pairs(minetest.get_connected_players()) do
            local name = player:get_player_name()
			if memo.mail then
				player:hud_remove(memo.mail)
			end
			if memo.mail_text then
				player:hud_remove(memo.mail_text)
			end
            if memo.memos[name] and #memo.memos[name] ~= 0 then
                memo.mail = player:hud_add({
                    hud_elem_type = "image",
                    name = "MailIcon",
                    position = {x=0.52, y=0.52},
                    text="_memo_mail.png",
                    scale = {x=1,y=1},
                    alignment = {x=0.5, y=0.5},
                })
                memo.mail_text = player:hud_add({
                    hud_elem_type = "text",
                    name = "MailText",
                    position = {x=0.55, y=0.52},
                    text=#memo.memos[name],
                    scale = {x=1,y=1},
                    alignment = {x=0.5, y=0.5},
                })
            end
        end
    end
end)
