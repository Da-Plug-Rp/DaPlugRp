---@diagnostic disable: duplicate-set-field
Config = {}

-- ██    ██ ████████ ██ ██      ██ ████████ ██ ███████ ███████
-- ██    ██    ██    ██ ██      ██    ██    ██ ██      ██
-- ██    ██    ██    ██ ██      ██    ██    ██ █████   ███████
-- ██    ██    ██    ██ ██      ██    ██    ██ ██           ██
--  ██████     ██    ██ ███████ ██    ██    ██ ███████ ███████

Config.Job = "tobacco"                         -- Job Required
Config.debug = true                           -- leave off unless needed.
Config.polydebug = false                       -- leave off unless needed.
Config.BridgeDebug = false                     -- leave off unless needed
Config.SDAutoVersion = false                   -- Autodetect menu used
Config.SDMenuVersion = 'ox'                    -- If above = false, define menu you want to use. (qb = qb_menu, ox = ox_lib)
Config.SDInputVersion = 'ox'                   -- input menu override
Config.ClearBlood = true                       -- Removed blood from player when using sink.
Config.ImagePath = 'ox_inventory/web/images/' -- Path to inventory for menu images
Config.SmokingDuration = 60                    -- Time in seconds that a player can 'smoke' an item before it force stops the animations.
Config.AutoDetectNotif = true                  -- Detect framework to use default framework notifications.  If false - Set your own notifications.
--Notifications:
Config.Notification = function(title, message, length, type)
  if Config.AutoDetectNotif then
    if Bridge.Framework == 'esx' then
      exports["esx_notify"]:Notify(type, time, message)
    elseif Bridge.Framework == 'qb' then
      TriggerEvent('QBCore:Notify', { caption = title, text = message }, type, length)
    end
  else
    exports['okokNotify']:Alert('Title', 'Message', Time, 'type', playSound)
  end
end

--  █████  ███    ██ ██ ███    ███  █████  ████████ ██  ██████  ███    ██ ███████
-- ██   ██ ████   ██ ██ ████  ████ ██   ██    ██    ██ ██    ██ ████   ██ ██
-- ███████ ██ ██  ██ ██ ██ ████ ██ ███████    ██    ██ ██    ██ ██ ██  ██ ███████
-- ██   ██ ██  ██ ██ ██ ██  ██  ██ ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
-- ██   ██ ██   ████ ██ ██      ██ ██   ██    ██    ██  ██████  ██   ████ ███████
--Animations for things
Config.Animations = {
  PickCigTobaccoDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
  PickCigTobaccoAnim = 'weed_crouch_checkingleaves_idle_01_inspector',
  PickCigTobaccoTime = 3500,
  PickPipeTobaccoDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
  PickPipeTobaccoAnim = 'weed_crouch_checkingleaves_idle_01_inspector',
  PickPipeTobaccoTime = 3500,
  PickCigarTobaccoDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
  PickCigarTobaccoAnim = 'weed_crouch_checkingleaves_idle_01_inspector',
  PickCigarTobaccoTime = 3500,
  OpenDryTableDict = 'anim@heists@prison_heiststation@cop_reactions',
  OpenDryTableAnim = 'cop_b_idle',
  OpenDryTableTime = 5000, -- This needs to be long to allow script to process tobacco.
  CreateProductsDict = 'mp_arresting',
  CreateProductsAnim = 'a_uncuff',
  CreateProductsTime = 5000,
  PackageProductsDict = 'mp_arresting',
  PackageProductsAnim = 'a_uncuff',
  PackageProductsTime = 5000,
  OpenProductsDict = 'mp_arresting',
  OpenProductsAnim = 'a_uncuff',
  OpenProductsTime = 2500,
}


-- ██████  ██████  ██    ██ ██ ███    ██  ██████      ████████  ██████  ██████   █████   ██████  ██████  ██████
-- ██   ██ ██   ██  ██  ██  ██ ████   ██ ██              ██    ██    ██ ██   ██ ██   ██ ██      ██      ██    ██
-- ██   ██ ██████    ████   ██ ██ ██  ██ ██   ███        ██    ██    ██ ██████  ███████ ██      ██      ██    ██
-- ██   ██ ██   ██    ██    ██ ██  ██ ██ ██    ██        ██    ██    ██ ██   ██ ██   ██ ██      ██      ██    ██
-- ██████  ██   ██    ██    ██ ██   ████  ██████         ██     ██████  ██████  ██   ██  ██████  ██████  ██████

--Drying configs:
Config.TobaccoDryingStash = 'TobaccoDryingStash' --Stash name for active drying (No reason to change)
Config.TobaccoDriedStash = 'TobaccoDriedStash'   --Stash name for dried (No reason to change)
Config.TobaccoDryTime = 1                        --Time it takes to dry

