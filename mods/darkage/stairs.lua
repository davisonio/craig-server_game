if minetest.get_modpath("moreblocks") then

	stairsplus:register_all("darkage", "basalt", "darkage:basalt", {
		description = "Basalt",
		tiles = {"darkage_basalt.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "marble", "darkage:marble", {
		description = "Marble",
		tiles = {"darkage_marble.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "serpentine", "darkage:serpentine", {
		description = "Serpentine",
		tiles = {"darkage_serpentine.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "ors", "darkage:ors", {
		description = "Old Red Sandstone",
		tiles = {"darkage_ors.png"},
		groups = {crumbly=2,cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "schist", "darkage:schist", {
		description = "Schist",
		tiles = {"darkage_schist.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "slate", "darkage:slate", {
		description = "Slate",
		tiles = {"darkage_slate.png"},
		groups = {cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "gneiss", "darkage:gneiss", {
		description = "Gneiss",
		tiles = {"darkage_gneiss.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "chalk", "darkage:chalk", {
		description = "Chalk",
		tiles = {"darkage_chalk.png"},
		groups = {crumbly=2,cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "slate_cobble", "darkage:slate_cobble", {
		description = "Slate Cobble",
		tiles = {"darkage_slate_cobble.png"},
		groups = {cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "slate_brick", "darkage:slate_brick", {
		description = "Slate Brick",
		tiles = {"darkage_slate_brick.png"},
		groups = {cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "ors_brick", "darkage:ors_brick", {
		description = "Old Red Sandstone Brick",
		tiles = {"darkage_ors_brick.png"},
		groups = {crumbly=2,cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

stairsplus:register_all("darkage", "ors_cobble", "darkage:ors_cobble", {
		description = "Old Red Sandstone Cobble",
		tiles = {"darkage_ors_cobble.png"},
		groups = {crumbly=2,cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "gneiss_cobble", "darkage:gneiss_cobble", {
		description = "Gneiss Cobble",
		tiles = {"darkage_gneiss_cobble.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})
	
	stairsplus:register_all("darkage", "gneiss_brick", "darkage:gneiss_brick", {
		description = "Gneiss Brick",
		tiles = {"darkage_gneiss_brick.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "basalt_cobble", "darkage:basalt_cobble", {
		description = "Basalt Cobble",
		tiles = {"darkage_basalt_cobble.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})
	
	stairsplus:register_all("darkage", "basalt_brick", "darkage:basalt_brick", {
			description = "Basalt Brick",
			tiles = {"darkage_basalt_brick.png"},
			groups = {cracky=3},
			sounds = default.node_sound_stone_defaults(),
			sunlight_propagates = true,
	})
	stairsplus:register_all("darkage", "straw", "darkage:straw", {
		description = "Straw",
		tiles = {"darkage_straw.png"},
		groups = {snappy=3, flammable=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "straw_bale", "darkage:straw_bale", {
		description = "Straw Bale",
		tiles = {"darkage_straw_bale.png"},
		groups = {snappy=2, flammable=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "slate_tile", "darkage:slate_tile", {
		description = "Slate Tile",
		tiles = {"darkage_slate_tile.png"},
		groups = {cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "marble_tile", "darkage:marble_tile", {
		description = "Marble Tile",
		tiles = {"darkage_marble_tile.png"},
		groups = {cracky=2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "stone_brick", "darkage:stone_brick", {
		description = "Stone Brick",
		tiles = {"darkage_stone_brick.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "reinforced_chalk", "darkage:reinforced_chalk", {
		description = "Reinforced Chalk",
		tiles = {"darkage_chalk.png^darkage_reinforce.png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "glass", "darkage:glass", {
		description = "Medieval Glass",
		tiles = {"darkage_glass.png"},
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "glow_glass", "darkage:glow_glass", {
		description = "Medieval Glow Glass",
		tiles = {"darkage_glass.png"},
		paramtype = "light",
		light_source = 14,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("darkage", "reinforced_wood", "darkage:reinforced_wood", {
		description = "Reinforced Wood",
		tiles = {"default_wood.png^darkage_reinforce.png"},
		groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

elseif minetest.get_modpath("stairs") then

	stairs.register_stair_and_slab("basalt", "darkage:basalt",
		{cracky=3},
		{"darkage_basalt.png"},
		"Basalt Stair",
		"Basalt Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("marble", "darkage:marble",
		{cracky=3},
		{"darkage_marble.png"},
		"Marble Stair",
		"Marble Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("marble", "darkage:serpentine",
		{cracky=3},
		{"darkage_serpentine.png"},
		"Serpentine Stair",
		"Serpentine Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("ors", "darkage:ors",
		{crumbly=2,cracky=2},
		{"darkage_ors.png"},
		"Old Red Sandstone Stair",
		"Old Red Sandstone Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("schist", "darkage:schist",
		{cracky=3},
		{"darkage_schist.png"},
		"Schist Stair",
		"Schist Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("slate", "darkage:slate",
		{cracky=2},
		{"darkage_slate.png"},
		"Slate Stair",
		"Slate Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("gneiss", "darkage:gneiss",
		{cracky=3},
		{"darkage_gneiss.png"},
		"Gneiss Stair",
		"Gneiss Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("chalk", "darkage:chalk",
		{crumbly=2,cracky=2},
		{"darkage_chalk.png"},
		"Chalk Stair",
		"Chalk Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("slate_cobble", "darkage:slate_cobble",
		{cracky=2},
		{"darkage_slate_cobble.png"},
		"Slate Cobble Stair",
		"Slate Cobble Slab",
		default.node_sound_stone_defaults()
	)
	
	stairs.register_stair_and_slab("slate_brick", "darkage:slate_brick",
		{cracky=2},
		{"darkage_slate_brick.png"},
		"Slate Brick Stair",
		"Slate Brick Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("ors_cobble", "darkage:ors_cobble",
		{crumbly=2,cracky=2},
		{"darkage_ors_cobble.png"},
		"Old Red Sandstone Cobble Stair",
		"Old Red Sandstone Cobble Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("ors_brick", "darkage:ors_brick",
		{crumbly=2,cracky=2},
		{"darkage_ors_brick.png"},
		"Old Red Sandstone Brick Stair",
		"Old Red Sandstone Brick Slab",
		default.node_sound_stone_defaults()
	)
	
	stairs.register_stair_and_slab("gneiss_cobble", "darkage:gneiss_cobble",
		{crumbly=2,cracky=2},
		{"darkage_gneiss_cobble.png"},
		"Gneiss Cobble Stair",
		"Gneiss Cobble Slab",
		default.node_sound_stone_defaults()
	)
	
	stairs.register_stair_and_slab("gneiss_brick", "darkage:gneiss_brick",
		{crumbly=2,cracky=2},
		{"darkage_gneiss_brick.png"},
		"Gneiss Brick Stair",
		"Gneiss Brick Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("basalt_cobble", "darkage:basalt_cobble",
		{cracky=3},
		{"darkage_basalt_cobble.png"},
		"Basalt Cobble Stair",
		"Basalt Cobble Slab",
		default.node_sound_stone_defaults()
	)
	
	stairs.register_stair_and_slab("basalt_brick", "darkage:basalt_brick",
		{cracky=3},
		{"darkage_basalt_brick.png"},
		"Basalt Brick Stair",
		"Basalt Brick Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("straw", "darkage:straw",
		{snappy=3, flammable=2},
		{"darkage_straw.png"},
		"Straw Stair",
		"Straw Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("straw_bale", "darkage:straw_bale",
		{snappy=2, flammable=2},
		{"darkage_straw_bale.png"},
		"Straw Bale Stair",
		"Straw Bale Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("slate_tile", "darkage:slate_tile",
		{cracky=2},
		{"darkage_slate_tile.png"},
		"Slate Tile Stair",
		"Slate Tile Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("marble_tile", "darkage:marble_tile",
		{cracky=2},
		{"darkage_marble_tile.png"},
		"Marble Tile Stair",
		"Marble Tile Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("stone_brick", "darkage:stone_brick",
		{cracky=3},
		{"darkage_stone_brick.png"},
		"Stone Brick Stair",
		"Stone Brick Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("reinforced_chalk", "darkage:reinforced_chalk",
		{cracky=3},
		{"darkage_chalk.png^darkage_reinforce.png"},
		"Reinforced Chalk Stair",
		"Reinforced Chalk Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("glass", "darkage:glass",
		{snappy=2,cracky=3,oddly_breakable_by_hand=3},
		{"darkage_glass.png"},
		"Medieval Glass Stair",
		"Medieval Glass Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("glow_glass", "darkage:glow_glass",
		{snappy=2,cracky=3,oddly_breakable_by_hand=3},
		{"darkage_glass.png"},
		"Medieval Glow Glass Stair",
		"Medieval Glow Glass Slab",
		default.node_sound_stone_defaults()
	)

	stairs.register_stair_and_slab("reinforced_wood", "darkage:reinforced_wood",
		{snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
		{"default_wood.png^darkage_reinforce.png"},
		"Reinforced Wood Stair",
		"Reinforced Wood Slab",
		default.node_sound_stone_defaults()
	)
end
