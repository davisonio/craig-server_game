-- Rubber mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The Rubber mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The Rubber mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the Rubber mod. If not, see <http://www.gnu.org/licenses/>.

minetest.register_node("rubber:rubber_tree_full", {
	description = "Rubber tree",
	tiles = {"default_tree_top.png", "default_tree_top.png", "rubber_tree_full.png"},
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	drop = "rubber:rubber_tree_full",
	sounds = default.node_sound_wood_defaults(),
         on_dig = function(pos, node, digger)
		minetest.node_dig(pos, node, digger)
		minetest.remove_node(pos)
	end,
         after_destruct = function(pos, oldnode)
		oldnode.name = "rubber:rubber_tree_empty"
		minetest.set_node(pos, oldnode)
	end
})


minetest.register_node("rubber:rubber_tree_empty", {
	tiles = {"default_tree_top.png", "default_tree_top.png", "rubber_tree_empty.png"},
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2, not_in_creative_inventory=1},
	drop = "rubber:rubber_tree_empty",
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_abm({
	nodenames = {"rubber:rubber_tree_empty"},
	interval = 60,
	chance = 15,
	action = function(pos, node)
		node.name = "rubber:rubber_tree_full"
		minetest.set_node(pos, node)
	end
})

minetest.register_craftitem("rubber:bucket_rubber", {
	description = "Bucket of rubber",
	inventory_image = "bucket_rubber.png",
	stack_max = 1,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "rubber:rubber_tree_full",
	wherein        = "default:tree",
	clust_scarcity = 12*12*12,
	clust_num_ores = 125,
	clust_size     = 5,
	height_min     = -31000,
	height_max     = 31000,
	flags          = "absheight",
})

local bucket_tmp = {
	source = "rubber:rubber_tree_full",
	itemname = "rubber:bucket_rubber"
}
bucket.liquids["rubber:rubber_tree_full"] = bucket_tmp

