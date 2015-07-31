minetest.register_node("factory:belt", {
	description = "Conveyor Belt",
	tiles = {{name="factory_belt_top_animation.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.4}}, "factory_belt_bottom.png", "factory_belt_side.png",
		"factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
	groups = {cracky=1},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	legacy_facedir_simple = true,
	node_box = {
			type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.0625,0.5},}
		},
})

minetest.register_abm({
	nodenames = {"factory:belt"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local all_objects = minetest.get_objects_inside_radius(pos, 0.75)
		local _,obj
		for _,obj in ipairs(all_objects) do
			if not obj:is_player() and obj:get_luaentity() and obj:get_luaentity().name == "__builtin:item" then
				factory.do_moving_item({x = pos.x, y = pos.y + 0.15, z = pos.z}, obj:get_luaentity().itemstring)
				obj:get_luaentity().itemstring = ""
				obj:remove()
			end
		end
	end,
})

-- Based off of the pipeworks item code

function factory.do_moving_item(pos, item)
	local stack = ItemStack(item)
	local obj = minetest.add_entity(pos, "factory:moving_item")
	obj:get_luaentity():set_item(stack:to_string())
	return obj
end

minetest.register_entity("factory:moving_item", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {0.125, 0.125, 0.125, 0.125, 0.125, 0.125},
		visual = "wielditem",
		visual_size = {x = 0.2, y = 0.2},
		textures = {""},
		spritediv = {x = 1, y = 1},
		initial_sprite_basepos = {x = 0, y = 0},
		is_visible = false,
	},

	physical_state = true,
	itemstring = '',

	set_item = function(self, itemstring)
		self.itemstring = itemstring
		local stack = ItemStack(itemstring)
		local count = stack:get_count()
		local max_count = stack:get_stack_max()
		if count > max_count then
			count = max_count
			self.itemstring = stack:get_name().." "..max_count
		end
		local s = 0.15 + 0.15 * (count / max_count)
		local c = 0.8 * s
		local itemtable = stack:to_table()
		local itemname = nil
		if itemtable then
			itemname = stack:to_table().name
		end
		local item_texture = nil
		local item_type = ""
		if core.registered_items[itemname] then
			item_texture = core.registered_items[itemname].inventory_image
			item_type = core.registered_items[itemname].type
		end
		prop = {
			is_visible = true,
			visual = "wielditem",
			textures = {itemname},
			visual_size = {x = s, y = s},
			collisionbox = {-c, -c, -c, c, c, c},
			automatic_rotate = math.pi * 0.2,
		}
		self.object:set_properties(prop)
	end,

	get_staticdata = function(self)
		return core.serialize({
			itemstring = self.itemstring
		})
	end,

	on_activate = function(self, staticdata, dtime_s)
		if string.sub(staticdata, 1, string.len("return")) == "return" then
			local data = core.deserialize(staticdata)
			if data and type(data) == "table" then
				self.itemstring = data.itemstring
			end
		else
			self.itemstring = staticdata
		end
		self.object:set_armor_groups({immortal = 1})
		self:set_item(self.itemstring)
	end,

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local stack = ItemStack(self.itemstring)
		local napos = minetest.get_node(pos) 

		local veldir = self.object:getvelocity();

		if napos.name == "factory:belt" then
			local speed = 0.8
			local dir = minetest.facedir_to_dir(napos.param2)
			self.object:setvelocity({x = dir.x / speed, y = 0, z = dir.z / speed})
		else
			minetest.item_drop(stack, "", {x = pos.x + veldir.x / 3, y = pos.y, z = pos.z + veldir.z / 3})
			self.object:remove()
		end
	end
})
