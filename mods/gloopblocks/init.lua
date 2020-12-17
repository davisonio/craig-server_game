--[[
GloopBlocks
Originally written by GloopMaster

Maintained by VanessaE.

--]]

gloopblocks = {}

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

-- Nodes

minetest.register_node("gloopblocks:rainbow_block_diagonal", {
	description = S("Diagonal Rainbow Block"),
	tiles = {"gloopblocks_rainbow_block.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_defaults(),
})
minetest.register_alias("gloopblocks:rainbow_block", "gloopblocks:rainbow_block_diagonal")

minetest.register_node("gloopblocks:rainbow_block_horizontal", {
	description = S("Horizontal Rainbow Block"),
	tiles = {
		"gloopblocks_rainbow_horizontal.png^[transformR90",
		"gloopblocks_rainbow_horizontal.png^[transformR90",
		"gloopblocks_rainbow_horizontal.png"
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("gloopblocks:evil_block", {
	description = S("Evil Block"),
	tiles = {"gloopblocks_evil_block.png"},
	light_source = 5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:basalt", {
	description = S("Basalt"),
	tiles = {"gloopblocks_basalt.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:pumice", {
	description = S("Pumice"),
	tiles = {"gloopblocks_pumice.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("gloopblocks:pavement", {
	description = S("Pavement"),
	tiles = {"gloopblocks_pavement.png"},
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:oerkki_block", {
	drawtype = "nodebox",
	description = S("Oerkki Block"),
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_front.png"
	},
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox2
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox5
			{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox6
		}
	}
})

minetest.register_node("gloopblocks:stone_brick_mossy", {
	description = S("Mossy Stone Brick"),
	tiles = {"gloopblocks_stone_brick_mossy.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:stone_mossy", {
	description = S("Mossy Stone"),
	tiles = {"gloopblocks_stone_mossy.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "default:mossycobble"
})

minetest.register_node("gloopblocks:cobble_road", {
	description = S("Cobblestone Road Bed"),
	tiles = {"gloopblocks_cobble_road.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:cobble_road_mossy", {
	description = S("Mossy Cobblestone Road Bed"),
	tiles = {"gloopblocks_cobble_road_mossy.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:scaffolding", {
	description = S("Wooden Scaffold"),
	drawtype = "allfaces",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"gloopblocks_scaffold.png"},
	groups = {choppy=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_alias("moreblocks:oerkkiblock", "gloopblocks:oerkki_block")
minetest.register_alias("gloopblocks:obsidian", "default:obsidian")

-- Nodes imported from Usesdirt ================================================================================

if not minetest.get_modpath("usesdirt") then

	local dirt_brick_tex  = "default_dirt.png^gloopblocks_dirt_brick_overlay.png"
	local dirt_cobble_tex = "default_cobble.png^(default_dirt.png^[mask:gloopblocks_dirt_cobble_mask.png)"
	local dirt_stone_tex  = "default_stone.png^(default_dirt.png^[mask:gloopblocks_dirt_stone_mask.png)"

	local dirt_ladder_tex = "(default_dirt.png^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_brick_ladder_tex = "(("..dirt_brick_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_cobble_ladder_tex = "(("..dirt_cobble_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_stone_ladder_tex = "(("..dirt_stone_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"

	minetest.register_node(":usesdirt:dirt_brick", {
		tiles = { dirt_brick_tex },
		description = "Dirt Brick",
		groups = {snappy=2,choppy=1,oddly_breakable_by_hand=2},
	})

	minetest.register_node(":usesdirt:dirt_brick_ladder", {
		description = "Dirt Brick Ladder",
		drawtype = "signlike",
		tiles = { dirt_brick_ladder_tex },
		inventory_image = dirt_brick_ladder_tex,
		wield_image     = dirt_brick_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {cracky=3, stone=2},
		legacy_wallmounted = true,
	})
	minetest.register_craft({
		output = 'usesdirt:dirt_brick_ladder 3',
		recipe = {
			{'usesdirt:dirt_brick', '', 'usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick','usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick','','usesdirt:dirt_brick'},
		}
	})

	default.register_fence(":usesdirt:dirt_brick_fence", {
		description = "Dirt Brick Fence",
		texture = dirt_brick_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_brick_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_brick_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_brick",
		groups = {cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})

	if minetest.get_modpath("moreblocks") then
		minetest.register_craft({
			output = 'usesdirt:dirt_brick 24',
			recipe = {
				{'moreblocks:dirt_compressed', 'moreblocks:dirt_compressed', '' },
				{'moreblocks:dirt_compressed', 'moreblocks:dirt_compressed', '' }
			}
		})
	else
		minetest.register_craft({
			output = 'usesdirt:dirt_brick 6',
			recipe = {
				{'default:dirt', 'default:dirt', 'default:dirt'},
				{'default:dirt', 'default:dirt', 'default:dirt'},
				{'default:dirt', 'default:dirt', 'default:dirt'},
			}
		})
	end

	minetest.register_node(":usesdirt:dirt_ladder", {
		description = "Dirt Ladder",
		drawtype = "signlike",
		tiles = { dirt_ladder_tex },
		inventory_image = dirt_ladder_tex,
		wield_image     = dirt_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3},
		legacy_wallmounted = true,
	})
	minetest.register_craft({
		output = 'usesdirt:dirt_ladder 3',
		recipe = {
			{'usesdirt:dirt_brick', '', 'usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick','usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick','','usesdirt:dirt_brick'},
		}
	})

	default.register_fence(":usesdirt:dirt_fence", {
		description = "Dirt Fence",
		texture = "default_dirt.png",
		inventory_image = "default_fence_overlay.png^default_dirt.png^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^default_dirt.png^default_fence_overlay.png^[makealpha:255,126,126",
		material = "default:dirt",
		groups = {snappy=2,choppy=1,oddly_breakable_by_hand=3},
		sounds = default.node_sound_dirt_defaults(),
		check_for_pole = true
	})

----

	minetest.register_node(":usesdirt:dirt_cobble_stone", {
		tiles = { dirt_cobble_tex },
		description = "Dirt Cobble Stone",
		is_ground_content = true,
		groups = {cracky=3, stone=2},
	})
	minetest.register_craft({
		output = '"usesdirt:dirt_cobble_stone" 3',
		recipe = {
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
		}
	})

	minetest.register_node(":usesdirt:dirt_cobble_stone_ladder", {
		description = "Dirt Cobble Stone Ladder",
		drawtype = "signlike",
		tiles = { dirt_cobble_ladder_tex },
		inventory_image = dirt_cobble_ladder_tex,
		wield_image     = dirt_cobble_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {cracky=3, stone=2},
		legacy_wallmounted = true,
	})
	minetest.register_craft({
		output = 'usesdirt:dirt_cobble_stone_ladder 3',
		recipe = {
			{'usesdirt:dirt_cobble_stone', '', 'usesdirt:dirt_cobble_stone'},
			{'usesdirt:dirt_cobble_stone', 'usesdirt:dirt_cobble_stone','usesdirt:dirt_cobble_stone'},
			{'usesdirt:dirt_cobble_stone','','usesdirt:dirt_cobble_stone'},
		}
	})

	default.register_fence(":usesdirt:dirt_cobble_stone_fence", {
		description = "Dirt Cobble Stone Fence",
		texture = dirt_cobble_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_cobble_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_cobble_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_cobble_stone",
		groups = {cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})

----

	minetest.register_node(":usesdirt:dirt_stone", {
		tiles = { dirt_stone_tex },
		description = "Dirt Stone",
		is_ground_content = true,
		groups = {cracky=3, stone=2},
	})

	minetest.register_node(":usesdirt:dirt_stone_ladder", {
		description = "Dirt Stone Ladder",
		drawtype = "signlike",
		tiles = { dirt_stone_ladder_tex },
		inventory_image = dirt_stone_ladder_tex,
		wield_image     = dirt_stone_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {cracky=3, stone=2},
		legacy_wallmounted = true,
	})
	minetest.register_craft({
		output = 'usesdirt:dirt_stone_ladder 3',
		recipe = {
			{'usesdirt:dirt_stone', '', 'usesdirt:dirt_stone'},
			{'usesdirt:dirt_stone', 'usesdirt:dirt_stone','usesdirt:dirt_stone'},
			{'usesdirt:dirt_stone','','usesdirt:dirt_stone'},
		}
	})

	default.register_fence(":usesdirt:dirt_stone_fence", {
		description = "Dirt Stone Fence",
		texture = dirt_stone_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_stone_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_stone_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_stone",
		groups = {cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})
end

-- Stairs/slabs defs, conversion of normal -> mossy items

if minetest.setting_getbool("gloopblocks_mossy_conversion") ~= false then

	function gloopblocks_register_mossy_conversion(mossyobjects)
		for i in ipairs(mossyobjects) do
			minetest.register_abm({
				nodenames = { mossyobjects[i][1] },
				neighbors = {"default:water_source", "default:water_flowing"},
				interval = 120,
				chance = 50,
				action = function(pos, node)
					if minetest.find_node_near(pos, 2, "air") then
						local fdir = node.param2
						minetest.add_node(pos, {name = mossyobjects[i][2], param2 = fdir})
					end
				end,
			})
		end
	end
end

if minetest.get_modpath("moreblocks") then

	stairsplus:register_all("gloopblocks", "oerkki_block", "gloopblocks:oerkki_block", {
		description = S("Oerkki Block"),
		tiles = {
			"gloopblocks_oerkkiblock_tb.png",
			"gloopblocks_oerkkiblock_tb.png",
			"gloopblocks_oerkkiblock_sides.png",
			"gloopblocks_oerkkiblock_sides.png",
			"gloopblocks_oerkkiblock_sides.png",
			"gloopblocks_oerkkiblock_front.png"
		},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "stone_brick_mossy", "gloopblocks:stone_brick_mossy", {
		description = S("Mossy Stone Brick"),
		tiles = {"gloopblocks_stone_brick_mossy.png"},
		groups = {cracky=1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "stone_mossy", "gloopblocks:stone_mossy", {
		description = S("Mossy Stone"),
		tiles = {"gloopblocks_stone_mossy.png"},
		groups = {cracky=1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "cobble_road", "gloopblocks:cobble_road", {
		description = S("Cobblestone Roadbed"),
		tiles = {"gloopblocks_cobble_road.png"},
		groups = {cracky=3, stone=1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "cobble_road_mossy", "gloopblocks:cobble_road_mossy", {
		description = S("Mossy Cobblestone Roadbed"),
		tiles = {"gloopblocks_cobble_road_mossy.png"},
		groups = {cracky=3, stone=1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "pavement", "gloopblocks:pavement", {
		description = S("Pavement"),
		tiles = {"gloopblocks_pavement.png"},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "rainbow_block", "gloopblocks:rainbow_block", {
		description = S("Rainbow Block"),
		tiles = {"gloopblocks_rainbow_block.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = default.node_sound_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "evil_block", "gloopblocks:evil_block", {
		description = S("Evil Block"),
		tiles = {"gloopblocks_evil_block.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = default.node_sound_defaults(),
		light_source = 5,
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "basalt", "gloopblocks:basalt", {
		description = S("Basalt"),
		tiles = {"gloopblocks_basalt.png"},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "pumice", "gloopblocks:pumice", {
		description = S("Pumice"),
		tiles = {"gloopblocks_pumice.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "gravel", "default:gravel", {
		description = S("Gravel"),
		tiles = {"default_gravel.png"},
		groups = {crumbly = 2, falling_node = 1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = false,
	})

	if minetest.get_modpath("caverealms") then
		stairsplus:register_all("caverealms", "glow_crystal", "caverealms:glow_crystal", {
			description = S("Glow Crystal"),
			tiles = {"caverealms_glow_crystal.png"},
			groups = {cracky=3, not_in_creative_inventory=1},
			sounds = default.node_sound_glass_defaults(),
			light_source = 12,
			use_texture_alpha = true,
			paramtype="light",
			sunlight_propagates = true,
		})

		stairsplus:register_all("caverealms", "glow_emerald", "caverealms:glow_emerald", {
			description = S("Glow Emerald"),
			tiles = {"caverealms_glow_emerald.png"},
			groups = {cracky=3, not_in_creative_inventory=1},
			sounds = default.node_sound_glass_defaults(),
			light_source = 12,
			use_texture_alpha = true,
			paramtype="light",
			sunlight_propagates = true,
		})

		stairsplus:register_all("caverealms", "glow_mese", "caverealms:glow_mese", {
			description = S("Glow Mese"),
			tiles = {"caverealms_glow_mese.png"},
			groups = {cracky=3, not_in_creative_inventory=1},
			sounds = default.node_sound_glass_defaults(),
			light_source = 12,
			use_texture_alpha = true,
			paramtype="light",
			sunlight_propagates = true,
		})
	end

	-- ABMs for mossy objects

	if minetest.setting_getbool("gloopblocks_mossy_conversion") ~= false then

		gloopblocks_register_mossy_conversion({
			{ "moreblocks:stair_cobble", 				"moreblocks:stair_mossycobble" },
			{ "moreblocks:stair_cobble_inner", 			"moreblocks:stair_mossycobble_inner" },
			{ "moreblocks:stair_cobble_outer", 			"moreblocks:stair_mossycobble_outer" },
			{ "moreblocks:stair_cobble_half", 			"moreblocks:stair_mossycobble_half" },
			{ "moreblocks:slab_cobble_quarter", 		"moreblocks:slab_mossycobble_quarter" },
			{ "moreblocks:slab_cobble", 				"moreblocks:slab_mossycobble" },
			{ "moreblocks:slab_cobble_three_quarter", 	"moreblocks:slab_mossycobble_three_quarter" },
			{ "moreblocks:panel_cobble", 				"moreblocks:panel_mossycobble" },
			{ "moreblocks:micro_cobble", 				"moreblocks:micro_mossycobble" },
			{ "moreblocks:stair_cobble_alt", 			"moreblocks:stair_mossycobble_alt" },

			{ "gloopblocks:cobble_road", 				"gloopblocks:cobble_road_mossy" },
			{ "gloopblocks:stair_cobble_road", 			"gloopblocks:stair_cobble_road_mossy" },
			{ "gloopblocks:slab_cobble_road", 			"gloopblocks:slab_cobble_road_mossy" },
			{ "gloopblocks:stair_cobble_road", 			"gloopblocks:stair_cobble_road_mossy" },
			{ "gloopblocks:stair_cobble_road_inner", 	"gloopblocks:stair_cobble_road_mossy_inner" },
			{ "gloopblocks:stair_cobble_road_outer", 	"gloopblocks:stair_cobble_road_mossy_outer" },
			{ "gloopblocks:stair_cobble_road_half", 	"gloopblocks:stair_cobble_road_mossy_half" },
			{ "gloopblocks:slab_cobble_road_quarter", 	"gloopblocks:slab_cobble_road_mossy_quarter" },
			{ "gloopblocks:slab_cobble_road", 			"gloopblocks:slab_cobble_road_mossy" },
			{ "gloopblocks:slab_cobble_road_three_quarter",	"gloopblocks:slab_cobble_road_mossy_three_quarter" },
			{ "gloopblocks:panel_cobble_road", 			"gloopblocks:panel_cobble_road_mossy" },
			{ "gloopblocks:micro_cobble_road", 			"gloopblocks:micro_cobble_road_mossy" },
			{ "gloopblocks:stair_cobble_road_alt", 		"gloopblocks:stair_cobble_road_mossy_alt" },

			{ "default:stonebrick", 					"gloopblocks:stone_brick_mossy" },
			{ "default:stair_stonebrick", 				"gloopblocks:stair_stone_brick_mossy" },
			{ "default:slab_stonebrick", 				"gloopblocks:slab_stone_brick_mossy" },
			{ "moreblocks:stair_stonebrick", 			"gloopblocks:stair_stone_brick_mossy" },
			{ "moreblocks:stair_stonebrick_inner", 		"gloopblocks:stair_stone_brick_mossy_inner" },
			{ "moreblocks:stair_stonebrick_outer", 		"gloopblocks:stair_stone_brick_mossy_outer" },
			{ "moreblocks:stair_stonebrick_half", 		"gloopblocks:stair_stone_brick_mossy_half" },
			{ "moreblocks:slab_stonebrick_quarter", 	"gloopblocks:slab_stone_brick_mossy_quarter" },
			{ "moreblocks:slab_stonebrick", 			"gloopblocks:slab_stone_brick_mossy" },
			{ "moreblocks:slab_stonebrick_three_quarter", "gloopblocks:slab_stone_brick_mossy_three_quarter" },
			{ "moreblocks:panel_stonebrick", 			"gloopblocks:panel_stone_brick_mossy" },
			{ "moreblocks:micro_stonebrick", 			"gloopblocks:micro_stone_brick_mossy" },
			{ "moreblocks:stair_stonebrick_alt", 		"gloopblocks:stair_stone_brick_mossy_alt" },

			{ "default:stone", 							"gloopblocks:stone_mossy" },
			{ "default:stair_stone", 					"gloopblocks:stair_stone_mossy" },
			{ "default:slab_stone", 					"gloopblocks:slab_stone_mossy" },
			{ "moreblocks:stair_stone", 				"gloopblocks:stair_stone_mossy" },
			{ "moreblocks:stair_stone_inner", 			"gloopblocks:stair_stone_mossy_inner" },
			{ "moreblocks:stair_stone_outer", 			"gloopblocks:stair_stone_mossy_outer" },
			{ "moreblocks:stair_stone_half", 			"gloopblocks:stair_stone_mossy_half" },

			{ "moreblocks:slab_stone_quarter", 			"gloopblocks:slab_stone_mossy_quarter" },
			{ "moreblocks:slab_stone", 					"gloopblocks:slab_stone_mossy" },
			{ "moreblocks:slab_stone_three_quarter",	"gloopblocks:slab_stone_mossy_three_quarter" },
			{ "moreblocks:panel_stone", 				"gloopblocks:panel_stone_mossy" },
			{ "moreblocks:micro_stone", 				"gloopblocks:micro_stone_mossy" },
			{ "moreblocks:stair_stone_alt", 			"gloopblocks:stair_stone_mossy_alt" },
		})
	end

elseif minetest.get_modpath("stairs") then

	--stairs.register_stair(subname, recipeitem, groups, images, description, sounds)

	-- stairs:xxxx_stone_mossy ; xxxx = stair or slab
	stairs.register_stair_and_slab("stone_mossy", "gloopblocks:stone_mossy",
		{cracky=3},
		{"gloopblocks_stone_mossy.png"},
		S("Mossy Stone Stair"),
		S("Mossy Stone Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_mossycobble
	stairs.register_stair_and_slab("mossycobble", "default:mossycobble",
		{cracky=3},
		{"default_mossycobble.png"},
		S("Mossy Cobble Stair"),
		S("Mossy Cobble Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_stone_brick_mossy
	stairs.register_stair_and_slab("stone_brick_mossy", "gloopblocks:stone_brick_mossy",
		{cracky=3},
		{"gloopblocks_stone_brick_mossy.png"},
		S("Mossy Stone Brick Stair"),
		S("Mossy Stone Brick Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cobble_road
	stairs.register_stair_and_slab("cobble_road", "gloopblocks:cobble_road",
		{cracky=3},
		{"gloopblocks_cobble_road.png"},
		S("Cobble Roadbed Stair"),
		S("Cobble Roadbed Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cobble_road_mossy
	stairs.register_stair_and_slab("cobble_road_mossy", "gloopblocks:cobble_road_mossy",
		{cracky=3},
		{"gloopblocks_cobble_road_mossy.png"},
		S("Mossy Cobble Roadbed Stair"),
		S("Mossy Cobble Roadbed Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cement
	stairs.register_stair_and_slab("cement", "gloopblocks:cement",
		{cracky=2},
		{"basic_materials_cement_block.png"},
		S("Cement Stair"),
		S("Cement Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_pavement
	stairs.register_stair_and_slab("pavement", "gloopblocks:pavement",
		{cracky=3, oddly_breakable_by_hand=3},
		{"gloopblocks_pavement.png"},
		S("Pavement Stair"),
		S("Pavement Slab"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("basalt", "gloopblocks:basalt",
		{cracky=2},
		{"gloopblocks_basalt.png"},
		S("Basalt Stair"),
		S("Basalt Slab"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("pumice", "gloopblocks:pumice",
		{cracky=3},
		{"gloopblocks_pumice.png"},
		S("Pumice Stair"),
		S("Pumice Slab"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("rainbow_block", "gloopblocks:rainbow_block",
		{cracky=3},
		{"gloopblocks_rainbow_block.png"},
		S("Rainbow Block Stair"),
		S("Rainbow Block Slab"),
		default.node_sound_defaults())

	if minetest.setting_getbool("gloopblocks_mossy_conversion") ~= false then

		gloopblocks_register_mossy_conversion({
			{ "default:cobble", 					"default:mossycobble" },
			{ "stairs:stair_cobble", 				"stairs:stair_mossycobble" },
			{ "stairs:slab_cobble", 				"stairs:slab_mossycobble" },
			{ "gloopblocks:cobble_road", 			"gloopblocks:cobble_road_mossy" },
			{ "stairs:stair_cobble_road", 			"stairs:stair_cobble_road_mossy" },
			{ "stairs:slab_cobble_road", 			"stairs:slab_cobble_road_mossy" },
			{ "default:stonebrick", 				"gloopblocks:stone_brick_mossy" },
			{ "stairs:stair_stonebrick", 			"stairs:stair_stone_brick_mossy" },
			{ "stairs:slab_stonebrick", 			"stairs:slab_stone_brick_mossy" },
			{ "default:stone", 						"gloopblocks:stone_mossy" },
			{ "stairs:stair_stone", 				"stairs:stair_stone_mossy" },
			{ "stairs:slab_stone", 					"stairs:slab_stone_mossy" },
		})
	end

	minetest.register_alias("default:stair_mossycobble", "stairs:stair_mossycobble")
	minetest.register_alias("default:slab_mossycobble", "stairs:slab_mossycobble")
	minetest.register_alias("gloopblocks:stair_cobble_road", "stairs:stair_cobble_road")
	minetest.register_alias("gloopblocks:slab_cobble_road", "stairs:slab_cobble_road")
	minetest.register_alias("gloopblocks:stair_cobble_road_mossy", "stairs:stair_cobble_road_mossy")
	minetest.register_alias("gloopblocks:slab_cobble_road_mossy", "stairs:slab_cobble_road_mossy")
	minetest.register_alias("gloopblocks:stair_stone_brick_mossy", "stairs:stair_stone_brick_mossy")
	minetest.register_alias("gloopblocks:slab_stone_brick_mossy", "stairs:slab_stone_brick_mossy")
	minetest.register_alias("gloopblocks:stair_stone_mossy", "stairs:stair_stone_mossy")
	minetest.register_alias("gloopblocks:slab_stone_mossy", "stairs:slab_stone_mossy")
	minetest.register_alias("gloopblocks:stair_cement", "stairs:stair_cement")
	minetest.register_alias("gloopblocks:slab_cement", "stairs:slab_cement")
	minetest.register_alias("gloopblocks:stair_pavement", "stairs:stair_pavement")
	minetest.register_alias("gloopblocks:slab_pavement", "stairs:slab_pavement")
	minetest.register_alias("gloopblocks:stair_pumice", "stairs:stair_pumice")
	minetest.register_alias("gloopblocks:slab_pumice", "stairs:slab_pumice")
	minetest.register_alias("gloopblocks:stair_basalt", "stairs:stair_basalt")
	minetest.register_alias("gloopblocks:slab_basalt", "stairs:slab_basalt")
	minetest.register_alias("gloopblocks:stair_rainbow_block", "stairs:stair_rainbow_block")
	minetest.register_alias("gloopblocks:slab_rainbow_block", "stairs:slab_rainbow_block")
end

-- Tools

minetest.register_tool("gloopblocks:pick_cement", {
	description = S("Cement Pickaxe"),
	inventory_image = "gloopblocks_cement_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.50, [2]=1.40, [3]=0.90}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:shovel_cement", {
	description = S("Cement Shovel"),
	inventory_image = "gloopblocks_cement_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=0.60, [3]=0.45}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:axe_cement", {
	description = S("Cement Axe"),
	inventory_image = "gloopblocks_cement_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.00, [2]=1.30, [3]=0.80}, uses=25, maxlevel=2},
			fleshy={times={[2]=1.20, [3]=0.65}, uses=30, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:sword_cement", {
	description = S("Cement Sword"),
	inventory_image = "gloopblocks_cement_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=1.60, [2]=0.80, [3]=0.40}, uses=15, maxlevel=2},
			snappy={times={[2]=0.75, [3]=0.35}, uses=30, maxlevel=1},
			choppy={times={[3]=0.80}, uses=30, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("gloopblocks:pick_evil", {
	description = S("Evil Pickaxe"),
	inventory_image = "gloopblocks_evil_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.10, [2]=0.10, [3]=0.10}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:shovel_evil", {
	description = S("Evil Shovel"),
	inventory_image = "gloopblocks_evil_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:axe_evil", {
	description = S("Evil Axe"),
	inventory_image = "gloopblocks_evil_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2},
			fleshy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:sword_evil", {
	description = S("Evil Sword"),
	inventory_image = "gloopblocks_evil_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			snappy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			choppy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=8},
	}
})

-- Other items

minetest.register_craftitem("gloopblocks:evil_stick", {
	description = S("Evil Stick"),
	inventory_image = "gloopblocks_evil_stick.png",
})

-- define lava-cooling-based nodes and hook into the default lavacooling
-- functions to generate basalt, pumice, and obsidian

if minetest.setting_getbool("gloopblocks_lavacooling") ~= false then

	minetest.register_node("gloopblocks:obsidian_cooled", {
		description = S("Obsidian"),
		tiles = {"default_obsidian.png"},
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		groups = {cracky=1, level=2, not_in_creative_inventory=1},
		drop = "default:obsidian",
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			minetest.add_node(pos, {name = "default:obsidian"})
		end
	})

	minetest.register_node("gloopblocks:basalt_cooled", {
		description = S("Basalt"),
		tiles = {"gloopblocks_basalt.png"},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		drop = "gloopblocks:basalt",
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			minetest.add_node(pos, {name = "gloopblocks:basalt"})
		end
	})

	minetest.register_node("gloopblocks:pumice_cooled", {
		description = S("Pumice"),
		tiles = {"gloopblocks_pumice.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		drop = "gloopblocks:pumice",
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			minetest.add_node(pos, {name = "gloopblocks:pumice"})
		end
	})

	local gloopblocks_search_nearby_nodes = function(pos, node)
		if minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name == node then return true end
		if minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name == node then return true end
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == node then return true end
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == node then return true end
		if minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name == node then return true end
		if minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name == node then return true end
		return false
	end

	default.cool_lava = function(pos, node)
		if node.name == "default:lava_source" then
			if gloopblocks_search_nearby_nodes(pos,"default:water_source")
			or gloopblocks_search_nearby_nodes(pos,"default:water_flowing") then
				minetest.set_node(pos, {name="gloopblocks:obsidian_cooled"})
			end
		else -- Lava flowing
			if gloopblocks_search_nearby_nodes(pos,"default:water_source") then
				minetest.set_node(pos, {name="gloopblocks:basalt_cooled"})
			elseif gloopblocks_search_nearby_nodes(pos,"default:water_flowing") then
				minetest.set_node(pos, {name="gloopblocks:pumice_cooled"})
			end
		end
	end
end

local fence_texture =
	"default_fence_overlay.png^default_steel_block.png^default_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("gloopblocks:fence_steel", {
	description = S("Steel Fence"),
	drawtype = "fencelike",
	tiles = {"default_steel_block.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 2 },
	sounds = default.node_sound_stone_defaults(),
})

if minetest.get_modpath("worldedit") then
	function gloopblocks.liquid_ungrief(pos1, pos2, name)
		local count
		local p1to2 = minetest.pos_to_string(pos1).." and "..minetest.pos_to_string(pos2)
		local volume = worldedit.volume(pos1, pos2)
		minetest.chat_send_player(name, "Cleaning-up lava/water griefing between "..p1to2.."...")
		if volume > 1000000 then
			minetest.chat_send_player(name, "This operation could affect up to "..volume.." nodes.  It may take a while.")
		end
		minetest.log("action", name.." performs lava/water greifing cleanup between "..p1to2..".")
		count = worldedit.replace(pos1, pos2, "default:lava_source", "air")
		count = worldedit.replace(pos1, pos2, "default:lava_flowing", "air")
		count = worldedit.replace(pos1, pos2, "default:water_source", "air")
		count = worldedit.replace(pos1, pos2, "default:water_flowing", "air")
		count = worldedit.replace(pos1, pos2, "default:river_water_source", "air")
		count = worldedit.replace(pos1, pos2, "default:river_water_flowing", "air")
		count = worldedit.replace(pos1, pos2, "gloopblocks:pumice_cooled", "air")
		count = worldedit.replace(pos1, pos2, "gloopblocks:basalt_cooled", "air")
		count = worldedit.replace(pos1, pos2, "gloopblocks:obsidian_cooled", "air")
		count = worldedit.fixlight(pos1, pos2)
		minetest.chat_send_player(name, "Operation completed.")
	end

	minetest.register_chatcommand("/liquid_ungrief", {
		params = "[size]",
		privs = {worldedit = true},
		description = "Repairs greifing caused by spilling lava and water (and their \"cooling\" results)",
		func = function(name, params)
			local pos1 = worldedit.pos1[name]
			local pos2 = worldedit.pos2[name]
			if not pos1 or not pos2 then return end
			gloopblocks.liquid_ungrief(pos1, pos2, name)
		end
	})
end

dofile(minetest.get_modpath("gloopblocks").."/crafts.lua")

minetest.register_alias("nyancat:nyancat_rainbow", "gloopblocks:rainbow_block_horizontal")
minetest.register_alias("default:nyancat_rainbow", "gloopblocks:rainbow_block_horizontal")

print(S("Gloopblocks Loaded!"))
