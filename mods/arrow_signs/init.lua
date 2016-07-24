--[[
	Arrow signs mod for Minetest.

	This mods adds arrowsigns into Minetest. Rotatable in all directions.

	Thanks to:
		Jat15 for the place and rotate system
		Hectic for the new Textures that fit into Minetest  0.4.14

	This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
]]

arrow_signs={}

arrow_signs.formspec = "field[text;Sign text:            (Hint: Use / or | to create a new line);${text}]";

arrow_signs.on_place = function(itemstack, placer, pointed_thing)

	local posabove = pointed_thing.above
	local posunder = pointed_thing.under
	local vector = placer:get_look_dir()
	local param2 = 0

	-- I wonder if there is a way to calculate the param2 instad of using so much if here.
	-- +Y
	if posabove.y>posunder.y then
		if(vector.z>0.5 and vector.z<=1) then
			param2 = 10
		elseif (vector.x>0.5 and vector.x<=1) then
			param2 = 19
		elseif(-0.5>vector.z and -1<=vector.z) then
			param2 = 4
		elseif (-0.5>vector.x and -1<=vector.x) then
			param2 = 13
		end
	-- -Y
	elseif posabove.y<posunder.y then
		if(vector.z>0.5 and vector.z<=1) then
			param2 = 8
		elseif (vector.x>0.5 and vector.x<=1) then
			param2 = 17
		elseif(-0.5>vector.z and -1<=vector.z) then
			param2 = 6
		elseif (-0.5>vector.x and -1<=vector.x) then
			param2 = 15
		end
	-- +Z
	elseif posabove.z>posunder.z then
		if(vector.y>0.75 and vector.y<=1) then
			param2 = 22
		elseif (vector.y>=-1 and vector.y<-0.75) then
			param2 = 2
		elseif (vector.x>=0 and vector.x<=1) then
			param2 = 18
		elseif (vector.x<0 and vector.x>=-1) then
			param2 = 14
		end
	-- -Z
	elseif posabove.z<posunder.z then
		if(vector.y>0.75 and vector.y<=1) then
			param2 = 20
		elseif (vector.y>=-1 and vector.y<-0.75) then
			param2 = 0
		elseif (vector.x>=0 and vector.x<=1) then
			param2 = 16
		elseif (vector.x<0 and vector.x>=-1) then
			param2 = 12
		end
	-- +X
	elseif posabove.x>posunder.x then
		if(vector.y>0.75 and vector.y<=1) then
			 param2 = 21
		elseif (vector.y>=-1 and vector.y<-0.75) then
			param2 = 3
		elseif (vector.z>=0 and vector.z<=1) then
			param2 = 11
		elseif (vector.z<0 and vector.z>=-1) then
			param2 = 7
		end
	-- -X
	elseif posabove.x<posunder.x then
		if(vector.y>0.75 and vector.y<=1) then
			param2 = 23
		elseif (vector.y>=-1 and vector.y<-0.75) then
			param2 = 1
		elseif (vector.z>=0 and vector.z<=1) then
			param2 = 9
		elseif (vector.z<0 and vector.z>=-1) then
			param2 = 5
		end
	end

	return minetest.item_place_node(itemstack, placer, pointed_thing, param2)
end

arrow_signs.savetext = function(pos, formname, fields, sender)
	if fields.text then
		local playername = sender:get_player_name() or ""
		if minetest.is_protected(pos, playername) then
			minetest.record_protection_violation(pos, playername)
			return
		end
		local meta = minetest.get_meta(pos)
		minetest.log("action", string.format("%q wrote %q to sign at %s", playername, fields.text, minetest.pos_to_string(pos)));
		meta:set_string("text", fields.text)
		local text, lines = arrow_signs.create_lines(fields.text)
		meta:set_string("infotext", '"'..text..'"')
		if lines >= 6 then
			minetest.chat_send_player(playername, "Information: \nYou've written "..lines.." lines. \nThe sign can only display 5 lines \nPlease remove the last entries")
		end
	return true
	end
end

--this function creates the linebreaks
arrow_signs.create_lines = function(text)
	local text, n = text:gsub("[ ]*(%|)[ ]*", '"\n"')--search for |
	local text, m = text:gsub("[ ]*(%/)[ ]*", '"\n"')--search for /
	return text, n+m+1
end

arrow_signs.nodebox = {
	type = "fixed",
	fixed = {
		{ 0.25, -0.25, 0.4375, -0.25, 0.5, 0.5},
		{ 0.1875, -0.3125, 0.4375, -0.1875, -0.25, 0.5},
		{ 0.125, -0.3125, 0.4375, -0.125, -0.375, 0.5},
		{ 0.0625, -0.375, 0.4375, -0.0625, -0.437, 0.5}
	}
}

arrow_signs.selection_box = {
		type = "fixed",
		fixed = {
			{ 0.30, -0.5, 0.4375, -0.30, 0.5, 0.5}
		}
	}

local MODPATH = minetest.get_modpath("arrow_signs")

-- Wooden Sign
dofile(MODPATH.."/wood.lua")
-- Steel Sign
dofile(MODPATH.."/steel.lua")

--Shared Locked sign
if minetest.get_modpath("locks") then
	dofile(MODPATH.."/shared_locked.lua")
end
