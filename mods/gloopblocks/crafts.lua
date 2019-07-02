-- Various crafts

minetest.register_craft( {
	type = "shapeless",
	output = "gloopblocks:rainbow_block",
	recipe = {
		"group:dye,color_red",
		"group:dye,color_orange",
		"group:dye,color_yellow",
		"group:dye,color_green",
		"group:dye,color_blue",
		"group:dye,color_violet",
		"default:stone",
		"default:mese_crystal",
	},
})


minetest.register_craft({
	type = "shapeless",
	output = "default:nyancat_rainbow",
	recipe = {
		"gloopblocks:rainbow_block", 
		"default:diamondblock",
		"default:steelblock",
		"default:copperblock",
		"default:bronzeblock",
		"default:goldblock",
		"default:mese",
		"moreores:silver_block",
		"moreores:mithril_block"
	}
})

minetest.register_craft({
	output = "default:nyancat",
	recipe = {
		{"gloopblocks:rainbow_block", "gloopblocks:rainbow_block", "gloopblocks:rainbow_block"},
		{"gloopblocks:rainbow_block", "gloopblocks:rainbow_block", "gloopblocks:rainbow_block"},
		{"gloopblocks:rainbow_block", "gloopblocks:rainbow_block", "gloopblocks:rainbow_block"},
	}
})

