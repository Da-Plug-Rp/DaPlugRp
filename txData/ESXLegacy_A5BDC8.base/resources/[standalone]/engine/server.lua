RegisterServerEvent('esx_engine_toggle:toggleEngine')
AddEventHandler('esx_engine_toggle:toggleEngine', function(state)
    local player = source
    TriggerClientEvent('esx_engine_toggle:startOrStopEngine', player, state)
end)
