factory={
crafts={},
empty={item=ItemStack(nil),time=0}
}

factory.worldpath = minetest.get_worldpath()
factory.modpath = minetest.get_modpath("factory")

dofile(factory.modpath.."/settings.txt")

dofile(factory.modpath.."/util/init.lua")
dofile(factory.modpath.."/machines/init.lua")
dofile(factory.modpath.."/items/init.lua")
dofile(factory.modpath.."/decor/init.lua")

print("Factory v0.5.1 is working")