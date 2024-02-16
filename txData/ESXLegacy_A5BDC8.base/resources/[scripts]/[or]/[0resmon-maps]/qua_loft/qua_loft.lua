Citizen.CreateThread(function()


  RequestIpl("qua_loft_milo")
  
      interiorID = GetInteriorAtCoords(-239.999, -834.9958, 155.3540)
      if IsValidInterior(interiorID) then      
              -- EnableInteriorProp(interiorID, "normal")
              -- EnableInteriorProp(interiorID, "red")
              -- EnableInteriorProp(interiorID, "blue")
              -- EnableInteriorProp(interiorID, "orange")
              EnableInteriorProp(interiorID, "marble")
      RefreshInterior(interiorID)
  
      end
  
  end)

Citizen.CreateThread(function()


    RequestIpl("qua_corridor_milo")
    
        interiorID = GetInteriorAtCoords(-235.6501, -834.8258, 139.7790)
        if IsValidInterior(interiorID) then      
                -- EnableInteriorProp(interiorID, "normal")
                -- EnableInteriorProp(interiorID, "red")
                -- EnableInteriorProp(interiorID, "blue")
                -- EnableInteriorProp(interiorID, "orange")
                EnableInteriorProp(interiorID, "marble")
        RefreshInterior(interiorID)
    
        end
    
    end)


  local emitters = {
    
    "se_dlc_apt_yacht_bedroom",
  }
  
  CreateThread(function()

      RegisterCommand('ep', function(src,args) --Enable Prop
        local type = (args[1])
        EnableInteriorProp(interiorID, type)
        RefreshInterior(interiorID)
      end)
      RegisterCommand('dp', function(src,args) --Disable Prop
        local type = (args[1])
        DisableInteriorProp(interiorID, type)
        RefreshInterior(interiorID)
      end)
    end)


  Citizen.CreateThread(function()
    for i = 1, #emitters do
      SetStaticEmitterEnabled(emitters[i], false)
    end
  end)

local autoexbbmin, autoexbbmax = vec3(-841.02080000, -1460.62720000, -395.61740000), vec3(399.73986800, -219.04882800, 610.03120000)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
  AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end

local autoexbbmin, autoexbbmax = vec3(-890.29693600, -1485.16382000, -405.83790000), vec3(434.88990000, -159.10302700, 602.32794200)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
  AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end
