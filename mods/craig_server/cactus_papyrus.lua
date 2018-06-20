minetest.override_item("default:cactus", {
	after_dig_node = function(pos, node, metadata, digger)
		pos.y = pos.y + 1
		if minetest.get_node(pos).name == "default:cactus" then
			minetest.node_dig(pos, node, digger)
		end
	end,
})

minetest.override_item("default:papyrus", {
	after_dig_node = function(pos, node, metadata, digger)
		pos.y = pos.y + 1
		if minetest.get_node(pos).name == "default:papyrus" then
			minetest.node_dig(pos, node, digger)
		end
	end,
})