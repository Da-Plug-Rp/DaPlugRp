Citizen.CreateThread(function()


    RequestIpl("qua_adez_k_milo")
    
        interiorID = GetInteriorAtCoords(-891.72, -443.65, -21.99)
            
        
        if IsValidInterior(interiorID) then      
                EnableInteriorProp(interiorID, "esyali")
                --EnableInteriorProp(interiorID, "kirmizi")
                -- EnableInteriorProp(interiorID, "mavi")
                -- EnableInteriorProp(interiorID, "mor")
                 EnableInteriorProp(interiorID, "turuncu")
                
        RefreshInterior(interiorID)
    
        end
    
    end)
  
    local emitters = {
      
      "se_dlc_apt_yacht_bedroom",
    }
    
    Citizen.CreateThread(function()
      for i = 1, #emitters do
        SetStaticEmitterEnabled(emitters[i], false)
      end
    end)
  
  local autoexbbmin, autoexbbmax = vec3(-1539.33838, -1089.92834, -523.3823), vec3(-246.444824, 203.5585, 480.090851)
  if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
    AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
  end

--     RegisterCommand("test", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     local interiorHash = GetInteriorFromEntity(ped)
--     if test then
--         test = false
--         RefreshInterior(interiorHash)
--         DisableInteriorProp(interiorHash, "black")
--     else
--         test = true
--         RefreshInterior(interiorHash)
--         EnableInteriorProp(interiorHash, "blue")
--     end
-- end, false)