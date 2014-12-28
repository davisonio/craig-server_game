rules = {}
welcome = {}

--
-- Rules
--

function rules.formspec(player,article)
	if (article == "" or article == nil) then
		article = "rules.txt"
	end
	local size = {"size[10,8]"}
	local thefile = io.open(minetest.get_modpath("_misc").."/texts/"..article,"r")
	local content = thefile:read("*a")
	table.insert(size, "textarea[0.5,0.5;9.5,8;rules;Here are the rules. Click accept if you agree with them.;"..content.."]")
	table.insert(size, "button_exit[6,7.4;1.8,1;accept;Accept :)]")
	table.insert(size, "button[7.5,7.4;1.8,1;decline;Decline :(]")
	table.insert(size, "button_exit[0.5,7.4;1.8,1;exit;Close]")
	return table.concat(size)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	local plname = player:get_player_name()
	if fields.accept then
		if minetest.check_player_privs(plname, {shout=true}) then
			minetest.chat_send_player(plname, "Thanks for accepting the rules, you now are able to interact with things.")
			minetest.chat_send_player(plname, "Happy building!")
			minetest.chat_send_player(plname, "For more information please type /welcome")
			local privs = minetest.get_player_privs(plname)
			privs.interact = true
			minetest.set_player_privs(plname, privs)
		end
		return
	elseif fields.decline then
		minetest.chat_send_player(plname, "Sorry, you need to accept the rules in order to join the server.")
		return
	end
end)

function rules.show_formspec(player, article)
	if (article == "" or article == nil) then
		article = "rules.txt"
	end
	local name = player:get_player_name()
	minetest.show_formspec(name,"rules",rules.formspec(player,article))
	minetest.log("action","Showing rules formspec to "..name)
end

minetest.register_chatcommand("rules",{
	params = "",
	description = "Shows the rules page",
	privs = {shout=true},
	func = function (name,params)
		local player = minetest.get_player_by_name(name)
		minetest.chat_send_player(name, "Showing rules interface... if this doesn't work please try again.")
		minetest.after(1, function()
			rules.show_formspec(player, params)
		end)
	end,
})

--
-- Welcome
--

minetest.register_craftitem("_misc:help", {
	description = "Starter guides handwritten by fellow players to help you out along your way.",
	inventory_image = "misc_help.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("_misc:rules", {
	description = "Read the rules and accept them to get ability to build!",
	inventory_image = "misc_rules.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("_misc:news", {
	description = "Read the latest server news and know what's going on!",
	inventory_image = "misc_news.png",
	groups = {not_in_creative_inventory=1},
})

function welcome.formspec(player,article)
	if (article == "" or article == nil) then
		article = "welcome.txt"
	end
	local thefile = io.open(minetest.get_modpath("_misc").."/texts/"..article,"r")
	local formspec = "size[12,10]"
	if thefile ~= nil then
		local content = thefile:read("*a")
		formspec = formspec.."textarea[3,.25;9,8.5;welcome;;"..content.."]"
	else		
		formspec = formspec.."label[.25,.25;Article does not exist]"
	end
	formspec = formspec.."item_image_button[0.10,1;2,1;_misc:help;help_wiki;Guides]"
	formspec = formspec.."item_image_button[0.10,2;2,1;_misc:rules;rules_page;Rules]"
	formspec = formspec.."item_image_button[0.10,3;2,1;_misc:news;news_wiki;News]"
	formspec = formspec.."button_exit[.25,9;2,1;exit;Close]"
	if (thefile ~= nil) then
		thefile:close()
	end
	return formspec
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	local plname = player:get_player_name()
	if fields.help_wiki then
		wikilib.show_wiki_page(plname, "Guides")
	end
	if fields.rules_page then
		minetest.show_formspec(name,"rules",rules.formspec(plname))
	end
	if fields.news_wiki then
		wikilib.show_wiki_page(plname, "News")
	end
end)

function welcome.show_formspec(player, article)
	if (article == "" or article == nil) then
		article = "welcome.txt"
	end
	local name = player:get_player_name()
	minetest.show_formspec(name,"welcome",welcome.formspec(player,article))
	minetest.log("action","Showing welcome formspec to "..name)
end

minetest.register_chatcommand("welcome",{
	params = "",
	description = "Shows the welcome page",
	privs = {shout=true},
	func = function (name,params)
		local player = minetest.get_player_by_name(name)
		minetest.chat_send_player(name, "Showing welcome interface... if this doesn't work please try again.")
		minetest.after(1, function()
			welcome.show_formspec(player, params)
		end)
	end,
})

minetest.register_on_joinplayer(function (player)
	minetest.after(5,welcome.show_formspec,player)
	-- Fix for the "dead man" bug
	if player:get_hp() < 1 then
		player:set_hp(20)
	end
end)
