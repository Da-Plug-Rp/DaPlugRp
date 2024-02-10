-- Global Vars
PlayerData = {}
jobGrade = nil

-- Loading Framework
if Config.usingESX then
    ESX = exports["es_extended"]:getSharedObject()
    -- PlayerData = ESX.GetPlayerData()
    -- jobGrade = PlayerData.job.grade
else
    QBCore = exports['qb-core']:GetCoreObject()
end

-- QBCore Player Data loading/handling
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    jobGrade = PlayerData.job.grade.level
end)
RegisterNetEvent('QBCore:Player:SetPlayerData', function(PlayerData)
    PlayerData = PlayerData
    jobGrade = PlayerData.job.grade.level
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    jobGrade = PlayerData.job.grade.level
end)

-- ESX Player Data loading/handling
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer, isNew, skin)
    PlayerData = xPlayer
    jobGrade = PlayerData.job.grade
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob',function(job)
    PlayerData.job = job
    jobGrade = PlayerData.job.grade
end)

-- Local Vars
local isUsingToolbox = false
local tempNeeded = {}
local materialString = ""
local isCrafting = false
local vehOnLift = nil
local carJack = nil
local isCarJacking = false
local startedCarJack = false
local carJackedVeh = nil

-- Initiating script
Citizen.CreateThread(function()
    -- Gathering all the materials in the config in a string for further notification uses
    local labels = {}
    for i = 1, #Config.materials do
        table.insert(labels, Config.materials[i].label)
    end
    materialString = table.concat(labels, ", ")
    -- Filling in labels for materials in the Config.craftingRecipes
    for k, v in pairs(Config.craftingRecipes) do
        for i, ingredient in pairs(v.ingredients) do
            for j, material in pairs(Config.materials) do
                if i == material.item then
                    v.ingredients[i].label = material.label
                    break
                end
            end
        end
    end
    -- Creating blip
    local blipData = Config.blip
    if blipData.enable then
		local blip = AddBlipForCoord(blipData.coords.x, blipData.coords.y, blipData.coords.z)
		SetBlipSprite (blip, blipData.sprite)
		SetBlipDisplay(blip, blipData.display)
		SetBlipScale  (blip, blipData.scale)
		SetBlipColour (blip, blipData.color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(blipData.label)
		EndTextCommandSetBlipName(blip)
    end
end)

-- Locations Thread
Citizen.CreateThread(function()
    local wait = 1500
    while true do
        Citizen.Wait(wait)
        if PlayerData.job and jobGrade then
            if Config.whitelistedJobs[PlayerData.job.name] then
                if not isRepairing and not isUsingToolbox and not isCrafting then
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    for k,v in pairs(Config.locations) do
                        local continue = false
                        if v.veh then
                            if IsPedInAnyVehicle(ped, false) then
                                continue = true
                            else
                                continue = false
                            end
                        else
                            continue = true
                        end
                        if continue then
                            local dist = #(coords - v.coords)
                            if dist <= v.maxDist and dist > v.minDist then
                                wait = 5
                                DrawMarker(2, v.coords.x, v.coords.y, v.coords.z + 0.5, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.3, 42, 166, 185, 255, true, false, 2, true, nil, nil, false)
                            elseif dist <= v.minDist then
                                wait = 5
                                DrawText3Ds(v.coords.x, v.coords.y, v.coords.z + 0.5, v.marker)
                                if IsControlJustPressed(0, 38) then
                                    local isRepairArea = string.match(k, "repairArea")
                                    wait = 1500
                                    if k == "diagnosisArea" then
                                        if IsPedInAnyVehicle(ped, false) then
                                            local veh = GetVehiclePedIsIn(ped, false)
                                            FreezeEntityPosition(veh, true)
                                            FreezeEntityPosition(ped, true)
                                            if Config.useANProgBar then
                                                exports['an_progBar']:run(1, "Running Vehicle Diagnosis")
                                                Citizen.Wait(1300)
                                                exports['an_progBar']:run(1, "ENGINE INSPECTION")
                                                Citizen.Wait(1300)
                                                exports['an_progBar']:run(1, "BODY INSPECTION")
                                                Citizen.Wait(1300)
                                            else
                                                notify("Running Vehicle Diagnosis", 1500, "info")
                                                Citizen.Wait(1500)
                                                notify("ENGINE INSPECTION", 1500, "info")
                                                Citizen.Wait(1500)
                                                notify("BODY INSPECTION", 1500, "info")
                                                Citizen.Wait(1500)
                                            end
                                            FreezeEntityPosition(veh, false)
                                            FreezeEntityPosition(ped, false)
                                            CheckVehicleState(veh, true)
                                        else
                                            notify("You must be in a vehicle.", 18000, "error")
                                        end
                                    elseif k == "craft" then
                                        if not IsPedInAnyVehicle(ped, false) and not IsPedDeadOrDying(ped) then
                                            if jobGrade >= Config.minRankAccessCraft then
                                                openCraftingMenu()
                                                Citizen.Wait(150)
                                            end
                                        end
                                    elseif k == "spawner" then
                                        if not IsPedInAnyVehicle(ped, false) then
                                            if jobGrade >= Config.minRankAccessSpawner then
                                                openSpawnerMenu()
                                                Citizen.Wait(150)
                                            end
                                        else
                                            local veh = GetVehiclePedIsIn(ped, false)
                                            local model = GetEntityModel(veh)
                                            if Config.garage[string.lower(GetDisplayNameFromVehicleModel(model))] then
                                                if Config.usingESX then
                                                    ESX.Game.DeleteVehicle(veh)
                                                else
                                                    TriggerEvent("QBCore:Command:DeleteVehicle")
                                                end
                                                notify("You have stored the vehicle in the garage.", 8000, "info")
                                            else
                                                notify("This ain't a mechanic vehicle.", 8000, "error")
                                            end
                                        end
                                    elseif k == "clothing" then
                                        if not IsPedInAnyVehicle(ped, false) then
                                            if jobGrade >= Config.minRankAccessClothing then
                                                openClothingMenu()
                                                Citizen.Wait(150)
                                            end
                                        end
                                    elseif k == "storage" then
                                        if not IsPedInAnyVehicle(ped, false) then
                                            if jobGrade >= Config.minRankAccessStash then
                                                openStorage()
                                                Citizen.Wait(150)
                                            end
                                        end
                                    elseif k == "bossmenu" then
                                        if jobGrade > 2 then
                                            if not IsPedInAnyVehicle(ped, false) then
                                                if jobGrade >= Config.minRankAccessBossMenu then
                                                    if Config.useANProgBar then
                                                        exports['an_progBar']:run(2, "ACCESSING BOSS DASHBOARD")
                                                        Citizen.Wait(1800)
                                                    else
                                                        notify("ACCESSING BOSS DASHBOARD", 2000, "info")
                                                        Citizen.Wait(1800)
                                                    end
                                                    openBossMenu()
                                                end
                                            end
                                        end
                                    elseif isRepairArea then
                                        if IsPedInAnyVehicle(ped, false) then
                                            local veh = GetVehiclePedIsIn(ped, false)
                                            SetEntityCoords(veh, v.lift)
                                            SetEntityHeading(veh, v.heading)
                                            vehOnLift = veh
                                            notify("Vehicle was successfully installed on the lift, you can start working on it now.", 15000, "success")
                                            FreezeEntityPosition(veh, true)
                                            Citizen.CreateThread(function()
                                                while true do
                                                    Citizen.Wait(0)
                                                    if vehOnLift then
                                                        local newCoords = GetEntityCoords(PlayerPedId())
                                                        local dst2 = #(newCoords - v.control)
                                                        if dst2 < 5.0 and dst2 > 1.5 then
                                                            DrawMarker(2, v.control.x, v.control.y, v.control.z + 0.5, 0, 0, 0, 0, 0, 0, 0.2, 0.2, 0.2, 42, 166, 185, 255, true, false, 2, true, nil, nil, false)
                                                        elseif dst2 <= 1.5 then
                                                            DrawText3Ds(v.control.x, v.control.y, v.control.z, "[~b~UP~s~] Move Up\n[~y~DOWN~s~] Move Down\n[~r~H~s~] Detach")
                                                            local vehCoords = GetEntityCoords(veh)
                                                            local minTarget = v.coords.z + 2.0
                                                            local maxTarget = v.coords.z
                                                            FreezeEntityPosition(veh, true)
                                                            if IsControlPressed(0, 172) then -- ARROW UP
                                                                moveEntity(veh, "up", minTarget, maxTarget)
                                                            elseif IsControlPressed(0, 173) then -- ARROW DOWN
                                                                moveEntity(veh, "down", minTarget, maxTarget)
                                                            elseif IsControlPressed(0, 74) then -- H - Detach
                                                                FreezeEntityPosition(veh, false)
                                                                local forwardVector = GetEntityForwardVector(veh) -- forward direction
                                                                local offset = 3.0 -- distance to move the entity forward
                                                                local detachCoords = v.coords + forwardVector * offset
                                                                SetEntityCoords(veh, detachCoords)
                                                                vehOnLift = nil
                                                                notify("Vehicle was successfully detached from the lift.", 15000, "info")
                                                            end
                                                        end
                                                    else
                                                        return
                                                    end
                                                end
                                            end)
                                        else
                                            notify("You must be in a vehicle.", 8000, "error")
                                        end
                                    end
                                    Citizen.Wait(50)
                                end
                            end
                        end
                    end
                end
            else
                wait = 1500
            end
        end
    end
end)

function openStorage()
    if Config.usingESX then
        if Config.useOXInventory then
            exports.ox_inventory:openInventory('stash', {id = 'society_mechanic'}) -- need more testing
        else
            -- You need to implement your own code/event/function here to make the script work with your stash
            -- TriggerEvent('esx_inventory:openVault', 'society_mechanic')
            notify("[OOC] Owner of this server still has work to do in order to implement the stash system with the existing inventory", 8000, "error") -- remove this after you're done!
        end
    else
        TriggerEvent("inventory:client:SetCurrentStash", "mechanicstash")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "mechanicstash", {
            maxweight = 40000000,
            slots = 500,
        })
    end
