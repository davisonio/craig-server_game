-- Conveyor mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The Conveyor mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The Conveyor mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the Conveyor mod. If not, see <http://www.gnu.org/licenses/>.

minetest.register_node("conveyor:conveyor", {
	description = "Conveyor Belt",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "conveyor_top.png",
	wieldimage = "conveyor_top.png",
	tiles = {
	        {name="conveyor_top_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.5}},
		"conveyor_side.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,0.000000,0.500000},
		},
	},
	groups = {oddly_breakable_by_hand=2},
	drop = "conveyor:conveyor",
})

minetest.register_craft( {
    output = 'conveyor:conveyor',
    recipe = {
        { 'rubber_sheet:rubber_sheet', 'rubber_sheet:rubber_sheet', 'rubber_sheet:rubber_sheet' },
        { 'gears:gear', 'gears:gear', 'gears:gear' },
        { 'rubber_sheet:rubber_sheet', 'rubber_sheet:rubber_sheet', 'rubber_sheet:rubber_sheet' }
    }
} )