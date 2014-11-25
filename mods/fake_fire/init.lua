--[[

The 'Fake-Fire' mod was originally created by Semmett9.

URL to the 'Fake-Fire' thread on Minetest.net:
http://forum.minetest.net/viewtopic.php?id=6145

I've customized it a bit. Please see the changelog.txt file for more details.

~ LazyJ, 2014_03_15

The lines below, at the end, are from the original author, Semmett9.

Thanks for a nice mod, Semmett9. ;)

~ LazyJ, 2014_03_14

-- Thanks-

-- Many thanks for addi for his help in coding. --

-- Many thanks for the players on the King Arthur's land server for giving --
-- me support, ideas and allowing me to add the mod to the server itself. --

]]--

local cp = nil

minetest.register_node("fake_fire:fake_fire", {
    description = "Smokey, Fake Fire",
	tiles = {
		{name="fake_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
		},
	is_ground_content = true,
   	inventory_image = 'fake_fire.png',
	wield_image = {
		{name="fake_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
		},
	drawtype = "plantlike",
	 -- Waving wasn't an option when this mod was written. ~ LazyJ, 2014_03_13
	waving = 1,
	light_source = 14,
	-- Adding sunlight_propagtes and leaving comments as a future reference.
	-- If true, sunlight will go infinitely through this (no shadow is cast).
	-- Because fire produces light it should be "true" so fire *doesn't* have
	-- a shadow. 
	sunlight_propagates = true,
	-- damage_per_second = 2*0.5, -- It's *fake* fire. PvP on our server has
	-- been disabled for a reason. I don't want griefers lighting players on
	-- fire or trapping them in blazes. ~ LazyJ, 2014_0_13
	--groups = {dig_immediate=3,attached_node=1},
	groups = {
				oddly_breakable_by_hand=3, dig_immediate=2, attached_node=1,
				not_in_creative_inventory=1
			},
	paramtype = "light",
	walkable = false,
	drop = "",  -- So fire won't return to the inventory. ~ LazyJ
	sounds = minetest.sound_play("fire_small", {pos=cp, loop=true}),
	on_punch = function (pos,node,puncher)
		-- A max_hear_distance of 20 may freak some players out by the "hiss"
		-- so I reduced it to 5.
		minetest.sound_play("fire_extinguish", {pos = pos, gain = 1.0,
		max_hear_distance = 5,})
		-- This swaps the smoky version with the smokeless version. ~ LazyJ
		minetest.set_node(pos, {name = "fake_fire:smokeless_fire"})
	end
})

minetest.register_node("fake_fire:smokeless_fire", {
    description = "Smokeless, Fake Fire",
	tiles = {
		{name="fake_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
		},
	is_ground_content = true,
   	inventory_image = 'fake_fire.png',
	wield_image = {
		{name="fake_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
		},
	drawtype = "plantlike",
	 -- Waving wasn't an option when this mod was written. ~ LazyJ, 2014_03_13
	waving = 1,
	light_source = 14,
		-- Adding sunlight_propagtes and leaving comments as a future reference.
	-- If true, sunlight will go infinitely through this (no shadow is cast).
	-- Because fire produces light it should be "true" so fire *doesn't* have
	-- a shadow. 
	sunlight_propagates = true,
	-- damage_per_second = 2*0.5, -- It's *fake* fire. PvP on our server has
	-- been disabled for a reason. I don't want griefers lighting players on
	-- fire or trapping them in blazes. ~ LazyJ, 2014_0_13
	--groups = {dig_immediate=3,attached_node=1},
	groups = {
				oddly_breakable_by_hand=3, dig_immediate=2, attached_node=1,
				not_in_creative_inventory=1
			},
	paramtype = "light",
	walkable = false,
	drop = "",  -- So fire won't return to the inventory. ~ LazyJ
	sounds = minetest.sound_play("fire_small", {pos=cp, loop=true}),
	on_punch = function (pos,node,puncher)
		-- A max_hear_distance of 20 may freak some players out by the "hiss"
		-- so I reduced it to 5.
		minetest.sound_play("fire_extinguish", {pos = pos, gain = 1.0,
		max_hear_distance = 5,})
		-- This swaps the smokeless version with the smoky version. ~ LazyJ
		minetest.set_node(pos, {name = "fake_fire:fake_fire"})
	end
})

minetest.register_node("fake_fire:ice_fire", {
    description = "Smoky, Fake, Ice Fire",
	tiles = {
		{name="ice_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
		},
	is_ground_content = true,
   	inventory_image = 'ice_fire.png',
	wield_image = {
		{name="ice_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
		},
	drawtype = "plantlike",
	 -- Waving wasn't an option when this mod was written. ~ LazyJ, 2014_03_13
	waving = 1,
	light_source = 14,
		-- Adding sunlight_propagtes and leaving comments as a future reference.
	-- If true, sunlight will go infinitely through this (no shadow is cast).
	-- Because fire produces light it should be "true" so fire *doesn't* have
	-- a shadow. 
	sunlight_propagates = true,
	-- damage_per_second = 2*0.5, -- It's *fake* fire. PvP on our server has
	-- been disabled for a reason. I don't want griefers lighting players on
	-- fire or trapping them in blazes. ~ LazyJ, 2014_0_13
	--groups = {dig_immediate=3,attached_node=1},
	groups = {
				oddly_breakable_by_hand=3, dig_immediate=2, attached_node=1,
				not_in_creative_inventory=1
			},
	paramtype = "light",
	walkable = false,
	drop = "",  -- So fire won't return to the inventory. ~ LazyJ
	sounds = minetest.sound_play("fire_small", {pos=cp, loop=true}),
	on_punch = function (pos,node,puncher)
		-- A max_hear_distance of 20 may freak some players out by the "hiss"
		-- so I reduced it to 5.
		minetest.sound_play("fire_extinguish", {pos = pos, gain = 1.0,
		max_hear_distance = 5,})
		-- This swaps the smoky version with the smokeless version. ~ LazyJ
		minetest.set_node(pos, {name = "fake_fire:smokeless_ice_fire"})
	end
})

minetest.register_node("fake_fire:smokeless_ice_fire", {
    description = "Smokeless, Fake, Ice Fire",
	tiles = {
		{name="ice_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
		},
	is_ground_content = true,
   	inventory_image = 'ice_fire.png',
	wield_image = {
		{name="ice_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
		},
	drawtype = "plantlike",
	 -- Waving wasn't an option when this mod was written. ~ LazyJ, 2014_03_13
	waving = 1,
	light_source = 14,
		-- Adding sunlight_propagtes and leaving comments as a future reference.
	-- If true, sunlight will go infinitely through this (no shadow is cast).
	-- Because fire produces light it should be "true" so fire *doesn't* have
	-- a shadow. 
	sunlight_propagates = true,
	-- damage_per_second = 2*0.5, -- It's *fake* fire. PvP on our server has
	-- been disabled for a reason. I don't want griefers lighting players on
	-- fire or trapping them in blazes. ~ LazyJ, 2014_0_13
	--groups = {dig_immediate=3,attached_node=1},
	groups = {
				oddly_breakable_by_hand=3, dig_immediate=2, attached_node=1,
				not_in_creative_inventory=1
			},
	paramtype = "light",
	walkable = false,
	drop = "",  -- So fire won't return to the inventory. ~ LazyJ
	sounds = minetest.sound_play("fire_small", {pos=cp, loop=true}),
	on_punch = function (pos,node,puncher)
		-- A max_hear_distance of 20 may freak some players out by the "hiss"
		-- so I reduced it to 5.
		minetest.sound_play("fire_extinguish", {pos = pos, gain = 1.0,
		max_hear_distance = 5,})
		-- This swaps the smokeless version with the smoky version. ~ LazyJ
		minetest.set_node(pos, {name = "fake_fire:ice_fire"})
	end
})

minetest.register_tool("fake_fire:flint_and_steel", {
	description = "Flint and steel",
	inventory_image = "flint_and_steel.png",
	liquids_pointable = false,
	stack_max = 1,
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={flamable = {uses=65, maxlevel=1},
		}
	},
	on_use = function(itemstack, user, pointed_thing)
	-- This next section took me a lot of keyboard bashing to figure out.
	-- The lua documentation and examples for Minetest are terrible.
	-- ~ LazyJ, 2014_06_23
	
		local snow_ice_list = {"snow", "ice",}
	
			for _, which_one_is_it in pairs(snow_ice_list) do
				local snow_ice = which_one_is_it
	
				if
					-- A *node*, not a player or sprite. ~ LazyJ
					pointed_thing.type == "node"
					
					--[[
						These next two "and nots" tell Minetest not to put the
						red	flame on snow and ice stuff. This "string" bit was
						the workable solution that took many hours, over
						several days, to finally come around to. It's a search
						for any node name that contains	whatever is between the
						double-quotes, ie. "snow" or "ice". I had been trying
						to identify the nodes by their group properties	and I
						couldn't figure out how to do it. The clue for the
						"string"came from Blockmen's "Landscape" mod.
				
						Another quirk is that the "string" doesn't work well
						with variable lists (see "snow_ice_list") when using
						"and not". Ice-fire would light on snow but when I
						clicked on ice, the regular	flame appeared. I couldn't
						understand what was happening until	I mentally changed
						the wording "and not" to "is not" and spoke	out-loud
						each thing that line of code was to accomplish:
				
						"Is not snow, then make fake-fire."
						"Is not ice, then make fake-fire."
				
						That's when I caught the problem.
				
						Ice *is not* snow, so Minetest was correctly following
						the	instruction, "Is not snow, then make fake-fire."
						and that is	why	fake-fire appeared instead of ice-fire
						when I clicked on ice.   
			 
						~ LazyJ
					--]]
									
				and not
				string.find(minetest.get_node(pointed_thing.under).name, "snow")
				and not
				string.find(minetest.get_node(pointed_thing.under).name, "ice")
				and
				minetest.get_node(pointed_thing.above).name == "air"
				then
					if not minetest.is_protected(pointed_thing.above, user:get_player_name()) then
						minetest.set_node(pointed_thing.above, {name="fake_fire:smokeless_fire"})						
					else
						minetest.chat_send_player(user:get_player_name(), "You can't set a fire in someone else's area!")
					end
			elseif

				pointed_thing.type == "node"
				and
				-- Split this "string" across several lines because I ran out
				-- of room while trying to adhere to the 80-column wide rule
				-- of coding style.
				string.find(
						minetest.get_node(pointed_thing.under).name,
						snow_ice
						)
				and 
				minetest.get_node(pointed_thing.above).name == "air"
				then
					if not minetest.is_protected(pointed_thing.above, user:get_player_name()) then
						minetest.set_node(pointed_thing.above, {name="fake_fire:smokeless_ice_fire"})						
					else
						minetest.chat_send_player(user:get_player_name(), "You can't set a fire in someone else's area!")
					end
			end -- Line 210, if
		end -- Line 207, for/do	
		
			minetest.sound_play("",
			{gain = 1.0, max_hear_distance = 2,})
			itemstack:add_wear(65535/65)
			return itemstack
	end
}) -- Closes the flint and steel tool registration

minetest.register_node("fake_fire:embers", {
    description = "Glowing Embers",
	tiles = {
		{name="embers_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
		},
	inventory_image = minetest.inventorycube('fake_fire_embers.png'),
	is_ground_content = true,
	light_source = 9,
	-- Adding sunlight_propagtes and leaving comments as a future reference.
	-- If true, sunlight will go infinitely through this (no shadow is cast).
	-- Because embers produce some light it should be somewhat "true" but this
	-- is an area where Minetest lacks in subtlety so I'm opting for 100% that
	-- embers *don't* have a shadow. 
	sunlight_propagates = true,
	 -- It's almost soft, brittle charcoal. ~ LazyJ
	groups = {choppy=3, crumbly=3, oddly_breakable_by_hand=3},
	paramtype = "light",
	 -- You never know when a creative builder may use the screwdriver or
	 -- position to create a subtle effect that makes their creation just
	 -- that little bit nicer looking. ~ Lazyj
	paramtype2 = "facedir",
	walkable = true,
	sounds = minetest.sound_play("fire_small", {pos=cp, loop=true}),
})

minetest.register_node("fake_fire:chimney_top_stone", {
	description = "Chimney Top - Stone",
	tiles = {"chimney_top_stone.png", "default_stone.png"},
	is_ground_content = true,
	groups = {cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	paramtype = "light",
	sounds = default.node_sound_stone_defaults(),
	drop = "fake_fire:smokeless_chimney_top_stone",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_punch = function (pos,node,puncher)
		-- This swaps the smokeless version with the smoky version when punched.
		-- ~ LazyJ
		minetest.set_node(pos, {name = "fake_fire:smokeless_chimney_top_stone"})
	end
})

minetest.register_node("fake_fire:chimney_top_sandstone", {
	description = "Chimney Top - Sandstone",
	tiles = {"chimney_top_sandstone.png", "default_sandstone.png"},
	is_ground_content = true,
	groups = {cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	paramtype = "light",
	sounds = default.node_sound_stone_defaults(),
	drop = "fake_fire:smokeless_chimney_top_sandstone",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_punch = function (pos,node,puncher)
		-- This swaps the smokeless version with the smoky version when punched.
		-- ~ LazyJ
		minetest.set_node(pos,
		{name = "fake_fire:smokeless_chimney_top_sandstone"})
	end
})

minetest.register_node("fake_fire:smokeless_chimney_top_stone", {
	description = "Chimney Top - Stone",
	tiles = {"chimney_top_stone.png", "default_stone.png"},
	is_ground_content = true,
	groups = {cracky=3, oddly_breakable_by_hand=1},
	paramtype = "light",
	sounds = default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_punch = function (pos,node,puncher)
		-- This swaps the smokeless version with the smoky version when punched.
		-- ~ LazyJ
		minetest.set_node(pos, {name = "fake_fire:chimney_top_stone"})
	end
})

minetest.register_node("fake_fire:smokeless_chimney_top_sandstone", {
	description = "Chimney Top - Sandstone",
	tiles = {"chimney_top_sandstone.png", "default_sandstone.png"},
	is_ground_content = true,
	groups = {cracky=3, oddly_breakable_by_hand=1},
	paramtype = "light",
	sounds = default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_punch = function (pos,node,puncher)
		-- This swaps the smokeless version with the smoky version when punched.
		-- ~ LazyJ
		minetest.set_node(pos, {name = "fake_fire:chimney_top_sandstone"})
	end
})

minetest.register_craftitem("fake_fire:flint", {
	description = "flint",
	inventory_image = "flint.png",
	stack_max = 99,
	liquids_pointable = false,
})

minetest.register_craft({
	type = "shapeless",
	output = 'fake_fire:flint',
	recipe = {
			"default:gravel",
			"default:gravel",
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'fake_fire:flint_and_steel',
	recipe = {
		"fake_fire:flint",
		"default:steel_ingot",
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'fake_fire:embers',
	recipe = {
			"default:torch",
			"group:wood",
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'fake_fire:smokeless_chimney_top_stone',
	recipe = {
			"default:torch",
			"stairs:slab_stone",
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'fake_fire:smokeless_chimney_top_sandstone',
	recipe = {
			"default:torch",
			"stairs:slab_sandstone",
	}
})

minetest.register_abm({
	nodenames = {
				"fake_fire:fake_fire",
				"fake_fire:ice_fire",
				"fake_fire:chimney_top_stone",
				"fake_fire:chimney_top_sandstone"
				},
	interval = 1,
	chance = 2,
	action = function(pos, node)
	     if
                minetest.get_node({x=pos.x, y=pos.y+1.0, z=pos.z}).name == "air" and
                minetest.get_node({x=pos.x, y=pos.y+2.0, z=pos.z}).name == "air"
             then
		local image_number = math.random(4)
		minetest.add_particlespawner(
			8, --particles amount
			1, --time
			{x=pos.x-0.25, y=pos.y+0.4, z=pos.z-0.25}, --min. smoke position
			{x=pos.x+0.25, y=pos.y+8, z=pos.z+0.25}, --max. smoke position
			{x=-0.2, y=0.3, z=-0.2}, --min. particle velocity
			{x=0.2, y=1, z=0.2}, --max. particle velocity
			{x=0,y=0,z=0}, --min. particle acceleration
			{x=0,y=0,z=0}, --max. particle acceleration
			0.5, --min. time particle expiration
			3, --max. time particle expiration
			2, --min. particle size
			10, --max. particle size
			false, --collision detection
			"smoke_particle_"..image_number..".png" --textures
		)
	     end
	end
})