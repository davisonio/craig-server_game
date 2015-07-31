-- This below is the Crafter mod by the legend MasterGollum

function factory.register_craft(craft)
  assert(craft.type ~= nil and craft.recipe ~= nil and craft.output ~= nil,
  "Invalid craft definition, it must have type, recipe and output")
  assert(type(craft.recipe)=="table" and type(craft.recipe[1])=="table","'recipe' must be a bidimensional table")
  minetest.log("verbose","registerCraft ("..craft.type..", output="..craft.output.." recipe="..dump(craft.recipe))
  craft._h=#craft.recipe
  craft._w=#craft.recipe[1]
  -- TODO check that all the arrays have the same length...
  factory.crafts[#factory.crafts+1]=craft
end

function factory.get_craft_result(data)
  assert(data.method ~= nil and data.items ~= nil, "Invalid call, method and items must be provided")
  local w = 1
  if data.width ~= nil and data.width>0 then
    w=data.width
  end
  local r=nil
  for zz,craft in ipairs(factory.crafts) do
    r=factory._check_craft(data,w,craft)
    if r ~= nil then
      if factory.debug then
        print("Craft found, returning "..dump(r.item))
      end
      return r
    end
  end
  return factory.empty
end

function factory._check_craft(data,w,c)
  if c.type == data.method then
    -- Here we go..
    for i=1,w-c._h+1 do
      for j=1,w-c._w+1 do
        local p=(i-1)*w+j
        if factory.debug then
          print("Checking data.items["..dump(i).."]["..dump(j).."]("..dump(p)..")="..dump(data.items[p]:get_name()).." vs craft.recipe[1][1]="..dump(c.recipe[1][1]))
        end
        if data.items[p]:get_name() == c.recipe[1][1] then
          for m=1,c._h do
            for n=1,c._w do
              local q=(i+m-1-1)*w+j+n-1
              if factory.debug then
                print(" Checking data.items["..dump(i+m-1).."]["..dump(j+n-1).."]("..dump(q)..")="..dump(data.items[q]:get_name())..
                " vs craft.recipe["..dump(m).."]["..dump(n).."]="..dump(c.recipe[m][n]))
              end
              if c.recipe[m][n] ~= data.items[q]:get_name() then
                return nil
              end
            end
          end
          -- found! we still must check that is not any other stuff outside the limits of the recipe sizes...
          -- Checking at right of the matching square
          for m=i-c._h+1+1,w do
            for n=j+c._w,w do
              local q=(m-1)*w+n
              if factory.debug then
                print(" Checking right data.items["..dump(m).."]["..dump(n).."]("..dump(q)..")="..dump(data.items[q]:get_name()))
              end
              if data.items[q]:get_name() ~= "" then
                return nil
              end
            end
          end
          -- Checking at left of the matching square (the first row has been already scanned)
          for m=i-c._h+1+1+1,w do
            for n=1,j-1 do
              local q=(m-1)*w+n
              if factory.debug then
                print(" Checking left data.items["..dump(m).."]["..dump(n).."]("..dump(q)..")="..dump(data.items[q]:get_name()))
              end
              if data.items[q]:get_name() ~= "" then
                return nil
              end
            end
          end
          -- Checking at bottom of the matching square
          for m=i+c._h,w do
            for n=j,j+c._w do
              local q=(m-1)*w+n
              if factory.debug then
                print(" Checking bottom data.items["..dump(m).."]["..dump(n).."]("..dump(q)..")="..dump(data.items[q]:get_name()))
              end
              if data.items[q]:get_name() ~= "" then
                return nil
              end
            end
          end
          if factory.debug then
            print("Craft found! "..c.output)
          end
          return {item=ItemStack(c.output),time=1}
        elseif data.items[p] ~= nil and data.items[p]:get_name() ~= "" then
          if factory.debug then
            print("Invalid data item "..dump(data.items[p]:get_name()))
          end
          return nil
        end
      end
    end
  end
end