function showHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, false, true, -1)
end

function Notify(msg, type, time)
    if type == "primary" then
        lib.notify({ title = 'Notification', description = msg, type = 'inform' })
    elseif type == "error" then
        lib.notify({ title = 'Notification', description = msg, type = 'error' })
    elseif type == "success" then
       lib.notify({ title = 'Notification', description = msg, type = 'success' })
    end
end

function SpawnVehicle(model)
    local coords = {
        x = 137.92,
        y = -3023.74,
        z = 7.04,
        w =  270.38,
    }

    ESX.Game.SpawnVehicle(model, coords, 100.0, function(veh)
        SetVehicleNumberPlateText(veh, "TUNNERS")
        SetEntityHeading(veh, 274.67)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        SetVehicleFuel(veh, 100.0)
        SetEntityAsMissionEntity(veh, true, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        SetVehicleEngineOn(veh, true, true, true)
    end)
end

function DeleteVehicle()
    local InVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
    if InVehicle then
        ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
    end
end

function CleanVehicle(veh)
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_MAID_CLEAN", 0, true)
    lib.progressBar({
        duration = 10000,
        label = ProgressBars["LimparVeiculo"],
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
            cobat = true,
        },
    }) 
    Notify(Language["VeiculoLimpoComSucesso"])
    SetVehicleDirtLevel(veh, 0.1)
    SetVehicleUndriveable(veh, false)
    WashDecalsFromVehicle(veh, 1.0)
    TriggerServerEvent(Config.Prefix..":Server:RemoveItem", "cleaningkit", 1)
    ClearAllPedProps(ped)
    ClearPedTasks(ped)
end

function OpenCloakroomMenu()
    TriggerEvent("illenium-appearance:client:openClothingShop")
end

