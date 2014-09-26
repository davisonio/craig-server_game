local important = {}

important.path = minetest.get_worldpath()

function important.formspec(player,article)
	
	if ( article == "" or article == nil ) then
		article = "important.txt"
	else
		article = "important_"..article..".txt"
	end
	
	local importantfile = io.open(important.path.."/"..article,"r")
	
	local formspec = "size[12,10]"
	
	if importantfile ~= nil then
		local importantcontent = importantfile:read("*a")
		formspec = formspec.."textarea[.25,.25;12,10;important;;"..importantcontent.."]"
	else		
		formspec = formspec.."label[.25,.25;Article does not exist]"
	end		
	formspec = formspec.."button_exit[.25,9;2,1;exit;Close"
	if ( importantfile ~= nil ) then
		importantfile:close()
	end
	return formspec
end

function important.show_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name,"important",important.formspec(player))
	minetest.log('action','Showing formspec to '..name)
end


minetest.register_chatcommand("important",{
	params = "<article>",
	description="Shows the server important",
	func = function (name,params)
		local player = minetest.get_player_by_name(name)
		minetest.show_formspec(name,"important",important.formspec(player,params))	
	end,
})

minetest.register_on_joinplayer(function (player)
	minetest.after(10,important.show_formspec,player)
end)
