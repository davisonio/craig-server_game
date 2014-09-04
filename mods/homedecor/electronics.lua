-- Various home electronics

local S = homedecor.gettext

minetest.register_node('homedecor:speaker', {
	description = S("Large Stereo Speaker"),
	tiles = { 'homedecor_speaker_top.png',
			'homedecor_speaker_bottom.png',
			'homedecor_speaker_right.png',
			'homedecor_speaker_left.png',
			'homedecor_speaker_back.png',
			'homedecor_speaker_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:speaker_small', {
	description = S("Small Surround Speaker"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_speaker_top.png',
		'homedecor_speaker_bottom.png',
		'homedecor_speaker_right.png',
		'homedecor_speaker_left.png',
		'homedecor_speaker_back.png',
		'homedecor_speaker_front.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.2, -0.5, 0, 0.2, 0, 0.4 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.2, -0.5, 0, 0.2, 0, 0.4 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:stereo', {
	description = S("Stereo Receiver"),
	tiles = { 'homedecor_stereo_top.png',
			'homedecor_stereo_bottom.png',
			'homedecor_stereo_right.png',
			'homedecor_stereo_left.png',
			'homedecor_stereo_back.png',
			'homedecor_stereo_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:projection_screen', {
	description = S("Projection Screen Material"),
	drawtype = 'signlike',
	tiles = { 'homedecor_projection_screen.png' },
	wield_image = 'homedecor_projection_screen_inv.png',
	inventory_image = 'homedecor_projection_screen_inv.png',
	sunlight_propagates = false,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:television', {
	description = S("Small CRT Television"),
	tiles = { 'homedecor_television_top.png',
		  'homedecor_television_bottom.png',
		  'homedecor_television_right.png',
		  'homedecor_television_left.png',
		  'homedecor_television_back.png',
		   { name="homedecor_television_front_animated.png",
			  animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=80.0
		          }
		   }
	},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	light_source = LIGHT_MAX - 1,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("homedecor:dvd_vcr", {
	description = S("DVD and VCR"),
	drawtype = "nodebox",
	tiles = {
		"homedecor_dvdvcr_top.png",
		"homedecor_dvdvcr_bottom.png",
		"homedecor_dvdvcr_sides.png",
		"homedecor_dvdvcr_sides.png^[transformFX",
		"homedecor_dvdvcr_back.png",
		"homedecor_dvdvcr_front.png",
	},
	inventory_image = "homedecor_dvdvcr_inv.png",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.25, 0.3125, -0.375, 0.1875},
			{-0.25, -0.5, -0.25, 0.25, -0.1875, 0.125},
		}
	},
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("homedecor:telephone", {
	tiles = {
		"homedecor_telephone_top.png",
		"homedecor_telephone_bottom.png",
		"homedecor_telephone_sides.png",
		"homedecor_telephone_sides.png",
		"homedecor_telephone_sides.png",
		"homedecor_telephone_sides.png"
	},
	inventory_image = "homedecor_telephone_inv.png",
	description = "Telephone",
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875,     -0.5,       -0.1875,     0.1875,     -0.4375,    0.1875},      --  NodeBox1
			{-0.125,      -0.5,       -0.130,      0.125,      -0.375,     0.1875},      --  NodeBox2
			{-0.0625,     -0.5,       -0.0625,     0.0625,     -0.3125,    0.1875},      --  NodeBox3
			{0.0331951,   -0.375,     0,           0.0625,     -0.223757,  0.125},       --  NodeBox4
			{-0.0625,     -0.375,     0,           -0.033195,  -0.223757,  0.125},       --  NodeBox5
			{-0.207469,   -0.25,      0.0374656,   0.207469,   -0.1875,    0.0873276},   --  NodeBox6
			{0.125,       -0.3125,    0,           0.25,       -0.25,      0.125},       --  NodeBox7
			{-0.25,       -0.3125,    0,           -0.125,     -0.25,      0.125},       --  NodeBox8
			{-0.0912863,  -0.5,       -0.0955001,  0.0995851,  -0.339779,  0.1875},      --  NodeBox9
			{-0.157676,   -0.5,       -0.161983,   0.157676,   -0.406077,  0.1875},      --  NodeBox10
			{0.124481,    -0.290055,  0.0208449,   0.232365,   -0.21547,   0.103948},    --  NodeBox11
			{-0.232365,   -0.290055,  0.0208449,   -0.124481,  -0.21547,   0.103948},    --  NodeBox12
			{-0.174274,   -0.472376,  -0.174604,   0.174274,   -0.422652,  0.187541},    --  NodeBox13
			{-0.141079,   -0.430939,  -0.145079,   0.141079,   -0.389503,  0.187521},    --  NodeBox14
			{-0.107884,   -0.389503,  -0.114121,   0.112183,   -0.356354,  0.187552},    --  NodeBox15
			{-0.0756888,  -0.344917,  0.187571,    0.085884,   -0.321492,  -0.0793901},  --  NodeBox16
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.1875, 0.25, -0.1875, 0.1875 }
	}
})