end

function moveEntity(entity,direction,max,min)
    local coords = GetEntityCoords(entity)
    local newCoords
    local currCoords = GetEntityCoords(entity)
    if direction == "up" then
        newCoords = vector3(coords.x, coords.y, coords.z + 0.1)
        if currCoords.z >= max then
            -- print("you went higher than the target")
        else
            FreezeEntityPosition(entity, false)
            SetEntityCoordsNoOffset(entity, newCoords.x, newCoords.y, newCoords.z, 1, 0, 0, 1)
            FreezeEntityPosition(entity, true)
        end
    elseif direction == "down" then
        newCoords = vector3(coords.x, coords.y, coords.z - 0.1)
        if currCoords.z < min then
            -- print("you went lower than the target")
        else
            FreezeEntityPosition(entity, false)
            SetEntityCoordsNoOffset(entity, newCoords.x, newCoords.y, newCoords.z, 1, 0, 0, 1)
            FreezeEntityPosition(entity, true)
        end
    end
end

-- Function to check the vehicle state
function CheckVehicleState(vehicle, check)
    local bodyHealth = GetVehicleBodyHealth(vehicle)
    local engineHealth = GetVehicleEngineHealth(vehicle)
    local doorsBroken = {}
    local flatTires = 0
    local brokenWindows = 0

    for i = 0, GetNumberOfVehicleDoors(vehicle) - 1 do
        if IsVehicleDoorDamaged(vehicle, i) then
            if i >= 0 and i <= 3 then 
				table.insert(doorsBroken, { type = "door" })
			end
			if i == 4 then 
                table.insert(doorsBroken, { type = "hood" })
			elseif i == 5 then 
                table.insert(doorsBroken, { type = "trunk" })
			elseif i == 6 then 
                table.insert(doorsBroken, { type = "trunk" })
            end
        end
    end

    for i = 0, GetVehicleNumberOfWheels(vehicle) - 1 do
        -- print(i)
		if IsVehicleTyreBurst(vehicle, i) or GetVehicleWheelXOffset(vehicle, i) == 9999.0 then
            flatTires = flatTires + 1
            -- print(i .. " is flat")
        end
	end

    -- Check for the tires
    if flatTires > 0 then
        if check then
            notify(flatTires .. " tires are flat, you gotta replace them.", 30000, "warning")
        end
    end

    -- Check if the doors are broken
    if #doorsBroken > 0 then
        if check then
            notify(#doorsBroken .. " door(s) of the vehicle are broken. You need to replace them.", 30000, "warning")
        end
    end

    -- Check if the windows are broken
    if GetVehicleClass(vehicle) ~= 14 and GetVehicleClass(vehicle) ~= 13 and GetVehicleClass(vehicle) ~= 8 then
        for i = 0, 3 do
            if IsVehicleWindowIntact(vehicle, i) == false then
                brokenWindows = brokenWindows + 1
            end
        end
    end

    if brokenWindows > 0 then
        if check then
            notify("The vehicle's windows are smashed. You need to replace ".. brokenWindows .." windows.", 30000, "warning")
        end
    end

    -- Check if the vehicle is drivable
    if engineHealth < 1000.0 or bodyHealth < 1000.0 or #doorsBroken > 0 or brokenWindows > 0 or flatTires > 0 then
        local calcPerc = math.floor((engineHealth / 1000.0) * 100)
        local calcPerc2 = math.floor((bodyHealth / 1000.0) * 100)
        if check then
            if engineHealth < 1000.0 then
                if engineHealth <= 0 then
                    notify("The vehicle's engine is dead. You need to replace it.", 30000, "error")
                else
                    local eachMaterial = getNeededMaterials(calcPerc, 2)
                    local engNeededMat = eachMaterial * #Config.materials
                    notify("Engine health is at ".. calcPerc .."% You will need around ".. engNeededMat .." materials ( " ..eachMaterial.. " of each material ).", 30000, "info")
                end
            end
            if bodyHealth < 1000.0 then
                local eachMaterial = getNeededMaterials(calcPerc2, 2)
                local bodNeededMat = eachMaterial * #Config.materials
                -- print("bodNeededMat: "..bodNeededMat)
                notify("Body health is at ".. calcPerc2 .."% You will need around ".. bodNeededMat .." materials ( " ..eachMaterial.. " of each material ).", 30000, "info")
            end
            notify("Vehicle need repairs!", 30000, "warning")
        end
        local savedStats = {
            veh = vehicle,
            engineHealth = calcPerc,
            bodyHealth = calcPerc2,
            doorsBroken = doorsBroken,
            windows = brokenWindows,
            tires = flatTires,
        }
        return savedStats
    else
        if check then
            notify("Vehicle is perfect!", 8000, "success")
        end
        return false
    end
end

RegisterNetEvent("an_mechanicjob:useRK", function(adv)
    if isUsingRepairKit then
        return
    end
    local player = PlayerPedId()
    local veicle = nil
    if IsPedInAnyVehicle(player, false) then
        vehicle = GetVehiclePedIsIn(player, false)
    else
        if Config.usingESX then
            local tempVeh, tempDist = ESX.Game.GetClosestVehicle()
            if tempVeh and tempDist <= 6.0 then
                vehicle = tempVeh
            else
                vehicle = nil
            end
        else
            local tempVeh, tempDist = QBCore.Functions.GetClosestVehicle()
            if tempVeh and tempDist <= 6.0 then
                vehicle = tempVeh
            else
                vehicle = nil
            end
        end
    end
    if vehicle then
        isUsingRepairKit = true
        TriggerServerEvent("an_mechanicjob:removeRK")
        Citizen.CreateThread(function()
            local bodyHealth = GetVehicleBodyHealth(vehicle)
            local engineHealth = GetVehicleEngineHealth(vehicle)
            local ped = PlayerPedId()
            local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
            local enginePos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0)
            local coords = GetEntityCoords(ped)
            local distance = (GetDistanceBetweenCoords(coords, vector3(enginePos.x, enginePos.y, enginePos.z), true))
            while true do
                enginePos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0)
                coords = GetEntityCoords(ped)
                distance = (GetDistanceBetweenCoords(coords, vector3(enginePos.x, enginePos.y, enginePos.z), true))
                if distance <= 5.0 and distance > 1.5 then
                    DrawMarker(2, enginePos.x, enginePos.y, enginePos.z + 0.5, 0, 0, 0, 0, 0, 0, 0.3, 0.3, 0.2, 42, 166, 185, 255, true, false, 2, true, nil, nil, false)
                elseif distance <= 1.5 then
                    DrawText3Ds(enginePos.x, enginePos.y, enginePos.z + 0.5, '~y~[E]~s~ Repair Vehicle')
                    if IsControlJustPressed(0, 38) then
                        TaskTurnPedToFaceEntity(ped, vehicle, 1.0)
                        Citizen.Wait(1000)
                        SetVehicleDoorOpen(vehicle,4,0,0)
                        local anim_dict = "mini@repair"
                        local anim_lib	= "fixing_a_player"
                        LoadAnim(anim_dict)
                        TaskPlayAnim(ped, anim_dict, anim_lib, 2.0, -3.5, -1, 1, false, false, false, false)
                        FreezeEntityPosition(ped, true)
                        if Config.useANProgBar then
                            exports['an_progBar']:run(8, "REPAIRING VEHICLE")
                        else
                            notify("REPAITING VEHICLE", 8000, "info")
                        end
                        Citizen.Wait(8000)
                        FreezeEntityPosition(ped, false)
                        ClearPedTasks(ped)
                        SetVehicleDoorShut(vehicle,4,0)
                        Citizen.Wait(250)
                        if bodyHealth < 300.0 then
                            SetVehicleBodyHealth(vehicle, 300.0)
                        elseif bodyHealth >= 300.0 and bodyHealth < 500.0 then
                            SetVehicleBodyHealth(vehicle, 500.0)
                        elseif bodyHealth >= 500.0 and bodyHealth < 700.0 then
                            SetVehicleBodyHealth(vehicle, 700.0)
                        end
                        if adv then
                            if engineHealth < 300.0 then
                                SetVehicleEngineHealth(vehicle, 300.0)
                            elseif engineHealth >= 300.0 and engineHealth < 500.0 then
                                SetVehicleEngineHealth(vehicle, 500.0)
                            elseif engineHealth >= 500.0 and engineHealth < 700.0 then
                                SetVehicleEngineHealth(vehicle, 700.0)
                            end
                        end
                        for i = 0, GetVehicleNumberOfWheels(vehicle) do
                            if IsVehicleTyreBurst(vehicle, i) or GetVehicleWheelXOffset(vehicle, i) == 9999.0 then
                                SetVehicleTyreFixed(vehicle, i)
                            end
                        end
                        isUsingRepairKit = false
                        notify("VEHICLE SUCCESSFULLY REPAIRED", 8000, "success")
                        break
                    end
                end
                Citizen.Wait(4)
            end
        end)
    else
        notify("No vehicle nearby!", 8000, "error")
    end
