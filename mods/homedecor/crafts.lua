-- Crafting for homedecor mod (includes folding) by Vanessa Ezekowitz
-- 2012-06-12
--
-- Mostly my own code; overall template borrowed from game default
--
-- License: GPL
--

local S = homedecor.gettext

-- misc stuff :D

minetest.register_craftitem("homedecor:terracotta_base", {
        description = S("Uncooked Terracotta Base"),
        inventory_image = "homedecor_terracotta_base.png",
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:terracotta_base 8",
        recipe = {
		"default:dirt",
		"default:clay_lump",
		"bucket:bucket_water"
        },
	replacements = { {"bucket:bucket_water", "bucket:bucket_empty"}, },
})

minetest.register_craftitem("homedecor:roof_tile_terracotta", {
        description = S("Terracotta Roof Tile"),
        inventory_image = "homedecor_roof_tile_terracotta.png",
})

minetest.register_craft({
        type = "cooking",
        output = "homedecor:roof_tile_terracotta",
        recipe = "homedecor:terracotta_base",
})

minetest.register_craft( {
        output = "homedecor:shingles_terracotta",
        recipe = {
                { "homedecor:roof_tile_terracotta", "homedecor:roof_tile_terracotta"},
                { "homedecor:roof_tile_terracotta", "homedecor:roof_tile_terracotta"},
        },
})

minetest.register_craft( {
        output = "homedecor:roof_tile_terracotta 8",
        recipe = {
			{ "homedecor:shingles_terracotta", "homedecor:shingles_terracotta" }
		}
})

minetest.register_craft( {
        output = "homedecor:flower_pot_terracotta",
        recipe = {
                { "homedecor:roof_tile_terracotta", "default:dirt", "homedecor:roof_tile_terracotta" },
                { "homedecor:roof_tile_terracotta", "homedecor:roof_tile_terracotta", "homedecor:roof_tile_terracotta" },
        },
})

--

minetest.register_craftitem("homedecor:plastic_sheeting", {
        description = S("Plastic sheet"),
        inventory_image = "homedecor_plastic_sheeting.png",
})

minetest.register_craftitem("homedecor:plastic_base", {
        description = S("Unprocessed Plastic base"),
        wield_image = "homedecor_plastic_base.png",
        inventory_image = "homedecor_plastic_base_inv.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "homedecor:plastic_base 4",
    recipe = {
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves"
	}
})

minetest.register_craft({
        type = "cooking",
        output = "homedecor:plastic_sheeting",
        recipe = "homedecor:plastic_base",
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:plastic_base",
        burntime = 30,
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:plastic_sheeting",
        burntime = 30,
})

