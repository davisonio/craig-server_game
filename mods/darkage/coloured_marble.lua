local colours = {
    {"grey", "Grey", "404040"},
    {"dark_grey", "Dark Grey", "000000"},
    {"black", "Black", "000000"},
    {"violet", "Violet", "8000FF"},
    {"blue", "Blue", "0000FF"},
    {"cyan", "Cyan", "00FFFF"},
    {"dark_green", "Dark Green", "004000"},
    {"green", "Green", "00FF00"},
    {"yellow", "Yellow", "FFFF00"},
    {"brown", "Brown", "402000"},
    {"orange", "Orange", "FF8000"},
    {"red", "Red", "FF0000"},
    {"magenta", "Magenta", "FF0080"},
    {"pink", "Pink", "FF00FF"},
}




for _, rowc in ipairs(colours) do
        local coding_name = rowc[1]
        local real_name = rowc[2]
	local hex_color = rowc[3]
if coding_name == "black" then 
  minetest.register_node("darkage:marble_" .. coding_name, {
	description = real_name .. " Marble",
	tiles = {"darkage_marble.png^[colorize:#" .. hex_color .. "99"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})
stairsplus:register_all("darkage", "marble_" .. coding_name , "darkage:marble_" .. coding_name, {
    description = real_name .. " Marble",
    tiles = {"darkage_marble.png^[colorize:#" .. hex_color .. "99"},
    groups = {cracky = 3},
    sounds = default.node_sound_stone_defaults(),
})

else
minetest.register_node("darkage:marble_" .. coding_name, {
	description = real_name .. " Marble",
	tiles = {"darkage_marble.png^[colorize:#" .. hex_color .. "75"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

stairsplus:register_all("darkage", "marble_" .. coding_name , "darkage:marble_" .. coding_name, {
    description = real_name .. " Marble",
    tiles = {"darkage_marble.png^[colorize:#" .. hex_color .. "75"},
    groups = {cracky = 3},
    sounds = default.node_sound_stone_defaults(),
})
end

--Crafts

minetest.register_craft({
	output = "darkage:marble_" .. coding_name,
	recipe = {
		{"", "dye:" .. coding_name, ""},
		{"", "darkage:marble", ""},
		{"", "", ""}
	}
})
end