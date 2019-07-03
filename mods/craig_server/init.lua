---------------------
-- Server Misc Mod --
---------------------

-- Chat Commands
dofile(minetest.get_modpath("craig_server").."/chatcommands.lua")

-- Craft Obsidian
dofile(minetest.get_modpath("craig_server").."/craft_obsidian.lua")

-- Admin Tools
dofile(minetest.get_modpath("craig_server").."/admin_tools.lua")

-- Legacy
dofile(minetest.get_modpath("craig_server").."/legacy.lua")

-- Cactus & Papyrus
dofile(minetest.get_modpath("craig_server").."/cactus_papyrus.lua")

-- Fix crafts
dofile(minetest.get_modpath("craig_server").."/craft_fix.lua")

-- Spawn command
dofile(minetest.get_modpath("craig_server").."/spawn.lua")

-- Fix main inventory (incompatible with sinv)
dofile(minetest.get_modpath("craig_server").."/main_inv_fix.lua")

-- Readd some old fences that were removed in latest git
dofile(minetest.get_modpath("craig_server").."/old_fences.lua")

-- Flowers v6 gen
dofile(minetest.get_modpath("craig_server").."/gen_flowers.lua")

-- Recipes for more renewable resources
dofile(minetest.get_modpath("craig_server").."/craft_renewres.lua")

-- Events and motd
dofile(minetest.get_modpath("craig_server").."/events.lua")

-- Cloud height
dofile(minetest.get_modpath("craig_server").."/cloud_height.lua")