end)

RegisterNetEvent("an_mechanicjob:repairCL", function(success, vehicle)
    if isUsingToolbox then
        isUsingToolbox = false
    end
    if not success then
        notify("You don't have enough material.", 8000, "error")
        return
    else
        if isRepairing then
            notify("You already started repairing a vehicle, now it's canceled.", 8000, "error")
            isRepairing = false
            return
        end
        isRepairing = true
        notify("You have all the needed material, now get to work!", 12000, "success")
        Citizen.CreateThread(function()
            local ped = PlayerPedId()
            local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
            local enginePos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0)
            local coords = GetEntityCoords(ped)
            local distance = (GetDistanceBetweenCoords(coords, vector3(enginePos.x, enginePos.y, enginePos.z), true))
            while true do
                enginePos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0)
                coords = GetEntityCoords(ped)
                distance = (GetDistanceBetweenCoords(coords, vector3(enginePos.x, enginePos.y, enginePos.z), true))
                if distance <= 5.0 and distance > 1.5 then
                    DrawMarker(2, enginePos.x, enginePos.y, enginePos.z + 0.5, 0, 0, 0, 0, 0, 0, 0.3, 0.3, 0.2, 42, 166, 185, 255, true, false, 2, true, nil, nil, false)
                elseif distance <= 1.5 then
                    DrawText3Ds(enginePos.x, enginePos.y, enginePos.z + 0.5, '~HUD_COLOUR_NET_PLAYER25~[E]~s~ Repair Vehicle')
                    if IsControlJustPressed(0, 38) then
                        TaskTurnPedToFaceEntity(ped, vehicle, 1.0)
                        Citizen.Wait(1000)
                        SetVehicleDoorOpen(vehicle,4,0,0)
                        local anim_dict = "mini@repair"
                        local anim_lib	= "fixing_a_player"
                        LoadAnim(anim_dict)
                        TaskPlayAnim(ped, anim_dict, anim_lib, 2.0, -3.5, -1, 1, false, false, false, false)
                        FreezeEntityPosition(ped, true)
                        if Config.useANProgBar then
                            exports['an_progBar']:run(4, "INITIAL INSPECTION")
                            Citizen.Wait(4300)
                            exports['an_progBar']:run(5, "ENGINE INSPECTION")
                            Citizen.Wait(5300)
                            exports['an_progBar']:run(8, "FIXING ENGINE")
                            Citizen.Wait(8300)
                            exports['an_progBar']:run(5, "BODY INSPECTION")
                            Citizen.Wait(5300)
                            exports['an_progBar']:run(8, "FIXING BODY")
                            Citizen.Wait(8300)
                            exports['an_progBar']:run(4, "CHANGING ENGINE OIL")
                            Citizen.Wait(4300)
                            exports['an_progBar']:run(4, "RECHARGING BATTERY")
                            Citizen.Wait(4300)
                            exports['an_progBar']:run(4, "INSPECTING COOLANT")
                            Citizen.Wait(4300)
                            exports['an_progBar']:run(4, "CHANGING OIL & AIR FILTERS")
                            Citizen.Wait(4300)
                            exports['an_progBar']:run(4, "INSPECTING DISC & BRAKE PADS")
                            Citizen.Wait(4300)
                            exports['an_progBar']:run(2.5, "FINALIZING WORK")
                            Citizen.Wait(2800)
                        else
                            notify("INITIAL INSPECTION", 4000, "info")
                            Citizen.Wait(4000)
                            notify("ENGINE INSPECTION", 5000, "info")
                            Citizen.Wait(5000)
                            notify("FIXING ENGINE", 8000, "info")
                            Citizen.Wait(8000)
                            notify("BODY INSPECTION", 5000, "info")
                            Citizen.Wait(5000)
                            notify("FIXING BODY", 8000, "info")
                            Citizen.Wait(8000)
                            notify("CHANGING ENGINE OIL", 4000, "info")
                            Citizen.Wait(4000)
                            notify("RECHARGING BATTERY", 4000, "info")
                            Citizen.Wait(4000)
                            notify("INSPECTING COOLANT", 4000, "info")
                            Citizen.Wait(4000)
                            notify("CHANGING OIL & AIR FILTERS", 4000, "info")
                            Citizen.Wait(4000)
                            notify("INSPECTING DISC & BRAKE PADS", 4000, "info")
                            Citizen.Wait(4000)
                            notify("FINALIZING WORK", 2500, "info")
                            Citizen.Wait(2500)
                        end
                        FreezeEntityPosition(ped, false)
                        ClearPedTasks(ped)
                        SetVehicleDoorShut(vehicle,4,0)
                        Citizen.Wait(250)
                        SetVehicleBodyHealth(vehicle, 1000.0)
                        SetVehicleEngineHealth(vehicle, 1000.0)
                        SetVehicleFixed(vehicle)
                        SetVehicleDirtLevel(vehicle, 0.0)
                        isRepairing = false
                        break
                    end
                end
                Citizen.Wait(4)
            end
        end)
    end
