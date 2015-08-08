-- ZCG mod for minetest
-- See README for more information
-- Released by Zeg9 under WTFPL

zcg = {}

zcg.users = {}
zcg.crafts = {}

-- List of all items that can be crafted
zcg.craftableitems = {}

-- List of all items
zcg.allitems = {}


zcg.items_in_group = function(group)
    local items = {}
    local ok = true
    for name, item in pairs(minetest.registered_items) do
        -- the node should be in all groups
        ok = true
        for _, g in ipairs(group:split(',')) do
            if not item.groups[g] then
                ok = false
            end
        end
        if ok then table.insert(items,name) end
    end
    return items
end

local table_copy = function(table)
    out = {}
    for k,v in pairs(table) do
        out[k] = v
    end
    return out
end

zcg.add_craft = function(input, output, groups)
    if minetest.get_item_group(output, "not_in_craft_guide") > 0 then
        return
    end
    if not input.items then return end
    if not groups then groups = {} end
    local c = {}
    c.width = input.width
    if c.width == 0 then c.width=3 end
    c.type = input.type
    c.items = input.items
    c.makes, _ = input.output:match("%S+ (%d+)") or 1
    
    for i, item in pairs(c.items) do
        if item:sub(1,6) == "group:" then
            local groupname = item:sub(7)
            if groups[groupname] then
                c.items[i] = groups[groupname]
            else
                for _, gi in ipairs(zcg.items_in_group(groupname)) do
                    local g2 = table_copy(groups)
                    g2[groupname] = gi
                    zcg.add_craft({
                        width = c.width,
                        type = c.type,
                        items = table_copy(c.items),
                        output = input.output
                    }, output, g2)
                end
                return
            end
        end
    end
    table.insert(zcg.crafts[output], c)
end

zcg.load_crafts = function(name)
    zcg.crafts[name] = {}
    local recipes = minetest.get_all_craft_recipes(name)
    if recipes then
        for i, recipe in ipairs(recipes) do
            if (recipe and recipe.items and recipe.type) then
                zcg.add_craft(recipe, name)
            end
        end
    end
    if #zcg.crafts[name] == 0 then
        zcg.crafts[name] = nil
    else
        table.insert(zcg.craftableitems,name)
    end
end

zcg.need_load_all = true

zcg.load_all = function()
    print("Loading all crafts, this may take some time...")
    for name, item in pairs(minetest.registered_items) do
        if name and name ~= "" and
                name ~= "unknown" and
                name ~= "air" and
                name ~= "ignore" then
            table.insert(zcg.allitems, name)
            zcg.load_crafts(name)
        end
    end
    table.sort(zcg.craftableitems)
    table.sort(zcg.allitems)

    zcg.need_load_all = false
    minetest.log("info", "ZCG:items - "..minetest.write_json(zcg.allitems))
    minetest.log("info", "ZCG:crafts - "..minetest.write_json(zcg.crafts))
    print("All crafts loaded !")
