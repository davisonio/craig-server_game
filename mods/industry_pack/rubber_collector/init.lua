-- Rubber mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The Rubber mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The Rubber mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the Rubber mod. If not, see <http://www.gnu.org/licenses/>.

minetest.register_node("rubber_collector:rubber_collector", {
	description = "Rubber collector",
	tiles = {
        "rubber_collector_top.png",
        "rubber_collector_bottom.png",
        "rubber_collector_side.png",
        "rubber_collector_side.png",
        "rubber_collector_side.png",
        "rubber_collector_side.png"
    },
	groups = { cracky = 2 },
	sounds = default.node_sound_stone_defaults(),
    on_construct = function ( pos )
        local meta = minetest.env:get_meta( pos )
        meta:set_string( 'infotext', 'Rubber collector' )
        local inv = meta:get_inventory()
        inv:set_size( 'main', 8 * 4 )
    end,

	on_punch = function(pos, node, puncher)
        local meta = minetest.env:get_meta( pos )
        local inv = meta:get_inventory()
        local pwield = puncher:get_wielded_item()
        if pwield:get_name() == 'rubber:bucket_rubber' then
            local itst = ItemStack( 'rubber_sheet:rubber_base' )
            if inv:room_for_item( 'main', itst ) then
                inv:add_item( 'main', itst )
                puncher:set_wielded_item( ItemStack( 'bucket:bucket_empty' ) )
            end
        end
	end
})

minetest.register_craft( {
    output = "rubber_collector:rubber_collector",
	recipe = {
        { "default:wood", "default:wood", "default:wood" },
        { "rubber_sheet:rubber_sheet", "", "rubber_sheet:rubber_sheet" },
        { "rubber_sheet:rubber_sheet", "rubber_sheet:rubber_sheet", "rubber_sheet:rubber_sheet" }
    }
} )