minetest.register_craft( {
        output = "homedecor:flower_pot_green",
        recipe = {
                { "", "dye:dark_green", "" },
                { "homedecor:plastic_sheeting", "default:dirt", "homedecor:plastic_sheeting" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

minetest.register_craft( {
        output = "homedecor:flower_pot_black",
        recipe = {
                { "dye:black", "dye:black", "dye:black" },
                { "homedecor:plastic_sheeting", "default:dirt", "homedecor:plastic_sheeting" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

--

minetest.register_craft( {
        output = "homedecor:projection_screen 3",
        recipe = {
		{ "", "default:glass", "" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:projection_screen",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:ceiling_paint 20",
        recipe = {
                "dye:white",
                "dye:white",
                "default:sand",
		"bucket:bucket_water",
        },
	replacements = { { "bucket:bucket_water","bucket:bucket_empty" } }
})

minetest.register_craft( {
        output = "homedecor:ceiling_tile 10",
        recipe = {
                { "", "dye:white", "" },
                { "default:steel_ingot", "default:stone", "default:steel_ingot" },

        },
})


-- =======================================================
--  Items/recipes not requiring smelting of anything new

minetest.register_craft( {
        output = "homedecor:glass_table_small_round 15",
        recipe = {
                { "", "default:glass", "" },
                { "default:glass", "default:glass", "default:glass" },
                { "", "default:glass", "" },
        },
})

minetest.register_craft( {
        output = "homedecor:glass_table_small_square 4",
        recipe = {
		{"homedecor:glass_table_small_round", "homedecor:glass_table_small_round" },
		{"homedecor:glass_table_small_round", "homedecor:glass_table_small_round" }
	}
})

minetest.register_craft( {
        output = "homedecor:glass_table_large 4",
        recipe = { 
		{ "homedecor:glass_table_small_square", "homedecor:glass_table_small_square" },
		{ "homedecor:glass_table_small_square", "homedecor:glass_table_small_square" }
	}
})

--

minetest.register_craft( {
        output = "homedecor:wood_table_small_round 15",
        recipe = {
                { "", "group:wood", "" },
                { "group:wood", "group:wood", "group:wood" },
                { "", "group:wood", "" },
        },
})

minetest.register_craft( {
        output = "homedecor:wood_table_small_square 4",
        recipe = { 
		{ "homedecor:wood_table_small_round","homedecor:wood_table_small_round" },
		{ "homedecor:wood_table_small_round","homedecor:wood_table_small_round" }
	}
})

minetest.register_craft( {
        output = "homedecor:wood_table_large 4",
        recipe = { 
		{ "homedecor:wood_table_small_square", "homedecor:wood_table_small_square" },
		{ "homedecor:wood_table_small_square", "homedecor:wood_table_small_square" }
	}
})

--

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:wood_table_small_round",
        burntime = 30,
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:wood_table_small_square",
        burntime = 30,
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:wood_table_large",
        burntime = 30,
})

--

minetest.register_craft( {
        output = "homedecor:shingles_asphalt 6",
        recipe = {
                { "default:gravel", "dye:black", "default:gravel" },
                { "default:sand", "dye:black", "default:sand" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

--

minetest.register_craft( {
        output = "homedecor:shingles_wood 12",
        recipe = {
                { "default:stick", "group:wood"},
                { "group:wood", "default:stick"},
        },
})

minetest.register_craft( {
        output = "homedecor:shingles_wood 12",
        recipe = {
                { "group:wood", "default:stick"},
                { "default:stick", "group:wood"},
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shingles_wood",
        burntime = 30,
})

--

minetest.register_craft( {
        output = "homedecor:skylight 9",
        recipe = { 
		{ "default:glass", "default:glass" },
		{ "default:glass", "default:glass" },
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:skylight",
        recipe = { "homedecor:skylight_frosted" },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:skylight_frosted",
        recipe = { "homedecor:skylight" },
})

-- Various colors of shutters

minetest.register_craft( {
        output = "homedecor:shutter_oak 2",
        recipe = {
		{ "default:stick", "default:stick" },
		{ "default:stick", "default:stick" },
		{ "default:stick", "default:stick" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_oak",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_black 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:black"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_black",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_dark_grey 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:dark_grey"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_dark_grey",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_grey 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:grey"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_grey",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_white 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:white"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_white",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_mahogany 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:brown"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_mahogany",
       	burntime = 30,
})
minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_red 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:red"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_red",
       	burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_yellow 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:yellow"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_yellow",
       	burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_forest_green 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:dark_green"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_forest_green",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_light_blue 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"unifieddyes:light_blue"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_light_blue",
       	burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_violet 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:violet"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_violet",
       	burntime = 30,
})

--

minetest.register_craftitem("homedecor:drawer_small", {
        description = S("Small Wooden Drawer"),
        inventory_image = "homedecor_drawer_small.png",
})


minetest.register_craft( {
        output = "homedecor:drawer_small",
        recipe = {
                { "group:wood", "default:steel_ingot", "group:wood" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:drawer_small",
        burntime = 30,
})

--

minetest.register_craft( {
        output = "homedecor:nightstand_oak_one_drawer",
        recipe = {
                { "homedecor:drawer_small" },
                { "group:wood" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:nightstand_oak_one_drawer",
        burntime = 30,
})

minetest.register_craft( {
        output = "homedecor:nightstand_oak_two_drawers",
        recipe = {
                { "homedecor:drawer_small" },
                { "homedecor:drawer_small" },
                { "group:wood" },
        },
})

minetest.register_craft( {
        output = "homedecor:nightstand_oak_two_drawers",
        recipe = {
                { "homedecor:nightstand_oak_one_drawer" },
                { "homedecor:drawer_small" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:nightstand_oak_two_drawers",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:nightstand_mahogany_one_drawer",
        recipe = {
                "homedecor:nightstand_oak_one_drawer",
                "dye:brown",
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:nightstand_mahogany_one_drawer",
        burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:nightstand_mahogany_two_drawers",
        recipe = {
                "homedecor:nightstand_oak_two_drawers",
                "dye:brown",
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:nightstand_mahogany_two_drawers",
        burntime = 30,
})

minetest.register_craftitem("homedecor:brass_ingot", {
        description = S("Brass Ingot"),
        inventory_image = "homedecor_brass_ingot.png",
	groups = { brass_ingot=1 }
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:brass_ingot 2",
	recipe = {
		"moreores:silver_ingot",
		"default:copper_ingot",
	},
})

-- Table legs

minetest.register_craft( {
        output = "homedecor:table_legs_wrought_iron 3",
        recipe = {
                { "", "default:iron_lump", "" },
                { "", "default:iron_lump", "" },
                { "default:iron_lump", "default:iron_lump", "default:iron_lump" },
        },
})

minetest.register_craft( {
        output = "homedecor:table_legs_brass 3",
	recipe = {
		{ "", "group:brass_ingot", "" },
		{ "", "group:brass_ingot", "" },
		{ "group:brass_ingot", "group:brass_ingot", "group:brass_ingot" }
	},
})

minetest.register_craft( {
        output = "homedecor:utility_table_legs",
        recipe = {
                { "default:stick", "default:stick", "default:stick" },
                { "default:stick", "", "default:stick" },
                { "default:stick", "", "default:stick" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:utility_table_legs",
        burntime = 30,
})

-- vertical poles/lampposts

minetest.register_craft( {
        output = "homedecor:pole_brass 4",
	recipe = {
		{ "", "group:brass_ingot", "" },
		{ "", "group:brass_ingot", "" },
		{ "", "group:brass_ingot", "" }
	},
})

minetest.register_craft( {
        output = "homedecor:pole_wrought_iron 4",
        recipe = {
                { "default:iron_lump", },
                { "default:iron_lump", },
                { "default:iron_lump", },
        },
})

-- Home electronics

if ( minetest.get_modpath("mesecons") ) == nil then

	minetest.register_craftitem(":mesecons_materials:silicon", {
		description = S("Silicon lump"),
		inventory_image = "homedecor_silicon.png",
	})

	minetest.register_craft( {
		output = "mesecons_materials:silicon 4",
		recipe = {
			{ "default:sand", "default:sand" },
			{ "default:sand", "default:steel_ingot" },
		},
	})

end

minetest.register_craft( {
	output = "homedecor:ic 4",
	recipe = {
		{ "mesecons_materials:silicon", "mesecons_materials:silicon" },
		{ "mesecons_materials:silicon", "default:copper_ingot" },
	},
})

minetest.register_craftitem("homedecor:ic", {
	description = S("Simple Integrated Circuit"),
	inventory_image = "homedecor_ic.png",
})

minetest.register_craft( {
	output = "homedecor:television",
	recipe = {
		{ "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "moreblocks:glow_glass", "homedecor:plastic_sheeting" },
		{ "homedecor:ic", "homedecor:ic", "homedecor:ic" },
	},
})

minetest.register_craft( {
	output = "homedecor:stereo",
	recipe = {
		{ "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "homedecor:ic", "homedecor:plastic_sheeting" },
		{ "default:steel_ingot", "homedecor:ic", "default:steel_ingot" },
	},
})

-- ===========================================================
-- Recipes that require materials from wool (cotton alternate)

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:rug_small 8",
       	recipe = {
       		"wool:red",
		"wool:yellow",
		"wool:blue",
		"wool:black"
	},
})

-- cotton version:

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:rug_small 8",
       	recipe = {
       		"cotton:red",
		"cotton:yellow",
		"cotton:blue",
		"cotton:black"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:rug_small",
       	burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:rug_large 2",
       	recipe = {
		"homedecor:rug_small",
		"homedecor:rug_small",
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:rug_large",
       	burntime = 30,
})

-- =====================================
-- Speakers require copper from moreores

minetest.register_craft( {
        output = "homedecor:speaker",
      		recipe = {
		{ "group:wood", "wool:black", "group:wood" },
		{ "group:wood", "default:copper_ingot", "group:wood" },
		{ "group:wood", "wool:black", "group:wood" },
	},
})

minetest.register_craft( {
        output = "homedecor:speaker_small",
      		recipe = {
		{ "group:wood", "wool:black", "group:wood" },
		{ "group:wood", "default:copper_ingot", "group:wood" },
	},
})

-- cotton version

minetest.register_craft( {
        output = "homedecor:speaker",
      		recipe = {
		{ "group:wood", "cotton:black", "group:wood" },
		{ "group:wood", "default:copper_ingot", "group:wood" },
		{ "group:wood", "cotton:black", "group:wood" },
	},
})

minetest.register_craft( {
        output = "homedecor:speaker_small",
      		recipe = {
		{ "group:wood", "cotton:black", "group:wood" },
		{ "group:wood", "default:copper_ingot", "group:wood" },
	},
})

-- Curtains

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
	minetest.register_craft( {
		output = "homedecor:curtain_"..color.." 3",
	      		recipe = {
			{ "wool:"..color, "", ""},
			{ "wool:"..color, "", ""},
			{ "wool:"..color, "", ""},
		},
	})
end


-- Recycling recipes

-- Some glass objects recycle via the glass fragments item/recipe in the Vessels mod.

minetest.register_craft({
        type = "shapeless",
        output = "vessels:glass_fragments",
        recipe = {
		"homedecor:glass_table_small_round",
		"homedecor:glass_table_small_round",
		"homedecor:glass_table_small_round"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "vessels:glass_fragments",
        recipe = {
		"homedecor:glass_table_small_square",
		"homedecor:glass_table_small_square",
		"homedecor:glass_table_small_square"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "vessels:glass_fragments",
        recipe = {
		"homedecor:glass_table_large",
		"homedecor:glass_table_large",
		"homedecor:glass_table_large"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "vessels:glass_fragments",
        recipe = {
		"homedecor:skylight",
		"homedecor:skylight",
		"homedecor:skylight",
	}
})

-- Wooden tabletops can turn into sticks

minetest.register_craft({
        type = "shapeless",
        output = "default:stick 4",
        recipe = {
		"homedecor:wood_table_small_round",
		"homedecor:wood_table_small_round",
		"homedecor:wood_table_small_round"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "default:stick 4",
        recipe = {
		"homedecor:wood_table_small_square",
		"homedecor:wood_table_small_square",
		"homedecor:wood_table_small_square"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "default:stick 4",
        recipe = {
		"homedecor:wood_table_large",
		"homedecor:wood_table_large",
		"homedecor:wood_table_large"
	}
})

-- Kitchen stuff

minetest.register_craft({
        output = "homedecor:oven",
        recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "moreblocks:iron_glass", "default:steel_ingot", },
		{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot", },
	}
})

minetest.register_craft({
        output = "homedecor:microwave_oven 2",
        recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "moreblocks:iron_glass", "mesecons_materials:silicon", },
		{"default:steel_ingot", "default:copper_ingot", "default:mese_crystal", },
	}
})

minetest.register_craft({
        output = "homedecor:refrigerator",
        recipe = {
		{"default:steel_ingot", "moreblocks:glow_glass", "default:steel_ingot", },
		{"default:steel_ingot", "moreores:tin_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "default:clay", "default:steel_ingot", },
	}
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet",
        recipe = {
		{"group:wood", "default:stick", "group:wood", },
		{"group:wood", "default:stick", "group:wood", },
		{"group:wood", "default:stick", "group:wood", },
	}
})

minetest.register_craft({
	type = "shapeless",
        output = "homedecor:kitchen_cabinet_half 2",
        recipe = { "homedecor:kitchen_cabinet" }
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet_with_sink",
        recipe = {
		{"group:wood", "default:steel_ingot", "group:wood", },
		{"group:wood", "default:steel_ingot", "group:wood", },
		{"group:wood", "default:stick", "group:wood", },
	}
})

-- Lighting

-- yellow

minetest.register_craft({
        output = "homedecor:glowlight_half_yellow 6",
        recipe = {
		{"moreblocks:super_glow_glass", "moreblocks:glow_glass", "moreblocks:super_glow_glass", },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_quarter_yellow 6",
        recipe = {
		{"homedecor:glowlight_half_yellow", "homedecor:glowlight_half_yellow", "homedecor:glowlight_half_yellow", },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_small_cube_yellow 16",
        recipe = {
		{"moreblocks:glow_glass" },
		{"moreblocks:super_glow_glass" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_small_cube_yellow 4",
        recipe = {
		{"homedecor:glowlight_half_yellow" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_half_yellow",
        recipe = {
		{"homedecor:glowlight_small_cube_yellow","homedecor:glowlight_small_cube_yellow"},
		{"homedecor:glowlight_small_cube_yellow","homedecor:glowlight_small_cube_yellow"}
	}
})

-- white

minetest.register_craft({
        output = "homedecor:glowlight_half_white 6",
        recipe = {
		{ "dye:white", "dye:white", "dye:white" },
		{"moreblocks:super_glow_glass", "moreblocks:glow_glass", "moreblocks:super_glow_glass", },
	}
})

minetest.register_craft({
	type = "shapeless",
        output = "homedecor:glowlight_half_white 2",
        recipe = {
		"dye:white",
		"homedecor:glowlight_half_yellow",
		"homedecor:glowlight_half_yellow",
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_quarter_white 6",
        recipe = {
		{"homedecor:glowlight_half_white", "homedecor:glowlight_half_white", "homedecor:glowlight_half_white", },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_small_cube_white 8",
        recipe = {
		{"dye:white" },
		{"moreblocks:super_glow_glass" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_small_cube_white 4",
        recipe = {
		{"homedecor:glowlight_half_white" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_half_white",
        recipe = {
		{"homedecor:glowlight_small_cube_white","homedecor:glowlight_small_cube_white"},
		{"homedecor:glowlight_small_cube_white","homedecor:glowlight_small_cube_white"}
	}
})

-- Brass/wrought iron fences


minetest.register_craft( {
        output = "homedecor:fence_brass 6",
	recipe = {
		{ "group:brass_ingot", "group:brass_ingot", "group:brass_ingot" },
		{ "group:brass_ingot", "group:brass_ingot", "group:brass_ingot" },
	},
})

minetest.register_craft( {
        output = "homedecor:fence_wrought_iron 6",
        recipe = {
                { "default:iron_lump","default:iron_lump","default:iron_lump" },
                { "default:iron_lump","default:iron_lump","default:iron_lump" },
        },
})

-- other types of fences


minetest.register_craft( {
        output = "homedecor:fence_picket 6",
        recipe = {
                { "default:stick", "default:stick", "default:stick" },
                { "default:stick", "", "default:stick" },
                { "default:stick", "default:stick", "default:stick" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_picket_corner",
	recipe = {
		"homedecor:fence_picket",
		"homedecor:fence_picket"
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_picket 2",
	recipe = {
		"homedecor:fence_picket_corner"
	},
})

--


minetest.register_craft( {
        output = "homedecor:fence_picket_white 6",
        recipe = {
                { "default:stick", "default:stick", "default:stick" },
                { "default:stick", "dye:white", "default:stick" },
                { "default:stick", "default:stick", "default:stick" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_picket_corner_white",
	recipe = {
		"homedecor:fence_picket_white",
		"homedecor:fence_picket_white"
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_picket_white 2",
	recipe = {
		"homedecor:fence_picket_corner_white"
	},
})

--


minetest.register_craft( {
        output = "homedecor:fence_privacy 6",
        recipe = {
                { "group:wood", "default:stick", "group:wood" },
                { "group:wood", "", "group:wood" },
                { "group:wood", "default:stick", "group:wood" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_privacy_corner",
	recipe = {
		"homedecor:fence_privacy",
		"homedecor:fence_privacy"
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_privacy 2",
	recipe = {
		"homedecor:fence_privacy_corner"
	},
})

--


minetest.register_craft( {
        output = "homedecor:fence_barbed_wire 6",
        recipe = {
                { "default:stick", "default:iron_lump", "default:stick" },
                { "default:stick", "", "default:stick" },
                { "default:stick", "default:iron_lump", "default:stick" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_barbed_wire_corner",
	recipe = { "homedecor:fence_barbed_wire", "homedecor:fence_barbed_wire" },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_barbed_wire 2",
	recipe = { "homedecor:fence_barbed_wire_corner" },
})

--


minetest.register_craft( {
        output = "homedecor:fence_chainlink 9",
        recipe = {
                { "default:steel_ingot", "default:steel_ingot", "default:steel_ingot" },
                { "default:steel_ingot", "default:iron_lump", "default:steel_ingot" },
                { "default:steel_ingot", "default:iron_lump", "default:steel_ingot" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_chainlink_corner",
	recipe = { "homedecor:fence_chainlink", "homedecor:fence_chainlink" },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_chainlink 2",
	recipe = { "homedecor:fence_chainlink_corner" },
})


-- Gates

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:gate_picket_white_closed",
        recipe = {
		"homedecor:fence_picket_white"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:fence_picket_white",
        recipe = {
		"homedecor:gate_picket_white_closed"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:gate_picket_closed",
        recipe = {
		"homedecor:fence_picket"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:fence_picket",
        recipe = {
		"homedecor:gate_picket_closed"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:gate_barbed_wire_closed",
        recipe = {
		"homedecor:fence_barbed_wire"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:fence_barbed_wire",
        recipe = {
		"homedecor:gate_barbed_wire_closed"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:gate_chainlink_closed",
        recipe = {
		"homedecor:fence_chainlink"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:fence_chainlink",
        recipe = {
		"homedecor:gate_chainlink_closed"
        },
})

------ Doors

-- plain wood, non-windowed

minetest.register_craft( {
        output = "homedecor:door_wood_plain_bottom_left 2",
        recipe = {
		{ "group:wood", "group:wood", "" },
		{ "group:wood", "group:wood", "default:steel_ingot" },
		{ "group:wood", "group:wood", "" },
        },
})

-- fancy exterior

minetest.register_craft( {
        output = "homedecor:door_exterior_fancy_bottom_left 2",
        recipe = {
		{ "group:wood", "default:glass" },
		{ "group:wood", "group:wood" },
		{ "group:wood", "group:wood" },
        },
})

-- wood and glass (grid style)

-- bare

minetest.register_craft( {
        output = "homedecor:door_wood_glass_bottom_left 2",
        recipe = {
		{ "default:glass", "group:wood" },
		{ "group:wood", "default:glass" },
		{ "default:glass", "group:wood" },
        },
})

minetest.register_craft( {
        output = "homedecor:door_wood_glass_bottom_left 2",
        recipe = {
		{ "group:wood", "default:glass" },
		{ "default:glass", "group:wood" },
		{ "group:wood", "default:glass" },
        },
})

-- mahogany

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_mahogany_bottom_left 2",
        recipe = {
		"default:dirt",
		"default:coal_lump",
		"homedecor:door_wood_glass_bottom_left",
		"homedecor:door_wood_glass_bottom_left"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_mahogany_bottom_left 2",
        recipe = {
		"dye:brown",
		"homedecor:door_wood_glass_bottom_left",
		"homedecor:door_wood_glass_bottom_left"
        },
})

-- white

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_white_bottom_left 2",
        recipe = {
		"dye:white",
		"homedecor:door_wood_glass_bottom_left",
		"homedecor:door_wood_glass_bottom_left"
        },
})

-- Solid glass with metal handle

minetest.register_craft( {
        output = "homedecor:door_glass_bottom_left 2",
        recipe = {
		{ "default:glass", "default:glass" },
		{ "default:glass", "default:steel_ingot" },
		{ "default:glass", "default:glass" },
        },
})

-- Closet doors

-- oak

minetest.register_craft( {
        output = "homedecor:door_closet_oak_bottom_left 2",
        recipe = {
		{ "", "default:stick", "default:stick" },
		{ "default:steel_ingot", "default:stick", "default:stick" },
		{ "", "default:stick", "default:stick" },
        },
})

-- mahogany

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_closet_mahogany_bottom_left 2",
        recipe = {
		"homedecor:door_closet_oak_bottom_left",
		"homedecor:door_closet_oak_bottom_left",
		"default:dirt",
		"default:coal_lump",
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_closet_mahogany_bottom_left 2",
        recipe = {
		"homedecor:door_closet_oak_bottom_left",
		"homedecor:door_closet_oak_bottom_left",
		"dye:brown"
        },
})

