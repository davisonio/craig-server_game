local rules = {}

rules.path = minetest.get_worldpath()

function rules.formspec(player,article)
	
	if ( article == "" or article == nil ) then
		article = "rules.txt"
	else
		article = "rules_"..article..".txt"
	end
	
	local rulesfile = io.open(rules.path.."/"..article,"r")
	
	local formspec = "size[12,10]"
	
	if rulesfile ~= nil then
		local rulescontent = rulesfile:read("*a")
		formspec = formspec.."textarea[.25,.25;12,10;rules;;"..rulescontent.."]"
	else		
		formspec = formspec.."label[.25,.25;Article does not exist]"
	end		
	formspec = formspec.."button_exit[.25,9;2,1;exit;Close"
	if ( rulesfile ~= nil ) then
		rulesfile:close()
	end
	return formspec
end

minetest.register_chatcommand("rules",{
	params = "<article>",
	description="Shows the server rules",
	func = function (name,params)
		local player = minetest.get_player_by_name(name)
		minetest.show_formspec(name,"rules",rules.formspec(player,params))	
	end,
})