end)

RegisterNetEvent('an_mechanicjob:toolboxuse', function()
    if isUsingToolbox then
        notify("You now have canceled the inspection of the vehicle.", 8000, "error")
        isUsingToolbox = false
        return
    end
    if isRepairing then
        notify("You are already on a repair job.", 8000, "error")
        return
    end
    local vehOnLiftCoords = GetEntityCoords(vehOnLift)
    local dist = #(vehOnLiftCoords - GetEntityCoords(PlayerPedId()))
    if vehOnLift and dist <= 10.0 then
        startVehicleRepair(vehOnLift)
    elseif startedCarJack and carJack ~= nil and carJackedVeh ~= nil and DoesEntityExist(carJack) and DoesEntityExist(carJackedVeh) then
        local CJCoords = GetEntityCoords(carJack)
        local dist = #(CJCoords - GetEntityCoords(PlayerPedId()))
        if dist <= 10.0 then
            CheckVehicleState(carJackedVeh, true)
            startVehicleRepair(carJackedVeh)
        end
    else
        isUsingToolbox = true
        local ped = PlayerPedId()
        local vehicle = nil
        if IsPedInAnyVehicle(ped, false) then
            vehicle = GetVehiclePedIsIn(ped, false)
        else
            if Config.usingESX then
                local tempVeh, tempDist = ESX.Game.GetClosestVehicle()
                if tempVeh and tempDist <= 6.0 then
                    vehicle = tempVeh
                else
                    vehicle = nil
                end
            else
                local tempVeh, tempDist = QBCore.Functions.GetClosestVehicle()
                if tempVeh and tempDist <= 6.0 then
                    vehicle = tempVeh
                else
                    vehicle = nil
                end
            end
        end
        if vehicle ~= nil then
            notify("You started using your toolbox to inspect this vehicle..", 10000, "info")
            local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
            local enginePos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0)
            local coords = GetEntityCoords(ped)
            local distance = (GetDistanceBetweenCoords(coords, vector3(enginePos.x, enginePos.y, enginePos.z), true))
            
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(4)
                    enginePos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0)
                    coords = GetEntityCoords(ped)
                    distance = (GetDistanceBetweenCoords(coords, vector3(enginePos.x, enginePos.y, enginePos.z), true))
                    if not isUsingToolbox then
                        return
                    end
                    if distance <= 5.0 and distance > 1.5 then
                        DrawMarker(2, enginePos.x, enginePos.y, enginePos.z + 0.5, 0, 0, 0, 0, 0, 0, 0.3, 0.3, 0.2, 42, 166, 185, 255, true, false, 2, true, nil, nil, false)
                    elseif distance <= 1.5 then
                        DrawText3Ds(enginePos.x, enginePos.y, enginePos.z, '~HUD_COLOUR_NET_PLAYER25~[E]~s~ Diagnose Vehicle')
                        if IsControlJustPressed(0, 38) then
                            TaskTurnPedToFaceEntity(ped, vehicle, 1.0)
                            Citizen.Wait(1000)
                            SetVehicleDoorOpen(vehicle,4,0,0)
                            local anim_dict = "mini@repair"
                            local anim_lib	= "fixing_a_player"
                            LoadAnim(anim_dict)
                            TaskPlayAnim(ped, anim_dict, anim_lib, 2.0, -3.5, -1, 1, false, false, false, false)
                            if Config.useANProgBar then
                                exports['an_progBar']:run(2, "INSPECTING: ENGINE")
                                Citizen.Wait(2300)
                                exports['an_progBar']:run(2, "CHECKING: ENGINE OIL")
                                Citizen.Wait(2300)
                                exports['an_progBar']:run(2, "CHECKING: BATTERY")
                                Citizen.Wait(2300)
                                exports['an_progBar']:run(2, "CHECKING: COOLANT")
                                Citizen.Wait(2300)
                                exports['an_progBar']:run(2, "CHECKING: OIL & AIR FILTERS")
                                Citizen.Wait(2300)
                                exports['an_progBar']:run(2, "CHECKING: DISC & BRAKE PADS")
                                Citizen.Wait(2300)
                            else
                                notify("INSPECTING: ENGINE", 2000, "info")
                                Citizen.Wait(2000)
                                notify("CHECKING: ENGINE OIL", 2000, "info")
                                Citizen.Wait(2000)
                                notify("CHECKING: BATTERY", 2000, "info")
                                Citizen.Wait(2000)
                                notify("CHECKING: COOLANT", 2000, "info")
                                Citizen.Wait(2000)
                                notify("CHECKING: OIL & AIR FILTERS", 2000, "info")
                                Citizen.Wait(2000)
                                notify("CHECKING: DISC & BRAKE PADS", 2000, "info")
                                Citizen.Wait(2000)
                            end
                            ClearPedTasks(ped)
                            SetVehicleDoorShut(vehicle, 4,0)
                            CheckVehicleState(vehicle, true)
                            isUsingToolbox = false
                            break
                        end
                    end
                end
            end)
        else
            isUsingToolbox = false
            notify("No vehicle?", 8000, "error")
        end
    end
