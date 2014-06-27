-- Factory mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The Factory mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The Factory mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the Factory mod. If not, see <http://www.gnu.org/licenses/>.

local modpath = minetest.get_modpath( 'factory' )

minetest.register_node('factory:factory', {
	description = 'Factory',
	tiles = {
        'factory_top.png',
        'factory_bottom.png',
        'factory_side.png',
        'factory_side.png',
        'factory_side.png',
        'factory_front.png'
    },
	paramtype2 = 'facedir',
	groups = { cracky = 2 },
	sounds = default.node_sound_stone_defaults(),
    on_construct = function ( pos )
        local meta = minetest.get_meta( pos )
		meta:set_string( 'formspec', 'size[10,10;]' ..
			'label[0.8,0;Source Material]' ..
			'list[context;src;1,1;2,4;]' ..
			'label[4.4,0;Recipe to Use]' ..
			'list[context;rec;4,1;3,3;]' ..
			'label[4.7,4;Fuel Source]' ..
			'list[context;fuel;5,4.5;1,1;]' ..
			'label[7.7,0;Craft Output]' ..
			'list[context;dst;8,1;1,4;]' ..
			'list[current_player;main;1,6;8,4;]' )
        meta:set_string( 'infotext', 'Factory' )
		meta:set_int( 'timeleft', 0 )
        local inv = meta:get_inventory()
        inv:set_size( 'src', 2 * 4 )
		inv:set_size( 'fuel', 1 * 1 )
		inv:set_size( 'rec', 3 * 3 )
		inv:set_size( 'dst', 1 * 4 )
    end,
	can_dig = function( pos, player )
		local meta = minetest.get_meta( pos )
		local inv = meta:get_inventory()
		return inv:is_empty( 'src' ) and inv:is_empty( 'fuel' ) and inv:is_empty( 'rec' ) and inv:is_empty( 'dst' )
	end
} )

minetest.register_craftitem( 'factory:craft_performer', {
	description = 'Craft performer',
	inventory_image = 'craft_performer.png'
} )

minetest.register_craft( {
	output = 'factory:craft_performer',
	recipe = {
		{ 'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot' },
		{ 'mecharm:mechanical_arm', 'toolbox:toolbox', 'mecharm:mechanical_arm' }
	}
} )

minetest.register_craft( {
    output = 'factory:factory',
	recipe = {
        { 'factory:craft_performer', 'factory:craft_performer', 'factory:craft_performer' },
        { 'hopper:hopper', '', 'hopper:hopper' },
        { 'transactor:transactor', 'dumbwaiter:dumbwaiter', 'transactor:transactor' }
    }
} )

dofile( modpath .. '/factory_abm.lua' )

