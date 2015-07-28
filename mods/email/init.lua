-- The email mod. Big thanks to Amaz for the code!
email = {}

local smtp = require("socket.smtp")
--local https = require 'ssl.https'
local ltn12 = require 'ltn12'

function sslCreate()
    local sock = socket.tcp()
    return setmetatable({
        connect = function(_, host, port)
            local r, e = sock:connect(host, port)
            if not r then return r, e end
            sock = ssl.wrap(sock, {mode='client', protocol='tlsv1_1'})
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

--
-- SMTP Send Config
--
function email.send(id, to, message)
  local ok, err = smtp.send {
    from = "",
    rcpt = to,
    source = smtp.message(message),
    user = '',
    password = '',
    server = '',
    port = 0,
    -- create = sslCreate
  }
  minetest.log("action", "Sending an email to "..to.." ("..id..")")
  if not ok then
        print("Mail send failed: ", err)
  end
end

-- Load emails to be sending
dofile(minetest.get_modpath("email").."/emails/email-confirmation.lua")
dofile(minetest.get_modpath("email").."/emails/password-reset.lua")
