-- MOD TO BE REMOVED SOON

default.enderchest_formspec = 
	"size[8,9]"..
	"list[detached:enderchest;main;0,0;8,4;]"..
	"list[current_player;main;0,5;8,4;]"

local inv = minetest.create_detached_inventory ("enderchest",{
 -- Called when a player wants to move items inside the inventory
    allow_move = function(inv, from_list, from_index, to_list, to_index, count, player) return 1 end,
 
    -- Called when a player wants to put items into the inventory
    allow_put = function(inv, listname, index, stack, player) return 1 end,
	
 
    -- Called when a player wants to take items out of the inventory
    allow_take = function(inv, listname, index, stack, player) return 1 end,
 
    -- on_* - no return value
    -- Called after the actual action has happened, according to what was allowed.
    on_move = function(inv, from_list, from_index, to_list, to_index, count, player) end,
    on_put = function(inv, listname, index, stack, player) end,
    on_take = function(inv, listname, index, stack, player) end,
})
inv:set_size("main",8*4)


minetest.register_node("enderchest:enderchest", {
	description = "Enderchest",
	drawtype = "normal",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "enderchest_front.png",
	wieldimage = "dumbwaiter_front.png",
	tiles = {
                  "enderchest_top.png",
		"enderchest_top.png",
		"enderchest_side.png",
		"enderchest_side.png",
		"enderchest_side.png",
		"enderchest_front.png"},
	groups = {oddly_breakable_by_hand=2},
	drop = "default:diamondblock",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",default.enderchest_formspec)
		meta:set_string("infotext", "Enderchest")
		local inv = meta:get_inventory()
		inv:set_size("main",8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in ender chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to ender chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from ender chest at "..minetest.pos_to_string(pos))
	end,
})