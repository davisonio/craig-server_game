--[[

Home GUI for Minetest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-home_gui
License: BSD-3-Clause https://raw.github.com/cornernote/minetest-home_gui/master/LICENSE

]]--

-- local api
local home_gui = {}

-- filename
home_gui.filename = minetest.get_worldpath()..'/home_gui'

-- load_home
local homepos = {}
local load_home = function()
    local input = io.open(home_gui.filename..".home", "r")
    if input then
        while true do
            local x = input:read("*n")
            if x == nil then
                break
            end
            local y = input:read("*n")
            local z = input:read("*n")
            local name = input:read("*l")
            homepos[name:sub(2)] = {x = x, y = y, z = z}
        end
        io.close(input)
    else
        homepos = {}
    end
end
load_home() -- run it now

-- set_home
home_gui.set_home = function(player, pos)
	homepos[player:get_player_name()] = pos
	-- save the home data from the table to the file
	local output = io.open(home_gui.filename..".home", "w")
	for k, v in pairs(homepos) do
		if v ~= nil then
			output:write(math.floor(v.x).." "..math.floor(v.y).." "..math.floor(v.z).." "..k.."\n")
		end
	end
	io.close(output)
end

-- go_home 
home_gui.go_home = function(player)
	local pos = homepos[player:get_player_name()]
	if pos~=nil then
		player:setpos(pos)
		player:set_eye_offset({x=0,y=0,z=0}, {x=0,y=0,z=0})
		default.player_set_animation(player, "stand" , 30)
	end
end


local use_sfinv = false
if not core.global_exists("inventory_plus") and core.global_exists("sfinv_buttons") then
	use_sfinv = true
else
	local use_sfinv = (core.global_exists("sfinv_buttons") and core.settings:get("inventory") == "sfinv") or false
end


-- get_formspec
home_gui.get_formspec = function(player)
	local formspec = "size[4,1.5]"
		.."button[0,0;2,0.5;main;Back]"
		.."button_exit[0,1;2,0.5;home_gui_set;Set Home]"
		.."button_exit[2,1;2,0.5;home_gui_go;Go Home]"
	local home = homepos[player:get_player_name()]
	if home ~= nil then
		formspec = formspec
			.."label[2,-0.2;Home set to:]"
			.."label[2,0.2;"..math.floor(home.x)..","..math.floor(home.y)..","..math.floor(home.z).."]"
	end
	return formspec
end

if use_sfinv then
	sfinv_buttons.register_button("home_gui", {
		title = "Home Pos",
		action = function(player)
			player:set_inventory_formspec(home_gui.get_formspec(player, "home_gui"))
		end,
		image = "home_gui_inv.png",
	})
end

-- register_on_joinplayer
minetest.register_on_joinplayer(function(player)
	if not use_sfinv then
		-- add inventory_plus page
		inventory_plus.register_button(player,"home_gui","Home Pos")
	end
end)

-- register_on_player_receive_fields
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.home_gui_set then
		home_gui.set_home(player, player:getpos())
	end
	if fields.home_gui_go then
		home_gui.go_home(player)
	end
	if fields.main or fields.home_gui or fields.home_gui_set or fields.home_gui_go then
		if use_sfinv then
			sfinv.set_page(player, "sfinv_buttons:buttons")
		else
			inventory_plus.set_inventory_formspec(player, home_gui.get_formspec(player))
		end
	end
end)

-- log that we started
minetest.log("action", "[MOD]"..minetest.get_current_modname().." -- loaded from "..minetest.get_modpath(minetest.get_current_modname()))
