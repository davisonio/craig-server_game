-- Load support for translation.
local S = minetest.get_translator("more_chests")

local pipeworks_enabled = minetest.global_exists("pipeworks")

minetest.register_node("more_chests:wifi", {
	description = S("Wifi Chest"),
	tiles = {"wifi_top.png", "wifi_top.png", "wifi_side.png",
		"wifi_side.png", "wifi_side.png",
		{name="wifi_front_animated.png", animation={type="vertical_frames",
			aspect_w=16, aspect_h=16, length=2.0}}},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2, tubedevice = 1, tubedevice_receiver = 1},
	-- Pipeworks
	tube = pipeworks_enabled and {
		insert_object = function(pos, node, stack, direction, owner)
			if not owner then
				return stack
			end
			local player = minetest.get_player_by_name(owner)
			if not player then
				return stack
			end
			local inv = player:get_inventory()
			return inv:add_item("more_chests:wifi", stack)
		end,
		can_insert = function(pos, node, stack, direction, owner)
			if not owner then
				return false
			end
			local player = minetest.get_player_by_name(owner)
			if not player then
				return false
			end
			local inv = player:get_inventory()
			return inv:room_for_item("more_chests:wifi", stack)
		end,
		input_inventory = "more_chests:wifi",
		return_input_invref = function(pos, node, direction, player_name)
			if not player_name then
				return false
			end
			local player = minetest.get_player_by_name(player_name)
			if not player then
				return false
			end
			return player:get_inventory()
		end,
		connect_sides = {left = 1, right = 1, back = 1, front = 1, bottom = 1, top = 1}
	} or nil,
	after_place_node = pipeworks_enabled and pipeworks.after_place or nil,
	after_dig_node = pipeworks_enabled and pipeworks.after_dig or nil,
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				default.gui_bg ..
				default.gui_bg_img ..
				default.gui_slots ..
				"list[current_player;more_chests:wifi;0,0.3;8,4;]"..
				"list[current_player;main;0,4.85;8,1;]" ..
				"list[current_player;main;0,6.08;8,3;8]" ..
				"listring[current_player;more_chests:wifi]" ..
				"listring[current_player;main]" ..
				default.get_hotbar_bg(0,4.85))

		meta:set_string("infotext", S("Wifi Chest"))
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in wifi chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to wifi chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from wifi chest at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_craft({
	output = 'more_chests:wifi',
	recipe = {
		{'default:wood','default:mese','default:wood'},
		{'default:wood','default:steel_ingot','default:wood'},
		{'default:wood','default:wood','default:wood'}
	}
})

minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("more_chests:wifi", 8*4)
end)
