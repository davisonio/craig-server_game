minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.main then
		sfinv.set_player_inventory_formspec(player)
	end
end)