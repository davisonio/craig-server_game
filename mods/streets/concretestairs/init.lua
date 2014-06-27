--[[
	StreetsMod: Concrete stairs (compatible to circular saw)
]]
register_stair_slab_panel_micro("streets", "concrete", "streets:concrete", {cracky=2}, {"streets_concrete.png"}, "Concrete", "concrete", nil)
table.insert(circular_saw.known_stairs,"streets:concrete")
minetest.register_alias("stairs:stair_concrete","streets:stair_concrete")

minetest.register_alias("prefab:concrete_stair","stairs:stair_concrete")
minetest.register_alias("prefab:concrete_slab","stairs:slab_concrete")