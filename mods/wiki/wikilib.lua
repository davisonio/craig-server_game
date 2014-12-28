-- Make the directories needed for the mod
os.mkdir(minetest.get_worldpath().."/wiki")
os.mkdir(minetest.get_worldpath().."/wiki".."/pages")
os.mkdir(minetest.get_worldpath().."/wiki".."/plugins")

-- Converts the article name to the filename in the worldpath where it is stored
local function name_to_filename(name)

	name = name:gsub("[^A-Za-z0-9-]", function(c)
		if c == " " then
			return "_"
		else
			return ("%%%02X"):format(c:byte(1))
		end
	end)
	return name:lower()

end
wikilib.name_to_filename = name_to_filename

local function get_page_path(name, player) --> path, is_file, allow_save

	local allow_save = minetest.check_player_privs(player, {wiki=true})
	local path

	if name:sub(1, 1) == "." then
		local text = wikilib.internal_pages[name] or wikilib.internal_pages[".Index"]
		if type(text) == "function" then
			text = text(player)
		end
		return text, false, false
	elseif (name:sub(1, 1) == "#") and (not minetest.check_player_privs(player, {wiki=true})) then
		local text = wikilib.internal_pages[name] or wikilib.internal_pages[".404"]
		if type(text) == "function" then
			text = text(player)
		end
		return text, false, false
	else
		path = "pages/"..name_to_filename(name)
	end

	return minetest.get_worldpath().."/wiki".."/"..path, true, allow_save

end

local function find_links(lines) --> links
	local links = {}
	local links_n = 0
	for _,line in ipairs(lines) do
		for link in line:gmatch("%[(.-)%]") do
			links_n = links_n + 1
			links[links_n] = link
		end
	end
	return links
end

local function load_page(name, player) --> text, links, allow_save
	local text, allow_save = wikilib.plugin_handle_load(name, player)
	if text then
		return text, find_links(text:split("\n")), allow_save
	end
	local path, is_file, allow_save = get_page_path(name, player)
	local f
	if is_file then
		f = io.open(path)
		if not f then
			f = strfile.open(wikilib.internal_pages[".404"])
		end
	else
		f = strfile.open(path)
	end
	local lines = {}
	local lines_n = 0
	for line in f:lines() do
		lines_n = lines_n + 1
		lines[lines_n] = line
	end
	f:close()
	local text = table.concat(lines, "\n")
	local links = find_links(lines)
	return text, links, allow_save
end

local function save_page(name, player, text)

	local ok = wikilib.plugin_handle_save(name, player, text)
	if ok then return ok end

	local path, is_file, allow_save = get_page_path(name, player)

	if (not is_file) or (not allow_save) then return end

	local f = io.open(path, "w")
	if not f then return end

	f:write(text)

	f:close()

end

local esc = minetest.formspec_escape

function wikilib.get_wiki_page_formspec(player, name, w, h)

	if name == "" then name = "Main" end

	w = w or 12
	h = h or 10

	local text, links, allow_save = load_page(name, player)

	local buttons = ""
	local bx = 0
	local by = 6.3

	for i, link in ipairs(links) do
		if ((i - 1) % 5) == 0 then
			bx = 0
			by = by + 0.75
		end
		link = esc(link)
		buttons = buttons..(("button[%f,%f;2.4,1;page_%s;%s]"):format(bx, by, link, link))
		bx = bx + 2.4
	end

	local toolbar

	if allow_save then
		toolbar = "button[0,9.4;2.4,1;save;Save]"
	else
		toolbar = "label[0,9.4;You are not authorized to edit this page.]"
	end

	return ("size["..w..","..h.."]"
		.. "field[0.1,0.5;11.2,1;page;Go to page;"..esc(name).."]"
		.. "button[11,0.2;1,1;go;Go]"
		.. "textarea[0.1,1.5;12.4,6.4;text;"..esc(name)..";"..esc(text).."]"
		.. buttons
		.. toolbar
		.."button_exit[9.6,9.4;2.4,1;close;Close]"
	)

end

function wikilib.show_wiki_page(player, name)
	local fs = wikilib.get_wiki_page_formspec(player, name)
	minetest.show_formspec(player, "wiki:wiki", fs)
end

minetest.register_node("wiki:wiki", {
	description = "Wiki",
	tiles = {"default_wood.png", "default_wood.png", "default_bookshelf.png"},
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Wiki")
	end,
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker then
			local name = clicker:get_player_name()
			if minetest.get_player_privs(name).wiki then
				wikilib.show_wiki_page(name, "#Main")
			else
				wikilib.show_wiki_page(name, "Main")
			end
		end
	end,
})

minetest.register_privilege("wiki", {
	description = "Allows editing of wiki pages",
	give_to_singleplayer = false,
})

minetest.register_craft({
	output = "wiki:wiki",
	recipe = { 
		{"default:bookshelf", "default:bookshelf", "default:bookshelf"},
		{"default:bookshelf", "default:bookshelf", "default:bookshelf"},
		{"default:bookshelf", "default:bookshelf", "default:bookshelf"} 
	},
})

function wikilib.handle_formspec(player, formname, fields)
	if (not formname) or (formname ~= "wiki:wiki") then return end
	local plname = player:get_player_name()
	if fields.save then
		local r = save_page(fields.page, plname, fields.text)
		if type(r) == "string" then
			wikilib.show_wiki_page(plname, r)
		else
			wikilib.show_wiki_page(plname, fields.page)
		end
		return true
	elseif fields.go then
		wikilib.show_wiki_page(plname, fields.page)
		return true
	else
		for k in pairs(fields) do
			if type(k) == "string" then
				local name = k:match("^page_(.*)")
				if name then
					wikilib.show_wiki_page(plname, name)
					return true
				end
			end
		end
	end
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	wikilib.handle_formspec(player, formname, fields)
end)
