-- Toolbox mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The toolbox mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The toolbox mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the toolbox mod. If not, see <http://www.gnu.org/licenses/>.

minetest.register_craftitem( 'toolbox:toolbox', {
    description = 'Toolbox',
    inventory_image = 'toolbox.png',
} )

minetest.register_craft( {
    output = 'toolbox:toolbox',
    recipe = {
        { 'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot' },
        { 'handtools:screwdriver', 'handtools:hammer', 'handtools:saw' },
        { 'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot' }
    }
} )

