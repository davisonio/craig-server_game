streets.workshop = {}

streets.workshop.register_sign  = function(nodename, desc, img, rrecipe, rtime)
	
	minetest.register_node(nodename, {
		description = desc,
		tiles = {img},
		inventory_image = img,
		wield_image = img,
		groups = {snappy = 1,attached_node = 1},
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", desc)
		end,
		drawtype = "nodebox",
		node_box = {
			type = "wallmounted",
			fixed = {
				{-0.4,-0.5,-0.4,0.4,-0.4,0.4}
			}
		},
		paramtype = "light",
		paramtype2 = "wallmounted",
		walkable = false,
		sunlight_propagates = true,
		selection_box = {
			type = "wallmounted"
		},
		streets = {
			signworkshop = {
				recipe = rrecipe,
				time = rtime
			}
		}
	})
end

local forms = {
	inactive = {
		"size[12,10]",
		"label[3.5,0;"..streets.S("Sign workshop - Create signs for your roads!").."]",
		"label[0,0.5;"..streets.S("Available signs:").."]",
		"list[context;streets:signworkshop_list;0,1;5,4]",
		"label[9,0.5;"..streets.S("Needed stuff:").."]",
		"list[context;streets:signworkshop_recipe;8,1;4,1]",
		"label[9,2;"..streets.S("Put it here:").."]",
		"list[context;streets:signworkshop_input;8,3;4,1]",
		"button[8,4;2,1;streets:signworkshop_send;"..streets.S("Start!").."]",
		"label[5.8,0.5;"..streets.S("Selected:").."]",
		"list[context;streets:signworkshop_select;6,1;1,1]",
		"label[5.8,2.5;"..streets.S("Output:").."]",
		"list[context;streets:signworkshop_output;6,3;1,1]",
		"list[current_player;main;2,6;8,1]",
		"list[current_player;main;2,7.25;8,3;8]",
		default.gui_bg,
		default.gui_bg_img,
		default.gui_slots,
		default.get_hotbar_bg(2, 6)
	},
	active = {
		"size[12,10]",
		"label[3.5,0;"..streets.S("Sign workshop - Create signs for your roads!").."]",
		"label[0,0.5;"..streets.S("Available signs:").."]",
		"list[context;streets:signworkshop_list;0,1;5,4]",
		"label[9,0.5;"..streets.S("Needed stuff:").."]",
		"list[context;streets:signworkshop_recipe;8,1;4,1]",
		"label[9,2;"..streets.S("Put it here:").."]",
		"list[context;streets:signworkshop_input;8,3;4,1]",
		"label[5.8,0.5;"..streets.S("Selected:").."]",
		"list[context;streets:signworkshop_select;6,1;1,1]",
		"label[5.8,2.5;"..streets.S("Output:").."]",
		"list[context;streets:signworkshop_output;6,3;1,1]",
		"list[current_player;main;2,6;8,1]",
		"list[current_player;main;2,7.25;8,3;8]",
		default.gui_bg,
		default.gui_bg_img,
		default.gui_slots,
		default.get_hotbar_bg(2, 6),
	}
}

streets.workshop.signs = {}

minetest.after(0, function()
	for k, v in pairs(minetest.registered_nodes) do
		if v.streets and v.streets.signworkshop then
			table.insert(streets.workshop.signs, k)
		end
	end
end)