--Main items and items received from drying rack.
Config.DryingRackItems = {
  ['ngd_cigtobaccoleaf'] = {
    driedItem = "ngd_drycigtobacco"
  },
  ['ngd_pipetobaccoleaf'] = {
    driedItem = "ngd_drypipetobacco"
  },
  ['ngd_cigartobaccoleaf'] = {
    driedItem = "ngd_drycigartobacco"
  }
}

--Target zone for dying racks
Config.DryingRackZones = {
  ['TobaccoDryingZone1'] = {
    coords = vector3(-65.21, 2902.15, 60.1),
    size = vector3(5.0, 6.0, 6.0),
    rotation = 59,
    label = 'Hang Tobacco To Dry',
    icon = 'fa-solid fa-bacon',
  },
}

--Target zone to pick up dried tobacco
Config.DriedTobacco = {
  ['TobaccoDriedZone'] = {
    coords = vector3(-52.08, 2908.02, 60.4),
    size = vector3(1.0, 1.5, 1.0),
    rotation = 61,
    label = 'Grab Dry Tobacco',
    icon = 'fa-solid fa-leaf',
  },
}

-- ██████  ███████ ██████      ███████ ████████  ██████  ██████  ███████
-- ██   ██ ██      ██   ██     ██         ██    ██    ██ ██   ██ ██
-- ██████  █████   ██   ██     ███████    ██    ██    ██ ██████  █████
-- ██      ██      ██   ██          ██    ██    ██    ██ ██   ██ ██
-- ██      ███████ ██████      ███████    ██     ██████  ██   ██ ███████

--Blip for PED store (or farm, whatever you want)
Config.Blip = {
  Enabled = true,
  Location = vector3(-42.81, 2893.61, 60.1),
  Sprite = 355,
  Scale = 0.75,
  Color = 46,
  ShortRange = true,
  Name = "Tobacco Farm",
}

--STORE PED
Config.UseStorePed = true                                   -- Use the store PED to load/sell items to other players
Config.PedLocation = vector4(-45.37, 2893.47, 60.1, 230.56) -- Location of the store PED
Config.PedModel = 'a_m_m_farmer_01'                         -- Model of store PED
Config.SocietyAccount = 'tobacco'                           -- Society to deposit money made
Config.StorePedStash = 'NGDTobaccoStorePedStash'            -- Stash for PED store (No reason to change)
Config.CurrencyType = 'cash'                                --'cash' or 'bank'
Config.StoreProducts = {
  ['ngd_standardcigpack'] = {                               -- Item able to be added and sold at store
    price = 12,                                             -- Price that items are sold for
  },
  ['ngd_mentholcigpack'] = {
    price = 15,
  },
  ['ngd_premiumcigpack'] = {
    price = 18,
  },
  ['ngd_cigarillopack'] = {
    price = 22,
  },
  ['ngd_stdcigarbox'] = {
    price = 55,
  },
  ['ngd_premiumcigarbox'] = {
    price = 100,
  },
  ['ngd_cubancigarbox'] = {
    price = 250,
  },
  ['ngd_pipe1'] = {
    price = 1500,
  },
  ['ngd_pipe2'] = {
    price = 250,
  },
  ['ngd_pipe3'] = {
    price = 450,
  },
  ['ngd_pipe4'] = {
    price = 500,
  },
  ['ngd_pipe5'] = {
    price = 500,
  },
  ['ngd_drypipetobacco'] = {
    price = 5,
  },
  ['ngd_drycherrytobacco'] = {
    price = 25,
  },
  ['ngd_drymapletobacco'] = {
    price = 25,
  },
  ['ngd_drylemontobacco'] = {
    price = 25,
  },
  ['ngd_drywintergtobacco'] = {
    price = 25,
  },
}

-- ███████ ███████  ██████ ██    ██ ██████  ██ ████████ ██    ██
-- ██      ██      ██      ██    ██ ██   ██ ██    ██     ██  ██
-- ███████ █████   ██      ██    ██ ██████  ██    ██      ████
--      ██ ██      ██      ██    ██ ██   ██ ██    ██       ██
-- ███████ ███████  ██████  ██████  ██   ██ ██    ██       ██

--Cameras
Config.Cameras = {
  { coords = vector3(-34.05, 2895.45, 63.90), heading = 225.31, pitch = -20.0, roll = 0.0, name = "Front Gate" },
  { coords = vector3(-72.86, 2927.90, 65.13), heading = 277.27, pitch = -35.0, roll = 0.0, name = "North Sideyard" },
  { coords = vector3(-74.94, 2928.26, 66.19), heading = 149.56, pitch = -35.0, roll = 0.0, name = "Rear Yard" },
  { coords = vector3(-89.07, 2901.54, 65.07), heading = 340.42, pitch = -35.0, roll = 0.0, name = "Rear Yard #2" },
  { coords = vector3(-77.48, 2892.91, 65.01), heading = 116.33, pitch = -20.0, roll = 0.0, name = "Limited Tobacco Growing" },
}


