lib.locale()

if R.Framework == "ESX" then
    if R.newESX then
        ESX = exports["es_extended"]:getSharedObject()
    else
        ESX = nil
        CreateThread(function()
            while ESX == nil do
                TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
                Wait(100)
            end
        end)
    end
elseif R.Framework == "qbcore" then
    QBCore = nil
    QBCore = exports["qb-core"]:GetCoreObject()
end

Notify = function(text)
    if R.NotificationType == "ESX" then
        ESX.ShowNotification(text)
    elseif R.NotificationType == "esx_help" then
        ESX.ShowHelpNotification(text)
    elseif R.NotificationType == "ox_lib" then
        lib.notify({
            title = locale("notifyTitle"),
            description = text,
            type = "inform"
        })
    elseif R.NotificationType == "okok" then
        exports['okokNotify']:Alert(locale("notifyTitle"), text, 1, 'info', false)
    elseif R.NotificationType == "qbcore" then
        QBCore.Functions.Notify(text, 'success', 5000)
    elseif R.NotificationType == "quasar_notify" then
        exports['qs-notify']:Alert(text, 1000, 'info')
    else
        print("[STORAGE]: Pls put notify type in the config")
    end
end

TextUIShow = function(text)
    if R.InteractionType == "textui" then
        if R.TextUI == "ox_lib" then
            lib.showTextUI(text)
        elseif R.TextUI == "ESX" then
            exports["esx_textui"]:TextUI(text)
        elseif R.TextUI == "luke" then
            TriggerEvent('luke_textui:ShowUI', text)
        elseif R.TextUI == "qbcore" then
            exports['qb-core']:DrawText(text, 'right')
        elseif R.TextUI == "codesign" then
            TriggerEvent('cd_drawtextui:ShowUI', 'show', text)
        else
            print("Put the textui system in Config")
        end
    end
end

TextUIHide = function()
    if R.InteractionType == "textui" then
        if R.TextUI == "ox_lib" then
            lib.hideTextUI()
        elseif R.TextUI == "ESX" then
            exports["esx_textui"]:HideUI()
        elseif R.TextUI == "luke" then
            TriggerEvent('luke_textui:HideUI')
        elseif R.TextUI == "qbcore" then
            exports['qb-core']:HideText()
        elseif R.TextUI == "codesign" then
            TriggerEvent('cd_drawtextui:HideUI')
        else
            print("Put the textui system in Config")
        end
    end
end

Searchminigame = function()
    if R.Searchminigame == "ox_lib" then
        local success = lib.skillCheck({'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'}, {'w', 'a', 's', 'd'})
        return success
    elseif R.Searchminigame == "pd-safe" then
        local success = exports["pd-safe"]:createSafe(math.random(0,99), math.random(0,99))
        return success
    elseif R.Searchminigame == "howdy-hackminigame" then
        local success = exports["howdy-hackminigame"]:Begin(4, 5000)
        return success
    end
end

loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

ProgressBar = function(duration, label)
    if R.Progress == "ox_lib_square" then
        lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = false,
            allowCuffed = false,
            allowFalling = false,
            allowRagdoll = false,
            canCancel = false,
            disable = {
                move = true,
                combat = true,
                car = true,
            },
            anim = {
                dict = "amb@prop_human_bum_bin@base",
                clip = "base",
            },
        })
    elseif R.Progress == "ox_lib_circle" then
        lib.progressCircle({
            duration = duration,
            position = 'bottom',
            label = label,
            useWhileDead = false,
            allowCuffed = false,
            allowFalling = false,
            allowRagdoll = false,
            canCancel = false,
            disable = {
                move = true,
                combat = true,
                car = true,
            },
            anim = {
                dict = "amb@prop_human_bum_bin@base",
                clip = "base",
            },
        })
    elseif R.Progress == "ESX" then
        ESX.Progressbar(label, duration,{
            FreezePlayer = true, 
            animation ={
                type = "anim",
                dict = "amb@prop_human_bum_bin@base", 
                lib ="base" 
            }, 
        })
    elseif R.Progress == "progressBars" then
        exports['progressBars']:startUI(duration, label)
        local p = PlayerPedId()
        local dict = loadDict('amb@prop_human_bum_bin@base')
        TaskPlayAnim(p, dict, "base", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
        FreezeEntityPosition(p, true)
        Wait(duration)
        FreezeEntityPosition(p, false)
        ClearPedTasks(p)
    elseif R.Progress == "qbcore" then
        QBCore.Functions.Progressbar(label, label, duration - 500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'amb@prop_human_bum_bin@base',
            anim = 'base',
            flags = 1,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
        end, function()
            ClearPedTasks(PlayerPedId())
        end)
    else
        print("Put the progressbar system in Config")
    end
end

RegisterNetEvent('r_storage:policeAlertMessage')
AddEventHandler('r_storage:policeAlertMessage', function()
    if not R.EnablePoliceNotify then return end
    if R.Policenotify == "cd_dispatch" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = R.AlertJobs,
            coords = data.coords,
            title = '10-15 - Storage',
            message = ''..data.sex..' robbing a storage at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 59,
                scale = 1.2,
                colour = 39,
                flashes = false,
                text = '911 - Storage',
                time = 5,
                sound = 1,
            }
        })
    elseif R.Policenotify == "ps-dispatch" then
        exports["ps-dispatch"]:CustomAlert({
            coords = GetEntityCoords(PlayerPedId()),
            message = 'Storage',
            dispatchCode = '10-15',
            description = 'Storage',
            radius = 0,
            sprite = 59,
            color = 1,
            scale = 0.5,
            length = 3,
        })
    elseif R.Policenotify == "linden_outlawalert" then
        local player = GetEntityCoords(cache.ped)
        local data = { displayCode = "10-15", description = "Robbery", isImportant = 1,
        recipientList = R.AlertJobs,
        length = '10000', infoM = 'fa-info-circle', info = "Storage" }
        local dispatchData = { dispatchData = data, caller = 'citizen', coords = player }
        TriggerServerEvent('wf-alerts:svNotify', dispatchData)
    elseif R.Policenotify == "quasar-dispatch" then
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = R.AlertJobs,
            callLocation = playerData.coords,
            callCode = { code = 'Storage' },
            message = "A "..playerData.sex.. "Is robbing a Storage at: ".. playerData.street_1,
            flashes = false,
            image = image or nil,
            blip = {
                sprite = 488,
                scale = 1.5,
                colour = 1,
                flashes = true,
                text = 'Storage',
                time = (20 * 1000),
            }
        })
    elseif R.Policenotify == "core-dispatch" then
        for k, v in pairs(R.AlertJobs) do
            local coords = GetEntityCoords(PlayerPedId())
            exports['core_dispach']:addMessage("Storage", {coords}, v, 3000, 11, 5 )
        end
    elseif R.Policenotify == "op-dispatch" then
        for k,v in pairs(R.AlertJobs) do
            local job = v -- Jobs that will recive the alert
            local text = "Storage" -- Main text alert
            local coords = GetEntityCoords(PlayerPedId()) -- Alert coords
            local id = GetPlayerServerId(PlayerId()) -- Player that triggered the alert
            local title = "Storage" -- Main title alert
            local panic = false -- Allow/Disable panic effect
            TriggerServerEvent('Opto_dispatch:Server:SendAlert', job, title, text, coords, panic, id)
        end
    else
        print("[Storage] Put the police notify system in to the config")
    end
end)
