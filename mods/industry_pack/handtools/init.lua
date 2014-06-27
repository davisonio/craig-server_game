-- Hand tools mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The Hand tools mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The Hand tools mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the Hand tools mod. If not, see <http://www.gnu.org/licenses/>.

minetest.register_craftitem( 'handtools:screwdriver', {
    description = 'Screwdriver',
    inventory_image = 'handtools_screwdriver.png',
} )

minetest.register_craftitem("handtools:hammer", {
	description = "Hammer",
	inventory_image = "hammer.png",
})

minetest.register_craftitem("handtools:saw", {
	description = "Saw",
	inventory_image = "saw.png",
})

minetest.register_craft( {
         type = "shapeless",
         output = "default:wood 6",
         recipe = { "handtools:saw" , "default:tree" },
         replacements = {
             { 'handtools:saw', 'handtools:saw' }
         }
} )

local si = 'default:steel_ingot'
local rs = 'rubber_sheet:rubber_sheet'
local stick = 'default:stick'

minetest.register_craft( {
    output = 'handtools:hammer',
    recipe = {
        { si, '', '' },
        { '', stick, '' },
        { '', '', stick }
    }
} )

minetest.register_craft( {
    output = 'handtools:saw',
    recipe = {
        { '', si, '' },
        { stick, si, si },
        { '', si, '' }
    }
} )

minetest.register_craft( {
    output = 'handtools:screwdriver',
    recipe = {
        { si },
        { si },
        { rs }
    }
} )