if minetest.get_modpath("glooptest") then

	minetest.register_craft({
		type = "shapeless",
		output = "gloopblocks:evil_stick",
		recipe = {
			"glooptest:kalite_lump",
			"default:gold_ingot",
			"default:coal_lump",
			"group:stick"
		}
	})

	minetest.register_craft({
		output = "gloopblocks:evil_block",
		recipe = {
			{"gloopblocks:evil_stick", "gloopblocks:evil_stick"},
			{"gloopblocks:evil_stick", "gloopblocks:evil_stick"},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:evil_stick 4",
		recipe = {
			{"gloopblocks:evil_block"}
		}
	})

	minetest.register_craft({
		output = "gloopblocks:pick_evil",
		recipe = {
			{"gloopblocks:evil_block", "gloopblocks:evil_block", "gloopblocks:evil_block"},
			{"", "gloopblocks:evil_stick", ""},
			{"", "gloopblocks:evil_stick", ""},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:axe_evil",
		recipe = {
			{"gloopblocks:evil_block", "gloopblocks:evil_block"},
			{"gloopblocks:evil_block", "gloopblocks:evil_stick"},
			{"", "gloopblocks:evil_stick"},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:axe_evil",
		recipe = {
			{"gloopblocks:evil_block", "gloopblocks:evil_block"},
			{"gloopblocks:evil_stick", "gloopblocks:evil_block"},
			{"gloopblocks:evil_stick", ""},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:shovel_evil",
		recipe = {
			{"gloopblocks:evil_block"},
			{"gloopblocks:evil_stick"},
			{"gloopblocks:evil_stick"},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:sword_evil",
		recipe = {
			{"gloopblocks:evil_block"},
			{"gloopblocks:evil_block"},
			{"gloopblocks:evil_stick"},
		}
	})
end

minetest.register_craft({
	output = "gloopblocks:scaffolding 12",
		recipe = {
		{"group:stick", "group:wood", "group:stick"},
		{"", "group:stick", ""},
		{"group:stick", "group:wood", "group:stick"},
	}
})

minetest.register_craft({
	output = "gloopblocks:pick_cement",
	recipe = {
		{"gloopblocks:cement", "gloopblocks:cement", "gloopblocks:cement"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "gloopblocks:axe_cement",
	recipe = {
		{"gloopblocks:cement", "gloopblocks:cement"},
		{"gloopblocks:cement", "group:stick"},
		{"", "group:stick"},
	}
})

minetest.register_craft({
	output = "gloopblocks:axe_cement",
	recipe = {
		{"gloopblocks:cement", "gloopblocks:cement"},
		{"group:stick", "gloopblocks:cement"},
		{"group:stick", ""},
	}
})

minetest.register_craft({
	output = "gloopblocks:shovel_cement",
	recipe = {
		{"gloopblocks:cement"},
		{"group:stick"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = "gloopblocks:sword_cement",
	recipe = {
		{"gloopblocks:cement"},
		{"gloopblocks:cement"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = "gloopblocks:pavement 5",
	recipe = {
		{"gloopblocks:basalt",    "gloopblocks:wet_cement","gloopblocks:basalt"},
		{"gloopblocks:wet_cement","gloopblocks:basalt",    "gloopblocks:wet_cement"},
		{"gloopblocks:basalt",    "gloopblocks:wet_cement","gloopblocks:basalt"},
	}
})

minetest.register_craft({
	output = "gloopblocks:pavement 5",
	recipe = {
		{"gloopblocks:wet_cement","gloopblocks:basalt",    "gloopblocks:wet_cement"},
		{"gloopblocks:basalt",    "gloopblocks:wet_cement","gloopblocks:basalt"},
		{"gloopblocks:wet_cement","gloopblocks:basalt",    "gloopblocks:wet_cement"},
	}
})

minetest.register_craft({
	output = "gloopblocks:oerkki_block 2",
	recipe = {
		{"default:iron_lump", "default:coal_lump", "default:iron_lump"},
		{"default:coal_lump", "default:bookshelf", "default:coal_lump"},
		{"default:iron_lump", "default:coal_lump", "default:iron_lump"},
	},
	replacements = { { "default:bookshelf", "default:book 3" } }
})

minetest.register_craft({
	output = "gloopblocks:oerkki_block 2",
	recipe = {
		{"default:coal_lump", "default:iron_lump", "default:coal_lump"},
		{"default:iron_lump", "default:bookshelf", "default:iron_lump"},
		{"default:coal_lump", "default:iron_lump", "default:coal_lump"},
	},
	replacements = { { "default:bookshelf", "default:book 3" } }
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:stone_brick_mossy 2",
	recipe = {
		"default:stonebrick",
		"default:stonebrick",
		"default:junglegrass",
		"default:junglegrass"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:stone_brick_mossy 2",
	recipe = {
		"default:stonebrick",
		"default:stonebrick",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1"
	}
})

minetest.register_craft({
	type = "cooking",
	output = "gloopblocks:stonebrick",
	recipe = "default:stone_brick_mossy",
	cooktime = 6
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:cobble_road 5",
	recipe = {
		"default:cobble",
		"default:cobble",
		"default:cobble",
		"default:cobble",
		"gloopblocks:pavement"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:cobble_road_mossy 2",
	recipe = {
		"gloopblocks:cobble_road",
		"gloopblocks:cobble_road",
		"default:junglegrass",
		"default:junglegrass"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:cobble_road_mossy 2",
	recipe = {
		"gloopblocks:cobble_road",
		"gloopblocks:cobble_road",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:stone_mossy 2",
	recipe = {
		"default:stone",
		"default:stone",
		"default:junglegrass",
		"default:junglegrass"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:stone_mossy 2",
	recipe = {
		"default:stone",
		"default:stone",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1"
	}
})

minetest.register_craft({
	output = "gloopblocks:fence_steel 1",
	recipe = {
		{"xpanes:bar", "xpanes:bar", "xpanes:bar"},
		{"xpanes:bar", "xpanes:bar", "xpanes:bar"},
	},
})

if minetest.get_modpath("technic") then
	technic.register_grinder_recipe({input={"gloopblocks:pumice"},output="default:sand"})
	technic.register_grinder_recipe({input={"gloopblocks:basalt"},output="default:cobble"})
	minetest.register_craft({
		type = "shapeless",
		output = "technic:concrete 3",
		recipe = {
			"gloopblocks:wet_cement",
			"group:sand",
			"default:gravel",
		}
	})
end
