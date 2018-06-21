-- ranks/init.lua

ranks = {}

local chat3_exists = minetest.get_modpath("chat3")
local registered   = {}
local default

---
--- API
---

-- [local function] Get colour
local function get_colour(colour)
	if type(colour) == "table" and minetest.rgba then
		return minetest.rgba(colour.r, colour.g, colour.b, colour.a)
	elseif type(colour) == "string" then
		return colour
	else
		return "#ffffff"
	end
end

-- [function] Register rank
function ranks.register(name, def)
	assert(name ~= "clear", "Invalid name \"clear\" for rank")

	registered[name] = def

	if def.default then
		default = name
	end
end

-- [function] Unregister rank
function ranks.unregister(name)
	registered[name] = nil
end

-- [function] List ranks in plain text
function ranks.list_plaintext()
	local list = ""
	for rank, i in pairs(registered) do
		if list == "" then
			list = rank
		else
			list = list..", "..rank
		end
	end
	return list
end

-- [function] Get player rank
function ranks.get_rank(player)
	if type(player) == "string" then
		player = minetest.get_player_by_name(player)
	end

	local rank = player:get_attribute("ranks:rank")
	if rank and registered[rank] then
		return rank
	end
end

-- [function] Get rank definition
function ranks.get_def(rank)
	if not rank then
		return
	end

	return registered[rank]
end

-- [function] Update player privileges
function ranks.update_privs(player, trigger)
	if type(player) == "string" then
		player = minetest.get_player_by_name(player)
	end

	if not player then
		return
	end

	local name = player:get_player_name()
	local rank = ranks.get_rank(player)
	if rank then
		-- [local function] Warn
		local function warn(msg)
			if msg and trigger and minetest.get_player_by_name(trigger) then
				minetest.chat_send_player(trigger, minetest.colorize("red", "Warning: ")..msg)
			end
		end

		local def   = registered[rank]
		if not def.privs then
			return
		end

		if def.strict_privs == true then
			minetest.set_player_privs(name, def.privs)
			warn(name.."'s privileges have been reset to that of their rank (strict privileges)")
			return true
		end

		local privs = minetest.get_player_privs(name)

		if def.grant_missing == true then
			local changed = false
			for name, priv in pairs(def.privs) do
				if not privs[name] and priv == true then
					privs[name] = priv
					changed = true
				end
			end

			if changed then
				warn("Missing rank privileges have been granted to "..name)
			end
		end

		if def.revoke_extra == true then
			local changed = false
			for name, priv in pairs(privs) do
				if not def.privs[name] then
					privs[name] = nil
					changed = true
				end
			end

			if changed then
				warn("Extra non-rank privileges have been revoked from "..name)
			end
		end

		local admin = player:get_player_name() == minetest.settings:get("name")
		-- If owner, grant `rank` privilege
		if admin then
			local name = player:get_player_name()
			local privs = minetest.get_player_privs(name)
			privs["rank"] = true
			minetest.set_player_privs(name, privs)
		end

		minetest.set_player_privs(name, privs)
		return true
	end
end

-- [function] Update player nametag
function ranks.update_nametag(player)
	if minetest.settings:get("ranks.prefix_nametag") == "false" then
		return
	end

	if type(player) == "string" then
		player = minetest.get_player_by_name(player)
	end

	local name = player:get_player_name()
	local rank = ranks.get_rank(player)
	if rank then
		local def    = ranks.get_def(rank)
		local colour = get_colour(def.colour)
		local prefix = def.prefix

		if prefix then
			prefix = minetest.colorize(colour, prefix).." "
		else
			prefix = ""
		end

		player:set_nametag_attributes({
			text = prefix..name,
		})

		return true
	end
end

-- [function] Set player rank
function ranks.set_rank(player, rank)
	if type(player) == "string" then
		player = minetest.get_player_by_name(player)
	end

	if registered[rank] then
		-- Set attribute
		player:set_attribute("ranks:rank", rank)
		-- Update nametag
		ranks.update_nametag(player)
		-- Update privileges
		ranks.update_privs(player)

		return true
	end
end

-- [function] Remove rank from player
function ranks.remove_rank(player)
	if type(player) == "string" then
		player = minetest.get_player_by_name(player)
	end

	local rank = ranks.get_rank(player)
	if rank then
		local name = player:get_player_name()

		-- Clear attribute
		player:set_attribute("ranks:rank", nil)
		-- Update nametag
		player:set_nametag_attributes({
			text = name,
			color = "#ffffff",
		})
		-- Update privileges
		local basic_privs =
			minetest.string_to_privs(minetest.settings:get("basic_privs") or "interact,shout")
		minetest.set_player_privs(name, basic_privs)
	end
