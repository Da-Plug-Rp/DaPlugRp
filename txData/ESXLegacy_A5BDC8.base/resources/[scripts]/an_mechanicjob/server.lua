-- Loading Framework
if Config.usingESX then
   ESX = exports["es_extended"]:getSharedObject()
else
   QBCore = exports['qb-core']:GetCoreObject()
end

if Config.usingESX then
   -- Registering society
   TriggerEvent('esx_society:registerSociety', 'mechanic', 'mechanic', 'society_mechanic', 'society_mechanic', 'society_mechanic', {type = 'public'})
   -- Registering OX Inventory Stash
   if Config.useOXInventory then
      exports.ox_inventory:RegisterStash('society_mechanic', 'Mechanic Stash', Config.storageSlots, Config.storageMaxWeight, nil, {['mechanic'] = Config.minRankAccessStash}, Config.locations["storage"].coords)
   end
   -- Making usable items
   ESX.RegisterUsableItem('toolbox', function(src)
      local xPlayer = ESX.GetPlayerFromId(src)
      if Config.whitelistedJobs[xPlayer.job.name] then
         TriggerClientEvent("an_mechanicjob:toolboxuse", src)
      else
         TriggerClientEvent("an_mechanicjob:notify", src, "You are not a mechanic!", 8000, "error")
      end
   end)
   ESX.RegisterUsableItem('carjack', function(src)
      local xPlayer = ESX.GetPlayerFromId(src)
      if Config.whitelistedJobs[xPlayer.job.name] then
         local inv = xPlayer.inventory
         local hasToolbox = false
         for k,v in pairs(inv) do
            if v.name == "toolbox" and v.count > 0 then
               hasToolbox = true
               break
            end
         end
         if hasToolbox then
            TriggerClientEvent("an_mechanicjob:carjack", src)
         else
            TriggerClientEvent("an_mechanicjob:notify", src, "You need a tool box!", 8000, "error")
         end
      else
         TriggerClientEvent("an_mechanicjob:notify", src, "You are not a mechanic!", 8000, "error")
      end
   end)
   ESX.RegisterUsableItem('repairkit2', function(src)
      local xPlayer = ESX.GetPlayerFromId(src)
      TriggerClientEvent('an_mechanicjob:useRK', xPlayer.source)
   end)
   ESX.RegisterUsableItem('advancedrepairkit2', function(src)
      local xPlayer = ESX.GetPlayerFromId(src)
      TriggerClientEvent('an_mechanicjob:useRK', xPlayer.source, true)
   end)
else
   -- add usable item for qbcore
   QBCore.Functions.CreateUseableItem("toolbox", function(source)
      local Player = QBCore.Functions.GetPlayer(source)
      if Config.whitelistedJobs[Player.PlayerData.job.name] then
          TriggerClientEvent("an_mechanicjob:toolboxuse", source)
      else
          TriggerClientEvent("an_mechanicjob:notify", source, "You are not a mechanic!", 8000, "error")
      end
  end)
  QBCore.Functions.CreateUseableItem("carjack", function(source)
      local Player = QBCore.Functions.GetPlayer(source)
      if Config.whitelistedJobs[Player.PlayerData.job.name] then
          local inv = Player.PlayerData.items
          local hasToolbox = false
          for k,v in pairs(inv) do
              if v.name == "toolbox" and v.amount > 0 then
                  hasToolbox = true
                  break
              end
          end
          if hasToolbox then
              TriggerClientEvent("an_mechanicjob:carjack", source)
          else
              TriggerClientEvent("an_mechanicjob:notify", source, "You need a tool box!", 8000, "error")
          end
      else
          TriggerClientEvent("an_mechanicjob:notify", source, "You are not a mechanic!", 8000, "error")
      end
  end)
  QBCore.Functions.CreateUseableItem("repairkit2", function(source)
      local Player = QBCore.Functions.GetPlayer(source)
      TriggerClientEvent('an_mechanicjob:useRK', Player.PlayerData.source)
  end)
  QBCore.Functions.CreateUseableItem("advancedrepairkit2", function(source)
      local Player = QBCore.Functions.GetPlayer(source)
      TriggerClientEvent('an_mechanicjob:useRK', Player.PlayerData.source, true)
  end)
end

