factory.swapper_formspec =
	"size[8,9.5]"..
	factory_gui_bg..
	factory_gui_bg_img_2..
	factory_gui_slots..
	"list[current_name;left;0,1.25;2,4;]"..
	"list[current_name;right;6,1.25;2,4;]"..
	"list[current_name;loverflow;0,0;3,1;]"..
	"list[current_name;roverflow;5,0;3,1;]"..
	"list[current_name;overflow;3,1.25;2,1;]"..
	"list[current_name;input;3,3.25;2,2;]"..
	"image[3.5,0;1,1;factory_square_white.png]"..
	"image[2,1.25;1,1;factory_square_yellow.png]"..
	"image[5,1.25;1,1;factory_square_blue.png]"..
	"list[current_player;main;0,5.5;8,1;]"..
	"list[current_player;main;0,6.75;8,3;8]"

minetest.register_node("factory:swapper", {
	description = "Swapper",
	tiles = {"factory_machine_steel_dark.png", "factory_machine_steel_dark.png", "factory_machine_steel_dark.png^factory_square_blue.png",
		"factory_machine_steel_dark.png^factory_square_yellow.png", "factory_machine_steel_dark.png^factory_square_white.png", "factory_machine_steel_dark.png^factory_square_red.png"},
	paramtype2 = "facedir",
	groups = {cracky=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", factory.swapper_formspec)
		meta:set_string("infotext", "Swapper")
		local inv = meta:get_inventory()
		inv:set_size("left", 8)
		inv:set_size("right", 8)
		inv:set_size("loverflow", 3)
		inv:set_size("roverflow", 3)
		inv:set_size("overflow", 2)
		inv:set_size("input", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("left") then
			return false
		elseif not inv:is_empty("right") then
			return false
		elseif not inv:is_empty("loverflow") then
			return false
		elseif not inv:is_empty("roverflow") then
			return false
		elseif not inv:is_empty("overflow") then
			return false
		elseif not inv:is_empty("input") then
			return false
		end
		return true
	end
})

minetest.register_abm({
	nodenames = {"factory:swapper"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("input") then
			for i,item in ipairs(inv:get_list("input")) do
				if not item:is_empty() and item:get_name() ~= "" then 
					local item_to_move = item:peek_item()
					for _,litem in ipairs(inv:get_list("left")) do
						if litem:get_name() == item:get_name() and inv:room_for_item("loverflow", item_to_move) then
							item:take_item()
							inv:set_stack("input", i, item)
							inv:add_item("loverflow", item_to_move)
							return
						end
					end
					for _,ritem in ipairs(inv:get_list("right")) do
						if ritem:get_name() == item:get_name() and inv:room_for_item("roverflow", item_to_move) then
							item:take_item()
							inv:set_stack("input", i, item)
							inv:add_item("roverflow", item_to_move)
							return
						end
					end
					if inv:room_for_item("overflow", item_to_move) then
						item:take_item()
						inv:set_stack("input", i, item)
						inv:add_item("overflow", item_to_move)
						return
					end
				end
			end
		end
	end
})	