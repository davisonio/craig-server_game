-- Various misc. nodes

local S = homedecor.gettext

minetest.register_node('homedecor:ceiling_paint', {
	description = S("Textured Ceiling Paint"),
	drawtype = 'signlike',
	tiles = { 'homedecor_ceiling_paint.png' },
	inventory_image = 'homedecor_ceiling_paint_roller.png',
	wield_image = 'homedecor_ceiling_paint_roller.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:ceiling_tile', {
	description = S("Drop-Ceiling Tile"),
	drawtype = 'signlike',
	tiles = { 'homedecor_ceiling_tile.png' },
	wield_image = 'homedecor_ceiling_tile.png',
	inventory_image = 'homedecor_ceiling_tile.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:rug_small', {
	description = S("Small Throw Rug"),
	drawtype = 'signlike',
	tiles = { 'homedecor_rug_small.png' },
	wield_image = 'homedecor_rug_small.png',
	inventory_image = 'homedecor_rug_small.png',
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:rug_large', {
	description = S("Large Area Rug"),
	drawtype = 'signlike',
	tiles = { 'homedecor_rug_large.png' },
	wield_image = 'homedecor_rug_large.png',
	inventory_image = 'homedecor_rug_large.png',
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
	})

local flower_pot_model = {
	type = "fixed",
	fixed = {
		{-0.1875, -0.5, -0.1875, 0.1875, -0.3125, 0.1875},
		{-0.25, -0.5, -0.0625, 0.25, -0.3125, 0.0625},
		{-0.0625, -0.5, -0.25, 0.0625, -0.25, 0.25},
		{-0.25, -0.3125, -0.25, 0.25, -0.125, 0.25},
		{-0.125, -0.3125, -0.3125, 0.125, -0.125, 0.3125},
		{-0.3125, -0.3125, -0.125, 0.3125, -0.125, 0.125},
		{-0.3125, -0.125, -0.25, 0.3125, 0.0625, 0.25},
		{-0.125, -0.125, -0.375, 0.125, 0.0625, 0.375},
		{-0.375, -0.125, -0.125, 0.375, 0.0625, 0.125},
		{-0.25, -0.125, -0.3125, 0.25, 0.0625, 0.3125},
		{-0.4375, 0.0625, -0.1875, 0.4375, 0.25, 0.1875},
		{-0.1875, 0.0625, -0.4375, 0.1875, 0.25, 0.4375},
		{-0.3125, 0.0625, -0.375, 0.3125, 0.25, 0.375},
		{-0.375, 0.0625, -0.3125, 0.375, 0.25, 0.3125},
		{-0.1875, 0.25, -0.5, 0.1875, 0.5, 0.5},
		{-0.5, 0.25, -0.1875, 0.5, 0.5, 0.1875},
		{-0.4375, 0.25, -0.3125, 0.4375, 0.5, 0.3125},
		{-0.3125, 0.25, -0.4375, 0.3125, 0.5, 0.4375},
		{-0.375, 0.25, -0.375, 0.375, 0.5, 0.375},
	}
}

minetest.register_node('homedecor:flower_pot_terracotta', {
	drawtype = "nodebox",
	description = S("Terracotta Flower Pot"),
	tiles = { 'homedecor_flower_pot_terracotta_top.png',
			'homedecor_flower_pot_terracotta_bottom.png',
			'homedecor_flower_pot_terracotta_sides.png',
			'homedecor_flower_pot_terracotta_sides.png',
			'homedecor_flower_pot_terracotta_sides.png',
			'homedecor_flower_pot_terracotta_sides.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	node_box = flower_pot_model,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:flower_pot_black', {
	drawtype = "nodebox",
	description = S("Black Plastic Flower Pot"),
	tiles = { 'homedecor_flower_pot_black_top.png',
			'homedecor_flower_pot_black_bottom.png',
			'homedecor_flower_pot_black_sides.png',
			'homedecor_flower_pot_black_sides.png',
			'homedecor_flower_pot_black_sides.png',
			'homedecor_flower_pot_black_sides.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	node_box = flower_pot_model,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:flower_pot_green', {
	drawtype = "nodebox",
	description = S("Green Plastic Flower Pot"),
	tiles = { 'homedecor_flower_pot_green_top.png',
			'homedecor_flower_pot_green_bottom.png',
			'homedecor_flower_pot_green_sides.png',
			'homedecor_flower_pot_green_sides.png',
			'homedecor_flower_pot_green_sides.png',
			'homedecor_flower_pot_green_sides.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	node_box = flower_pot_model,
	sounds = default.node_sound_leaves_defaults(),
})

-- cylinder-shaped objects courtesy Jeija

local cylbox = {}
local detail = 50
local sehne
local size = 0.2

for i = 1, detail-1 do
        sehne = math.sqrt(0.25 - (((i/detail)-0.5)^2))
        cylbox[i]={((i/detail)-0.5)*size, -0.5, -sehne*size, ((i/detail)+(1/detail)-0.5)*size, 0.5, sehne*size}
end

minetest.register_node("homedecor:pole_brass", {
    description = S("Brass Pole"),
    drawtype = "nodebox",
    tiles = {"homedecor_tile_brass2.png"},
    inventory_image = "homedecor_pole_brass2.png",
    wield_image = "homedecor_pole_brass2.png",
    paramtype = "light",
	paramtype2 = "facedir",
    is_ground_content = true,
    selection_box = {
            type = "fixed",
            fixed = {-size/2, -0.5, -size/2, size/2, 0.5, size/2},
    },
    groups = {snappy=3},
    sounds = default.node_sound_wood_defaults(),
	walkable = true,
	node_box = {
		type = "fixed",
		fixed = cylbox,
	}
})
	
minetest.register_node("homedecor:pole_wrought_iron", {
    description = S("Wrought Iron Pole"),
    drawtype = "nodebox",
    tiles = {"homedecor_tile_wrought_iron2.png"},
    inventory_image = "homedecor_pole_wrought_iron.png",
    wield_image = "homedecor_pole_wrought_iron.png",
    paramtype = "light",
	paramtype2 = "facedir",
    is_ground_content = true,
    selection_box = {
            type = "fixed",
            fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
    },
	node_box = {
		type = "fixed",
                fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
	},
    groups = {snappy=3},
    sounds = default.node_sound_wood_defaults(),
	walkable = true,
})

local welcome_mat_colors = { "green", "brown", "grey" }

for _, color in ipairs(welcome_mat_colors) do
	minetest.register_node("homedecor:welcome_mat_"..color, {
		description = "Welcome Mat ("..color..")",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		tiles = {
			"homedecor_welcome_mat_"..color..".png",
			"homedecor_welcome_mat_bottom.png",
			"homedecor_welcome_mat_"..color..".png",
		},
		groups = {crumbly=3},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name="default_grass_footstep", gain=0.25},
		}),
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.375, 0.5, -0.46875, 0.375 }
		}
	})
end

minetest.register_node("homedecor:chimney", {
	drawtype = "nodebox",
	paramtype = "light",
	description = "Chimney",
	tiles = {
		"homedecor_chimney_top.png",
		"homedecor_chimney_bottom.png",
		"homedecor_chimney_sides.png",
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, -0.1875},
			{-0.25, -0.5, 0.1875, 0.25, 0.5, 0.25},
			{-0.25, -0.5, -0.25, -0.1875, 0.5, 0.25},
			{0.1875, -0.5, -0.25, 0.25, 0.5, 0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 }
	},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("homedecor:fishtank", {
	drawtype = "nodebox",
	description = "Fishtank",
	tiles = {
		"homedecor_fishtank_top.png",
		"homedecor_fishtank_bottom.png",
		"homedecor_fishtank_right.png",
		"homedecor_fishtank_left.png",
		"homedecor_fishtank_back.png",
		"homedecor_fishtank_front.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,    -0.5,    -0.375,  0.5,    -0.4375, 0.375},
			{-0.4375, -0.4375, -0.3125, 0.4375,  0.1875, 0.3125},
			{-0.4375,  0.1875, -0.1875, 0.4375,  0.25,   0.1875},
			{-0.1875,  0.0625,  0.0625, 0.1875,  0.25,   0.375},
			{ 0.125,  -0.5,     0.25,   0.1875,  0.1875, 0.375},
			{-0.375,   0.25,   -0.125,  0.375,   0.3125, 0.125},
		}
	},
	use_texture_alpha = true,
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.375, 0.5, 0.3125, 0.375 }
	},
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
	on_rightclick = function(pos, node, clicker)
		fdir = minetest.get_node(pos).param2
		minetest.add_node(pos, {name = "homedecor:fishtank_lighted", param2 = fdir})
	end
})

