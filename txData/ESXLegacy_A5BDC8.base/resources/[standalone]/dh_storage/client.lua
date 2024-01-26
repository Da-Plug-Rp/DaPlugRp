ESX = nil
bought = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)


AddEventHandler('onClientResourceStart', function (resourceName)
  if(GetCurrentResourceName() ~= resourceName) then
    return
  end
  Citizen.Wait(1000)

    for k, v in pairs(Config.Coords) do 
    local blip = AddBlipForCoord(v)
        SetBlipSprite (blip, 568)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 1.0)
        SetBlipColour (blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Storage")
        EndTextCommandSetBlipName(blip)
    end
end)




local playerPed = 0
local playerCoords = vector3(1.1, 1.1, 1.1)
RegisterNetEvent('dh_storage:boughtCheck')
AddEventHandler('dh_storage:boughtCheck', function(data, inventory)
    bought = true
end)

CreateThread(function()
    while true do 
        playerPed = GetPlayerPed(-1)
        playerCoords = GetEntityCoords(playerPed)
        Citizen.Wait(1000)
    end
end)
 
local opendid = nil
CreateThread(function()
    while true do 
        local sleep = 1000
        for k, v in pairs(Config.Coords) do 
            if #(playerCoords - v) <= 6.0 then 
                sleep = 1
                DrawMarker(6, v.x, v.y, v.z, 0.0, 0.0, 0.0, 90.0, 90.0, 90.0, 1.0, 1.0, 1.0, 0, 158, 189, 100, false, true, 2, false, false, false, false)
            end
            if #(playerCoords - v) <= 2.0 then 

                if IsControlJustReleased(0, 38) then  
                    opendid = nil
                    ESX.UI.Menu.CloseAll()
                    opendid = k
                    checkStorage()
                end
            else
                if opendid == k then
                    opendid = nil
                    ESX.UI.Menu.CloseAll()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function checkStorage()
    local elements = {}
    if not bought then 
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'schowek',
        {
            title    = 'Schowek',
            align    = 'center',
            elements = {
                {label = "Buy storage<font color='lightgreen'>$("..Config.Price..")</font>", value = "buy"},
                {label = "Back", value = 'back'}
            }
        }, function(data, menu)
            local action = data.current.value
            if action == 'buy' then
                menu.close()
                TriggerServerEvent("dh_storage:buyStorage")
            elseif action == 'back' then
                menu.close()
            end
        end, function(data, menu)
            menu.close()
        end)
    else 
        TriggerServerEvent("dh_storage:openStorage")
    end
end



RegisterNetEvent('dh_storage:openStorage')
AddEventHandler('dh_storage:openStorage', function(type,dataa, inventory)
    if type == "open" then 
        openStorage(dataa, inventory)
    elseif type == "out" then 
        outItemsStorage(dataa,inventory)
    elseif type == "in" then 
        inItemsStorage(dataa,inventory)
    end

end)


function openStorage(dataa, inventory)
    local elements = {}
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'schowek',
        {
            title    = 'Schowek',
            align    = 'center',
            elements = {
                {label = "Take item", value = "out"},
                {label = "Deposit item", value = 'in'},
                {label = "Account Balance  <font color='red'>$"..dataa.money.."</font>", value = 'stop'},
                {label = "Withdrawn black money", value = 'outMoney'},
                {label = "Deposit black money", value = 'inMoney'},
                {label = "Back", value = 'back'},
            }
        }, function(data, menu)
            menu.close()
            local action = data.current.value
            if action == 'out' then
                outItemsStorage(dataa,inventory)
            elseif action == 'in' then
                inItemsStorage(dataa,inventory)
            elseif action == 'inMoney' then
                Money('inMoney')
            elseif action == 'outMoney' then
                Money('outMoney')
            elseif action == "back" then
                menu.close()
            elseif action == "stop" then
                openStorage(dataa, inventory)
            end
            
        end, function(data, menu)
            menu.close()
        end)
end


function Money(type)
ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'menu1out',
{
    title = ('Amount')
    },
    function(data2, menu2)
     local amount = tonumber(data2.value)
        if amount == nil then
            ESX.ShowNotification('Wrong amount')
        else
            menu2.close()
            TriggerServerEvent('dh_storage:money', type, amount)
        end
    end,
    function(data2, menu2)
        menu2.close()
    end)
end

function outItemsStorage(dataa,inventory)
    local elements = {}
        for k,v in pairs(dataa['items']) do 
            table.insert(elements, {label = v.label.." | x"..v.count, count = v.count, name = k})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'outItems',
        {
            title    = 'Schowek',
            align    = 'center',
            elements = elements
        }, function(data, menu)
            local action = data.current

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'menu1out',
                {
                    title = ('Amount')
                },
                function(data2, menu2)
                    local amount = tonumber(data2.value)
                    if amount == nil then
                    ESX.ShowNotification('Wrong amount')
                    else
                        if action.count >= amount then 
                            menu2.close()
                            menu.close()
                            TriggerServerEvent('dh_storage:getItem', action.name, amount)
                        end
                    end
                end,
                function(data2, menu2)
                    menu2.close()
                end)

        end, function(data, menu)
            menu.close()
            openStorage(dataa, inventory)
        end)
end


function inItemsStorage(dataa,inventory)
    local elements = {}
    if #inventory > 0 then  
        for k,v in pairs(inventory) do 
            if v.count > 0 then 
                table.insert(elements, {label = v.label.." | x"..v.count, count = v.count, name = v.name, label2 = v.label})
            end
        end
    end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'schowekxd',
        {
            title    = 'Storage',
            align    = 'center',
            elements = elements
        }, function(data, menu)
            local action = data.current

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'menu1xd',
                {
                    title = ('Amount')
                },
                function(data2, menu2)
                    local amount = tonumber(data2.value)
                    if amount == nil then
                    ESX.ShowNotification('Wrong amount')
                    else
                        if action.count >= amount then 
                             menu2.close()
                            menu.close()
                            TriggerServerEvent('dh_storage:putItem', action.name, amount, action.label2)
                           
                        end
                    end
                end,
                function(data2, menu2)
                    menu2.close()
                end)

        end, function(data, menu)
            menu.close()
            openStorage(dataa, inventory)
        end)
end

