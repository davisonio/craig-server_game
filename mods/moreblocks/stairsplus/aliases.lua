
local function register_stairsplus_alias(modname, origname, newname)
	minetest.register_alias(modname..":slab_"..origname, "moreblocks:slab_"..newname)
	minetest.register_alias(modname..":slab_"..origname.."_inverted", "moreblocks:slab_"..newname.."_inverted")
	minetest.register_alias(modname..":slab_"..origname.."_wall", "moreblocks:slab_"..newname.."_wall")
	minetest.register_alias(modname..":slab_"..origname.."_quarter", "moreblocks:slab_"..newname.."_quarter")
	minetest.register_alias(modname..":slab_"..origname.."_quarter_inverted", "moreblocks:slab_"..newname.."_quarter_inverted")
	minetest.register_alias(modname..":slab_"..origname.."_quarter_wall", "moreblocks:slab_"..newname.."_quarter_wall")
	minetest.register_alias(modname..":slab_"..origname.."_three_quarter", "moreblocks:slab_"..newname.."_three_quarter")
	minetest.register_alias(modname..":slab_"..origname.."_three_quarter_inverted", "moreblocks:slab_"..newname.."_three_quarter_inverted")
	minetest.register_alias(modname..":slab_"..origname.."_three_quarter_wall", "moreblocks:slab_"..newname.."_three_quarter_wall")
	minetest.register_alias(modname..":stair_"..origname, "moreblocks:stair_"..newname)
	minetest.register_alias(modname..":stair_"..origname.."_inverted", "moreblocks:stair_"..newname.."_inverted")
	minetest.register_alias(modname..":stair_"..origname.."_wall", "moreblocks:stair_"..newname.."_wall")
	minetest.register_alias(modname..":stair_"..origname.."_wall_half", "moreblocks:stair_"..newname.."_wall_half")
	minetest.register_alias(modname..":stair_"..origname.."_wall_half_inverted", "moreblocks:stair_"..newname.."_wall_half_inverted")
	minetest.register_alias(modname..":stair_"..origname.."_half", "moreblocks:stair_"..newname.."_half")
	minetest.register_alias(modname..":stair_"..origname.."_half_inverted", "moreblocks:stair_"..newname.."_half_inverted")
	minetest.register_alias(modname..":stair_"..origname.."_right_half", "moreblocks:stair_"..newname.."_right_half")
	minetest.register_alias(modname..":stair_"..origname.."_right_half_inverted", "moreblocks:stair_"..newname.."_right_half_inverted")
	minetest.register_alias(modname..":stair_"..origname.."_wall_half", "moreblocks:stair_"..newname.."_wall_half")
	minetest.register_alias(modname..":stair_"..origname.."_wall_half_inverted", "moreblocks:stair_"..newname.."_wall_half_inverted")
	minetest.register_alias(modname..":stair_"..origname.."_inner", "moreblocks:stair_"..newname.."_inner")
	minetest.register_alias(modname..":stair_"..origname.."_inner_inverted", "moreblocks:stair_"..newname.."_inner_inverted")
	minetest.register_alias(modname..":stair_"..origname.."_outer", "moreblocks:stair_"..newname.."_outer")
	minetest.register_alias(modname..":stair_"..origname.."_outer_inverted", "moreblocks:stair_"..newname.."_outer_inverted")
	minetest.register_alias(modname..":panel_"..origname.."_bottom", "moreblocks:panel_"..newname.."_bottom")
	minetest.register_alias(modname..":panel_"..origname.."_top", "moreblocks:panel_"..newname.."_top")
	minetest.register_alias(modname..":panel_"..origname.."_vertical", "moreblocks:panel_"..newname.."_vertical")
	minetest.register_alias(modname..":micro_"..origname.."_bottom", "moreblocks:micro_"..newname.."_bottom")
	minetest.register_alias(modname..":micro_"..origname.."_top", "moreblocks:micro_"..newname.."_top")
end

register_stairsplus_alias("stairsplus", "stone", "stone")
register_stairsplus_alias("stairsplus", "wood", "wood")
register_stairsplus_alias("stairsplus", "cobble", "cobble")
register_stairsplus_alias("stairsplus", "brick", "brick")
register_stairsplus_alias("stairsplus", "sandstone", "sandstone")
register_stairsplus_alias("stairsplus", "glass", "glass")
register_stairsplus_alias("stairsplus", "tree", "tree")
register_stairsplus_alias("stairsplus", "jungletree", "jungletree")
register_stairsplus_alias("stairsplus", "desert_stone", "desert_stone")
register_stairsplus_alias("stairsplus", "steelblock", "steelblock")
register_stairsplus_alias("stairsplus", "mossycobble", "mossycobble")

register_stairsplus_alias("moreblocks", "coalstone", "coal_stone")
register_stairsplus_alias("moreblocks", "junglewood", "jungle_wood")
register_stairsplus_alias("moreblocks", "circlestonebrick", "circle_stone_bricks")
register_stairsplus_alias("moreblocks", "ironstone", "iron_stone")
register_stairsplus_alias("moreblocks", "coalglass", "coal_glass")
register_stairsplus_alias("moreblocks", "ironglass", "iron_glass")
register_stairsplus_alias("moreblocks", "glowglass", "glow_glass")
register_stairsplus_alias("moreblocks", "superglowglass", "super_glow_glass")
register_stairsplus_alias("moreblocks", "coalchecker", "coal_checker")
register_stairsplus_alias("moreblocks", "ironchecker", "iron_checker")
register_stairsplus_alias("moreblocks", "cactuschecker", "cactus_checker")
register_stairsplus_alias("moreblocks", "ironstonebrick", "iron_stone_bricks")
register_stairsplus_alias("moreblocks", "stonesquare", "stone_tile")
register_stairsplus_alias("moreblocks", "splitstonesquare", "split_stone_tile")
register_stairsplus_alias("moreblocks", "woodtile", "wood_tile")
register_stairsplus_alias("moreblocks", "woodtile_centered", "wood_tile_centered")
register_stairsplus_alias("moreblocks", "woodtile_full", "wood_tile_full")

