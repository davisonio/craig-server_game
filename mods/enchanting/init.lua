-- init.lua
-- workbench minetest mod, by darkrose
-- Copyright (C) Lisa Milne 2012 <lisa@ltmnet.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as
-- published by the Free Software Foundation, either version 2.1 of the
-- License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this program.  If not, see
-- <http://www.gnu.org/licenses/>

minetest.register_node("enchanting:enchanting_set", {
	description = "Enchanting Workshop",
	tile_images = {"enchanting_workshop_top.png","enchanting_workshop_bottom.png","enchanting_workshop_side.png"},
	inventory_image = "enchanting_workshop_top.png",
      drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
			"size[10,8]"..
			"list[current_name;table;1,1;5,1;]"..
			"list[current_name;dst;8,1;1,1;]"..
			"list[current_player;main;1,3;8,4;]")
		meta:set_string("infotext", "Enchanting Workshop")
		local inv = meta:get_inventory()
		inv:set_size("table", 5)
		inv:set_size("dst", 1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		if inv:is_empty("table") and inv:is_empty("dst") then
			return true
		end
		return false
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		if to_list == "dst" then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "dst" then
			return 0
		end
		return stack:get_count()
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		return stack:get_count()
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.node_metadata_inventory_move_allow_all(
				pos, from_list, from_index, to_list, to_index, count, player)
		if to_list == "table" or from_list == "table" then
			local meta = minetest.env:get_meta(pos)
			local inv = meta:get_inventory()
			local tablelist = inv:get_list("table")
			local crafted = nil

			if tablelist then
				crafted = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
			end

			if crafted then
				inv:set_stack("dst", 1, crafted.item)
			else
				inv:set_stack("dst", 1, nil)
			end
		end
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "table" then
			local meta = minetest.env:get_meta(pos)
			local inv = meta:get_inventory()
			local tablelist = inv:get_list("table")
			local crafted = nil

			if tablelist then
				crafted = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
			end

			if crafted then
				inv:set_stack("dst", 1, crafted.item)
			else
				inv:set_stack("dst", 1, nil)
			end
		end
	end,
	on_metadata_inventory_take = function(pos, listname, index, count, player)
		if listname == "table" then
			local meta = minetest.env:get_meta(pos)
			local inv = meta:get_inventory()
			local tablelist = inv:get_list("table")
			local crafted = nil

			if tablelist then
				crafted = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
			end

			if crafted then
				inv:set_stack("dst", 1, crafted.item)
			else
				inv:set_stack("dst", 1, nil)
			end
		elseif listname == "dst" then
			local meta = minetest.env:get_meta(pos)
			local inv = meta:get_inventory()
			local tablelist = inv:get_list("table")
			local crafted = nil
			local table_dec = nil

			if tablelist then
				crafted,table_dec = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
			end

			if table_dec then
				inv:set_list("table", table_dec.items)
			else
				inv:set_list("table", nil)
			end

			local tablelist = inv:get_list("table")

			if tablelist then
				crafted,table_dec = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
			end

			if crafted then
				inv:set_stack("dst", 1, crafted.item)
			else
				inv:set_stack("dst", 1, nil)
			end
		end
		return post
	end,

drawtype="nodebox",
paramtype = "light",
node_box = {
	type = "fixed",
	fixed = {
		{-0.375000,-0.500000,-0.375000,0.375000,-0.375000,0.375000}, --NodeBox 1
		{-0.250000,-0.500000,-0.250000,0.250000,0.187500,0.250000}, --NodeBox 2
		{-0.437500,0.187500,-0.437500,0.423792,0.500000,0.409390}, --NodeBox 3
	}
}
})

minetest.register_craft({
	output = '"enchanting:enchanting_set"',
	recipe = {
            {'default:obsidian', 'default:obsidian', 'default:obsidian'},
		{'default:obsidian', 'default:diamond', 'default:obsidian'},
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
	}
})

