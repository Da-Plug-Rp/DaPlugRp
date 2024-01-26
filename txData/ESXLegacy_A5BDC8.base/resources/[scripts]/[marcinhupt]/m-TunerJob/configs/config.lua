Config = {}

-----------------
-- Utilitys
----------------- 
Config.Prefix = "m-TunerJob" -- Prefix of script
Config.Inventory = "ox_inventory" -- "quasar" or "ox_inventory"
Config.NameOfStash = "tunnersstash" -- Stash Name
Config.MaxWeighStash = 500000 -- Stash Weight
Config.MaxSlotsStash = 100 -- Stash Slots
Config.FuelSystem = "LegacyFuel" -- "LegacyFuel" | "ti_fuel" | "ox_fuel"
Config.Job = "tunners" -- Name of job         
Config.CustomSounds = true -- Use custom sounds?
Config.Volume = 0.5 -- Volume of custom sounds
Config.Minigame = false -- Enable minigames?
Config.QuasarGarage = false -- If you use quasar garages ( for fixing vehicles )

Config.Times = {
    InstallCoilovers = 5000,
    InstallWraps = 5000,
    InstallPlates = 5000,
    InstallTurbo = 5000,
    InstallWindows = 5000,
    InstallXenon = 5000,
    InstallDriftTires = 5000,
    RemoveDriftTires = 5000,
    DiagonosticMachine = 5000,
}

Config.SettingsMinigame = { -- https://github.com/Project-Sloth/ps-ui
    NumberOfCircles = math.random(2,4),
    MS = math.random(7,10),
}

-----------------
-- Blip
-----------------
Config.Blip = {
    Enable = true,
    blipSprite = 446,
    blipScale = 0.7,
    blipColour = 0,
    blipAplha = 0.7,
    blipName = "Mechanic Shop",
    Location = vector3(125.38, -3034.99, 7.04),
}  

-----------------
-- Chop Chop
-----------------
Config.EnableChopChop = true -- Enable Chop Chop?
Config.EnableSpecificVehicles = false -- Enable Specific Vehicles? If true change on : Config.SpecificVehicles
Config.TimeToChopChopAgain = 900000 -- Time to chopchop again. (15 Minutes)
Config["ChopChopLocation"] = {
    [1] = { x = 144.06, y = -2998.79, z = 7.03},  
    -- You can add more locations
}

Config.AmountGiveAfterChopChop = math.random(2,10) -- Number of items that will go out
Config.ItemsOnChopChop = {  -- Items reward on chopchop
    'metalscrap',
    'steel',
    'rubber',
    'glass',
}

Config.SpecificVehicles = {     -- List of Specific Vehicles for chop chop
    "t20"
}

-----------------
-- Vehicles
----------------- 
Config.PlateText = "TUNNERS" -- Plate of the car
Config.CarMechanics = { -- List of car available to mechanic's spawn
    { carSpawn = "flatbed3", Label = "Flatbed" },
    { carSpawn = "towtruck", Label = "Towtruck" },
    { carSpawn = "minivan", Label = "Minivan (Rental Car)" },
    { carSpawn = "blista", Label = "Blista" },
}
-----------------
-- Câmeras
-----------------
Config.SecurityCamera = {
    hideradar = false,
    cameras = {
        [1] = {label = "CAM#1", coords = vector3(156.28, -3006.42, 13.15),  r = {x = -25.0, y = 0.0, z = 235.85},    canRotate = true, isOnline = true},
        [2] = {label = "CAM#2", coords = vector3(156.07, -3059.22, 13.57),  r = {x = -25.0, y = 0.0, z = 159.23},    canRotate = true, isOnline = true},
        [3] = {label = "CAM#3", coords = vector3(153.90, -3051.26, 12.49),  r = {x = -35.0, y = 0.0, z = 68.09},     canRotate = true, isOnline = true},
        [4] = {label = "CAM#4", coords = vector3(123.2, -3017.04, 10.02),   r = {x = -35.0, y = 0.0, z = -168.91},   canRotate = true, isOnline = true},
    },
}

----------------------
-- Peds
----------------------

Config.PedsTunners = {
    [1] = { coords = vector3(125.31, -3026.32, 6.04), pedModel = "s_m_y_xmech_02", heading = 358.52},
}

----------------------
-- Nitro
----------------------
Config.HudUpdateNitrous = "hud:client:UpdateNitrous" -- Your trigger hud update 
Config.ProgressBarTime = 3000 -- Time for installing nitrous (1000 = 1sec)
Config.NitroBoost = 5.0 -- How much power give nitro
Config.AccelerationBoost = 3.0 -- How much power give nitro
Config.NitroItem = "nitrous" -- Item for installing nitro
Config.EmptyNitrosItem = "emptynitrous" -- Item which receive after nitro finish
Config.SwitchKey = 21 -- Switch Between Nitro Mode and Smoke Extraction Mode(Purge) // Original is LEFT SHIFT
Config.NitroPurgeKey = 36 -- Key for using Nitro or Purge (Depends of Mode) // Original is LEFT CTRL
Config.FlowRateUpKey = 27 -- Incrase FlowRate // Original is ARROW UP
Config.FlowRateDownKey = 173 -- Decrease FlowRate // Original is ARRW DOWN
Config.MaxSpeed = 25 -- If you driving under this speed u can install Nitro and u can use Purge System
Config.Debug = false -- Server print for database
Config.PurgeFlowRate = 0.5 -- Thats the size of Purge Flow Rate when u restart the server or script (from 0.1 to 1.0)
Config.NitroUseRate = 0.3 -- How fast the nitrous drains
Config.PurgeUseRate = 0.2 -- How fast the purge drains
Config.PlaySoundOnSwitch = true -- if you want to have sound on switch leave it true
Config.SoundFile = 'beep-sound-1' -- file name without the .ogg (located in /resources/[standalone]/interact-sound/client/html/sounds/)
Config.PlaySoundOnFlowRate = true -- if you want to have sound on switch on flowrates leave it true
Config.SoundFileFlowRate = 'elecbuzz' -- file name without the .ogg (located in /resources/[standalone]/interact-sound/client/html/sounds/)
Config.SoundVolumeFlowRate = 0.05 -- Sound Volume for Purge Switch Flow Rate Sound File
Config.SoundVolumeSwitch = 0.05 -- Sound Volume for Switch Sound File
Config.UseMPH = true -- If true speed math will be done as MPH, if false KPH will be used
Config.OnlyAcceleration = false -- If its true then will affect only for acceleration if its false will affect on Top Speed and Acceleration
Config.UpdateLevelWait = 10000 -- This is only for test (after this time will update nitrous level in database)
Config.PressedWait = 5000 -- Waiting interval for Button Pressed (1000 is 1sec)
Config.TopSpeed = 200 -- This will be top speed when using nitro
Config.Cooldown = 3000 -- CoolDown for using Nitro (1000 = 1sec)