-- ██████   ██████  ███████ ███████     ███    ███ ███████ ███    ██ ██    ██
-- ██   ██ ██    ██ ██      ██          ████  ████ ██      ████   ██ ██    ██
-- ██████  ██    ██ ███████ ███████     ██ ████ ██ █████   ██ ██  ██ ██    ██
-- ██   ██ ██    ██      ██      ██     ██  ██  ██ ██      ██  ██ ██ ██    ██
-- ██████   ██████  ███████ ███████     ██      ██ ███████ ██   ████  ██████
--Locations of Boss/Duty menu

Config.BossDutyMenu = {
  ['TobaccoBossMenu1'] = { --FrontDoor
    coords = vector3(-44.19, 2893.5, 59.99),
    size = vector3(0.6, 0.7, 1.4),
    rotation = 243,
    bosslabel = 'Open Boss Menu',
    bossicon = 'fa-solid fa-laptop',
    dutylabel = 'Toggle Duty',
    dutyicon = 'fa-solid fa-briefcase',
    cameralabel = 'View Security Cameras',
    cameraicon = 'fa-solid fa-video'
  },
  ['TobaccoBossMenu2'] = { --Upstairs
    coords = vector3(-73.56, 2918.25, 63.0),
    size = vector3(0.6, 0.7, 1.4),
    rotation = 296,
    bosslabel = 'Open Boss Menu',
    bossicon = 'fa-solid fa-laptop',
    dutylabel = 'Toggle Duty',
    dutyicon = 'fa-solid fa-briefcase',
    cameralabel = 'View Security Cameras',
    cameraicon = 'fa-solid fa-video'
  },
  ['TobaccoBossMenu3'] = { --Upstairs
    coords = vector3(-75.56, 2914.24, 63.0),
    size = vector3(0.6, 0.7, 1.4),
    rotation = 161,
    bosslabel = 'Open Boss Menu',
    bossicon = 'fa-solid fa-laptop',
    dutylabel = 'Toggle Duty',
    dutyicon = 'fa-solid fa-briefcase',
    cameralabel = 'View Security Cameras',
    cameraicon = 'fa-solid fa-video'
  },
}

-- ███████ ██    ██ ██████  ██████  ██      ██    ██     ███████ ████████  ██████  ██████  ███████
-- ██      ██    ██ ██   ██ ██   ██ ██       ██  ██      ██         ██    ██    ██ ██   ██ ██
-- ███████ ██    ██ ██████  ██████  ██        ████       ███████    ██    ██    ██ ██████  █████
--      ██ ██    ██ ██      ██      ██         ██             ██    ██    ██    ██ ██   ██ ██
-- ███████  ██████  ██      ██      ███████    ██        ███████    ██     ██████  ██   ██ ███████

--Target zone for tobacco making supplies
Config.TobaccoSupplies = {
  ['TobaccoSupplies'] = { -- Top Cabinet
    coords = vector3(-49.3, 2902.8, 62.3),
    size = vector3(4.5, 0.4, 0.8),
    rotation = 61,
    label = 'Grab Supplies',
    icon = 'fa-solid fa-cart-shopping',
  },
}

--Items available in tobacco supply store
Config.TobaccoSupplyStore = {
  [1] = { name = "ngd_tobaccotrimmer", price = 0, count = 100, info = {}, type = "item", slot = 1 },
  [2] = { name = "ngd_cigfilter", price = 0, count = 100, info = {}, type = "item", slot = 2 },
  [3] = { name = "ngd_cigarrollingpaper", price = 0, count = 100, info = {}, type = "item", slot = 3 },
  [4] = { name = "ngd_cigrollingpaper", price = 0, count = 100, info = {}, type = "item", slot = 4 },
  [5] = { name = "ngd_premcigrollingpaper", price = 0, count = 100, info = {}, type = "item", slot = 5 },
  [6] = { name = "ngd_cigarillopaper", price = 0, count = 100, info = {}, type = "item", slot = 6 },
  [7] = { name = "ngd_cigarbinder", price = 0, count = 100, info = {}, type = "item", slot = 7 },
  [8] = { name = "ngd_menthol", price = 0, count = 100, info = {}, type = "item", slot = 8 },
  [9] = { name = "ngd_premiumcigarpaper", price = 0, count = 100, info = {}, type = "item", slot = 9 },
  [10] = { name = "ngd_importcuban", price = 0, count = 100, info = {}, type = "item", slot = 10 },
  [11] = { name = "ngd_pipe1", price = 0, count = 100, info = {}, type = "item", slot = 11 },
  [12] = { name = "ngd_pipe2", price = 0, count = 100, info = {}, type = "item", slot = 12 },
  [13] = { name = "ngd_pipe3", price = 0, count = 100, info = {}, type = "item", slot = 13 },
  [14] = { name = "ngd_pipe4", price = 0, count = 100, info = {}, type = "item", slot = 14 },
  [15] = { name = "ngd_pipe5", price = 0, count = 100, info = {}, type = "item", slot = 15 },
  [16] = { name = "ngd_cherryoil", price = 0, count = 100, info = {}, type = "item", slot = 16 },
  [17] = { name = "ngd_mapleoil", price = 0, count = 100, info = {}, type = "item", slot = 17 },
  [18] = { name = "ngd_lemonoil", price = 0, count = 100, info = {}, type = "item", slot = 18 },
  [19] = { name = "ngd_wintergreenoil", price = 0, count = 100, info = {}, type = "item", slot = 19 },
}


