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

minetest.register_node('homedecor:flower_pot_terracotta', {
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
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:flower_pot_black', {
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
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:flower_pot_green', {
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

--

local curtaincolors = {
	"red",
	"green",
	"blue",
	"white",
	"pink",
	"violet"
}

for c in ipairs(curtaincolors) do
	local color = curtaincolors[c]
	local color_d = S(curtaincolors[c])

	minetest.register_node("homedecor:curtain_"..color, {
		description = S("Curtains (%s)"):format(color_d),
		tiles = { "homedecor_curtain_"..color..".png" },
		inventory_image = "homedecor_curtain_"..color..".png",
		wield_image = "homedecor_curtain_"..color..".png",
		drawtype = 'signlike',
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		groups = { snappy = 3 },
		sounds = default.node_sound_leaves_defaults(),
		paramtype2 = 'wallmounted',
		selection_box = {
			type = "wallmounted",
			--wall_side = = <default>
		},
	})
	if color_d ~= color then
		minetest.register_alias("homedecor:curtain_"..color_d, "homedecor:curtain_"..color)
	end
end

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
