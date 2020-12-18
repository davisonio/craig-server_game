-- Event poster
minetest.register_chatcommand("event", {
	description = "Show current event.",
	func = function(name, param)
		if param == "" then
			if mod_storage:get_string("event_desc") == nil or mod_storage:get_string("event_desc") == "" then
				minetest.chat_send_player(name, "There's no events going on!")
			else
				local formspec_conv_nl = string.gsub(mod_storage:get_string("event_desc"), "\\n", "\n")
				minetest.show_formspec(name, "events",
					"size[10,6]"..
					"image[0.1,0.1;12.2,4;"..mod_storage:get_string("event_pic")..".png]"..
					"label[0.1,3.8;"..formspec_conv_nl.."]"
				)
			end
		elseif param ~= "" and minetest.check_player_privs(name, {ban=true}) then
			if param == "del" then
				mod_storage:set_string("event_pic", nil)
				mod_storage:set_string("event_desc", nil)
				minetest.chat_send_player(name, "Event is deleted!")
				return
			end
			local pic, desc = string.match(param, '(%S+) (.*)')
			if pic == "" or pic == nil then return end
			if desc == "" or desc == nil then return end
			mod_storage:set_string("event_pic", pic)
			mod_storage:set_string("event_desc", desc)
			minetest.chat_send_player(name, "Event successfully added! Showing you the formspec..")
			local formspec_conv_nl = string.gsub(mod_storage:get_string("event_desc"), "\\n", "\n")
			minetest.show_formspec(name, "events",
				"size[10,6]"..
				"image[0.1,0.1;12.2,4;"..mod_storage:get_string("event_pic")..".png]"..
				"label[0.1,3.8;"..formspec_conv_nl.."]"
			)
		end
	end,
})
