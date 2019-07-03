minetest.register_alias("technic:motor", "homedecor:motor")
minetest.register_alias("technic:slab_marble_1", "darkage:slab_marble_1")
minetest.register_alias("technic:slab_granite_1", "default:gravel")

minetest.register_alias("xpanes:pane", "default:glass")
minetest.register_alias("xpanes:pane_flat", "default:glass")

minetest.register_alias("cotton:black", "wool:black")
minetest.register_alias("cotton:red", "wool:red")
minetest.register_alias("cotton:blue", "wool:blue")
minetest.register_alias("cotton:yellow", "wool:yellow")

minetest.register_alias("building_blocks:gravel_spread", "default:gravel")
minetest.register_alias("building_blocks:hardwood", "default:wood")
minetest.register_alias("building_blocks:slab_hardwood", "default:wood")
minetest.register_alias("building_blocks:sticks", "default:stick")
minetest.register_alias("building_blocks:terrycloth_towel", "wool:white")
minetest.register_alias("building_blocks:woodglass", "default:glass")
minetest.register_alias("building_blocks:slab_marble", "darkage:slab_marble")
minetest.register_alias("building_blocks:grate", "default:steelblock")
minetest.register_alias("building_blocks:micro_marble_1", "darkage:slab_marble")

minetest.register_alias("homedecor:table_lamp_off", "homedecor:table_lamp_white_off")
minetest.register_alias("homedecor:standing_lamp_off", "homedecor:standing_lamp_white_off")
minetest.register_alias("homedecor:shingles_glass", "homedecor:skylight")

minetest.register_alias("chains:chain_top_brass", "homedecor:chainlink_brass")

minetest.register_alias("cottages:wool", "wool:white")
minetest.register_alias("cottages:glass_pane", "default:glass")
minetest.register_alias("cottages:glass_pane_side", "default:glass")

minetest.register_craft({
	output = "moreblocks:cobble_compressed",
	recipe = {
		{"darkage:stone_brick", "darkage:stone_brick", "darkage:stone_brick"},
		{"darkage:stone_brick", "darkage:stone_brick", "darkage:stone_brick"},
		{"darkage:stone_brick", "darkage:stone_brick", "darkage:stone_brick"}
	}
})

minetest.register_craft({
	output = 'default:skeleton_key',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'bitchange:bitcoin 12',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'default:gold_ingot 2',
	recipe = {
		{'bitchange:bitcoin', 'bitchange:bitcoin', 'bitchange:bitcoin'},
		{'bitchange:bitcoin', 'bitchange:bitcoin', 'bitchange:bitcoin'},
	}
})
