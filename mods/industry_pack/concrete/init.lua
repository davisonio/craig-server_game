minetest.register_node("concrete:concrete", {
	description = "Concrete",
	tiles = {"concrete.png"},
	groups = {cracky=1},
	drop = "concrete:concrete",
})

minetest.register_craftitem("concrete:rebar", {
         description = "Rebar",
	inventory_image = "rebar.png",
})

minetest.register_craft( {
    output = 'concrete:rebar 6',
    recipe = {
        { 'default:steel_ingot', '', '' },
        { '', 'default:steel_ingot', '' },
        { '', '', 'default:steel_ingot' }
    }
} )

minetest.register_craft( {
    output = 'concrete:concrete 5',
    recipe = {
        { 'default:stone', 'concrete:rebar', 'default:stone' },
        { 'concrete:rebar', 'default:stone', 'concrete:rebar' },
        { 'default:stone', 'concrete:rebar', 'default:stone' }
    }
} )