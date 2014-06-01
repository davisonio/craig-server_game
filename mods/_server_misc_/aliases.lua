

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
