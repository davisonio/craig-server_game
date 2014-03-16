-- Various kinds of tables

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

materials = {
	{"glass","Glass"},
	{"wood","Wood"}
}

for i in ipairs(materials) do
	local m = materials[i][1]
	local d = materials[i][2]
	local s = nil

	if m == "glass" then
		s = default.node_sound_glass_defaults()
	else
		s = default.node_sound_wood_defaults()
	end

-- small square tables

	minetest.register_node("homedecor:"..m.."_table_small_square_b", {
		description = S(d.." Table (Small, Square)"),
		drawtype = 'nodebox',
		tiles = {
			'homedecor_'..m..'_table_small_square_tb.png',
			'homedecor_'..m..'_table_small_square_tb.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png'
		},
		wield_image = 'homedecor_'..m..'_table_small_square_tb.png',
		inventory_image = 'homedecor_'..m..'_table_small_square_tb.png',
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3 },
		sounds = s,
		paramtype2 = "facedir",

		node_box = {
			type = "fixed",
			fixed = {
				{ -0.4375, -0.5, -0.5,     0.4375, -0.4375, 0.5    },
				{ -0.5,    -0.5, -0.4375,  0.5,    -0.4375, 0.4375 }
			},
		},
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5,    -0.5,  0.5,    -0.4375, 0.5 },
		},

		on_place = function(itemstack, placer, pointed_thing)

			local node = minetest.get_node(pointed_thing.under)
			if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

				local above = pointed_thing.above
				local under = pointed_thing.under
				local pitch = placer:get_look_pitch()
				local node = minetest.get_node(above)

				if node.name ~= "air" then return end

				if above.x ~= under.x or above.z ~= under.z then 
					local fdir = minetest.dir_to_facedir(placer:get_look_dir())
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_small_square_s', param2 = fdir})
				elseif pitch > 0 then 
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_small_square_t'})
				else
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_small_square_b'})
				end
				if not homedecor_expect_infinite_stacks then
					itemstack:take_item()
					return itemstack
				end
			else
				minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
			end
		end
	})

	minetest.register_node('homedecor:'..m..'_table_small_square_t', {
		description = S(d.."Glass Table (Small, Square)"),
		drawtype = 'nodebox',
		tiles = {
			'homedecor_'..m..'_table_small_square_tb.png',
			'homedecor_'..m..'_table_small_square_tb.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png'
		},
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3, not_in_creative_inventory=1 },
		sounds = s,
		paramtype2 = "facedir",

		node_box = {
			type = "fixed",
			fixed = {
				{ -0.4375, 0.4375, -0.5,     0.4375, 0.5, 0.5    },
				{ -0.5,    0.4375, -0.4375,  0.5,    0.5, 0.4375 }
			},
		},
		selection_box = {
			type = "fixed",
			fixed = { -0.5,  0.4375, -0.5,  0.5, 0.5, 0.5 },
		},
		drop = 'homedecor:'..m..'_table_small_square_b'
	})

	minetest.register_node('homedecor:'..m..'_table_small_square_s', {
		description = S(d.." Table (Small, Square)"),
		drawtype = 'nodebox',
		tiles = {
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_edges.png',
			'homedecor_'..m..'_table_small_square_tb.png',
			'homedecor_'..m..'_table_small_square_tb.png',
		},
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3, not_in_creative_inventory=1 },
		sounds = s,
		paramtype2 = "facedir",

		node_box = {
			type = "fixed",
			fixed = {
				{ -0.4375, -0.5,    0.4375, 0.4375, 0.5,    0.5 },
				{ -0.5,    -0.4375, 0.4375, 0.5,    0.4375, 0.5 }
			}
		},
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, 0.4375, 0.5, 0.5, 0.5 },
		},
		drop = 'homedecor:'..m..'_table_small_square_b'
	})

