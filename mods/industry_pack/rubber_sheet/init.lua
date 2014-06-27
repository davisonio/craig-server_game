-- Rubber sheet mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The Rubber sheet mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The Rubber sheet mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the Rubber sheet mod. If not, see <http://www.gnu.org/licenses/>.

minetest.register_craftitem( 'rubber_sheet:rubber_sheet', {
    description = 'Rubber sheet',
    inventory_image = 'rubber_sheet.png',
} )

minetest.register_craftitem( 'rubber_sheet:rubber_base', {
    description = 'Rubber base',
    inventory_image = 'rubber_base.png'
} )

minetest.register_craft( {
    output = 'rubber_sheet:rubber_base',
    recipe = { { 'rubber:bucket_rubber' } },
    replacements = {
        { 'rubber:bucket_rubber', 'bucket:bucket_empty' }
    }
} )

minetest.register_craft( {
    type = 'cooking',
    output = 'rubber_sheet:rubber_sheet',
    recipe = 'rubber_sheet:rubber_base'
} )

