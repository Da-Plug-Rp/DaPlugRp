ESX = exports['es_extended']:getSharedObject()

isAimingInspectWeapon = false

local labels = {}

local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    repeat Wait(10) until HasAnimDictLoaded(dict)
end

function Draw3DText(x, y, z, text)
	SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text) - string.len(text) / 1.6) / 170
	DrawRect(0.0, 0.0 + 0.0125, 0.012 + factor, 0.03, 18, 22, 36, 125)
    ClearDrawOrigin()
end

function Notify(text, type, long)
    if Config.NotificationType == 'mythic' then
        if long then
            exports['mythic_notify']:DoLongHudText(type, text)
        else
            exports['mythic_notify']:DoHudText(type, text)
        end
    else
        ESX.ShowNotification(text)
    end
end

function DoProgress(anim, duration)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)

    if anim and anim.dict then LoadAnimDict(anim.dict) end

    local startTime = GetGameTimer()
    local controls = {30, 31, 24, 257, 25, 263, 22, 44, 37, 288, 289, 170, 167, 318, 137, 36, 47, 264, 257, 140, 141, 142, 143, 75, 75, 73}
    duration = duration or anim?.duration or 1000

    while true do
        for _,v in pairs(controls) do DisableControlAction(0, v, true) end

        if anim and anim.dict and anim.name and not IsEntityPlayingAnim(ped, anim.dict, anim.name, 3) then
            TaskPlayAnim(ped, anim.dict, anim.name, 4.0, 4.0, -1, anim.flag or 49)
        end

        if IsControlJustPressed(0, 73) or IsEntityDead(ped) then
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            return false
        end

        if startTime + duration < GetGameTimer() then
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            return true
        end
        Wait(0)
    end
end

if Config.EnableEvidence then
    if Config.WeaponToSeeEvidence == '' then
        isAimingInspectWeapon = true
        return
    end

    CreateThread(function()
        while true do
            Wait(400)
            local playerPed = PlayerPedId()

            if GetSelectedPedWeapon(playerPed) == joaat(Config.WeaponToSeeEvidence) then
                local playerId = PlayerId()

                if IsPlayerFreeAiming(playerId) then
                    isAimingInspectWeapon = true
                else
                    isAimingInspectWeapon = false
                end
            else
                isAimingInspectWeapon = false
            end
        end
    end)
end

function HasGloves()
    local noGloves = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
    local drawable = GetPedDrawableVariation(PlayerPedId(), 3)

    for _,v in pairs(noGloves) do
        if drawable == v then
            return false
        end
    end

    return true
end

function CanCollectEvidence() -- used when a player tries to pick up evidence, return false to not allow player to pick up evidence
    return true
end

function GetEvidenceData(evidenceType, coords, weaponType, weaponName) -- allows you to save "extra" data to eivdence to the "data" column in database
    return {evidenceType = evidenceType, weaponType = weaponType, weaponName = weaponName}
end

function DisplayExtraData(data)
    --return {label = 'Weapon serial number: '  .. data.serialNumber} -- For example you could add the weapon serial number to be displayed in the menu like this
    return nil
end

