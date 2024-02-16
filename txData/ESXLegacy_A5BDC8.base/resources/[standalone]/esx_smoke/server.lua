ESX = nil

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('cigarette', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('cigarette', 1)

    TriggerClientEvent('esx_cigarette:startSmoking', source)
end)

ESX.RegisterUsableItem('lighter', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('esx_lighter:startFire', source)
end)
