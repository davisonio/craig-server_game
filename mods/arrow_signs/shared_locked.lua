--[[
    Shared Locked Arrow sign

    This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
]]
minetest.register_node("arrow_signs:shared_locked", {
	description = "Shared locked sign",
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

	on_place = function(itemstack, placer, pointed_thing)
			itemstack = arrow_signs.on_place(itemstack, placer, pointed_thing);
			locks:lock_set_owner( pointed_thing.above, placer, "Shared locked sign");
			return itemstack
	end,

	on_construct = function(pos)
			local meta =  minetest.get_meta(pos)
			-- prepare the lock of the sign
			locks:lock_init( pos,
							"size[8,4]"..
							"field[0.3,0.6;6,0.7;text;Text:;${text}]"..
							"field[0.3,3.6;6,0.7;locks_sent_lock_command;Locked sign. Type /help for help:;]"..
							"button_exit[6.3,3.2;1.7,0.7;locks_sent_input;Proceed]" );
	end,

	can_dig = function(pos,player)
			return locks:lock_allow_dig( pos, player );
	end,

	on_receive_fields = function(pos, formname, fields, sender)

			-- if the user already has the right to use this and did input text
			if( fields.text
				and ( not(fields.locks_sent_lock_command)
					   or fields.locks_sent_lock_command=="")
				and locks:lock_allow_use( pos, sender )) then
				--then save the text to the sign meta
				--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
				local meta =  minetest.get_meta(pos)
				fields.text = fields.text or "";
				minetest.log("action", (sender:get_player_name() or "").." wrote \""..fields.text..
							"\" to sign at "..minetest.pos_to_string(pos));
				meta:set_string("text", fields.text);
				local text = arrow_signs.create_lines(fields.text)
				meta:set_string("infotext", '"'..text..'"'.." ["..sender:get_player_name().."]");

			-- a command for the lock?
			else
				--do nothing, because user does not have the right to change the sign
				--a warning message is also printed by the locks mod
				--arrow_signs.savetext( pos, formname, fields, sender );
			end

	end,
 });

minetest.register_craft({
	type = 'shapeless',
	output = 'arrow_signs:shared_locked',
	recipe = {'arrow_signs:wall', 'locks:lock'},
})

--Redefinition
minetest.register_lbm({
	name = "arrow_signs:replace_old_shared_locked",
	nodenames = {"arrow_signs:shared_locked_right", "arrow_signs:shared_locked_left", "arrow_signs:shared_locked_up", "arrow_signs:shared_locked_down"},
	action = function(pos, node)
		local convert_facedir={
			["arrow_signs:shared_locked_right"]={6,4,5,11,16,14},
			["arrow_signs:shared_locked_left"]={8,10,9,7,12,18},
			["arrow_signs:shared_locked_up"]={15,19,23,21,20,22},
			["arrow_signs:shared_locked_down"]={17,13,1,3,0,2}
		}
		minetest.swap_node(pos, {name="arrow_signs:shared_locked",param2=convert_facedir[node.name][node.param2-1]})
	end,
})
