-- Remove trees from old mod.

local old_nodes = {"trees:leaves_yellow", "trees:leaves_red", "trees:leaves_green", "trees:leaves_palm", "trees:leaves_mangrove", "trees:leaves_conifer", "trees:tree_palm", "trees:tree_mangrove", "trees:tree_conifer", "trees:wood_conifer", "trees:wood_palm", "trees:wood_mangrove"}
local old_entities = {}

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
        minetest.env:remove_node(pos)
    end,
})

for _,entity_name in ipairs(old_entities) do
    minetest.register_entity(":"..entity_name, {
        on_activate = function(self, staticdata)
            self.object:remove()
        end,
    })
end

-- Cloud redefinition

minetest.register_node(":default:cloud", {
	description = "Cloud",
	tiles = {"default_cloud.png"},
	is_ground_content = true,
	groups = {unbreakable=1},
	sounds = default.node_sound_defaults(),
})

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

-- Other aliases

minetest.register_alias("maptools:fake_fire", "fake_fire:fake_fire")
minetest.register_alias("amt:fake_fire", "fake_fire:fake_fire")

minetest.register_alias("amt:remove_stick", "_misc:remove_stick")
minetest.register_alias("amt:pick_admin", "_misc:pick_admin")
minetest.register_alias("amt:sapple", "_misc:super_apple")