--[[
    Locked Arrow sign

    This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
]]
minetest.register_node("arrow_signs:locked", {
	description = "Locked Arrow Sign",
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
	groups = {choppy = 2, oddly_breakable_by_hand = 3 },
	legacy_wallmounted = true,
    
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "\"\" [" .. placer:get_player_name() .. "]")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local pname = player:get_player_name()
		return pname == owner or pname == minetest.setting_get("name")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if not fields.text then return end
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local pname = sender:get_player_name() or ""
		if pname ~= owner and pname ~= minetest.setting_get("name")
		  and not minetest.check_player_privs(pname, {rank_admin=true}) or minetest.check_player_privs(pname, {rank_sysadmin=true}) then

			return
		end
		print(pname.." wrote \""..fields.text..
				"\" to locked sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", "\"" .. fields.text .. "\" [" .. owner .. "]")
	end,
 });

minetest.register_craft({
	type = 'shapeless',
	output = 'arrow_signs:locked',
	recipe = {'arrow_signs:wall', 'default:steel_ingot'},
})
