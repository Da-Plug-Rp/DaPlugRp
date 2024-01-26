ESX = exports.es_extended:getSharedObject()

CreateThread(function()
    --==== Warehouse
    for k, v in pairs(Config["Warehouse"]) do
        exports.ox_target:addBoxZone({
            coords = vec3(v.x, v.y, v.z),
            size = vec3(2, 2, 2),
            rotation = 22,
            debug = false,
            options = {
                {
                    name = "Warehouse"..k,
                    event = Config.Prefix..":Client:OpenWarehouse",
                    icon = "fas fa-box",
                    label = "Warehouse",
                    groups = Config.Job
                }
            }
        })
    end
    --==== Nitro
    for k, v in pairs(Config["NitroLocation"]) do
        exports.ox_target:addBoxZone({
            coords = vec3(v.x, v.y, v.z),
            size = vec3(2, 2, 2),
            rotation = 22,
            debug = false,
            options = {
                {
                    name = "NitroLocation"..k,
                    event = Config.Prefix..":Client:RefillNitrous",
                    icon = "fas fa-box",
                    label = "Refill Nitrous",
                    groups = Config.Job
                }
            }
        })
    end
    --==== Duty
    for k, v in pairs(Config["DutyLocation"]) do
        exports.ox_target:addBoxZone({
            coords = vec3(v.x, v.y, v.z),
            size = vec3(2, 2, 2),
            rotation = 22,
            debug = false,
            options = {
                {
                    name = "DutyLocation"..k,
                    event = Config.Prefix..":Client:DutySystem",
                    icon = "fas fa-bell",
                    label = "Service",
                }
            }
        })
    end
    --==== Vehicles
    for k, v in pairs(Config["Vehicles"]) do
        exports.ox_target:addBoxZone({
            coords = vec3(v.x, v.y, v.z),
            size = vec3(2, 2, 2),
            rotation = 22,
            debug = false,
            options = {
                {
                    name = "Vehicles"..k,
                    event = Config.Prefix..":Client:VehiclesMenu",
                    icon = "fas fa-car",
                    label = "Vehicles",
                    groups = Config.Job
                }
            }
        })
    end
    --==== ChopChop
    if Config.EnableChopChop == true then
        for k, v in pairs(Config["ChopChopLocation"]) do
            exports.ox_target:addBoxZone({
                coords = vec3(v.x, v.y, v.z),
                size = vec3(2, 2, 2),
                rotation = 22,
                debug = false,
                options = {
                    {
                        name = "ChopChopLocation"..k,
                        event = Config.Prefix..":Client:StartChopChop",
                        icon = "fas fa-car",
                        label = "Chop Chop",
                        groups = Config.Job
                    }
                }
            })
        end
    end
    --==== Boss menu
    for k, v in pairs(Config["BossMenu"]) do
        exports.ox_target:addBoxZone({
            coords = vec3(v.x, v.y, v.z),
            size = vec3(2, 2, 2),
            rotation = 22,
            debug = false,
            options = {
                {
                    name = "BossMenu"..k,
                    event = Config.Prefix..":client:OpenBossMenu",
                    icon = "fas fa-door",
                    label = "Boss Menu",
                    groups = Config.Job
                }
            }
        })
    end
    --==== Cloackroom
    for k, v in pairs(Config["Cloackroom"]) do
        exports.ox_target:addBoxZone({
            coords = vec3(v.x, v.y, v.z),
            size = vec3(2, 2, 2),
            rotation = 22,
            debug = false,
            options = {
                {
                    name = "Cloackroom"..k,
                    event = Config.Prefix..":Client:OpenOutfitMenu",
                    icon = "fas fa-shirt",
                    label = "Clothing",
                    groups = Config.Job
                }
            }
        })
    end
    -- Shop
    for k, v in pairs(Config["Shop"]) do
        exports.ox_target:addBoxZone({
            coords = vec3(v.x, v.y, v.z),
            size = vec3(2, 2, 2),
            rotation = 22,
            debug = false,
            options = {
                {
                    name = "Shop"..k,
                    event = Config.Prefix..":Client:OpenShop",
                    icon = "fas fa-box",
                    label = "Open Shop",
                    groups = Config.Job
                }
            }
        })
    end
    -- Windows
    exports.ox_target:addGlobalVehicle({
        {
            event = Config.Prefix..":Client:WindowsMenu",
            icon = "fas fa-circle",
            label = "Apply Windows Tint",
            bones = { "windscreen", "windscreen_r", "window_lf","window_rf","window_lr","window_rr","window_lm", "window_rm" },
            groups = Config.Job,
        },
    })
    -- Rims
    exports.ox_target:addGlobalVehicle({
        {
            event = Config.Prefix..":client:coiloverMenu",
            icon = "fas fa-wrench",
            label = "Adjust Coilovers",
            bones = { "wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr" },
            groups = Config.Job,
        },
    })
end)
