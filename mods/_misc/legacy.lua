-- Legacy mod for Craig's Server Game
-- You probably don't need this mod if you don't have an old map

--[[
local old_nodes = {}
for _,node_name in ipairs(old_nodes) do
    minetest.register_node(":"..node_name, {
        groups = {old=1},
    })
end
minetest.register_abm({
    nodenames = {"group:old"},
    interval = 1,
    chance = 1,
    action = function(pos, node)
        minetest.remove_node(pos)
    end,
})

local old_entities = {}
for _,entity_name in ipairs(old_entities) do
    minetest.register_entity(":"..entity_name, {
        on_activate = function(self, staticdata)
            self.object:remove()
        end,
    })
end
]]--

-- Remove trees from old mod `Tiny Trees` which generated in the world
--minetest.register_alias("trees:leaves_yellow", "")
--minetest.register_alias("trees:leaves_red", "")
--minetest.register_alias("trees:leaves_green", "")
--minetest.register_alias("trees:leaves_palm", "")
--minetest.register_alias("trees:leaves_mangrove", "")
--minetest.register_alias("trees:leaves_conifer", "")
--minetest.register_alias("trees:tree_palm", "")
--minetest.register_alias("trees:tree_mangrove", "")
--minetest.register_alias("trees:tree_conifer", "")
--minetest.register_alias("trees:wood_conifer", "")
--minetest.register_alias("trees:wood_palm", "")
--minetest.register_alias("trees:wood_mangrove", "")

-- Aliases for industry_pack fail
minetest.register_alias("rubber_industry:rubber_tree_full", "rubber:rubber_tree_full")
minetest.register_alias("rubber_industry:rubber_tree_empty", "rubber:rubber_tree_empty")
minetest.register_alias("rubber_industry:rubber_sheet", "rubber_sheet:rubber_sheet")
minetest.register_alias("rubber_industry:rubber_lump", "rubber_sheet:rubber_base")
minetest.register_alias("rubber_industry:rubber_storage", "rubber_collector:rubber_collector")
minetest.register_alias("rubber_industry:autocrafter", "factory:factory")
minetest.register_alias("rubber_industry:gear", "gears:gear")
minetest.register_alias("rubber_industry:mechanical_arm", "mecharm:mechanical_arm")
minetest.register_alias("rubber_industry:crafter", "factory:craft_performer")
minetest.register_alias("rubber_industry:saw", "handtools:saw")
minetest.register_alias("rubber_industry:toolbox", "toolbox:toolbox")
minetest.register_alias("rubber_industry:conveyor_belt", "conveyor:conveyor")
minetest.register_alias("rubber_industry:transactor_sideways", "transactor:transactor")
minetest.register_alias("rubber_industry:transactor_down", "hopper:hopper")
minetest.register_alias("rubber_industry:transactor_up", "dumbwaiter:dumbwaiter")

-- Remove old enchanting mod and convert to standard diamond things
minetest.register_alias("enchanting:enchanting_set", "default:diamondblock")

minetest.register_alias("enchanting:enchanted_shovel_diamond_durability", "default:shovel_diamond")
minetest.register_alias("enchanting:enchanted_sword_diamond_durability", "default:sword_diamond")
minetest.register_alias("enchanting:enchanted_axe_diamond_durability", "default:axe_diamond")
minetest.register_alias("enchanting:enchanted_pick_diamond_durability", "default:pick_diamond")

minetest.register_alias("enchanting:enchanted_shovel_diamond_strength", "default:shovel_diamond")
minetest.register_alias("enchanting:enchanted_sword_diamond_strength", "default:sword_diamond")
minetest.register_alias("enchanting:enchanted_axe_diamond_strength", "default:axe_diamond")
minetest.register_alias("enchanting:enchanted_pick_diamond_strength", "default:pick_diamond")

minetest.register_alias("enchanting:enchanted_shovel_diamond_strength", "default:shovel_diamond")
minetest.register_alias("enchanting:enchanted_sword_diamond_strength", "default:sword_diamond")
minetest.register_alias("enchanting:enchanted_axe_diamond_strength", "default:axe_diamond")
minetest.register_alias("enchanting:enchanted_pick_diamond_strength", "default:pick_diamond")

minetest.register_alias("enchanting:enchanted_shovel_diamond_uses", "default:shovel_diamond")
minetest.register_alias("enchanting:enchanted_sword_diamond_uses", "default:sword_diamond")
minetest.register_alias("enchanting:enchanted_axe_diamond_uses", "default:axe_diamond")
minetest.register_alias("enchanting:enchanted_pick_diamond_uses", "default:pick_diamond")

-- Old money mod -> New BitChange mod
minetest.register_alias("money:shop", "bitchange:shop")
minetest.register_alias("money:barter_shop", "bitchange:shop")
minetest.register_alias("money:admin_shop", "bitchange:shop")
minetest.register_alias("money:admin_barter_shop", "bitchange:shop")

