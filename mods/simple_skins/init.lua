-- Simple Skins mod for minetest
-- Adds a skin gallery to the inventory, using inventory_plus
-- Released by TenPlus1 and based on Zeg9's code under WTFPL

skins = {}
skins.skins = {}
skins.modpath = minetest.get_modpath("simple_skins")

-- Load Skins List

skins.list = {}
skins.add = function(skin)
	table.insert(skins.list,skin)
end

local id = 1
while true do
	local f = io.open(skins.modpath.."/textures/character_"..id..".png")
	if (not f) then break end
	f:close()
	skins.add("character_"..id)
	id = id +1
end

-- Load Metadata

skins.meta = {}
for _, i in ipairs(skins.list) do
	skins.meta[i] = {}
	local f = io.open(skins.modpath.."/meta/"..i..".txt")
	local data = nil
	if f then
		data = minetest.deserialize("return {"..f:read('*all').."}")
		f:close()
	end
	data = data or {}
	skins.meta[i].name = data.name or ""
	skins.meta[i].author = data.author or ""
end

-- Player Load/Save Routines

skins.file = minetest.get_worldpath() .. "/simple_skins.data"

skins.load = function()
	local input = io.open(skins.file, "r")
	local data = nil
	if input then
		data = input:read('*all')
	end
	if data and data ~= "" then
		local lines = string.split(data,"\n")
		for _, line in ipairs(lines) do
			data = string.split(line, ' ', 2)
			skins.skins[data[1]] = data[2]
		end
		io.close(input)
	end
end

skins.load()

skins.save = function()
	local output = io.open(skins.file,'w')
	for name, skin in pairs(skins.skins) do
		if name and skin then
			output:write(name .. " " .. skin .. "\n")
		end
	end
	io.close(output)
end

-- Skins Selection Page

skins.formspec = {}
skins.formspec.main = function(name)

local selected = 1; --just to set the default

local formspec = "size[7,7]".."bgcolor[#08080822;true]"
	.. "button[0,.75;2,.5;main;Back]"
	.. "label[.5,2;Select Player Skin:]"
	.. "textlist[.5,2.5;5.8,4;skins_set;"

for i, v in ipairs(skins.list) do
	formspec = formspec .. skins.meta[v].name .. ","
	if skins.skins[name] == skins.list[i] then -- if the current skin of the player the skin of the loop then
		selected = i; --save the index
	end
end

formspec = formspec ..";"..selected..";true]";--so it can be used here to highlight the selected skin.

	local meta = skins.meta[skins.skins[name]]
	if meta then
		if meta.name then
			formspec = formspec .. "label[2,.5;Name: "..meta.name.."]"
		end
		if meta.author then
			formspec = formspec .. "label[2,1;Author: "..meta.author.."]"
		end
	end

	return formspec
end

-- Update Player Skin

skins.update_player_skin = function(player)
	--name = player:get_player_name()
	player:set_properties({
		visual = "mesh",
		textures = {skins.skins[player:get_player_name()]..".png"},
		visual_size = {x=1, y=1},
	})
	skins.save()
end

-- Load Skin on Join

minetest.register_on_joinplayer(function(player)
	if not skins.skins[player:get_player_name()] then
		skins.skins[player:get_player_name()] = "character_1"
	end
	skins.update_player_skin(player)
	inventory_plus.register_button(player,"skins","Skin")
end)

minetest.register_on_player_receive_fields(function(player,formname,fields)
	if fields.skins then
		inventory_plus.set_inventory_formspec(player,skins.formspec.main(player:get_player_name()))
	end

--if formname ~= "skins" then return end
	local event = minetest.explode_textlist_event(fields["skins_set"])

	if event.type == "CHG" then

		local index = event.index

		if skins.list[index] then
			skins.skins[player:get_player_name()] = skins.list[index]
			skins.update_player_skin(player)
			local name = player:get_player_name()
			inventory_plus.set_inventory_formspec(player,skins.formspec.main(player:get_player_name()))

			if minetest.get_modpath("3d_armor") then
				armor.textures[player:get_player_name()].skin = skins.list[index]..".png"
				minetest.after(0, function(player)
					local skin = armor:get_player_skin(name)
					armor.textures[name].skin = skin..".png"
					armor:set_player_armor(player)
				end, player)
			end
		end
	end
end)

minetest.register_chatcommand("setskin", {
	params = "<user> <skin>",
	description = "Admin command to set user skin",
	privs = {server=true},
	func = function(name, param)

		if not param or param == "" then return end

		local user, skin = string.match(param, "([^ ]+) (-?%d+)")

		if not user or not skin then return end

		skins.skins[user] = "character_"..tonumber(skin)
--		skins.update_player_skin(user)
		skins.save()
		
	end,
})