minetest.register_tool("enchanting:enchanted_shovel_diamond_durability", {
	description = "[Enchanced Durability] Diamond Shovel",
	inventory_image = "enchanting_shovel.png^durability_enchant.png",
	wield_image = "enchanting_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_craft({
	output = '"enchanting:enchanted_shovel_diamond_durability"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:diamond"','"default:shovel_diamond"','"default:diamond"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_sword_diamond_durability", {
	description = "[Enchanced Durability] Diamond Sword",
	inventory_image = "enchanting_sword.png^durability_enchant.png",
	wield_image = "enchanting_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=50, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_sword_diamond_durability"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:diamond"','"default:sword_diamond"','"default:diamond"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_axe_diamond_durability", {
	description = "[Enchanced Durability] Diamond Axe",
	inventory_image = "enchanting_axe.png^durability_enchant.png",
      wield_image = "enchanting_axe.png",
      tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=50, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_axe_diamond_durability"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:diamond"','"default:axe_diamond"','"default:diamond"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_pick_diamond_durability", {
	description = "[Enchanced Durability] Diamond Pick",
	inventory_image = "enchanting_pick.png^durability_enchant.png",
      wield_image = "enchanting_pick.png",
      tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky ={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=50, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_pick_diamond_durability"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:diamond"','"default:pick_diamond"','"default:diamond"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})
minetest.register_tool("enchanting:enchanted_shovel_diamond_strength", {
	description = "[Enchanced Strength] Diamond Shovel",
	inventory_image = "enchanting_shovel.png^strength_enchant.png",
	wield_image = "enchanting_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_craft({
	output = '"enchanting:enchanted_shovel_diamond_strength"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:mese_crystal"','"default:shovel_diamond"','"default:mese_crystal"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_sword_diamond_strength", {
	description = "[Enchanced Strength] Diamond Sword",
	inventory_image = "enchanting_sword.png^strength_enchant.png",
	wield_image = "enchanting_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=50, maxlevel=2},
		},
		damage_groups = {fleshy=15},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_sword_diamond_strength"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:mese_crystal"','"default:sword_diamond"','"default:mese_crystal"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_axe_diamond_strength", {
	description = "[Enchanced Strength] Diamond Axe",
	inventory_image = "enchanting_axe.png^strength_enchant.png",
      wield_image = "enchanting_axe.png",
      tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=50, maxlevel=2},
		},
		damage_groups = {fleshy=12},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_axe_diamond_strength"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:mese_crystal"','"default:axe_diamond"','"default:mese_crystal"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_pick_diamond_strength", {
	description = "[Enchanced Strength] Diamond Pick",
	inventory_image = "enchanting_pick.png^strength_enchant.png",
      wield_image = "enchanting_pick.png",
      tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky ={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=50, maxlevel=2},
		},
		damage_groups = {fleshy=12},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_pick_diamond_strength"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:mese_crystal"','"default:pick_diamond"','"default:mese_crystal"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_shovel_diamond_uses", {
	description = "[Enchanced Uses] Diamond Shovel",
	inventory_image = "enchanting_shovel.png^uses_enchant.png",
	wield_image = "enchanting_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_craft({
	output = '"enchanting:enchanted_shovel_diamond_uses"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:obsidian"','"default:shovel_diamond"','"default:obsidian"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_sword_diamond_uses", {
	description = "[Enchanced Uses] Diamond Sword",
	inventory_image = "enchanting_sword.png^uses_enchant.png",
	wield_image = "enchanting_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=100, maxlevel=2},
		},
		damage_groups = {fleshy=15},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_sword_diamond_uses"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:obsidian"','"default:sword_diamond"','"default:obsidian"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_axe_diamond_uses", {
	description = "[Enchanced Uses] Diamond Axe",
	inventory_image = "enchanting_axe.png^uses_enchant.png",
      wield_image = "enchanting_axe.png",
      tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=100, maxlevel=2},
		},
		damage_groups = {fleshy=12},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_axe_diamond_uses"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:obsidian"','"default:axe_diamond"','"default:obsidian"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

minetest.register_tool("enchanting:enchanted_pick_diamond_uses", {
	description = "[Enchanced Uses] Diamond Pick",
	inventory_image = "enchanting_pick.png^uses_enchant.png",
      wield_image = "enchanting_pick.png",
      tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky ={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=100, maxlevel=2},
		},
		damage_groups = {fleshy=12},
	}
})

minetest.register_craft({
	output = '"enchanting:enchanted_pick_diamond_uses"',
	recipe = {
		{'""','""','""','""','""'},
	{'"default:obsidian"','"default:obsidian"','"default:pick_diamond"','"default:obsidian"','"default:obsidian"'},
		{'""','""','""','""','""'}
	}
})

