------------
-- Rubber --
------------

-- Rubber tree full
minetest.register_node("rubber_industry:rubber_tree_full", {
	description = "Rubber tree - Full",
	tiles = {"default_tree_top.png", "default_tree_top.png", "rubber_industry_rubber_tree_full.png"},
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
	on_dig = function(pos, node, digger)
		minetest.node_dig(pos, node, digger)
		minetest.remove_node(pos)
	end,
	after_destruct = function(pos, oldnode)
		oldnode.name = "rubber_industry:rubber_tree_empty"
		minetest.set_node(pos, oldnode)
	end
})

-- Rubber tree empty
minetest.register_node("rubber_industry:rubber_tree_empty", {
	description = "Rubber tree - Empty",
	tiles = {"default_tree_top.png", "default_tree_top.png", "rubber_industry_rubber_tree_empty.png"},
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
})

-- Rubber tree empty will turn back into rubber tree full using an ABM.
minetest.register_abm({
	nodenames = {"rubber_industry:rubber_tree_empty"},
	interval = 60,
	chance = 15,
	action = function(pos, node)
		node.name = "rubber_industry:rubber_tree_full"
		minetest.set_node(pos, node)
	end
})

-- Rubber Bucket
minetest.register_craftitem("rubber_industry:bucket_rubber", {
	description = "Rubber Bucket",
	inventory_image = "rubber_industry_bucket_rubber.png",
	stack_max = 1,
})

-- Rubber tree will generate inside default:tree blocks.
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "rubber_industry:rubber_tree_full",
	wherein        = "default:tree",
	clust_scarcity = 14*14*14,
	clust_num_ores = 125,
	clust_size     = 5,
	height_min     = -100,
	height_max     = 100,
	flags          = "absheight",
})

bucket.liquids["rubber_industry:rubber_tree_full"] = bucket_tmp

local bucket_tmp = {
	source = "rubber_industry:rubber_tree_full",
	itemname = "rubber_industry:bucket_rubber"
}

-- Too much empty rubber tree? Use it as fuel
minetest.register_craft({
	type = "fuel",
	recipe = "rubber_industry:rubber_tree_empty",
	burntime = 60
})

-- Rubber sheet definition
minetest.register_craftitem("rubber_industry:rubber_sheet",{
	description = "Rubber sheet",
	inventory_image = "rubber_industry_rubber_sheet.png",
})

-- Rubber Lump definition
minetest.register_craftitem("rubber_industry:rubber_lump",{
	description = "Rubber lump",
	inventory_image = "rubber_industry_rubber_lump.png"
})

-- Craft rubber bucket into rubber lump
minetest.register_craft({
	output = "rubber_industry:rubber_lump",
	recipe = {
		{"rubber_industry:bucket_rubber"},
	},
	replacements = {
		{"rubber_industry:bucket_rubber", "bucket:bucket_empty"}
	},
})

-- Cooking rubber lump in order to get rubber sheet.
minetest.register_craft({
	type = "cooking",
	output = "rubber_industry:rubber_sheet",
	recipe = "rubber_industry:rubber_lump"
})
