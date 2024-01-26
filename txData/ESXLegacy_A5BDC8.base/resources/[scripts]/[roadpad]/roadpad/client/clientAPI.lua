if not Config.RegisterKeyMapping then
    CreateThread(function()
        while true do
            if IsControlJustReleased(0, 244) then
                openTablet()
            end
            Wait(0)
        end
    end)
end

function sendNotification(text)

    ESX.ShowNotification(text)

end

RegisterNetEvent(Config.ESXName .. ':playerLoaded')
AddEventHandler(Config.ESXName .. ':playerLoaded', function(playerData)

    local accounts = playerData.accounts or {}
    for index, account in ipairs(accounts) do
        if account.name == 'bank' then
            SendNUIMessage({
                event = "setBalance",
                balance = account.money
            })
        end
    end
end)

local firstSpawn = false

if Config.esxMultichar then
    AddEventHandler(Config.ESXplayerSpawnEvent, function(data)

        if not firstSpawn then

            firstSpawn = true

            Wait(2000)

            TriggerServerEvent('roadpad:playerLoad', GetPlayerServerId(PlayerId()))
        end

    end)
end


CreateThread(function()
    while true do
        Wait(3000)
        if NetworkIsPlayerActive(PlayerId()) then
            TriggerServerEvent('roadpad:playerLoad', GetPlayerServerId(PlayerId()))
            break
        end
    end
end)

local IsDead = false

AddEventHandler(Config.ESXplayerDeathEvent, function(data)
    IsDead = true
end)

AddEventHandler(Config.ESXplayerSpawnEvent, function(spawn)
    IsDead = false
end)

if Config.ESXVersion == "1.1" then
    AddEventHandler("playerSpawned", function()
        IsDead = false
    end)
end

function checkPlayerDead()
    if Config.VisnAre then
        local dead = exports['visn_are']:GetHealthBuffer().unconscious

        return dead
    end

    
    return IsDead
end
RegisterCommand("ToggleTablet", function()

    openTablet()

end)

function GiveCarKeys(plate)

    --TriggerEvent("vehiclekeys:client:SetOwner", plate) --Maybe you need to edit this trigger to your own vehiclekey system
    
end

RegisterNUICallback('app_custom_event', function(data, cb)

    local app = data.app

    if app == "APPNAME" then

        --Your Code
        
    end


    cb('ok')
    
end)