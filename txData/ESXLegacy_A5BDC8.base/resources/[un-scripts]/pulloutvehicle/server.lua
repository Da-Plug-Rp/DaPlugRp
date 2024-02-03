ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("esx_vehiclepull:pullPlayerOut")
AddEventHandler("esx_vehiclepull:pullPlayerOut", function(target)
    local xPlayer = ESX.GetPlayerFromId(target)
    
    if xPlayer then
        TriggerClientEvent("esx_vehiclepull:doPullPlayerOut", xPlayer.source)
    end
end)

RegisterServerEvent("esx_vehiclepull:getPulledPlayer")
AddEventHandler("esx_vehiclepull:getPulledPlayer", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        TriggerClientEvent("esx_vehiclepull:setPulledPlayer", source, xPlayer.source)
    end
end)
