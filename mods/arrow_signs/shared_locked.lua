-- a sign
minetest.register_node("arrow_signs:shared_locked", {
	description = "Shared locked sign",
	drawtype = "nodebox",
	node_box = {		
		type = "fixed", 
		fixed = {
			{ 0.25, -0.25, 0.5, -0.25, 0.5, 0.47},
			{ 0.1875, -0.3125, 0.5, -0.1875, -0.25, 0.47},
			{ 0.125, -0.3125, 0.5, -0.125, -0.375, 0.47},
			{ 0.0625, -0.375, 0.5, -0.0625, -0.437, 0.47}
		}
	},
    selection_box = {
        type = "fixed", 
        fixed = {
            { 0.30, -0.5, 0.5, -0.30, 0.5, 0.47}
        }
    },
	tiles = {"arrow_sign_border_left.png","arrow_sign_border_right.png","arrow_sign_border_up.png","arrow_sign_border_down.png","arrow_sign.png","arrow_sign.png"},
	inventory_image = "arrow_sign.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy=2,dig_immediate=2,sign_locked=1},
	legacy_wallmounted = true,
	
	on_place = function(itemstack, placer, pointed_thing)
			arrow_signs.on_place(itemstack, placer, pointed_thing);
			locks:lock_set_owner( pointed_thing.above, placer, "Shared locked sign" );
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

	after_place_node = function(pos, placer)
			locks:lock_set_owner( pos, placer, "Shared locked sign" );
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
minetest.register_abm({
	nodenames = {"arrow_signs:shared_locked_right", "'arrow_signs:shared_locked_left", "arrow_signs:shared_locked_up", "arrow_signs:shared_locked_down"},
	interval = 1,
	chance = 1,
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
