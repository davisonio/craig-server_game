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