end
--[[
minetest.register_chatcommand("search_items", {
    params = "<text>",
    description = "search all items",
    privs = {},
    func = function(name, param)
    if zcg.need_load_all then zcg.load_all() end
        local found = false
    for _, itemname in ipairs(zcg.allitems) do
            if itemname:find(param, 1, true) then
                minetest.chat_send_player(name, itemname)
                found = true
            end
        end
        if not found then
            minetest.chat_send_player(name, "No matching items.")
        end
    end
})
--]]
zcg.formspec = function(pn)

    if zcg.need_load_all then zcg.load_all() end

    -- Read a few things for easier access...
    local page = zcg.users[pn].page
    local alt = zcg.users[pn].alt
    local current_item = zcg.users[pn].current_item
    local filter = zcg.users[pn].filter
    local itemstrings = zcg.users[pn].itemstrings

    local formspec = "size[8,8.5]"
                     .. "bgcolor[#080808BB;true]"
                     .. "background[5,5;1,1;gui_formbg.png;true]"
                     .. "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
                     .. "button[0,0;2,.5;main;Back]"

    if zcg.users[pn].settings then
        formspec = formspec .. "field[0.5,1.5;4,1;filter;Filter;"..filter.."]"
        local selone = "false"
        local selone = "true"
        selone =  zcg.users[pn].allitems and "true" or "false"
        formspec = formspec .. "checkbox[0,2.5;zcg_allitems;Search hidden items (not recommended);"..selone.."]"
        seltwo =  zcg.users[pn].itemstrings and "true" or "false"
        formspec = formspec .. "checkbox[0,3.5;zcg_itemstrings;Search item strings (recommended);"..seltwo.."]"
        formspec = formspec .. "button[6,7.85;2,1;zcg_update_settings;Go!]"
        return formspec
    end

    -- Get the filtered and correct list of items...
    local items
    local list = zcg.users[pn].allitems and zcg.allitems or zcg.craftableitems
    if filter == "" then
        items = list
    else
		filter = filter:lower()
		filter = filter:gsub(" ", "_")
        items = {}
        for _, item in ipairs(list) do
            if item:find(filter, 1, true) then
                table.insert(items, item)
            end
        end
    end

    if zcg.users[pn].history.index > 1 then
        formspec = formspec .. "image_button[0,1;1,1;zcg_previous.png;zcg_previous;;false;false;zcg_previous_press.png]"
    else
        formspec = formspec .. "image[0,1;1,1;zcg_previous_inactive.png]"
    end
    if zcg.users[pn].history.index < #zcg.users[pn].history.list then
        formspec = formspec .. "image_button[1,1;1,1;zcg_next.png;zcg_next;;false;false;zcg_next_press.png]"
    else
        formspec = formspec .. "image[1,1;1,1;zcg_next_inactive.png]"
    end
    -- Show craft recipe
    if current_item ~= "" then
        if zcg.crafts[current_item] then
            if alt > #zcg.crafts[current_item] then
                alt = #zcg.crafts[current_item]
            end
            if alt > 1 then
                formspec = formspec .. "button[7,0;1,1;zcg_alt:"..(alt-1)..";^]"
            end
            if alt < #zcg.crafts[current_item] then
                formspec = formspec .. "button[7,2;1,1;zcg_alt:"..(alt+1)..";v]"
            end
            local c = zcg.crafts[current_item][alt]
            if c then
                local x = 3
                local y = 0
                for i, item in pairs(c.items) do
                    formspec = formspec .. "item_image_button["..((i-1)%c.width+x)..","..(math.floor((i-1)/c.width+y))..";1,1;"..item..";zcg:"..item..";]"
                    if itemstrings then
                        formspec = formspec .. "tooltip[zcg:"..item..";"..item.."]"
                    end
                end
                if c.type == "normal" or c.type == "cooking" then
                    formspec = formspec .. "image[6,2;1,1;zcg_method_"..c.type..".png]"
                else -- we don't have an image for other types of crafting
                    formspec = formspec .. "label[0,2;Method: "..c.type.."]"
                end
                formspec = formspec .. "image[6,1;1,1;zcg_craft_arrow.png]"
                local itemstr = zcg.users[pn].current_item.." "..c.makes
                formspec = formspec .. "item_image_button[7,1;1,1;"..
                                    itemstr..";output:"..itemstr..";]"
                if itemstrings then
                    formspec = formspec .. "tooltip[output:"..itemstr..
                                    ";"..itemstr.."]"
                end
