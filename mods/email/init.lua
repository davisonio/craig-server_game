-- The email mod. Big thanks to Amaz for the code!
-- Run this to make sure the mod works:
-- sudo apt-get install luarocks
-- sudo luarocks install luasocket
-- sudo apt-get install openssl
-- sudo luarocks install luasec OPENSSL_LIBDIR=/usr/lib/x86_64-linux-gnu

local smtp = require("socket.smtp")
local https = require 'ssl.https'
local ltn12 = require 'ltn12'
email = {}

function sslCreate()
    local sock = socket.tcp()
    return setmetatable({
        connect = function(_, host, port)
            local r, e = sock:connect(host, port)
            if not r then return r, e end
            sock = ssl.wrap(sock, {mode='client', protocol='tlsv1'})
            return sock:dohandshake()
        end
    }, {
        __index = function(t,n)
            return function(_, ...)
                return sock[n](sock, ...)
            end
        end
    })
end

--[[local Chars = {}
for Loop = 0, 255 do
   Chars[Loop+1] = string.char(Loop)
end
local String = table.concat(Chars)

local Built = {['.'] = Chars}

local AddLookup = function(CharSet)
   local Substitute = string.gsub(String, '[^'..CharSet..']', '')
   local Lookup = {}
   for Loop = 1, string.len(Substitute) do
       Lookup[Loop] = string.sub(Substitute, Loop, Loop)
   end
   Built[CharSet] = Lookup

   return Lookup
end

function string.random(Length, CharSet)
   -- Length (number)
   -- CharSet (string, optional); e.g. %l%d for lower case letters and digits

   local CharSet = CharSet or '.'

   if CharSet == '' then
      return ''
   else
      local Result = {}
      local Lookup = Built[CharSet] or AddLookup(CharSet)
      local Range = table.getn(Lookup)

      for Loop = 1,Length do
         Result[Loop] = Lookup[math.random(1, Range)]
      end
      local n = math.random(1,9) .. math.random(1,9) .. math.random(1,9)

      return table.concat(Result) .. n
   end
end]]

--
-- SMTP Send Config
--
function email.send(id, from, to, message)
	smtp.send {
		from = from,
		rcpt = to,
		source = smtp.message(message),
		user = 'craig.davison3@gmail.com',
		password = '',
		server = 'smtp.mandrillapp.com',
		port = 587,
		create = sslCreate
	}
	minetest.log("action", "Sending an email to "..to.." from "..from.." ("..id..")")
end

--minetest.register_chatcommand("test",{
--	privs = {shout=true},
--	func = function(name)
--		--local pass = string.random(4, %l)
--		local msg = {
--			headers = {
--				to = 'Name <email-to@here>',
--				subject = "Test!!"
--			},
--			body = name .. " here is your new password! Please change it..! \n\n" .. --pass ..
--				"\n------------------------------------------------------------\n" ..
--				"Sent from Minetest."
--		}
--		--minetest.set_player_password(name, minetest.get_password_hash(name, pass))
--	end
--})

-- Load emails to be sending