-- ██████   ██████   ██████  ███████ ███████     ███████ ████████  ██████  ██████  ███████
-- ██   ██ ██    ██ ██    ██    ███  ██          ██         ██    ██    ██ ██   ██ ██
-- ██████  ██    ██ ██    ██   ███   █████       ███████    ██    ██    ██ ██████  █████
-- ██   ██ ██    ██ ██    ██  ███    ██               ██    ██    ██    ██ ██   ██ ██
-- ██████   ██████   ██████  ███████ ███████     ███████    ██     ██████  ██   ██ ███████

--Target zone for booze stores
Config.BoozeStore = {
  ['BoozeStore'] = { -- Top Cabinet
    coords = vector3(-58.64, 2917.99, 64.5),
    size = vector3(4.5, 0.6, 3.0),
    rotation = 332,
    label = 'Grab Booze',
    icon = 'fa-solid fa-whiskey-glass',
  },
}

--Items available in the booze store
Config.BoozeSupplyStore = {
  [1] = { name = "ngd_tobaccowhisky", price = 0, count = 100, info = {}, type = "item", slot = 1 },
}

-- ███████ ████████  █████  ███████ ██   ██     ██       ██████   ██████  █████  ████████ ██  ██████  ███    ██ ███████
-- ██         ██    ██   ██ ██      ██   ██     ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ████   ██ ██
-- ███████    ██    ███████ ███████ ███████     ██      ██    ██ ██      ███████    ██    ██ ██    ██ ██ ██  ██ ███████
--      ██    ██    ██   ██      ██ ██   ██     ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
-- ███████    ██    ██   ██ ███████ ██   ██     ███████  ██████   ██████ ██   ██    ██    ██  ██████  ██   ████ ███████
--Locations for stashes !! stashname = "" MUST BE UNIQUE PER STASH !!

--Bulk storage locations
Config.BulkStorage = {
  ['NGDTobaccoStorage'] = {
    coords = vector3(-47.16, 2910.88, 60.17),
    size = vector3(2.6, 3.0, 1.5),
    rotation = 60,
    label = 'Open Storage',
    icon = 'fa-solid fa-warehouse',
    stashname = 'Tobacco Storage1',
    InvWeight = 100000,
    InvSlots = 25
  },
}

-- ███    ███  █████  ██   ██ ███████     ████████  ██████  ██████   █████   ██████  ██████  ██████
-- ████  ████ ██   ██ ██  ██  ██             ██    ██    ██ ██   ██ ██   ██ ██      ██      ██    ██
-- ██ ████ ██ ███████ █████   █████          ██    ██    ██ ██████  ███████ ██      ██      ██    ██
-- ██  ██  ██ ██   ██ ██  ██  ██             ██    ██    ██ ██   ██ ██   ██ ██      ██      ██    ██
-- ██      ██ ██   ██ ██   ██ ███████        ██     ██████  ██████  ██   ██  ██████  ██████  ██████

--Target zone to make tobacco products
Config.MakeProducts = {
  ['MakeTobaccoProducts'] = { -- Big Table
    coords = vector3(-56.4, 2910.6, 60.5),
    size = vector3(2.0, 5.0, 1.2),
    rotation = 61,
    label = 'Make Product',
    icon = 'fa-solid fa-dolly',
  },
}

