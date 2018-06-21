-- ranks/ranks.lua

ranks.register("owner", {
	prefix = "Owner",
	colour = {a = 255, r = 230, g = 33, b = 23},
	strict_privs = false,
	grant_missing = false,
	revoke_extra = false,
	privs = {
		-- player
		shout = true,
		zoom = true,
		fast = true,
		interact = true,
		-- builder
		fly = true,
		noclip = true,
		server = true,
		-- moderator
		settime = true,
		teleport = true,
		bring = true,
		kick = true,
		ban = true,
		ban_admin = true,
		protection_bypass = true,
		areas_high_limit = true,
		areas = true,
		travelnet_remove = true,
		travelnet_attach = true,
		-- admin
		privs = true,
		basic_privs = true,
		rank = true,
		rollback = true,
		irc_admin = true,
		-- owner
		password = true,
		worldedit = true,
		give = true,
		debug = true
	}
})

ranks.register("admin", {
	prefix = "Admin",
	colour = {a = 255, r = 230, g = 33, b = 23},
	strict_privs = true,
	grant_missing = true,
	revoke_extra = true,
	privs = {
		-- player
		shout = true,
		zoom = true,
		fast = true,
		interact = true,
		-- builder
		fly = true,
		noclip = true,
		-- moderator
		settime = true,
		teleport = true,
		bring = true,
		kick = true,
		ban = true,
		ban_admin = true,
		protection_bypass = true,
		areas_high_limit = true,
		areas = true,
		travelnet_remove = true,
		travelnet_attach = true,
		-- admin
		privs = true,
		basic_privs = true,
		rank = true,
		rollback = true,
		irc_admin = true
	}
})

ranks.register("moderator", {
	prefix = "Moderator",
	colour = {a = 255, r = 230, g = 33, b = 23},
	strict_privs = true,
	grant_missing = true,
	revoke_extra = true,
	privs = {
		-- player
		shout = true,
		zoom = true,
		fast = true,
		interact = true,
		-- builder
		fly = true,
		noclip = true,
		-- moderator
		settime = true,
		teleport = true,
		bring = true,
		kick = true,
		ban = true,
		ban_admin = true,
		protection_bypass = true,
		areas_high_limit = true,
		areas = true,
		travelnet_remove = true,
		travelnet_attach = true
	}
})

ranks.register("builder", {
	prefix = "Builder",
	colour = {a = 255, r = 230, g = 33, b = 23},
	strict_privs = true,
	grant_missing = true,
	revoke_extra = true,
	privs = {
		-- player
		shout = true,
		zoom = true,
		fast = true,
		interact = true,
		-- builder
		fly = true,
		noclip = true
	}
})
