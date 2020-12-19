
-- Check the form

minetest.register_on_player_receive_fields(function(player, form, pressed)

	-- ATMs
	if form == "atm.form" or form == "atm.form2" or form == "atm.form3" then
		local n = player:get_player_name()
		local transaction = { amount = 0, denomination = 0, count = 0 }
		local pinv=player:get_inventory()

		-- single note transactions
		for _,i in pairs({1, 5, 10, -1, -5, -10}) do
			if pressed["i"..i] then
				transaction.amount = i
				transaction.denomination = '_' .. math.abs(i)
				if transaction.denomination == '_1' then
					transaction.denomination = ''
				end
				transaction.count = ' ' .. 1
				break
			end
		end

		-- 10x banknote transactions
		for _,t in pairs({10, 50, 100, -10, -50, -100}) do
			if pressed["t"..t] then
				transaction.amount = t
				transaction.denomination = '_' .. math.abs(t/10)
				if transaction.denomination == '_1' then
					transaction.denomination = ''
				end
				transaction.count = ' ' .. 10
				break
			end
		end

		-- 100x banknote transactions
		for _,c in pairs({100, 500, 1000, -100, -500, -1000}) do
			if pressed["c"..c] then
				transaction.amount = c
				transaction.denomination = '_' .. math.abs(c/100)
				if transaction.denomination == '_1' then
					transaction.denomination = ''
				end
				transaction.count = ' ' .. 100
				break
			end
		end

		if (atm.balance[n] + transaction.amount) < 0 then
			minetest.chat_send_player(n, "Not enough money in your account")
			transaction.amount = 0
		end

		local item = "currency:minegeld" .. transaction.denomination .. transaction.count

		if transaction.amount < 0 then
			if pinv:room_for_item("main", item) then
				pinv:add_item("main", item)
				atm.balance[n] = atm.balance[n] + transaction.amount
			else
				minetest.chat_send_player(n, "Not enough room in your inventory")
			end

		elseif transaction.amount > 0 then
			if pinv:contains_item("main", item) then
				pinv:remove_item("main", item)
				atm.balance[n] = atm.balance[n] + transaction.amount
			else
				minetest.chat_send_player(n, "Not enough money in your inventory")
			end
		end

		atm.saveaccounts()

		if not pressed.Quit and not pressed.quit then
			if form == "atm.form" then
				atm.showform(player)
			elseif form == "atm.form2" then
				atm.showform2(player)
			elseif form == "atm.form3" then
				atm.showform3(player)
			end
		end
	end

end)
