minetest.register_craft({
	output = 'default:gravel',
	recipe = {
		{'default:cobble'},
	}
})

minetest.register_craft({
	output = 'default:sand',
	recipe = {
		{'default:gravel'},
	}
})

minetest.register_craft({
	output = 'default:dirt 2',
	recipe = {
		{'default:sand', 'default:cobble'},
	}
})

minetest.register_craft({
	output = 'default:desert_sand',
	recipe = {
		{'default:desert_cobble'},
	}
})