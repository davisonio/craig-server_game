function welcome.staff_formspec(player)

end

minetest.register_chatcommand("test",{
	params = "",
	description = "Shows the welcome page",
	privs = {shout=true},
	func = function (name)
		minetest.after(1, function()
			local name = player:get_player_name()
				minetest.show_formspec(name, "test",
					"size[10,8]"..
					"test"
				)
		end)
	end,
})
