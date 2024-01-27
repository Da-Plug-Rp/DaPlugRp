if string.lower(FrameWork) ~= "other" then 
	return
end

-- local QBCore = exports['qb-core']:GetCoreObject()


---------------------------------------------------------------------------------------------------------------------------------
-- The two event bellow are triggered when you pay at a cahsregister/automatic cash register                                   --
-- This is here where player have to pay for their stuff so we remove player money and transfer it to the supermarket account  --
-- This is here where the audio of the cash reg payment is triggered                                                           --
-- This is here where we set the payment status of the casreg (setPaidForCashReg)                                              --
---------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('marketShopSandy:PaidCashReg')
AddEventHandler('marketShopSandy:PaidCashReg', function(data)
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
					exports['qb-management']:AddMoney("supermarketsandy", tonumber(value))
					TriggerClientEvent("marketShopSandy:CLIBipPaid", -1, cashRegHandle)
					setPaidForCashReg(cashRegHandle)
				elseif bankBalance >= value then
					aff("c")
					Player.Functions.RemoveMoney("bank", value)
					exports['qb-management']:AddMoney("supermarketsandy", tonumber(value))
					TriggerClientEvent("marketShopSandy:CLIBipPaid", -1, cashRegHandle)
					setPaidForCashReg(cashRegHandle)
					-- TriggerEvent("marketShopSandy:takeOutGarage", cashRegHandle)
				else
					aff("d")
					TriggerClientEvent("marketShopSandy:notif",player,TRAD["Trad-PasThuneTitle"],TRAD["Trad-PasThune"],"box","#FF0000")
					-- TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_enough"), 'error')
				end
			else
				aff("e")
				if getPaidStatusForCashReg(cashRegHandle) == true then
					aff("f")
					TriggerClientEvent("marketShopSandy:notif",player,TRAD["Trad-DejaPayerTitle"],TRAD["Trad-DejaPayer"],"box","#FF0000")
				end
				if getPaidStatusForCashReg2(cashRegHandle) == false then
					aff("g")
					TriggerClientEvent("marketShopSandy:notif",player,TRAD["Trad-RienPayerTitle"],TRAD["Trad-RienPayer"],"box","#FF0000")
				end
			end
		end
	end)
end)

RegisterServerEvent('marketShopSandy:PaidAutoCashReg')
AddEventHandler('marketShopSandy:PaidAutoCashReg', function(data)
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
					exports['qb-management']:AddMoney("supermarketsandy", tonumber(value))
					TriggerClientEvent("marketShopSandy:CLIBipAutoPaid", -1, cashRegHandle)
					setPaidForAutoCashReg(cashRegHandle)
				elseif bankBalance >= value then
					aff("c")
					Player.Functions.RemoveMoney("bank", value)
					exports['qb-management']:AddMoney("supermarketsandy", tonumber(value))
					TriggerClientEvent("marketShopSandy:CLIBipAutoPaid", -1, cashRegHandle)
					setPaidForAutoCashReg(cashRegHandle)
					-- TriggerEvent("marketShopSandy:takeOutGarage", cashRegHandle)
				else
					aff("d")
					TriggerClientEvent("marketShopSandy:notif",locplayer,TRAD["Trad-PasThuneTitle"],TRAD["Trad-PasThune"],"box","#FF0000")
					-- TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_enough"), 'error')
				end
			else
				aff("e")
				if getPaidStatusForAutoCashReg(cashRegHandle) == true then
					aff("f")
					TriggerClientEvent("marketShopSandy:notif",locplayer,TRAD["Trad-DejaPayerTitle"],TRAD["Trad-DejaPayer"],"box","#FF0000")
				end
				if getPaidStatusForAutoCashReg2(cashRegHandle) == false then
					aff("g")
					TriggerClientEvent("marketShopSandy:notif",locplayer,TRAD["Trad-RienPayerTitle"],TRAD["Trad-RienPayer"],"box","#FF0000")
				end
			end
		end
	end)
end)