function DiagonisticCar()
    local ped = PlayerPedId()
    local vehicle = ESX.Game.GetClosestVehicle()
    local vehProps = ESX.Game.GetVehicleProperties(vehicle)
    local model = GetEntityModel(vehicle)
    local modelName = GetDisplayNameFromVehicleModel(model)
    local pos = GetEntityCoords(ped)
    local vehpos = GetEntityCoords(vehicle)

    if Config.FuelSystem == "ti_fuel" then
        exports["ti_fuel"]:getFuel(GetVehiclePedIsIn(PlayerPedId(), false))
    elseif Config.FuelSystem == "ox_fuel" then
        fuelHealth = GetVehicleFuelLevel(vehicle)
    else
        fuelHealth = exports[Config.FuelSystem]:GetFuel(vehicle)
    end
    
    bodyHealth = GetVehicleBodyHealth(vehicle)
    plate = GetVehicleNumberPlateText(vehicle)
    engineHealth = ((GetVehicleEngineHealth(vehicle)+4000)/50)
    vehProps.modEngine = vehProps.modEngine + 1
    vehProps.modBrakes = vehProps.modBrakes + 1
    vehProps.modSuspension = vehProps.modSuspension + 1
    vehProps.modTransmission = vehProps.modTransmission + 1
    vehProps.windowTint = vehProps.windowTint + 1
    vehProps.modTurbo = vehProps.modTurbo

    if vehicle ~= 0 and vehicle then
        if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped, false) then

            local bM
                if engineHealth <= 100 and engineHealth >= 75 then
                    bM = {title = Language["carEngine100"] .. math.ceil(engineHealth) .. "% / 100.0%", description = Language["fixEngine"], event = Config.Prefix..":client:RepairEngine", }
                elseif engineHealth <= 75 and engineHealth >= 50 then
                    bM = {title = Language["carEngine75"] .. math.ceil(engineHealth) .. "% / 100.0%", description = Language["fixEngine"], event = Config.Prefix..":client:RepairEngine", }
                elseif engineHealth <= 50 and engineHealth >= 25 then
                    bM = {title = Language["carEngine50"] .. math.ceil(engineHealth) .. "% / 100.0%", description = Language["fixEngine"], event = Config.Prefix..":client:RepairEngine", }
                elseif engineHealth <= 25 and engineHealth >= 1 then
                    bM = {title = Language["carEngine25"] .. math.ceil(engineHealth) .. "% / 100.0%", description = Language["fixEngine"], event = Config.Prefix..":client:RepairEngine", }
                else
                    bM = {title = Language["carEngine0"] .. math.ceil(engineHealth) .. ".0% / 100.0%", description = "", event = Config.Prefix..":client:RepairEngine", }
                end

                local bH
                if math.ceil(bodyHealth / 10) <= 100 and math.ceil(bodyHealth / 10) >= 75 then
                    bH = {title = Language["carBody100"] .. math.ceil(bodyHealth / 10) .. ".0% / 100.0%", description = Language["fixBody"], event = Config.Prefix..":client:RepairBody", }
                elseif math.ceil(bodyHealth / 10) <= 75 and math.ceil(bodyHealth / 10) >= 50 then
                    bH = {title = Language["carBody75"] .. math.ceil(bodyHealth / 10) .. ".0% / 100.0%", description = Language["fixBody"], event = Config.Prefix..":client:RepairBody", }
                elseif math.ceil(bodyHealth / 10) <= 50 and math.ceil(bodyHealth / 10) >= 25 then
                    bH = {title = Language["carBody50"] .. math.ceil(bodyHealth / 10) .. ".0% / 100.0%", description = Language["fixBody"], event = Config.Prefix..":client:RepairBody", }
                elseif math.ceil(bodyHealth / 10) <= 25 and math.ceil(bodyHealth / 10) >= 1 then
                    bH = {title = Language["carBody25"] .. math.ceil(bodyHealth / 10) .. ".0% / 100.0%", description = Language["fixBody"], event = Config.Prefix..":client:RepairBody", }
                else
                    bH = {title = Language["carBody0"] .. math.ceil(bodyHealth / 10) .. "% / 100.0%", description = Language["fixBody"], event = Config.Prefix..":client:RepairBody", }
                end

                local fH
                if fuelHealth <= 100 and fuelHealth >= 75 then
                    fH = {title = Language["carFuel100"] .. math.ceil(fuelHealth) .. ".0% / 100.0%", description = ""}
                elseif fuelHealth <= 75 and fuelHealth >= 50 then
                    fH = {title = Language["carFuel75"] .. math.ceil(fuelHealth) .. ".0% / 100.0%", description = ""}
                elseif fuelHealth <= 50 and fuelHealth >= 25 then
                    fH = {title = Language["carFuel50"] .. math.ceil(fuelHealth) .. ".0% / 100.0%", description = ""}
                elseif fuelHealth <= 25 and fuelHealth >= 1 then
                    fH = {title = Language["carFuel25"] .. math.ceil(fuelHealth) .. ".0% / 100.0%", description = ""}
                else
                    fH = {title = Language["carFuel0"] .. math.ceil(fuelHealth) .. "% / 100.0%", description = ""}
                end

                lib.registerContext({
                    id = 'neonToggleMenu',
                    title = Language.headerDiagonostic,
                    options = {
                        { title = Language["carModel"] ..modelName, },
                        { title = Language["carPlate"] ..plate, },
                        { title = Language["carWindows"] ..tostring(vehProps.windowTint), },
                        { title = Language["carBrakes"] ..tostring(vehProps.modBrakes).. "/" .. GetNumVehicleMods(vehicle, 12), },
                        { title = Language["carEngine"] ..tostring(vehProps.modEngine).. "/" .. GetNumVehicleMods(vehicle,11), },
                        { title = Language["carSuspension"] ..tostring(vehProps.modSuspension).. "/" .. GetNumVehicleMods(vehicle,15), },
                        { title = Language["carTransmission"] ..tostring(vehProps.modTransmission).. "/" .. GetNumVehicleMods(vehicle,13), },
                        { title = Language["carTurbo"] ..tostring(vehProps.modTurbo), },
                        { title = Language["carXenons"] ..tostring(vehProps.modXenon), },
                        bM,
                        bH,
                        fH,
                    }
                })
                lib.showContext('neonToggleMenu')
        else
            Notify(Language["Estaslonge"], "error", 5000)
        end
    else
        Notify(Language["Estaslonge"], "error", 5000)
    end
end

function OpenBossMenu()
    local PlayerData = ESX.GetPlayerData()
    local grade = PlayerData.job.grade_name
    local elements = {}

    if grade == 'boss' then
        table.insert(elements, {label = "Boss Actions", value = 'boss_actions'})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions',

    {
        title    = "Tunners",
        align    = 'top-left',
        elements = elements
    },

    function(data, menu)

    if data.current.value == 'boss_actions' then
        TriggerEvent('esx_society:openBossMenu', 'tunners', function(data, menu)
            menu.close()
        end, {wash = false})
    end

    end,

    function(data, menu)

      menu.close()

      CurrentAction     = 'ambulance_actions_menu'
      CurrentActionMsg  = "Open"
      CurrentActionData = {}

    end)
end
