function welcome.staff_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "welcome:staff",
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
		"table[2,0;10,2;welcome_staff;" ..
		"#FFFF00," .. "Staff," ..
		",This is an area which only sysadmins\\, admins or moderators can access.,"..
		";1]"..
		"button[2,1;2,1;welcome_staff_readthis;Read this!]")
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	local plname = player:get_player_name()
	if formname ~= "welcome:staff" then
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
	if fields.welcome_staff_readthis then
		minetest.after(1, function()
			welcome.staff_readthis_formspec(player)
		end)
	end
end)

function welcome.staff_readthis_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "welcome:staff_readthis",
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
		"table[2,0;10,9;welcome_staff;" ..
		"#FFFF00," .. "Staff - Read this," ..
		",This guide aims to give a overview of how things works here.,"..
		"#FFFF00," .. "Staff Tools," ..
		",There are two staff tools as well as a set of admin armour:,"..
		",The Admin Pickaxe mines normal blocks instantly and returns them,"..
		",into your inventory. The Remove Stick can remove blocks which can\\'t,"..
		",normally be removed (e.g. locked chests owned by others) This tool can,"..
		",sometimes glitch-out blocks so please use with caution!,"..
		",Make sure you don't loose your tools!,"..
		",There is also a set of admin armour available which looks quite cool.,"..
		"#FFFF00," .. "Commands and privileges,"..
		",It\\'s' recommended you read through the list of commands and know what," ..
		",each command does. `/help all` provides a list (use F10).," ..
		",To view the descriptions of the privileges use `/help privs`.," ..
		",Privs for sysadmins:," ..
		",server\\, password\\, noclip\\, rollback\\, give\\, privs\\, irc_admin (+ admin privs)," ..
		",Privs for admins:," ..
		",areas\\, access\\, travelnet (+ moderator privs)," ..
		",Privs for moderators:," ..
		",bring\\, kick\\, teleport\\, ban\\, basic_privs\\, settime\\, fly\\, whois (+ player privs)," ..
		"#FFFF00," .. "Punishments,"..
		",There is no guide for punishments\\, if someone breaks a rule you need to," ..
		",decide what action is to be taken. Here\\'s some things you can do:," ..
		",- A warning (in-chat or via /msg)," ..
		",- Another warning?," ..
		",- Kick," ..
		",- Revoke shout privilege (please remember to grant back)," ..
		",- Temporary ban," ..
		",- Ban," ..
		",Note: punishments depend on the severity of their rule-break\\, for example," ..
		",you could ban sometime for lava greifing or you could warn someone," ..
		",for dating/role-play.," ..
		",Also note: the rules are only a basic guideline - you could ban someone," ..
		",for something not in the rules (e.g. too much swearing)," ..
		"#FFFF00," .. "Staff HQ,"..
		",Check out the Staff HQ for a super-secret underground place to chill out:," ..
		",/teleport 0\\,-30000\\,0," ..
		",Let's keep it secret shall we? Don't let anyone else there!," ..
		"#FFFF00," .. "Bugs & Feature requests,"..
		",As staff members\\, you may notice bugs or something which would be a," ..
		",great feature. If you have a GitHub account\\, you can make a note of," ..
		",bugs/ideas on our issue tracker. This is available at," ..
		",https://github.com/CraigyDavi/Craig-Server_game/issues," ..
		"#FFFF00," .. "Communication,"..
		",Using our IRC channel makes chatting to players in-game easy\\, as well," ..
		",as providing a way for us all to communicate.," ..
		",Questions for me? Contact using email (craig@davison.io) or /msg.," ..
		"#FFFF00," .. "Thanks,"..
		",:)," ..
		";1]")
end
