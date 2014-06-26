---------------------------------------
-- Rubber industry mod by CraigyDavi --
---------------------------------------

-- Load files
dofile(minetest.get_modpath("rubber_industry").."/rubber.lua")
dofile(minetest.get_modpath("rubber_industry").."/nodes.lua")
dofile(minetest.get_modpath("rubber_industry").."/items.lua")
dofile(minetest.get_modpath("rubber_industry").."/transactors.lua")
dofile(minetest.get_modpath("rubber_industry").."/transactor_functions.lua")

--Aliases
minetest.register_alias("rubber:rubber_tree_full", "rubber_industry:rubber_tree_full")
minetest.register_alias("rubber:rubber_tree_empty", "rubber_industry:rubber_tree_empty")
minetest.register_alias("rubber_sheet:rubber_sheet", "rubber_industry:rubber_sheet")
minetest.register_alias("rubber_sheet:rubber_base", "rubber_industry:rubber_lump")
minetest.register_alias("rubber_collector:rubber_collector", "rubber_industry:rubber_storage")
minetest.register_alias("factory:factory", "rubber_industry:autocrafter")
minetest.register_alias("gears:gear", "rubber_industry:gear")
minetest.register_alias("mecharm:mechanical_arm", "rubber_industry:mechanical_arm")
minetest.register_alias("factory:craft_performer", "rubber_industry:crafter")
minetest.register_alias("handtools:screwdriver", "rubber_industry:saw")
minetest.register_alias("handtools:hammer", "rubber_industry:saw")
minetest.register_alias("handtools:saw", "rubber_industry:saw")
minetest.register_alias("toolbox:toolbox", "rubber_industry:toolbox")
minetest.register_alias("conveyor:conveyor", "rubber_industry:conveyor_belt")
minetest.register_alias("transactor:transactor", "rubber_industry:transactor_sideways")
minetest.register_alias("hopper:hopper", "rubber_industry:transactor_down")
minetest.register_alias("dumbwaiter:dumbwaiter", "rubber_industry:transactor_up")

print ("Rubber Industry [rubber_industry] has loaded!")