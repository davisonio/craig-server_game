local function register_mgv6_flower(flower_name)
	minetest.register_decoration({
		name = "flowers:"..flower_name,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		y_max = 30,
		y_min = 1,
		decoration = "flowers:"..flower_name,
	})
end

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name == "v6" then
	register_mgv6_flower("chrysanthemum_green")
	register_mgv6_flower("tulip_black")
end