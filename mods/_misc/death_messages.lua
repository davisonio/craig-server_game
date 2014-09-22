DEATH_MESSAGE = "%s died!"

minetest.register_on_dieplayer(function(player)
	minetest.chat_send_all(string.format(DEATH_MESSAGE, player:get_player_name()))
end)
