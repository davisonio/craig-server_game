dofile(minetest.get_modpath("interact") .. "/config.lua")

local function make_formspec2(player)
	local name = player:get_player_name()
	local size = { "size[10,4]" }
	table.insert(size, "label[0.5,0.5;" ..interact.s2_l1.. "]")
	table.insert(size, "label[0.5,1;" ..interact.s2_l2.. "]")
	table.insert(size, "button_exit[2.5,3.4;3.5,0.5;interact;" ..interact.s2_b1.. "]")
	table.insert(size, "button_exit[6.4,3.4;3.6,0.5;visit;" ..interact.s2_b2.. "]")
	return table.concat(size)
end

local function make_formspec3(player)
	local size = { "size[10,8]" }
	table.insert(size, "textarea[0.5,0.5;9.5,7.5;TOS;" ..interact.s3_header.. ";" ..interact.s3_rules.. "]")
	table.insert(size, "button_exit[5.5,7.4;2,0.5;decline;" ..interact.s3_b2.. "]")
	table.insert(size, "button_exit[7.5,7.4;2,0.5;accept;" ..interact.s3_b1.. "]")
	return table.concat(size)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "visit" then return end
	local name = player:get_player_name()
	if fields.interact then
		minetest.after(1, function()
			minetest.show_formspec(name, "rules", make_formspec3(player))
		end)
	elseif fields.visit then
		minetest.chat_send_player(name, interact.s2_visit_msg)
		minetest.log("action", name.. " is just visiting.")
	end
end)


minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "rules" then return end
	local name = player:get_player_name()
	if fields.accept then
		minetest.chat_send_player(name, interact.s3_interact_msg1)
		minetest.chat_send_player(name, interact.s3_interact_msg2)
		local privs = minetest.get_player_privs(name)
		privs.interact = true
		minetest.set_player_privs(name, privs)
		minetest.log("action", "Granted " ..name.. " interact.")
	elseif fields.decline then
		minetest.chat_send_player(name, interact.s3_disagree_msg)
	end
end)

minetest.register_chatcommand("rules",{
	params = "",
	description = "Shows the server rules",
	privs = {shout = true},
	func = function (name,params)
	local player = minetest.get_player_by_name(name)
		minetest.after(1, function()
			minetest.show_formspec(name, "rules", make_formspec3(player))
		end)
	end
})

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	if not minetest.get_player_privs(name).interact then
		minetest.show_formspec(name, "visit", make_formspec2(player))
	end
end)
