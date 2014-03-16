minetest.register_craftitem("dusts:iron", {
	description = "Iron Dust",
	inventory_image = "iron_dust.png",
})
minetest.register_craft( {
         type = "shapeless",
         output = "dusts:iron 2",
         recipe = { "handtools:hammer" , "default:iron_lump" },
         replacements = {
             { 'handtools:hammer', 'handtools:hammer' }
         }
} )
minetest.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "dusts:iron",
})

minetest.register_craftitem("dusts:copper", {
	description = "Copper Dust",
	inventory_image = "copper_dust.png",
})
minetest.register_craft( {
         type = "shapeless",
         output = "dusts:copper 2",
         recipe = { "handtools:hammer" , "default:copper_lump" },
         replacements = {
             { 'handtools:hammer', 'handtools:hammer' }
         }
} )
minetest.register_craft({
	type = "cooking",
	output = "default:copper_ingot",
	recipe = "dusts:copper",
})

minetest.register_craftitem("dusts:gold", {
	description = "Gold Dust",
	inventory_image = "gold_dust.png",
})
minetest.register_craft( {
         type = "shapeless",
         output = "dusts:gold 2",
         recipe = { "handtools:hammer" , "default:gold_lump" },
         replacements = {
             { 'handtools:hammer', 'handtools:hammer' }
         }
} )
minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "dusts:gold",
})