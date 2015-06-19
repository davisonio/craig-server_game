minetest.register_privilege("rank_staff", "Rank: staff (sysadmin, admin or moderator)")
minetest.register_privilege("rank_sysadmin", "Rank: sysadmin")
minetest.register_privilege("rank_admin", "Rank: admin")
minetest.register_privilege("rank_moderator", "Rank: moderator")

-- Check player privs/ranks are okay on join.
minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	if not minetest.get_player_privs(name).rank_staff or not minetest.get_player_privs(name).rank_sysadmin or not minetest.get_player_privs(name).rank_admin or not minetest.get_player_privs(name).rank_moderator then
		-- Person is a player
		local privs = minetest.get_player_privs(name)
		-- privs.shout =
		-- privs.interact =
		-- privs.fast =
		minetest.set_player_privs(name, privs)
	end
	if minetest.get_player_privs(name).rank_moderator then
		-- Person is a moderator
		local privs = minetest.get_player_privs(name)

		privs.rank_staff = true
		privs.settime = true
		privs.kick = true
		privs.ban = true
		privs.teleport = true
		privs.bring = true
		privs.fly = true
		privs.basic_privs = true

		minetest.set_player_privs(name, privs)
	end
	if minetest.get_player_privs(name).rank_admin then
		-- Person is a admin
		local privs = minetest.get_player_privs(name)

		privs.rank_staff = true
		privs.settime = true
		privs.kick = true
		privs.ban = true
		privs.teleport = true
		privs.bring = true
		privs.fly = true
		privs.basic_privs = true

		privs.noclip = true
		privs.areas = true
		privs.travelnet = true
		privs.irc_admin = true

		minetest.set_player_privs(name, privs)
	end
	if minetest.get_player_privs(name).rank_sysadmin then
		-- Person is a sysadmin
		local privs = minetest.get_player_privs(name)

		privs.rank_staff = true
		privs.settime = true
		privs.kick = true
		privs.ban = true
		privs.teleport = true
		privs.bring = true
		privs.fly = true
		privs.basic_privs = true

		privs.noclip = true
		privs.areas = true
		privs.travelnet = true
		privs.irc_admin = true

		privs.server = true
		privs.privs = true
		privs.give = true
		privs.rollback = true
		privs.password = true

		minetest.set_player_privs(name, privs)
	end
	if minetest.get_player_privs(name).rank_staff then
		-- Person is a staff
		if not minetest.get_player_privs(name).rank_sysadmin or not minetest.get_player_privs(name).rank_admin or not minetest.get_player_privs(name).rank_moderator then
			-- Person is a staff but they don't have a specific role - not right
			local privs = minetest.get_player_privs(name)

			privs.rank_staff = false

			minetest.set_player_privs(name, privs)
		end
	end
end)
