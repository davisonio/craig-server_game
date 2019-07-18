minetest.register_chatcommand("spawn", {
    params = "",
    description = "Teleport to the spawn location.",
    privs = {shout=true},
    func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if param == "" or param == nil then
			-- Teleport to spawn
			minetest.chat_send_player(name, "Teleported to spawn!")
			player:setpos(minetest.string_to_pos(minetest.setting_get("static_spawnpoint")))
		else
			if mod_storage:get_string("spawn_"..param) == nil or mod_storage:get_string("spawn_"..param) == "" then
					minetest.chat_send_player(name, param.. " is not a valid location!")
				return
			else
				minetest.chat_send_player(name, "Teleported to "..param.."!")
				player:setpos(minetest.string_to_pos(mod_storage:get_string("spawn_"..param)))
			end
		end
    end,
})

minetest.register_chatcommand("spawnmod", {
	description = "Modify spawn locations.",
	privs = {ban=true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if param == "" or param == nil then
			return
		end
		
		local cmd, arg = string.match(param, '(%S+) (.*)')
		if arg == "" or arg == nil then return end
		if cmd == "add" then
			if mod_storage:get_string("spawn_"..arg) == nil or mod_storage:get_string("spawn_"..arg) == "" then
				mod_storage:set_string("spawn_"..arg, minetest.pos_to_string(player:get_pos()))
				minetest.chat_send_player(name, "Added "..arg.." to list of spawns!")
			else
				minetest.chat_send_player(name, arg.. " is already a defined location! Use '/spawnmod change' instead")
			end
		elseif cmd == "change" then
			if mod_storage:get_string("spawn_"..arg) == nil or mod_storage:get_string("spawn_"..arg) == "" then
				minetest.chat_send_player(name, arg.. " is not defined yet! Use '/spawnmod add' instead")
			else
				mod_storage:set_string("spawn_"..arg, minetest.pos_to_string(player:get_pos()))
				minetest.chat_send_player(name, "Changed "..arg.." location!")
			end
		elseif cmd == "del" and arg ~= nil or arg ~= "" then
			if mod_storage:get_string("spawn_"..arg) == nil or mod_storage:get_string("spawn_"..arg) == "" then
				minetest.chat_send_player(name, arg.. " is an invalid location to remove!")
			else
				mod_storage:set_string("spawn_"..arg, nil)
				minetest.chat_send_player(name, "Removed "..arg.." from list of spawns!")
			end
		end
    end,
})