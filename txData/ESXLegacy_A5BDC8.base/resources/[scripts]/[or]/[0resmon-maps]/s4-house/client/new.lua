objlist = {}
evobjlist = {}
testmode = false
registerprop = false
currentcacheobj = nil
local Task = {}
local objname
local obj, oobj, cacheObj

RegisterNUICallback("showProp", function(data, cb)
    if data.prop then 
        coords = GetEntityCoords(GetPlayerPed(-1))
        oobj = CreateObject(GetHashKey(data.prop), coords.x, coords.y+1.0, coords.z, false, false, false)
        SetEntityCollision(oobj, false, true)
        table.insert(objlist, oobj)
        StartDecor(oobj)
        testmode = true
        off = true
        disableControls()
        SetCursorLocation(0.5, 0.5)
    end
 end)

 RegisterNUICallback("buyProp", function(data, cb)
    if data.prop then 
        R.TriggerServerCallback('s4-house:server:canBuyProp', function(x)
            if x == false then return end
            objname = data.prop
            coords = GetEntityCoords(GetPlayerPed(-1))
            cacheObj = CreateObject(GetHashKey(data.prop), coords.x, coords.y+1.0, coords.z, false, false, false)
            SetEntityCollision(cacheObj, false, true)
            table.insert(objlist, cacheObj)
            StartDecor(cacheObj)
            off = true
            registerprop = true
            disableControls()
            SetCursorLocation(0.5, 0.5)
        end, data.prop)
    end
 end)
 

 RegisterNUICallback("replaceProp", function(data, cb)
    if data.prop then 
        currentcacheobj = data.prop
        prop = evobjlist[data.prop]
        Task[1] = prop
        Citizen.CreateThread(TaskDeleteEntitiy)
        objname = prop.prop
        coords = GetEntityCoords(GetPlayerPed(-1))
        cacheObj = CreateObject(GetHashKey(prop.prop), coords.x, coords.y+1.0, coords.z, false, false, false)
        SetEntityCollision(cacheObj, false, true)
        table.insert(objlist, cacheObj)
        StartDecor(cacheObj)
        off = true
        registerprop = false
        disableControls()
        SetCursorLocation(0.5, 0.5)
    end
 end)

 RegisterNUICallback("changeLocProp", function(data, cb)
    if data.prop then 
        currentcacheobj = data.prop
        prop = evobjlist[data.prop]
        Task[1] = prop
        Citizen.CreateThread(TaskDeleteEntitiy)
        objname = prop.prop
        coords = prop.coord
        cacheObj = CreateObject(GetHashKey(prop.prop), coords.x, coords.y, coords.z, false, false, false)
        SetEntityRotation(obj, prop.rot.x,  prop.rot.y, prop.rot.z, 2, true)
        SetEntityCollision(cacheObj, false, true)
        table.insert(objlist, cacheObj)
        StartDecor(cacheObj)
        off = true
        registerprop = false
        disableControls()
        SetCursorLocation(0.5, 0.5)
    end
 end)


 
 TaskDeleteEntitiy = function()
    deleted = false
 
    while #Task ~= 0 do 

       DeleteObject(Task[1].pid)
       DeleteEntity(Task[1].pid)
       if DoesEntityExist(Task[1].pid) then
            SetEntityAsMissionEntity(Task[1].pid, true, true)
            DeleteEntity(Task[1].pid)
       else 
          deleted = true
       end

       if deleted == true then 
          Task = {}
          break;
       end

       Citizen.Wait(0)
    end
 end

 marker = false
 RegisterNUICallback("marker", function(data, cb)
    if #evobjlist ~= 0 then 
       marker = not marker
       Citizen.CreateThread(MarkerThread)
    else 
       TriggerEvent("0r-core:notif", { type = "error", text = "You have no furniture!"  })
    end
 end)

 MarkerThread = function()
    while marker do 
       AddTextEntry('HelpMsg', Config.Lang.helper_text)
       BeginTextCommandDisplayHelp('HelpMsg')
       EndTextCommandDisplayHelp(0, false, true, -1)
       pCoords = GetEntityCoords(PlayerPedId())
       for k,v in pairs(evobjlist) do
      
        DrawMarker(2, v.coord.x, v.coord.y, v.coord.z + 1.5, 0.0, 0.0, 0.0, 0.0, 180.0, rotz + 0.1, 0.5, 0.5, 0.5, 50, 255, 51, 255, false, false, 2, nil, nil, false)
        mdist =  #(vector3(v.coord.x, v.coord.y, v.coord.z) - pCoords)
        if mdist < 1.40 then 
           DrawText3D(v.coord.x, v.coord.y, v.coord.z + 0.5, Config.Lang.markar_props..GetPropInfo(v.prop).price)

           if IsControlJustPressed(0, Config.Keys["location"]) then 
              MarkerDisable(v, "loc")
              Wait(1000)
           end

           if IsControlJustPressed(0, Config.Keys["replace"]) then 
              MarkerDisable(v, "replace")
              Wait(1000)
           end

           if IsControlJustPressed(0, Config.Keys["sell"]) then 
             MarkerDisable(v, "sell")
             Wait(1000)
           end
           
        end
       end
       Citizen.Wait(0)
    end
 end

 MarkerDisable = function(data, type)
    x = {
       ["loc"] = function()
            currentcacheobj = data.id
            prop = evobjlist[data.id]
            Task[1] = prop
            Citizen.CreateThread(TaskDeleteEntitiy)
            objname = prop.prop
            coords = prop.coord
            cacheObj = CreateObject(GetHashKey(prop.prop), coords.x, coords.y, coords.z, false, false, false)
            SetEntityRotation(obj, prop.rot.x,  prop.rot.y, prop.rot.z, 2, true)
            SetEntityCollision(cacheObj, false, true)
            table.insert(objlist, cacheObj)
            StartDecor(cacheObj)
            off = true
            registerprop = false
            disableControls()
            SetCursorLocation(0.5, 0.5)
       end,
       ["replace"] = function()
            currentcacheobj = data.id
            prop = evobjlist[data.id]
            Task[1] = prop
            Citizen.CreateThread(TaskDeleteEntitiy)
            objname = prop.prop
            coords = GetEntityCoords(GetPlayerPed(-1))
            cacheObj = CreateObject(GetHashKey(prop.prop), coords.x, coords.y+1.0, coords.z, false, false, false)
            SetEntityCollision(cacheObj, false, true)
            table.insert(objlist, cacheObj)
            StartDecor(cacheObj)
            off = true
            registerprop = false
            disableControls()
            SetCursorLocation(0.5, 0.5)
       end,
       ["sell"] = function()
            DeleteEntity(data.pid)
            TriggerServerEvent("s4-house:server:sellProp", evobjlist[data.id])
            table.remove(evobjlist, tonumber(data.id))
            TriggerServerEvent("s4-house:server:updateProps", CurId, evobjlist)
       end
    }
    x[type]()

    marker = false
    Citizen.CreateThread(MarkerThread)
 end




 RegisterNUICallback("yon", function(data, cb)
    if data.yon then 
        FunctionDecorMovement(data)
    end
 end)

 RegisterNUICallback("buyAlarm", function(data, cb)
    R.TriggerServerCallback('s4-house:server:buyAlarm', function(x)
        if x == true then 
            TriggerEvent("0r-core:notif", { type = "success", text = Config.Lang.success_alarm  })
        else 
            TriggerEvent("0r-core:notif", { type = "error", text = Config.Lang.error_alarm  })
        end
        return cb(x)
    end, CurId)
 end)

 RegisterNUICallback("removeAlarm", function(data, cb)
    TriggerServerEvent('s4-house:server:removeAlarm', CurId)
    TriggerEvent("0r-core:notif", { type = "success", text = Config.Lang.remove_alarm  })
 end)

 FunctionDecorMovement = function(data)
    if testmode == true then 
        obj = oobj
     else 
        obj = cacheObj
     end
     coords = GetEntityCoords(obj)
     rot = GetEntityRotation(obj, 2)
     x = {
       ["right"] = function()
           SetEntityCoords(obj, coords.x+data.multiplier, coords.y, coords.z)
       end,
       ["left"] = function()
           SetEntityCoords(obj, coords.x-data.multiplier, coords.y, coords.z)
       end,
       ["forward"] = function()
           SetEntityCoords(obj, coords.x, coords.y+data.multiplier, coords.z)
       end,
       ["back"] = function()
           SetEntityCoords(obj, coords.x, coords.y-data.multiplier, coords.z)
       end,
       ["up"] = function()
           SetEntityCoords(obj, coords.x, coords.y, coords.z+data.multiplier)
       end,
       ["down"] = function()
           SetEntityCoords(obj, coords.x, coords.y, coords.z-data.multiplier)
       end,
       ["rot_left"] = function()
           SetEntityRotation(obj, rot.x,  rot.y, rot.z+data.multiplier, 2, true)
       end,
       ["rot_right"] = function()
           SetEntityRotation(obj, rot.x,  rot.y, rot.z-data.multiplier, 2, true)
       end,
       ["rot_up"] = function()
           SetEntityRotation(obj, rot.x,  rot.y+data.multiplier, rot.z, 2, true)
       end,
       ["rot_yat_up"] = function()
           SetEntityRotation(obj, rot.x-data.multiplier,  rot.y, rot.z, 2, true)
       end,
       ["rot_yat_down"] = function()
           SetEntityRotation(obj, rot.x+data.multiplier,  rot.y, rot.z, 2, true)
       end,
       ["reset"] = function()
           SetEntityRotation(obj, 0.0, 0.0, 0.0, 2, true)
       end,
       ["ok"] = function()
           off = false
           disableControls()
           SetNuiFocus(0, 0)
           SetNuiFocusKeepInput(0)
           if testmode == true then 
               for k,v in pairs(objlist) do
                   DeleteEntity(v)
               end
               testmode = false
           else 
               c = GetOffsetFromEntityInWorldCoords(obj, 0.0, 0.0, -0.1)
               r = GetEntityRotation(obj)
               Wait(100)
               if registerprop == true then 
                  DeleteEntity(obj)
                  Wait(100)
                  TriggerServerEvent("s4-house:server:addNewProp", CurId, objname, vector3(c.x, c.y, c.z), r)
                  SetEntityCollision(obj, true, true)
               else 
                  prop = evobjlist[currentcacheobj]
                  table.remove(evobjlist, tonumber(currentcacheobj))
                  for k,v in pairs(evobjlist) do
                      if v.pid then v.pid = nil end
                      if v.id then v.id = nil end
                  end
                  table.insert(evobjlist, { prop = prop.prop, coord = vector3(c.x, c.y, c.z), rot = r, label = GetPropInfo(prop.prop).label })
                  TriggerServerEvent("s4-house:server:updateProps", CurId, evobjlist)
          
                  currentcacheobj = nil
                  Wait(100)
                  DeleteEntity(obj)
               end
               objname = nil
           end
       end,
     }
     x[data.yon]()
 end
 
 
 StartDecor = function(o) 
    if DoesEntityExist(o) then 
       SendNUIMessage({ action = "decor" })
       Wait(500)
       SetNuiFocus(1, 1)
       SetNuiFocusKeepInput(1)

    end
 end

 function msg(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
 end
 
 AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    for k,v in pairs(objlist) do
        DeleteEntity(v)
    end
  end)
  