--Item to make and the ingredients/quantities required
Config.TobaccoProducts = {
  ['ngd_cig1'] = {
    ['ngd_cigrollingpaper'] = 1,
    ['ngd_cigfilter'] = 1,
    ['ngd_drycigtobacco'] = 1,
  },
  ['ngd_cig2'] = {
    ['ngd_premcigrollingpaper'] = 1,
    ['ngd_cigfilter'] = 1,
    ['ngd_drycigtobacco'] = 3,
  },
  ['ngd_cig3'] = {
    ['ngd_cigarillopaper'] = 1,
    ['ngd_cigfilter'] = 1,
    ['ngd_drycigtobacco'] = 3,
  },
  ['ngd_cig4'] = {
    ['ngd_cigrollingpaper'] = 1,
    ['ngd_cigfilter'] = 1,
    ['ngd_drycigtobacco'] = 1,
    ['ngd_menthol'] = 2,
  },
  ['ngd_cigar1'] = {
    ['ngd_cigarrollingpaper'] = 1,
    ['ngd_drycigartobacco'] = 1,
    ['ngd_cigarbinder'] = 1,
  },
  ['ngd_cigar2'] = {
    ['ngd_premiumcigarpaper'] = 1,
    ['ngd_drycigartobacco'] = 2,
    ['ngd_cigarbinder'] = 1,
  },
  ['ngd_cigar3'] = {
    ['ngd_premiumcigarpaper'] = 1,
    ['ngd_drycigartobacco'] = 2,
    ['ngd_cigarbinder'] = 1,
    ['ngd_importcuban'] = 1,
  },
  ['ngd_drycherrytobacco'] = {
    ['ngd_cherryoil'] = 1,
    ['ngd_drypipetobacco'] = 2,
  },
  ['ngd_drymapletobacco'] = {
    ['ngd_mapleoil'] = 1,
    ['ngd_drypipetobacco'] = 2,
  },
  ['ngd_drylemontobacco'] = {
    ['ngd_lemonoil'] = 1,
    ['ngd_drypipetobacco'] = 2,
  },
  ['ngd_drywintergtobacco'] = {
    ['ngd_wintergreenoil'] = 1,
    ['ngd_drypipetobacco'] = 2,
  },
}

--Pack tobacco products into bulk
Config.PackageProductsZone = {
  ['NGDPackageProducts1'] = {
    coords = vector3(-59.20, 2907.82, 61.4),
    size = vector3(1.0, 5.0, 2.0),
    rotation = 61,
    label = 'Package Products',
    icon = 'fa-solid fa-box',
  },
}

--Bulk item to make and the required individual items and quantities
Config.PackageProducts = {
  ['ngd_standardcigpack'] = {
    ['ngd_cig1'] = 12,
  },
  ['ngd_premiumcigpack'] = {
    ['ngd_cig2'] = 12,
  },
  ['ngd_cigarillopack'] = {
    ['ngd_cig3'] = 12,
  },
  ['ngd_mentholcigpack'] = {
    ['ngd_cig4'] = 12,
  },
  ['ngd_stdcigarbox'] = {
    ['ngd_cigar1'] = 6,
  },
  ['ngd_premiumcigarbox'] = {
    ['ngd_cigar2'] = 6,
  },
  ['ngd_cubancigarbox'] = {
    ['ngd_cigar3'] = 6,
  },
}


-- ███████ ███    ███  ██████  ██   ██ ██ ███    ██  ██████      ███████ ███████ ████████ ████████ ██ ███    ██  ██████  ███████
-- ██      ████  ████ ██    ██ ██  ██  ██ ████   ██ ██           ██      ██         ██       ██    ██ ████   ██ ██       ██
-- ███████ ██ ████ ██ ██    ██ █████   ██ ██ ██  ██ ██   ███     ███████ █████      ██       ██    ██ ██ ██  ██ ██   ███ ███████
--      ██ ██  ██  ██ ██    ██ ██  ██  ██ ██  ██ ██ ██    ██          ██ ██         ██       ██    ██ ██  ██ ██ ██    ██      ██
-- ███████ ██      ██  ██████  ██   ██ ██ ██   ████  ██████      ███████ ███████    ██       ██    ██ ██   ████  ██████  ███████

