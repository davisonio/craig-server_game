-- Hopper mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The mechanical arm mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The mechanical arm mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the hopper mod. If not, see <http://www.gnu.org/licenses/>.

hopper_transactions = {}

local modpath = minetest.get_modpath( 'hopper' )
dofile( modpath .. '/chest.lua' )
dofile( modpath .. '/furnace.lua' )
dofile( modpath .. '/factory.lua' )
dofile( modpath .. '/rubber_collector.lua' )

minetest.register_node("hopper:hopper", {
	description = "Hopper",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "hopper_side.png",
	wieldimage = "hopper_side.png",
	tiles = {
	         "hopper_top.png",
	         "hopper_top.png",
		"hopper_side.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375000,0.187500,-0.500000,0.500000,0.500000,0.500000},
			{-0.500000,0.187500,-0.500000,-0.375000,0.500000,0.500000}, 
			{-0.500000,0.187500,0.375000,0.500000,0.500000,0.500000}, 
			{-0.500000,0.187500,-0.500000,0.500000,0.500000,-0.375000}, 
			{-0.375000,-0.125000,-0.375000,-0.250000,0.187500,0.375000},
			{0.250000,-0.125000,-0.375000,0.375000,0.187500,0.375000}, 
			{-0.375000,-0.125000,0.250000,0.375000,0.187500,0.375000}, 
			{-0.375000,-0.125000,-0.375000,0.375000,0.187500,-0.250000},
			{-0.250000,-0.437500,-0.250000,-0.125000,-0.125000,0.250000}, 
			{0.125000,-0.437500,-0.250000,0.250000,-0.125000,0.250000}, 
			{-0.250000,-0.437500,0.125000,0.250000,-0.125000,0.250000},
			{-0.250000,-0.437500,-0.250000,0.250000,-0.125000,-0.125000},
			{-0.125000,-0.500000,-0.125000,0.125000,-0.437500,0.125000}, 
		},
	},
	groups = {cracky=2},
	drop = "hopper:hopper",
    on_construct = function ( pos )
        local meta = minetest.get_meta( pos )
        meta:set_string( 'infotext', 'Hopper' )
    end,
})

minetest.register_craft( {
    output = 'hopper:hopper',
    recipe = {
        { 'default:steel_ingot', 'rubber_sheet:rubber_sheet', 'default:steel_ingot' },
        { 'default:steel_ingot', 'rubber_sheet:rubber_sheet', 'default:steel_ingot' },
        { 'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot' }
    }
} )

minetest.register_abm( {
    nodenames = { 'hopper:hopper' },
    interval = 1.0,
    chance = 1,
    action = function ( pos, node )
        local frompos = { x = pos.x, y = pos.y, z = pos.z }
        local topos = { x = pos.x, y = pos.y, z = pos.z }
        local facedir = node.param2
        if facedir == 0 then
            frompos.y = frompos.y + 1
            topos.y = topos.y - 1
        elseif facedir == 1 then
            frompos.y = frompos.y + 1
            topos.y = topos.y - 1
        elseif facedir == 2 then
            frompos.y = frompos.y + 1
            topos.y = topos.y - 1
        elseif facedir == 3 then
            frompos.y = frompos.y + 1
            topos.y = topos.y - 1
        end

        local fromnode = minetest.get_node( frompos ).name
        local tonode = minetest.get_node( topos ).name

        if hopper_transactions[fromnode] and hopper_transactions[tonode] then
			local wl = hopper_transactions[tonode].wishlist
			if wl == nil and hopper_transactions[tonode].get_wishlist ~= nil then
				wl = hopper_transactions[tonode].get_wishlist( topos )
			end
            hopper_transactions[tonode].add(
                topos,
                hopper_transactions[fromnode].get( frompos, wl ),
                function ( thing )
                    hopper_transactions[fromnode].add( frompos, thing )
                end
            )
        end 
    end
} )