-- Remove ender chest and convert to a diamond block.
minetest.register_alias("enderchest:enderchest", "default:diamondblock")

-- Other aliases
minetest.register_alias("maptools:fake_fire", "fake_fire:fake_fire")
minetest.register_alias("amt:fake_fire", "fake_fire:fake_fire")

minetest.register_alias("amt:remove_stick", "_misc:remove_stick")
minetest.register_alias("amt:pick_admin", "_misc:pick_admin")
minetest.register_alias("amt:sapple", "_misc:super_apple")

minetest.register_alias("bitchange:bitcoin 5", "bitchange:bitcoin")
minetest.register_alias("signs:sign_yard", "default:sign_wall")
minetest.register_alias("default:pinesapling", "default:pine_sapling")

-- wiki -> bookshelf
minetest.register_alias("wiki:wiki", "default:bookshelf")

-- memorandum -> paper
minetest.register_alias("memorandum:letter_empty", "default:paper")
minetest.register_alias("memorandum:letter_written", "default:paper")
minetest.register_alias("memorandum:letter", "default:paper")
minetest.register_alias("memorandum:message", "default:paper")
minetest.register_alias("memorandum:eraser", "default:paper")

-- super apple -> normal apple
minetest.register_alias("_misc:super_apple", "default:apple")

-- dusts -> ingots
minetest.register_alias("dusts:iron", "default:steel_ingot")
minetest.register_alias("dusts:copper", "default:copper_ingot")
minetest.register_alias("dusts:gold", "default:gold_ingot")

-- homedecor books -> default book
minetest.register_alias("homedecor:book_red", "default:book")
minetest.register_alias("homedecor:book_open_red", "default:book")
minetest.register_alias("homedecor:book_green", "default:book")
minetest.register_alias("homedecor:book_open_green", "default:book")
minetest.register_alias("homedecor:book_blue", "default:book")
minetest.register_alias("homedecor:book_open_blue", "default:book")
minetest.register_alias("homedecor:book_violet", "default:book")
minetest.register_alias("homedecor:book_open_violet", "default:book")
minetest.register_alias("homedecor:book_grey", "default:book")
minetest.register_alias("homedecor:book_open_grey", "default:book")
minetest.register_alias("homedecor:book_brown", "default:book")
minetest.register_alias("homedecor:book_open_brown", "default:book")

-- homedecor armchairs -> lrfurn armchairs
--minetest.register_alias("homedecor:armchair_black", "lrfurn:armchair_black")
--minetest.register_alias("homedecor:armchair_red", "lrfurn:armchair_red")
--minetest.register_alias("homedecor:armchair_pink", "lrfurn:armchair_violet")
--minetest.register_alias("homedecor:armchair_violet", "lrfurn:armchair_violet")
--minetest.register_alias("homedecor:armchair_blue", "lrfurn:armchair_blue")
--minetest.register_alias("homedecor:armchair_dark_green", "lrfurn:armchair_green")

-- homedecor plasma lamp ->
--minetest.register_alias("homedecor:plasma_lamp", "")

-- Aliases for the removal of Industry Pack
--minetest.register_alias("conveyor:conveyor", "")
--minetest.register_alias("dumbwaiter:dumbwaiter", "")
--minetest.register_alias("factory:factory", "")
--minetest.register_alias("factory:craft_performer", "")
--minetest.register_alias("gears:gear", "")
--minetest.register_alias("handtools:screwdriver", "")
--minetest.register_alias("handtools:hammer", "")
--minetest.register_alias("handtools:saw", "")
--minetest.register_alias("hopper:hopper", "")
--minetest.register_alias("mecharm:mechanical_arm", "")
minetest.register_alias("rubber:rubber_tree_full", "default:tree")
minetest.register_alias("rubber:rubber_tree_empty", "default:tree")
minetest.register_alias("rubber:bucket_rubber", "bucket:bucket_empty")
minetest.register_alias("rubber_collector:rubber_collector", "default:tree")
minetest.register_alias("rubber_sheet:rubber_sheet", "default:paper")
minetest.register_alias("rubber_sheet:rubber_base", "default:steel_ingot")
--minetest.register_alias("toolbox:toolbox", "")
--minetest.register_alias("transactor:transactor", "")

-- fences --> default fences
minetest.register_alias("fences:wood", "default:fence_wood")
minetest.register_alias("fences:cobble", "default:fence_cobble")
minetest.register_alias("fences:desert_cobble", "default:fence_desert_cobble")
minetest.register_alias("fences:sandstone", "default:fence_sandstone")
minetest.register_alias("fences:stonebrick", "default:fence_stone_brick")
minetest.register_alias("fences:sandstonebrick", "default:fence_sandstone_brick")
minetest.register_alias("fences:desert_stonebrick", "default:fence_desert_stone_brick")