--Tobacco consumables
Config.TobaccoConsumables = {
  ['ngd_cig1'] = {                                --Item
    prop = '_cig_1',                              --Prop
    lighter = 'ex_prop_exec_lighter_01',          --Lighter Type
    mouthcoords = vector3(-0.015, 0.095, 0.0),    --Coords for mouth/prop placement
    mouthrotation = vector3(79.0, 110.0, -107.0), --Rotation for mouth/prop placement
    handcoords = vector3(0.16, 0.015, 0.0),       --Coords for hand/prop placement
    handrotation = vector3(-20.0, -270.0, 20.0),  --Rotation for hand/prop placement
    itemtype =
    'cigarette'                                   --Item type for smoke/using.  You can't change this without changing function it editableclient.lua!
  },
  ['ngd_cig2'] = {
    prop = '_cig_2',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.095, 0.0),
    mouthrotation = vector3(79.0, 110.0, -107.0),
    handcoords = vector3(0.16, 0.015, 0.0),
    handrotation = vector3(-20.0, -270.0, 20.0),
    itemtype = 'cigarette',
  },
  ['ngd_cig3'] = {
    prop = '_cig_4',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.095, 0.0),
    mouthrotation = vector3(79.0, 110.0, -107.0),
    handcoords = vector3(0.16, 0.015, 0.0),
    handrotation = vector3(-20.0, -270.0, 20.0),
    itemtype = 'cigarette'
  },
  ['ngd_cig4'] = {
    prop = '_cig_3',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.095, 0.0),
    mouthrotation = vector3(79.0, 110.0, -107.0),
    handcoords = vector3(0.16, 0.015, 0.0),
    handrotation = vector3(-20.0, -270.0, 20.0),
    itemtype = 'cigarette'
  },
  ['ngd_cigar1'] = {
    prop = '_cigar_01',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.095, 0.0),
    mouthrotation = vector3(0.0, -80.0, 85.0),
    handcoords = vector3(0.16, 0.015, 0.01),
    handrotation = vector3(0.0, -90.0, -23.0),
    itemtype = 'cigar'
  },
  ['ngd_cigar2'] = {
    prop = '_cigar_02',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.095, 0.0),
    mouthrotation = vector3(0.0, -80.0, 85.0),
    handcoords = vector3(0.16, 0.015, 0.01),
    handrotation = vector3(0.0, -90.0, -23.0),
    itemtype = 'cigar'
  },
  ['ngd_cigar3'] = {
    prop = '_cigar_03',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.095, 0.0),
    mouthrotation = vector3(0.0, -80.0, 85.0),
    handcoords = vector3(0.16, 0.015, 0.01),
    handrotation = vector3(0.0, -90.0, -23.0),
    itemtype = 'cigar'
  },
  ['ngd_pipe1'] = {
    prop = '_pipe_03',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.19, 0.0),
    mouthrotation = vector3(9.0, -170.0, 290.0),
    handcoords = vector3(0.11, -0.03, -0.02),
    handrotation = vector3(9.0, -50.0, 90.0),
    itemtype = 'pipe'
  },
  ['ngd_pipe2'] = {
    prop = '_pipe_02',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.19, 0.0),
    mouthrotation = vector3(9.0, -170.0, 290.0),
    handcoords = vector3(0.11, -0.03, -0.02),
    handrotation = vector3(9.0, -50.0, 90.0),
    itemtype = 'pipe'
  },
  ['ngd_pipe3'] = {
    prop = '_pipe_01',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.015, 0.19, 0.0),
    mouthrotation = vector3(9.0, -170.0, 290.0),
    handcoords = vector3(0.11, -0.03, -0.02),
    handrotation = vector3(9.0, -50.0, 90.0),
    itemtype = 'pipe'
  },
  ['ngd_pipe4'] = {
    prop = 'long_pipe_1',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.03, 0.27, 0.01),
    mouthrotation = vector3(9.0, 190.0, 260.0),
    handcoords = vector3(0.08, -0.08, -0.03),
    handrotation = vector3(9.0, -50.0, 65.0),
    itemtype = 'longpipe'
  },
  ['ngd_pipe5'] = {
    prop = 'long_pipe_2',
    lighter = 'ex_prop_exec_lighter_01',
    mouthcoords = vector3(-0.03, 0.27, 0.01),
    mouthrotation = vector3(9.0, 190.0, 260.0),
    handcoords = vector3(0.08, -0.08, -0.03),
    handrotation = vector3(9.0, -50.0, 65.0),
    itemtype = 'longpipe'
  },
}

Config.CigSmokeAmount = 0.03   -- Amount of smoke for cigarettes
Config.CigarSmokeAmount = 0.05 -- Amount of smoke for cigars
Config.PipeSmokeAmount = 0.08  -- Amount of smoke for pipes

--Pipe tobacco types and quantity required.
Config.UsePipeTobaco = {
  ['ngd_drypipetobacco'] = 1,
  ['ngd_drycherrytobacco'] = 1,
  ['ngd_drymapletobacco'] = 1,
  ['ngd_drylemontobacco'] = 1,
  ['ngd_drywintergtobacco'] = 1,
}

