ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

local storages = {}

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
    saveStorages(false)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    Citizen.SetTimeout(60000*10, function()
        saveStorages(true)
    end)
end)






AddEventHandler('playerDropped', function (reason)
     local _source = source
    local identifier = nil 
    for k,v in ipairs(GetPlayerIdentifiers(_source)) do
		if string.match(v, 'steam:') then
			identifier = string.sub(v, 9)
			break
		end
	end
    if storages[identifier] then 
        saveStorage(identifier) 
    end
end)

function saveStorage(identifier) 
    MySQL.Sync.execute('UPDATE dh_storage SET tables = @tables WHERE identifier = @identifier', {
        ['@identifier'] = identifier,
        ['@tables'] = json.encode(storages[identifier]),
    })
    Wait(2000)
    storages[identifier] = nil
end

function saveStorages(bool)
    for k,v in pairs(storages) do 
          MySQL.Sync.execute('UPDATE dh_storage SET tables = @tables WHERE identifier = @identifier', {
                ['@identifier'] = k,
                ['@tables'] = json.encode(storages[k]),
            })
    end
    if bool then 
        Citizen.SetTimeout(60000*10, function()
            saveStorages(true)
        end)
    end
end




AddEventHandler('esx:playerLoaded', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local storage = MySQL.Sync.fetchScalar('SELECT tables FROM dh_storage WHERE identifier = @identifier', { ["@identifier"] = xPlayer.identifier})
    if storage then
        storages[xPlayer.identifier] = json.decode(storage)
        TriggerClientEvent('dh_storage:boughtCheck', _source)
    end

end)



RegisterCommand("saveStorages", function(source,args,player)
    if source == 0 then 
        saveStorages(false)
    end
end)


RegisterServerEvent('dh_storage:buyStorage')
AddEventHandler('dh_storage:buyStorage', function(item,przerob)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        xPlayer.removeAccountMoney('bank', Config.Price)
        local justtable = {
                items = {},
                money = 0
            }
        local resultxd = MySQL.Sync.execute('INSERT INTO dh_storage (identifier, tables) VALUES (@identifier, @tables)', {
            ['@identifier'] = xPlayer.identifier,
            ['@tables'] = json.encode(justtable),
        })
        if resultxd == 1 or resultxd == '1' then 
            storages[xPlayer.identifier] = {
                items = {},
                money = 0
            }
            TriggerClientEvent('dh_storage:boughtCheck', _source)
        end
        
end)

RegisterServerEvent('dh_storage:money')
AddEventHandler('dh_storage:money', function(type, amount)
     local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local money = storages[xPlayer.identifier].money
    if type == "inMoney" then 
        if xPlayer.getAccount('black_money').money >= amount then 
            storages[xPlayer.identifier].money = money + amount
            xPlayer.removeAccountMoney('black_money', amount)
        end
        Citizen.Wait(200)
        TriggerClientEvent('dh_storage:openStorage', _source,"open" ,storages[xPlayer.identifier], xPlayer.inventory)
    elseif type == "outMoney" then 
        if money >= amount then 
            storages[xPlayer.identifier].money = money - amount
            xPlayer.addAccountMoney('black_money', amount)
        end
        Citizen.Wait(200)
        TriggerClientEvent('dh_storage:openStorage', _source,"open" ,storages[xPlayer.identifier], xPlayer.inventory)
    end
end)

RegisterServerEvent('dh_storage:openStorage')
AddEventHandler('dh_storage:openStorage', function(item,przerob)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('dh_storage:openStorage', _source,"open" ,storages[xPlayer.identifier], xPlayer.inventory)
end)

RegisterServerEvent('dh_storage:getItem')
AddEventHandler('dh_storage:getItem', function(item,count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local countCache = storages[xPlayer.identifier].items[item].count
    if countCache >= count then 
        if countCache - count <= 0 then 
            storages[xPlayer.identifier].items[item] = nil
        else 
            storages[xPlayer.identifier].items[item].count = storages[xPlayer.identifier].items[item].count - count
        end
        xPlayer.addInventoryItem(item, count)
        Citizen.Wait(200)
        xPlayer = ESX.GetPlayerFromId(_source)
        TriggerClientEvent('dh_storage:openStorage',_source,"out", storages[xPlayer.identifier], xPlayer.inventory)
    else 
        TriggerClientEvent('dh_storage:openStorage',_source,"out", storages[xPlayer.identifier], xPlayer.inventory)
    end
end)


RegisterServerEvent('dh_storage:putItem')
AddEventHandler('dh_storage:putItem', function(item,count, label)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local items = xPlayer.getInventoryItem(item).count 
    if items >= count then 
        xPlayer.removeInventoryItem(item, count)
        if not storages[xPlayer.identifier].items[item] then 
            storages[xPlayer.identifier].items[item] = {
                count = count, 
                label = label
            }
        else
            storages[xPlayer.identifier].items[item].count = storages[xPlayer.identifier].items[item].count + count
        end
            Citizen.Wait(200)
            xPlayer = ESX.GetPlayerFromId(_source)
            TriggerClientEvent('dh_storage:openStorage',_source,"in", storages[xPlayer.identifier], xPlayer.inventory)
        else
            TriggerClientEvent('dh_storage:openStorage',_source,"in", storages[xPlayer.identifier], xPlayer.inventory)
        end
    
end)

