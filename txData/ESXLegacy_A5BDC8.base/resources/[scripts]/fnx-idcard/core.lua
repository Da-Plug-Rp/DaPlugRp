function isESXCore()
	if Config.Core == 'ESX' then
		return true
	end
	return false
end

function isQBCore()
	if Config.Core == 'QB' then
		return true
	end
	return false
end


if Config.Inventory =='qs' then
    QS = nil
    TriggerEvent('qs-core:getSharedObject', function(obj) QS = obj end)
end


if isESXCore() then
	ESX = exports.es_extended:getSharedObject()	
elseif isQBCore() then
	QBCore = exports['qb-core']:GetCoreObject()
end

function GetClosestPlayer() 
	if isESXCore() then
		return ESX.Game.GetClosestPlayer()
	elseif isQBCore() then
		return QBCore.Functions.GetClosestPlayer()
	end
end

function Notify(type,text)
    if Config.ox_lib_Notify then
        lib.notify({type = type, description = text})
    elseif Config.CustomNotify then
        --INSERT CUSTOM NOTIFY
    else
        if isESXCore() then
            ESX.ShowNotification(text)
        elseif isQBCore() then
            TriggerEvent('QBCore:Notify', text, type, 2000)
        end
    end
end

function ServerNotify(source,type,text)
    if Config.ox_lib_Notify then
        TriggerClientEvent('ox_lib:notify',source, {type = type, description = text})
    elseif Config.CustomNotify then
        --INSERT CUSTOM NOTIFY
    else
        if isESXCore() then
            TriggerClientEvent('esx:showNotification', source, text)
        elseif isQBCore() then
            TriggerClientEvent('QBCore:Notify',source, text, type, 2000)
        end
    end
end

function ServerGetPlayer(source)
    if isESXCore() then
        return ESX.GetPlayerFromId(source)
    elseif isQBCore() then
        return QBCore.Functions.GetPlayer(source)
    end
end


