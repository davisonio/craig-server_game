local chatlog = minetest.get_worldpath().."/chatlog.txt"

function playerspeak(name,msg)
	f = io.open(chatlog, "a")
	f:write(os.date("(%m/%d/%y %X) [")..name.."]: "..msg.."\n")
	f:close()
end

minetest.register_on_chat_message(playerspeak)