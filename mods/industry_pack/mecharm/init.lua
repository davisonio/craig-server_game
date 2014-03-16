-- Mechanical arm mod for Minetest
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
-- along with the mechanical arm mod. If not, see <http://www.gnu.org/licenses/>.

minetest.register_craftitem( 'mecharm:mechanical_arm', {
    description = 'Mechanical arm',
    inventory_image = 'mecharm.png',
} )

minetest.register_craft( {
    output = 'mecharm:mechanical_arm',
    recipe = {
        { 'gears:gear', 'default:steel_ingot', 'default:steel_ingot' },
        { 'default:steel_ingot', '', '' },
        { 'gears:gear', '', '' }
    }
} )