minetest.register_node("homedecor:fishtank_lighted", {
	drawtype = "nodebox",
	description = "Fishtank",
	tiles = {
		"homedecor_fishtank_top.png",
		"homedecor_fishtank_bottom.png",
		"homedecor_fishtank_right_lighted.png",
		"homedecor_fishtank_left_lighted.png",
		"homedecor_fishtank_back_lighted.png",
		"homedecor_fishtank_front_lighted.png"
	},
	paramtype = "light",
	light_source = LIGHT_MAX-4,
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,    -0.5,    -0.375,  0.5,    -0.4375, 0.375},
			{-0.4375, -0.4375, -0.3125, 0.4375,  0.1875, 0.3125},
			{-0.4375,  0.1875, -0.1875, 0.4375,  0.25,   0.1875},
			{-0.1875,  0.0625,  0.0625, 0.1875,  0.25,   0.375},
			{ 0.125,  -0.5,     0.25,   0.1875,  0.1875, 0.375},
			{-0.375,   0.25,   -0.125,  0.375,   0.3125, 0.125},
		}
	},
	use_texture_alpha = true,
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.375, 0.5, 0.3125, 0.375 }
	},
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
	on_rightclick = function(pos, node, clicker)
		fdir = minetest.get_node(pos).param2
		minetest.add_node(pos, {name = "homedecor:fishtank", param2 = fdir})
	end
})

minetest.register_node('homedecor:cardboard_box', {
	drawtype = "nodebox",
	description = S("Cardboard box"),
	tiles = {
		'homedecor_cardboard_box_tb.png',
		'homedecor_cardboard_box_tb.png',
		'homedecor_cardboard_box_sides.png'
	},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
    selection_box = {
            type = "fixed",
            fixed = { -0.5, -0.5, -0.5, 0.5, 0, 0.5 }
    },
	node_box = {
		type = "fixed",
		fixed = {
			{0.1875, -0.5,    -0.25,    0.25,   0,       0.25},
			{-0.25,  -0.5,    -0.25,   -0.1875, 0,       0.25},
			{-0.25,  -0.5,     0.1875,  0.25,   0,       0.25},
			{-0.25,  -0.5,    -0.25,    0.25,   0,      -0.1875},
			{-0.25,  -0.5,    -0.25,    0.25,  -0.4375,  0.25},
			{0.1875, -0.0625, -0.25,    0.5,    0,       0.25},
			{-0.5,   -0.0625, -0.25,   -0.1875, 0,       0.25},
			{-0.25,  -0.0625,  0.1875,  0.25,   0,       0.5},
			{-0.25,  -0.0625, -0.5,     0.25,   0,      -0.1875},
		}
	},
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,6]"..
				"list[current_name;main;2,0;4,1;]"..
				"list[current_player;main;0,2;8,4;]")
		meta:set_string("infotext", S("Cardboard box"))
		local inv = meta:get_inventory()
		inv:set_size("main", 8)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", S("%s moves stuff in cardboard box at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s moves stuff to cardboard box at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s takes stuff from cardboard box at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
})

minetest.register_node("homedecor:dvd_cd_cabinet", {
	description = "DVD/CD cabinet",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"homedecor_dvdcd_cabinet_top.png",
		"homedecor_dvdcd_cabinet_bottom.png",
		"homedecor_dvdcd_cabinet_sides.png",
		"homedecor_dvdcd_cabinet_sides.png^[transformFX",
		"homedecor_dvdcd_cabinet_back.png",
		"homedecor_dvdcd_cabinet_front.png",
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, 0, 0.5, 0.5, 0.5},
			{-0.0625, -0.5, 0, 0.0625, 0.5, 0.5},
			{-0.5, 0.4375, 0, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, 0.0625, 0.5, 0.5, 0.4375},
			{-0.375, -0.5, 0.02756, -0.125, 0.5, 0.5},
			{0.125, -0.5, 0.01217, 0.375, 0.5, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0.5 }
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node('homedecor:filing_cabinet', {
	drawtype = "nodebox",
	description = S("Filing Cabinet"),
	tiles = {
		'homedecor_filing_cabinet_top.png',
		'homedecor_filing_cabinet_bottom.png',
		'homedecor_filing_cabinet_sides.png',
		'homedecor_filing_cabinet_sides.png^[transformFX',
		'homedecor_filing_cabinet_back.png',
		'homedecor_filing_cabinet_front.png'
	},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, -30/64,  8/16,  8/16,   8/16 },	-- main body
			{ -7/16, -7/16, -8/16,  7/16,  7/16,   8/16 },	-- drawer
		}
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,7]"..
				"list[current_name;main;0,0;8,2;]"..
				"list[current_player;main;0,3;8,4;]")
		meta:set_string("infotext", S("Filing cabinet"))
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", S("%s moves stuff in filing cabinet at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s moves stuff to filing cabinet at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s takes stuff from filing cabinet at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
})