local multiplier = 0.1
local waitval = 100
function disableControls()
 
    Citizen.CreateThread(function() 
       while off == true do
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee

            
           

            multitext = "\nMultiplier: "..multiplier..
            "\n + Multiplier ~INPUT_REPLAY_CYCLEMARKERLEFT~ - Multiplier ~INPUT_REPLAY_CYCLEMARKERRIGHT~"
            AddTextEntry('HelpMsg', Config.Lang.helper_text..multitext)
            BeginTextCommandDisplayHelp('HelpMsg')
            EndTextCommandDisplayHelp(0, false, true, -1)
            
            if IsControlJustPressed(0, Config.Keys["plus"]) then 
                multiplier = multiplier + 0.1
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["minus"]) then 
                if multiplier < 0.2 then multiplier = 0.1 end                 
                multiplier = multiplier - 0.1 
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["lift_up"]) then 
                FunctionDecorMovement({  yon = "up", multiplier = multiplier })
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["lift_down"]) then 
                FunctionDecorMovement({  yon = "down", multiplier = multiplier })
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["move_forward"]) then 
                FunctionDecorMovement({  yon = "forward", multiplier = multiplier })
                Wait(waitval)
            end
            
            if IsControlJustPressed(0, Config.Keys["move_back"]) then 
                FunctionDecorMovement({  yon = "back", multiplier = multiplier })
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["move_left"]) then 
                FunctionDecorMovement({  yon = "left", multiplier = multiplier })
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["move_right"]) then 
                FunctionDecorMovement({  yon = "right", multiplier = multiplier })
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["rot_left"]) then 
                FunctionDecorMovement({  yon = "rot_left", multiplier = multiplier })
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["rot_right"]) then 
                FunctionDecorMovement({  yon = "rot_right", multiplier = multiplier })
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["rot_up"]) then 
                FunctionDecorMovement({  yon = "rot_yat_up", multiplier = multiplier })
                Wait(waitval)
            end

            if IsControlJustPressed(0, Config.Keys["rot_down"]) then 
                FunctionDecorMovement({  yon = "rot_yat_down", multiplier = multiplier })
                Wait(waitval)
            end


         Citizen.Wait(0)
       end
    end)
 end