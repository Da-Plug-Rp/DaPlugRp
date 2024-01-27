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

function GiveToPlayerItem(player,item,qte)
	aff("Give to: "..tostring(player).." "..tostring(item).." "..tostring(qte))
	local itemspawncode = itemNameToSpawnCode(item)
	local xPlayer = ESX.GetPlayerFromId(player)
	xPlayer.addInventoryItem(itemspawncode, tonumber(qte))
end

function RemovePlayerItem(player,item,qte)
	local itemRemoved = false
	local xPlayer = ESX.GetPlayerFromId(player)
	local itemspawncode = itemNameToSpawnCode(item)
	if tonumber(xPlayer.getInventoryItem(itemspawncode).count) >= tonumber(qte) then
      xPlayer.removeInventoryItem(itemspawncode, qte)
      itemRemoved = true
   end

	
	return itemRemoved
end

