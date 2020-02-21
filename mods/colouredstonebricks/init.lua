local colours = {
		{"black", "Black"},
		{"cyan", "Cyan"},
		{"brown", "Brown"},
		{"dark_blue", "Dark Blue"},
		{"dark_green", "Dark Green"},
		{"dark_grey", "Dark Grey"},
		{"dark_pink", "Dark Pink"},
		{"green", "Green"},
		{"grey", "Grey"},
		{"orange", "Orange"},
		{"pink", "Pink"},
		{"purple", "Purple"},
		{"red", "Red"},
		{"white", "White"},
		{"yellow", "Yellow"}
}

for _, row in ipairs(colours) do

	local name = row[1]
	local description = row[2]

	minetest.register_node("colouredstonebricks:"..name, {
		description = description.." Stone Brick",
		tiles = {"colouredstonebricks_"..name..".png"},
		groups = {cracky=3},
        sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_craft({
		type = "shapeless",
		output = 'colouredstonebricks:'..name,
		recipe = {
			'dye:'..name, 'default:stonebrick',
		}
	})

    -- Support for stairsplus mod
	if minetest.get_modpath("moreblocks") then
	    stairsplus:register_all("colouredstonebricks", name, "colouredstonebricks:"..name, {
	        description = description.." Stone Brick",
			tiles = {"colouredstonebricks_"..name..".png"},
			groups = {cracky=3},
			sounds = default.node_sound_stone_defaults(),
	        sunlight_propagates = true,
	    })
	end
end

-- We don't have blue, violet or magenta coloured stone bricks (yet)
--minetest.register_alias("dye:dark_blue","dye:blue")
--minetest.register_alias("dye:dark_pink","dye:magenta")
--minetest.register_alias("dye:purple","dye:violet")
