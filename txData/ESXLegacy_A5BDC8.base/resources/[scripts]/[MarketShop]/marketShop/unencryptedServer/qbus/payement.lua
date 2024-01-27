if string.lower(FrameWork) ~= "qb" and string.lower(FrameWork) ~= "qbus" and string.lower(FrameWork) ~= "qbcore" then 
	return
end

local QBCore = exports['qb-core']:GetCoreObject()
RegisterServerEvent('marketShop:PaidCashReg')
AddEventHandler('marketShop:PaidCashReg', function(data)
	local player = source
	local handle = tonumber(data.handle)
	Citizen.CreateThread(function()
		local locplayer = player
		local cashRegHandle = handle
		aff("^1PaidCashReg^7 "..tostring(cashRegHandle))
		
		local item = GetItemInCashReg(handle)
		
		local Player = QBCore.Functions.GetPlayer(player)
		local cashBalance = Player.PlayerData.money["cash"]
		local bankBalance = Player.PlayerData.money["bank"]
		local value = getPriceToPaidForCashReg(cashRegHandle)
		aff("getPaidStatusForCashReg : "..tostring(getPaidStatusForCashReg(cashRegHandle)).." getPaidStatusForCashReg2 : "..tostring(getPaidStatusForCashReg2(cashRegHandle)).." value: "..tostring(getPriceToPaidForCashReg(cashRegHandle)))
		if value > -1 then
			if getPaidStatusForCashReg(cashRegHandle) == false and getPaidStatusForCashReg2(cashRegHandle) == true then
				aff("a")
				if cashBalance >= value then
					aff("b")
					Player.Functions.RemoveMoney("cash", value)
					exports['qb-management']:AddMoney("supermarket", tonumber(value))
					TriggerClientEvent("marketShop:CLIBipPaid", -1, cashRegHandle)
					setPaidForCashReg(cashRegHandle)
				elseif bankBalance >= value then
					aff("c")
					Player.Functions.RemoveMoney("bank", value)
					exports['qb-management']:AddMoney("supermarket", tonumber(value))
					TriggerClientEvent("marketShop:CLIBipPaid", -1, cashRegHandle)
					setPaidForCashReg(cashRegHandle)
					-- TriggerEvent("marketShop:takeOutGarage", cashRegHandle)
				else
					aff("d")
					TriggerClientEvent("marketShop:notif",player,TRAD["Trad-PasThuneTitle"],TRAD["Trad-PasThune"],"box","#FF0000")
					-- TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_enough"), 'error')
				end
			else
				aff("e")
				if getPaidStatusForCashReg(cashRegHandle) == true then
					aff("f")
					TriggerClientEvent("marketShop:notif",player,TRAD["Trad-DejaPayerTitle"],TRAD["Trad-DejaPayer"],"box","#FF0000")
				end
				if getPaidStatusForCashReg2(cashRegHandle) == false then
					aff("g")
					TriggerClientEvent("marketShop:notif",player,TRAD["Trad-RienPayerTitle"],TRAD["Trad-RienPayer"],"box","#FF0000")
				end
			end
		end
	end)
end)

RegisterServerEvent('marketShop:PaidAutoCashReg')
AddEventHandler('marketShop:PaidAutoCashReg', function(data)
	local player = source
	local handle = tonumber(data.handle)
	Citizen.CreateThread(function()
		local locplayer = player
		local cashRegHandle = handle
		aff("^1PaidAutoCashReg^7 "..tostring(cashRegHandle))
		
		local item = GetItemInAutoCashReg(handle)
		
		local Player = QBCore.Functions.GetPlayer(locplayer)
		local cashBalance = Player.PlayerData.money["cash"]
		local bankBalance = Player.PlayerData.money["bank"]
		local value = getPriceToPaidForAutoCashReg(cashRegHandle)
		
		aff("getPaidStatusForAutoCashReg : "..tostring(getPaidStatusForAutoCashReg(cashRegHandle)).." getPaidStatusForAutoCashReg2 : "..tostring(getPaidStatusForAutoCashReg2(cashRegHandle)).." value: "..tostring(getPriceToPaidForAutoCashReg(cashRegHandle)))
		if value > -1 then
			aff("value: "..tostring(value))
			if getPaidStatusForAutoCashReg(cashRegHandle) == false and getPaidStatusForAutoCashReg2(cashRegHandle) == true then
				aff("a")
				if cashBalance >= value then
					aff("b")
					Player.Functions.RemoveMoney("cash", value)
					exports['qb-management']:AddMoney("supermarket", tonumber(value))
					TriggerClientEvent("marketShop:CLIBipAutoPaid", -1, cashRegHandle)
					setPaidForAutoCashReg(cashRegHandle)
				elseif bankBalance >= value then
					aff("c")
					Player.Functions.RemoveMoney("bank", value)
					exports['qb-management']:AddMoney("supermarket", tonumber(value))
					TriggerClientEvent("marketShop:CLIBipAutoPaid", -1, cashRegHandle)
					setPaidForAutoCashReg(cashRegHandle)
					-- TriggerEvent("marketShop:takeOutGarage", cashRegHandle)
				else
					aff("d")
					TriggerClientEvent("marketShop:notif",locplayer,TRAD["Trad-PasThuneTitle"],TRAD["Trad-PasThune"],"box","#FF0000")
					-- TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_enough"), 'error')
				end
			else
				aff("e")
				if getPaidStatusForAutoCashReg(cashRegHandle) == true then
					aff("f")
					TriggerClientEvent("marketShop:notif",locplayer,TRAD["Trad-DejaPayerTitle"],TRAD["Trad-DejaPayer"],"box","#FF0000")
				end
				if getPaidStatusForAutoCashReg2(cashRegHandle) == false then
					aff("g")
					TriggerClientEvent("marketShop:notif",locplayer,TRAD["Trad-RienPayerTitle"],TRAD["Trad-RienPayer"],"box","#FF0000")
				end
			end
		end
	end)
end)