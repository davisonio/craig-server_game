--Created by Krock for the BitChange mod
--   Something like a chest...experimental, have fun!
--License: WTFPL

function get_warehouse_tube_config(mode)
	if(bitchange.warehouse_pipeworks) then
		if(mode == 1) then
			return {cracky=1, level=2, tubedevice=1, tubedevice_receiver=1}
		else
			return {
				insert_object = function(pos, node, stack, direction)
					local meta = minetest.get_meta(pos)
					local inv = meta:get_inventory()
					if inv:room_for_item("main", stack) then
						return inv:add_item("main", stack)
					else
						return inv:add_item("main2", stack)
					end
				end,
				can_insert = function(pos, node, stack, direction)
					local meta = minetest.get_meta(pos)
					local inv = meta:get_inventory()
					if inv:room_for_item("main", stack) then
						return true
					else
						return inv:room_for_item("main2", stack)
					end
				end,
				input_inventory = "main",
				connect_sides = {left=1, right=1, back=1, top=1, bottom=1}
			}
		end
	else
		if(mode == 1) then
			return {cracky=1, level=2}
		else
			return {
				insert_object = function(pos, node, stack, direction)
					return false
				end,
				can_insert = function(pos, node, stack, direction)
					return false
				end,
				connect_sides = {}
			}
		end
	end
end

minetest.register_node("bitchange:warehouse", {
	description = "Warehouse (Locked)",
	tiles = {"bitchange_warehouse_top.png", 
			"bitchange_warehouse_top.png", 
			"bitchange_warehouse_side.png",
			"bitchange_warehouse_side.png", 
			"bitchange_warehouse_side.png", 
			"bitchange_warehouse_front.png"},
	paramtype2 = "facedir",
	groups = get_warehouse_tube_config(1),
	tube = get_warehouse_tube_config(2),
	legacy_facedir_simple = true,
	sounds = {name="default_hard_footstep", gain=1.0},
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Warehouse (owned by "..
				meta:get_string("owner")..")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "size[12,10;]"..
				"label[0,0;Warehouse]"..
				"label[2,0;Layer:]"..
				"button[3,0;1,1;inv_lv2;1]"..
				"label[4,0;Workspace:]"..
				"list[current_name;worksp;6,0;5,1;]"..
				"list[current_name;main;0,1;12,4;]"..
				"list[current_player;main;2,6;8,4;]")
		meta:set_string("infotext", "Warehouse (constructing)")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 12*4)
		inv:set_size("worksp", 5*1)
		inv:set_size("main2", 12*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and inv:is_empty("main2") and inv:is_empty("worksp")
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not bitchange.has_access(meta:get_string("owner"), player:get_player_name()) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not bitchange.has_access(meta:get_string("owner"), player:get_player_name()) then
			return 0
		end
		return stack:get_count()
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not bitchange.has_access(meta:get_string("owner"), player:get_player_name()) then
			return 0
		end
		return stack:get_count()
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		if not bitchange.has_access(meta:get_string("owner"), sender:get_player_name()) then
			return
		end
		if fields.inv_lv1 then
			meta:set_string("formspec", "size[12,10;]"..
				"label[0,0;Warehouse]"..
				"label[2,0;Layer:]"..
				"button[3,0;1,1;inv_lv2;1]"..
				"label[4,0;Workspace:]"..
				"list[current_name;worksp;6,0;5,1;]"..
				"list[current_name;main;0,1;12,4;]"..
				"list[current_player;main;2,6;8,4;]")
		end
		if fields.inv_lv2 then
			meta:set_string("formspec", "size[12,10;]"..
				"label[0,0;Warehouse]"..
				"label[2,0;Layer:]"..
				"button[3,0;1,1;inv_lv1;2]"..
				"label[4,0;Workspace:]"..
				"list[current_name;worksp;6,0;5,1;]"..
				"list[current_name;main2;0,1;12,4;]"..
				"list[current_player;main;2,6;8,4;]")
		end
	end,
})

minetest.register_craft({
	output = "bitchange:warehouse",
	recipe = {
		{"default:chest_locked", "bitchange:minecoinblock", "default:chest_locked"},
		{"default:chest_locked", "default:mese", "default:chest_locked"},
		{"default:chest_locked", "default:chest_locked", "default:chest_locked"}
	}
})