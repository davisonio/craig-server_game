--Created by Krock for the BitChange mod
--License: WTFPL

local function set_infotext(meta, mode)
	if mode == meta:get_int("state") then
		return
	end
	local owner = meta:get_string("owner")
	local text = "Tool Repair "
	local text2 = "[Inactive]"
	if mode == 0 then
		text = text.."(constructing)"
	elseif mode == 1 then
		text2 = "Inactive"
	elseif mode == 2 then
		text2 = "Active"
	end
	if mode ~= 0 then
		 text = text.."["..text2.."] (owned by "..owner..")"
	end
	
	meta:set_int("state", mode)
	meta:set_string("infotext", text)
	
	local formspec =
		"size[8,9]"..
		"label[1,1;Damaged tool:]"..
		"list[current_name;src;3.5,1;1,1;]"..
		"label[3.4,2;\\["..text2.."\\]]"..
		"label[1.5,3;MineNinth:]]"..
		"list[current_name;fuel;3.5,3;1,1;]"..
		"list[current_player;main;0,5;8,4;]"
	meta:set_string("formspec", formspec)
end

minetest.register_node("bitchange:toolrepair", {
	description = "Tool Repair",
	tiles = {"bitchange_toolrepair_top.png", "bitchange_toolrepair_bottom.png", 
		"bitchange_toolrepair_side.png", "bitchange_toolrepair_side.png", 
		"bitchange_toolrepair_side.png", "bitchange_toolrepair_side.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
	after_place_node = function(pos, placer, itemstack)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name())
		meta:set_int("state", 0)
		set_infotext(meta, 1)
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", "")
		set_infotext(meta, 0)
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("fuel", 1)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if player:get_player_name() ~= meta:get_string("owner") then
			return 0
		end
		
		if listname == "src" then
			if(stack:get_wear() > 0
				and stack:get_wear() < 65535
				and stack:get_name() ~= "technic:water_can"
				and stack:get_name() ~= "technic:lava_can") then
				return 1
			end
		elseif listname == "fuel" then
			if stack:get_name() == "bitchange:mineninth" then
				return stack:get_count()
			end
		end
		return 0
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if bitchange.has_access(meta:get_string("owner"), player:get_player_name()) then
			return stack:get_count()
		end
		return 0
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if bitchange.has_access(meta:get_string("owner"), player:get_player_name()) then
			return inv:is_empty("src") and inv:is_empty("fuel")
		end
		return 0
	end
})

minetest.register_craft({
	output = "bitchange:toolrepair",
	recipe = {
		{"default:steel_ingot", "default:stick", "default:steel_ingot"},
		{"default:jungletree", "default:mese_crystal", "default:jungletree"},
		{"default:jungletree", "bitchange:minecoinblock", "default:jungletree"}
	}
})

minetest.register_abm({
	nodenames = {"bitchange:toolrepair"},
	interval = 5,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local src = inv:get_stack("src", 1)
		local wear = src:get_wear()
		local repair = -1400
		
		if(src:is_empty() 
			or wear == 0
			or wear == 65535
			or src:get_name() == "technic:water_can"
			or src:get_name() == "technic:lava_can") then
			set_infotext(meta, 1)
			return
		end
		local fuel = inv:get_stack("fuel", 1)
		if(fuel:is_empty() or fuel:get_name() ~= "bitchange:mineninth") then
			set_infotext(meta, 1)
			return
		end
		
		if(wear + repair < 0) then
			src:add_wear(repair + wear)
		else
			src:add_wear(repair)
		end
		inv:set_stack("src", 1, src)
		set_infotext(meta, 2)
		inv:remove_item("fuel", "bitchange:mineninth 1")
	end
})