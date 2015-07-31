minetest.register_craft({
	output = "factory:smoke_tube",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = 'factory:factory_brick 6',
	recipe = {
		{'factory:factory_lump', 'factory:factory_lump'},
		{'factory:factory_lump', 'factory:factory_lump'},
	}
})