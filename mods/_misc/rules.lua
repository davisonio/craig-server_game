# Based on https://github.com/ChaosWormz/mt_terms_of_use

local RULES = [[
Here are the rules:

1)	Don't attempt to crash, lag, damage, disable, exploit or disturb the server or game.
2)	Don't ruin creations not owned by yourself.
3)	Don't be harrassful. This includes (but is not limited to) asking for stuff constantly, being rude, beingh inconsiderate or spamming the chat.
4)	Feel free to walk around whereever, but if the area is clearly private stay out!
5)	Don't take items from other's chests unless otherwise stated.
6)	Don't take part in PVP (punching other players) unless all players taking part agree.
7)  Multiple accounts are dissalowed and you are responsible for looking after your account and login details.
8)	We want to make this world look as nice as possible, so please avoid building 1x1 towers or tunnels and placing random blocks everywhere. A few cool buildings would be nice too :)

Click the accept button and you will be able to build.
Thanks :)
]]

local function make_formspec()
	local size = { "size[10,8]" }
	table.insert(size, "textarea[0.5,0.5;9.5,8;TOS;Here are the rules. Click accept if you agree with them;"..RULES.."]")
	table.insert(size, "button_exit[6,7.4;1.5,0.5;accept;I Agree :)]")
	table.insert(size, "button[7.5,7.4;1.5,0.5;decline;I Disagree :(]")
	return table.concat(size)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "rules" then return end
	local name = player:get_player_name()
	if fields.accept then
		if minetest.check_player_privs(name, {shout=true}) then
			minetest.chat_send_player(name, "Thanks for accepting the rules, you now are able to interact with things.")
			minetest.chat_send_player(name, "Happy building!")
			minetest.chat_send_player(name, "For more information please type /news")
			local privs = minetest.get_player_privs(name)
			privs.interact = true
			minetest.set_player_privs(name, privs)
		end
		return
	elseif fields.decline then
		minetest.kick_player(name, "Bye then! You have to agree to the rules to play on the server (please rejoin if you have a change of mind).")
		return
	end
end)

minetest.register_chatcommand("rules",{
	params = "",
	description = "Shows the server rules",
	privs = {shout=true},
	func = function (name,params)
	local player = minetest.get_player_by_name(name)
		minetest.after(1, function()
			minetest.show_formspec(name, "rules", make_formspec())
		end)
	end
})
