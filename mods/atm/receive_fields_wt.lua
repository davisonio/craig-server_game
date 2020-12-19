
-- Check the form

minetest.register_on_player_receive_fields(function(player, form, pressed)

	-- Wire transfer terminals
	if form == "atm.form.wt" or form == "atm.form.wtc" or form == "atm.form.wtl" then

		local n = player:get_player_name()

		if not pressed.Quit and not pressed.quit then
			if form == "atm.form.wt" and pressed.transactions then
				-- transaction list (can be edited in the form, but than means nothing)
				atm.read_transactions()
				atm.showform_wtlist(player, atm.completed_transactions[n])
			elseif form == "atm.form.wtl" and pressed.transfer then
				atm.showform_wt(player)
			elseif form == "atm.form.wtl" and pressed.clr then
				-- clear all transactions in the player's list
				atm.read_transactions()
				atm.completed_transactions[n] = nil
				atm.write_transactions()
				minetest.chat_send_player(n, "Your transaction history has been cleared")
				atm.showform_wtlist(player, atm.completed_transactions[n])
			elseif form == "atm.form.wt" and pressed.pay then

				-- perform the checks of validity for wire transfer order
				-- if passed, store the data in a temporary table and show confirmation window
				if not atm.balance[pressed.dstn] then
					minetest.chat_send_player(n, "The recepient <" .. pressed.dstn ..
            "> is not registered in the banking system, aborting")
					atm.showform_wt(player)
				elseif not string.match(pressed.amnt, '^[0-9]+$') then
					minetest.chat_send_player(n, "Invalid amount <" .. pressed.amnt ..
            "> : must be an integer number, aborting")
					atm.showform_wt(player)
				elseif atm.balance[n] < tonumber(pressed.amnt) then
					minetest.chat_send_player(n, "Your account does not have enough " ..
            "funds to complete this transfer, aborting")
					atm.showform_wt(player)
				else
					atm.pending_transfers[n] = {to = pressed.dstn, sum = tonumber(pressed.amnt), desc = pressed.desc}
					atm.showform_wtconf(player, pressed.dstn, pressed.amnt, pressed.desc)
				end

			elseif form == "atm.form.wtc" then
				-- transaction processing
				atm.read_transactions()
				local t = atm.pending_transfers[n]
				if not t then
					return
				end
				if not atm.completed_transactions[t.to] then
					atm.completed_transactions[t.to] = {}
				end

				if atm.balance[n] < t.sum then
					-- you can never be too paranoid about the funds availaible
				   minetest.chat_send_player(n, "Your account does not have enough funds to complete this transfer, aborting")
				   if not t.extern then
				      atm.showform_wt(player)
				   else
				      minetest.close_formspec(n, "atm.form.wtc")
				   end
				   return
				end

				table.insert(atm.completed_transactions[t.to], {date=os.date("%Y-%m-%d"), from=n, sum=t.sum, desc=t.desc})
				atm.balance[n] = atm.balance[n] - t.sum
				atm.balance[t.to] = atm.balance[t.to] + t.sum
				atm.write_transactions()
				atm.saveaccounts()
				minetest.chat_send_player(n, "Payment of " .. t.sum .. " to " .. t.to .. " completed")
				minetest.chat_send_player(n, n .. ", thank you for choosing the Wire Transfer system")
				if t.callback then -- run callbacks from mods
				   t.callback(t)
				end
				if t.extern == true then -- Transfer was initiated by mod
				   atm.pending_transfers[n] = nil
				   minetest.close_formspec(n, "atm.form.wtc")
				   return
				end
				atm.pending_transfers[n] = nil
				atm.showform_wt(player)
			end
		else
			-- clear the pending transaction of the player, just in case
			if atm.pending_transfers[n] then
				atm.pending_transfers[n] = nil
			end
		end

	end

end)
