-----------------
-- Transactors --
-----------------

-- Transactor - transports items sideways
minetest.register_node("rubber_industry:transactor_sideways", {
	description = "Transactor [transporting items sideways]",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.2, 0.5, 0.1, 0.2},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.2, 0.5, 0.1, 0.2},
		},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	tiles = {
		{name="placeholder.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1.0}},
		"placeholder.png",
		"placeholder.png",
		"placeholder.png",
		"placeholder.png",
		"placeholder.png",
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Transactor [transporting items sideways]")
	end,
})

minetest.register_craft({
	output = "rubber_industry:transactor_sideways",
	recipe = {
		{"rubber_industry:conveyor_belt", "rubber_industry:mechanical_arm", "rubber_industry:conveyor_belt"},
		{"rubber_industry:gear", "rubber_industry:rubber_sheet", "rubber_industry:gear"},
		{"rubber_industry:conveyor_belt", "rubber_industry:mechanical_arm", "rubber_industry:conveyor_belt"}
	}
})

-- Transactor - transporting items up
minetest.register_node("rubber_industry:transactor_up", {
	description = "Transactor [transporting items up]",
	node_box = {
		type = "fixed",
		fixed = {
			{-4/16,-8/16,-4/16,4/16, 8/16,4/16},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-4/16,-8/16,-4/16,4/16, 8/16,4/16},
		},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	tiles = {
		"placeholder.png",
		"placeholder.png",
		"placeholder.png",
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Transactor [transporting items up]")
	end,
})

minetest.register_craft({
	output = "rubber_industry:transactor_up",
	recipe = {
		{"rubber_industry:conveyor_belt", "rubber_industry:rubber_sheet", "rubber_industry:conveyor_belt"},
		{"rubber_industry:mechanical_arm", "rubber_industry:gear", "rubber_industry:mechanical_arm"},
		{"rubber_industry:conveyor_belt", "rubber_industry:gear", "rubber_industry:conveyor_belt"}
	}
})

minetest.register_node("rubber_industry:transactor_down", {
	description = "Transactor [transporting items down]",
	node_box = {
		type = "fixed",
		fixed = {
			{-4/16,-8/16,-4/16,4/16, 8/16,4/16},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-4/16,-8/16,-4/16,4/16, 8/16,4/16},
		},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	tiles = {
		"placeholder.png",
		"placeholder.png",
		"placeholder.png",
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Transactor [transporting items down]")
	end,
})

minetest.register_craft({
	output = "rubber_industry:transactor_down",
	recipe = {
		{"rubber_industry:conveyor_belt", "rubber_industry:gear", "rubber_industry:conveyor_belt"},
		{"rubber_industry:mechanical_arm", "rubber_industry:gear", "rubber_industry:mechanical_arm"},
		{"rubber_industry:conveyor_belt", "rubber_industry:rubber_sheet", "rubber_industry:conveyor_belt"}
	}
})