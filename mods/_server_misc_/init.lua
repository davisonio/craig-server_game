---------------------
-- Server Misc Mod --
---------------------

--News
dofile(minetest.get_modpath("_server_misc_").."/news.lua")

--Rules
dofile(minetest.get_modpath("_server_misc_").."/rules.lua")

-- Aliases
dofile(minetest.get_modpath("_server_misc_").."/aliases.lua")

-- Chatlog
dofile(minetest.get_modpath("_server_misc_").."/chatlog.lua")

-- Username filter
dofile(minetest.get_modpath("_server_misc_").."/username_filter.lua")

-- Ban
dofile(minetest.get_modpath("_server_misc_").."/ban.lua")

-- Chat Offline
dofile(minetest.get_modpath("_server_misc_").."/chat_offline.lua")

-- No Interact Messages
dofile(minetest.get_modpath("_server_misc_").."/nointeract_messages.lua")