-- Rules Page
-- Based on https://github.com/ChaosWormz/mt_terms_of_use

local RULES = [[
Here are the rules:
1)	Don't attempt to crash, lag, damage, disable, exploit or disturb the server or game.
2)	Don't ruin creations not owned by yourself.
3)	Don't be harrassful. This includes (but is not limited to) asking for stuff constantly, being rude, being inconsiderate or spamming the chat.
4)	Feel free to walk around wherever, but if the area is clearly private stay out!
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
	table.insert(size, "button[7.5,7.4;1.8,0.5;decline;I Disagree :(]")
	table.insert(size, "button_exit[0.5,7.4;1.5,0.5;exit;Close]")
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
	params = "accept",
	description = "Shows the server rules",
	privs = {shout=true},
	func = function(name, params)
		minetest.chat_send_player(name, "Showing server rules... if this doesn't work please try again.")
		if params == "" then
		local player = minetest.get_player_by_name(name)
		    minetest.after(1, function()
			minetest.show_formspec(name, "rules", make_formspec())
		end)
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

-- Welcome Page

local welcome = {}

welcome.path = minetest.get_modpath("_misc")

minetest.register_craftitem("_misc:help", {
	description = "Starter guides handwritten by fellow players to help you out along your way",
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
	if ( article == "" or article == nil ) then
		article = "welcome.txt"
	end
	local welcomefile = io.open(welcome.path.."/texts/"..article,"r")
	local formspec = "size[12,10]"
	if welcomefile ~= nil then
		local welcomecontent = welcomefile:read("*a")
		formspec = formspec.."textarea[3,.25;9,8.5;welcome;;"..welcomecontent.."]"
	else		
		formspec = formspec.."label[.25,.25;Article does not exist]"
	end
    formspec = formspec.."item_image_button[0.10,1;2,1;_misc:help;help_wiki;Guides]"
    formspec = formspec.."item_image_button[0.10,2;2,1;_misc:rules;rules_page;Rules]"
    formspec = formspec.."item_image_button[0.10,3;2,1;_misc:news;news_wiki;News]"
	formspec = formspec.."button_exit[.25,9;2,1;exit;Close]"
	if ( welcomefile ~= nil ) then
		welcomefile:close()
	end
	return formspec
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
     local plname = player:get_player_name()
	if fields.help_wiki then
	    wikilib.show_wiki_page(plname, "Starting guide")
	end
     if fields.rules_page then
	    minetest.show_formspec(name, "rules", make_formspec())
	end
     if fields.news_wiki then
	    wikilib.show_wiki_page(plname, "News")
	end
end)

function welcome.show_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name,"welcome",welcome.formspec(player))
	minetest.log('action','Showing formspec to '..name)
end


minetest.register_chatcommand("welcome",{
	params = "<article>",
	description="Shows the welcome page",
	func = function (name,params)
		local player = minetest.get_player_by_name(name)
		minetest.chat_send_player(name, "Showing welcome interface... if this doesn't work please try again.")
		minetest.after(1, function()
		    minetest.show_formspec(name,"welcome",welcome.formspec(player,params))	
	    end)
	end,
})

minetest.register_on_joinplayer(function (player)
    minetest.after(5,welcome.show_formspec,player)
	if player:get_hp() < 1 then
	    player:set_hp(20)
	end
end)