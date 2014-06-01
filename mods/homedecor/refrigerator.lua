-- This file supplies refrigerators

local S = homedecor.gettext

minetest.register_node('homedecor:refrigerator', {
    drawtype = "nodebox",
    description = S("Refrigerator"),
    tiles = {
        'homedecor_refrigerator_top.png',
        'homedecor_refrigerator_bottom.png',
        'homedecor_refrigerator_right.png',
        'homedecor_refrigerator_left.png',
        'homedecor_refrigerator_back.png',	
        'homedecor_refrigerator_front.png'
    },
    inventory_image = "homedecor_refrigerator_inv.png",
    sunlight_propagates = false,
    paramtype = "light",
    paramtype2 = "facedir",
    walkable = true,
    groups = { snappy = 3 },

        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
        },

    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
                "size[10,10]"..
                "list[current_name;main;0,0;10,5;]"..
                "list[current_player;main;1,6;8,4;]")
        meta:set_string("infotext", S("Refrigerator"))
        local inv = meta:get_inventory()
        inv:set_size("main",50)
    end,

    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
        if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
            minetest.chat_send_player( placer:get_player_name(), S('Not enough vertical space to place a refrigerator!') )
            return
        end
        return minetest.item_place(itemstack, placer, pointed_thing)
    end,

    can_dig = function(pos,player)
        local meta = minetest.get_meta(pos);
        local inv = meta:get_inventory()
        return inv:is_empty("main")
    end,
    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", S("%s moves stuff in refrigerator at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
    end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s moves stuff to refrigerator at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
    end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s takes stuff from refrigerator at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
    end,
})
