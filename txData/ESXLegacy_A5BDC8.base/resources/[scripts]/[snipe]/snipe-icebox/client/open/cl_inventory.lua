blacklistedChains = {}
blackListedWatches = {}
function GetItems()
    local returnData = {}
    if Config.Inventory == "ox" then
        local playerItems = exports.ox_inventory:GetPlayerItems()
        for k, v in pairs(playerItems) do
            Wait(10)
            returnData[#returnData + 1] = {
                label = v.label,
                count = v.count,
                name = v.name,
                slot = v.slot,
                metadata = v.metadata or nil,
            }
        end
        return returnData
    elseif Config.Inventory == "qsv2" then
        local playerItems = exports['qs-inventory']:getUserInventory()
        for k, v in pairs(playerItems) do
            returnData[#returnData + 1] = {
                label = v.label,
                count = v.amount,
                name = v.name,
                slot = v.slot,
                metadata = v.info or nil,
            }
        end
        return returnData

    elseif Config.Inventory == "qb" then
        local playerItem = QBCore.Functions.GetPlayerData().items
        for k, v in pairs(playerItem) do
            returnData[#returnData + 1] = {
                label = v.label,
                count = v.amount,
                name = v.name,
                slot = v.slot,
                metadata = v.info or nil,
            }
        end
        return returnData
    end
end

function Initialize()
    
    if Config.Inventory == "ox" then
        local metadataDisplayTable = {}
        for k, v in pairs(Config.InfuseItems) do
            metadataDisplayTable[k] = v.label
        end
        exports.ox_inventory:displayMetadata(metadataDisplayTable)
    end
end

local function DroppedChain(item)
    if wearingChain.name == item then
        if next(wearingChain) then
            if wearingChain.type == "prop" then
                DetachEntity(wearingChain.chain, true, false)
                DeleteEntity(wearingChain.chain)
            elseif wearingChain.type == "drawable" then
                SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0)
            end
        end
        wearingChain = {}
    end

    if wearingWatch.name == item then
        if next(wearingWatch) then
            if wearingWatch.type == "prop" then
                DetachEntity(wearingWatch.watch, true, false)
                DeleteEntity(wearingWatch.watch)
            elseif wearingWatch.type == "drawable" then
                SetPedComponentVariation(PlayerPedId(), 6, 0, 0, 0)
            end
        end
        wearingWatch = {}
    end
end

AddEventHandler("esx:removeInventoryItem", function(item)
    DroppedChain(item)
end)

AddEventHandler("ox_inventory:itemCount", function(item)
    DroppedChain(item)
end)



RegisterNetEvent("inventory:client:ItemBox")
AddEventHandler("inventory:client:ItemBox", function(item, type)
    DroppedChain(item)
end)

RegisterNetEvent("snipe-icebox:client:removeItem")
AddEventHandler("snipe-icebox:client:removeItem", function(item)
    DroppedChain(item)
end)

function OpenSafe(data)
    if Config.Inventory == "qb" then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", data.stashName, {
            maxweight = data.stashsize,
            slots = data.stashslots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", data.stashName)

    elseif Config.Inventory == "qsv2" then
        exports['qs-inventory']:RegisterStash(data.stashName, data.stashslots, data.stashsize) 
    elseif Config.Inventory == "ox" then
        exports.ox_inventory:openInventory('stash', data.stashName)
    end
end