-- small round tables

	minetest.register_node('homedecor:'..m..'_table_small_round_b', {
		description = S(d.." Table (Small, Round)"),
		drawtype = 'nodebox',
		tiles = {
			'homedecor_'..m..'_table_small_round_tb.png',
			'homedecor_'..m..'_table_small_round_tb.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png'
		},
		wield_image = 'homedecor_'..m..'_table_small_round_tb.png',
		inventory_image = 'homedecor_'..m..'_table_small_round_tb.png',
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3 },
		sounds = s,
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.25,   -0.5, -0.5,    0.25,   -0.4375, 0.5    },
				{ -0.375,  -0.5, -0.4375, 0.375,  -0.4375, 0.4375 },
				{ -0.5,    -0.5, -0.25,   0.5,    -0.4375, 0.25   },
				{ -0.4375, -0.5, -0.375,  0.4375, -0.4375, 0.375  },
				{ -0.25,   -0.5, -0.5,    0.25,   -0.4375, 0.5    },
			}
		},
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 },
		},
		on_place = function(itemstack, placer, pointed_thing)
			local node = minetest.get_node(pointed_thing.under)
			if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

				local above = pointed_thing.above
				local under = pointed_thing.under
				local pitch = placer:get_look_pitch()
				local node = minetest.get_node(above)

				if node.name ~= "air" then return end

				if above.x ~= under.x or above.z ~= under.z then 
					local fdir = minetest.dir_to_facedir(placer:get_look_dir())
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_small_round_s', param2 = fdir})
				elseif pitch > 0 then 
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_small_round_t'})
				else
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_small_round_b'})
				end
				if not homedecor_expect_infinite_stacks then
					itemstack:take_item()
					return itemstack
				end
			else
				minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
			end
		end
	})

	minetest.register_node('homedecor:'..m..'_table_small_round_t', {
		description = S(d.." Table (Small, Round)"),
		drawtype = 'nodebox',
		tiles = {
			'homedecor_'..m..'_table_small_round_tb.png',
			'homedecor_'..m..'_table_small_round_tb.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png'
		},
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3, not_in_creative_inventory=1 },
		sounds = s,
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.25,   0.4375, -0.5,    0.25,   0.5, 0.5    },
				{ -0.375,  0.4375, -0.4375, 0.375,  0.5, 0.4375 },
				{ -0.5,    0.4375, -0.25,   0.5,    0.5, 0.25   },
				{ -0.4375, 0.4375, -0.375,  0.4375, 0.5, 0.375  },
				{ -0.25,   0.4375, -0.5,    0.25,   0.5, 0.5    },
			}
		},
		selection_box = {
			type = "fixed",
			fixed =    { -0.5, 0.4375, -0.5, 0.5, 0.5, 0.5 },
		},
		drop = 'homedecor:'..m..'_table_small_round_b'
	})

	minetest.register_node('homedecor:'..m..'_table_small_round_s', {
		description = S(d.." Table (Small, Round)"),
		drawtype = 'nodebox',
		tiles = {
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_edges.png',
			'homedecor_'..m..'_table_small_round_tb.png',
			'homedecor_'..m..'_table_small_round_tb.png',
		},
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3, not_in_creative_inventory=1 },
		sounds = s,
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.25,   -0.5,    0.4375,  0.25,   0.5,    0.5 },
				{ -0.375,  -0.4375, 0.4375,  0.375,  0.4375, 0.5 },
				{ -0.5,    -0.25,   0.4375,  0.5,    0.25,   0.5 },
				{ -0.4375, -0.375,  0.4375,  0.4375, 0.375,  0.5 },
				{ -0.25,   -0.5,    0.4375,  0.25,   0.5,    0.5 },
			}
		},
		selection_box = {
			type = "fixed",
			fixed =   { -0.5, -0.5, 0.4375, 0.5, 0.5, 0.5 },
		},
		drop = 'homedecor:'..m..'_table_small_round_b'
	})

