ESX = exports.es_extended:getSharedObject()

local PlayerData = {}

RegisterCommand("billingtunner", function() TriggerEvent(Config.Prefix..":client:BillingPlayer") end, false)

RegisterNetEvent(Config.Prefix..":client:BillingPlayer", function()
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'billing',
        {
            title = Language["BillingHeader"]
        },
        function(data, menu)
        local amount = tonumber(data.value)
            if amount == nil then
                Notify(Language["InvalidAmount"], "error", 5000)
            else
                menu.close()
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer == -1 or closestDistance > 3.0 then
                    Notify(Language["NobodyNear"], "error", 5000)
                else
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_tunners', "Tunners", amount)
                end
            end
        end,
    function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent(Config.Prefix..":client:OpenBossMenu", function()
    OpenBossMenu()
end)

RegisterNetEvent(Config.Prefix..":Client:OpenOutfitMenu", function()
    OpenCloakroomMenu()
end)

-- ========================================================== Repair Vehicle ( Engine )
RegisterNetEvent(Config.Prefix..":client:RepairEngine", function()
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then return Notify(Language["DentroDoVeiculoNao"], "error", 5000) end
    if IsEntityDead(playerPed) then return Notify(Language["Dead"], "error", 5000) end
    if IsPedSwimming(playerPed) then return Notify(Language["Water"], "error", 5000) end
    local vehicle = ESX.Game.GetClosestVehicle()
    local coords	= GetEntityCoords(playerPed)
    ESX.TriggerServerCallback(Config.Prefix..":Server:HaveRepairKit", function(cb)
        if cb then
            if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
                local ped = PlayerPedId()
                lib.progressBar({
                    duration = 12000,
                    label = ProgressBars["RepararVeiculo"],
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = "mini@repair",
                        clip = "fixing_a_player"
                    },
                })
                if Config.QuasarGarage then
                    local plate = GetVehicleNumberPlateText(vehicle)
                    exports['qs-advancedgarages']:RepairSpecificVehicle(plate)
                else
                    SetVehicleEngineHealth(vehicle, 1000.0)
                    SetVehicleEngineOn(vehicle, true, false, true)
                    SetVehicleTyreFixed(vehicle, 0)
                    SetVehicleTyreFixed(vehicle, 1)
                    SetVehicleTyreFixed(vehicle, 2)
                    SetVehicleTyreFixed(vehicle, 3)
                    SetVehicleTyreFixed(vehicle, 4)
                end
                Notify(Language["EngineRepaired"], "success", 5000)
                TriggerServerEvent(Config.Prefix..":Server:RemoveItem", "repairkit", 1)
                ClearPedTasks(ped)
            else
                Notify(Language["NenhumVeiculoPerto"], "error", 5000) 
            end
        else
            Notify(Language["NotKit"], "error", 5000)
        end
    end)
end)


-- ========================================================== Repair Vehicle ( Body )

RegisterNetEvent(Config.Prefix..":client:RepairBody", function()
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then return Notify(Language["DentroDoVeiculoNao"], "error", 5000) end
    if IsEntityDead(playerPed) then return Notify(Language["Dead"], "error", 5000) end
    if IsPedSwimming(playerPed) then return Notify(Language["Water"], "error", 5000) end
    local vehicle = ESX.Game.GetClosestVehicle()
    local coords	= GetEntityCoords(playerPed)
    ESX.TriggerServerCallback(Config.Prefix..":Server:HaveAdvancedRepairKit", function(cb)
        if cb then
            if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
                local ped = PlayerPedId()
                lib.progressBar({
                    duration = 12000,
                    label = ProgressBars["RepararVeiculo"],
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = "mini@repair",
                        clip = "fixing_a_player"
                    },
                })
                FreezeEntityPosition(vehicle, true)  
                SetVehicleFixed(vehicle)
                SetVehicleEngineHealth(vehicle, 1000.0)
                SetVehicleBodyHealth(vehicle, 1000.0)
                SetVehiclePetrolTankHealth(vehicle, 1000.0)
                SetVehicleDirtLevel(vehicle, 0)
                SetVehicleOnGroundProperly(vehicle)  
                FreezeEntityPosition(vehicle, false)
                ClearPedTasks(ped)
                Notify(Language["BodyRepaired"], "success", 5000)
                TriggerServerEvent(Config.Prefix..":Server:RemoveItem", "advancedrepairkit", 1) 
            else
                Notify(Language["NenhumVeiculoPerto"], "error", 5000)    
            end          
        else
            Notify(Language["NotAdvancedKit"], "error", 5000)
        end
    end)
end)

-- Open warehouse
local ox_inventory = exports.ox_inventory
RegisterNetEvent(Config.Prefix..":Client:OpenWarehouse", function()
    ox_inventory:openInventory('stash', {id = 'example_stash_2', owner = 'bobsmith'})
end)

-- Delete Vehicle
RegisterNetEvent(Config.Prefix..":Client:ReturnVehicle", function()
    DeleteVehicle()
end)

-- Duty System
RegisterNetEvent(Config.Prefix..":Client:DutySystem", function()
    TriggerServerEvent(Config.Prefix..":Server:ChangeDuty")
end)