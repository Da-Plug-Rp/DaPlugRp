if string.lower(FrameWork) ~= "es" and string.lower(FrameWork) ~= "esx" then 
	return
end

local ESX = nil
Citizen.CreateThread(function()
   while ESX == nil do
      ESX = exports['es_extended']:getSharedObject()
      Citizen.Wait(10)
      if not ESX then 
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      end
   end
end)



RegisterServerEvent('marketShop:PaidCashReg')
AddEventHandler('marketShop:PaidCashReg', function(data)
	local player = source
	local handle = tonumber(data.handle)
	Citizen.CreateThread(function()
		local locplayer = player
		local cashRegHandle = handle
		aff("^1PaidCashReg^7 "..tostring(cashRegHandle))
		
		local item = GetItemInCashReg(handle)
		
		local xPlayer = ESX.GetPlayerFromId(player)
		local cashBalance = xPlayer.getMoney()
		local bankBalance = xPlayer.getAccount('bank').money
		local value = getPriceToPaidForCashReg(cashRegHandle)
		aff("getPaidStatusForCashReg : "..tostring(getPaidStatusForCashReg(cashRegHandle)).." getPaidStatusForCashReg2 : "..tostring(getPaidStatusForCashReg2(cashRegHandle)).." value: "..tostring(getPriceToPaidForCashReg(cashRegHandle)))
		if value > -1 then
			if getPaidStatusForCashReg(cashRegHandle) == false and getPaidStatusForCashReg2(cashRegHandle) == true then
				aff("a")
				if cashBalance >= value then
					aff("b")
					xPlayer.removeMoney(value, "")
					AddMoneyToEntreprise(tonumber(value))
					TriggerClientEvent("marketShop:CLIBipPaid", -1, cashRegHandle)
					setPaidForCashReg(cashRegHandle)
				elseif bankBalance >= value then
					aff("c")
					xPlayer.removeAccountMoney('bank', value, "")
					AddMoneyToEntreprise(tonumber(value))
					TriggerClientEvent("marketShop:CLIBipPaid", -1, cashRegHandle)
					setPaidForCashReg(cashRegHandle)
				else
					aff("d")
					TriggerClientEvent("marketShop:notif",player,TRAD["Trad-PasThuneTitle"],TRAD["Trad-PasThune"],"box","#FF0000")
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
		
		local xPlayer = ESX.GetPlayerFromId(player)
		local cashBalance = xPlayer.getMoney()
		local bankBalance = xPlayer.getAccount('bank').money
		local value = getPriceToPaidForAutoCashReg(cashRegHandle)
		
		aff("getPaidStatusForAutoCashReg : "..tostring(getPaidStatusForAutoCashReg(cashRegHandle)).." getPaidStatusForAutoCashReg2 : "..tostring(getPaidStatusForAutoCashReg2(cashRegHandle)).." value: "..tostring(getPriceToPaidForAutoCashReg(cashRegHandle)))
		if value > -1 then
			aff("value: "..tostring(value))
			if getPaidStatusForAutoCashReg(cashRegHandle) == false and getPaidStatusForAutoCashReg2(cashRegHandle) == true then
				aff("a")
				if cashBalance >= value then
					aff("b")
					xPlayer.removeMoney(value, "")
					AddMoneyToEntreprise(tonumber(value))
					TriggerClientEvent("marketShop:CLIBipAutoPaid", -1, cashRegHandle)
					setPaidForAutoCashReg(cashRegHandle)
				elseif bankBalance >= value then
					aff("c")
					xPlayer.removeAccountMoney('bank', value, "")
					AddMoneyToEntreprise(tonumber(value))
					TriggerClientEvent("marketShop:CLIBipAutoPaid", -1, cashRegHandle)
					setPaidForAutoCashReg(cashRegHandle)
				else
					aff("d")
					TriggerClientEvent("marketShop:notif",locplayer,TRAD["Trad-PasThuneTitle"],TRAD["Trad-PasThune"],"box","#FF0000")
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