Config = nil
local isLoggedIn = false
local isWorking = false
local lumberjackBlip = nil -- Store the blip handle

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    isLoggedIn = true
end)
-- Function to create or update the blip
function UpdateBlip()
    if isLoggedIn and Config.Jobs.lumberjack then
        local blipData = Config.Jobs.lumberjack.Blip

        if not DoesBlipExist(lumberjackBlip) then
            lumberjackBlip = AddBlipForCoord(blipData.Pos.x, blipData.Pos.y, blipData.Pos.z)
        end

        SetBlipSprite(lumberjackBlip, blipData.Sprite)
        SetBlipDisplay(lumberjackBlip, blipData.Display)
        SetBlipScale(lumberjackBlip, blipData.Scale)
        SetBlipColour(lumberjackBlip, blipData.Colour)
        SetBlipAsShortRange(lumberjackBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Lumberjack Job")
        EndTextCommandSetBlipName(lumberjackBlip)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isLoggedIn then
            -- Check if player is near the job marker
            local playerPed = GetPlayerPed(-1)
            local coords = GetEntityCoords(playerPed)

            for job, data in pairs(Config.Jobs) do
                local distance = GetDistanceBetweenCoords(coords, data.Zones.Lumberjack.x, data.Zones.Lumberjack.y, data.Zones.Lumberjack.z, true)

                if distance < 1.5 and not isWorking then
                    ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to start working as a Lumberjack.')

                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent('lumberjack:startWork')
                    end
                end
            end

            if isWorking then
                -- Add logic for processing wood or other actions here
                -- For example, add wood to the player's inventory
                ESX.ShowNotification('You collected a piece of wood.')
                TriggerServerEvent('lumberjack:collectWood')
            end
        end
    end
end)

RegisterNetEvent('lumberjack:startWork')
AddEventHandler('lumberjack:startWork', function()
    isWorking = true

    -- Add animation (for example, chopping animation)
    TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant', 0, true)

    ESX.ShowNotification('You started working as a Lumberjack.')
end)

