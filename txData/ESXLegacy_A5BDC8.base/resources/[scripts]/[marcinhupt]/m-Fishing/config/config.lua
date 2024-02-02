Config = {}

Config.Display = "target" -- "target" or "showHelpText"
Config.Inventory = "ox" -- "ox" or "qs" ( open code on s.utils.lua )
Config.Notify = "okok" -- "okok" or "ox" ( open code on config_functions.lua )
Config.EmoteMenu = "rp" -- "rp" or "dp" ( open code on config_functions.lua )
Config.VehicleKeys = "none" -- "none" or "qs" or "renewed" ( open code on config_functions.lua )
Config.Dispatch = 'ps-dispatch' -- "ps-dispatch" or "cd_dispatch" or "qs-dispatch"
Config.InventoryLink = "ox_inventory/web/images/"
Config.Minigame = true -- Enable minigame?
Config.MinigameType = "ps-ui" -- "ps-ui" or "bl_ui" or "ox_lib" ( open code on config_functions.lua )
Config.Fuel = "okokFuel" -- "LegacyFuel" or "okokFuel" or "ox_fuel" or "ti_fuel" or "qs-fuel" ( open code on config_functions.lua )
Config.Debug = true -- If true, some prints happen on console

Config.License = {
    enable = true, -- If true, the script check if player have license to fishing
    cost = 1000, -- Cost of license
    type = "cash", -- "cash" or "bank"
}


Config.adminRanks = {
   'superadmin',
   'admin',
   'moderator',
}

-- Fishing Shop
Config.FishingShopBlip = { enable = true, sprite = 88, colour = 3, scale = 0.8, name = "Fishing Shop" }
Config.FishingShopPed = vector3(-1593.9785, 5196.8677, 4.3589) -- Location of the ped fishing shop
Config.FishingShopPedHeading = 16.6833 -- Heading of the ped
Config.FishingShopPedModel = "a_m_y_runner_01" -- Ped model https://docs.fivem.net/docs/game-references/ped-models/
Config.FishingShopItems = { -- Items people can buy on shop
    [1] = { name = "fishbait",      price = 5, amount = 10, info = {}, type = "item", slot = 1 },
	[2] = { name = "anchor",        price = 5, amount = 10, info = {}, type = "item", slot = 2 },
    [3] = { name = "bonfire",       price = 5, amount = 10, info = {}, type = "item", slot = 3 },
    [4] = { name = "fishingrod1",   price = 5, amount = 10, info = {}, type = "item", slot = 4 },
    [5] = { name = "fishnet1",      price = 5, amount = 10, info = {}, type = "item", slot = 5 },
    [6] = { name = "diving_gear",   price = 5, amount = 10, info = {}, type = "item", slot = 6 },
    [7] = { name = "diving_fill",   price = 5, amount = 10, info = {}, type = "item", slot = 7 },
}

-- Selling Legal Fishg
Config.FishingSellBlip = { enable = true, sprite = 108, colour = 3, scale = 0.8, name = "Sell Fish" }
Config.FishingSellPed = vector3(-1611.8198, 5263.0576, 3.9741) -- Location of the ped fishing shop
Config.FishingSellPedHeading = 209.2150 -- Heading of the ped
Config.FishingSellPedModel = "a_m_m_hillbilly_01" -- Ped model https://docs.fivem.net/docs/game-references/ped-models/
Config.FishingSellType = "cash" -- "cash" or "bank"
Config.SettingsSell = {
    [1] = { item = "catfish", priceMin = 2, priceMax = 4 },
    [2] = { item = "cod", priceMin = 2, priceMax = 4 },
    [3] = { item = "mackerel", priceMin = 2, priceMax = 4 },
    [4] = { item = "monkfish", priceMin = 2, priceMax = 4 },
    [5] = { item = "salmon", priceMin = 2, priceMax = 4 },
    [6] = { item = "sardine", priceMin = 2, priceMax = 4 },
    [7] = { item = "stingray", priceMin = 2, priceMax = 4 },
    [8] = { item = "tunafish", priceMin = 2, priceMax = 4 },
}

