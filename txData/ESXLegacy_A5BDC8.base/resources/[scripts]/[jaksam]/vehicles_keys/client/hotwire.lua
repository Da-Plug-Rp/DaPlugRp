function VehiclesKeys.playHotwireAnimation(duration)
    local plyPed = PlayerPedId()

    while not HasAnimDictLoaded(config.hotwireAnimDict) do
        RequestAnimDict(config.hotwireAnimDict)
        Citizen.Wait(0)
    end

    TaskPlayAnim(plyPed, config.hotwireAnimDict, config.hotwireAnimName, 4.0, 4.0, duration, 1, 0.0, 0, 0, 0)
end

-- You can edit this function if you want to add a minigame or anything
function VehiclesKeys.hotwireVehicle()
    Citizen.Wait(0)

    local plyPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(plyPed)

    local durationInMs = config.timeToHotwire * 1000
    local timeout = durationInMs + GetGameTimer()

    VehiclesKeys.playHotwireAnimation(durationInMs)
    Dialogs.startProgressBar(durationInMs, getLocalizedText("hotwiring_vehicle"))

    local message = getLocalizedText("press_to_cancel_hotwire")

    while GetGameTimer() < timeout do
        showHelpNotification(message)

        if(IsControlJustReleased(0, KEY_TO_HOTWIRE) or IsControlJustReleased(0, 75)) then
            Dialogs.stopProgressBar()
            ClearPedTasks(plyPed)
            return
        end

        Citizen.Wait(0)
    end

    if(math.random(1, 100) > config.hotwireProbabilityOfSuccess) then
        notifyClient(getLocalizedText("hotwire_failed"))
        return
    end

    SetVehicleEngineOn(vehicle, true, false, false)

    TriggerServerEvent(Utils.eventsPrefix .. ":vehicleHotwired", VehToNet(vehicle))    
end