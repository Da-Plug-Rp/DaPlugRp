if string.lower(FrameWork) ~= "qb" and string.lower(FrameWork) ~= "qbus" and string.lower(FrameWork) ~= "qbcore" then 
	return
end

local QBCore = exports['qb-core']:GetCoreObject()

function GiveToPlayerItem(player,item,qte)
	aff("Give to: "..tostring(player).." "..tostring(item).." "..tostring(qte))
	local itemspawncode = itemNameToSpawnCode(item)
    local Player = QBCore.Functions.GetPlayer(player)
	Player.Functions.AddItem(itemspawncode, tonumber(qte))
end

function RemovePlayerItem(player,item,qte)
	
	local itemRemoved = false
	local Player = QBCore.Functions.GetPlayer(player)

	local itemspawncode = itemNameToSpawnCode(item)

	local invItem = Player.Functions.GetItemByName(itemspawncode)

	
	if invItem and invItem.count and invItem.count >= tonumber(qte) then
		Player.Functions.RemoveItem(itemspawncode, qte)
		itemRemoved = true
	end
	
	return itemRemoved
end

--- USE THIS FOR CORE INVENTORY
--function RemovePlayerItem(player,item,qte)
--    local itemRemoved = false
--    local Player = QBCore.Functions.GetPlayer(player)
--    itemRemoved = exports['core_inventory']:removeItem('content-' ..  Player.PlayerData.citizenid:gsub(":", ""), itemNameToSpawnCode(item), tonumber(qte))
--    print("itemRemoved : "..tostring(itemRemoved).." inventory : "..tostring('content-' ..  Player.PlayerData.citizenid:gsub(":", "")).." item: "..tostring(item).." spawn code : "..tostring(itemNameToSpawnCode(item)))
--    return itemRemoved
--end