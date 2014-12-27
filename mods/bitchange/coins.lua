-- Bitcoin
minetest.register_craftitem("bitchange:bitcoin", {
	description = "Bitcoin",
	inventory_image = "bitchange_bitcoin.png",
	stack_max = 499,
})

minetest.register_craft({
	output = "bitchange:bitcoin 3",
	recipe = {
		{"default:gold_ingot"},
	}
})

minetest.register_craft({
	output = "bitchange:bitcoin 9",
	recipe = {
		{"bitchange:bitcoin_block"},
	}
})

-- Bitcoin Block
minetest.register_node("bitchange:bitcoin_block", {
	description = "Bitcoin Block",
	tile_images = {"bitchange_bitcoin_block.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "bitchange:bitcoin_block",
	recipe = {
		{"bitchange:bitcoin", "bitchange:bitcoin", "bitchange:bitcoin"},
		{"bitchange:bitcoin", "bitchange:bitcoin", "bitchange:bitcoin"},
		{"bitchange:bitcoin", "bitchange:bitcoin", "bitchange:bitcoin"},
	}
})
