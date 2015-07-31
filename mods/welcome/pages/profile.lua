welcome.emails = {}

function welcome.profile_formspec(player)
	local name = player:get_player_name()
	welcome.myemail = nil
	if welcome.emails[name] then
		welcome.myemail = welcome.emails[name]
	else
		welcome.myemail = "Not set"
	end
	minetest.show_formspec(name, "welcome:profile",
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
		"table[2,0;10,9;welcome_profile;" ..
		"#FFFF00," .. "The profile of "..name.."," ..
		",IP Address: "..minetest.get_player_ip(name)..","..
		",Privs: "..minetest.privs_to_string(minetest.get_player_privs(name), ' ')..","..
		",Email: "..welcome.myemail..","..
		",,"..
		"#FFFF00," .. "Set your email," ..
		",Setting your email means that if you forget your password - we will be,"..
		",able to reset it for you.,"..
		",Make sure that you can send AND receive from the email address.,"..
		";1]"..
		"button[4.5,5;2,1;welcome_profile_setemail;Set Email]")
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	local plname = player:get_player_name()
	if formname ~= "welcome:profile" then
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
	if fields.welcome_profile_setemail then
		minetest.after(1, function()
			welcome.profile_setemailone_formspec(player)
		end)
	end
end)

function welcome.profile_setemailone_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "welcome:profile_setemailone",
	"field[welcome_profile_setemailone;Please enter your email address;]")
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	local plname = player:get_player_name()
	if formname ~= "welcome:profile_setemailone" then
		return
	end
	if fields.welcome_profile_setemailone then
		welcome.fields_welcome_profile_setemailone = nil
		welcome.fields_welcome_profile_setemailone = fields.welcome_profile_setemailone
		minetest.after(1, function()
			welcome.profile_setemailtwo_formspec(player)
		end)
	end
end)

function welcome.profile_setemailtwo_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "welcome:profile_setemailtwo",
	"field[welcome_profile_setemailtwo;Please enter your email address (again);]")
end

-- Load email database - Based on https://github.com/tenplus1/simple_skins/blob/master/init.lua
welcome.emails_load = function()
	local input = io.open(minetest.get_worldpath() .. "/emails.db", "r")
	local data = nil
	if input then
		data = input:read('*all')
	end
	if data and data ~= "" then
		local lines = string.split(data,"\n")
		for _, line in ipairs(lines) do
			data = string.split(line, ' ', 2)
			welcome.emails[data[1]] = data[2]
		end
		io.close(input)
	end
end
-- Load initially
welcome.emails_load()

-- Save email database - Based on https://github.com/tenplus1/simple_skins/blob/master/init.lua
welcome.emails_save = function()
	local output = io.open(minetest.get_worldpath() .. "/emails.db",'w')
	for player_name, player_email in pairs(welcome.emails) do
		if player_name and player_email then
			output:write(player_name .. " " .. player_email .. "\n")
		end
	end
	io.close(output)
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	local plname = player:get_player_name()
	if formname ~= "welcome:profile_setemailtwo" then
		return
	end
	if fields.welcome_profile_setemailtwo then
		welcome.fields_welcome_profile_setemailtwo = nil
		welcome.fields_welcome_profile_setemailtwo = fields.welcome_profile_setemailtwo
		if welcome.fields_welcome_profile_setemailone == welcome.fields_welcome_profile_setemailtwo then
			welcome.player_name = player:get_player_name()
			welcome.player_email = welcome.fields_welcome_profile_setemailone
			welcome.emails[welcome.player_name] = welcome.player_email
			welcome.emails_save()
			-- Now send the email!
			email.email_email_confirmation()
			minetest.chat_send_player(welcome.player_name, "Thank you! You should receive a email shortly at: "..welcome.player_email)
			-- Load the emails again
			welcome.emails_load()
		else
			local name = player:get_player_name()
			minetest.chat_send_player(name, "The email addresses you entered do not match, please try again.")
		end
	end
end)

minetest.register_chatcommand("profile",{
	params = "",
	description = "Shows the profile page",
	privs = {shout=true},
	func = function (name)
		local player = minetest.get_player_by_name(name)
		minetest.chat_send_player(name, "Showing page... if this doesn't work please try again.")
		minetest.after(1, function()
			welcome.profile_formspec(player)
		end)
	end,
})
