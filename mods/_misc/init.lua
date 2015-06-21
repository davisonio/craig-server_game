---------------------
-- Server Misc Mod --
---------------------

-- Nodename on the HUD
dofile(minetest.get_modpath("_misc").."/nodename_hud.lua")

-- Give initial stuff
dofile(minetest.get_modpath("_misc").."/give_initial_stuff.lua")

-- Chat Commands
dofile(minetest.get_modpath("_misc").."/chatcommands.lua")

-- Username filter
dofile(minetest.get_modpath("_misc").."/username_filter.lua")

-- Automatic Messages
dofile(minetest.get_modpath("_misc").."/auto_messages.lua")

-- Craft Obsidian
dofile(minetest.get_modpath("_misc").."/craft_obsidian.lua")

-- Admin Tools
dofile(minetest.get_modpath("_misc").."/admin_tools.lua")

-- Death Messages
dofile(minetest.get_modpath("_misc").."/death_messages.lua")

-- Privileges and Ranks
dofile(minetest.get_modpath("_misc").."/privs.lua")

-- Item Pickup
dofile(minetest.get_modpath("_misc").."/item_pickup.lua")

-- World Edge
dofile(minetest.get_modpath("_misc").."/worldedge.lua")
