RegisterNetEvent('esx_cigarette:startSmoking')
AddEventHandler('esx_cigarette:startSmoking', function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true)
        Citizen.Wait(120000)
        ClearPedTasksImmediately(ped)
    else
        ESX.ShowNotification("Du kannst im Fahrzeug nicht rauchen!")
    end
end)

RegisterNetEvent('esx_lighter:startFire')
AddEventHandler('esx_lighter:startFire', function()
    -- Hier können Sie Code hinzufügen, um eine Feuerzeug-Animation zu starten
end)
