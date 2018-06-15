local COLOURS = {
		"Black",
		"Cyan",
		"Brown",
		"Dark Blue",
		"Dark Green",
		"Dark Grey",
		"Dark Pink",
		"Green",
		"Grey",
		"Orange",
		"Pink",
		"Purple",
		"Red",
		"White",
		"Yellow"
}

local COLOURS2 = {
		"black",
		"cyan",
		"brown",
		"dark_blue",
		"dark_green",
		"dark_grey",
		"dark_pink",
		"green",
		"grey",
		"orange",
		"pink",
		"purple",
		"red",
		"white",
		"yellow"
}

for number = 1, 15 do

	local colour = COLOURS[number]
	local colour2 = COLOURS2[number]

	minetest.register_node("colouredstone:"..colour2, {
		description = colour.." Stone",
		tiles = {"colouredstone_"..colour2..".png"},
		groups = {cracky = 3},
        sounds = default.node_sound_defaults(),
	})

	minetest.register_craft({
		type = "shapeless",
		output = 'colouredstone:'..colour2,
		recipe = {
			'dye:'..colour2, 'default:stone',
		}
	})

    -- Stairs

    stairsplus:register_all("colouredstone", colour2, "colouredstone:"..colour2, {
        description = colour.." Stone",
		tiles = {"colouredstone_"..colour2..".png"},
		groups = {cracky = 3, not_in_creative_inventory = 1, not_in_craft_guide = 1},
		sounds = default.node_sound_defaults(),
        sunlight_propagates = true,
    })
end
