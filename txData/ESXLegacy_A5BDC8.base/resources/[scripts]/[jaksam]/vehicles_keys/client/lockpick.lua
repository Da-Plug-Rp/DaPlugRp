local LOCKPICK_ATTEMPTS = 5

RegisterNetEvent(Utils.eventsPrefix .. "useLockpick", function() 
    local vehicle = Framework.getClosestVehicle(3.0)
    if(not vehicle) then notifyClient(getLocalizedText("no_vehicles_available")) return end

    if(GetVehicleDoorLockStatus(vehicle) ~= 2) then notifyClient(getLocalizedText("not_locked")) return end

    local canDo = TriggerServerPromise(Utils.eventsPrefix .. ":useLockpick")
    if(not canDo) then return end

    local plyPed = PlayerPedId()

    TaskTurnPedToFaceEntity(plyPed, vehicle, 2000)

    Citizen.Wait(2000)

    local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    local animName = "machinic_loop_mechandplayer"

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(10)
    end

    TaskPlayAnim(plyPed, animDict, animName, 8.0, 8.0, -1, 17, 1.0, false, false, false)

    --[[ Lockpick minigame ]]
    local resName = EXTERNAL_SCRIPTS_NAMES["lockpick"]
    
    if(GetResourceState(resName) ~= "started") then
        notifyClient("Check F8")
        print("^1To use the lockpick minigame, you need ^3lockpick^1 to be ^2installed and started^1, you can change the script folder name in ^3integrations/sh_integrations.lua^1")
        print("^1FOLLOW THE SCRIPT INSTALLATION TUTORIAL TO FIND IT^7")
        return false
    end

    local successful = exports[resName]:startLockpick(LOCKPICK_ATTEMPTS)

    -- Cleanup
    ClearPedTasks(plyPed)
    RemoveAnimDict(animDict)

    if(not successful) then return end

    SetVehicleNeedsToBeHotwired(vehicle, false)
    TriggerServerEvent(Utils.eventsPrefix .. ":vehicleLockpicked", VehToNet(vehicle))
end)