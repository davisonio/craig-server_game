minetest.register_node("darkage:glass", {
	description = "Medieval Glass",
	drawtype = "glasslike",
	tiles = {"darkage_glass.png"},
	inventory_image = minetest.inventorycube("darkage_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("darkage:glow_glass", {
	description = "Medieval Glow Glass",
	drawtype = "glasslike",
	tiles = {"darkage_glass.png"},
	inventory_image = minetest.inventorycube("darkage_glass.png"),
	paramtype = "light",
	light_source = 18,
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = 'darkage:glow_glass 1',
	recipe = {
		{'darkage:glass', '', ''},
		{'default:torch', '', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'darkage:glass 1',
	recipe = {
		{'darkage:glow_glass'},
	}
})


minetest.register_craft({
	output = 'darkage:glass 8',
	recipe = {
		{'default:glass', 'default:steel_ingot', 'default:glass'},
		{'default:steel_ingot', 'default:glass', 'default:steel_ingot'},
		{'default:glass', 'default:steel_ingot', 'default:glass'},
	}
})

minetest.register_node("darkage:reinforced_chalk", {
  description = "Reinforced Chalk",
	tiles = {"darkage_chalk.png^darkage_reinforce.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:reinforced_wood", {
  description = "Reinforced Wood",
	tiles = {"default_wood.png^darkage_reinforce.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:reinforced_wood_right", {
  description = "Reinforced Wood Right",
	tiles = {"darkage_reinforced_wood_right.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:reinforced_wood_left", {
  description = "Reinforced Wood Left",
	tiles = {"darkage_reinforced_wood_left.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})


minetest.register_craft({
	output = 'darkage:reinforced_chalk',
	recipe = {
    {'default:stick','','default:stick'},
    {'','darkage:chalk',''},
    {'default:stick','','default:stick'},
	}
})

minetest.register_craft({
	output = 'darkage:chalk',
	recipe = {
    {'darkage:chalk_powder','darkage:chalk_powder',''},
    {'darkage:chalk_powder','darkage:chalk_powder',''},
    {'','',''},
	}
})

minetest.register_craft({
	output = 'darkage:reinforced_wood',
	recipe = {
    {'default:stick','','default:stick'},
    {'','default:wood',''},
    {'default:stick','','default:stick'},
	}
})

minetest.register_craft({
	output = 'default:wood',
	recipe = {
    {'darkage:reinforced_wood'},
	}
})

minetest.register_craft({
	output = 'darkage:reinforced_wood_left',
	recipe = {
    {'default:stick','',''},
    {'','default:wood',''},
    {'','','default:stick'},
	}
})

minetest.register_craft({
	output = 'default:wood',
	recipe = {
    {'darkage:reinforced_wood_left'},
	}
})

minetest.register_craft({
	output = 'darkage:reinforced_wood_right',
	recipe = {
    {'','','default:stick'},
    {'','default:wood',''},
    {'default:stick','',''},
	}
})

minetest.register_craft({
	output = 'default:wood',
	recipe = {
    {'darkage:reinforced_wood_right'},
	}
})

minetest.register_craft({
	output = 'darkage:glow_glass 1',
	recipe = {
		{'darkage:glass', '', ''},
		{'default:torch', '', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'darkage:glass 1',
	recipe = {
		{'darkage:glow_glass'},
	}
})


minetest.register_craft({
	output = 'darkage:glass 8',
	recipe = {
		{'default:glass', 'default:steel_ingot', 'default:glass'},
		{'default:steel_ingot', 'default:glass', 'default:steel_ingot'},
		{'default:glass', 'default:steel_ingot', 'default:glass'},
	}
})