-- Rent a Boat
Config.RentBoatBlip = { enable = true, sprite = 404, colour = 3, scale = 0.8, name = "Rent a Boat" }
Config.RentBoatPed = vector3(-813.9567, -1368.7310, 5.1783) -- Location of the ped fishing shop
Config.RentBoatPedHeading = 323.6019 -- Heading of the ped
Config.RentBoatPedModel = "a_m_y_runner_01" -- Ped model https://docs.fivem.net/docs/game-references/ped-models/
Config.SpawnBoat = vector3(-847.9957, -1363.6979, -0.4749) -- Locationto spawn the boat
Config.SpawnBoatHeading = 104.3258 -- Heading of the boat
Config.Boats = {
    [1] = {boat = "dinghy", experience = 0 },
    [2] = {boat = "jetmax", experience = 50 },
    [3] = {boat = "toro", experience = 100 },
}

-- Experience system
Config.ExperienceSettings = {
    Legal_Fishing = {
        min = 1, -- min experience player earn when fishing 
        max = 2, -- max experience player earn when fishing 
    },
    Illegal_Fishing = {
        min = 2, -- min experience player earn when illegal fishing 
        max = 4, -- max experience player earn when illegal fishing 
    },
    Fishingnet = {
        min = 1, -- min experience player earn when use fishingnet
        max = 2, -- max experience player earn when use fishingnet
    },
}

-- Illegal bait settings
Config.IllegalBait = {
    needMinigame = true, -- cl_utils.lua
    needItem = true, -- Required item to make illegalbait?
    onlyIllegalZones = false, -- Player only can make illegalbait on illegalzones?
    itemNeeded = "knife", -- Item required
    timeProg = 5000, -- Time of progressbar when you use the item
    itemUsed = "tigershark", -- Item used to get illegalbait
    receiveAmount = { -- min & max amount of illegail bait people can get from one tigershark
        min = 1,
        max = 2,
    },
}

-- Cooking settings
Config.CookingProp = "prop_beach_fire" -- Prop will spawned with bonfire item
Config.AnimationCooking = {
    placing = {
        animDict = "anim@narcotics@trash",
        anim = "drop_front"
    },
    saving = {
        animDict = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
        anim = "plant_floor",
    }
}

-- Cooking items
Config.CookingItems = {
    [1] = {
        name = "cookedcod", -- Item player will cooking
        receive = 1, -- Amount of item receiving
        itemsNeed = { -- List of items needed to craft
            [1] = {item = "cod", amount = 1 },
        }
    },
    [2] = {
        name = "cookedmackerel", -- Item player will cooking
        receive = 1, -- Amount of item receiving
        itemsNeed = { -- List of items needed to craft
            [1] = {item = "mackerel", amount = 1 },
        }
    },
}

-- Usable cooked items
Config.CookingUsable = {
    [1] = {
        item = "cookedcod", -- Item consumable
        effects = "health", -- "health" or "armour" or "both"
        values = {
            min = 10, -- Min value player will receive of effects when eating the cookedcod
            max = 20, -- Max value player will receive of effects when eating the cookedcod
        }
    },
    [2] = {
        item = "cookedmackerel", -- Item consumable
        effects = "health", -- "health" or "armour" or "both"
        values = {
            min = 10, -- Min value player will receive of effects when eating the cookedcod
            max = 20, -- Max value player will receive of effects when eating the cookedcod
        }
    }
}

-- Treasure Chest
Config.Treasure = {
    Rewards = {
        [1] = {item = "lockpick", chance = 20 },
        [2] = {item = "advancedlockpick", chance = 10 },
        [3] = {item = "phone", chance = 50 },
        [5] = {item = "fishingtin", chance = 60 },
        [6] = {item = "fishingboot", chance = 70 },
    }
}