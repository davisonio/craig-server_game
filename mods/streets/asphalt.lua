-- Normal Asphalt
minetest.register_node("streets:asphalt",{
	description = streets.S("Asphalt"),
	tiles	= {"streets_asphalt.png"},
	groups	= {cracky=1,level=2}
})

minetest.register_craft({
	type = "cooking",
	output	= "streets:asphalt",
	recipe 	= "default:gravel",
	cooktime = 2
})

-- Asphalt
minetest.register_node("streets:asphalt_sideline",{
	description = streets.S("Asphalt with sideline"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_sideline 6",
	recipe = {
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_solid_line",{
	description = streets.S("Asphalt with solid line"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_solid_line 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_dashed_line",{
	description = streets.S("Asphalt with dashed line"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_dashed_line 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_outer_edge",{
	description = streets.S("Asphalt with outer edge"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_asphalt_outer_edge.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_outer_edge 6",
	recipe = {
		{"dye:white","dye:white","dye:white"},
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_parking",{
	description = streets.S("Asphalt with parking label"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_parking.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_parking 6",
	recipe = {
		{"streets:asphalt","dye:white","dye:white"},
		{"streets:asphalt","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_arrow_straight",{
	description = streets.S("Asphalt with arrow (straight)"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_straight.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_arrow_straight 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_arrow_left",{
	description = streets.S("Asphalt with arrow (left)"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_left.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_arrow_left 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"dye:white","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_arrow_right",{
	description = streets.S("Asphalt with arrow (right)"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_right.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_arrow_right 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_arrow_straight_left",{
	description = streets.S("Asphalt with arrow (straight left)"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_straight_left.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_arrow_straight_left 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"dye:white","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_straight_right",{
	description = streets.S("Asphalt with arrow (straight right)"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_straight_right.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_arrow_straight_right 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node("streets:asphalt_arrow_alldirs",{
	description = streets.S("Asphalt with arrow (all directions)"),
	groups = {cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_alldirs.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_craft({
	output = "streets:asphalt_arrow_alldirs 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"dye:white","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

-- Stairsplus
stairsplus:register_all("streets", "asphalt", "streets:asphalt", {
	description = "Asphalt",
	tiles = {"streets_asphalt.png"},
	groups = {cracky=1,level=2,not_in_craft_guide=1},
	sunlight_propagates = true,
})

stairsplus:register_all("streets", "asphalt_solid_line", "streets:asphalt_solid_line", {
	description = "Asphalt with solid line",
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_solid_line.png"},
	groups = {cracky=1,level=2,not_in_craft_guide=1},
	sunlight_propagates = true,
})

stairsplus:register_all("streets", "asphalt_dashed_line", "streets:asphalt_dashed_line", {
	description = "Asphalt with dashed line",
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_dashed_line.png"},
	groups = {cracky=1,level=2,not_in_craft_guide=1},
	sunlight_propagates = true,
})

-- Sideline stairs/slabs
minetest.register_node("streets:asphalt_side_stair_l",{
	description = streets.S("Asphalt stair"),
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_side.png"},
	groups = {cracky=1,level=2,not_in_craft_guide=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.0,0.5},
			{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5}
		}
	}
})

minetest.register_node("streets:asphalt_side_stair_r",{
	description = streets.S(streets.S("Asphalt stair")),
	tiles = {"streets_asphalt.png^streets_asphalt_side_r.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_side_r.png"},
	groups = {cracky=1,level=2,not_in_craft_guide=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	drop = "streets:asphalt_side_stair_l",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.0,0.5},
			{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5}
		}
	}
})

minetest.register_craft({
	output = "streets:asphalt_side_stair_l 6",
	recipe = {
		{"streets:asphalt_side","",""},
		{"streets:asphalt_side","streets:asphalt_side",""},
		{"streets:asphalt_side","streets:asphalt_side","streets:asphalt_side"}
	}
})

minetest.register_craft({
	output = "streets:asphalt_side_stair_r 6",
	recipe = {
		{"","","streets:asphalt_side"},
		{"","streets:asphalt_side","streets:asphalt_side"},
		{"streets:asphalt_side","streets:asphalt_side","streets:asphalt_side"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "streets:asphalt_side_stair_r",
	recipe = {"streets:asphalt_side_stair_l"}
})

minetest.register_craft({
	type = "shapeless",
	output = "streets:asphalt_side_stair_l",
	recipe = {"streets:asphalt_side_stair_r"}
})

minetest.register_node("streets:asphalt_side_slab_l",{
	description = streets.S(streets.S("Asphalt slab")),
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_side.png"},
	groups = {cracky=1,level=2,not_in_craft_guide=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.0,0.5}
		}
	}
})

minetest.register_node("streets:asphalt_side_slab_r",{
	description = streets.S(streets.S("Asphalt slab")),
	tiles = {"streets_asphalt.png^streets_asphalt_side_r.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_side_r.png"},
	groups = {cracky=1,level=2,not_in_craft_guide=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.0,0.5}
		}
	}
})

minetest.register_craft({
	output = "streets:asphalt_side_slab_l 3",
	recipe = {
		{"","",""},
		{"","",""},
		{"streets:asphalt_side","streets:asphalt_side","streets:asphalt_side"}
	}
})

minetest.register_craft({
	output = "streets:asphalt_side_slab_r 3",
	recipe = {
		{"streets:asphalt_side","streets:asphalt_side","streets:asphalt_side"},
		{"","",""},
		{"","",""}
	}
})