end)

-- Function to fix the vehicle
function startVehicleRepair(vehicle)
    local savedStats = CheckVehicleState(vehicle)
    if savedStats then
        if savedStats.veh ~= 0 then
            local vehModel = GetDisplayNameFromVehicleModel(GetEntityModel(savedStats.veh))
            if vehModel == "CARNOTFOUND" then
                vehModel = GetEntityModel(savedStats.veh)
            end
            if savedStats.engineHealth < 0 then
                if gotItem("car_engine", 1) then
                    tempNeeded["car_engine"] = 1
                else
                    notify("You need to grab a new "..vehModel.." engine, this one is RIP.", 18000, "warning")
                    tempNeeded = {}
                    return
                end
            elseif savedStats.engineHealth > 0 and savedStats.engineHealth < 100 then
                local neededmaterials = getNeededMaterials(savedStats.engineHealth, 1)
                local hasMaterials = getMaterials(neededmaterials)
                Wait(50)
                if not hasMaterials then
                    notify("You need x"..neededmaterials.." of each material ( "..materialString.." ) to fix the current "..vehModel.." engine.", 18000, "warning")
                    tempNeeded = {}
                    return
                end
            end
            if savedStats.tires > 0 then
                if gotItem("car_wheel", savedStats.tires) then
                    tempNeeded["car_wheel"] = savedStats.tires
                else
                    notify("You need to replace "..savedStats.tires.." tires.", 18000, "warning")
                    tempNeeded = {}
                    return
                end
            end
            if #savedStats.doorsBroken > 0 then
                local Doors = 0
                local Trunk = 0
                local Hood = 0
                for k,v in pairs(savedStats.doorsBroken) do
                    -- print(k)
                    -- print(v.type)
                    if v.type == "door" then
                        Doors = Doors + 1
                    elseif v.type == "trunk" then
                        Trunk = Trunk + 1
                    elseif v.type == "hood" then
                        Hood = Hood + 1
                    end
                end
                if Doors > 0 then
                    if gotItem("car_door", Doors) then
                        tempNeeded["car_door"] = Doors
                    else
                        notify("You need x"..Doors.." car door(s).", 18000, "warning")
                        tempNeeded = {}
                        return
                    end
                end
                if Trunk > 0 then
                    if gotItem("car_trunk", Trunk) then
                        tempNeeded["car_trunk"] = Trunk
                    else
                        notify("You need x"..Trunk.." car trunk(s).", 18000, "warning")
                        tempNeeded = {}
                        return
                    end
                end
                if Hood > 0 then
                    if gotItem("car_hood", Hood) then
                        tempNeeded["car_hood"] = Hood
                    else
                        notify("You need x"..Hood.." car hood(s).", 18000, "warning")
                        tempNeeded = {}
                        return
                    end
                end
            end
            if savedStats.bodyHealth < 100 then
                local neededmaterials = getNeededMaterials(savedStats.bodyHealth, 2)
                local hasMaterials = getMaterials(neededmaterials)
                Wait(50)
                if not hasMaterials then
                    notify("You need x"..neededmaterials.." of each material ( "..materialString.." ) to fix the vehicle body.", 18000, "warning")
                    tempNeeded = {}
                    return
                end
            end
            if savedStats.windows > 0 then
                if gotItem("car_window", savedStats.windows) then
                    tempNeeded["car_window"] = savedStats.windows
                else
                    notify("You need x"..savedStats.windows.." vehicle window(s).", 18000, "warning")
                    tempNeeded = {}
                    return
                end
            end
            notify("You have all the items needed, preparing to fix the vehicle..", 18000, "success")
            -- Send to server to check for items and remove them before calling him back to the client to start working...
            TriggerServerEvent("an_mechanicjob:repairSV", tempNeeded, vehicle)
            tempNeeded = {}
        else
            notify("No vehicle found!", 8000, "error")
        end
    else
        notify("That vehicle is in perfect shape.", 8000, "success")
    end
end

function getNeededMaterials(perc, type)
    if type == 1 then -- engine
        if perc < 25 then
            materialsNeeded = Config.neededMaterials.ENGINE["0-25"]
        elseif perc < 50 then
            materialsNeeded = Config.neededMaterials.ENGINE["25-50"]
        elseif perc < 75 then
            materialsNeeded = Config.neededMaterials.ENGINE["50-75"]
        else
            materialsNeeded = Config.neededMaterials.ENGINE["75-100"]
        end
    elseif type == 2 then
        if perc < 25 then
            materialsNeeded = Config.neededMaterials.BODY["0-25"]
        elseif perc < 50 then
            materialsNeeded = Config.neededMaterials.BODY["25-50"]
        elseif perc < 75 then
            materialsNeeded = Config.neededMaterials.BODY["50-75"]
        else
            materialsNeeded = Config.neededMaterials.BODY["75-100"]
        end
    end
    return materialsNeeded
end

function getMaterials(amount)
    local gotMaterials = false
    for i = 1, #Config.materials do
        local currMaterial = Config.materials[i].item
        local currAmount = amount
        if tempNeeded[currMaterial] then
            currAmount = currAmount + tempNeeded[currMaterial]
        end
        if not gotItem(currMaterial, currAmount) then
            -- print(currMaterial .. " - "..tempNeeded[currMaterial])
            return false
        end
        tempNeeded[currMaterial] = currAmount
    end
    return true
end

