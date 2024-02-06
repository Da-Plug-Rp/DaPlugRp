ESX = ESX or nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1000)
    end
    while ESX.GetPlayerData() == nil do
        Citizen.Wait(1000)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(1000)
    end
end)

RegisterNetEvent('fs_clothingitem:notify')
AddEventHandler('fs_clothingitem:notify', function(msg)
    ESX.ShowNotification(msg)
end)

