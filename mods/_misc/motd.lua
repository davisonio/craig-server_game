minetest.register_on_joinplayer(function(player)
	local message = "# Server: Skins & Sethome have recently been removed from the inventory. Use the commands /skin, /sethome and /home."
	minetest.chat_send_player(player:get_player_name(), message)
end)