--Buffs to give players when smoking.  Others can be added if you change editableclient.lua and editablserver.lua to match.
Config.ItemBuffs = {
  ['ngd_cig1'] = {              -- Standard Cigarette
    stress = { 1, 5 },          -- Range for random stress value
    armor = { 1, 5 }            -- Range for random armor value
  },
  ['ngd_cig2'] = {              -- Premium Cigarette
    stress = { 3, 8 },          -- Range for random stress value
    armor = { 2, 6 }            -- Range for random armor value
  },
  ['ngd_cig3'] = {              -- Cigarillo
    stress = { 1, 5 },          -- Range for random stress value
    armor = { 1, 5 }            -- Range for random armor value
  },
  ['ngd_cig4'] = {              -- Menthol Cigarette
    stress = { 1, 5 },          -- Range for random stress value
    armor = { 1, 5 }            -- Range for random armor value
  },
  ['ngd_cigar1'] = {            -- Standard Cigar
    stress = { 1, 5 },          -- Range for random stress value
    armor = { 1, 5 }            -- Range for random armor value
  },
  ['ngd_cigar2'] = {            -- Premium Cigar
    stress = { 3, 8 },          -- Range for random stress value
    armor = { 2, 6 }            -- Range for random armor value
  },
  ['ngd_cigar3'] = {            -- Cuban Cigar
    stress = { 3, 8 },          -- Range for random stress value
    armor = { 2, 6 }            -- Range for random armor value
  },
  ['ngd_drypipetobacco'] = {    -- Dried Cigar Tobacco Leaves
    stress = { 1, 3 },          -- Range for random stress value
    armor = { 1, 3 }            -- Range for random armor value
  },
  ['ngd_drycherrytobacco'] = {  -- Dried Cigar Tobacco Leaves
    stress = { 3, 8 },          -- Range for random stress value
    armor = { 1, 2 }            -- Range for random armor value
  },
  ['ngd_drymapletobacco'] = {   -- Dried Cigar Tobacco Leaves
    stress = { 3, 8 },          -- Range for random stress value
    armor = { 1, 2 }            -- Range for random armor value
  },
  ['ngd_drylemontobacco'] = {   -- Dried Cigar Tobacco Leaves
    stress = { 3, 8 },          -- Range for random stress value
    armor = { 1, 2 }            -- Range for random armor value
  },
  ['ngd_drywintergtobacco'] = { -- Dried Cigar Tobacco Leaves
    stress = { 3, 8 },          -- Range for random stress value
    armor = { 1, 2 }            -- Range for random armor value
  },
}

-- ███████ ██ ███    ██ ██   ██ ███████
-- ██      ██ ████   ██ ██  ██  ██
-- ███████ ██ ██ ██  ██ █████   ███████
--      ██ ██ ██  ██ ██ ██  ██       ██
-- ███████ ██ ██   ████ ██   ██ ███████
--Locations for handwash

