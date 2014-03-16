
-- Test
minetest.register_node("homedecor:table", {
    description = "Table",
    tiles = {
        "forniture_wood.png",
        "forniture_wood.png",
        "forniture_wood_s1.png",
        "forniture_wood_s1.png",
        "forniture_wood_s2.png",
        "forniture_wood_s2.png",
    },
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.4, -0.5, -0.4, -0.3,  0.4, -0.3 },
            {  0.3, -0.5, -0.4,  0.4,  0.4, -0.3 },
            { -0.4, -0.5,  0.3, -0.3,  0.4,  0.4 },
            {  0.3, -0.5,  0.3,  0.4,  0.4,  0.4 },
            { -0.5,  0.4, -0.5,  0.5,  0.5,  0.5 },
            { -0.4, -0.2, -0.3, -0.3, -0.1,  0.3 },
            {  0.3, -0.2, -0.4,  0.4, -0.1,  0.3 },
            { -0.3, -0.2, -0.4,  0.4, -0.1, -0.3 },
            { -0.3, -0.2,  0.3,  0.3, -0.1,  0.4 },
        },
    },
    groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
})  

minetest.register_node("homedecor:chair", {
    description = "Chair",
    tiles = {
        "forniture_wood.png",
        "forniture_wood.png",
        "forniture_wood_s1.png",
        "forniture_wood_s1.png",
        "forniture_wood_s2.png",
        "forniture_wood_s2.png",
    },
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.3, -0.5,  0.20, -0.2,  0.5,  0.30 },
            {  0.2, -0.5,  0.20,  0.3,  0.5,  0.30 },
            { -0.3, -0.5, -0.30, -0.2, -0.1, -0.20 },
            {  0.2, -0.5, -0.30,  0.3, -0.1, -0.20 },
            { -0.3, -0.1, -0.30,  0.3,  0.0,  0.20 },
            { -0.2,  0.1,  0.25,  0.2,  0.4,  0.26 },
        },
    },
    selection_box = {
        type = "fixed",
        fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
    },
    groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
})

local chaircolors = {
	{ "black", "Black" },
	{ "red", "Red" },
	{ "pink", "Pink" },
	{ "violet", "Violet" },
	{ "blue", "Blue" },
	{ "dark_green", "Dark Green" },
}

for i in ipairs(chaircolors) do
	color = chaircolors[i][1]
	name = chaircolors[i][2]
	minetest.register_node("homedecor:armchair_"..color, {
	    description = "Armchair ("..name..")",
	    tiles = {
		"forniture_armchair_top_"..color..".png",
		"forniture_armchair_top_"..color..".png",
		"forniture_armchair_lat1_"..color..".png",
		"forniture_armchair_lat1_"..color..".png",
		"forniture_armchair_lat2_"..color..".png",
		"forniture_armchair_lat2_"..color..".png",
	    },
	    drawtype = "nodebox",
	    sunlight_propagates = true,
	    paramtype = "light",
	    paramtype2 = "facedir",
	    node_box = {
		type = "fixed",
		fixed = {
		    { -0.50, -0.50, -0.45, -0.30,  0.05,  0.30 },
		    { -0.45, -0.50, -0.50, -0.35,  0.05, -0.45 },
		    { -0.45,  0.05, -0.45, -0.35,  0.10,  0.15 },
		    {  0.30, -0.50, -0.45,  0.50,  0.05,  0.30 },
		    {  0.35, -0.50, -0.50,  0.45,  0.05, -0.45 },
		    {  0.35,  0.05, -0.45,  0.45,  0.10,  0.15 },
		    { -0.50, -0.50,  0.30,  0.50,  0.45,  0.50 },
		    { -0.45,  0.45,  0.35,  0.45,  0.50,  0.45 },
		    { -0.30, -0.45, -0.35,  0.30, -0.10,  0.30 },
		    { -0.30, -0.45, -0.40,  0.30, -0.15, -0.35 },
		    { -0.50,  0.05,  0.15, -0.30,  0.45,  0.30 },
		    { -0.45,  0.10,  0.10, -0.35,  0.45,  0.15 },
		    { -0.45,  0.45,  0.15, -0.35,  0.50,  0.35 },
		    {  0.30,  0.05,  0.15,  0.50,  0.45,  0.30 },
		    {  0.35,  0.10,  0.10,  0.45,  0.45,  0.15 },
		    {  0.35,  0.45,  0.15,  0.45,  0.50,  0.35 },
		},
	    },
	    groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	})

	minetest.register_craft({
	    output = "homedecor:armchair_"..color.." 2",
	    recipe = {
		{ "wool:"..color,""},
		{ "default:wood","default:wood" },
		{ "wool:"..color,"wool:"..color },
	    },
	})

end

local repl = { off="low", low="med", med="hi", hi="max", max="off", }

local function reg_lamp(suffix, nxt, desc, tilesuffix, light)
	minetest.register_node("homedecor:table_lamp_"..suffix, {
	description = desc,
	drawtype = "nodebox",
	tiles = {
		"forniture_table_lamp_s"..tilesuffix..".png",
		"forniture_table_lamp_s"..tilesuffix..".png",
		"forniture_table_lamp_l"..tilesuffix..".png",
	},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.1500, -0.500, -0.1500,  0.1500, -0.45,  0.1500 },
			{ -0.0500, -0.450, -0.0500,  0.0500, -0.40,  0.0500 },
			{ -0.0250, -0.400, -0.0250,  0.0250, -0.10,  0.0250 },
			{ -0.0125, -0.125, -0.2000,  0.0125, -0.10,  0.2000 },
			{ -0.2000, -0.125, -0.0125,  0.2000, -0.10,  0.0125 },
			{ -0.2000, -0.100, -0.2000, -0.1750,  0.30,  0.2000 },
			{  0.1750, -0.100, -0.2000,  0.2000,  0.30,  0.2000 },
			{ -0.1750, -0.100, -0.2000,  0.1750,  0.30, -0.1750 },
			{ -0.1750, -0.100,  0.1750,  0.1750,  0.30,  0.2000 },
		},
	},
	walkable = false,
	light_source = light,
	selection_box = {
		type = "fixed",
		fixed = { -0.2, -0.5, -0.2, 0.2, 0.30, 0.2 },
	},
	groups = {cracky=2,oddly_breakable_by_hand=1,
		not_in_creative_inventory=((desc == nil) and 1) or nil,
	},
	drop = "homedecor:table_lamp_off",
	on_punch = function(pos, node, puncher)
		node.name = "homedecor:table_lamp_"..repl[suffix]
		minetest.set_node(pos, node)
		nodeupdate(pos)
	end,
	})
	minetest.register_alias("3dforniture:table_lamp_"..suffix, "homedecor:table_lamp_"..suffix)
end

reg_lamp("off", "low", "Table Lamp",  "", nil )
reg_lamp("low", "med", nil,          "l", 3   )
reg_lamp("med", "hi" , nil,          "m", 7   )
reg_lamp("hi" , "max", nil,          "h", 11  )
reg_lamp("max", "off", nil,          "x", 14  )

-- Aliases for 3dforniture mod.
minetest.register_alias("3dforniture:table", "homedecor:table")
minetest.register_alias("3dforniture:chair", "homedecor:chair")
minetest.register_alias("3dforniture:armchair", "homedecor:armchair_black")
minetest.register_alias("homedecor:armchair", "homedecor:armchair_black")

minetest.register_alias('table', 'homedecor:table')
minetest.register_alias('chair', 'homedecor:chair')
minetest.register_alias('armchair', 'homedecor:armchair')