--                if c.makes ~= 1 then
--                    formspec = formspec .. "label[7,2;"..c.makes.."]"
--                end
            end
        end
    end
    
    -- Node list
    local npp = 8*4 -- nodes per page
    local i = 0 -- for positioning buttons
    local s = 0 -- for skipping pages
    for _, name in ipairs(items) do
        if s < page*npp then s = s+1 else
            if i >= npp then break end
            formspec = formspec .. "item_image_button["..(i%8)..","..(math.floor(i/8)+3.5)..";1,1;"..name..";zcg:"..name..";]"
            if itemstrings then
                formspec = formspec .. "tooltip[zcg:"..name..";"..name.."]"
            end
            i = i+1
        end
    end
    if page > 0 then
        formspec = formspec .. "button[0,8;1,.5;zcg_page:"..(page-1)..";<<]"
    end
    if i >= npp then
        formspec = formspec .. "button[1,8;1,.5;zcg_page:"..(page+1)..";>>]"
    end

    local label = (page+1).."/"..(math.floor(#items/npp+1))
    if filter ~= "" then
        label = label .. " (filter='"..filter.."')"
    end
    formspec = formspec .. "label[2,7.85;Page "..label.."]"

    formspec = formspec .. "button[6,7.85;2,1;zcg_settings;Search]"

    return formspec
end

minetest.register_on_joinplayer(function(player)
    inventory_plus.register_button(player,"zcg","Craft guide")
end)

minetest.register_on_player_receive_fields(function(player,formname,fields)
    minetest.log("info", "ZCG:"..dump(fields))
    pn = player:get_player_name();

    -- Initialise all settings for a player when they're first seen...
    if not zcg.users[pn] then
        zcg.users[pn] = {current_item = "",
                         alt = 1,
                         page = 0,
                         history={index=0,list={}},
                         filter="",
                         settings=false,
                         allitems=false,
                         itemstrings=false}
    end

    if fields.zcg then
        inventory_plus.set_inventory_formspec(player, zcg.formspec(pn))
        return
    elseif fields.zcg_settings then
        zcg.users[pn].settings = true
        inventory_plus.set_inventory_formspec(player, zcg.formspec(pn))
    elseif fields.zcg_update_settings then
        zcg.users[pn].settings = false
        zcg.users[pn].filter = fields.filter
        zcg.users[pn].current_item = ""
        zcg.users[pn].page = 0
        inventory_plus.set_inventory_formspec(player, zcg.formspec(pn))
    elseif fields.zcg_allitems then
        zcg.users[pn].allitems = fields.zcg_allitems == "true"
        zcg.users[pn].current_item = ""
        zcg.users[pn].page = 0
    elseif fields.zcg_itemstrings then
        zcg.users[pn].itemstrings = fields.zcg_itemstrings == "true"
    elseif fields.zcg_previous then
        if zcg.users[pn].history.index > 1 then
            zcg.users[pn].history.index = zcg.users[pn].history.index - 1
            zcg.users[pn].current_item = zcg.users[pn].history.list[zcg.users[pn].history.index]
            inventory_plus.set_inventory_formspec(player,zcg.formspec(pn))
        end
    elseif fields.zcg_next then
        if zcg.users[pn].history.index < #zcg.users[pn].history.list then
            zcg.users[pn].history.index = zcg.users[pn].history.index + 1
            zcg.users[pn].current_item = zcg.users[pn].history.list[zcg.users[pn].history.index]
            inventory_plus.set_inventory_formspec(player,zcg.formspec(pn))
        end
    end
    for k, v in pairs(fields) do
        if (k:sub(0,4)=="zcg:") then
            local ni = k:sub(5)
            zcg.users[pn].current_item = ni
            table.insert(zcg.users[pn].history.list, ni)
            zcg.users[pn].history.index = #zcg.users[pn].history.list
            inventory_plus.set_inventory_formspec(player,zcg.formspec(pn))
        elseif (k:sub(0,9)=="zcg_page:") then
            zcg.users[pn].page = tonumber(k:sub(10))
            inventory_plus.set_inventory_formspec(player,zcg.formspec(pn))
        elseif (k:sub(0,8)=="zcg_alt:") then
            zcg.users[pn].alt = tonumber(k:sub(9))
            inventory_plus.set_inventory_formspec(player,zcg.formspec(pn))
        end
    end
end)
