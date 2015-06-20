function welcome.rules_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "welcome:rules",
		welcome.size..
		welcome.close_button..
		welcome.image_button_welcome..
		welcome.image_button_profile..
		welcome.image_button_rules..
		welcome.image_button_guides..
		welcome.image_button_contact..
		welcome.image_button_inbox..
		welcome.image_button_staff..
		"tablecolumns[color;text]" ..
		"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
		"table[2,0;10,9;welcome_rules;" ..
		"#FFFF00," .. "Here are the server rules...do you accept them?," ..
		",1. Don't attempt to crash\\, lag\\, damage\\, disable or exploit the server or game.,"..
		",2. Don't damage creations owned by others (greifing).,"..
		",3. Don't harass other people. (e.g. asking them for stuff constantly),"..
		",4. Don't take items from other's chests unless otherwise stated.,"..
		",5. Don't partake in PVP (punching others) unless players taking part agree.,"..
		",6. Don't use multiple accounts or impersonate another account.,"..
		",7. No play dating or family role-play. Seriously\\, not cool.,"..
		",8. Feel free to walk around anywhere unless the area is clearly private.,"..
		",9. To make this world look as nice as possible\\, please avoid making a mess,"..
		",of the landscape. Nice buildings are always welcome :),"..
		";1]"..
		"button[8,7;2,1;welcome_rules_disagree;I Disagree :(]"..
		"button[10,7;2,1;welcome_rules_agree;I Agree :)]")
end

function welcome.rules_accept_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "welcome:rules_accept",
		"size[2,1]"..
		"button_exit[0,0;2,1;welcome:rules_accept_exit;Ok]")
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	local plname = player:get_player_name()
	if formname ~= "welcome:rules" then
		return
	end
	if fields.welcome_welcome then
		minetest.after(1, function()
			welcome.welcome_formspec(player)
		end)
	end
	if fields.welcome_profile then
		minetest.after(1, function()
			welcome.profile_formspec(player)
		end)
	end
	if fields.welcome_rules then
		minetest.after(1, function()
			welcome.rules_formspec(player)
		end)
	end
	if fields.welcome_guides then
		minetest.after(1, function()
			welcome.guides_formspec(player)
		end)
	end
	if fields.welcome_contact then
		minetest.after(1, function()
			welcome.contact_formspec(player)
		end)
	end
	if fields.welcome_inbox then
		minetest.after(1, function()
			chatplus.showInbox(plname)
		end)
	end
	if fields.welcome_staff then
		minetest.after(1, function()
			welcome.staff_formspec(player)
		end)
	end
	if fields.welcome_rules_disagree then
		local name = player:get_player_name()
		minetest.kick_player(name, "Bye then! You have to agree to the rules to play on the server (please rejoin if you have a change of mind).")
	end
	if fields.welcome_rules_agree then
		local name = player:get_player_name()
		if minetest.check_player_privs(name, {shout=true}) then
			if minetest.check_player_privs(name, {interact=true}) then
				minetest.chat_send_player(name, "You have already accepted the rules.")
			else
				minetest.chat_send_player(name, "Thanks for accepting the rules, you now are able to build.")
				minetest.chat_send_player(name, "Happy building!")
				local privs = minetest.get_player_privs(name)
				privs.interact = true
				minetest.set_player_privs(name, privs)
			end
			welcome.rules_accept_formspec(player)
		end
	end
end)

minetest.register_chatcommand("rules",{
	params = "",
	description = "Shows the rules page",
	privs = {shout=true},
	func = function (name)
		local player = minetest.get_player_by_name(name)
		minetest.chat_send_player(name, "Showing page... if this doesn't work please try again.")
		minetest.after(1, function()
			welcome.rules_formspec(player)
		end)
	end,
})
