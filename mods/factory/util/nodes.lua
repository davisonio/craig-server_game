function factory.swap_node(pos,name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos,node)
end

function factory.get_objects_with_square_radius(pos, rad)
  rad = rad + .5;
  local objs = {}
  for _,object in ipairs(minetest.env:get_objects_inside_radius(pos, math.sqrt(3)*rad)) do
    if not object:is_player() and object:get_luaentity() and (object:get_luaentity().name == "__builtin:item" or object:get_luaentity().name == "factory:moving_item") then
      local opos = object:getpos()
      if pos.x - rad <= opos.x and opos.x <= pos.x + rad and pos.y - rad <= opos.y and opos.y <= pos.y + rad and pos.z - rad <= opos.z and opos.z <= pos.z + rad then
        objs[#objs + 1] = object
      end
    end
  end
  return objs
end
