-- Gears mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The Gears mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The Gears mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the Gears mod. If not, see <http://www.gnu.org/licenses/>.

minetest.register_node("gears:gear", {
	drawtype = "signlike",
	description = "Gear",
	tiles = {"gears_gear.png"},
	inventory_image = "gears_gear.png",
	wieldimage = "gears_gear.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	drop = "gears:gear",
	groups = {cracky=2},
})

minetest.register_craft( {
    output = 'gears:gear',
    recipe = {
        { '', 'default:steel_ingot', '' },
        { 'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot' },
        { '', 'default:steel_ingot', '' }
    }
} )


