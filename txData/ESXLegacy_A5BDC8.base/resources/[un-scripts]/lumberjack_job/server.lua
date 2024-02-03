Config = nil

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('wood', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('wood', 1)
RegisterServerEvent('lumberjack:collectWood')
AddEventHandler('lumberjack:collectWood', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('wood', 1)  -- Adjust the item name if needed
end)

end)

RegisterServerEvent('lumberjack:reward')
AddEventHandler('lumberjack:reward', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local payment = math.random(50, 100) -- Adjust the payment as needed
    xPlayer.addMoney(payment)
    TriggerClientEvent('esx:showNotification', source, 'You earned $' .. payment .. ' for your hard work.')
end)
