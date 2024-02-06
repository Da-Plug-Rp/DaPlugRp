CreateThread(function()
    if Config.Framework ~= "qb" then return end
    local QBCore
    while not QBCore do
        QBCore = exports["qb-core"]:GetCoreObject()
        Wait(500)
    end
 
    local theoricalTestStarted = false
    local inPractise = false
    local practicalTestStarted = false
    local countDownStarted = false
    local countDownFrom = Config.WeaponLicenses.Practical.CountDownInterval
    local created_object = nil
    local remaining_shoots = Config.WeaponLicenses.Practical.TotalTargetsToEnd
    local remaining_shoots_practise = Config.WeaponPractisePoint.TotalTargetsToEnd
    local timeToFail = Config.WeaponLicenses.Practical.TimeToFailTest
    local timeToEndPractise = Config.WeaponPractisePoint.SecondsToEndPractise
    local latestRandomNumberNoRepeat = 0 -- Aux value to not repeating numbers
    local weaponPractiseHash = GetHashKey(Config.WeaponPractisePoint.Weapon)
    local weaponTestHash =  GetHashKey(Config.WeaponLicenses.Practical.Weapon)

    -- FUNCTIONS
    function startWeaponTheoricalTest()
        theoricalTestStarted = true
        SendNUIMessage({
            openQuestion = true
        })

        Citizen.Wait(200)
        SetNuiFocus(true, true)
    end

    function startWeaponPracticalTest()
        QBCore.Functions.TriggerCallback('xex_weaponlicense:toggleShooting', function(paid)
            practicalTestStarted = true
            QBCore.Functions.Notify(L('practical_started'), "success")
            armPlayer(weaponTestHash)
            startCountDown()
            local randomNumber = math.random(1, #Config.WeaponLicensePropPosition)
            latestRandomNumberNoRepeat = randomNumber
            create_object("prop_range_target_03", Config.WeaponLicensePropPosition[randomNumber])
            startPracticalTestLoop()
        end, false)
    end

    function startWeaponPractise()
        QBCore.Functions.TriggerCallback('xex_weaponlicense:toggleShooting', function(paid)
            inPractise = true
            QBCore.Functions.Notify(L('practise_started'), "success")
            armPlayer(weaponPractiseHash)
            startCountDown()
            local randomNumber = math.random(1, #Config.WeaponLicensePropPosition)
            latestRandomNumberNoRepeat = randomNumber
            create_object("prop_range_target_03", Config.WeaponLicensePropPosition[randomNumber])
            startPractiseLoop()
        end, false)
    end

    function startCountDown()
        for i=1, countDownFrom + 1 do
            if countDownFrom >= 0 then
                SendNUIMessage({
                    counter = countDownFrom
                })
            end
            Wait(1000)
            countDownFrom = countDownFrom - 1
        end
        SendNUIMessage({
            counterClose = true
        })
        countDownFrom = Config.WeaponLicenses.Practical.CountDownInterval
    end

    function create_object(model, coords)
        Citizen.CreateThread(function()
            RequestModel(model)
            local iter_for_request = 1
            while not HasModelLoaded(model) and iter_for_request < 5 do
                Citizen.Wait(500)				
                iter_for_request = iter_for_request + 1
            end
            if not HasModelLoaded(model) then
                SetModelAsNoLongerNeeded(model)
            else
                created_object = CreateObjectNoOffset(model,  coords.x,  coords.y,  coords.z, 1, 0, 1)
                SetEntityHeading(created_object, 166.84)
                FreezeEntityPosition(created_object,true)
                SetModelAsNoLongerNeeded(model)
            end
        end)
    end

    function startPracticalTestLoop()
        CreateThread(function() -- not infinite thread, we close it
            while practicalTestStarted do
                if DoesEntityExist(created_object) then
                    if HasEntityBeenDamagedByAnyPed(created_object) then
                        DeleteObject(created_object)
                        created_object = nil
                        remaining_shoots = remaining_shoots - 1
                        if remaining_shoots > 0 then
                            local randomNumber = math.random(1, #Config.WeaponLicensePropPosition)
                            while randomNumber == latestRandomNumberNoRepeat do
                                randomNumber = math.random(1, #Config.WeaponLicensePropPosition)
                            end
                            latestRandomNumberNoRepeat = randomNumber
                            create_object(Config.WeaponLicenseProp, Config.WeaponLicensePropPosition[randomNumber])
                        else
                            finishPracticalExam(true)
                        end
                    end
                end
                Wait(1)
            end
        end)

        if Config.WeaponLicenses.Practical.TimeToFailTest > 0 then
            CreateThread(function()
                while practicalTestStarted do
                    if timeToFail == 0 then
                        finishPracticalExam(false)
                    else
                        timeToFail = timeToFail - 1
                        Wait(1000)
                    end
                    Wait(1)
                end
            end)
        end
    end

    function startPractiseLoop()
        CreateThread(function() -- not infinite thread, we close it
            while inPractise do
                if DoesEntityExist(created_object) then
                    if HasEntityBeenDamagedByAnyPed(created_object) then
                        DeleteObject(created_object)
                        created_object = nil
                        remaining_shoots_practise = remaining_shoots_practise - 1
                        if remaining_shoots_practise > 0 then
                            local randomNumber = math.random(1, #Config.WeaponLicensePropPosition)
                            while randomNumber == latestRandomNumberNoRepeat do
                                randomNumber = math.random(1, #Config.WeaponLicensePropPosition)
                            end
                            latestRandomNumberNoRepeat = randomNumber
                            create_object(Config.WeaponLicenseProp, Config.WeaponLicensePropPosition[randomNumber])
                        else
                            finishPractise(true)
                        end
                    end
                end
                Wait(1)
            end
        end)

        if Config.WeaponPractisePoint.SecondsToEndPractise ~= 0 then
            CreateThread(function()
                while inPractise do
                    if timeToEndPractise <= 0 then
                        finishPractise(false)
                    else
                        timeToEndPractise = timeToEndPractise - 1
                        Wait(1000)
                    end
                    Wait(1)
                end
            end)
        end
    end

    function finishPracticalExam(result)
        practicalTestStarted = false
        disarmPlayer(weaponTestHash)
        QBCore.Functions.TriggerCallback('xex_weaponlicense:toggleShooting', function()
            timeToFail = Config.WeaponLicenses.Practical.TimeToFailTest
        
            if result then
                TriggerServerEvent('xex_weaponlicense:addLicense', 'practical_weapons')
                QBCore.Functions.Notify(L('passed_notif'), "success")
            else
                QBCore.Functions.Notify(L('failed_notif', remaining_shoots), "error")
            end
        
            remaining_shoots = Config.WeaponLicenses.Practical.TotalTargetsToEnd
        
            if DoesEntityExist(created_object) then
                DeleteObject(created_object)
                created_object = nil
            end
        end, true)
    end

    function finishPractise(result)
        inPractise = false
        disarmPlayer(weaponPractiseHash)
        QBCore.Functions.TriggerCallback('xex_weaponlicense:toggleShooting', function()
            timeToEndPractise = Config.WeaponPractisePoint.SecondsToEndPractise

            if result then
                QBCore.Functions.Notify(L('passed_notif_training'), "success")
            else
                QBCore.Functions.Notify(L('failed_notif_training', Config.WeaponPractisePoint.TotalTargetsToEnd - remaining_shoots_practise), "success")
            end

            remaining_shoots_practise = Config.WeaponPractisePoint.TotalTargetsToEnd

            if DoesEntityExist(created_object) then
                DeleteObject(created_object)
                created_object = nil
            end
        end, true)
    end

    function StopTheoryTest(success)
        theoricalTestStarted = false
        SendNUIMessage({
            openQuestion = false
        })
        SetNuiFocus(false)

        if success then
            TriggerServerEvent('xex_weaponlicense:addLicense', 'tehorical_weapons')
            QBCore.Functions.Notify( L('passed_notif'), "success")
        else
            QBCore.Functions.Notify( L('failed_simple_notif'), "error")
        end
    end

    function armPlayer(hash)
        local ped = PlayerPedId()
        GiveWeaponToPed(ped, hash, GetMaxAmmo(ped, hash), false, true)
        SetPedAmmo(ped, hash, 200)
    end

    function disarmPlayer(hash)
        local ped = PlayerPedId()
        SetPedAmmo(ped, hash, 0)
        RemoveWeaponFromPed(ped, hash)
    end

    RegisterNetEvent('xex_weaponlicense:client:confirmMenu')
    AddEventHandler('xex_weaponlicense:client:confirmMenu', function()
        QBCore.Functions.TriggerCallback('xex_weaponlicense:isPaidAndFreeToShoot', function(paid, message)
            if paid then
                startWeaponPracticalTest()
            else
                QBCore.Functions.Notify(message, "error")
            end
        end, 'practical')
    end)

    
    RegisterNetEvent('xex_weaponlicense:client:confirmMenuTheoretical')
    AddEventHandler('xex_weaponlicense:client:confirmMenuTheoretical', function()
        QBCore.Functions.TriggerCallback('xex_weaponlicense:isPaid', function(paid, message)
            if paid then
                startWeaponTheoricalTest()
            else
                QBCore.Functions.Notify(L('enough_money'), "error")
            end
        end, 'theorical')
    end)

    RegisterNetEvent('xex_weaponlicense:client:confirmMenuPay')
    AddEventHandler('xex_weaponlicense:client:confirmMenuPay', function()
        QBCore.Functions.TriggerCallback('xex_weaponlicense:isPaid', function(paid, message)
            if paid then
                startWeaponPractise()
            else
                QBCore.Functions.Notify(L('enough_money'), "error")
            end
        end, 'practise')
    end)

    function openConfirmMenuTheoretical(missionsType, quantity)
        local MainMenu = {
            {
                isMenuHeader = true,
                header = L('theorical_exam_confirm', Config.WeaponLicenses.Theorical.Price),
            },
            {
                header =L('yes'),
                params = {
                    event = 'xex_weaponlicense:client:confirmMenuTheoretical',
                }
            },
            {
                header = L('no'),
                params = {
                    event = "qb-menu:client:closeMenu",
                }
            }
        }
    
        exports['qb-menu']:openMenu(MainMenu)
    end

    function openConfirmMenu(missionsType, quantity)
        local MainMenu = {
            {
                isMenuHeader = true,
                header = L('practical_exam_confirm', Config.WeaponLicenses.Practical.Price)
            },
            {
                header =L('yes'),
                params = {
                    event = 'xex_weaponlicense:client:confirmMenu',
                }
            },
            {
                header = L('no'),
                params = {
                    event = "qb-menu:client:closeMenu",
                }
            }
        }
    
        exports['qb-menu']:openMenu(MainMenu)
    end

    function openConfirmPayMenu()
        local MainMenu = {
            {
                isMenuHeader = true,
                header = L('practise_confirm', Config.WeaponPractisePoint.Price),
            },
            {
                header =L('yes'),
                params = {
                    event = 'xex_weaponlicense:client:confirmMenuPay',
                }
            },
            {
                header = L('no'),
                params = {
                    event = "qb-menu:client:closeMenu",
                }
            }
        }
    
        exports['qb-menu']:openMenu(MainMenu)
    end

    local notifShown = false
    local notif1Shown = false
    local notif2Shown = false
    local notif3Shown = false

    -- THREADS - Draw markers & Marker logic - 1ms tick
    CreateThread(function()
        while true do
            local sleep = 1500
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - Config.WeaponLicenses.Practical.Location)
            local distanceToTheoretical = #(playerCoords - Config.WeaponLicenses.Theorical.Location) < Config.DrawDistance
            local distanceToPractise = #(playerCoords - Config.WeaponPractisePoint.Location) < Config.DrawDistance

            if distance < Config.DrawDistance or distanceToTheoretical or distanceToPractise then
                sleep = 1
                if not practicalTestStarted and not inPractise then
                    DrawMarker(2, Config.WeaponLicenses.Practical.Location, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 100, 150, 100, 100, false, false, 2, false, nil, nil, false)
                    if distance < 1.0 then
                        if not notifShown then
                            exports['qb-core']:DrawText(L('press_practical_exam'), 'left')
                            notifShown = true
                        end
                        if IsControlJustReleased(0, 38) then
                            local licensesMeta = QBCore.Functions.GetPlayerData().metadata["licences"]
                            if licensesMeta['tehorical_weapons'] and not licensesMeta['practical_weapons'] then
                                if Config.WeaponLicenses.Practical.Price > 0 then
                                    openConfirmMenu()
                                else
                                    startWeaponPracticalTest()
                                end
                            else
                                if licensesMeta['practical_weapons'] then
                                    QBCore.Functions.Notify(L('already_got_practical'), "error")
                                else
                                    QBCore.Functions.Notify(L('obtain_theorical_before'), "error")
                                end
                            end
                        end
                    elseif notifShown then
                        notifShown = false
                        exports["qb-core"]:HideText()
                    end
                end

                if not theoricalTestStarted then
                    DrawMarker(2, Config.WeaponLicenses.Theorical.Location, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 100, 150, 100, 100, false, false, 2, false, nil, nil, false)
                    distance = #(playerCoords - Config.WeaponLicenses.Theorical.Location)
                    if distance < 1.0 then
                        if not notif1Shown then
                            exports['qb-core']:DrawText(L('press_theorical_exam'), 'left')
                            notif1Shown = true
                        end
                        if IsControlJustReleased(0, 38) then
                            local licensesMeta = QBCore.Functions.GetPlayerData().metadata["licences"]
                            if not licensesMeta['tehorical_weapons'] then
                                if Config.WeaponLicenses.Theorical.Price > 0 then
                                    openConfirmMenuTheoretical()
                                else
                                    startWeaponTheoricalTest()
                                end
                            else
                                QBCore.Functions.Notify(L('already_got_theorical'), "error")
                            end
                        end
                    elseif notif1Shown then
                        notif1Shown = false
                        exports["qb-core"]:HideText()
                    end
                end

                if Config.WeaponPractisePoint.Enabled and not inPractise and not practicalTestStarted then
                    DrawMarker(2, Config.WeaponPractisePoint.Location, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 100, 150, 100, 100, false, false, 2, false, nil, nil, false)
                    distance = #(playerCoords - Config.WeaponPractisePoint.Location)
                    if distance < 1.0 then
                        if not notif2Shown then
                            exports['qb-core']:DrawText(L('press_to_start_practise'), 'left')
                            notif2Shown = true
                        end
                        if IsControlJustReleased(0, 38) then
                            local licensesMeta = QBCore.Functions.GetPlayerData().metadata["licences"]
                            if not Config.WeaponPractisePoint.NeedsLiceseToUse or licensesMeta['practical_weapons'] then
                                if Config.WeaponPractisePoint.Price > 0 then
                                    openConfirmPayMenu()
                                else
                                    startWeaponPractise()
                                end
                            else
                                QBCore.Functions.Notify(L('no_license'), "error")
                            end
                        end
                    elseif notif2Shown then
                        notif2Shown = false
                        exports["qb-core"]:HideText()
                    end
                end
            end

            if practicalTestStarted then
                sleep = 1
                exports['qb-core']:DrawText(L('remaining_seconds_practical', timeToFail), 'left')
                notif3Shown = true
            elseif not practicalTestStarted and notif3Shown then
                notif3Shown = false
                exports["qb-core"]:HideText()
            end

            if inPractise then
                sleep = 1
                exports['qb-core']:DrawText(L('remaining_seconds_practise', timeToEndPractise), 'left')
                notif4Shown = true
            elseif not practicalTestStarted and notif4Shown then
                notif4Shown = false
                exports["qb-core"]:HideText()
            end
        
            Wait(sleep)
        end
    end)

    if Config.DisarmIfExits then
        CreateThread(function()
            while true do
                local sleep = 1500
                if inPractise or practicalTestStarted then
                    sleep = 1
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(playerCoords - Config.DoorPointToDisarm)
                    if distance < 1.3 then
                        if inPractise then
                            finishPractise(false)
                        else
                            finishPracticalExam(false)
                        end
                        QBCore.Functions.Notify(L('too_far'), "error")
                        sleep = 1500
                    end
                end
                Wait(sleep)
            end
        end)
    end

    -- CALLBACKS
    RegisterNUICallback('question', function(data, cb)
        SendNUIMessage({
            openSection = 'question'
        })
        cb()
    end)

    RegisterNUICallback('close', function(data, cb)
        StopTheoryTest(true)
        cb()
    end)

    RegisterNUICallback('kick', function(data, cb)
        StopTheoryTest(false)
        cb()
    end)

end)