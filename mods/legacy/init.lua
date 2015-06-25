-- Legacy stuff
-- To maintain backwards-compatibility and prevent errors/unknown blocks

local old_nodes = {
    -- Remove trees from old mod `Tiny Trees` which generated in the world
	"trees:leaves_yellow", 
	"trees:leaves_red",
	"trees:leaves_green",
	"trees:leaves_palm",
	"trees:leaves_mangrove",
	"trees:leaves_conifer",
	"trees:tree_palm",
	"trees:tree_mangrove",
	"trees:tree_conifer",
	"trees:wood_conifer",
	"trees:wood_palm",
	"trees:wood_mangrove",
    -- Remove memorandum stuff
    "memorandum:letter_written",
    "memorandum:letter_empty",
    "memorandum:message"
}
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

local old_entities = {
	"homedecor:mesh_desk_fan"
}
for _,entity_name in ipairs(old_entities) do
    minetest.register_entity(":"..entity_name, {
        on_activate = function(self, staticdata)
            self.object:remove()
        end,
    })
end

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
