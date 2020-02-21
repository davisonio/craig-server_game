-- Node definitions
minetest.register_node("bitchange:minecoinblock", {
	description = "MineCoin Block",
	tiles = { "bitchange_minecoinblock.png" },
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 30000,
})

minetest.register_craftitem("bitchange:minecoin", {
	description = "MineCoin",
	inventory_image = "bitchange_minecoin.png",
	stack_max = 30000,
})

minetest.register_craftitem("bitchange:mineninth", {
	description = "MineNinth",
	inventory_image = "bitchange_mineninth.png",
	stack_max = 30000,
})

-- Crafting
if bitchange.craft_convert_currency then
	minetest.register_craft({
		output = "bitchange:minecoinblock",
		recipe = {
			{"bitchange:minecoin", "bitchange:minecoin", "bitchange:minecoin"},
			{"bitchange:minecoin", "bitchange:minecoin", "bitchange:minecoin"},
			{"bitchange:minecoin", "bitchange:minecoin", "bitchange:minecoin"},
		}
	})

	minetest.register_craft({
		output = "bitchange:minecoin 9",
		recipe = {
			{"bitchange:minecoinblock"},
		}
	})

	minetest.register_craft({
		output = "bitchange:minecoin",
		recipe = {
			{"bitchange:mineninth", "bitchange:mineninth", "bitchange:mineninth"},
			{"bitchange:mineninth", "bitchange:mineninth", "bitchange:mineninth"},
			{"bitchange:mineninth", "bitchange:mineninth", "bitchange:mineninth"},
		}
	})

	minetest.register_craft({
		output = "bitchange:mineninth 9",
		recipe = {
			{"bitchange:minecoin"},
		}
	})
end

-- Cooking
minetest.register_craft({
	type = "cooking",
	recipe = "default:goldblock",
	output = "bitchange:minecoinblock 2",
})

minetest.register_craft({
	type = "cooking",
	recipe = "bitchange:minecoinblock",
	output = "default:gold_ingot 4",
})

-- Legacy
if bitchange.enable_generation then
	minetest.log("warning", "[bitchange] Ores will not be generated any more. Remove the setting " ..
		"'enable_generation' from your bitchange configuration to suppress this warning.")
end

minetest.register_alias("bitchange:minecoin_in_ground", "default:stone_with_gold")
minetest.register_alias("bitchange:mineninth_in_ground", "default:stone_with_tin")

minetest.register_alias("bitchange:coinbase", "bitchange:mineninth")
