--Created by Krock for the BitChange mod
--License: WTFPL

minetest.register_node("bitchange:donationbox", {
	description = "Donation box",
	tiles = {"default_wood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.4375,0.25,-0.375,0.425}, --NodeBox1
			{0.25,-0.5,-0.4375,0.425,0.25,0.425}, --NodeBox2
			{-0.4375,-0.5,-0.4375,-0.25,0.25,0.425}, --NodeBox3
			{-0.3125,-0.5,-0.4375,0.25,0.0625,-0.25}, --NodeBox4
			{-0.25,-0.5,0.25,0.25,0.25,0.425}, --NodeBox5
			{-0.5,0.25,-0.5,0.5,0.375,0.5}, --NodeBox6
		}
	},
	selection_box = {
		type = "fixed", 
		fixed = {
			{-0.4,-0.5,-0.4,0.4,0.35,0.4},
		},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Donation box (constructing)")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 4*2)
	end,
	after_place_node = function(pos, placer, itemstack)
		local owner = placer:get_player_name()
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "size[8,8;]"..
				"label[2,0;Donation box (owned by "..owner..")]"..
				"list[current_name;main;2,1;4,2;]"..
				"list[current_player;main;0,4;8,4;]")
		meta:set_string("infotext", "Donation box (owned by "..owner..")")
		meta:set_string("owner", owner)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("main") then
			return false
		elseif bitchange.has_access(meta:get_string("owner"), player:get_player_name()) then
			return true
		end
		return false
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return stack:get_count()
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not bitchange.has_access(meta:get_string("owner"), player:get_player_name()) then
			return 0
		end
		return stack:get_count()
	end,
})

minetest.register_craft({
	output = "bitchange:donationbox",
	recipe = {
		{"default:wood", "", "default:wood"},
		{"default:wood", "bitchange:minecoin", "default:wood"},
		{"default:wood", "default:wood", "default:wood"}
	}
})