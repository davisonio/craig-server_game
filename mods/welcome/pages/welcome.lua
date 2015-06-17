function welcome.welcome_formspec(player)
	local formspec = "size[12,10]" ..
		-- Image buttons
		"item_image_button[0,0;2,1;welcome:help;help_wiki;Rules]"..
		"item_image_button[0,1.25;2,1;welcome:help;help_wiki;Guides]"..
		"item_image_button[0,2.5;2,1;welcome:rules;rules_page;Rules]"..
		"item_image_button[0,3.75.5;2,1;welcome:news;news_wiki;News]"..
		"item_image_button[0,5;2,1;welcome:help;help_wiki;Guides]"..
		"item_image_button[0,6.25.5;2,1;welcome:rules;rules_page;Rules]"..
		"item_image_button[0,7.5;2,1;welcome:news;news_wiki;News]"..
		--"item_image_button[0,8.75;2,1;welcome:news;news_wiki;News]"..
		-- Close button
		"button_exit[10,9;2,1;exit;Close]"..
		-- Back button
		--"button[2,9;2,1;exit;<- Back]" ..
		-- Content
		"tablecolumns[color;text]" ..
		"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
		"table[2,0;10,9;welcome_welcome;" ..
		"#FFFF00," .. "Welcome to " .. minetest.setting_get("server_name") .. "!" .."," ..
		",Hello "..player:get_player_name().." - thanks for joining. To start building you,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",If you need any help starting out - don't hesitate to ask on,"..
		",the chat.need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",need to accept the rules. Click the Rules tab to the left.,"..
		",,"..
		"#FFFF00," .. "Links" .. "," ..
		",Forum Topic: https://forum.minetest.net/viewtopic.php?t=7010," ..
		",Source Code: https://github.com/CraigyDavi/Craig-Server_game," ..
		",Join IRC Chat: https://kiwiirc.com/client/irc.inchra.net/#minetest-craig," ..
		",," ..
		";1]"
	return formspec
end
--[[
minetest.register_on_player_receive_fields(function(player,formname,fields)
	local plname = player:get_player_name()
	if fields.help_wiki then
		wikilib.show_wiki_page(plname, "Starting guide")
	end
	if fields.rules_page then
		minetest.after(1, function()
			minetest.show_formspec(name,"rules",rules.formspec(plname))
		end)
	end
	if fields.news_wiki then
		wikilib.show_wiki_page(plname, "News")
	end
end)
--]]
minetest.register_chatcommand("welcome",{
	params = "",
	description = "Shows the welcome page",
	privs = {shout=true},
	func = function (name)
		local player = minetest.get_player_by_name(name)
		minetest.chat_send_player(name, "Showing welcome interface... if this doesn't work please try again.")
		minetest.after(1, function()
			minetest.show_formspec(name,"welcome:welcome",welcome.welcome_formspec)
		end)
	end,
})

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	minetest.after(5, function()
		minetest.show_formspec(name,"welcome;welcome",welcome.welcome_formspec)
	end)
	-- Fix for the "dead man" bug
	if player:get_hp() < 1 then
		player:set_hp(20)
	end
end)
