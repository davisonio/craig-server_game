-- Crafting for homedecor mod (includes folding) by Vanessa Ezekowitz
-- 2012-06-12
--
-- Mostly my own code; overall template borrowed from game default
--
-- License: GPL
--

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

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
        output = "homedecor:roof_tile_terracotta 4",
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
        output = "homedecor:plastic_base 6",
        recipe = { "default:junglegrass",
		   "default:junglegrass",
		   "default:junglegrass"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "homedecor:plastic_base 3",
        recipe = { "default:dry_shrub",
		   "default:dry_shrub",
		   "default:dry_shrub"
	},
})

minetest.register_craft({
        type = "shapeless",
        output = "homedecor:plastic_base 4",
        recipe = { "default:leaves",
        	   "default:leaves",
        	   "default:leaves",
        	   "default:leaves",
        	   "default:leaves",
		   "default:leaves"
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
                { "", "group:dye,unicolor_dark_green", "" },
                { "homedecor:plastic_sheeting", "default:dirt", "homedecor:plastic_sheeting" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

minetest.register_craft( {
        output = "homedecor:flower_pot_black",
        recipe = {
                { "group:dye,basecolor_black", "group:dye,basecolor_black", "group:dye,basecolor_black" },
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
                "group:dye,basecolor_white",
                "group:dye,basecolor_white",
                "default:sand",
		"bucket:bucket_water",
        },
	replacements = { { "bucket:bucket_water","bucket:bucket_empty" } }
})

minetest.register_craft( {
        output = "homedecor:ceiling_tile 10",
        recipe = {
                { "", "group:dye,basecolor_white", "" },
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
                { "", "default:wood", "" },
                { "default:wood", "default:wood", "default:wood" },
                { "", "default:wood", "" },
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
                { "default:gravel", "group:dye,basecolor_black", "default:gravel" },
                { "default:sand", "group:dye,basecolor_black", "default:sand" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

--

minetest.register_craft( {
        output = "homedecor:shingles_wood 12",
        recipe = {
                { "default:stick", "default:wood"},
                { "default:wood", "default:stick"},
        },
})

minetest.register_craft( {
        output = "homedecor:shingles_wood 12",
        recipe = {
                { "default:wood", "default:stick"},
                { "default:stick", "default:wood"},
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
                "group:dye,basecolor_black",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak"
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
                "group:dye,excolor_darkgrey",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak"
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
		"group:dye,excolor_grey",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak"
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
                "group:dye,basecolor_white",
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
		"group:dye,unicolor_dark_orange",
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
		"group:dye,basecolor_red",
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
		"group:dye,unicolor_yellow",
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
                "group:dye,unicolor_dark_green",
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
		"unifieddyes:light_blue",
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_light_blue",
       	burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_purple 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"group:dye,excolor_violet",
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_purple",
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
                { "default:wood", "default:steel_ingot", "default:wood" },
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
                { "default:wood" },
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
                { "default:wood" },
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
                "group:dye,unicolor_dark_orange",
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
                "group:dye,unicolor_dark_orange",
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
		{ "mesecons_materials:silicon", "moreores:copper_ingot" },
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
		{ "homedecor:plastic_sheeting", "moreblocks:glowglass", "homedecor:plastic_sheeting" },
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
		{ "default:wood", "wool:black", "default:wood" },
		{ "default:wood", "moreores:copper_ingot", "default:wood" },
		{ "default:wood", "wool:black", "default:wood" },
	},
})

minetest.register_craft( {
        output = "homedecor:speaker_small",
      		recipe = {
		{ "default:wood", "wool:black", "default:wood" },
		{ "default:wood", "moreores:copper_ingot", "default:wood" },
	},
})

-- cotton version

minetest.register_craft( {
        output = "homedecor:speaker",
      		recipe = {
		{ "default:wood", "cotton:black", "default:wood" },
		{ "default:wood", "moreores:copper_ingot", "default:wood" },
		{ "default:wood", "cotton:black", "default:wood" },
	},
})

minetest.register_craft( {
        output = "homedecor:speaker_small",
      		recipe = {
		{ "default:wood", "cotton:black", "default:wood" },
		{ "default:wood", "moreores:copper_ingot", "default:wood" },
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
		{"default:steel_ingot", "moreblocks:ironglass", "default:steel_ingot", },
		{"default:steel_ingot", "moreores:copper_ingot", "default:steel_ingot", },
	}
})

minetest.register_craft({
        output = "homedecor:microwave_oven 2",
        recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "moreblocks:ironglass", "mesecons_materials:silicon", },
		{"default:steel_ingot", "moreores:copper_ingot", "default:mese_crystal", },
	}
})

minetest.register_craft({
        output = "homedecor:refrigerator",
        recipe = {
		{"default:steel_ingot", "moreblocks:glowglass", "default:steel_ingot", },
		{"default:steel_ingot", "moreores:tin_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "default:clay", "default:steel_ingot", },
	}
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet",
        recipe = {
		{"default:wood", "default:stick", "default:wood", },
		{"default:wood", "default:stick", "default:wood", },
		{"default:wood", "default:stick", "default:wood", },
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
		{"default:wood", "default:steel_ingot", "default:wood", },
		{"default:wood", "default:steel_ingot", "default:wood", },
		{"default:wood", "default:stick", "default:wood", },
	}
})

-- Lighting

-- yellow

minetest.register_craft({
        output = "homedecor:glowlight_half_yellow 6",
        recipe = {
		{"moreblocks:superglowglass", "moreblocks:glowglass", "moreblocks:superglowglass", },
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
		{"moreblocks:glowglass" },
		{"moreblocks:superglowglass" },
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
		{ "group:dye,basecolor_white", "group:dye,basecolor_white", "group:dye,basecolor_white" },
		{"moreblocks:superglowglass", "moreblocks:glowglass", "moreblocks:superglowglass", },
	}
})

minetest.register_craft({
	type = "shapeless",
        output = "homedecor:glowlight_half_white 2",
        recipe = {
		"group:dye,basecolor_white",
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
		{"group:dye,basecolor_white" },
		{"moreblocks:superglowglass" },
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
                { "default:stick", "group:dye,basecolor_white", "default:stick" },
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
                { "default:wood", "default:stick", "default:wood" },
                { "default:wood", "", "default:wood" },
                { "default:wood", "default:stick", "default:wood" }
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
		{ "default:wood", "default:wood", "" },
		{ "default:wood", "default:wood", "default:steel_ingot" },
		{ "default:wood", "default:wood", "" },
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_plain_bottom_left",
        recipe = {
		"homedecor:door_wood_plain_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_plain_bottom_right",
        recipe = {
		"homedecor:door_wood_plain_bottom_left"
        },
})

-- fancy exterior

minetest.register_craft( {
        output = "homedecor:door_exterior_fancy_bottom_left 2",
        recipe = {
		{ "default:wood", "default:glass" },
		{ "default:wood", "default:wood" },
		{ "default:wood", "default:wood" },
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_exterior_fancy_bottom_left",
        recipe = {
		"homedecor:door_exterior_fancy_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_exterior_fancy_bottom_right",
        recipe = {
		"homedecor:door_exterior_fancy_bottom_left"
        },
})


-- wood and glass (grid style)

-- bare

minetest.register_craft( {
        output = "homedecor:door_wood_glass_bottom_left 2",
        recipe = {
		{ "default:glass", "default:wood" },
		{ "default:wood", "default:glass" },
		{ "default:glass", "default:wood" },
        },
})

minetest.register_craft( {
        output = "homedecor:door_wood_glass_bottom_left 2",
        recipe = {
		{ "default:wood", "default:glass" },
		{ "default:glass", "default:wood" },
		{ "default:wood", "default:glass" },
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_bottom_left",
        recipe = {
		"homedecor:door_wood_glass_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_bottom_right",
        recipe = {
		"homedecor:door_wood_glass_bottom_left"
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
        output = "homedecor:door_wood_glass_mahogany_bottom_right 2",
        recipe = {
		"default:dirt",
		"default:coal_lump",
		"homedecor:door_wood_glass_bottom_right",
		"homedecor:door_wood_glass_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_mahogany_bottom_left 2",
        recipe = {
		"group:dye,unicolor_dark_orange",
		"homedecor:door_wood_glass_bottom_left",
		"homedecor:door_wood_glass_bottom_left"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_mahogany_bottom_right 2",
        recipe = {
		"group:dye,unicolor_dark_orange",
		"homedecor:door_wood_glass_bottom_right",
		"homedecor:door_wood_glass_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_mahogany_bottom_left",
        recipe = {
		"homedecor:door_wood_glass_mahogany_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_mahogany_bottom_right",
        recipe = {
		"homedecor:door_wood_glass_mahogany_bottom_left"
        },
})

-- white

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_white_bottom_left 2",
        recipe = {
		"group:dye,basecolor_white",
		"homedecor:door_wood_glass_bottom_left",
		"homedecor:door_wood_glass_bottom_left"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_white_bottom_right 2",
        recipe = {
		"group:dye,basecolor_white",
		"homedecor:door_wood_glass_bottom_right",
		"homedecor:door_wood_glass_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_white_bottom_left",
        recipe = {
		"homedecor:door_wood_glass_white_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_white_bottom_right",
        recipe = {
		"homedecor:door_wood_glass_white_bottom_left"
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

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_glass_bottom_left",
        recipe = {
		"homedecor:door_glass_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_glass_bottom_right",
        recipe = {
		"homedecor:door_glass_bottom_left"
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

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_closet_oak_bottom_left",
        recipe = {
		"homedecor:door_closet_oak_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_closet_oak_bottom_right",
        recipe = {
		"homedecor:door_closet_oak_bottom_left"
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
		"group:dye,unicolor_dark_orange"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_closet_mahogany_bottom_left",
        recipe = {
		"homedecor:door_closet_mahogany_bottom_right"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_closet_mahogany_bottom_right",
        recipe = {
		"homedecor:door_closet_mahogany_bottom_left"
        },
})