-- Server Events
RegisterNetEvent('an_mechanicjob:repairSV', function(materials, veh)
   local hasAllMaterials = true
   if Config.usingESX then
      local xPlayer = ESX.GetPlayerFromId(source)
      local inv = xPlayer.getInventory()
      for item,amount in pairs(materials) do
         local itemFound = false
         for k,v in pairs(inv) do
            if v.name == item and v.count >= amount then
               itemFound = true
               break
            end
         end
         if not itemFound then
            hasAllMaterials = false
            break
         end
      end
      if hasAllMaterials then
         for item,count in pairs(materials) do
            xPlayer.removeInventoryItem(item, count)
         end
      end
   else
      local Player = QBCore.Functions.GetPlayer(source)
      local inv = Player.PlayerData.items
      for item,amount in pairs(materials) do
         local itemFound = false
         for k,v in pairs(inv) do
            if v.name == item and v.amount >= amount then
               itemFound = true
               break
            end
         end
         if not itemFound then
            hasAllMaterials = false
            break
         end
      end
      if hasAllMaterials then
         for item,count in pairs(materials) do
            Player.Functions.RemoveItem(item, count)
         end
      end
   end
   TriggerClientEvent("an_mechanicjob:repairCL", source, hasAllMaterials, veh)
end)

RegisterNetEvent('an_mechanicjob:removeRK', function(materials, veh)
   if Config.usingESX then
      local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.removeInventoryItem("repairkit2", 1)
   else 
      local Player = QBCore.Functions.GetPlayer(source)
      Player.Functions.RemoveItem("repairkit2", 1)
   end
end)

RegisterNetEvent('an_mechanicjob:craftItem', function(itemName, recipe)
   if Config.usingESX then
      local xPlayer = ESX.GetPlayerFromId(source)
      local inv = xPlayer.getInventory()
      local hasAllMaterials = true
      for item,data in pairs(recipe) do
         local itemFound = false
         for k,v in pairs(inv) do
            if v.name == item and v.count >= data.amount then
               itemFound = true
               break
            end
         end
         if not itemFound then
            hasAllMaterials = false
            break
         end
      end
      if hasAllMaterials then
         for item,data in pairs(recipe) do
            xPlayer.removeInventoryItem(item, data.amount)
         end
         if xPlayer.canCarryItem(itemName, 1) then
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent("an_mechanicjob:notify", xPlayer.source, "You successfully crafted a "..Config.craftingRecipes[itemName].label, 12000, "success")
         else
            TriggerClientEvent("an_mechanicjob:notify", xPlayer.source, "OOPS! Empty your inventory first.", 12000, "error")
         end
      end
   else
      local Player = QBCore.Functions.GetPlayer(source)
      local inv = Player.PlayerData.items
      local hasAllMaterials = true
      for item,data in pairs(recipe) do
         local itemFound = false
         for k,v in pairs(inv) do
            if v.name == item and v.amount >= data.amount then
               itemFound = true
               break
            end
         end
         if not itemFound then
            hasAllMaterials = false
            break
         end
      end
      if hasAllMaterials then
         for item,data in pairs(recipe) do
            Player.Functions.RemoveItem(item, data.amount)
         end
         Player.Functions.AddItem(itemName, 1)
         TriggerClientEvent("an_mechanicjob:notify", source, "You successfully crafted a "..Config.craftingRecipes[itemName].label, 12000, "success")
      end
   end
end)

RegisterNetEvent('an_mechanicjob:recruit', function(target)
   local xPlayer = ESX.GetPlayerFromId(source)
   if xPlayer.job.grade_name == "boss" then
      local xTarget = ESX.GetPlayerFromId(target)
      if xTarget then
         xTarget.setJob(Config.jobName, 0)
         TriggerClientEvent("an_mechanicjob:notify", xPlayer.source, "You successfully recruited ".. xTarget.getName() .." - ID: "..target, 12000, "success")
         TriggerClientEvent("an_mechanicjob:notify", xTarget.source, "You have been recruited by the Mechanic Boss", 12000, "success")
      else
         TriggerClientEvent("an_mechanicjob:notify", xPlayer.source, "Player offline.", 12000, "error")
      end
   end
end)

-- Server Callbacks
if Config.usingESX then
   ESX.RegisterServerCallback('an_mechanicjob:getAllPlayers', function(source, cb)
      local players = ESX.GetExtendedPlayers()
      cb(players)
   end)
else
   QBCore.Functions.CreateCallback('an_mechanicjob:getAllPlayers', function(source, cb)
      local players = QBCore.Functions.GetQBPlayers()
      cb(players)
   end)
end