minetest.register_node("homedecor:dishwasher", {
	description = "Dishwasher",
	drawtype = "nodebox",
	tiles = {
		"homedecor_dishwasher_top.png",
		"homedecor_dishwasher_bottom.png",
		"homedecor_dishwasher_sides.png",
		"homedecor_dishwasher_sides.png^[transformFX",
		"homedecor_dishwasher_back.png",
		"homedecor_dishwasher_front.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, 0.5, 0.1875, 0.1875},
			{-0.4375, -0.5, -0.5, 0.4375, 0.4375, 0.4375},
		}
	},
    selection_box = {
            type = "fixed",
            fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
    },
	groups = { snappy = 3 },
})

minetest.register_node("homedecor:dishwasher_wood", {
	description = "Dishwasher",
	tiles = {
		"homedecor_kitchen_cabinet_top.png",
		"homedecor_dishwasher_bottom.png",
		"homedecor_dishwasher_sides.png",
		"homedecor_dishwasher_sides.png^[transformFX",
		"homedecor_dishwasher_back.png",
		"homedecor_dishwasher_front.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 3 },
})

minetest.register_node("homedecor:dishwasher_steel", {
	description = "Dishwasher",
	tiles = {
		"homedecor_kitchen_cabinet_top_steel.png",
		"homedecor_dishwasher_bottom.png",
		"homedecor_dishwasher_sides.png",
		"homedecor_dishwasher_sides.png^[transformFX",
		"homedecor_dishwasher_back.png",
		"homedecor_dishwasher_front.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 3 },
})

minetest.register_node("homedecor:dishwasher_marble", {
	description = "Dishwasher",
	tiles = {
		"homedecor_kitchen_cabinet_top_marble.png",
		"homedecor_dishwasher_bottom.png",
		"homedecor_dishwasher_sides.png",
		"homedecor_dishwasher_sides.png^[transformFX",
		"homedecor_dishwasher_back.png",
		"homedecor_dishwasher_front.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 3 },
})

minetest.register_node("homedecor:dishwasher_granite", {
	description = "Dishwasher",
	tiles = {
		"homedecor_kitchen_cabinet_top_granite.png",
		"homedecor_dishwasher_bottom.png",
		"homedecor_dishwasher_sides.png",
		"homedecor_dishwasher_sides.png^[transformFX",
		"homedecor_dishwasher_back.png",
		"homedecor_dishwasher_front.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 3 },
})

-- doghouse and pool table, models contributed by jp

minetest.register_node("homedecor:doghouse_base", {
	tiles = {
		"homedecor_doghouse_base_top.png",
		"homedecor_doghouse_base_bottom.png",
		"homedecor_doghouse_base_side.png",
		"homedecor_doghouse_base_side.png",
		"homedecor_doghouse_base_back.png",
		"homedecor_doghouse_base_front.png"
	},
	description = "Doghouse",
	inventory_image = "homedecor_doghouse_inv.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.4375, 0.4375, -0.3125, -0.3125}, -- NodeBox1
			{0.3125, -0.5, 0.3125, 0.4375, -0.3125, 0.4375}, -- NodeBox2
			{-0.4375, -0.5, 0.3125, -0.3125, -0.3125, 0.4375}, -- NodeBox3
			{-0.4375, -0.5, -0.4375, -0.3125, -0.3125, -0.3125}, -- NodeBox4
			{-0.4375, -0.3125, -0.4375, -0.375, 0.5, 0.4375}, -- NodeBox5
			{-0.4375, 0.3125, -0.375, 0.4375, 0.5, -0.3125}, -- NodeBox6
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.25, 0.4375}, -- NodeBox7
			{-0.375, -0.3125, -0.375, -0.1875, 0.4375, -0.3125}, -- NodeBox8
			{0.1875, -0.3125, -0.375, 0.4375, 0.5, -0.3125}, -- NodeBox9
			{0.375, -0.25, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox10
			{-0.4375, -0.3125, 0.375, 0.4375, 0.5, 0.4375}, -- NodeBox11
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.0, 0.5 }
	},
	groups = {snappy=3},
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_vertically(itemstack, placer, pointed_thing,
				"homedecor:doghouse_base", "homedecor:doghouse_roof")
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local pos2 = { x = pos.x, y=pos.y + 1, z = pos.z }
		if minetest.get_node(pos2).name == "homedecor:doghouse_roof" then
			minetest.remove_node(pos2)
		end
	end
})

minetest.register_node("homedecor:doghouse_roof", {
	tiles = {
		"homedecor_doghouse_roof_top.png",
		"homedecor_doghouse_roof_bottom.png",
		"homedecor_doghouse_roof_side.png",
		"homedecor_doghouse_roof_side.png",
		"homedecor_doghouse_roof_back.png",
		"homedecor_doghouse_roof_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.4375, -0.4375, 0.5}, -- NodeBox17
			{-0.4375, -0.4375, -0.5, -0.375, -0.375, 0.5}, -- NodeBox18
			{-0.375, -0.375, -0.5, -0.3125, -0.3125, 0.5}, -- NodeBox19
			{-0.3125, -0.3125, -0.5, -0.25, -0.25, 0.5}, -- NodeBox20
			{-0.25, -0.25, -0.5, -0.1875, -0.1875, 0.5}, -- NodeBox21
			{-0.1875, -0.1875, -0.5, -0.125, -0.125, 0.5}, -- NodeBox22
			{-0.125, -0.125, -0.5, -0.0625, -0.0625, 0.5}, -- NodeBox23
			{-0.0625, -0.0625, -0.5, 0.0625, 0, 0.5}, -- NodeBox24
			{0.0625, -0.125, -0.5, 0.125, -0.0625, 0.5}, -- NodeBox25
			{0.125, -0.1875, -0.5, 0.1875, -0.125, 0.5}, -- NodeBox26
			{0.1875, -0.25, -0.5, 0.25, -0.1875, 0.5}, -- NodeBox27
			{0.25, -0.3125, -0.5, 0.3125, -0.25, 0.5}, -- NodeBox28
			{0.3125, -0.375, -0.5, 0.375, -0.3125, 0.5}, -- NodeBox29
			{0.375, -0.4375, -0.5, 0.4375, -0.375, 0.5}, -- NodeBox30
			{0.4375, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox31
			{-0.4375, -0.5, -0.375, 0.4375, -0.4375, 0.4375}, -- NodeBox32
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.4375}, -- NodeBox33
			{-0.3125, -0.375, -0.375, 0.3125, -0.3125, 0.4375}, -- NodeBox34
			{-0.25, -0.3125, -0.375, 0.25, -0.25, 0.4375}, -- NodeBox35
			{-0.1875, -0.25, -0.375, 0.1875, -0.1875, 0.4375}, -- NodeBox36
			{-0.125, -0.1875, -0.375, 0.125, -0.125, 0.4375}, -- NodeBox37
			{0.0625, -0.125, -0.375, -0.0625, -0.0625, 0.4375}, -- NodeBox38
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	},
	groups = {snappy=3, not_in_creative_inventory=1},
})

minetest.register_node("homedecor:pool_table", {
	tiles = {
		"homedecor_pool_table_top1.png",
		"homedecor_pool_table_bottom1.png",
		"homedecor_pool_table_sides1.png",
		"homedecor_pool_table_sides2.png",
		"homedecor_pool_table_end1.png",
		"homedecor_pool_table_end2.png"
	},
	description = "Pool Table",
	inventory_image = "homedecor_pool_table_inv.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375,   -0.5,     -0.375,   -0.25,    0.1875,   -0.25},    --  NodeBox1
			{0.25,     -0.5,     -0.375,   0.375,    0.1875,   -0.25},    --  NodeBox2
			{-0.25,    -0.125,   -0.3125,  0.25,     -0.0625,  0},        --  NodeBox3
			{-0.3125,  -0.0625,  -0.3125,  -0.25,    0.1875,   0},        --  NodeBox4
			{0.25,     -0.0625,  -0.3125,  0.3125,   0.1875,   0},        --  NodeBox5
			{-0.3125,  -0.125,   0,        0.3125,   0.1875,   0.0625},   --  NodeBox6
			{0.25,     -0.125,   -0.25,    0.3125,   0.1875,   0.5},      --  NodeBox7
			{-0.3125,  -0.125,   -0.25,    -0.25,    0.1875,   0.5},      --  NodeBox8
			{-0.5,     0.1875,   -0.5,     -0.4375,  0.25,     0.5},      --  NodeBox9
			{-0.5,     0.1875,   -0.5,     0.5,      0.25,     -0.4375},  --  NodeBox10
			{0.4375,   0.1875,   -0.5,     0.5,      0.25,     0.5},      --  NodeBox11
			{-0.3125,  0.1875,   -0.3125,  0.3125,   0.25,     0.5},      --  NodeBox12
			{-0.4375,  0.1875,   -0.3125,  0.4375,   0.25,     0.4375},   --  NodeBox13
			{-0.3125,  0.1875,   -0.5,     0.3125,   0.25,     -0.3125},  --  NodeBox14
			{-0.25,    -0.125,   -0.325,   0.25,     0,        -0.3125},  --  NodeBox15
			{0.25,     0.125,    -0.4375,  0.4375,   0.1875,   0.5},      --  NodeBox16
			{-0.4375,  0.125,    -0.4375,  -0.25,    0.1875,   0.5},      --  NodeBox17
			{-0.5,     0.25,     -0.5,     -0.4375,  0.3125,   0.5},      --  NodeBox18
			{-0.5,     0.25,     -0.5,     0.5,      0.3125,   -0.4375},  --  NodeBox19
			{0.4375,   0.25,     -0.5,     0.5,      0.3125,   0.5},      --  NodeBox20
			{-0.4375,  0.25,     -0.3125,  -0.375,   0.3125,   0.4375},   --  NodeBox23
			{-0.3125,  0.25,     -0.4375,  0.3125,   0.3125,   -0.375},   --  NodeBox24
			{0.375,    0.25,     -0.3125,  0.4375,   0.3125,   0.4375},   --  NodeBox25
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 0.3125, 1.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_sideways(itemstack, placer, pointed_thing,
			"homedecor:pool_table", "homedecor:pool_table_2", false)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local fdir = oldnode.param2
		if not fdir or fdir > 3 then return end
		local pos2 = { x = pos.x + homedecor.fdir_to_fwd[fdir+1][1], y=pos.y, z = pos.z + homedecor.fdir_to_fwd[fdir+1][2] }
		if minetest.get_node(pos2).name == "homedecor:pool_table_2" then
			minetest.remove_node(pos2)
		end
	end
})

minetest.register_node("homedecor:pool_table_2", {
	tiles = {
		"homedecor_pool_table_top2.png",
		"homedecor_pool_table_bottom2.png",
		"homedecor_pool_table_sides3.png",
		"homedecor_pool_table_sides4.png",
		"homedecor_pool_table_end3.png",
		"homedecor_pool_table_end4.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375,   -0.5,     0.25,     -0.25,    0.1875,   0.375},   --  NodeBox1
			{0.25,     -0.5,     0.25,     0.375,    0.1875,   0.375},   --  NodeBox2
			{-0.25,    -0.125,   0,        0.25,     -0.0625,  0.3125},  --  NodeBox3
			{-0.3125,  -0.0625,  0,        -0.25,    0.1875,   0.3125},  --  NodeBox4
			{0.25,     -0.0625,  0,        0.3125,   0.1875,   0.3125},  --  NodeBox5
			{-0.3125,  -0.125,   -0.0625,  0.3125,   0.1875,   0},       --  NodeBox6
			{0.25,     -0.125,   -0.5,     0.3125,   0.1875,   0.25},    --  NodeBox7
			{-0.3125,  -0.125,   -0.5,     -0.25,    0.1875,   0.25},    --  NodeBox8
			{-0.5,     0.1875,   -0.5,     -0.4375,  0.25,     0.5},     --  NodeBox9
			{-0.5,     0.1875,   0.4375,   0.5,      0.25,     0.5},     --  NodeBox10
			{0.4375,   0.1875,   -0.5,     0.5,      0.25,     0.5},     --  NodeBox11
			{-0.3125,  0.1875,   -0.5,     0.3125,   0.25,     0.3125},  --  NodeBox12
			{-0.4375,  0.1875,   -0.4375,  0.4375,   0.25,     0.3125},  --  NodeBox13
			{-0.3125,  0.1875,   0.3125,   0.3125,   0.25,     0.5},     --  NodeBox14
			{-0.25,    -0.125,   0.3125,   0.25,     0,        0.325},   --  NodeBox15
			{0.25,     0.125,    -0.5,     0.4375,   0.1875,   0.4375},  --  NodeBox16
			{-0.4375,  0.125,    -0.5,     -0.25,    0.1875,   0.4375},  --  NodeBox17
			{-0.5,     0.25,     -0.5,     -0.4375,  0.3125,   0.5},     --  NodeBox18
			{-0.5,     0.25,     0.4375,   0.5,      0.3125,   0.5},     --  NodeBox19
			{0.4375,   0.25,     -0.5,     0.5,      0.3125,   0.5},     --  NodeBox20
			{-0.4375,  0.25,     -0.4375,  -0.375,   0.3125,   0.3125},  --  NodeBox23
			{-0.3125,  0.25,     0.375,    0.3125,   0.3125,   0.4375},  --  NodeBox24
			{0.375,    0.25,     -0.4375,  0.4375,   0.3125,   0.3125},  --  NodeBox25
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	},
})

minetest.register_node("homedecor:trash_can", {
	tiles = {
		"homedecor_trashcan_tb.png",
		"homedecor_trashcan_tb.png",
		"homedecor_trashcan_sides.png",
		"homedecor_trashcan_sides.png",
		"homedecor_trashcan_sides.png",
		"homedecor_trashcan_sides.png"
	},
	inventory_image = "homedecor_trashcan_inv.png",
	description = "Trash Can",
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.125, -0.1875, 0.125, 0.125}, -- NodeBox1
			{0.1875, -0.5, -0.125, 0.25, 0.125, 0.125}, -- NodeBox2
			{-0.125, -0.5, -0.25, 0.125, 0.125, -0.1875}, -- NodeBox3
			{-0.125, -0.5, 0.1875, 0.125, 0.125, 0.25}, -- NodeBox4
			{-0.1875, -0.5, 0.125, -0.125, 0.125, 0.1875}, -- NodeBox5
			{-0.1875, -0.5, -0.1875, -0.125, 0.125, -0.125}, -- NodeBox6
			{0.125, -0.5, -0.1875, 0.1875, 0.125, -0.125}, -- NodeBox7
			{0.125, -0.5, 0.125, 0.1875, 0.125, 0.1875}, -- NodeBox8
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, -- NodeBox9
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0.125, 0.25 }
	}
})

