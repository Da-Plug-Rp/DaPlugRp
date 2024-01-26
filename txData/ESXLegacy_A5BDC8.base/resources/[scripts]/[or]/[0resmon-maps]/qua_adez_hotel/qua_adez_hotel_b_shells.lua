Citizen.CreateThread(function()


    RequestIpl("qua_adez_b_milo")
    
        interiorID = GetInteriorAtCoords(-891.72, -443.65, -10.4308758)
            
        
        if IsValidInterior(interiorID) then      
                EnableInteriorProp(interiorID, "esyali")
             --   EnableInteriorProp(interiorID, "kirmizi")
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
  
  local autoexbbmin, autoexbbmax = vec3(-1549.25342, -1092.37793, -511.777161), vec3(-243.869263, 210.043121, 493.842651)
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