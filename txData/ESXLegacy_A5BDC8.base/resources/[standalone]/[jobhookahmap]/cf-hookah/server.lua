
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
RegisterServerEvent('cf-hookah:server:setAlreadyHaveHookah')
AddEventHandler('cf-hookah:server:setAlreadyHaveHookah', function(masa, toggle)
    Config.Masalar[masa].alreadyHaveHookah = toggle
    TriggerClientEvent('cf-hookah:client:getConfig', -1,  Config.Masalar)
end)

RegisterServerEvent('cf-hookah:server:setSessionStarted')
AddEventHandler('cf-hookah:server:setSessionStarted', function(masa, toggle)
    Config.Masalar[masa].sessionActive = toggle
    TriggerClientEvent('cf-hookah:client:getConfig', -1,  Config.Masalar)
end)

RegisterServerEvent('cf-hookah:server:syncHookahTable')
AddEventHandler('cf-hookah:server:syncHookahTable', function(nargileler)
    TriggerClientEvent('cf-hookah:client:setHookahs', -1, nargileler)
end)

RegisterServerEvent("hookah_smokes")
AddEventHandler("hookah_smokes", function(entity)
	TriggerClientEvent("c_hookah_smokes", -1, entity)
end)

RegisterServerEvent('cf-hookah:server:deleteMarpuc')
AddEventHandler('cf-hookah:server:deleteMarpuc', function(masa)
    TriggerClientEvent('cf-hookah:client:deleteMarpuc', -1, masa)
end)

RegisterServerEvent('cf-hookah:server:deleteNargile')
AddEventHandler('cf-hookah:server:deleteNargile', function(masa)
    TriggerClientEvent('cf-hookah:client:deleteNargile', -1, masa)
end)


RegisterServerEvent('cf-hookah:server:syncKoz')
AddEventHandler('cf-hookah:server:syncKoz', function(obj, amount)
    TriggerClientEvent('cf-hookah:client:syncKoz', -1, obj, amount)
end)

function getFivemId(source)
    
    local identifiers = GetPlayerIdentifiers(source)
    local fivemid = nil

    for _, identifier in pairs(identifiers) do
        if (string.find(identifier, 'fivem:')) then
            fivemid = identifier
            return fivemid
        end
    end
    return fivemid
end


