--[[
	StreetsMod: Concrete, Concrete wall (flat), Concrete wall (full)
]]

minetest.register_alias("technic:concrete","streets:concrete")

if streets.extendedBy.technic == true then 
	-- Use technic's concrete block for the seperating wall
	minetest.register_node(":streets:concrete_wall",{
		description = streets.S("Concrete wall"),
		tiles = {"technic_concrete_block.png"},
		groups = {cracky=2},
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
			{"","technic:concrete",""},
			{"","technic:concrete",""},
			{"technic:concrete","technic:concrete","technic:concrete"}
		}
	})
	minetest.register_node(":streets:concrete_wall_flat",{
		description = streets.S("Concrete wall"),
		tiles = {"technic_concrete_block.png"},
		groups = {cracky=2},
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
			{"","technic:concrete",""},
			{"","technic:concrete",""},
			{"","",""}
		}
	})
elseif streets.extendedBy.prefab then
	minetest.register_alias("streets:concrete","prefab:concrete")
	minetest.register_node(":streets:concrete_wall",{
		description = streets.S("Concrete wall"),
		tiles = {"prefab_concrete.png"},
		groups = {cracky=2},
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
	minetest.register_node(":streets:concrete_wall_flat",{
		description = streets.S("Concrete wall"),
		tiles = {"prefab_concrete.png"},
		groups = {cracky=2},
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
else
	-- Register concrete block with streets' texture and then the seperating wall
	minetest.register_node(":streets:concrete",{
		description = streets.S("Concrete"),
		tiles = {"streets_concrete.png"},
		groups = {cracky=2}
	})
	minetest.register_node(":streets:concrete_wall",{
		description = streets.S("Concrete wall"),
		tiles = {"streets_concrete.png"},
		groups = {cracky=2},
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
	minetest.register_node(":streets:concrete_wall_flat",{
		description = streets.S("Concrete wall"),
		tiles = {"streets_concrete.png"},
		groups = {cracky=2},
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
	minetest.register_craft({
		type = "shapeless",
		output = "streets:concrete",
		recipe = {"default:stone"}
	})
end