function gotItem(item,amount)
    if Config.usingESX then
        local myInv = ESX.GetPlayerData().inventory
        for k,v in pairs(myInv) do
            if v.name == item then
                if v.count >= amount then
                    return true
                end
            end
        end
        return false
    else
        local playerData = QBCore.Functions.GetPlayerData()
        local myInv = playerData.items
        local totalAmountTemp = 0
        for k,v in pairs(myInv) do
            if v.name == item then
                totalAmountTemp = totalAmountTemp + v.amount
            end
        end
        if totalAmountTemp >= amount then
            return true
        end
        return false
    end
end

function openCraftingMenu()
    TriggerScreenblurFadeIn(500)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open",
        recipes = Config.craftingRecipes,
        title = Config.craftTitle
    })
end

function openSpawnerMenu()
    TriggerScreenblurFadeIn(500)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "spawner",
        vehicles = Config.garage,
        title = Config.garageTitle
    })
end

function refreshBossMenu()
    Wait(500) -- wait a bit
    openBossMenu() -- reload data
end

function openBossMenu()
    if Config.usingESX then
        -- esx callback
        ESX.TriggerServerCallback('esx_society:getJob', function(job)
            local jobData = job
            for k,v in pairs(Config.ranks) do
                v.salary = jobData.grades[v.grade + 1].salary
                -- print(v.label)
                -- print(v.salary)
            end
            ESX.TriggerServerCallback('an_mechanicjob:getAllPlayers', function(players)
                local playerList = {}
                for k,v in pairs(players) do
                    playerList[v.playerId] = { id = v.playerId, name = GetPlayerName(GetPlayerFromServerId(v.playerId)) }
                end
                local mechanics = {}
                ESX.TriggerServerCallback('esx_society:getEmployees', function(employees)
                    for i=1, #employees, 1 do
                        table.insert(mechanics, { grade = employees[i].job.grade, grade_label = employees[i].job.grade_label, name = employees[i].name, identifier = employees[i].identifier })
                    end
                    ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(societymoney)
                        local socMoney = societymoney
                        TriggerScreenblurFadeIn(500)
                        SetNuiFocus(true, true)
                        SendNUIMessage({
                            type = "bossmenu",
                            ranks = Config.ranks,
                            players = playerList,
                            mechanics = mechanics,
                            money = socMoney,
                        })
                    end, Config.jobName)
                end, Config.jobName)
            end)
        end, Config.jobName)
    else
        -- qb callback
        if Config.useQBBossMenu then
            TriggerEvent("qb-bossmenu:client:OpenMenu")
        else
            local jobData = QBCore.Shared.Jobs[Config.jobName]
            for k,v in pairs(Config.ranks) do
                v.salary = jobData.grades[tostring(v.grade)].payment
            end
            QBCore.Functions.TriggerCallback('an_mechanicjob:getAllPlayers', function(players)
                local playerList = {}
                for k,v in pairs(players) do
                    playerList[v.PlayerData.source] = { id = v.PlayerData.source, name = v.PlayerData.name }
                end
                local mechanics = {}
                QBCore.Functions.TriggerCallback("qb-bossmenu:server:GetEmployees", function(employees)
                    for i, employee in pairs(employees) do
                        -- print(employee.grade.level)
                        -- print(employee.grade.name)
                        -- print(employee.name)
                        -- print(employee.empSource)
                        table.insert(mechanics, {
                            grade = employee.grade.level,
                            grade_label = employee.grade.name,
                            name = employee.name,
                            identifier = employee.empSource
                        })
                    end
                    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetAccount', function(societymoney)
                        local socMoney = societymoney
                        TriggerScreenblurFadeIn(500)
                        SetNuiFocus(true, true)
                        SendNUIMessage({
                            type = "bossmenu",
                            ranks = Config.ranks,
                            players = playerList,
                            mechanics = mechanics,
                            money = socMoney,
                        })
                    end, Config.jobName)
                end, Config.jobName)
            end)
        end
    end
end

RegisterNUICallback('recruit', function(data, cb)
    local mySVID = GetPlayerServerId(PlayerId())
    if tonumber(data.player) == mySVID then
        notify("You cannot recruit yourself!", 10000, "error")
        return
    end
    if Config.usingESX then
        TriggerServerEvent("an_mechanicjob:recruit", data.player)
    else
        TriggerServerEvent("qb-bossmenu:server:HireEmployee", tonumber(data.player))
    end
    cb("ok")
end)

-- RegisterCommand("testboss", function(s,a,r)
--     TriggerEvent("qb-bossmenu:client:OpenMenu")
-- end)

RegisterNUICallback('fire', function(data, cb)
    if Config.usingESX then
        ESX.TriggerServerCallback('esx_society:setJob', function()
            notify("You successfully fired "..data.employee.name, 18000, "success")
        end, data.employee.identifier, "unemployed", 0, "fire")
    else
        TriggerServerEvent("qb-bossmenu:server:FireEmployee", data.employee.identifier)
    end
    cb("ok")
end)

RegisterNUICallback('changeRank', function(data, cb)
    if Config.usingESX then
        ESX.TriggerServerCallback('esx_society:setJob', function()
            notify("You changed the rank for "..data.employee.name.." to "..data.rank.label, 18000, "info")
        end, data.employee.identifier, Config.jobName, data.rank.grade, "promote")
    else
        if PlayerData.citizenid == data.employee.identifier then
            notify("You can't change the rank for yourself! ", 18000, "info")
            return
        end
        local gradeData = {
            cid = data.employee.identifier,
            grade = data.rank.grade,
            gradename = data.rank.label,
        }
        TriggerServerEvent("qb-bossmenu:server:GradeUpdate", gradeData)
    end
    cb("ok")
end)

RegisterNUICallback('changeSalary', function(data, cb)
    if Config.usingESX then
        ESX.TriggerServerCallback('esx_society:setJobSalary', function()
            notify("You changed the salary for "..data.rank.label.." to $"..data.newSalary.."", 18000, "info")
        end, Config.jobName, data.rank.grade, tonumber(data.newSalary))
    else
        notify("Unfortunately, this can only be done through modifying: qb-core/shared/jobs.lua | Please contact the owner of the city for this.", 10000, "error")
    end
    cb("ok")
end)

RegisterNUICallback('finance', function(data, cb)
    local amount = tonumber(data.amount)
    if Config.usingESX then
        if data.type == "withdraw" then
            TriggerServerEvent("esx_society:withdrawMoney", Config.jobName, amount)
        elseif data.type == "deposit" then
            TriggerServerEvent("esx_society:depositMoney", Config.jobName, amount)
        end
    else
        if data.type == "withdraw" then
            TriggerServerEvent("qb-bossmenu:server:withdrawMoney", amount)
        elseif data.type == "deposit" then
            TriggerServerEvent("qb-bossmenu:server:depositMoney", amount)
        end
    end
    cb("ok")
end)

RegisterNUICallback('refreshBossMenu', function(data, cb)
    refreshBossMenu()
    cb("ok")
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(500)
    cb("ok")
end)

RegisterNUICallback('spawnVeh', function(data, cb)
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(500)
    spawnveh(data.vehicle)
    cb("ok")
end)