minetest.register_node("homedecor:well_base", {
	tiles = {
		"homedecor_well_base_top.png",
		"default_cobble.png"
	},
	inventory_image = "homedecor_well_inv.png",
	description = "Water well",
	drawtype = "nodebox",
	paramtype = "light",
    paramtype2 = "facedir",
    groups = { snappy = 3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.4375, 0.3125, 0.5, -0.3125}, -- NodeBox1
			{0.3125, -0.5, -0.3125, 0.4375, 0.5, 0.3125}, -- NodeBox2
			{-0.4375, -0.5, -0.3125, -0.3125, 0.5, 0.3125}, -- NodeBox3
			{-0.3125, -0.5, 0.3125, 0.3125, 0.5, 0.4375}, -- NodeBox4
			{0.25, -0.5, -0.375, 0.375, 0.5, -0.25}, -- NodeBox5
			{0.25, -0.5, 0.25, 0.375, 0.5, 0.375}, -- NodeBox6
			{-0.375, -0.5, -0.375, -0.25, 0.5, -0.25}, -- NodeBox7
			{-0.375, -0.5, 0.25, -0.25, 0.5, 0.375}, -- NodeBox8
			{-0.3125, -0.5, -0.5, 0.3125, -0.3125, -0.4375}, -- NodeBox9
			{0.4375, -0.5, -0.3125, 0.5, -0.3125, 0.3125}, -- NodeBox10
			{-0.3125, -0.5, 0.4375, 0.3125, -0.3125, 0.5}, -- NodeBox11
			{-0.5, -0.5, -0.3125, -0.4375, -0.3125, 0.3125}, -- NodeBox12
			{0.3125, -0.5, -0.4375, 0.4375, -0.3125, -0.3125}, -- NodeBox13
			{0.3125, -0.5, 0.3125, 0.4375, -0.3125, 0.4375}, -- NodeBox14
			{-0.4375, -0.5, 0.3125, -0.3125, -0.3125, 0.4375}, -- NodeBox15
			{-0.4375, -0.5, -0.4375, -0.3125, -0.3125, -0.3125}, -- NodeBox16
			{-0.3125, -0.5, -0.3125, 0.3125, 0, 0.3125}, -- NodeBox17
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_vertically(itemstack, placer, pointed_thing,
			"homedecor:well_base", "homedecor:well_top")
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local pos2 = { x = pos.x, y=pos.y + 1, z = pos.z }
		if minetest.get_node(pos2).name == "homedecor:well_top" then
			minetest.remove_node(pos2)
		end
	end
})

