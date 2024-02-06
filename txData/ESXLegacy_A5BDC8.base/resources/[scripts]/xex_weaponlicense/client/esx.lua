CreateThread(function()
    if Config.Framework ~= "esx" then return end
        
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
    local ownedLicenses = {}
    local weaponPractiseHash = GetHashKey(Config.WeaponPractisePoint.Weapon)
    local weaponTestHash =  GetHashKey(Config.WeaponLicenses.Practical.Weapon)

    Citizen.CreateThread(function()
        while ESX == nil do
            if Config.GetSharedObjectfunction == false then
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            else
                ESX = exports["es_extended"]:getSharedObject()
            end
            Citizen.Wait(0)
        end
    end)

    -- DEBUGGING PURPOSES
    -- ownedLicenses['tehorical_weapons'] = true
    -- ownedLicenses['practical_weapons'] = false

    -- HANDLERS
    RegisterNetEvent('xex_weaponlicense:loadLicenses')
    AddEventHandler('xex_weaponlicense:loadLicenses', function(licenses)
        Licenses = licenses
        for i=1, #Licenses, 1 do
            ownedLicenses[Licenses[i].type] = true
        end
    end)

    RegisterNetEvent('xex_weaponlicense:addLicense')
    AddEventHandler('xex_weaponlicense:addLicense', function(license)
        ownedLicenses[license] = true
    end)


    -- FUNCTIONS
    function startWeaponTheoricalTest()
        theoricalTestStarted = true
        SendNUIMessage({
            openQuestion = true
        })
        ESX.SetTimeout(200, function()
            SetNuiFocus(true, true)
        end)
    end

    function startWeaponPracticalTest()
        ESX.TriggerServerCallback('xex_weaponlicense:toggleShooting', function()
            practicalTestStarted = true
            ESX.ShowNotification(L('practical_started'))
            armPlayer(weaponTestHash)
            startCountDown()
            local randomNumber = math.random(1, #Config.WeaponLicensePropPosition)
            latestRandomNumberNoRepeat = randomNumber
            create_object("prop_range_target_03", Config.WeaponLicensePropPosition[randomNumber])
            startPracticalTestLoop()
        end, false)
    end

    function startWeaponPractise()
        ESX.TriggerServerCallback('xex_weaponlicense:toggleShooting', function()
            inPractise = true
            ESX.ShowNotification(L('practise_started'))
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
                        -- ESX.ShowNotification('Has acertado, te quedan: ' .. remaining_shoots .. ' dianas');
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

        ESX.TriggerServerCallback('xex_weaponlicense:toggleShooting', function()
            timeToFail = Config.WeaponLicenses.Practical.TimeToFailTest
        
            if result then
                TriggerServerEvent('xex_weaponlicense:addLicense', 'practical_weapons')
                ownedLicenses['practical_weapons'] = true
                TriggerEvent('esx:showAdvancedNotification', L('weapon_license'), L('practical_exam_notif'), L('passed_notif'), 'CHAR_AMMUNATION', 9)
            else
                TriggerEvent('esx:showAdvancedNotification', L('weapon_license'), L('practical_exam_notif'), L('failed_notif', remaining_shoots), 'CHAR_AMMUNATION', 9)
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

        ESX.TriggerServerCallback('xex_weaponlicense:toggleShooting', function()
            timeToEndPractise = Config.WeaponPractisePoint.SecondsToEndPractise

            if result then
                TriggerEvent('esx:showAdvancedNotification', L('weapon_license'), L('practical_training_notif'), L('passed_notif_training'), 'CHAR_AMMUNATION', 9)
            else
                TriggerEvent('esx:showAdvancedNotification', L('weapon_license'), L('practical_training_notif'), L('failed_notif_training', Config.WeaponPractisePoint.TotalTargetsToEnd - remaining_shoots_practise), 'CHAR_AMMUNATION', 9)
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
            ownedLicenses['tehorical_weapons'] = true
            TriggerEvent('esx:showAdvancedNotification',  L('weapon_license'), L('theorical_exam_notif'), L('passed_notif'),
                'CHAR_AMMUNATION', 9)
        else
            TriggerEvent('esx:showAdvancedNotification',  L('weapon_license'), L('theorical_exam_notif'), L('failed_simple_notif'),
            'CHAR_AMMUNATION', 9)
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
                        ESX.ShowHelpNotification(L('press_practical_exam'))
                        if IsControlJustReleased(0, 38) then
                            if ownedLicenses['tehorical_weapons'] and not ownedLicenses['practical_weapons'] then
                                if Config.WeaponLicenses.Practical.Price > 0 then
                                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'weapon_license_practical_confirm', {
                                        title = L('practical_exam_confirm', Config.WeaponLicenses.Practical.Price),
                                        align = 'bottom-right',
                                        elements = {
                                            {label = L('no'), value = 'no'},
                                            {label = L('yes'), value = 'yes'}
                                    }}, function(data2, menu2)
                                        if data2.current.value == 'yes' then
                                            ESX.TriggerServerCallback('xex_weaponlicense:isPaidAndFreeToShoot', function(paid, message)
                                                if paid then
                                                    startWeaponPracticalTest()
                                                else
                                                    ESX.ShowNotification(message)
                                                end
                                            end, 'practical')
                                        end
                                        menu2.close()
                                    end, function(data2, menu2)
                                        menu2.close()
                                    end)
                                else
                                    startWeaponPracticalTest()
                                end
                            else
                                if ownedLicenses['practical_weapons'] then
                                    ESX.ShowNotification(L('already_got_practical'))
                                else
                                    ESX.ShowNotification(L('obtain_theorical_before'))
                                end
                            end
                        end
                    end
                end

                if not theoricalTestStarted then
                    DrawMarker(2, Config.WeaponLicenses.Theorical.Location, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 100, 150, 100, 100, false, false, 2, false, nil, nil, false)
                    distance = #(playerCoords - Config.WeaponLicenses.Theorical.Location)
                    if distance < 1.0 then
                        ESX.ShowHelpNotification(L('press_theorical_exam'))
                        if IsControlJustReleased(0, 38) then
                            if not ownedLicenses['tehorical_weapons'] then
                                if Config.WeaponLicenses.Theorical.Price > 0 then
                                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'weapon_license_theorical_confirm', {
                                        title = L('theorical_exam_confirm', Config.WeaponLicenses.Theorical.Price),
                                        align = 'bottom-right',
                                        elements = {
                                            {label = L('no'), value = 'no'},
                                            {label = L('yes'), value = 'yes'}
                                    }}, function(data2, menu2)
                                        if data2.current.value == 'yes' then
                                            ESX.TriggerServerCallback('xex_weaponlicense:isPaid', function(paid)
                                                if paid then
                                                    startWeaponTheoricalTest()
                                                else
                                                    ESX.ShowNotification(L('enough_money'))
                                                end
                                            end, 'theorical')
                                        end
                                        menu2.close()
                                    end, function(data2, menu2)
                                        menu2.close()
                                    end)
                                else
                                    startWeaponTheoricalTest()
                                end
                            else
                                ESX.ShowNotification(L('already_got_theorical'))
                            end
                        end
                    end
                end

                if Config.WeaponPractisePoint.Enabled and not inPractise and not practicalTestStarted then
                    DrawMarker(2, Config.WeaponPractisePoint.Location, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 100, 150, 100, 100, false, false, 2, false, nil, nil, false)
                    distance = #(playerCoords - Config.WeaponPractisePoint.Location)
                    if distance < 1.0 then
                        ESX.ShowHelpNotification(L('press_to_start_practise'))
                        if IsControlJustReleased(0, 38) then
                            if not Config.WeaponPractisePoint.NeedsLiceseToUse or ownedLicenses['practical_weapons'] then
                                if Config.WeaponPractisePoint.Price > 0 then
                                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'weapon_license_theorical_confirm', {
                                        title = L('practise_confirm', Config.WeaponPractisePoint.Price),
                                        align = 'bottom-right',
                                        elements = {
                                            {label = L('no'), value = 'no'},
                                            {label = L('yes'), value = 'yes'}
                                    }}, function(data2, menu2)
                                        if data2.current.value == 'yes' then
                                            ESX.TriggerServerCallback('xex_weaponlicense:isPaid', function(paid)
                                                if paid then
                                                    startWeaponPractise()
                                                else
                                                    ESX.ShowNotification(L('enough_money'))
                                                end
                                            end, 'practise')
                                        end
                                        menu2.close()
                                    end, function(data2, menu2)
                                        menu2.close()
                                    end)
                                else
                                    startWeaponPractise()
                                end
                            else
                                ESX.ShowNotification(L('no_license'))
                            end
                        end
                    end
                end
            end

            if practicalTestStarted then
                sleep = 1
                ESX.ShowHelpNotification(L('remaining_seconds_practical', timeToFail))
            end

            if inPractise then
                sleep = 1
                ESX.ShowHelpNotification(L('remaining_seconds_practise', timeToEndPractise))
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
                        ESX.ShowNotification(L('too_far'))
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