function spawnveh(model)
    local label = Config.garage[model].label
    local livery = Config.garage[model].livery
    local colors = Config.garage[model].colors
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    if Config.usingESX then
        ESX.Game.SpawnVehicle(model, coords, heading, function(vehicle)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetEntityAsMissionEntity(vehicle, true, true)
            local plate = GetVehicleNumberPlateText(vehicle)
            if colors then
                SetVehicleCustomPrimaryColour(vehicle, colors["primary"].r, colors["primary"].g, colors["primary"].b)
                SetVehicleCustomSecondaryColour(vehicle, colors["secondary"].r, colors["secondary"].g, colors["secondary"].b)
            end
            if livery then
                SetVehicleLivery(vehicle, livery)
            end
            GiveKeysForThisCar(plate)
            notify("You have taken out a "..label, 8000, "info")
        end)
    else
        QBCore.Functions.SpawnVehicle(model, function(veh)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            SetEntityAsMissionEntity(veh, true, true)
            SetEntityHeading(veh, heading)
            if colors then
                SetVehicleCustomPrimaryColour(vehicle, colors["primary"].r, colors["primary"].g, colors["primary"].b)
                SetVehicleCustomSecondaryColour(vehicle, colors["secondary"].r, colors["secondary"].g, colors["secondary"].b)
            end
            if livery then
                SetVehicleLivery(vehicle, livery)
            end
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
            notify("You have taken out a "..label, 8000, "info")
        end, coords, false)
    end
end

RegisterNUICallback('craft', function(data, cb)
    if isCrafting then
        notify("You are already crafting something!", 8000, "error")
        return
    end
    local itemName = data.item
    local recipe = Config.craftingRecipes[itemName]
    local hasMaterials = true
    if Config.usingESX then
        local inv = ESX.GetPlayerData().inventory
        for k,v in pairs(recipe.ingredients) do
            local itemFound = false
            for _,item in pairs(inv) do
                if item.name == k and item.count >= v.amount then
                    itemFound = true
                    break
                end
            end
            if not itemFound then
            hasMaterials = false
            break
            end
        end
    else
        -- QB
        local PlayerData = QBCore.Functions.GetPlayerData()
        local inv = PlayerData.items
        for k,v in pairs(recipe.ingredients) do
            local itemFound = false
            for _,item in pairs(inv) do
                if item.name == k and item.amount >= v.amount then
                    itemFound = true
                    break
                end
            end
            if not itemFound then
                hasMaterials = false
                break
            end
        end

    end
    if hasMaterials then
        isCrafting = true
        local ped = PlayerPedId()
        FreezeEntityPosition(ped, true)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true)
        notify("You started crafting a ".. recipe.label, recipe.duration, "info")
        if Config.useANProgBar then
            exports['an_progBar']:run(recipe.duration/1000, "Crafting "..recipe.label)
            Citizen.Wait(recipe.duration + 300)
        else
            notify("Crafting "..recipe.label, recipe.duration, "info")
            Citizen.Wait(recipe.duration)
        end
        TriggerServerEvent("an_mechanicjob:craftItem", itemName, recipe.ingredients)
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)
        ExecuteCommand("e box")
        isCrafting = false
    else
        notify("You do not have enough materials!", 8000, "error")
    end
    cb("ok")
end)

-- Car Jack Item Event
RegisterNetEvent('an_mechanicjob:carjack', function()
    local playerPed = PlayerPedId()
    local vehicle = nil

    if IsPedInAnyVehicle(player, false) then
        vehicle = GetVehiclePedIsIn(player, false)
    else
        if Config.usingESX then
            local tempVeh, tempDist = ESX.Game.GetClosestVehicle()
            if tempVeh and tempDist <= 6.0 then
                vehicle = tempVeh
            else
                vehicle = nil
            end
        else
            local tempVeh, tempDist = QBCore.Functions.GetClosestVehicle()
            if tempVeh and tempDist <= 6.0 then
                vehicle = tempVeh
            else
                vehicle = nil
            end
        end
    end

    if not vehicle then
        notify("Where is the vehicle?", 18000, "error")
    elseif startedCarJack then
        notify("You already started car jacking a vehicle!", 18000, "info")
    else
        isCarJacking = not isCarJacking
        if not isCarJacking then
            notify("You stopped your car jack procedure!", 18000, "info")
        else
            notify("Go to the right side of the vehicle and install your car jack!", 18000, "info")
        end
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5)

                if not isCarJacking or startedCarJack then
                    return
                end
                
                local playerCoords = GetEntityCoords(playerPed)

                if DoesEntityExist(vehicle) then
                    SetEntityAsMissionEntity(vehicle)
                    local vehicleCoords = GetEntityCoords(vehicle)
                    local vehicleRightVector = GetOffsetFromEntityInWorldCoords(vehicle, 3.0, 0.0, 0.0) - vehicleCoords
                    local markerCoords = vehicleCoords + vehicleRightVector * 0.5
                    
                    local distance = #(playerCoords - markerCoords)
                    
                    if distance > 1.2 then
                        DrawMarker(2, markerCoords.x, markerCoords.y, markerCoords.z + 0.2, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.3, 42, 166, 185, 255, true, false, 2, true, nil, nil, false)
                    elseif distance <= 1.2 then
                        DrawText3Ds(markerCoords.x, markerCoords.y, markerCoords.z + 0.2, "[~HUD_COLOUR_NET_PLAYER25~E~s~] Install Car Jack")
                        if IsControlJustPressed(0, 38) then
                            carJack(vehicle)
                            Wait(500)
                        end
                    end
                end
            end
        end)
    end
end)

