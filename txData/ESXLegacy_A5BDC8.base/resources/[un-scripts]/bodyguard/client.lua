local totalBodyguardsSpawned = 5

function DebugPrint(message)
    if Bodyguard.Debug then
        print("[Bodyguard Debug] " .. message)
    end
end

function CreateBlipForPed(ped, name)
    local blip = AddBlipForEntity(ped)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)
    return blip
end

function UpdateBlips()
    for _, guard in pairs(Bodyguard.Guards) do
        if DoesEntityExist(guard.Ped) and DoesBlipExist(guard.Blip) then
            local guardCoords = GetEntityCoords(guard.Ped, false)
            SetBlipCoords(guard.Blip, guardCoords.x, guardCoords.y, guardCoords.z)
        end
    end
end

function UnloadBodyguard()
    for _, guard in pairs(Bodyguard.Guards) do
        if DoesEntityExist(guard.Ped) then
            DebugPrint("Removing blip and deleting ped")
            RemoveBlip(guard.Blip)
            DeletePed(guard.Ped)
        end
    end
    Bodyguard.Guards = {}
end

function SetBodyguardsToFollowPlayer(playerPed)
    local playerGroup = GetPedGroupIndex(playerPed)

    for _, guard in pairs(Bodyguard.Guards) do
        if DoesEntityExist(guard.Ped) and DoesEntityExist(playerPed) and guard.Ped ~= playerPed then
            DebugPrint("Setting bodyguard to follow player and attack enemies")

            TaskFollowToOffsetOfEntity(guard.Ped, playerPed, 0.0, 0.0, 0.0, 5.0, -1, 10.0, true)
            SetPedAsGroupMember(guard.Ped, playerGroup)
            SetPedRelationshipGroupHash(guard.Ped, GetHashKey("FRIENDLY"))
            SetPedCombatAttributes(guard.Ped, 46, true)
            SetPedCombatAttributes(guard.Ped, 5, true)
            SetPedCombatRange(guard.Ped, 2)
            SetPedCombatMovement(guard.Ped, 2)
            SetPedCombatAbility(guard.Ped, 100)
            SetPedCombatTriggerRange(guard.Ped, 1)

            if not DoesBlipExist(guard.Blip) then
                DebugPrint("Creating new blip")
                guard.Blip = CreateBlipForPed(guard.Ped, "Bodyguard")
            end
        end
    end
end




function PlayAnimation(ped, dictionary, name)
    RequestAnimDict(dictionary)
    while not HasAnimDictLoaded(dictionary) do
        Citizen.Wait(100)
    end

    TaskPlayAnim(ped, dictionary, name, 8.0, 8.0, -1, 50, 0, false, false, false)
end

-- Main Citizen thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustPressed(0, Bodyguard.SpawnKey) then
            local BodyGuardSkinID = GetHashKey(Bodyguard.GuardSkin)
            local playerPed = PlayerPedId()
            local playerPosition = GetEntityCoords(playerPed)

            UnloadBodyguard()

            RequestModel(BodyGuardSkinID)
            while not HasModelLoaded(BodyGuardSkinID) do
                Citizen.Wait(500)
                DebugPrint("Waiting for model to load")
            end

            for i = 0, Bodyguard.GuardAmount, 1 do
                local guardPed = CreatePed(26, BodyGuardSkinID, playerPosition.x, playerPosition.y, playerPosition.z, 1, false, true)

                if DoesEntityExist(guardPed) then
                    DebugPrint("Creating bodyguard")
                    Bodyguard.Guards[i] = {}
                    Bodyguard.Guards[i].Ped = guardPed
                    SetPedCanSwitchWeapon(Bodyguard.Guards[i].Ped, false)
                    Bodyguard.Guards[i].SpawnLocation = playerPosition -- Store the initial spawn location
                    Bodyguard.Guards[i].Blip = CreateBlipForPed(guardPed, "Bodyguard")

                    if Bodyguard.GiveWeapon then
                        DebugPrint("Giving weapon")
                        GiveWeaponToPed(Bodyguard.Guards[i].Ped, GetHashKey(Bodyguard.GuardWeapon), 100, true, true)
                    end

                    SetBodyguardsToFollowPlayer(playerPed)
                else
                    DebugPrint("Failed to create bodyguard")
                end
            end

            SetModelAsNoLongerNeeded(BodyGuardSkinID)
        end

        UpdateBlips()
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustPressed(0, Bodyguard.SpawnKey) then
            if totalBodyguardsSpawned < Bodyguard.MaxBodyguards then
                -- Your existing spawning logic here

                totalBodyguardsSpawned = totalBodyguardsSpawned + 1
            else
                DebugPrint("Maximum bodyguards reached!")
            end
        end

        UpdateBlips()
    end
end)
