-- Convert money from the old mod to money from the new mod.

local function get_converter_formspec(number, pos)
	local formspec = ""
	local name = "nodemeta:"..pos.x..","..pos.y..","..pos.z
	formspec = ("size[8,8]"..
			"label[0,0;Money from old mod to new mod.]"..
			"label[1,1;You will get 1 bitcoin per 50 money.]"..
			"button[2,3;3,1;get;Convert!]"..
			"list[current_player;main;0,4;8,4;]")
	return formspec
end

minetest.register_on_player_receive_fields(function(sender, formname, fields)
	if(formname == "bitchange:converter_formspec") then
		local player_name = sender:get_player_name()
		local player_inv = sender:get_inventory()
		if(fields.get) then
			if money.get_money(player_name) >= 0 then
				local curent_money = money.get_money(player_name)
				money.set_money(player_name, curent_money - 50)
				player_inv:add_item("main", "bitchange:bitcoin 1")
				minetest.chat_send_player(player_name, "Done.")
			else
				minetest.chat_send_player(player_name, "You don't have enough money.")
			end
		end
	end
end)

minetest.register_node("bitchange:converter", {
	description = "Money Converter",
	tiles = {"bitchange_converter_side.png", "bitchange_converter_side.png",
			 "bitchange_converter_side.png", "bitchange_converter_side.png",
			 "bitchange_converter_side.png", "bitchange_converter_front.png"},
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand=2},
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Money Converter")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Money Converter (constructing)")
		meta:set_string("formspec", "")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*3)
	end,
	can_dig = function(pos,player)
		return true
	end,
	on_rightclick = function(pos, node, clicker, itemstack)
		local player_name = clicker:get_player_name()
		minetest.show_formspec(player_name,"bitchange:converter_formspec",get_converter_formspec(view, pos))
	end,
})