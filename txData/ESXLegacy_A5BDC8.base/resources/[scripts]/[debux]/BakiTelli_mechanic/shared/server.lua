ESX = exports["es_extended"]:getSharedObject()

-------------------------------- 

RegisterServerEvent('BakiTelli_mechanic:SaveVehicleProps')
AddEventHandler('BakiTelli_mechanic:SaveVehicleProps', function(vehicleProps)
	if Config.AutoSQLSave then 
        ExecuteSql("UPDATE `owned_vehicles` SET vehicle = '"..json.encode(vehicleProps).."' WHERE plate = '"..vehicleProps.plate.."'")
    end
end)

function getMoney(src)
    local zrt = getplayer()
    local xPlayer = zrt(src)	
    if Config.Money == "cash" then 
        money = xPlayer.getMoney()
    else 
        money = xPlayer.getAccount("bank").money
    end
    return money
end

-------------------------------- 

function removeMoney(src, count)
    local zrt = getplayer()
    local xPlayer = zrt(src)	
    if Config.Money == "cash" then 
        xPlayer.removeMoney(count)
    else
        xPlayer.removeAccountMoney("bank", count)
    end
end

-------------------------------- 

function getplayer()
	xPlayer = ESX.GetPlayerFromId
	return xPlayer
end

-------------------------------- 

function nofity(source,text)
    local zrt = getplayer()
    local xPlayer = zrt(source)
    xPlayer.showNotification(text)
end

-------------------------------- 

function getidentifier(xPlayer)
	hex = xPlayer.identifier
	return hex
end

-------------------------------- 

function ExecuteSql(query)
    local IsBusy = true
    local result = nil
    if Config.Mysql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
            -------------------------------- 
        else
            MySQL.query(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
        -------------------------------- 
    elseif Config.Mysql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    elseif Config.Mysql == "mysql-async" then   
        MySQL.Async.fetchAll(query, {}, function(data)
            result = data
            IsBusy = false
        end)
        -------------------------------- 
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

------------------------------------------------------------------------------------

------------------------------------------------------------------------------------

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --

------------------------------------------------------------------------------------