-- Hotfix #1; April 14, 2014; https://github.com/webdesigner97/streets/issues/11
minetest.register_alias("stairs:stair_asphalt","streets:stair_asphalt")

-- Hotfix #2; June 27, 2014; https://github.com/webdesigner97/streets/issues/25
minetest.register_alias("streets:asphalt_stair","streets:stair_asphalt")
minetest.register_alias("streets:asphalt_slab","streets:slab_asphalt")

-- More!
minetest.register_alias("streets:asphalt_side","streets:asphalt_sideline")
minetest.register_alias("streets:asphalt_middle","streets:asphalt_solid_line")
minetest.register_alias("streets:asphalt_middle_dashed","streets:asphalt_dashed_line")

minetest.register_alias("streets:asphalt_dashed_line_stair","streets:stair_asphalt_dashed_line")
minetest.register_alias("streets:asphalt_solid_line_stair","streets:stair_asphalt_solid_line")

minetest.register_alias("streets:asphalt_dashed_line_slab","streets:slab_asphalt_dashed_line")
minetest.register_alias("streets:asphalt_solid_line_slab","streets:slab_asphalt_solid_line")

-- Merge two concretes.

minetest.register_alias("concrete:concrete","streets:concrete")
