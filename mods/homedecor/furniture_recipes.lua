
minetest.register_craft({
    output = "homedecor:table", "homedecor:chair 2",
    recipe = {
        { "default:wood","default:wood", "default:wood" },
        { "default:stick", "", "default:stick" },
    },
})

minetest.register_craft({
    type = "fuel",
    recipe = "homedecor:table",
    burntime = 30,
})

minetest.register_craft({
    output = "homedecor:chair 2",
    recipe = {
        { "default:stick",""},
        { "default:wood","default:wood" },
        { "default:stick","default:stick" },
    },
})

minetest.register_craft({
    type = "fuel",
    recipe = "homedecor:chair",
    burntime = 15,
})

minetest.register_craft({
    type = "fuel",
    recipe = "homedecor:armchair",
    burntime = 30,
})

minetest.register_craft({
    output = "homedecor:table_lamp_off",
    recipe = {
        {"default:paper","default:torch" ,"default:paper"},
        {"","default:stick",""},
        {"","stairs:slab_wood",""},
    },
})

minetest.register_craft({
    output = "homedecor:table_lamp_off",
    recipe = {
        {"default:paper","default:torch" ,"default:paper"},
        {"","default:stick",""},
        {"","stairsplus:slab_wood",""},
    },
})

minetest.register_craft({
    type = "fuel",
    recipe = "homedecor:table_lamp_off",
    burntime = 10,
})

minetest.register_craft({
    output = "homedecor:toilet",
    recipe = {
        {"","","bucket:bucket_water"},
        { "default:cobble","default:cobble", "default:cobble" },
        { "", "bucket:bucket_empty", "" },
    },
})

minetest.register_craft({
    output = "homedecor:sink",
    recipe = {
        { "default:cobble","bucket:bucket_empty", "default:cobble" },
    },
})

minetest.register_craft({
    output = "homedecor:taps",
    recipe = {
        { "default:steel_ingot","bucket:bucket_water", "default:steel_ingot" },
    },
})

minetest.register_craft({
    output = "homedecor:shower_tray",
    recipe = {
        { "default:cobble","bucket:bucket_water", "default:cobble" },
    },
})

minetest.register_craft({
    output = "homedecor:shower_head",
    recipe = {
        {"default:steel_ingot", "bucket:bucket_water"},
    },
})

minetest.register_craft({
    output = "homedecor:bars 10",
    recipe = {
        { "default:steel_ingot","default:steel_ingot","default:steel_ingot" },
        { "default:steel_ingot","default:steel_ingot","default:steel_ingot" },
    },
})

minetest.register_craft({
    output = "homedecor:L_binding_bars 4",
    recipe = {
        { "homedecor:bars","" },
        { "homedecor:bars","homedecor:bars" },
    },
})

minetest.register_craft({
    output = "homedecor:chains 4",
    recipe = {
        {"","default:steel_ingot","default:steel_ingot"},
        { "default:steel_ingot","", "default:steel_ingot" },
        { "default:steel_ingot", "default:steel_ingot", "" },
    },
})

minetest.register_craft({
    output = "homedecor:chains 4",
    recipe = {
        { "default:steel_ingot", "", "default:steel_ingot"},
        { "glooptest:chainlink", "", "glooptest:chainlink" },
        { "glooptest:chainlink", "", "glooptest:chainlink" },
    },
})

minetest.register_craft({
    output = "homedecor:torch_wall 10",
    recipe = {
        { "default:coal_lump" },
        { "default:steel_ingot" },
    },
})
