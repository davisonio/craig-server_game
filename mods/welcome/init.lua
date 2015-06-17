welcome = {}

-- Pages
dofile(minetest.get_modpath("welcome").."/pages/welcome.lua")

-- Craft items for buttons

minetest.register_craftitem("welcome:help", {
	description = "Starter guides handwritten by fellow players to help you out along your way.",
	inventory_image = "welcome_help.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("welcome:rules", {
	description = "Read the rules and accept them to get ability to build!",
	inventory_image = "welcome_rules.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("welcome:news", {
	description = "Read the latest server news and know what's going on!",
	inventory_image = "welcome_news.png",
	groups = {not_in_creative_inventory=1},
})