minetest.register_node("homedecor:well_top", {
	tiles = {
		"homedecor_well_roof_top.png",
		"homedecor_well_roof_wood.png",
		"homedecor_well_roof_side3.png",
		"homedecor_well_roof_side3.png",
		"homedecor_well_roof_side2.png",
		"homedecor_well_roof_side1.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, 0.375, 0.0625, 0.4375, 0.4375}, -- NodeBox1
			{-0.0625, -0.5, -0.4375, 0.0625, 0.4375, -0.375}, -- NodeBox2
			{-0.125, 0.375, -0.5, 0.125, 0.4375, 0.5}, -- NodeBox3
			{0.125, 0.3125, -0.5, 0.1875, 0.375, 0.5}, -- NodeBox4
			{-0.1875, 0.3125, -0.5, -0.125, 0.375, 0.5}, -- NodeBox5
			{0.1875, 0.25, -0.5, 0.25, 0.3125, 0.5}, -- NodeBox6
			{-0.25, 0.25, -0.5, -0.1875, 0.3125, 0.5}, -- NodeBox7
			{0.25, 0.1875, -0.5, 0.3125, 0.25, 0.5}, -- NodeBox8
			{-0.3125, 0.1875, -0.5, -0.25, 0.25, 0.5}, -- NodeBox9
			{0.3125, 0.125, -0.5, 0.375, 0.1875, 0.5}, -- NodeBox10
			{-0.375, 0.125, -0.5, -0.3125, 0.1875, 0.5}, -- NodeBox11
			{0.375, 0.0625, -0.5, 0.4375, 0.125, 0.5}, -- NodeBox12
			{-0.375, 0.0625, -0.5, -0.4375, 0.125, 0.5}, -- NodeBox13
			{0.4375, 0, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox14
			{-0.5, 0, -0.5, -0.4375, 0.0625, 0.5}, -- NodeBox15
			{-0.0625, 0.4375, -0.5, 0.0625, 0.5, 0.5}, -- NodeBox16
			{-0.125, 0.125, -0.4375, 0.125, 0.1875, -0.375}, -- NodeBox17
			{0.125, 0.1875, -0.4375, 0.1875, 0.25, -0.375}, -- NodeBox18
			{-0.1875, 0.1875, -0.4375, -0.125, 0.25, -0.375}, -- NodeBox19
			{-0.125, 0.125, 0.375, 0.125, 0.1875, 0.4375}, -- NodeBox20
			{0.125, 0.1875, 0.375, 0.1875, 0.25, 0.4375}, -- NodeBox21
			{-0.1875, 0.1875, 0.375, -0.125, 0.25, 0.4375}, -- NodeBox22
			{-0.0165975, -0.159751, -0.375, 0.0165974, -0.125, 0.375}, -- NodeBox23
			{-0.00414942, -0.465, -0.008299, 0.008299, -0.159751, 0.004149}, -- NodeBox24
			{-0.0625, -0.0625, -0.5, 0.0625, 0, -0.4646}, -- NodeBox25
			{0.0625, -0.125, -0.5, 0.125, -0.0625, -0.4646}, -- NodeBox26
			{0.125, -0.25, -0.5, 0.1875, -0.125, -0.4646}, -- NodeBox27
			{0.0625, -0.3125, -0.5, 0.125, -0.25, -0.4646}, -- NodeBox28
			{-0.0625, -0.375, -0.5, 0.0625, -0.3125, -0.4646}, -- NodeBox29
			{-0.0625, -0.3125, -0.5, -0.125, -0.25, -0.4646}, -- NodeBox30
			{-0.1875, -0.25, -0.5, -0.125, -0.125, -0.4646}, -- NodeBox31
			{-0.125, -0.125, -0.5, -0.0625, -0.0625, -0.4646}, -- NodeBox32
			{-0.016598, -0.3125, -0.48, 0.020747, -0.0625, -0.49}, -- NodeBox33
			{-0.125, -0.209544, -0.48, 0.125, -0.172199, -0.49}, -- NodeBox34
                        {-0.0165975, -0.200, -0.477178, 0.020747, -0.175349, -0.435685}, -- NodeBox35
                        {0.1, -0.75, -0.125, 0.125, -0.5, 0.125}, -- NodeBox36
			{-0.125, -0.75, -0.125, -0.1, -0.5, 0.125}, -- NodeBox37
			{-0.125, -0.75, -0.125, 0.125, -0.729253, 0.125}, -- NodeBox38
			{-0.125, -0.75, -0.125, 0.125, -0.5, -0.1}, -- NodeBox39
			{-0.125, -0.75, 0.1, 0.125, -0.5, 0.125}, -- NodeBox40
			{-0.0165975,-0.465, -0.125, 0.0165974, -0.451245, 0.125}, -- NodeBox41
			{-0.0165975, -0.51, 0.112033, 0.0165974, -0.46, 0.125}, -- NodeBox42
			{-0.0165975, -0.51, -0.125, 0.0165974, -0.46, -0.112033}, -- NodeBox43
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	},
})

minetest.register_node("homedecor:coatrack_wallmount", {
	tiles = { "homedecor_coatrack_wood.png" },
	inventory_image = "homedecor_coatrack_wallmount_inv.png",
	description = "Coatrack (wallmounted)",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, 0, 0.4375, 0.375, 0.14, 0.5}, -- NodeBox1
			{-0.3025, 0.0475, 0.375, -0.26, 0.09, 0.4375}, -- NodeBox2
			{0.26, 0.0475, 0.375, 0.3025, 0.09, 0.4375}, -- NodeBox3
			{0.0725, 0.0475, 0.375, 0.115, 0.09, 0.4375}, -- NodeBox4
			{-0.115, 0.0475, 0.375, -0.0725, 0.09, 0.4375}, -- NodeBox5
			{0.24, 0.025, 0.352697, 0.3225, 0.115, 0.375}, -- NodeBox6
			{-0.3225, 0.025, 0.352697, -0.24, 0.115, 0.375}, -- NodeBox7
			{-0.135, 0.025, 0.352697, -0.0525, 0.115, 0.375}, -- NodeBox8
			{0.0525, 0.025, 0.352697, 0.135, 0.115, 0.375}, -- NodeBox9
		}
	},
})


