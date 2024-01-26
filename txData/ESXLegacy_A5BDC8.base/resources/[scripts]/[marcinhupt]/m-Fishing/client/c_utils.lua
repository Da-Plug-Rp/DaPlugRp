ESX = exports.es_extended:getSharedObject()

function OpenMenuUpgrades()
    lib.registerContext({
        id = 'upgradesMenu',
        title = 'Upgrades Menu',
        icon = 'fa-solid fa-circle-up',
        options = {
            { title = 'Upgrade Fishingrod',   description = "Here is where you can upgrade your fishingrod", onSelect = function() OpenFishingrodUpgrade() end },
            { title = 'Upgrade Fishingnet',   description = "Here is where you can upgrade your fishingnet", onSelect = function() OpenFishingnetUpgrade() end  },
        }
    })
    lib.showContext('upgradesMenu')
end

-- Function sell fishing
function OpenSellFishing()
    local SellFishing = {
        id = 'SellFishing',
        title = "Sell Fish",
        options = {}
    }

    for _, fishInfo in ipairs(Config.SettingsSell) do
        local itemName = fishInfo.item
        local priceMin = fishInfo.priceMin
        local priceMax = fishInfo.priceMax
        SellFishing.options[#SellFishing.options + 1] = {
            title = itemName,
            description = "Sell Price Range: $" .. priceMin .. " - $" .. priceMax,
            icon = "nui://" .. Config.InventoryLink .. itemName..".png",
            serverEvent = 'm-Fishing:Server:SellLegalFish',
            args = {
                item = itemName,
                priceMin = priceMin,
                priceMax = priceMax,
            },
        }
    end

    lib.registerContext(SellFishing)
    lib.showContext('SellFishing')
end

-- Function sell seashell
function OpenSeashellsSells()
    local SellSeashell = {
        id = 'SellSeashell',
        title = "Sell Seashell",
        options = {}
    }

    for _, seashellInfo in ipairs(Config.SeashellsSell) do
        local itemName = seashellInfo.item
        local priceMin = seashellInfo.priceMin
        local priceMax = seashellInfo.priceMax
        SellSeashell.options[#SellSeashell.options + 1] = {
            title = itemName,
            description = "Sell Price Range: $" .. priceMin .. " - $" .. priceMax,
            icon = "nui://" .. Config.InventoryLink .. itemName..".png",
            serverEvent = 'm-Fishing:Server:SellSeashell',
            args = {
                item = itemName,
                priceMin = priceMin,
                priceMax = priceMax,
            },
        }
    end

    lib.registerContext(SellSeashell)
    lib.showContext('SellSeashell')
end

-- Open Sell Corals
function OpenSellCorals()
    local SellFishing = {
        id = 'SellFishing',
        title = "Sell Fish",
        options = {}
    }

    for _, coralInfo in ipairs(Config.SellCoralsSetgins) do
        local itemName = coralInfo.item
        local priceMin = coralInfo.priceMin
        local priceMax = coralInfo.priceMax
        SellFishing.options[#SellFishing.options + 1] = {
            title = itemName,
            description = "Sell Price Range: $" .. priceMin .. " - $" .. priceMax,
            icon = "nui://" .. Config.InventoryLink .. itemName..".png",
            serverEvent = 'm-Fishing:Server:SellCorals',
            args = {
                item = itemName,
                priceMin = priceMin,
                priceMax = priceMax,
            },
        }
    end

    lib.registerContext(SellFishing)
    lib.showContext('SellFishing')
end

-- Tournaments
local pedOptions = {} 

for _, pedModel in ipairs(Config.PedsTournament) do
    table.insert(pedOptions, { value = pedModel, text = pedModel })
end

RegisterNetEvent('m-Fishing:Client:OpenTournamentMenu')
AddEventHandler("m-Fishing:Client:OpenTournamentMenu", function()
    local input = lib.inputDialog("Create Tournament", {
        { type = 'input',     label = "Name of Tournament",      required = true },
        { type = 'select',    label = "Ped",                     options = pedOptions, required = true },
        { type = 'number',    label = "Radius (20)",             required = true },
        { type = 'number',    label = "Time ( Minutes )",        required = true },
        { type = 'number',    label = "Participants",            required = true },
    })

    if not input then return end
    if tonumber(input[4]) <= Config.MaxWaitingTime then
        if tonumber(input[5]) <= Config.MaxParticipants then
            TriggerEvent("m-Fishing:Client:CreateTournament", input[1], input[2], input[3], input[4], input[5] )
        else
            Notify("The number of participants is greater than permitted. Maximum participants: "..Config.MaxParticipants, "error", 5000)
        end
    else
        Notify("The waiting time is longer than allowed. Maximum waiting time: "..Config.MaxWaitingTime, "error", 5000)
    end
end)