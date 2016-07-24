--[[
    Steel Arrow Sign

    This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
]]

minetest.register_node("arrow_signs:steel", {
	description = "Steel Arrow Sign",
	drawtype = "nodebox",
	node_box = arrow_signs.nodebox,
	selection_box = arrow_signs.selection_box,
	tiles = {"arrow_signs_steel.png^arrow_signs_steel_border.png"},
	inventory_image = "arrow_signs_steel.png",
	wield_image = "arrow_signs_steel.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {cracky = 2},
	sounds = default.node_sound_defaults(),
	on_place = arrow_signs.on_place,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", arrow_signs.formspec)
		meta:set_string("infotext", [[""]])
	end,
	on_receive_fields = arrow_signs.savetext,
})

--Recipe
minetest.register_craft({
	type = "shapeless",
	output = "arrow_signs:steel",
	recipe = {"default:sign_wall_steel", "group:stick"},
})

--Recycling
minetest.register_craft({
	output = "default:sign_wall_steel",
	recipe = {
		{"arrow_signs:steel"},
	}
})