minetest.register_node("homedecor:coat_tree", {
	tiles = { "homedecor_coatrack_wood.png" },
	description = "Coat tree",
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, 0, 0.0625, 1.5, 0.0625}, -- NodeBox1
			{-0.125, -0.5, -0.125, 0.1875, -0.4375, 0.1875}, -- NodeBox2
			{0.1875, -0.5, -0.0625, 0.22, -0.4375, 0.125}, -- NodeBox3
			{-0.0625, -0.5, 0.188, 0.125, -0.4375, 0.22}, -- NodeBox4
			{-0.16, -0.5, -0.0625, -0.125, -0.4375, 0.125}, -- NodeBox5
			{-0.0625, -0.5, -0.16, 0.125, -0.4375, -0.125}, -- NodeBox6
			{-0.25, 1.1875, 0, 0.3125, 1.25, 0.0625}, -- NodeBox7
			{0, 1.1875, -0.25, 0.0625, 1.25, 0.3125}, -- NodeBox8
			{-0.0207468, 1.4375, -0.0207468, 0.0829876, 1.5, 0.0829876}, -- NodeBox9
		}
	},
})

minetest.register_node("homedecor:doorbell", {
	tiles = { "homedecor_doorbell.png" },
	inventory_image = "homedecor_doorbell_inv.png",
	description = "Doorbell",
	drawtype = "nodebox",
	paramtype = "light",
    paramtype2 = "facedir",
    groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0, 0.46875, 0.0625, 0.1875, 0.5}, -- NodeBox1
			{-0.03125, 0.0625, 0.45, 0.03125, 0.125, 0.4675}, -- NodeBox2
		}
	},
	on_punch = function(pos, node, puncher, pointed_thing)
		minetest.sound_play("homedecor_doorbell", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 15
		}) 
	end
})

