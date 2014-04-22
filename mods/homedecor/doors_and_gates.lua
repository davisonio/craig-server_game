-- Node definitions for Homedecor doors

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

-- doors

local sides = {"left", "right"}
local rsides = {"right", "left"}

for i in ipairs(sides) do
	local side = sides[i]
	local rside = rsides[i]

	for j in ipairs(homedecor_door_models) do
		local doorname =		homedecor_door_models[j][1]
		local doordesc =		homedecor_door_models[j][2]
		local nodeboxes_top = nil
		local nodeboxes_bottom = nil
		local texalpha = false
		if doorname == "exterior_fancy" then
			texalpha = true
		end

		if side == "left" then
			nodeboxes_top =	homedecor_door_models[j][3]
			nodeboxes_bottomtom =	homedecor_door_models[j][4]
		else
			nodeboxes_top =	homedecor_door_models[j][5]
			nodeboxes_bottomtom =	homedecor_door_models[j][6]
		end

		local lower_top_side = "homedecor_door_"..doorname.."_tb.png"
		local upper_bottom_side = "homedecor_door_"..doorname.."_tb.png"

		if doorname == "glass" then
			lower_top_side = "homedecor_blanktile.png"
			upper_bottom_side = "homedecor_blanktile.png"
		end

		local tiles_upper = {
				"homedecor_door_"..doorname.."_tb.png",
				upper_bottom_side,
				"homedecor_door_"..doorname.."_lrt.png",
				"homedecor_door_"..doorname.."_lrt.png",
				"homedecor_door_"..doorname.."_"..rside.."_top.png",
				"homedecor_door_"..doorname.."_"..side.."_top.png",
				}

		local tiles_lower = {
				lower_top_side,
				"homedecor_door_"..doorname.."_tb.png",
				"homedecor_door_"..doorname.."_lrb.png",
				"homedecor_door_"..doorname.."_lrb.png",
				"homedecor_door_"..doorname.."_"..rside.."_bottom.png",
				"homedecor_door_"..doorname.."_"..side.."_bottom.png",
				}

		local selectboxes_top = {
				type = "fixed",
				fixed = { -0.5, -1.5, 6/16, 0.5, 0.5, 8/16}
			}

		local selectboxes_bottom = {
				type = "fixed",
				fixed = { -0.5, -0.5, 6/16, 0.5, 1.5, 8/16}
			}

		minetest.register_node("homedecor:door_"..doorname.."_top_"..side, {
			description = doordesc.." "..S("(Top Half, %s-opening)"):format(side),
			drawtype = "nodebox",
			tiles = tiles_upper,
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {snappy=3, not_in_creative_inventory=1},
			sounds = default.node_sound_wood_defaults(),
			walkable = true,
			use_texture_alpha = texalpha,
			selection_box = selectboxes_top,
			node_box = {
				type = "fixed",
				fixed = nodeboxes_top
			},
			drop = "homedecor:door_"..doorname.."_bottom_"..side,
			after_dig_node = function(pos, oldnode, oldmetadata, digger)
				if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "homedecor:door_"..doorname.."_bottom_"..side then
					minetest.remove_node({x=pos.x, y=pos.y-1, z=pos.z})
				end
			end,
			on_rightclick = function(pos, node, clicker)
				homedecor_flip_door({x=pos.x, y=pos.y-1, z=pos.z}, node, clicker, doorname, side)
			end
		})

		minetest.register_node("homedecor:door_"..doorname.."_bottom_"..side, {
			description = doordesc.." "..S("(%s-opening)"):format(side),
			drawtype = "nodebox",
			tiles = tiles_lower,
			inventory_image = "homedecor_door_"..doorname.."_"..side.."_inv.png",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {snappy=3},
			sounds = default.node_sound_wood_defaults(),
			walkable = true,
			use_texture_alpha = texalpha,
			selection_box = selectboxes_bottom,
			node_box = {
				type = "fixed",
				fixed = nodeboxes_bottomtom
			},
			after_dig_node = function(pos, oldnode, oldmetadata, digger)
				if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "homedecor:door_"..doorname.."_top_"..side then
					minetest.remove_node({x=pos.x, y=pos.y+1, z=pos.z})
				end
			end,
			on_place = function(itemstack, placer, pointed_thing)
				homedecor_place_door(itemstack, placer, pointed_thing, doorname, side)
				return itemstack
			end,
			on_rightclick = function(pos, node, clicker)
				homedecor_flip_door(pos, node, clicker, doorname, side)
			end
		})
	end
