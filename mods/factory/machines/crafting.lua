minetest.register_craft({
	output = "factory:belt 12",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:stone", "factory:small_steel_gear", "default:stone"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "factory:arm",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "farming:hoe_steel"},
		{"default:steel_ingot", "default:gold_ingot", "factory:small_steel_gear"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "factory:ind_furnace",
	recipe = {
		{"factory:small_steel_gear", "default:steel_ingot", "factory:small_steel_gear"},
		{"default:steel_ingot", "default:furnace", "default:steel_ingot"},
		{"default:stonebrick", "default:obsidian", "default:stonebrick"}
	}
})

minetest.register_craft({
	output = "factory:taker",
	recipe = {
		{"default:shovel_steel", "default:steel_ingot", "default:gold_ingot"},
		{"factory:small_steel_gear", "factory:small_steel_gear", "default:gold_ingot"},
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"}
	}
})

minetest.register_craft({
	type = "shapeless", 
	output = "factory:taker_gold",
	recipe = {"factory:taker", "default:goldblock", "factory:small_gold_gear"}
})

minetest.register_craft({
	type = "shapeless", 
	output = "factory:taker_diamond",
	recipe = {"factory:taker_gold", "default:diamondblock", "factory:small_diamond_gear"}
})

minetest.register_craft({
	type = "shapeless", 
	output = "factory:queuedarm",
	recipe = {"factory:arm", "default:chest", "factory:small_gold_gear"}
})

minetest.register_craft({
	output = "factory:ind_squeezer",
	recipe = {
		{"default:glass", "default:stick", "default:glass"},
		{"default:glass", "default:steelblock", "default:glass"},
		{"factory:small_gold_gear", "factory:ind_furnace", "factory:small_gold_gear"}
	}
})

minetest.register_craft({
	output = "factory:swapper",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"factory:arm", "factory:scanner_chip", "factory:arm"},
		{"default:mese_crystal", "", "default:mese_crystal"}
	}
})

minetest.register_craft({
	output = "factory:fan_on",
	recipe = {
		{"default:steel_ingot", "factory:fan_blade", "default:steel_ingot"},
		{"factory:fan_blade", "factory:small_gold_gear", "factory:fan_blade"},
		{"default:steel_ingot", "factory:fan_blade", "default:steel_ingot"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "factory:fan_wall_on",
	recipe = {"factory:fan_on"}
})

minetest.register_craft({
	output = "factory:miner_on",
	recipe = {
		{"default:steel_ingot", 	"factory:fan_on", 			"default:steel_ingot"},
		{"factory:small_gold_gear", "factory:taker_on", 		"factory:small_gold_gear"},
		{"default:steel_ingot", 	"default:pick_mese", 		"default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "factory:miner_upgraded_on",
	recipe = {
		{"", 						"factory:small_diamond_gear",	""},
		{"factory:small_gold_gear", "factory:miner_on", 		"factory:small_gold_gear"},
		{"default:gold_ingot", 		"default:pick_diamond", 	"default:gold_ingot"}
	}
})

minetest.register_craft({
	output = "factory:vacuum_on",
	recipe = {
		{"default:steel_ingot", 	"factory:taker_on", 			"default:steel_ingot"},
		{"factory:small_steel_gear","factory:small_gold_gear", 		"factory:small_steel_gear"},
		{"", 						"default:steel_ingot", 			""}
	}
})