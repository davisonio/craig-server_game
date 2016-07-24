--[[
    Wooden Arrow sign

    This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
]]

minetest.register_node("arrow_signs:wall", {
	description = "Arrow sign",
	drawtype = "nodebox",
	node_box = arrow_signs.nodebox,
	selection_box = arrow_signs.selection_box,
	tiles = {"arrow_signs_wood.png^arrow_signs_wood_border.png"},
	inventory_image = "arrow_signs_wood.png",
	wield_image = "arrow_signs_wood.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, flammable = 2, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_defaults(),
	on_place = arrow_signs.on_place,
	on_construct = function(pos)
		--local n = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", arrow_signs.formspec)
		meta:set_string("infotext", [[""]])
	end,
	on_receive_fields = arrow_signs.savetext,
})

--Recipes
minetest.register_craft({
	type = "shapeless",
	output = "arrow_signs:wall",
	recipe = {"default:sign_wall_wood", "group:stick"},
})

minetest.register_craft({
	output = "default:sign_wall_wood",
	recipe = {
		{"arrow_signs:wall"},
	}
})

--Redefinition
minetest.register_lbm({
	name = "arrow_signs:replace_old",
	nodenames = {"arrow_signs:wall_right", "arrow_signs:wall_left", "arrow_signs:wall_up", "arrow_signs:wall_down",
		"more_signs:wall_right","more_signs:wall_left","more_signs:wall_up"	,"more_signs:wall_down"
	},
	action = function(pos, node)
		local convert_facedir={
			["arrow_signs:wall_right"]	=	{6,4,5,11,16,14},
			["arrow_signs:wall_left"]	=	{8,10,9,7,12,18},
			["arrow_signs:wall_up"]		=	{15,19,23,21,20,22},
			["arrow_signs:wall_down"]	=	{17,13,1,3,0,2},
			-- For old mod
			["more_signs:wall_right"] 	=	{6,4,5,11,16,14},
			["more_signs:wall_left"] 	=	{8,10,9,7,12,18},
			["more_signs:wall_up"] 		=	{15,19,23,21,20,22},
			["more_signs:wall_down"] 	=	{17,13,1,3,0,2},
		}
		minetest.swap_node(pos, {name="arrow_signs:wall",param2=convert_facedir[node.name][node.param2+1]})
	end,
})
