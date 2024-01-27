

-- affError("TEST FRAMEWORK DEFINE : ESX : "..tostring(FrameWork))
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


if string.lower(JobManagement) == "esx_society" then

	if GetResourceState("esx_society") ~= 'missing' then
		TriggerEvent('esx_society:registerSociety', 'supermarket', 'Super Market', 'society_supermarket', 'society_supermarket',
			'society_supermarket', { type = 'public' })
	end


	function RemoveMoneyFromEntreprise(price)
		local moneyRemoved = false
		
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_supermarket', function(account)
			account.removeMoney(price)
			moneyRemoved = true
		end)

		return moneyRemoved
	end
	
	function AddMoneyToEntreprise(price)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_supermarket', function(account)
			account.addMoney(price)
		end)
	end

	-- TriggerEvent("marketShop:CleaningPay",player)
	RegisterServerEvent('marketShop:CleaningPay')
	AddEventHandler('marketShop:CleaningPay', function(player)
		local xPlayer = ESX.GetPlayerFromId(player)
		if RemoveMoneyFromEntreprise(CleaningPrice) then
			xPlayer.addAccountMoney("bank", CleaningPrice, "")
		else
			TriggerClientEvent("marketShop:notif",player,TRAD["Trad-NoEnterpriseMoneyTitle"],TRAD["Trad-NoEnterpriseMoney"],"box","#FF0000")
		end
		
	end)
end

if string.lower(JobManagement) == "bcs_companymanager" then

	TriggerEvent('esx_society:registerSociety', 'supermarket', 'Super Market', 'society_supermarket', 'society_supermarket',
			'society_supermarket', { type = 'public' })
	
	function RemoveMoneyFromEntreprise(price)
		local moneyRemoved = false
		local companyAccount = exports['bcs_companymanager']:GetAccount('supermarket')
		if companyAccount.money >= price then
			companyAccount.removeMoney('money', price)
			moneyRemoved = true
		end


		
		return moneyRemoved
	end
	
	
	function AddMoneyToEntreprise(price)
		local companyAccount = exports['bcs_companymanager']:GetAccount('supermarket')
		if companyAccount.money >= price then
			companyAccount.addMoney('money', price)
			moneyRemoved = true
		end
	end
	
	-- TriggerEvent("marketShop:CleaningPay",player)
	RegisterServerEvent('marketShop:CleaningPay')
	AddEventHandler('marketShop:CleaningPay', function(player)
		local xPlayer = ESX.GetPlayerFromId(player)
		if RemoveMoneyFromEntreprise(CleaningPrice) then
			xPlayer.addAccountMoney("bank", CleaningPrice, "")
		else
			TriggerClientEvent("marketShop:notif",player,TRAD["Trad-NoEnterpriseMoneyTitle"],TRAD["Trad-NoEnterpriseMoney"],"box","#FF0000")
		end
		
	end)
end