factory_gui_bg = "bgcolor[#080808BB;true]"
factory_gui_bg_img = "background[5,5;1,1;gui_factoryformbg.png;true]"
factory_gui_bg_img_2 = "background[5,5;1,1;gui_factoryformbg2.png;true]"
factory_gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

function factory.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end
