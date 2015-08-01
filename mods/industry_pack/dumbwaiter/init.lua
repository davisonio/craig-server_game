-- Dumbwaiter mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The dumbwaiter arm mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The dumbwaiter mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the dumbwaiter mod. If not, see <http://www.gnu.org/licenses/>.

dumbwaiter_transactions = {}


local modpath = minetest.get_modpath( 'dumbwaiter' )
dofile( modpath .. '/chest.lua' )
dofile( modpath .. '/furnace.lua' )
dofile( modpath .. '/factory.lua' )
dofile( modpath .. '/rubber_collector.lua' )

minetest.register_node("dumbwaiter:dumbwaiter", {
	description = "Dumbwaiter",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "dumbwaiter_side.png",
	wieldimage = "dumbwaiter_side.png",
	tiles = {
                  "dumbwaiter_top.png",
		"dumbwaiter_top.png",
		"dumbwaiter_side.png",},
	groups = {oddly_breakable_by_hand=2},
	drop = "dumbwaiter:dumbwaiter",
	node_box = {
		type = "fixed",
		fixed = {
			{-4/16,-8/16,-4/16,4/16, 8/16,4/16},
		},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Dumbwaiter")
	end,
})

minetest.register_craft( {
    output = 'dumbwaiter:dumbwaiter',
    recipe = {
        { 'default:steel_ingot', 'gears:gear', 'default:steel_ingot' },
        { 'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot' },
        { 'default:steel_ingot', 'gears:gear', 'default:steel_ingot' }
    }
} )

minetest.register_abm( {
    nodenames = { 'dumbwaiter:dumbwaiter' },
    interval = 1.0,
    chance = 1,
    action = function ( pos, node )
        local frompos = { x = pos.x, y = pos.y, z = pos.z }
        local topos = { x = pos.x, y = pos.y, z = pos.z }
        local facedir = node.param2
        if facedir == 0 then
            frompos.y = frompos.y - 1
            topos.y = topos.y + 1
        elseif facedir == 1 then
            frompos.y = frompos.y - 1
            topos.y = topos.y + 1
        elseif facedir == 2 then
            frompos.y = frompos.y - 1
            topos.y = topos.y + 1
        elseif facedir == 3 then
            frompos.y = frompos.y - 1
            topos.y = topos.y + 1
        end

        local fromnode = minetest.get_node( frompos ).name
        local tonode = minetest.get_node( topos ).name

        if dumbwaiter_transactions[fromnode] and dumbwaiter_transactions[tonode] then
			local wl = dumbwaiter_transactions[tonode].wishlist
			if wl == nil and dumbwaiter_transactions[tonode].get_wishlist ~= nil then
				wl = dumbwaiter_transactions[tonode].get_wishlist( topos )
			end
            dumbwaiter_transactions[tonode].add(
                topos,
                dumbwaiter_transactions[fromnode].get( frompos, wl ),
                function ( thing )
                    dumbwaiter_transactions[fromnode].add( frompos, thing )
                end
            )
        end 
    end
} )

