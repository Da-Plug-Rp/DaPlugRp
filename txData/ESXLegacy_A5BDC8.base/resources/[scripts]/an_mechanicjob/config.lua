Config = {}

Config.usingESX = true -- Set to true if using ESX, false if using QBCore.
Config.useOXInventory = true -- [ESX ONLY] Set to true if you use OX Inventory | If you don't, you need to implement your own inventory code for the stash
Config.useANProgBar = true -- Set as true if you want to use an_progBar ( https://github.com/aymannajim/an_progBar ) [FREE]
Config.useQBBossMenu = false -- Enable this, if you just want the standard qb-core boss menu | If you disable this, you may need to disable the qb-management boss menu from popping up after every update

Config.whitelistedJobs = {
    ["mechanic"] = true,
    -- ["bennys"] = true, -- here you can add all jobs that you want them to have access to this system
}

Config.blip = { enable = true, coords = vector3(539.44, -180.16, 54.48), sprite = 446, color = 0, display = 4, scale = 0.7, label = "Auto Care | Professional Repair & Service" }

Config.craftTitle = '<i class="fa-solid fa-toolbox"></i> Mechanic Crafting Table <i class="fa-solid fa-screwdriver-wrench"></i>'

Config.garageTitle = "Mechanic Garage" -- Label for the vehicle spawner

Config.garage = {
    ["towtruck"] = {
        label = "Tow Truck",
        colors = { primary = { r= 0, g = 0, b = 0 }, secondary = { r= 0, g = 0, b = 0 } },
    },
    ["flatbed"] = {
        label = "Flat Bed",
        colors = { primary = { r= 0, g = 0, b = 0 }, secondary = { r= 0, g = 0, b = 0 } },
    },
    ["burrito"] = {
        label = "Van",
        livery = 1,
        colors = { primary = { r= 0, g = 0, b = 0 }, secondary = { r= 0, g = 0, b = 0 } },
    },
}

Config.materials = { -- Here fill in all your existing materials -- You must have them already as items in your server
    { item = "copper", label = "Copper" },
    { item = "steel", label = "Steel" },
    { item = "iron", label = "Iron" },
    { item = "metalscrap", label = "Metal Scrap" },
    { item = "rubber", label = "Rubber" },
    { item = "plastic", label = "Plastic" },
    { item = "glass", label = "Glass" },
    { item = "aluminum", label = "Aluminium" },
}

Config.craftingRecipes = {
    ["nitrous"] = {
        label = "NOS", -- name to show on the NUI
        ingredients = { -- required items to craft
            ["metalscrap"] = { amount = 15 },
            ["copper"] = { amount = 5 },
            ["aluminum"] = { amount = 5 },
            ["steel"] = { amount = 5 },
        },
        duration = 15000, -- Crafting duration
    },
    ["car_wheel"] = {
        label = "Tire",
        ingredients = {
            ["rubber"] = { amount = 5 },
            ["plastic"] = { amount = 5 },
        },
        duration = 15000,
    },
    ["repairkit2"] = {
        label = "Repair Kit",
        ingredients = {
            ["metalscrap"] = { amount = 15 },
            ["aluminum"] = { amount = 15 },
            ["steel"] = { amount = 15 },
            ["glass"] = { amount = 15 },
        },
        duration = 15000,
    },
    ["advancedrepairkit2"] = {
        label = "Advanced Repair Kit",
        ingredients = {
            ["metalscrap"] = { amount = 50 },
            ["aluminum"] = { amount = 30 },
            ["steel"] = { amount = 30 },
            ["glass"] = { amount = 30 },
        },
        duration = 15000,
    },
    ["car_door"] = {
        label = "Door",
        ingredients = {
            ["metalscrap"] = { amount = 5 },
            ["aluminum"] = { amount = 5 },
            ["steel"] = { amount = 5 },
        },
        duration = 15000,
    },
    ["car_trunk"] = {
        label = "Trunk",
        ingredients = {
            ["metalscrap"] = { amount = 8 },
            ["aluminum"] = { amount = 8 },
            ["steel"] = { amount = 8 },
        },
        duration = 15000,
    },
    ["car_hood"] = {
        label = "Hood",
        ingredients = {
            ["metalscrap"] = { amount = 10 },
            ["aluminum"] = { amount = 10 },
            ["steel"] = { amount = 10 },
        },
        duration = 15000,
    },
    ["car_window"] = {
        label = "Window",
        ingredients = {
            ["glass"] = { amount = 20 },
        },
        duration = 15000,
    },
    ["toolbox"] = {
        label = "Toolbox",
        ingredients = {
            ["copper"] = { amount = 10 },
            ["steel"] = { amount = 10 },
            ["iron"] = { amount = 10 },
            ["metalscrap"] = { amount = 10 },
            ["rubber"] = { amount = 10 },
            ["plastic"] = { amount = 10 },
            ["glass"] = { amount = 10 },
            ["aluminum"] = { amount = 10 },
        },
        duration = 20000,
    },
    ["carjack"] = {
        label = "Car Jack",
        ingredients = {
            ["steel"] = { amount = 10 },
            ["iron"] = { amount = 10 },
            ["metalscrap"] = { amount = 10 },
            ["rubber"] = { amount = 10 },
            ["plastic"] = { amount = 10 }
        },
        duration = 20000,
    },
    ["car_engine"] = {
        label = "Engine",
        ingredients = {
            ["copper"] = { amount = 30 },
            ["aluminum"] = { amount = 30 },
            ["steel"] = { amount = 30 },
            ["iron"] = { amount = 30 },
            ["metalscrap"] = { amount = 30 },
        },
        duration = 20000,
    },
}

Config.neededMaterials = {
    ENGINE = {
        ["0-25"] = math.random(5, 6), -- Materials needed to repair a vehicle engine with the health from 0 to 25
        ["25-50"] = math.random(3, 4), -- Materials needed to repair a vehicle engine with the health from 25 to 50
        ["50-75"] = math.random(2, 3), -- Materials needed to repair a vehicle engine with the health from 50 to 75
        ["75-100"] = 1, -- Materials needed to repair a vehicle engine the health from 75 to 100
    },
    BODY = {
        ["0-25"] = math.random(4, 5), -- Materials needed to repair a vehicle body with the health from 0 to 25
        ["25-50"] = math.random(3, 4), -- Materials needed to repair a vehicle body with the health from 25 to 50
        ["50-75"] = math.random(1, 2), -- Materials needed to repair a vehicle body with the health from 50 to 75
        ["75-100"] = 1, -- Materials needed to repair a vehicle body the health from 75 to 100
    }
}

-- PERMISSIONS
Config.minRankAccessStash = 1 -- Which rank can access the stash?
Config.minRankAccessCraft = 1 -- Which rank can access the craft?
Config.minRankAccessSpawner = 0 -- Which rank can access the vehicle garage?
Config.minRankAccessClothing = 0 -- Which rank can access the locker room?
Config.minRankAccessBossMenu = 3 -- Which rank can access the boss menu?

-- STORAGE CONFIG FOR ESX SERVERS WITH OX_INVENTORY
Config.storageMaxWeight = 9999
Config.storageSlots = 9999

-- LOCATIONS
Config.locations = {
    diagnosisArea = {
        veh = true, -- whether you must be in a vehicle
        coords = vector3(-222.5064, -1334.6332, 31.3005),
        marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Vehicle Diagnosis",
        maxDist = 4.0,
        minDist = 2.0,
    },
    craft = {
        veh = true, 
        coords = vector3(-206.1290, -1334.5872, 31.3014),
        marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Crafting Table",
        maxDist = 3.0,
        minDist = 1.0,
    },
    spawner = {
        veh = false, 
        coords = vector3(545.65, -208.0, 53.15),
        heading = 164.57,
        marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Mechanic Garage",
        maxDist = 5.0,
        minDist = 1.8,
    },
    clothing = {
        veh = true,
        coords = vector3(-223.5598, -1339.3069, 34.9898),
        marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Locker Room",
        maxDist = 3.0,
        minDist = 1.0,
    },
    storage = {
        veh = true,
        coords = vector3(-227.4646, -1314.8634, 31.3005),
        marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Mechanic Stash",
        maxDist = 3.0,
        minDist = 1.0,
    },
    bossmenu = {
        veh = true,
        coords = vector3(548.56, -172.39, 53.68),
        marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Boss Menu",
        maxDist = 3.0,
        minDist = 1.0,
    },
    repairArea_1 = {
        veh = true,
        coords = vector3(540.12, -176.77, 53.68),
        lift = vector3(545.73, -176.77, 54.49),
        heading = 85.65,
        marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Repair Vehicle",
        maxDist = 3.0,
        minDist = 1.5,
        control = vector3(543.05, -174.17, 54.48),
    },
    repairArea_2 = {
        veh = true,
        coords = vector3(540.54, -188.0, 53.6),
        lift = vector3(545.62, -187.95, 54.48),
        heading = 85.65,
        marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Repair Vehicle",
        maxDist = 3.0,
        minDist = 1.5,
        control = vector3(545.15, -185.86, 54.48),
    },
    -- repairArea_3 = {
    --     veh = true,
    --     coords = vector3(957.16, -980.83, 38.89),
    --     heading = 5.68,
    --     marker = "~HUD_COLOUR_NET_PLAYER25~[E]~s~ Repair Vehicle",
    --     maxDist = 3.0,
    --     minDist = 1.5,
    --     control = vector3(959.38, -980.9, 39.2),
    -- },
    -- To add more repair areas, make sure to follow the 3 examples above and not change the "repairArea" at the beginning of the name
}

-- Customizable Functions
function openClothingMenu()
    TriggerEvent("illenium-appearance:client:openOutfitMenu")
    if Config.usingESX then
        -- CUSTOMIZE THIS
    else
        TriggerEvent("qb-clothing:client:openOutfitMenu")
    end
end

function GiveKeysForThisCar(plate)
    -- Here you can customize your Give Car Keys function

end

---- Do Not Change unless you know what you're doing
Config.jobName = "mechanic" -- The job name used on the database for ESX OR qb-core/shared/jobs.lua for QB
Config.ranks = { -- Mechanic job ranks
    ["trainee"] = {
        grade = 0,
        label = "Trainee",
    },
    ["mechanic"] = {
        grade = 1,
        label = "Mechanic",
    },
    ["manager"] = {
        grade = 2,
        label = "Manager",
    },
    ["boss"] = {
        grade = 3,
        label = "Boss",
    },
}