minetest.register_node("homedecor:kitchen_faucet", {
	tiles = { "homedecor_bright_metal.png" },
	inventory_image = "homedecor_kitchen_faucet_inv.png",
	description = "Kitchen Faucet",
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, 0.375, 0.0625, -0.1875, 0.4375}, -- NodeBox1
			{0, -0.1875, 0.352697, 0.0625, -0.147303, 0.4375}, -- NodeBox2
			{0, -0.109959, 0.319502, 0.0625, -0.147303, 0.406639}, -- NodeBox3
			{0.0070, -0.119556, 0.17, 0.0550,-0.109959, 0.1285}, -- NodeBox4
			{0, -0.109959, 0.125, 0.0625, -0.0726142, 0.352697}, -- NodeBox5
			{-0.06, -0.479253, 0.385892, 0.125, -0.454357, 0.427386}, -- NodeBox6
			{-0.06, -0.490701, 0.394191, 0.125, -0.444357, 0.419087}, -- NodeBox7
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.0625, -0.5, 0.125, 0.125, -0.0625, 0.4375 }
	},
})

minetest.register_node("homedecor:cutlery_set", {
	tiles = {
		"homedecor_cutlery_set_top.png",
		"homedecor_cutlery_set_bottom.png",
		"homedecor_cutlery_set_sides.png"
	},
	inventory_image = "homedecor_cutlery_set_inv.png",
	description = "Cutlery set",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.4375, 0.125, -0.49, -0.1875}, -- NodeBox1
			{0.035, -0.5, -0.12, 0.042, -0.375, -0.036}, -- NodeBox2
			{-0.042, -0.5, -0.12, -0.035, -0.375, -0.036}, -- NodeBox3
			{-0.042, -0.5, -0.12, 0.042, -0.375, -0.112}, -- NodeBox4
			{-0.042, -0.5, -0.044, 0.042, -0.375, -0.036}, -- NodeBox5
			{-0.042, -0.40, -0.12, 0.042, -0.5, -0.036}, -- NodeBox6
			{-0.22, -0.5, -0.45, -0.205, -0.49, -0.245}, -- NodeBox7
			{-0.23, -0.5, -0.245, -0.195, -0.49, -0.24}, -- NodeBox8
			{-0.23, -0.5, -0.24, -0.225, -0.49, -0.1875}, -- NodeBox9
			{-0.22, -0.5, -0.24, -0.215, -0.49, -0.1875}, -- NodeBox10
			{-0.21, -0.5, -0.24, -0.205, -0.49, -0.1875}, -- NodeBox11
			{-0.2, -0.5, -0.24, -0.195, -0.49, -0.1875}, -- NodeBox12
			{0.205, -0.5, -0.45, 0.22, -0.49, -0.3125}, -- NodeBox13
			{0.193, -0.5, -0.3125, 0.22, -0.49, -0.185839}, -- NodeBox14
			{0.2, -0.5, -0.322, 0.22, -0.49, -0.175}, -- NodeBox15
			{-0.1095, -0.5, -0.1875, 0.1095, -0.48, -0.172}, -- NodeBox16
			{-0.1095, -0.5, -0.453, 0.1095, -0.48, -0.4375}, -- NodeBox17
			{-0.14, -0.5, -0.422, -0.125, -0.48, -0.203}, -- NodeBox18
			{0.125, -0.5, -0.422, 0.14, -0.48, -0.203}, -- NodeBox19
			{-0.125, -0.5, -0.203, -0.1095, -0.48, -0.1875}, -- NodeBox20
			{0.1095, -0.5, -0.203, 0.125, -0.48, -0.1875}, -- NodeBox21
			{-0.125, -0.5, -0.4375, -0.1095, -0.48, -0.422}, -- NodeBox22
			{0.1095, -0.5, -0.4375, 0.125, -0.48, -0.422}, -- NodeBox23
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.5, 0.25, -0.375, 0 }
	}
})

minetest.register_node("homedecor:bottle_brown", {
	tiles = {
		"homedecor_bottle_brown_top.png",
		"homedecor_bottle_brown_sides.png"
	},
	inventory_image = "homedecor_bottle_brown_inv.png",
	description = "Brown bottle",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = true,
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.032, -0.50, -0.11, 0.032, -0.3, -0.046}, -- NodeBox1
			{-0.016, -0.30, -0.094, 0.016, -0.2, -0.062}, -- NodeBox2
		}
	}
})

minetest.register_node("homedecor:bottle_green", {
	tiles = {
		"homedecor_bottle_green_top.png",
		"homedecor_bottle_green_sides.png"
	},
	inventory_image = "homedecor_bottle_green_inv.png",
	description = "Green bottle",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = true,
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.032, -0.50, -0.11, 0.032, -0.3, -0.046}, -- NodeBox1
			{-0.016, -0.30, -0.094, 0.016, -0.2, -0.062}, -- NodeBox2
		}
	}
})

