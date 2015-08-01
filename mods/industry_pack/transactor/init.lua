-- Transactor mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The transactor mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The transactor mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the transactor mod. If not, see <http://www.gnu.org/licenses/>.

local tbox = {
    type = "fixed",
    fixed = {
        { -0.5, -0.5, -0.2, 0.5, 0.1, 0.2 }
    }
}

transactor_transactions = {}

local modpath = minetest.get_modpath( 'transactor' )

dofile( modpath .. '/chest.lua' )
dofile( modpath .. '/furnace.lua' )
dofile( modpath .. '/factory.lua' )
dofile( modpath .. '/rubber_collector.lua' )

minetest.register_node( 'transactor:transactor', {
    description = 'Transactor',
    node_box = tbox,
    selection_box = tbox,
    drawtype = 'nodebox',
    paramtype = 'light',
    paramtype2 = 'facedir',
    groups = { cracky = 2 },
    tiles = {
        {name="transactor_top_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1.0}},
        'transactor_bottom.png',
        'transactor_side.png',
        'transactor_side.png',
        'transactor_back.png',
        'transactor_front.png',
    },
    on_construct = function ( pos )
        local meta = minetest.get_meta( pos )
        meta:set_string( 'infotext', 'Transactor' )
    end,
} )

minetest.register_craft( {
    output = 'transactor:transactor',
    recipe = {
        { 'mecharm:mechanical_arm', '', 'mecharm:mechanical_arm' },
        { 'conveyor:conveyor', 'conveyor:conveyor', 'conveyor:conveyor' },
        { 'default:steel_ingot', '', 'default:steel_ingot' }
    }
} )

minetest.register_abm( {
    nodenames = { 'transactor:transactor' },
    interval = 1.0,
    chance = 1,
    action = function ( pos, node )
        local frompos = { x = pos.x, y = pos.y, z = pos.z }
        local topos = { x = pos.x, y = pos.y, z = pos.z }
        local facedir = node.param2
        if facedir == 0 then
            frompos.x = frompos.x - 1
            topos.x = topos.x + 1
        elseif facedir == 1 then
            frompos.z = frompos.z + 1
            topos.z = topos.z - 1
        elseif facedir == 2 then
            frompos.x = frompos.x + 1
            topos.x = topos.x - 1
        elseif facedir == 3 then
            frompos.z = frompos.z - 1
            topos.z = topos.z + 1
        end

        local fromnode = minetest.get_node( frompos ).name
        local tonode = minetest.get_node( topos ).name

        if transactor_transactions[fromnode] and transactor_transactions[tonode] then
			local wl = transactor_transactions[tonode].wishlist
			if wl == nil and transactor_transactions[tonode].get_wishlist ~= nil then
				wl = transactor_transactions[tonode].get_wishlist( topos )
			end
            if transactor_transactions[tonode].add then
                transactor_transactions[tonode].add(
                    topos,
                    transactor_transactions[fromnode].get( frompos, wl ),
                    function ( thing )
                        transactor_transactions[fromnode].add( frompos, thing )
                    end
                )
            end
        end 
    end
} )

