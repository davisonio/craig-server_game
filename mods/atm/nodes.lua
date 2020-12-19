
-- ATM node definitions

minetest.register_node("atm:atm", {
	description = "ATM",
	tiles = {
		"atm_top.png", "atm_top.png",
		"atm_side.png", "atm_side.png",
		"atm_side.png", "atm_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, bank_equipment = 1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	on_rightclick = function(_, _, player)
		atm.showform(player)
	end,
})

minetest.register_node("atm:atm2", {
	description = "ATM model 2",
	tiles = {
		"atm2_top.png", "atm2_top.png",
		"atm2_side.png", "atm2_side.png",
		"atm2_side.png", "atm2_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, bank_equipment = 2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	on_rightclick = function(_, _, player)
		atm.showform2(player)
	end,
})

minetest.register_node("atm:atm3", {
	description = "ATM model 3",
	tiles = {
		"atm3_top.png", "atm3_top.png",
		"atm3_side.png", "atm3_side.png",
		"atm3_side.png", "atm3_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, bank_equipment = 3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	on_rightclick = function(_, _, player)
		atm.showform3(player)
	end,
})


-- Wire transfer terminal node

minetest.register_node("atm:wtt", {
	description = "Wire Transfer Terminal",
	tiles = {
		"atm_top.png", "atm_top.png",
		"atm_side_wt.png", "atm_side_wt.png",
		"atm_side_wt.png", "atm_front_wt.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, bank_equipment = 1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	on_rightclick = function(_, _, player)
		atm.showform_wt(player)
	end,
})