end

-- [function] Send prefixed message (if enabled)
function ranks.chat_send(name, message)
	if minetest.settings:get("ranks.prefix_chat") ~= "false" then
		local rank = ranks.get_rank(name)
		if rank then
			local def = ranks.get_def(rank)
			if def.prefix then
				local colour = get_colour(def.colour)
				local prefix = minetest.colorize(colour, def.prefix)
				if chat3_exists then
					chat3.send(name, message, prefix.." ", "ranks")
				else
					minetest.chat_send_all(prefix.." <"..name.."> "..message)
					minetest.log("action", "CHAT: ".."<"..name.."> "..message)
				end
				return true
			end
		end
	end
end

---
--- Registrations
---

-- [privilege] Rank
minetest.register_privilege("rank", {
	description = "Permission to use /rank chatcommand",
	give_to_singleplayer = false,
})

-- Assign/update rank on join player
minetest.register_on_joinplayer(function(player)
	if ranks.get_rank(player) then
		-- Update nametag
		ranks.update_nametag(player)
		-- Update privileges
		ranks.update_privs(player)
	else
		if ranks.default then
			ranks.set_rank(player, ranks.default)
		end
	end
end)

-- Prefix messages if enabled
minetest.register_on_chat_message(function(name, message)
	return ranks.chat_send(name, message)
end)

-- [chatcommand] /rank
minetest.register_chatcommand("rank", {
	description = "Set a player's rank",
	params = "<player> <new rank> / \"list\" | username, rankname / list ranks",
	privs = {rank = true},
	func = function(name, param)
		local param = param:split(" ")
		if #param == 0 then
			return false, "Invalid usage (see /help rank)"
		end

		if #param == 1 and param[1] == "list" then
			return true, "Available Ranks: "..ranks.list_plaintext()
		elseif #param == 2 then
			if minetest.get_player_by_name(param[1]) then
				if ranks.get_def(param[2]) then
					if ranks.set_rank(param[1], param[2]) then
						if name ~= param[1] then
							minetest.chat_send_player(param[1], name.." set your rank to "..param[2])
						end

						return true, "Set "..param[1].."'s rank to "..param[2]
					else
						return false, "Unknown error while setting "..param[1].."'s rank to "..param[2]
					end
				elseif param[2] == "clear" then
					ranks.remove_rank(param[1])
					return true, "Removed rank from "..param[1]
				else
					return false, "Invalid rank (see /rank list)"
				end
			else
				return false, "Invalid player \""..param[1].."\""
			end
		else
			return false, "Invalid usage (see /help rank)"
		end
	end,
})

-- [chatcommand] /getrank
minetest.register_chatcommand("getrank", {
	description = "Get a player's rank. If no player is specified, your own rank is returned.",
	params = "<name> | name of player",
	func = function(name, param)
		if param and param ~= "" then
			if minetest.get_player_by_name(param) then
				local rank = ranks.get_rank(param) or "No rank"
				return true, "Rank of "..param..": "..rank
			else
				return false, "Invalid player \""..name.."\""
			end
		else
			local rank = ranks.get_rank(name) or "No rank"
			return false, "Your rank: "..rank
		end
	end,
})

---
--- Overrides
---

local grant = minetest.registered_chatcommands["grant"].func
-- [override] /grant
minetest.registered_chatcommands["grant"].func = function(name, param)
	local ok, msg = grant(name, param) -- Call original function

	local grantname, grantprivstr = string.match(param, "([^ ]+) (.+)")
	if grantname then
		ranks.update_privs(grantname, name) -- Update privileges
	end

	return ok, msg
end

local grantme = minetest.registered_chatcommands["grantme"].func
-- [override] /grantme
minetest.registered_chatcommands["grantme"].func = function(name, param)
	local ok, msg = grantme(name, param) -- Call original function
	ranks.update_privs(name, name) -- Update privileges
	return ok, msg
end

local revoke = minetest.registered_chatcommands["revoke"].func
-- [override] /revoke
minetest.registered_chatcommands["revoke"].func = function(name, param)
	local ok, msg = revoke(name, param) -- Call original function

	local revokename, revokeprivstr = string.match(param, "([^ ]+) (.+)")
	if revokename then
		ranks.update_privs(revokename, name) -- Update privileges
	end

	return ok, msg
end

---
--- Ranks
---

-- Load default ranks
dofile(minetest.get_modpath("ranks").."/ranks.lua")

local path = minetest.get_worldpath().."/ranks.lua"
-- Attempt to load per-world ranks
if io.open(path) then
	dofile(path)
end
