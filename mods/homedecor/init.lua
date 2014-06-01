-- Home Decor mod by VanessaE
-- 2013-03-17
--
-- Mostly my own code, with bits and pieces lifted from Minetest's default
-- lua files and from ironzorg's flowers mod.  Many thanks to GloopMaster
-- for helping me figure out the inventories used in the nightstands/dressers.
--
-- The code for ovens, nightstands, refrigerators are basically modified 
-- copies of the code for chests and furnaces.
--
-- License: LGPL 2.0 or higher
--

homedecor = {}

homedecor.debug = 0

homedecor.modpath = minetest.get_modpath("homedecor")
homedecor.intllib_modpath = minetest.get_modpath("intllib")

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if homedecor.intllib_modpath then
    dofile(homedecor.intllib_modpath.."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end
homedecor.gettext = S

-- debug

local dbg = function(s)
	if homedecor.debug == 1 then
		print('[HomeDecor] ' .. s)
	end
end

-- infinite stacks

if minetest.get_modpath("unified_inventory") or not minetest.setting_getbool("creative_mode") then
	homedecor.expect_infinite_stacks = false
else
	homedecor.expect_infinite_stacks = true
end

--table copy

function homedecor.table_copy(t)
    local nt = { };
    for k, v in pairs(t) do
        if type(v) == "table" then
            nt[k] = homedecor.table_copy(v)
        else
            nt[k] = v
        end
    end
    return nt
end


-- load various other components

dofile(homedecor.modpath.."/misc_nodes.lua")					-- the catch-all for all misc nodes
dofile(homedecor.modpath.."/tables.lua")
dofile(homedecor.modpath.."/electronics.lua")
dofile(homedecor.modpath.."/shutters.lua")
dofile(homedecor.modpath.."/shingles.lua")
dofile(homedecor.modpath.."/slopes.lua")

dofile(homedecor.modpath.."/door_models.lua")
dofile(homedecor.modpath.."/doors_and_gates.lua")

dofile(homedecor.modpath.."/fences.lua")

dofile(homedecor.modpath.."/lighting.lua")
dofile(homedecor.modpath.."/kitchen_cabinet.lua")
dofile(homedecor.modpath.."/refrigerator.lua")
dofile(homedecor.modpath.."/furnaces.lua")
dofile(homedecor.modpath.."/nightstands.lua")

dofile(homedecor.modpath.."/crafts.lua")

dofile(homedecor.modpath.."/furniture.lua")
dofile(homedecor.modpath.."/furniture_medieval.lua")
dofile(homedecor.modpath.."/furniture_bathroom.lua")
dofile(homedecor.modpath.."/furniture_recipes.lua")

dofile(homedecor.modpath.."/locked.lua")

print("[HomeDecor] "..S("Loaded!"))
