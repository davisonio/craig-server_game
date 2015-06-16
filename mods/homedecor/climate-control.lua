-- Nodes that would affect the local temperature e.g. fans, heater, A/C

local S = homedecor.gettext

minetest.register_node('homedecor:air_conditioner', {
	drawtype = "nodebox",
	description = S("Air Conditioner"),
	tiles = { 'homedecor_ac_tb.png',
		  'homedecor_ac_tb.png',
		  'homedecor_ac_sides.png',
		  'homedecor_ac_sides.png',
		  'homedecor_ac_back.png',
		  'homedecor_ac_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.124, 0.5 }, -- off by just a tad to force the adjoining faces to be drawn.
			{-0.5, 0.125, -0.5, 0.5, 0.5, 0.5 },
		}
	},
	selection_box = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
})

-- ceiling fan

minetest.register_node('homedecor:ceiling_fan', {
	description = S("Ceiling Fan"),
	drawtype = "nodebox",
	tiles = {
		{	name="homedecor_ceiling_fan_top.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.5} },
		{	name="homedecor_ceiling_fan_bottom.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.5} },
		'homedecor_ceiling_fan_sides.png',
	},
	inventory_image = "homedecor_ceiling_fan_inv.png",
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, 0.495, -0.5, 0.5, 0.495, 0.5 },
			{ -0.0625, 0.375, -0.0625, 0.0625, 0.5, 0.0625 }
		}
	},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_wood_defaults(),
})

-- heating devices

minetest.register_node('homedecor:space_heater', {
	drawtype = "nodebox",
	description = S("Space heater"),
	tiles = { 'homedecor_heater_tb.png',
		  'homedecor_heater_tb.png',
		  'homedecor_heater_sides.png',
		  'homedecor_heater_sides.png',
		  'homedecor_heater_back.png',
		  'homedecor_heater_front.png'
	},
	inventory_image = "homedecor_heater_inv.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, 0.0625, 0.1875, 0, 0.3125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.1875, -0.5, 0.0625, 0.1875, 0, 0.3125}
	}
})

minetest.register_node("homedecor:radiator", {
	tiles = { "homedecor_white_metal.png" },
	inventory_image = "homedecor_radiator_inv.png",
	description = "Radiator heater",
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375,  0.3125,   0.3125,  0.5,      0.4375,   0.4375},  --  NodeBox1
			{0.375,    0.25,     0.25,    0.4375,   0.5,      0.5},     --  NodeBox2
			{0.25,     0.25,     0.25,    0.3125,   0.5,      0.5},     --  NodeBox3
			{0.125,    0.25,     0.25,    0.1875,   0.5,      0.5},     --  NodeBox4
			{0,        0.25,     0.25,    0.0625,   0.5,      0.5},     --  NodeBox5
			{-0.125,   0.25,     0.25,    -0.0625,  0.5,      0.5},     --  NodeBox6
			{-0.25,    0.25,     0.25,    -0.1875,  0.5,      0.5},     --  NodeBox7
			{-0.375,   0.25,     0.25,    -0.3125,  0.5,      0.5},     --  NodeBox8
			{0.375,    -0.375,   0.4375,  0.4375,   0.5,      0.5},     --  NodeBox9
			{0.375,    -0.375,   0.25,    0.4375,   0.5,      0.3125},  --  NodeBox10
			{0.25,     -0.375,   0.4375,  0.3125,   0.5,      0.5},     --  NodeBox11
			{0.25,     -0.375,   0.25,    0.3125,   0.5,      0.3125},  --  NodeBox12
			{0.125,    -0.375,   0.4375,  0.1875,   0.5,      0.5},     --  NodeBox13
			{0.125,    -0.375,   0.25,    0.1875,   0.5,      0.3125},  --  NodeBox14
			{0,        -0.375,   0.4375,  0.0625,   0.5,      0.5},     --  NodeBox15
			{0,        -0.375,   0.25,    0.0625,   0.5,      0.3125},  --  NodeBox16
			{-0.125,   -0.375,   0.4375,  -0.0625,  0.5,      0.5},     --  NodeBox17
			{-0.125,   -0.375,   0.25,    -0.0625,  0.5,      0.3125},  --  NodeBox18
			{-0.25,    -0.375,   0.4375,  -0.1875,  0.5,      0.5},     --  NodeBox19
			{-0.25,    -0.375,   0.25,    -0.1875,  0.5,      0.3125},  --  NodeBox20
			{-0.375,   -0.375,   0.4375,  -0.3125,  0.5,      0.5},     --  NodeBox21
			{-0.375,   -0.375,   0.25,    -0.3125,  0.5,      0.3125},  --  NodeBox22
			{-0.4375,  -0.3125,  0.3125,  0.5,      -0.1875,  0.4375},  --  NodeBox23
			{0.375,    -0.375,   0.3125,  0.4375,   -0.125,   0.4375},  --  NodeBox24
			{0.25,     -0.375,   0.3125,  0.3125,   -0.125,   0.4375},  --  NodeBox25
			{0.125,    -0.375,   0.3125,  0.1875,   -0.125,   0.4375},  --  NodeBox26
			{0,        -0.375,   0.3125,  0.0625,   -0.125,   0.4375},  --  NodeBox27
			{-0.125,   -0.375,   0.3125,  -0.0625,  -0.125,   0.4375},  --  NodeBox28
			{-0.25,    -0.375,   0.3125,  -0.1875,  -0.125,   0.4375},  --  NodeBox29
			{-0.375,   -0.375,   0.3125,  -0.3125,  -0.125,   0.4375},  --  NodeBox30
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.4375, -0.375, 0.25, 0.5, 0.5, 0.5 }
	}
})