minetest.register_node("streets:signworkshop",{
	description = streets.S("Sign workshop"),
	tiles = {"streets_signworkshop_top.png","streets_signworkshop_bottom.png","streets_signworkshop_side.png","streets_signworkshop_side.png","streets_signworkshop_side.png","streets_signworkshop_front.png"},
	groups = {cracky = 1, level = 2},
	paramtype2 = "facedir",
	after_place_node = function(pos)
		minetest.get_meta(pos):set_string("formspec",table.concat(forms.inactive))
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("streets:signworkshop_list",5*4)
		inv:set_size("streets:signworkshop_recipe",3*2)
		inv:set_size("streets:signworkshop_input",4*1)
		inv:set_size("streets:signworkshop_select",1*1)
		inv:set_size("streets:signworkshop_output",1*1)
		-- Fill
		for k, v in pairs(streets.workshop.signs) do
			inv:add_item("streets:signworkshop_list", v)
		end
		-- Meta
		meta:set_string("infotext",streets.S("Sign workshop idle"))
		meta:set_string("idle","y")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname ~= "streets:signworkshop_input" then
			return 0
		else
			return 1
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		-- Move items inside input slots
		if to_list == "streets:signworkshop_input" and from_list == "streets:signworkshop_input" then
			return 1
		-- List -> selection
		elseif from_list == "streets:signworkshop_list" and to_list == "streets:signworkshop_select" then
			local inv = minetest.get_meta(pos):get_inventory()
			local selected = inv:get_stack("streets:signworkshop_list",from_index):to_table()
			local need = minetest.registered_nodes[selected.name].streets.signworkshop.recipe
			inv:set_list("streets:signworkshop_recipe",{need[1],need[2],need[3],need[4]})
			return 1
		-- selection -> list
		elseif from_list == "streets:signworkshop_select" and to_list == "streets:signworkshop_list" then
			local inv = minetest.get_meta(pos):get_inventory()
			inv:set_list("streets:signworkshop_recipe",{"","","",""})
			return 1
		-- Every other case
		else
			return 0
		end
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if listname == "streets:signworkshop_input" or listname == "streets:signworkshop_output" then
			return 99
		else
			return 0
		end
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		--
		if inv:is_empty("streets:signworkshop_input") ~= true and inv:is_empty("streets:signworkshop_select") ~= true and meta:get_string("idle") == "y" then
			local selection = inv:get_stack("streets:signworkshop_select",1):get_name()
			local def = minetest.registered_nodes[selection].streets.signworkshop
			local need = inv:get_list("streets:signworkshop_recipe")
			local has = inv:get_list("streets:signworkshop_input")
			for k, v in pairs(need) do
				need[k] = need[k]:to_table()
				if need[k] == nil then need[k] = { name = "" } end
			end
			for k, v in pairs(has) do
				has[k] = has[k]:to_table()
				if has[k] == nil then has[k] = { name = "" } end
			end
			if need[1].name == has[1].name and need[2].name == has[2].name and need[3].name == has[3].name and need[4].name == has[4].name then
				meta:set_string("infotext",streets.S("Sign workshop working"))
				meta:set_string("idle","n")
				meta:set_string("formspec",table.concat(forms.active) .. "label[8,4;"..streets.S("Please wait %s seconds..."):format(def.time).."]")
				-- Clear input
				inv:set_list("streets:signworkshop_input",{"","","",""})
				minetest.after(def.time,function()
					-- Reset infotext and meta
					meta:set_string("infotext",streets.S("Sign workshop idle"))
					meta:set_string("idle","y")
					meta:set_string("formspec",table.concat(forms.inactive))
					-- Fill output
					inv:add_item("streets:signworkshop_output",selection)
				end)
			end
		end
	end
})

minetest.register_craft({
	output = "streets:signworkshop",
	recipe = {
		{"default:steel_ingot","default:glass","default:steel_ingot"},
		{"default:steel_ingot","default:diamond","default:steel_ingot"},
		{"default:cobble","default:cobble","default:cobble"}
	}
})

streets.workshop.register_sign("streets:sign_blank", streets.S("Empty sign"), "streets_sign_back.png", {"default:steel_ingot","","",""}, 3)
streets.workshop.register_sign("streets:sign_lava", streets.S("Warning sign (lava)"), "streets_sign_lava.png", {"streets:sign_blank","bucket:bucket_lava","",""}, 5)
streets.workshop.register_sign("streets:sign_water", streets.S("Warning sign (water)"), "streets_sign_water.png", {"streets:sign_blank","bucket:bucket_water","",""}, 5)
streets.workshop.register_sign("streets:sign_construction", streets.S("Warning sign (Construction area)"), "streets_sign_construction.png", {"streets:sign_blank","default:dirt","",""}, 5)
streets.workshop.register_sign("streets:sign_mine", streets.S("Notice sign (Public Mine Ahead)"), "streets_sign_mine.png", {"streets:sign_blank","default:dirt","",""}, 5)
streets.workshop.register_sign("streets:sign_shop", streets.S("Notice sign (Shop/Mall Ahead)"), "streets_sign_construction.png", {"streets:sign_blank","default:dirt","",""}, 5)
streets.workshop.register_sign("streets:sign_workshop", streets.S("Notice sign (Public Workshop Ahead)"), "streets_sign_workshop.png", {"streets:sign_blank","default:dirt","",""}, 5)
streets.workshop.register_sign("streets:sign_grasswalk", streets.S("Warning sign (No walking on the grass)"), "streets_sign_grasswalk.png", {"streets:sign_blank","default:dirt","",""}, 5)
