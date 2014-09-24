minetest.register_node("streets:concrete",{
	description = streets.S("Concrete"),
	tiles = {"streets_concrete.png"},
	groups = {cracky=1,level=2}
})

minetest.register_craft({
	type = "shapeless",
	output = "streets:concrete",
	recipe = {"default:stone"}
})

minetest.register_node("streets:concrete_wall",{
	description = streets.S("Concrete wall"),
	tiles = {"streets_concrete.png"},
	groups = {cracky=1,level=2},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4, -0.5, -0.5, 0.4, -0.4, 0.5},
			{-0.1, -0.4, -0.5, 0.1, 0.5, 0.5}
		}
	}
})

minetest.register_craft({
	output = "streets:concrete_wall 3",
	recipe = {
		{"","streets:concrete",""},
		{"","streets:concrete",""},
		{"streets:concrete","streets:concrete","streets:concrete"}
	}
})

minetest.register_node("streets:concrete_wall_flat",{
	description = streets.S("Concrete wall"),
	tiles = {"streets_concrete.png"},
	groups = {cracky=1,level=2},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.5, 0.1, 0.5, 0.5}
		}
	}
})

minetest.register_craft({
	output = "streets:concrete_wall_flat 3",
	recipe = {
		{"","streets:concrete",""},
		{"","streets:concrete",""},
		{"","",""}
	}
})

stairsplus:register_all("streets", "concrete", "streets:concrete", {
	description = "Concrete",
	tiles = {"streets_concrete.png"},
	groups = {cracky=1,level=2,not_in_craft_guide=1},
	sunlight_propagates = true,
})
