

-- affError("TEST FRAMEWORK DEFINE : QBUS : "..tostring(FrameWork))
if string.lower(FrameWork) ~= "qb" and string.lower(FrameWork) ~= "qbus" and string.lower(FrameWork) ~= "qbcore" then 
	return
end

affError("FRAMEWORK DEFINE : QBUS")
local QBCore = nil

QBCore = exports['qb-core']:GetCoreObject()

function RemoveMoneyFromEntreprise(price)
	local moneyRemoved = false
	
	if exports['qb-management']:RemoveMoney("supermarketsandy", price) then
		moneyRemoved = true
	end
	
	return moneyRemoved
end


-- TriggerEvent("marketShopSandy:CleaningPay",player)
RegisterServerEvent('marketShopSandy:CleaningPay')
AddEventHandler('marketShopSandy:CleaningPay', function(player)
	
	local Player = QBCore.Functions.GetPlayer(player)
	if RemoveMoneyFromEntreprise(CleaningPrice) then
		Player.Functions.AddMoney("bank", CleaningPrice)
	else
		TriggerClientEvent("marketShopSandy:notif",player,TRAD["Trad-NoEnterpriseMoneyTitle"],TRAD["Trad-NoEnterpriseMoney"],"box","#FF0000")
	end
	
end)
