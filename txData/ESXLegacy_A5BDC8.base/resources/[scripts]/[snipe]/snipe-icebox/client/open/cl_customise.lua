QBCore, ESX = nil, nil
PlayerJob = {}

CreateThread(function()
    if Config.Core == "QBCore" then
        local status, errorMsg = pcall(function() QBCore = exports[Config.CoreFolderName]:GetCoreObject() end)
        Wait(250)
        if QBCore == nil then
            Citizen.CreateThread(function()
                while QBCore == nil do
                    TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
                    Citizen.Wait(200)
                end
            end)
        end
    elseif Config.Core == "ESX" then
        ESX = exports[Config.CoreFolderName]:getSharedObject()
        Wait(250)
        if (ESX == nil) then
            while ESX == nil do
                Wait(100)
                TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
            end
        end
    end
end)

local function UpdatePlayerJob()
    if Config.Core == "QBCore" then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    elseif Config.Core == "ESX" then
        while ESX.GetPlayerData() == nil do
            Wait(100)
        end
        while ESX.GetPlayerData().job == nil do
            Wait(100)
        end
        PlayerJob = ESX.GetPlayerData().job
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    Wait(1000)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    CreateThread(function()
        for k, v in pairs(Config.InfuseItems) do
            RequestNamedPtfxAsset(v.particleDict)
            while not HasNamedPtfxAssetLoaded(v.particleDict) do
                Citizen.Wait(0)
            end
        end
    end)
    UpdatePlayerJob()
    Initialize()
    InitializeMenu()
    InitializeInspectMenu()
    StartRemovingChainsAndWatchThread()
end)

AddEventHandler("onResourceStop", function (name)
    if name ~= GetCurrentResourceName() then
        return
    end
    RemoveChains()
    
end)

RegisterNetEvent(Config.PlayerLoadedEvent)
AddEventHandler(Config.PlayerLoadedEvent, function()
    CreateThread(function()
        for k, v in pairs(Config.InfuseItems) do
            RequestNamedPtfxAsset(v.particleDict)
            while not HasNamedPtfxAssetLoaded(v.particleDict) do
                Citizen.Wait(0)
            end
        end
    end)
    UpdatePlayerJob()
    Initialize()
    InitializeMenu()
    InitializeInspectMenu()
    StartRemovingChainsAndWatchThread()
end)

RegisterNetEvent(Config.JobUpdateEvent)
AddEventHandler(Config.JobUpdateEvent, function(jobInfo)
    PlayerJob = jobInfo
end)

function RemoveChains()
    if wearingChain.hasChain then
        if wearingChain.type == "prop" then
            DeleteEntity(chain)
            DeleteObject(chain)
            chain = nil
        elseif wearingChain.type == "drawable" then
            SetPedComponentVariation(cache.ped, 7, 0, 0, 0)
        end
        wearingChain = {}
    end

    if wearingWatch.hasWatch then
        if wearingWatch.type == "prop" then
            DeleteEntity(watch)
            DeleteObject(watch)
            watch = nil
        elseif wearingWatch.type == "drawable" then
            ClearPedProp(cache.ped, 6)
        end
        wearingWatch = {}
    end
end
exports("RemoveChains", RemoveChains)

local function HasChain()
    return wearingChain.hasChain
end

exports("HasChain", HasChain)

function GetPlayerByEntityID(id)
    for i=0,255 do
        if(NetworkIsPlayerActive(i) and GetPlayerPed(i) == id) then return i end
    end
    return nil
end

CreateThread(function()
    exports["qb-target"]:AddGlobalPlayer({
        options = {
            {
                
                icon = "fas fa-box-open",
                label = Locales["inspect_player_chain_target"],
                action = function(entity)
                    InspectPlayerChain(entity)
                end,
                canInteract = function(entity)
                    return IsPedAPlayer(entity)
                end,
            },
        }
    })
end)

function ShowNotification(type, msg, ...)
    local message = string.format(msg, ...)
    if Config.Notification == "ox" then
        lib.notify({description = message, type = type})
    elseif Config.Notification == "qb" then
        QBCore.Functions.Notify(message, type)
    elseif Config.Notification == "esx" then
        ESX.ShowNotification(message)
    end
end

CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.enabled then
            local blip = AddBlipForCoord(v.coords)
            SetBlipSprite(blip, v.sprite)
            SetBlipDisplay(blip, v.display)
            SetBlipScale(blip, v.scale)
            SetBlipColour(blip, v.colour)
            SetBlipAsShortRange(blip, v.shortRange)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.label)
            EndTextCommandSetBlipName(blip)
        end
    end
end)