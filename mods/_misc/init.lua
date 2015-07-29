---------------------
-- Server Misc Mod --
---------------------

-- Nodename on the HUD
dofile(minetest.get_modpath("_misc").."/nodename_hud.lua")

-- Give initial stuff
dofile(minetest.get_modpath("_misc").."/give_initial_stuff.lua")

-- Chat Commands
dofile(minetest.get_modpath("_misc").."/chatcommands.lua")

-- Automatic Messages
dofile(minetest.get_modpath("_misc").."/auto_messages.lua")

-- Craft Obsidian
dofile(minetest.get_modpath("_misc").."/craft_obsidian.lua")

-- Admin Tools
dofile(minetest.get_modpath("_misc").."/admin_tools.lua")

-- Death Messages
dofile(minetest.get_modpath("_misc").."/death_messages.lua")

-- Users with the "access" privilege can access certain things
dofile(minetest.get_modpath("_misc").."/access.lua")

-- Item Pickup
dofile(minetest.get_modpath("_misc").."/item_pickup.lua")

-- World Edge
dofile(minetest.get_modpath("_misc").."/worldedge.lua")
