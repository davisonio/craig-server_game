wikilib = {}

dofile(minetest.get_modpath("wiki").."/strfile.lua")
dofile(minetest.get_modpath("wiki").."/oshelpers.lua")
dofile(minetest.get_modpath("wiki").."/wikilib.lua")
dofile(minetest.get_modpath("wiki").."/internal.lua")
dofile(minetest.get_modpath("wiki").."/plugins.lua")

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	minetest.after(5, function()
		if minetest.get_player_privs(name).wiki then
			wikilib.show_wiki_page(name, "#Main")
		else
			wikilib.show_wiki_page(name, "Main")
		end
		if player:get_hp() < 1 then
			player:set_hp(20)
		end
	end)

end)
