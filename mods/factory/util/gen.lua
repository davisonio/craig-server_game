if factory.fertilizerGeneration then
  minetest.register_on_generated(function(minp, maxp, seed)
    if maxp.y >= 2 and minp.y <=0 then
      -- Generate fertilizer
      local perlin1 = minetest.get_perlin(576, 3, 0.6, 100)
      local divlen = 16
      local divs = (maxp.x-minp.x)/divlen + 1;
      for divx=0,divs-1 do
      for divz=0,divs-1 do
        local x0 = minp.x + math.floor(divx*divlen)
        local z0 = minp.z + math.floor(divz*divlen)
        local x1 = minp.x + math.floor((divx+1)*divlen)
        local z1 = minp.z + math.floor((divz+1)*divlen)

        local grass_amount = math.floor(perlin1:get2d({x=x0, y=z0}) ^ 2)

        local pr = PseudoRandom(seed+249)
        for i=0,grass_amount do
          local x = pr:next(x0, x1)
          local z = pr:next(z0, z1)
          local ground_y = nil
          for y=30,0,-1 do
            if minetest.get_node({x=x,y=y,z=z}).name ~= "air" then
              ground_y = y
              break
            end
          end

          if ground_y then
            local p = {x=x, y=ground_y+1, z=z}
            local nn = minetest.get_node(p).name

            if minetest.registered_nodes[nn] and
              minetest.registered_nodes[nn].buildable_to then
              nn = minetest.get_node({x=x,y=ground_y,z=z}).name
              if nn == "default:dirt_with_grass" then
                minetest.set_node(p, {name="factory:sapling_fertilizer"})
              end
            end
          end
        end
      end
      end
    end
  end)
end