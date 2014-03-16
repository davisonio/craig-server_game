-- a sign
minetest.register_node("arrow_signs:shared_locked_right", {
        description = "Shared locked sign right",
        drawtype = "signlike",
		tiles = {"arrow_sign_right.png"},
		inventory_image = "arrow_sign_right.png",
        paramtype = "light",
        paramtype2 = "wallmounted",
        sunlight_propagates = true,
        walkable = false,
        selection_box = {
                type = "wallmounted",
                --wall_top = <default>
                --wall_bottom = <default>
                --wall_side = <default>
        },
        groups = {choppy=2,dig_immediate=2,sign_locked=1},
        legacy_wallmounted = true,


        on_construct = function(pos)
                local meta = minetest.env:get_meta(pos)
                -- prepare the lock of the sign
                locks:lock_init( pos,
                                "size[8,4]"..
                                "field[0.3,0.6;6,0.7;text;Text:;]"..
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

                    --print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
                    local meta = minetest.env:get_meta(pos)
                    fields.text = fields.text or "";
                    print((sender:get_player_name() or "").." wrote \""..fields.text..
                                "\" to sign at "..minetest.pos_to_string(pos));
                    meta:set_string("text", fields.text.." ["..sender:get_player_name().."]");
                    meta:set_string("infotext", '"'..fields.text..'"'.." ["..sender:get_player_name().."]");

                -- a command for the lock?
                else
                   arrow_signs:savetext( pos, formname, fields, sender );
                end
  
        end,
 });
--left
 minetest.register_node("arrow_signs:shared_locked_left", {
        description = "Shared locked sign left",
        drawtype = "signlike",
		tiles = {"arrow_sign_left.png"},
		inventory_image = "arrow_sign_left.png",
        paramtype = "light",
        paramtype2 = "wallmounted",
        sunlight_propagates = true,
        walkable = false,
        selection_box = {
                type = "wallmounted",
                --wall_top = <default>
                --wall_bottom = <default>
                --wall_side = <default>
        },
        groups = {choppy=2,dig_immediate=2,sign_locked=1},
        legacy_wallmounted = true,


        on_construct = function(pos)
                local meta = minetest.env:get_meta(pos)
                -- prepare the lock of the sign
                locks:lock_init( pos,
                                "size[8,4]"..
                                "field[0.3,0.6;6,0.7;text;Text:;]"..
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

                    --print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
                    local meta = minetest.env:get_meta(pos)
                    fields.text = fields.text or "";
                    print((sender:get_player_name() or "").." wrote \""..fields.text..
                                "\" to sign at "..minetest.pos_to_string(pos));
                    meta:set_string("text", fields.text.." ["..sender:get_player_name().."]");
                    meta:set_string("infotext", '"'..fields.text..'"'.." ["..sender:get_player_name().."]");

                -- a command for the lock?
                else
                   arrow_signs:savetext( pos, formname, fields, sender );
                end
  
        end,
 });
 --up
 minetest.register_node("arrow_signs:shared_locked_up", {
        description = "Shared locked sign up",
        drawtype = "signlike",
		tiles = {"arrow_sign_up.png"},
		inventory_image = "arrow_sign_up.png",
        paramtype = "light",
        paramtype2 = "wallmounted",
        sunlight_propagates = true,
        walkable = false,
        selection_box = {
                type = "wallmounted",
                --wall_top = <default>
                --wall_bottom = <default>
                --wall_side = <default>
        },
        groups = {choppy=2,dig_immediate=2,sign_locked=1},
        legacy_wallmounted = true,


        on_construct = function(pos)
                local meta = minetest.env:get_meta(pos)
                -- prepare the lock of the sign
                locks:lock_init( pos,
                                "size[8,4]"..
                                "field[0.3,0.6;6,0.7;text;Text:;]"..
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

                    --print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
                    local meta = minetest.env:get_meta(pos)
                    fields.text = fields.text or "";
                    print((sender:get_player_name() or "").." wrote \""..fields.text..
                                "\" to sign at "..minetest.pos_to_string(pos));
                    meta:set_string("text", fields.text.." ["..sender:get_player_name().."]");
                    meta:set_string("infotext", '"'..fields.text..'"'.." ["..sender:get_player_name().."]");

                -- a command for the lock?
                else
                   arrow_signs:savetext( pos, formname, fields, sender );
                end
  
        end,
 });
 --down
 minetest.register_node("arrow_signs:shared_locked_down", {
        description = "Shared locked sign down",
        drawtype = "signlike",
		tiles = {"arrow_sign_down.png"},
		inventory_image = "arrow_sign_down.png",
        paramtype = "light",
        paramtype2 = "wallmounted",
        sunlight_propagates = true,
        walkable = false,
        selection_box = {
                type = "wallmounted",
                --wall_top = <default>
                --wall_bottom = <default>
                --wall_side = <default>
        },
        groups = {choppy=2,dig_immediate=2,sign_locked=1},
        legacy_wallmounted = true,


        on_construct = function(pos)
                local meta = minetest.env:get_meta(pos)
                -- prepare the lock of the sign
                locks:lock_init( pos,
                                "size[8,4]"..
                                "field[0.3,0.6;6,0.7;text;Text:;]"..
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

                    --print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
                    local meta = minetest.env:get_meta(pos)
                    fields.text = fields.text or "";
                    print((sender:get_player_name() or "").." wrote \""..fields.text..
                                "\" to sign at "..minetest.pos_to_string(pos));
                    meta:set_string("text", fields.text.." ["..sender:get_player_name().."]");
                    meta:set_string("infotext", '"'..fields.text..'"'.." ["..sender:get_player_name().."]");

                -- a command for the lock?
                else
                   arrow_signs:savetext( pos, formname, fields, sender );
                end
  
        end,
 });

minetest.register_craft({
   output = 'arrow_signs:shared_locked_right',
   recipe = {
      { 'arrow_signs:wall_right', 'locks:lock', '' },
   },
})

minetest.register_craft({
   output = 'arrow_signs:shared_locked_left',
   recipe = {
      { 'arrow_signs:wall_left', 'locks:lock', '' },
   },
})

minetest.register_craft({
   output = 'arrow_signs:shared_locked_up',
   recipe = {
      { 'arrow_signs:wall_up', 'locks:lock', '' },
   },
})

minetest.register_craft({
   output = 'arrow_signs:shared_locked_down',
   recipe = {
      { 'arrow_signs:wall_down', 'locks:lock', '' },
   },
})


minetest.register_craft({
   output = 'arrow_signs:shared_locked_right',
   recipe = {
      { 'group:', 'locks:lock', '' },
   },
})