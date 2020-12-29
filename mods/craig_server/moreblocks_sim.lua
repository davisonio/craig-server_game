cgserver.register_simple_recipes = function(category, alternate, modname, subname, recipeitem)
	if category == "micro" and alternate == "" then
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":micro_" .. subname .. "_1"},
		})

		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":panel_" .. subname .. "_1"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":micro_" .. subname .. "_2"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":panel_" .. subname .. "_2"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":micro_" .. subname .. "_4"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":panel_" .. subname .. "_4"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":micro_" .. subname .. ""},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":panel_" .. subname .. ""},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":micro_" .. subname .. "_12"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 3",
			recipe = {modname .. ":panel_" .. subname .. "_12"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":micro_" .. subname .. "_14"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":panel_" .. subname .. "_14"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":micro_" .. subname .. "_15"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":panel_" .. subname .. "_15"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 5",
			recipe = {modname .. ":stair_" .. subname .. "_outer"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 6",
			recipe = {modname .. ":stair_" .. subname .. ""},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 7",
			recipe = {modname .. ":stair_" .. subname .. "_inner"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":slab_" .. subname .. "_1"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":slab_" .. subname .. "_2"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":slab_" .. subname .. "_quarter"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":slab_" .. subname .. ""},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 6",
			recipe = {modname .. ":slab_" .. subname .. "_three_quarter"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 7",
			recipe = {modname .. ":slab_" .. subname .. "_14"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 8",
			recipe = {modname .. ":slab_" .. subname .. "_15"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":slab_" .. subname .. "_two_sides"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":slab_" .. subname .. "_three_sides"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":slab_" .. subname .. "_three_sides_u"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 3",
			recipe = {modname .. ":stair_" .. subname .. "_half"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":stair_" .. subname .. "_alt_1"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":stair_" .. subname .. "_alt_2"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":stair_" .. subname .. "_alt_4"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":stair_" .. subname .. "_alt"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":slope_" .. subname .. ""},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":slope_" .. subname .. "_half"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 6",
			recipe = {modname .. ":slope_" .. subname .. "_half_raised"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 7",
			recipe = {modname .. ":slope_" .. subname .. "_inner"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 3",
			recipe = {modname .. ":slope_" .. subname .. "_inner_half"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 7",
			recipe = {modname .. ":slope_" .. subname .. "_inner_half_raised"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 7",
			recipe = {modname .. ":slope_" .. subname .. "_inner_cut"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":slope_" .. subname .. "_inner_cut_half"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 8",
			recipe = {modname .. ":slope_" .. subname .. "_inner_cut_half_raised"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 3",
			recipe = {modname .. ":slope_" .. subname .. "_outer"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":slope_" .. subname .. "_outer_half"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 6",
			recipe = {modname .. ":slope_" .. subname .. "_outer_half_raised"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 2",
			recipe = {modname .. ":slope_" .. subname .. "_outer_cut"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 1",
			recipe = {modname .. ":slope_" .. subname .. "_outer_cut_half"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 3",
			recipe = {modname .. ":slope_" .. subname .. "_outer_cut_half_raised"},
		})
		
		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 4",
			recipe = {modname .. ":slope_" .. subname .. "_cut"},
		})

		minetest.register_craft({
			type = "shapeless",
			output = recipeitem,
			recipe = {modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname},
		})

		minetest.register_craft({
			type = "shapeless",
			output = modname .. ":micro_" .. subname .. " 3",
			recipe = {modname .. ":stair_" .. subname .. "_right_half"},
		})
	end
	
	minetest.register_alias(modname .. ":micro_" .. subname .. "_bottom", modname .. ":micro_" .. subname)
	minetest.register_alias(modname.. ":panel_" ..subname.. "_bottom", modname.. ":panel_" ..subname)
end