-- Large square table pieces

	minetest.register_node('homedecor:'..m..'_table_large_b', {
		description = S(d.."Table Piece (large)"),
		drawtype = 'nodebox',
		tiles = { 
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png'
		},
		wield_image = 'homedecor_'..m..'_table_large_tb.png',
		inventory_image = 'homedecor_'..m..'_table_large_tb.png',
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3 },
		sounds = s,
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 },
		},
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 },
		},
		on_place = function(itemstack, placer, pointed_thing)

			local node = minetest.get_node(pointed_thing.under)
			if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

				local above = pointed_thing.above
				local under = pointed_thing.under
				local pitch = placer:get_look_pitch()
				local node = minetest.get_node(above)

				if node.name ~= "air" then return end

				if above.x ~= under.x or above.z ~= under.z then 
					local fdir = minetest.dir_to_facedir(placer:get_look_dir())
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_large_s', param2 = fdir})
				elseif pitch > 0 then 
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_large_t'})
				else
					minetest.add_node(above, {name = 'homedecor:'..m..'_table_large_b'})
				end
				if not homedecor_expect_infinite_stacks then
					itemstack:take_item()
					return itemstack
				end
			else
				minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
			end
		end
	})

	minetest.register_node('homedecor:'..m..'_table_large_t', {
		description = S(d.."Table Piece (large)"),
		drawtype = 'nodebox',
		tiles = { 
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png'
		},
		wield_image = 'homedecor_'..m..'_table_large_tb.png',
		inventory_image = 'homedecor_'..m..'_table_large_tb.png',
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3, not_in_creative_inventory=1 },
		sounds = s,
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed =    { -0.5, 0.4375, -0.5, 0.5, 0.5, 0.5 },
		},
		selection_box = {
			type = "fixed",
			fixed =    { -0.5, 0.4375, -0.5, 0.5, 0.5, 0.5 },
		},
		drop = 'homedecor:'..m..'_table_large_b'
	})

	minetest.register_node('homedecor:'..m..'_table_large_s', {
		description = S(d.."Table Piece (large)"),
		drawtype = 'nodebox',
		tiles = { 
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_tb.png',
		},
		wield_image = 'homedecor_'..m..'_table_large_tb.png',
		inventory_image = 'homedecor_'..m..'_table_large_tb.png',
		sunlight_propagates = true,
		paramtype = 'light',
		walkable = true,
		groups = { snappy = 3, not_in_creative_inventory=1 },
		sounds = s,
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed =   { -0.5, -0.5, 0.4375, 0.5, 0.5, 0.5 },
		},
		selection_box = {
			type = "fixed",
			fixed =   { -0.5, -0.5, 0.4375, 0.5, 0.5, 0.5 },
		},
		drop = 'homedecor:'..m..'_table_large_b'
	})

	minetest.register_alias('homedecor:'..m..'_table_large', 'homedecor:'..m..'_table_large_b')
	minetest.register_alias('homedecor:'..m..'_table_small_square', 'homedecor:'..m..'_table_small_square_b')
	minetest.register_alias('homedecor:'..m..'_table_small_round', 'homedecor:'..m..'_table_small_round_b')

end

minetest.register_node('homedecor:utility_table_top', {
	description = S("Utility Table"),
	tiles = {
		'homedecor_utility_table_tb.png',
		'homedecor_utility_table_tb.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png'
	},
	wield_image = 'homedecor_utility_table_tb.png',
	inventory_image = 'homedecor_utility_table_tb.png',
	drawtype = "nodebox",
	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "wallmounted",
	node_box = {
		type = "wallmounted",
		wall_bottom = { -0.5, -0.5,    -0.5,  0.5,   -0.4375, 0.5 },
		wall_top =    { -0.5,  0.4375, -0.5,  0.5,    0.5,    0.5 },
		wall_side =   { -0.5, -0.5,    -0.5, -0.4375, 0.5,    0.5 },
	},
        selection_box = {
		type = "wallmounted",
		wall_bottom = { -0.5, -0.5,    -0.5,  0.5,   -0.4375, 0.5 },
		wall_top =    { -0.5,  0.4375, -0.5,  0.5,    0.5,    0.5 },
		wall_side =   { -0.5, -0.5,    -0.5, -0.4375, 0.5,    0.5 },
	},
})

-- Various kinds of table legs

minetest.register_node("homedecor:table_legs_brass", {
        description = S("Brass Table Legs"),
        drawtype = "plantlike",
        tiles = {"homedecor_table_legs_brass.png"},
        inventory_image = "homedecor_table_legs_brass.png",
        wield_image = "homedecor_table_legs_brass.png",
        paramtype = "light",
        walkable = false,
        groups = {snappy=3},
        sounds = default.node_sound_leaves_defaults(),
	walkable = true,
        selection_box = {
		type = "fixed",
		fixed = { -0.37, -0.5, -0.37, 0.37, 0.5, 0.37 }
	},
})

minetest.register_node("homedecor:table_legs_wrought_iron", {
        description = S("Brass Table Legs"),
        drawtype = "plantlike",
        tiles = {"homedecor_table_legs_wrought_iron.png"},
        inventory_image = "homedecor_table_legs_wrought_iron.png",
        wield_image = "homedecor_table_legs_wrought_iron.png",
        paramtype = "light",
        walkable = false,
        groups = {snappy=3},
        sounds = default.node_sound_leaves_defaults(),
	walkable = true,
        selection_box = {
		type = "fixed",
		fixed = { -0.37, -0.5, -0.37, 0.37, 0.5, 0.37 }
	},
})

minetest.register_node('homedecor:utility_table_legs', {
	description = S("Legs for Utility Table"),
	drawtype = "plantlike",
	tiles = { 'homedecor_utility_table_legs.png' },
	inventory_image = 'homedecor_utility_table_legs_inv.png',
	wield_image = 'homedecor_utility_table_legs.png',
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
        selection_box = {
		type = "fixed",
		fixed = { -0.37, -0.5, -0.37, 0.37, 0.5, 0.37 }
	},
})

