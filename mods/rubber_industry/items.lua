-----------
-- Items --
-----------

-- Mechanical arm
minetest.register_craftitem("rubber_industry:mechanical_arm", {
	description = "Mechanical arm",
	inventory_image = "rubber_industry_mechanical_arm.png",
})

-- Mechanical arm craft
minetest.register_craft({
	output = "rubber_industry:mechanical_arm",
	recipe = {
		{"rubber_industry:gear", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "", ""},
		{"rubber_industry:gear", "", ""}
	}
})

-- Crafter
minetest.register_craftitem("rubber_industry:crafter", {
	description = "Crafter",
	inventory_image = "rubber_industry_crafter.png"
})

-- Screwdriver
minetest.register_craftitem("rubber_industry:screwdriver", {
	description = "Rubber Industry - Screwdriver",
	inventory_image = "rubber_industry_screwdriver.png"
})

-- Hammer
minetest.register_craftitem("rubber_industry:hammer", {
	description = "Hammer",
	inventory_image = "rubber_industry_hammer.png"
})

-- Crafter craft
minetest.register_craft({
	output = "rubber_industry:crafter",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot" },
		{"rubber_industry:mechanical_arm", "toolbox:toolbox", "rubber_industry:mechanical_arm"}
	}
})

-- Saw
minetest.register_craftitem("rubber_industry:saw", {
	description = "Saw",
	inventory_image = "rubber_industry_saw.png",
})

minetest.register_craft({
		type = "shapeless",
		output = "default:wood 6",
		recipe = {"rubber_industry:saw" , "default:tree"},
		replacements = {
			{"rubber_indsustry:saw", "rubber_indsustry:saw"}
		}
})

minetest.register_craft({
	output = "rubber_industry:saw",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:stick", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

-- Toolbox
minetest.register_craftitem("rubber_industry:toolbox", {
	description = "Toolbox",
	inventory_image = "rubber_industry_toolbox.png",
})

-- Toolbox craft
minetest.register_craft({
	output = "rubber_industry:toolbox",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"rubber_industry:hammer", "rubber_industry:saw", "rubber_industry:screwdriver"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})
