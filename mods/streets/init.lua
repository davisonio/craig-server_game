streets	= {}

-- Boilerplate to support localized strings if intllib mod is installed.
if minetest.get_modpath("intllib") then
	streets.S = intllib.Getter()
else
	streets.S = function(s) return s end
end

-- Load the files
dofile(minetest.get_modpath("streets").."/asphalt.lua")
dofile(minetest.get_modpath("streets").."/poles.lua")
dofile(minetest.get_modpath("streets").."/concrete.lua")
dofile(minetest.get_modpath("streets").."/streetlamp.lua")
dofile(minetest.get_modpath("streets").."/steelsupport.lua")
dofile(minetest.get_modpath("streets").."/yellow.lua")
dofile(minetest.get_modpath("streets").."/signs.lua")
dofile(minetest.get_modpath("streets").."/manholes.lua")
dofile(minetest.get_modpath("streets").."/delineator.lua")
dofile(minetest.get_modpath("streets").."/fences.lua")

dofile(minetest.get_modpath("streets").."/aliases.lua")
