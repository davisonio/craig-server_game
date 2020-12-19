
local cheaper_part = "default:copper_ingot"

if minetest.get_modpath("mesecons") then
	cheaper_part = "mesecons:wire_00000000_off"
end

minetest.register_craft({
	output = "atm:atm",
	recipe = {
		{"default:steel_ingot", cheaper_part, "default:steel_ingot"},
		{"default:glass", "currency:minegeld", "default:steel_ingot"},
		{"default:steel_ingot", cheaper_part, "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "atm:atm2",
	recipe = {
		{"default:steel_ingot", cheaper_part, "default:steel_ingot"},
		{"default:glass", "currency:minegeld_5", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "atm:atm3",
	recipe = {
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"default:glass", "currency:minegeld_10", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "atm:wtt",
	recipe = {
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"default:glass", cheaper_part, "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"}
	}
})