function carJack(vehicle)
    startedCarJack = true
    
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local vehiclePos = GetEntityCoords(vehicle)
    local direction = vehiclePos - playerPos
    local rotation = vector3(0, 0, GetEntityHeading(vehicle) - 90)
    SetEntityRotation(playerPed, rotation, 1, true)

    -- set the player's rotation to face the vehicle

    -- play the animation
    LoadAnim("amb@world_human_vehicle_mechanic@male@idle_a")

    TaskPlayAnim(playerPed, "amb@world_human_vehicle_mechanic@male@idle_a", "idle_a", 8.0, -8.0, -1, 1, 0, false, false, true)
    SetEntityRotation(playerPed, rotation, 1, true)
    Citizen.Wait(500) -- wait a bit before placing the car jack
    local coords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.3, 0.0)
    carJack = CreateObject(GetHashKey("prop_carjack"), coords.x, coords.y, coords.z, true, true, true)
    Citizen.CreateThread(function()
        FreezeEntityPosition(carJack, true)
        FreezeEntityPosition(vehicle, true)
        SetEntityCollision(carJack, false, true)
        PlaceObjectOnGroundProperly(carJack)
        Wait(300)
        for i = 1, 40 do
            Wait(100)
            FreezeEntityPosition(vehicle, false)
            local currCoords = GetEntityCoords(vehicle)
            local newCoords = vector3(currCoords.x, currCoords.y, currCoords.z + 0.02)
            SetEntityCoordsNoOffset(vehicle, newCoords.x, newCoords.y, newCoords.z, 1, 0, 0, 1)
            FreezeEntityPosition(vehicle, true)
        end
        carJackedVeh = vehicle
    end)

    if Config.useANProgBar then
        exports['an_progBar']:run(8, "Mounting Car Jack")
        Citizen.Wait(8000)
    else
        notify("Mounting Car Jack", 8000, "info")
        Citizen.Wait(8000)
    end
    ClearPedTasks(playerPed)

    Citizen.CreateThread(function()
        while true do
            Wait(5)
            if startedCarJack and isCarJacking then
                if carJack ~= nil then
                    if DoesEntityExist(carJack) and DoesEntityExist(carJackedVeh) then
                        local playerCoords = GetEntityCoords(playerPed)
                        local vehicleCoords = GetEntityCoords(carJackedVeh)
                        local vehicleRightVector = GetOffsetFromEntityInWorldCoords(carJackedVeh, 3.0, 0.0, 0.0) - vehicleCoords
                        local markerCoords = vehicleCoords + vehicleRightVector * 0.5
                        local dst = #(playerCoords - markerCoords)
                        if dst > 2.0 then
                            DrawMarker(2, markerCoords.x, markerCoords.y, markerCoords.z - 0.3, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.3, 185, 20, 30, 255, true, false, 2, true, nil, nil, false)
                        elseif dst <= 2.0 then
                            DrawText3Ds(markerCoords.x, markerCoords.y, markerCoords.z - 0.3, "[~r~H~s~] Remove Car Jack")
                            if IsControlJustPressed(0, 74) then
                                isCarJacking = false
                                SetEntityRotation(playerPed, rotation, 1, true)
                                TaskPlayAnim(playerPed, "amb@world_human_vehicle_mechanic@male@idle_a", "idle_a", 8.0, -8.0, -1, 1, 0, false, false, true)
                                SetEntityRotation(playerPed, rotation, 1, true)
                                Citizen.CreateThread(function()
                                    for i = 1, 40 do
                                        Wait(100)
                                        FreezeEntityPosition(vehicle, false)
                                        local currCoords = GetEntityCoords(vehicle)
                                        local newCoords = vector3(currCoords.x, currCoords.y, currCoords.z - 0.02)
                                        SetEntityCoordsNoOffset(vehicle, newCoords.x, newCoords.y, newCoords.z, 1, 0, 0, 1)
                                        FreezeEntityPosition(vehicle, true)
                                    end
                                end)
                                if Config.useANProgBar then
                                    exports['an_progBar']:run(8, "Removing Car Jack")
                                    Citizen.Wait(8000)
                                else
                                    notify("Removing Car Jack", 8000, "info")
                                    Citizen.Wait(8000)
                                end
                                local currCoords = GetEntityCoords(vehicle)
                                DeleteEntity(carJack)
                                carJack = nil
                                Wait(300)
                                FreezeEntityPosition(vehicle, false)
                                local newCoords = vector3(currCoords.x, currCoords.y, currCoords.z - 1.0)
                                PlaceObjectOnGroundProperly(vehicle)
                                Wait(200)
                                ClearPedTasks(playerPed)
                                carJackedVeh = nil
                                startedCarJack = false
                                isCarJacking = false
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- Event to fix the vehicle
RegisterNetEvent('an_mechanicjob:fixveh', function()
    if isUsingToolbox then
        notify("Finish inspecting the vehicle first.", 8000, "error")
        return
    end
    local player = PlayerPedId()
    local vehicle = nil
    if IsPedInAnyVehicle(player, false) then
        vehicle = GetVehiclePedIsIn(player, false)
    else
        if Config.usingESX then
            local tempVeh, tempDist = ESX.Game.GetClosestVehicle()
            if tempVeh and tempDist <= 6.0 then
                vehicle = tempVeh
            else
                vehicle = nil
            end
        else
            local tempVeh, tempDist = QBCore.Functions.GetClosestVehicle()
            if tempVeh and tempDist <= 6.0 then
                vehicle = tempVeh
            else
                vehicle = nil
            end
        end
    end
    if vehicle then
        startVehicleRepair(vehicle)
    else
        notify("No vehicle nearby.", 8000, "error")
    end
end)

-- Tow/Flatbed system
local currentlyTowedVehicle = nil

RegisterCommand("tow", function()
    if PlayerData.job.name ~= Config.jobName then
        notify("You are not a mechanic.", 18000, "error")
        return
    end
    towVeh()
end)

RegisterCommand("untow", function()
    if PlayerData.job.name ~= Config.jobName then
        notify("You are not a mechanic.", 18000, "error")
        return
    end
    untowVeh()
end)

function towVeh()
	local playerped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerped, true)
	
	local towmodel = GetHashKey('flatbed')
	local isVehicleTow = IsVehicleModel(vehicle, towmodel)
			
	if isVehicleTow then
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
		local targetVehicle = getVehicleInDirection(coordA, coordB)
		
		if currentlyTowedVehicle == nil then
			if targetVehicle ~= 0 then
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetVehicle then
						AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
						currentlyTowedVehicle = targetVehicle
                        notify("Vehicle attached to the flatbed!", 15000, "success")
					else
                        notify("You can't tow your own flatbed?", 15000, "error")
					end
				end
			else
                notify("No vehicle to attach?", 15000, "error")
			end
		else
            notify("You already have a vehicle attached.", 15000, "error")
		end
	end
end

function untowVeh()
	local playerped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerped, true)
	
	local towmodel = GetHashKey('flatbed')
	local isVehicleTow = IsVehicleModel(vehicle, towmodel)
			
	if isVehicleTow then
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
		local targetVehicle = getVehicleInDirection(coordA, coordB)
		
		if currentlyTowedVehicle ~= nil then
			AttachEntityToEntity(currentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
			DetachEntity(currentlyTowedVehicle, true, true)
			currentlyTowedVehicle = nil
            notify("The vehicle was successfully detached!", 15000, "success")
		else
            notify("You don't have a vehicle attached.", 15000, "error")
		end
	end
end

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

-- Function to draw 3D texts
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z+0.3)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextOutline(1)
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

-- Function load animation
function LoadAnim(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

-- Function to concatenate all the elements of the table with a comma as a separator to form a single string
function tableToStr(t)
    local str = ""
    for i, v in ipairs(t) do
        str = str .. v
        if i < #t then
            str = str .. ", "
        end
    end
    return str
end

-- Notify
RegisterNetEvent('an_mechanicjob:notify', function(msg, time, type)
    notify(msg, time, type)
end)

function notify(msg, time, type)
    if Config.usingESX then
        ESX.ShowNotification(msg, time, type)
    else
        if type == "info" then
            type = "primary"
        end
        if type == "warning" then
            type = "error"
        end
        QBCore.Functions.Notify(msg, type, time)
    end
end