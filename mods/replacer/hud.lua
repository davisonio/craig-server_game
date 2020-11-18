-- HUD support added by lumberJack 

-- store Hud ids by playername
replacer.hud_ids = {};

function replacer.set_hud(playername, message)
    local player = minetest.get_player_by_name(playername)
    if replacer.hud_ids[playername] ~= nil then
        local id = replacer.hud_ids[playername]
        player:hud_remove(id)
    end

    local id = player:hud_add({
        hud_elem_type = "text",
		name = "Replacer",
		number = 0xFFFFFF,
		position = {x=0.7, y=1},
		offset = {x=0, y=-8},
		text = message,
		scale = {x=200, y=60},
		alignment = {x=1, y=-1},

    });

    replacer.hud_ids[playername] = id;
    
    minetest.after(12, function()
        if replacer.hud_ids[playername] == id then
            player:hud_remove(id)
        end
    end);
end

minetest.register_on_leaveplayer(function(player, timed_out)
    local name = player:get_player_name()
    replacer.hud_ids[name] = nil
end)