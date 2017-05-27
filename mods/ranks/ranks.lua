-- ranks/ranks.lua

ranks.register("owner", {
	prefix = "Owner",
	strict_privs = false,
	grant_missing = true,
	revoke_extra = false,
	privs = {
	  shout  = true,
	  fast = true,
	  zoom = true,
	  interact = true,
	  fly = true,
	  noclip = true,
	  settime = true,
	  protection_bypass = true,
	  basic_privs = true,
	  teleport = true,
	  travelnet_attach = true,
	  travelnet_remove = true,
	  whois = true,
	  ban = true,
	  kick = true,
	  bring = true,
	  areas = true,
	  server = true,
	  password = true,
	  worldedit = true,
	  privs = true,
	  rollback = true,
	  give = true,
	  irc_admin = true,
	  debug = true
	}
})

ranks.register("admin", {
	prefix = "Admin",
	strict_privs = true,
	grant_missing = true,
	revoke_extra = true,
	privs = {
		shout  = true,
  	  fast = true,
  	  zoom = true,
  	  interact = true,
  	  fly = true,
  	  noclip = true,
  	  settime = true,
  	  protection_bypass = true,
  	  basic_privs = true,
  	  teleport = true,
  	  travelnet_attach = true,
  	  travelnet_remove = true,
  	  whois = true,
  	  ban = true,
  	  kick = true,
  	  bring = true,
  	  areas = true
	}
})

ranks.register("builder", {
	prefix = "Builder",
	strict_privs = true,
	grant_missing = true,
	revoke_extra = true,
	privs = {
	  shout  = true,
  	  fast = true,
  	  zoom = true,
	  interact = true,
	  fly = true,
	  noclip = true
	}
})
