if string.lower(FrameWork) ~= "other" then 
	return
end
-- local QBCore = exports['qb-core']:GetCoreObject()



------------------------------------------------------------------------------
-- Function used to add item to the player (used when you bought something) --
------------------------------------------------------------------------------

function GiveToPlayerItem(player,item,qte)
	aff("Give to: "..tostring(player).." "..tostring(item).." "..tostring(qte))
	
    local Player = QBCore.Functions.GetPlayer(player)
	Player.Functions.AddItem(item, qte)
end


----------------------------------------------------------------------------------------------
-- Function used to remove item from the player (used when you put back in stock something) --
----------------------------------------------------------------------------------------------
function RemovePlayerItem(player,item,qte)
	local itemRemoved = false
	 local Player = QBCore.Functions.GetPlayer(player)
	 
	local invItem = Player.Functions.GetItemByName(item)
	if invItem and invItem.amount >= qte then
		Player.Functions.RemoveItem(item, qte)
		itemRemoved = true
	end
	
	return itemRemoved
end