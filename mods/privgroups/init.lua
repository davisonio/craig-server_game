local storage = minetest.get_mod_storage()

privgroups = {
	registered_chatcommands =
			minetest.parse_json(storage:get_string("groups")) or {}
}

function privgroups.save()
	storage:set_string("groups", minetest.write_json(privgroups.registered_chatcommands))
end

local old_grant = minetest.registered_chatcommands["grant"].func
minetest.registered_chatcommands["grant"].func = function(name, param)
	local grantname, grantprivstr = string.match(param, "([^ ]+) (.+)")
	if not grantname or not grantprivstr then
		return false, "Invalid parameters (see /help grant)"
	end

	local ret_privs = {}

	local privs = minetest.string_to_privs(grantprivstr)
	for priv, _ in pairs(privs) do
		local group = privgroups.registered_groups[priv]
		if group then
			for priv2add, _ in pairs(group.privs) do
				ret_privs[priv2add] = true
			end
		else
			ret_privs[priv] = true
		end
	end

	return old_grant(name, grantname .. " " .. minetest.privs_to_string(ret_privs))
end

minetest.register_privilege("privgroups")

minetest.register_chatcommand("group", {
	privs = { privgroups = true },
	func = function(name, param)
		local gname, gprivs = string.match(param, "add ([^ ]+) (.+)")
		if gname and gprivs then
			local group = privgroups.registered_groups[gname] or { new = true, privs = {} }
			for priv, _ in pairs(minetest.string_to_privs(gprivs)) do
				group.privs[priv] = true
			end

			if group.new then
				group.new = nil
				privgroups.registered_groups[gname] = group
				privgroups.save()
				return true, "Created group " .. gname .. " with privs: " ..minetest.privs_to_string(group.privs)
			else
				return true, "Added privs to " .. gname .. ", now has: " ..minetest.privs_to_string(group.privs)
			end
		end

		return false, "Invalid subcommand.\nadd NAME PRIVS\nremove NAME PRIVS\ndelete NAME"
	end
})
