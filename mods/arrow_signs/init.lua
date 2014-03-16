--more_signs by addi
--Code and Textures are under the CC by-sa 3.0 licence 	
--see: http://creativecommons.org/licenses/by-sa/3.0/	
	
	
	
arrow_signs={}

 function arrow_signs:savetext(pos, formname, fields, sender)
		
		if not minetest.get_player_privs(sender:get_player_name())["interact"] then
			minetest.chat_send_player(sender:get_player_name(), "error: you don't have permission to edit the sign. you need the interact priv")
		return
		end
		local meta = minetest.env:get_meta(pos)
		fields.text = fields.text or ""
		print((sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		text = arrow_signs:create_lines(fields.text)
		meta:set_string("infotext", '"'..text..'"')
		i=0
		for wort in text:gfind("\n") do
		i=i+1
        end
		if i > 4 then
		minetest.chat_send_player(sender:get_player_name(),"\tInformation: \nYou've written more than 5 lines. \n it may be that not all lines are displayed. \n Please remove the last entry")
		end
	return true
	end

function arrow_signs:create_lines(text)
	text = text:gsub("/", "\"\n\"")
	text = text:gsub("|", "\"\n\"")
	return text
end


local clone_registered = function(case,name)
    local params = {}
    local list
    if case == "item" then list = minetest.registered_items end
    if case == "node" then list = minetest.registered_nodes end
    if case == "craftitem" then list = minetest.registered_craftitems end
    if case == "tool" then list = minetest.registered_tools end
    if case == "entity" then list = minetest.registered_entities end
    if list then
        for k,v in pairs(list[name]) do
            params[k] = v
        end
    end
    return params
end

-- usage
local node = clone_registered("node","default:sign_wall")
node.groups = {choppy=2,dig_immediate=2,attached_node=1,sign=1}
minetest.register_node(":default:sign_wall",  node)









--Sign right
minetest.register_node("arrow_signs:wall_right", {
	description = "Sign right",
	drawtype = "signlike",
	tiles = {"arrow_sign_right.png"},
	inventory_image = "arrow_sign_right.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1,sign=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "hack:sign_text_input")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		arrow_signs:savetext(pos, formname, fields, sender)
	end,
		
})


-- sign left
minetest.register_node("arrow_signs:wall_left", {
	description = "Sign left",
	drawtype = "signlike",
	tiles = {"arrow_sign_left.png"},
	inventory_image = "arrow_sign_left.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1,sign=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "hack:sign_text_input")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		arrow_signs:savetext(pos, formname, fields, sender)
	end,
})


--Sign up
minetest.register_node("arrow_signs:wall_up", {
	description = "Sign up",
	drawtype = "signlike",
	tiles = {"arrow_sign_up.png"},
	inventory_image = "arrow_sign_up.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1,sign=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "hack:sign_text_input")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		arrow_signs:savetext(pos, formname, fields, sender)
	end,
})


--Sign down
minetest.register_node("arrow_signs:wall_down", {
	description = "Sign down",
	drawtype = "signlike",
	tiles = {"arrow_sign_down.png"},
	inventory_image = "arrow_sign_down.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1,sign=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "hack:sign_text_input")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		arrow_signs:savetext(pos, formname, fields, sender)
	end,
})






--recipes
minetest.register_craft({
	output = 'arrow_signs:wall_right 1',
	recipe = {
		{'', '', ''},
		{'', 'group:sign', 'default:stick'},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'arrow_signs:wall_left 1',
	recipe = {
		{'', '', ''},
		{'default:stick', 'group:sign', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'arrow_signs:wall_up 1',
	recipe = {
		{'', 'default:stick', ''},
		{'', 'group:sign', ''},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = 'arrow_signs:wall_down 1',
	recipe = {
		{'', '', ''},
		{'', 'group:sign', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = 'default:sign_wall',
	recipe = {

		{'group:sign'},

	}
})

minetest.register_alias("more_signs:wall_right", "arrow_signs:wall_right")
minetest.register_alias("sign_right", "arrow_signs:wall_right")

minetest.register_alias("more_signs:wall_left", "arrow_signs:wall_left")
minetest.register_alias("sign_left", "arrow_signs:wall_left")

minetest.register_alias("more_signs:wall_up", "arrow_signs:wall_up")
minetest.register_alias("sign_up", "arrow_signs:wall_up")

minetest.register_alias("more_signs:wall_down", "arrow_signs:wall_dowm")
minetest.register_alias("sign_down", "arrow_signs:wall_down")


if locks then
local MODPATH = minetest.get_modpath("arrow_signs");
dofile(MODPATH.."/shared_locked.lua")
end