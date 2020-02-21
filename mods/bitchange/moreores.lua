-- Conversion of other ores to money

if bitchange.use_technic_zinc and minetest.get_modpath("technic_worldgen") then
	minetest.register_craft({
		type   = "cooking",
		output = "bitchange:mineninth 8",
		recipe = "technic:zinc_block",
	})
end

if bitchange.use_moreores_tin then
	bitchange.use_default_tin = true
	minetest.log("warning", "[bitchange] Loaded deprecated setting 'use_default_tin'")
end

if bitchange.use_default_tin then
	minetest.register_craft({
		type   = "cooking",
		output = "bitchange:mineninth 18",
		recipe = "default:tinblock"
	})
end
