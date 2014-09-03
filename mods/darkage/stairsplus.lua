darkage = {};
function darkage.register_stairs(modname, subname, groups, images, desc)
	table.insert(circular_saw.known_stairs, modname..":"..subname);
	recipeitem = modname..":"..subname;
	desc_stair = desc.." stair";
	desc_slab = desc.." slab";
	desc_panel = desc.." panel";
	desc_micro = desc.." micro";
	drop = subname
	register_stair(modname, subname, recipeitem, groups, images, desc_stair, drop)
	register_slab(modname, subname, recipeitem, groups, images, desc_slab, drop)
	register_panel(modname, subname, recipeitem, groups, images, desc_panel, drop)
	register_micro(modname, subname, recipeitem, groups, images, desc_micro, drop)
end
darkage.register_stairs("darkage","basalt_cobble",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_basalt_cobble.png"},
	"Basalt Cobble"
)

darkage.register_stairs("darkage","slate_tile",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_slate_tile.png"},
	"Slate Tile"
)

darkage.register_stairs("darkage","straw",
	 {snappy=3, flammable=2, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_straw.png"},
	"Straw"
)

darkage.register_stairs("darkage","stone_brick",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_stone_brick.png"},
	"Stone Brick"
)

darkage.register_stairs("darkage","ors_cobble",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_ors_cobble.png"},
	"Old Red Sandstone"
)

darkage.register_stairs("darkage","slate_cobble",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_slate_cobble.png"},
	"Slate Cobble"
)

darkage.register_stairs("darkage","marble",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_marble.png"},
	"Marble"
)

darkage.register_stairs("darkage","marble_tile",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_marble_tile.png"},
	"Marble Tile"
)

darkage.register_stairs("darkage","gneiss_cobble",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_gneiss_cobble.png"},
	"Gneiss Cobble"
)

darkage.register_stairs("darkage","serpentine",
	{cracky=3, not_in_creative_inventory=1, not_in_craft_guide=1},
	{"darkage_serpentine.png"},
	"Serpentine"
)
