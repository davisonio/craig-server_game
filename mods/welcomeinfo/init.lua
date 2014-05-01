--------------------------------------------
--WelcomeInfo mod by CraigyDavi and crazyR--
--------------------------------------------
--TO DO
--Condense code and make it easier to edit the text using variables.
--Release as a mod.
--Revoke interact when frozen and grant when unfrozen.
--Anything else?

--Please note that at the moment this will not work using a mobile client! *I think*--

welcomeinfo = {}
welcomeinfo.hud = {}
welcomeinfo.hud.background = {}
welcomeinfo.hud.logo = {}
welcomeinfo.hud.text1 = {}
welcomeinfo.hud.text2 = {}
welcomeinfo.hud.text3 = {}
welcomeinfo.hud.text4 = {}
welcomeinfo.hud.text5 = {}
welcomeinfo.hud.text6 = {}
welcomeinfo.hud.text7 = {}
welcomeinfo.hud.text8 = {}
welcomeinfo.hud.text9 = {}
welcomeinfo.hud.text10 = {}
welcomeinfo.hud.text11 = {}
welcomeinfo.hud.text12 = {}
welcomeinfo.hud.text13 = {}
welcomeinfo.hud.text14 = {}
welcomeinfo.hud.text15 = {}
welcomeinfo.displayed_welcome = {}

minetest.register_on_joinplayer(function(player)
--	minetest.after(0,welcomeinfo.start_welcome,player)
end)

minetest.register_chatcommand("welcome", {
	params = "",
	description = "Show welcome info.",
	privs = {shout=true},
	func = function(name, param)
--		welcomeinfo.start_welcome(minetest.get_player_by_name(name))
	end,
})

welcomeinfo.start_welcome = function(player)
	if welcomeinfo.displayed_welcome[player:get_player_name()] then welcomeinfo.hide_welcome(player) end
	player:hud_set_flags({hotbar=false, healthbar=false, crosshair=false, wielditem=false})
	welcomeinfo.hud.background[player:get_player_name()] = player:hud_add({
		hud_elem_type = "image",
		name = "welcomeinfo:background",
		position = {x=0.5,y=0.5},
		scale = {x=1,y=1},
		text = "welcomeinfo_background.png",
		alignment = {x=0,y=0},
		offset = {x=0,y=0},
	})
	welcomeinfo.hud.logo[player:get_player_name()] = player:hud_add({
		hud_elem_type = "image",
		name = "welcomeinfo:logo",
		position = {x=0.5,y=0.2},
		scale = {x=1,y=1},
		text = "welcomeinfo_logo.png",
		alignment = {x=0,y=0},
		offset = {x=0,y=0},
	})
	welcomeinfo.hud.text1[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text1",
		position = {x=0.5,y=0.399},
		scale = {x=100,y=100},
		text = "Welcome to Craig's Survival Server. If it is your first time here...hello and welcome! We hope you have a great time here.",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text2[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text2",
		position = {x=0.5,y=0.433},
		scale = {x=100,y=100},
		text = "To get started here you need to read the rules. You can do this by typing the command /rules into the chat.",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text3[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text3",
		position = {x=0.5,y=0.466},
		scale = {x=100,y=100},
		text = "For more information and discussion about this server, go to: http://us.to/5z8",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text4[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text4",
		position = {x=0.5,y=0.499},
		scale = {x=100,y=100},
		text = "Staff members are: CraigyDavi, Rhys, Potato, WhoCares, FMK, Esteban and DeepCenter.",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text5[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text5",
		position = {x=0.5,y=0.533},
		scale = {x=100,y=100},
		text = "If you require any assistance you may post on the forum thread at http://us.to/5z8 or contact me privately via PM.",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text6[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text6",
		position = {x=0.5,y=0.566},
		scale = {x=100,y=100},
		text = "If you have any questions feel free to ask in the chat and someone will help you.",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text7[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text7",
		position = {x=0.5,y=0.599},
		scale = {x=100,y=100},
		text = "Until then..have fun!",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text8[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text8",
		position = {x=0.5,y=0.633},
		scale = {x=100,y=100},
		text = "You may need a minetest 0.4.9-dev client in order to see this screen.",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text9[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text9",
		position = {x=0.5,y=0.666},
		scale = {x=100,y=100},
		text = "You can view this welcome screen again by using the /welcome command.",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text10[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text10",
		position = {x=0.5,y=0.699},
		scale = {x=100,y=100},
		text = "TO GET PAST THIS SCREEN PRESS SNEAK (SHIFT).",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text11[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text11",
		position = {x=0.5,y=0.733},
		scale = {x=100,y=100},
		text = "...or wait 2 mins for it to disappear...",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text12[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text12",
		position = {x=0.5,y=0.766},
		scale = {x=100,y=100},
		text = "",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text13[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text13",
		position = {x=0.5,y=0.799},
		scale = {x=100,y=100},
		text = "",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text14[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text14",
		position = {x=0.5,y=0.833},
		scale = {x=100,y=100},
		text = "",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	welcomeinfo.hud.text15[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		name = "welcomeinfo:text15",
		position = {x=0.5,y=0.866},
		scale = {x=100,y=100},
		text = "",
		alignment = {x=0,y=0},
		number = 0xFFFFFF,
	})
	minetest.add_entity(player:getpos(),"welcomeinfo:entity"):get_luaentity().owner = player:get_player_name()
	player:set_attach(minetest.add_entity(player:getpos(),"welcomeinfo:entity"), "", {x=0,y=0,z=0}, {x=0,y=0,z=0})
	welcomeinfo.displayed_welcome[player:get_player_name()] = true
	minetest.after(120, function(...)
		welcomeinfo.hide_welcome(player)
	end)
end

welcomeinfo.hide_welcome = function(player)
	player:hud_set_flags({hotbar=true, healthbar=true, crosshair=true, wielditem=true})
	player:hud_remove(welcomeinfo.hud.text1[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text2[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text3[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text4[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text5[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text6[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text7[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text8[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text9[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text10[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text11[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text12[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text13[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text14[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.text15[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.background[player:get_player_name()])
	player:hud_remove(welcomeinfo.hud.logo[player:get_player_name()])
	player:set_detach()
	welcomeinfo.displayed_welcome[player:get_player_name()] = false
end

minetest.register_entity("welcomeinfo:entity",{
	physical = false,
	collisionbox = {0,0,0,0,0,0},
	visual = "sprite",
	visual_size = {x=0,y=0},
	textures = {"welcomeinfo_invisible.png"},
	point_index = 0,
	is_visible = false,
	on_step = function(self, dtime)
	self.object:set_armor_groups({immortal=1})
		if not self.owner then
			minetest.after(120, function(...)
				if not self.owner then
					self.object:remove()
				end
			end)
			return
		end
		local player = minetest.get_player_by_name(self.owner)
		if not minetest.get_player_by_name(self.owner) then return end
		if welcomeinfo.displayed_welcome[self.owner] then
			local c = player:get_player_control()
			if c.sneak then
				welcomeinfo.hide_welcome(player)
				self.object:remove()
				return
			end
		end
	end,
})