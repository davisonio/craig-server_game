
function atm.ensure_init(name)
   -- Ensure the atm account for the placer specified by name exists
   atm.readaccounts()
   if not atm.balance[name] then
      atm.balance[name] = atm.startbalance
   end
end


-- banking accounts storage

function atm.readaccounts ()
	local b = atm.balance
	local file = io.open(atm.pth, "r")
	if file then
		repeat
			local balance = file:read("*n")
			if balance == nil then
				break
			end
			local name = file:read("*l")
			b[name:sub(2)] = balance
		until file:read(0) == nil
		io.close(file)
	end
end

function atm.saveaccounts()
	if not atm.balance then
		return
	end
	local data = {}
	for k, v in pairs(atm.balance) do
		table.insert(data, string.format("%d %s\n", v, k))
	end

	local output = io.open(atm.pth, "w")
	output:write(table.concat(data))
	io.close(output)
end


-- wire transfer data storage

function atm.read_transactions()
	local file = io.open(atm.pth_wt, "r")
	if file then
		local data = file:read("*all")
		atm.completed_transactions = minetest.deserialize(data)
	end
end

function atm.write_transactions()
	if not atm.completed_transactions then
		return
	end
	local file = io.open(atm.pth_wt, "w")
	local data = minetest.serialize(atm.completed_transactions)
	file:write(data)
	io.close(file)
end



minetest.register_on_joinplayer(function()
	atm.readaccounts()
end)
