local engineState = false

RegisterCommand(Config.EngineToggleCommand, function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if DoesEntityExist(vehicle) and GetVehicleClass(vehicle) ~= 13 then
        engineState = not engineState
        TriggerServerEvent('esx_engine_toggle:toggleEngine', engineState)
    else
        TriggerEvent('chatMessage', '^1Error: You are not in a vehicle or it is not a car.')
    end
end, false)

RegisterNetEvent('esx_engine_toggle:startOrStopEngine')
AddEventHandler('esx_engine_toggle:startOrStopEngine', function(state)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if DoesEntityExist(vehicle) and GetVehicleClass(vehicle) ~= 13 then
        SetVehicleEngineOn(vehicle, state, false, true)
        local message = state and '^2Engine started.' or '^1Engine stopped.'
        TriggerEvent('chatMessage', message)
    end
end)