minetest.register_node("homedecor:coffee_maker", {
	tiles = {
		"homedecor_coffeemaker_top.png",
		"homedecor_coffeemaker_bottom.png",
		"homedecor_coffeemaker_right.png",
		"homedecor_coffeemaker_left.png",
		"homedecor_coffeemaker_back.png",
		"homedecor_coffeemaker_front.png"
	},
	description = "Coffee Maker",
	inventory_image = "homedecor_coffeemaker_inv.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{0.0625, -0.5, -0.025, 0.375, -0.375, 0.5}, -- NodeBox1
			{0.0625, -0.375, 0.3125, 0.375, 0, 0.5}, -- NodeBox2
			{0.0625, -0.052, 0.02, 0.375, 0.19, 0.5}, -- NodeBox3
			{0.078, -0.375, 0, 0.36, -0.0625, 0.3125}, -- NodeBox4
			{0.1875, -0.098, -0.0525, 0.25, -0.078, 0}, -- NodeBox5
			{0.1875, -0.36, -0.090, 0.25, -0.078, -0.0525}, -- NodeBox6
			{0.1875, -0.36, -0.0525, 0.25, -0.34, 0}, -- NodeBox7
			{-0.1875, -0.5, -0.3125, -0.1, -0.4, -0.225}, -- NodeBox8
			{-0.1975, -0.5, -0.3225, -0.1, -0.375, -0.3125}, -- NodeBox9
			{-0.1975, -0.5, -0.235, -0.1, -0.375, -0.225}, -- NodeBox10
			{-0.1975, -0.5, -0.3225, -0.1875, -0.375, -0.225}, -- NodeBox11
			{-0.11, -0.5, -0.3225, -0.1, -0.375, -0.225}, -- NodeBox12
			{-0.1, -0.485, -0.2838, -0.06, -0.475, -0.2638}, -- NodeBox13
			{-0.1, -0.4, -0.2838, -0.06, -0.39, -0.2638}, -- NodeBox14
			{-0.075, -0.485, -0.2838, -0.06, -0.39, -0.2638}, -- NodeBox15
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.22, -0.5, -0.35, 0.4, 0.21, 0.5 }
	}
})

minetest.register_node("homedecor:dartboard", {
	description = "Dartboard",
	drawtype = "signlike",
	tiles = {"homedecor_dartboard.png"},
	inventory_image = "homedecor_dartboard.png",
	wield_image = "homedecor_dartboard.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("homedecor:piano_left", {
	tiles = {
		"homedecor_piano_top_left.png",
		"homedecor_piano_sides.png",
		"homedecor_piano_sides.png",
		"homedecor_piano_sides.png",
		"homedecor_piano_sides.png",
		"homedecor_piano_front_left.png",
	},
	inventory_image = "homedecor_piano_inv.png",
	description = "Piano",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
        groups = { snappy = 3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.1875, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.0625, -0.125, -0.4375, 0.25, 0.1875}, -- NodeBox2
			{-0.5, -0.5, -0.125, -0.4375, -0.375, 0.1875}, -- NodeBox3
			{-0.5, -0.375, -0.0625, -0.4375, 0.0625, 0}, -- NodeBox4
			{-0.5, 0.0625, -0.0625, 0.5, 0.1875, 0.1875}, -- NodeBox5
			{-0.4375, 0.1875, 0.15, 0.5, 0.4375, 0.1875}, -- NodeBox6
			{0.3594, -0.5, 0, 0.4062, -0.46875, 0.25}, -- left-most pedal
			{0.4844, -0.5, 0, 0.5, -0.46875, 0.25}, -- half of center pedal
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.125, 1.5, 0.5, 0.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_sideways(itemstack, placer, pointed_thing,
			"homedecor:piano_left", "homedecor:piano_right", true)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local fdir = oldnode.param2
		if not fdir or fdir > 3 then return end
		local pos2 = { x = pos.x + homedecor.fdir_to_right[fdir+1][1], y=pos.y, z = pos.z + homedecor.fdir_to_right[fdir+1][2] }
		if minetest.get_node(pos2).name == "homedecor:piano_right" then
			minetest.remove_node(pos2)
		end
	end
})

minetest.register_node("homedecor:piano_right", {
	tiles = {
		"homedecor_piano_top_right.png",
		"homedecor_piano_sides.png",
		"homedecor_piano_sides.png",
		"homedecor_piano_sides.png",
		"homedecor_piano_sides.png",
		"homedecor_piano_front_right.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
        groups = { snappy = 3, not_in_creative_inventory=1 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.1875, 0.5, 0.5, 0.5}, -- NodeBox1
			{0.4375, -0.5, -0.125, 0.5, -0.375, 0.1875}, -- NodeBox2
			{0.4375, 0.0625, -0.125, 0.5, 0.25, 0.1875}, -- NodeBox3
			{0.4375, -0.375, -0.0625, 0.5, 0.0625, 0}, -- NodeBox4
			{-0.5, 0.0625, -0.0625, 0.4375, 0.1875, 0.1875}, -- NodeBox5
			{-0.5, 0.1875, 0.15, 0.4375, 0.4375, 0.1875}, -- NodeBox6
			{-0.5, -0.5, 0, -0.4688, -0.46875, 0.25}, -- half of center pedal
			{-0.3905, -0.5, 0, -0.3438, -0.46875, 0.25}, -- right-most pedal

		}
	},
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	}
})

minetest.register_node("homedecor:toaster", {
        description = "Toaster",
	tiles = {
		"homedecor_toaster_top.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png"
	},
	inventory_image = "homedecor_toaster_inv.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = { snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.125, 0.125, -0.3125, 0.125}, -- NodeBox1
		},
	},
	on_rightclick = function(pos, node, clicker)
		local fdir = node.param2
		minetest.set_node(pos, { name = "homedecor:toaster_loaf", param2 = fdir })
		minetest.sound_play("toaster", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5
		})
	end
})

minetest.register_node("homedecor:toaster_loaf", {
	tiles = {
		"homedecor_toaster_toploaf.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = { snappy=3, not_in_creative_inventory=1 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.125, 0.125, -0.3125, 0.125}, -- NodeBox1
			{-0.03125, -0.3125, -0.0935, 0, -0.25, 0.0935}, -- NodeBox2
			{0.0625, -0.3125, -0.0935, 0.0935, -0.25, 0.0935}, -- NodeBox3
		},
	},
	on_rightclick = function(pos, node, clicker)
		local fdir = node.param2
		minetest.set_node(pos, { name = "homedecor:toaster", param2 = fdir })
	end,
	drop = "homedecor:toaster"
})

-- convert old pool tables into newer model

minetest.register_abm({
	nodenames = { "homedecor:pool_table2" },
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local swap_fdir = { 2, 3, 0, 1 }
		local fdir = swap_fdir[node.param2+1]
		minetest.set_node(pos, {name = "homedecor:pool_table_2", param2 = fdir})
	end
})


