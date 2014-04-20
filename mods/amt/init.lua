minetest.register_alias("adminpick", "amt:pick_admin")
minetest.register_alias("fuel", "amt:infinitefuel")
minetest.register_alias("rstick", "amt:remove_stick")
minetest.register_alias("sapple", "amt:sapple")
minetest.register_alias("sstick", "amt:spleef_stick")

-- THERE ARE NO CRAFTING RECIPES, USE /GIVE OR /GIVEME
-- COMMANDS TO SPAWN THE ITEMS INSTEAD.

-- Redefine cloud so that admin pickaxe can mine it

minetest.register_node(":default:cloud", {
	description = "Cloud",
	tiles = {"default_cloud.png"},
	is_ground_content = true,
	groups = {unbreakable=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("amt:sapple", {
	description = "Super Apple",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tile_images = {"amt_superapple.png"},
	inventory_image = "amt_superapple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3},
	on_use = minetest.item_eat(20),
	sounds = default.node_sound_defaults(),
})

-- Tools

minetest.register_tool("amt:pick_admin", {
	description = "Admin Pickaxe [Digs blocks instantly - returns in inv]",
	inventory_image = "amt_adminpick.png",
	tool_capabilities = {
		full_punch_interval = 0,
		max_drop_level=3,
		groupcaps={
			unbreakable={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			fleshy = {times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			choppy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			bendy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			cracky={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			crumbly={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			snappy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
		}
	},
})

minetest.register_craftitem("amt:remove_stick", {
	description = "Remove Stick [Removes items not removable normally - does not return in inv]",
	inventory_image = "amt_removestick.png",
	on_use = function(item, user, pointed_thing)
		if pointed_thing.type == "node" then
			minetest.env:remove_node(pointed_thing.under)
		elseif pointed_thing.type == "object" then
			obj = pointed_thing.ref
			if obj ~= nil then
				if obj:get_player_name() ~= nil then
					-- Player
					obj:set_hp(-1)
				else
					-- Mob or other entity
					obj:remove()
				end
			end
		end
	end,
	stack_max = 1,
	liquids_pointable = true,
})

minetest.register_node("amt:fake_fire", {
	description = "Fake Fire",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {{
		name="fire_basic_flame_animated.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1},
	}},
	inventory_image = "fire_basic_flame.png",
	light_source = 14,
	groups = {unbreakable=1, not_in_creative_inventory=1},
	drop = '',
	sunlight_propagates = true,
	walkable = false,
})

minetest.register_alias("maptools:fake_fire", "amt:fake_fire")