end

-- Gates

local gates_list = { "picket", "picket_white", "barbed_wire", "chainlink" }
local gate_names = { "Unpainted Picket", "White Picket", "Barbed Wire", "Chainlink" }

local gate_models_closed = {
	{{ -0.5, -0.5, 0.498, 0.5, 0.5, 0.498 }},

	{{ -0.5, -0.5, 0.498, 0.5, 0.5, 0.498 }},

	{{ -8/16, -8/16, 6/16, -6/16,  8/16,  8/16 },	-- left post
	 {  6/16, -8/16, 6/16,  8/16,  8/16,  8/16 }, 	-- right post
	 { -8/16,  7/16, 13/32, 8/16,  8/16, 15/32 },	-- top piece
	 { -8/16, -8/16, 13/32, 8/16, -7/16, 15/32 },	-- bottom piece
	 { -6/16, -8/16,  7/16, 6/16,  8/16,  7/16 }},	-- the wire

	{{ -8/16, -8/16,  6/16, -7/16,  8/16,  8/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
	 { -8/16,  7/16, 13/32,  8/16,  8/16, 15/32 },	-- top piece
	 { -8/16, -8/16, 13/32,  8/16, -7/16, 15/32 },	-- bottom piece
	 { -8/16, -8/16,  7/16,  8/16,  8/16,  7/16 },	-- the chainlink itself
	 { -8/16, -3/16,  6/16, -6/16,  3/16,  8/16 }}	-- the lump representing the lock
}

local gate_models_open = {
	{{ 0.498, -0.5, -0.5, 0.498, 0.5, 0.5 }},

	{{ 0.498, -0.5, -0.5, 0.498, 0.5, 0.5 }},
	
	{{  6/16, -8/16, -8/16,  8/16,  8/16, -6/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
	 { 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
	 { 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
	 {  7/16, -8/16, -6/16,  7/16,  8/16,  6/16 }},	-- the wire

	{{  6/16, -8/16, -8/16,  8/16,  8/16, -7/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
	 { 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
	 { 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
	 {  7/16, -8/16, -8/16,  7/16,  8/16,  8/16 },	-- the chainlink itself
	 {  6/16, -3/16, -8/16,  8/16,  3/16, -6/16 }}	-- the lump representing the lock
}

for i in ipairs(gates_list) do

	local gate=gates_list[i]

	minetest.register_node("homedecor:gate_"..gate.."_closed", {
		drawtype = "nodebox",
		description = S(gate_names[i].." Fence Gate"),
		tiles = {
			"homedecor_gate_"..gate.."_top.png",
			"homedecor_gate_"..gate.."_bottom.png",
			"homedecor_gate_"..gate.."_left.png",
			"homedecor_gate_"..gate.."_right.png",
			"homedecor_gate_"..gate.."_back.png",
			"homedecor_gate_"..gate.."_front.png"
		},
		paramtype = "light",
		is_ground_content = true,
		groups = {snappy=3},
		sounds = default.node_sound_wood_defaults(),
		walkable = true,
		paramtype2 = "facedir",
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
		},
		node_box = {
			type = "fixed",
			fixed = gate_models_closed[i]
		},
		on_rightclick = function(pos, node, clicker)
			homedecor_flip_gate(pos, node, clicker, gate, "closed")
		end
	})

	minetest.register_node("homedecor:gate_"..gate.."_open", {
		drawtype = "nodebox",
		description = S(gate_names[i].." Fence Gate"),
		tiles = {
			"homedecor_gate_"..gate.."_top.png",
			"homedecor_gate_"..gate.."_bottom.png",
			"homedecor_gate_"..gate.."_front.png",
			"homedecor_gate_"..gate.."_back.png",
			"homedecor_gate_"..gate.."_left.png",
			"homedecor_gate_"..gate.."_right.png"
		},
		paramtype = "light",
		is_ground_content = true,
		groups = {snappy=3, not_in_creative_inventory=1},
		sounds = default.node_sound_wood_defaults(),
		walkable = true,
		paramtype2 = "facedir",
		selection_box = {
			type = "fixed",
			fixed ={ 0.4, -0.5, -0.5, 0.5, 0.5, 0.5 }
		},
		node_box = {
			type = "fixed",
			fixed = gate_models_open[i]
		},
		drop = "homedecor:gate_"..gate.."_closed",
		on_rightclick = function(pos, node, clicker)
			homedecor_flip_gate(pos, node, clicker, gate, "open")
		end
	})

end

minetest.register_alias("homedecor:fence_barbed_wire_gate_open",    "homedecor:gate_barbed_wire_open")
minetest.register_alias("homedecor:fence_barbed_wire_gate_closed",  "homedecor:gate_barbed_wire_closed")
minetest.register_alias("homedecor:fence_chainlink_gate_open",      "homedecor:gate_chainlink_open")
minetest.register_alias("homedecor:fence_chainlink_gate_closed",    "homedecor:gate_chainlink_closed")
minetest.register_alias("homedecor:fence_picket_gate_open",         "homedecor:gate_picket_open")
minetest.register_alias("homedecor:fence_picket_gate_closed",       "homedecor:gate_picket_closed")
minetest.register_alias("homedecor:fence_picket_gate_white_open",   "homedecor:gate_picket_white_open")
minetest.register_alias("homedecor:fence_picket_gate_white_closed", "homedecor:gate_picket_white_closed")

----- helper functions

local function get_nodedef_field(nodename, fieldname)
	if not minetest.registered_nodes[nodename] then
		return nil
	end
	return minetest.registered_nodes[nodename][fieldname]
end

function homedecor_place_door(itemstack, placer, pointed_thing, name, side)

	local pointed = pointed_thing.under
	local pnode = minetest.get_node(pointed)
	local pname = pnode.name

	if not minetest.registered_nodes[pname]
	    or not minetest.registered_nodes[pname].on_rightclick then

		local pos1 = nil
		local pos2 = nil

		if minetest.registered_nodes[pname]["buildable_to"] then
			pos1 = pointed
			pos2 = {x=pointed.x, y=pointed.y+1, z=pointed.z}
		else
			pos1 = pointed_thing.above
			pos2 = {x=pointed_thing.above.x, y=pointed_thing.above.y+1, z=pointed_thing.above.z}
		end

		local node_bottom = minetest.get_node(pos1)
		local node_top = minetest.get_node(pos2)

		if not homedecor_node_is_owned(pos1, placer) 
		    and not homedecor_node_is_owned(pos2, placer) then

			if not get_nodedef_field(node_bottom.name, "buildable_to") 
			    or not get_nodedef_field(node_top.name, "buildable_to") then
				minetest.chat_send_player( placer:get_player_name(), S('Not enough space above that spot to place a door!') )
			else
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.add_node(pos1, { name = "homedecor:door_"..name.."_bottom_"..side, param2=fdir})
				minetest.add_node(pos2, { name = "homedecor:door_"..name.."_top_"..side, param2=fdir})
				if not homedecor_expect_infinite_stacks then
					itemstack:take_item()
					return itemstack
				end
			end
		end
	else 
		minetest.registered_nodes[pname].on_rightclick(pointed_thing.under, pnode, placer, itemstack)
	end
end

function homedecor_flip_door(pos, node, player, name, side)
	local rside = nil
	local nfdir = nil
	if side == "left" then
		rside = "right"
		nfdir=node.param2 - 1
		if nfdir < 0 then nfdir = 3 end
	        minetest.sound_play("homedecor_door_open", {
			pos=pos,
			max_hear_distance = 5,
			gain = 2,
		})
	else
		rside = "left"
		nfdir=node.param2 + 1
		if nfdir > 3 then nfdir = 0 end
	        minetest.sound_play("homedecor_door_close", {
			pos=pos,
			max_hear_distance = 5,
			gain = 2,
		})
	end
	minetest.add_node({x=pos.x, y=pos.y+1, z=pos.z}, { name =  "homedecor:door_"..name.."_top_"..rside, param2=nfdir})
	minetest.add_node(pos, { name = "homedecor:door_"..name.."_bottom_"..rside, param2=nfdir})
end

function homedecor_flip_gate(pos, node, player, gate, oc)
        minetest.sound_play("homedecor_gate_open_close", {
		pos=pos,
		max_hear_distance = 5,
		gain = 2,
	})

	local fdir = node.param2

	if oc == "closed" then
		gateresult = "homedecor:gate_"..gate.."_open"
	else
		gateresult = "homedecor:gate_"..gate.."_closed"
	end

	minetest.add_node(pos, { name = gateresult, param2=fdir})
	nodeabove = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
	nodebelow = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})

	if string.find(nodeabove.name, "homedecor:gate_"..gate) then
		minetest.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name=gateresult, param2=fdir} )
	end

	if string.find(nodebelow.name, "homedecor:gate_"..gate) then
		minetest.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name=gateresult, param2=fdir} )
	end
end

