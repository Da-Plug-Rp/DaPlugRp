if string.lower(FrameWork) ~= "other" then 
	return
end


affError("FRAMEWORK DEFINE : OTHER")
local QBCore = nil

--QBCore = exports['qb-core']:GetCoreObject()


----------------------------------------------------------------
-- Function To remove money from the supermarket bank account --
----------------------------------------------------------------

function RemoveMoneyFromEntreprise(price)
	local moneyRemoved = false
	
	if exports['qb-management']:RemoveMoney("supermarketsandy", price) then
		moneyRemoved = true
	end
	
	return moneyRemoved
end

----------------------------------------------------------------------
-- Event triggered when a player clean the splat in the supermarket --
----------------------------------------------------------------------
RegisterServerEvent('marketShopSandy:CleaningPay')
AddEventHandler('marketShopSandy:CleaningPay', function(player)
	
	local Player = QBCore.Functions.GetPlayer(player)
	if RemoveMoneyFromEntreprise(CleaningPrice) then
		Player.Functions.AddMoney("bank", CleaningPrice)
	else
		TriggerClientEvent("marketShopSandy:notif",player,TRAD["Trad-NoEnterpriseMoneyTitle"],TRAD["Trad-NoEnterpriseMoney"],"box","#FF0000")
	end
	
end)