Config.HandWash = {
  ['TobaccoSink1'] = {
    coords = vector3(-66.69, 2875.46, 60.15),
    size = vector3(0.5, 0.5, 0.5),
    rotation = 149,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['TobaccoSink2'] = {
    coords = vector3(-68.94, 2876.67, 60.15),
    size = vector3(0.5, 0.5, 0.5),
    rotation = 149,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['TobaccoSink3'] = {
    coords = vector3(-52.26, 2897.78, 59.70),
    size = vector3(1.8, 0.9, 1.5),
    rotation = 241,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['TobaccoSink4'] = {
    coords = vector3(-33.85, 2916.1, 60.10),
    size = vector3(0.4, 0.4, 0.5),
    rotation = 243,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['TobaccoSink5'] = {
    coords = vector3(-37.82, 2918.20, 60.0),
    size = vector3(0.4, 0.4, 0.5),
    rotation = 243,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['TobaccoSink6'] = {
    coords = vector3(-41.71, 2920.14, 60.0),
    size = vector3(0.4, 0.4, 0.5),
    rotation = 243,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['TobaccoSink7'] = {
    coords = vector3(-45.48, 2912.26, 59.8),
    size = vector3(4.4, 0.4, 0.5),
    rotation = 151,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
}

-- ███    ██  ██████  ██████         ██████  ██████  ███    ██ ███████ ██    ██ ███    ███ ███████
-- ████   ██ ██       ██   ██       ██      ██    ██ ████   ██ ██      ██    ██ ████  ████ ██
-- ██ ██  ██ ██   ███ ██   ██ █████ ██      ██    ██ ██ ██  ██ ███████ ██    ██ ██ ████ ██ █████
-- ██  ██ ██ ██    ██ ██   ██       ██      ██    ██ ██  ██ ██      ██ ██    ██ ██  ██  ██ ██
-- ██   ████  ██████  ██████         ██████  ██████  ██   ████ ███████  ██████  ██      ██ ███████
--Configuration for the built in consumables.  If NGDConsume = true - then it will register all of the food items.
Config.NGDConsume = true          -- Use built in consumables.
Config.DisableMovement = false    -- Disables moving while eating
Config.DisableCarMovement = false -- Disables driving while eating
Config.DisableMouse = false       -- Disables mouse movement while eating
Config.DisableCombat = true       -- Disables combat while eating

--Drink Configuration
Config.DrinkThirstMin = 15
Config.DrinkThirstMax = 35
Config.DrinkHunger = 4
Config.DrinkStressMin = 5
Config.DrinkStressMax = 10

--Config for drink
Config.TobaccoDrinks = {
  ['ngd_tobaccowhisky'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'prop_drink_whisky',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.03),
    rotation = vector3(-112.0, -110.0, 1.0),
    time = 5000
  },
}

-- ██████  ██   ██  █████  ██ ██████  ███████
-- ██      ██   ██ ██   ██ ██ ██   ██ ██
-- ██      ███████ ███████ ██ ██████  ███████
-- ██      ██   ██ ██   ██ ██ ██   ██      ██
--  ██████ ██   ██ ██   ██ ██ ██   ██ ███████
Config.Chairs = {
  [1] = {
    coords = vector3(-34.84, 2901.99, 59.53),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [2] = {
    coords = vector3(-35.29, 2901.17, 59.53),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [3] = {
    coords = vector3(-35.62, 2900.55, 59.53),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [4] = {
    coords = vector3(-44.07, 2884.82, 59.53),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [5] = {
    coords = vector3(-44.56, 2884.06, 59.53),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [6] = {
    coords = vector3(-44.97, 2883.48, 59.52),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [7] = {
    coords = vector3(-46.01, 2881.19, 59.53),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [8] = {
    coords = vector3(-46.37, 2880.48, 59.53),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [9] = {
    coords = vector3(-46.88, 2879.67, 59.53),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 58.5,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [10] = {
    coords = vector3(-45.9, 2894.3, 59.6),
    size = vector3(0.4, 0.4, 1.2),
    rotation = 263,
    height = 58.65,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'anim@amb@office@seating@female@var_d@base@',
    anim = 'base'
  },
  [11] = {
    coords = vector3(-63.68, 2890.81, 59.54),
    size = vector3(1.0, 1.0, 1.2),
    rotation = 64,
    height = 59.65,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@world_human_sunbathe@female@back@base',
    anim = 'base'
  },
  [12] = {
    coords = vector3(-49.16, 2911.71, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 157,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [13] = {
    coords = vector3(-50.69, 2912.57, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 157,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [14] = {
    coords = vector3(-49.87, 2912.09, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 157,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [15] = {
    coords = vector3(-52.99, 2910.96, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 240,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [16] = {
    coords = vector3(-52.61, 2911.65, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 240,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [17] = {
    coords = vector3(-52.28, 2912.39, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 240,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [18] = {
    coords = vector3(-52.11, 2909.65, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 333,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [19] = {
    coords = vector3(-51.44, 2909.29, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 333,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [20] = {
    coords = vector3(-50.65, 2908.87, 63.0),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 333,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [21] = {
    coords = vector3(-41.59, 2902.16, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 333,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [22] = {
    coords = vector3(-40.45, 2901.69, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 333,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [23] = {
    coords = vector3(-39.44, 2902.55, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 66,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [24] = {
    coords = vector3(-41.14, 2908.82, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 159,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [25] = {
    coords = vector3(-42.47, 2909.35, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 159,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [26] = {
    coords = vector3(-43.6, 2908.78, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 251,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [27] = {
    coords = vector3(-55.85, 2886.26, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 245,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [28] = {
    coords = vector3(-56.44, 2885.04, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 240,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [29] = {
    coords = vector3(-55.89, 2883.93, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 331,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [30] = {
    coords = vector3(-49.06, 2884.41, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 67,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [31] = {
    coords = vector3(-48.26, 2885.75, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 65,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [32] = {
    coords = vector3(-49.1, 2886.59, 62.5),
    size = vector3(0.6, 0.6, 0.8),
    rotation = 152,
    height = 62.2,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'timetable@ron@ig_3_couch',
    anim = 'base'
  },
  [33] = {
    coords = vector3(-61.87, 2901.78, 63.0),
    size = vector3(0.5, 0.5, 0.8),
    rotation = 246,
    height = 61.75,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [34] = {
    coords = vector3(-58.72, 2902.51, 63.0),
    size = vector3(0.5, 0.5, 0.8),
    rotation = 152,
    height = 61.75,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [35] = {
    coords = vector3(-57.41, 2901.65, 63.0),
    size = vector3(0.5, 0.5, 0.8),
    rotation = 152,
    height = 61.75,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [36] = {
    coords = vector3(-57.41, 2901.65, 63.0),
    size = vector3(0.5, 0.5, 0.8),
    rotation = 152,
    height = 61.75,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [37] = {
    coords = vector3(-56.28, 2898.84, 63.0),
    size = vector3(0.5, 0.5, 0.8),
    rotation = 64,
    height = 61.75,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [38] = {
    coords = vector3(-59.13, 2898.23, 63.0),
    size = vector3(0.5, 0.5, 0.8),
    rotation = 340,
    height = 61.75,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [39] = {
    coords = vector3(-59.13, 2898.23, 63.0),
    size = vector3(0.5, 0.5, 0.8),
    rotation = 340,
    height = 61.75,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
  [40] = {
    coords = vector3(-60.61, 2898.88, 63.0),
    size = vector3(0.5, 0.5, 0.8),
    rotation = 329,
    height = 61.75,
    label = 'Sit',
    icon = 'fas fa-couch',
    dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a',
    anim = 'idle_b'
  },
}