function EvidenceCollected(evidence) -- used when player picks up evidence
    if evidence.data.noItem or Config.UseOxInventory or not Config.PoliceJobs[ESX.PlayerData.job.name] then return end

    evidenceInInventory[#evidenceInInventory+1] = evidence
    SetResourceKvp('evidenceInInventory', json.encode(evidenceInInventory))
end

local function GetLabelText(data)
    return data.weaponType == 'taser' and _U(data.weaponType) or data.weaponType and ('%s (%s)'):format(_U(data.evidenceType), _U(data.weaponType)) or _U(data.evidenceType)
end

function DrawEvidence(k, v, inspect)
    local marker = Config.Markers[v.data.evidenceType]

    if marker then
        DrawMarker(marker.type, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.15, 0.15, 0.15, marker.color.r, marker.color.g, marker.color.b, marker.color.a, false, true, 2)
    end

    if inspect or Config.UseEvidenceText then
        local label = GetLabelText(v.data)

        if inspect and (not v.data.onlyPolice or Config.PoliceJobs[ESX.PlayerData.job.name]) then
            label = v.data.noItem and label .. _U('evidence_destroy') or label .. _U('evidence_pickup')
        end

        Draw3DText(v.coords.x, v.coords.y, v.coords.z + 0.29, label)
    end
end

function GetEvidenceElements(evidenceInInventory)
    local elements = {}

    for k,v in pairs(evidenceInInventory) do
        local label = GetLabelText(v.data)
        elements[k] = {label = _U('menu_evidence', label, k), value = k, time = v.time, data = v.data, plate = v.data.plate}
    end

    return elements
end

function OpenEvidenceMenu(elements, evidenceData)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'analyze2', {
        title    = evidenceData.label,
        align    = Config.MenuAlign,
        elements = elements
    }, function(data, menu)
        if data.current.value == 'remove' then
            ESX.UI.Menu.CloseAll()
            table.remove(evidenceInInventory, evidenceData.value)
            SetResourceKvp('evidenceInInventory', json.encode(evidenceInInventory))

            OpenAnalyzeMenu()
        end
    end, function(data, menu)
        menu.close()
    end)
end

function Analyze(time)
    local anim = {
        dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        name = "machinic_loop_mechandplayer",
        flag = 31,
    }

    Notify(_U('analyzing'), 'inform')
    if not DoProgress(anim, time) then return end

    OpenAnalyzeMenu()
end

function StartGSRWashing()
    local ped = PlayerPedId()
    Notify(_U('washing_started'), 'inform')

    local timer = GetGameTimer() + Config.GSRCleanTime * 1000

    while timer >= GetGameTimer() do
        if not IsEntityInWater(ped) then
            Notify(_U('washing_failed'), 'error')
            return
        end

        Wait(500)
    end

    hasGSR = false

    TriggerServerEvent('esx_tk_evidence:removeGSR', false)
    Notify(_U('washing_done'), 'success')
end

function GSRTest()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer == -1 or closestDistance > 3.0 then return Notify(_U('no_players_nearby'), 'error') end

    local anim = {
        dict = "amb@world_human_stand_fire@male@idle_a",
        name = "idle_a",
    }
    Notify(_U('doing_gsr'), 'error')
    if not DoProgress(anim, Config.GSRTestDuration) then return end

    local newClosestPlayer, newClosestDistance = ESX.Game.GetClosestPlayer()
    if newClosestPlayer == -1 or newClosestDistance > 3.0 or newClosestPlayer ~= closestPlayer then return Notify(_U('no_players_nearby'), 'error') end

    TriggerServerEvent('esx_tk_evidence:gsrTest', GetPlayerServerId(closestPlayer))
end

function OxGetEvidenceTag()
    local value = lib.inputDialog(_U('tag'), {
        {type = 'input', label = _U('tag')},
    })

    return value?[1]
end

function GetWeaponLabel(weapon)
    return Config.UseOxInventory and labels[weapon] or ESX.GetWeaponLabel(weapon)
end

if Config.UseOxInventory then
    for item, data in pairs(exports.ox_inventory:Items()) do
        labels[item] = data.label
    end

    exports.ox_inventory:displayMetadata({
        evidenceTag = _U('tag'),
        time = _U('time'),
        weaponType = _U('weapon_type'),
        weaponName = _U('weapon_name'),
        serialNumber = _U('serial_number'),
        dna = _U('dna'),
    })
end

RegisterNetEvent('esx_tk_evidence:gsrCloth', function()
    local anim = {
        dict = "nmt_3_rcm-10",
        name = "cs_nigel_dual-10",
        flag = 31,
    }

    Notify(_U('using_cloth'), 'error')
    if not DoProgress(anim, Config.GSRClothDuration) then return end

    UsedGSRCloth()
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)