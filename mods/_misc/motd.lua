local mod_storage = minetest.get_mod_storage()

minetest.register_chatcommand("motd", {
	description = "Message of the day.",
	func = function(name, param)
		if param == "" then
		local motd = mod_storage:get_string("motd")
			if motd then
				minetest.chat_send_player(name, motd)
			end
		elseif param ~= "" and minetest.check_player_privs(name, {server=true}) then
			mod_storage:set_string("motd", param)
			minetest.chat_send_player(name, "Message of the day has been set to: "..param)
		end
	end,
})
 
minetest.register_on_joinplayer(function(player)
	local motd = mod_storage:get_string("motd")
	if motd then
		minetest.chat_send_player(player:get_player_name(), motd)
	end
end)