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
		"#FFFF00," .. "Welcome to the super-secret staff panel," ..
		";1]"..
		--"button[2,0.5;2,1;welcome_staff_howto;Howto Guide]"..
		"button[4,0.5;2,1;welcome_staff_xban;xban GUI]")
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
	if fields.welcome_staff_xban then
		minetest.after(1, function()
			local name = player:get_player_name()
			local table_insert, table_concat =
      table.insert, table.concat
			local state = xban.states[name]
			if not state then
				state = { index=1, filter="" }
				xban.states[name] = state
				local list = { }
				state.list = list
				for k in pairs(minetest.auth_table) do
					table_insert(list, k)
				end
			table.sort(list)
			end
			minetest.show_formspec(name, "xban2:main", xban.make_fs(name))
		end)
	end
end)

minetest.register_chatcommand("staff",{
	params = "",
	description = "Shows the welcome page",
	privs = {shout=true},
	func = function (name)
		local player = minetest.get_player_by_name(name)
		local name = player:get_player_name()
		minetest.chat_send_player(name, "Showing page... if this doesn't work please try again.")
		if minetest.get_player_privs(name).rank_sysadmin or minetest.get_player_privs(name).rank_admin or minetest.get_player_privs(name).rank_moderator then
			minetest.after(1, function()
				welcome.staff_formspec(player)
			end)
		else
			minetest.chat_send_player(name, "You are not a staff member!")
		end
	end,
})
