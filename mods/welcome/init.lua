welcome = {}

-- Pages
dofile(minetest.get_modpath("welcome").."/pages/welcome.lua")
dofile(minetest.get_modpath("welcome").."/pages/contact.lua")
dofile(minetest.get_modpath("welcome").."/pages/guides.lua")
dofile(minetest.get_modpath("welcome").."/pages/profile.lua")
dofile(minetest.get_modpath("welcome").."/pages/rules.lua")
dofile(minetest.get_modpath("welcome").."/pages/staff.lua")

-- Craft items for buttons

minetest.register_craftitem("welcome:welcome", {
	description = "Back to the welcome main menu",
	inventory_image = "welcome_welcome.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("welcome:profile", {
	description = "View your profile",
	inventory_image = "welcome_profile.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("welcome:rules", {
	description = "Read the rules of the server.",
	inventory_image = "welcome_rules.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("welcome:guides", {
	description = "A guide for almost anything!",
	inventory_image = "welcome_guides.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("welcome:contact", {
	description = "Get in touch",
	inventory_image = "welcome_contact.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("welcome:inbox", {
	description = "Open your inbox to view messages.",
	inventory_image = "welcome_inbox.png",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("welcome:staff", {
	description = "The super-secret staff panel.",
	inventory_image = "welcome_staff.png",
	groups = {not_in_creative_inventory=1},
})

-- Size
welcome.size = "size[12,10]"

-- Image buttons
welcome.image_button_welcome = "item_image_button[0,0;2,1;welcome:welcome;welcome_welcome;Welcome]"
welcome.image_button_profile = "item_image_button[0,1.25;2,1;welcome:profile;welcome_profile;Your Profile]"
welcome.image_button_rules = "item_image_button[0,2.5;2,1;welcome:rules;welcome_rules;Rules]"
welcome.image_button_guides = "item_image_button[0,3.75.5;2,1;welcome:guides;welcome_guides;Guides]"
welcome.image_button_contact = "item_image_button[0,5;2,1;welcome:contact;welcome_contact;Contact]"
welcome.image_button_inbox = "item_image_button[0,6.25;2,1;welcome:inbox;welcome_inbox;Your Inbox]"

-- Staff Button
minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	if minetest.get_player_privs(name).rank_sysadmin or minetest.get_player_privs(name).rank_admin or minetest.get_player_privs(name).rank_moderator then
		welcome.image_button_staff = "item_image_button[0,7.5;2,1;welcome:staff;welcome_staff;Staff Panel]"
	else
		welcome.image_button_staff = ""
	end
end)

-- Close Button
welcome.close_button = "button_exit[10,9;2,1;exit;Close]"
