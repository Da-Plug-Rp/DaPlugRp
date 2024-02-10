Config = {}

function L(cd, ...) if Locales[Config.Language][cd] then return string.format(Locales[Config.Language][cd], ...) else print('Locale is nil ('..cd..')') end end

Config.DrawDistance = 15.0
Config.Language = 'en'
Config.CheckForUpdates = true

Config.Framework = 'esx' -- 'qb' or 'esx'
Config.GetSharedObjectfunction = false

Config.WeaponLicenses = {
    Theorical = {
        Blip = {
            Enabled = false,
            Scale = 0.7,
            Color = 3,
            Sprite = 150,
            Location = vector3(14.1097, -1105.1890, 29.1092),
        },
        Price = 15000,
        Location =  vector3(14.1097, -1105.1890, 29.1092),
    },

    Practical = {
        Blip = {
            Enabled = false,
            Scale = 0.7,
            Color = 3,
            Sprite = 150,
            Location = vector3(14.3719, -1095.4413, 28.4370),
        },
        Location = vector3(11.6740, -1092.5533, 28.4679),
        Price = 85000,
        TimeToFailTest = 12, -- In seconds, 0 == deactivated, 10 = 10 seconds - less seconds are harder
        TotalTargetsToEnd = 10, -- Targets to end and pass exam
        CountDownInterval = 5, -- In seconds, time to start practical test after pressing OK button
        Weapon = 'WEAPON_PISTOL', -- WEAPON_PISTOL list: https://wiki.rage.mp/index.php?title=Weapons
    }
}

Config.WeaponPractisePoint = {
    Enabled = true,
    NeedsLiceseToUse = false, -- put true if you want to check weapon license before start
    Blip = {
        Enabled = true,
        Scale = 0.7,
        Color = 3,
        Sprite = 150,
        Location = vector3(19.8981, -1097.6838, 28.4370),
    },
    Price = 0, -- Use 0 to disable it
    Location =  vector3(19.1658, -1095.2760, 28.4679),
    SecondsToEndPractise = 20,
    TotalTargetsToEnd = 25,
    Weapon = 'WEAPON_PISTOL', -- WEAPON_PISTOL list: https://wiki.rage.mp/index.php?title=Weapons
}

Config.PreventDuplicationOnInit = true -- Prevents targets to being stuck on client when shooting starts
Config.DisarmIfExits = true -- Disarm the player if exiting the shooting range room
Config.DoorPointToDisarm = vector3(9.4603, -1097.1672, 28.4082)

Config.WeaponLicenseProp = "prop_range_target_03"
Config.WeaponLicensePropPosition = {
    { x = 11.8433, y = -1086.0507, z = 28.4087}, 
    { x = 16.9592, y = -1080.9381, z = 28.4087},
    { x = 16.9331, y = -1075.6229, z = 28.4087}, 
    { x = 25.5756, y = -1077.1090, z = 28.4087},
    { x = 21.3923, y = -1083.5646, z = 28.4087},
    { x = 21.9502, y = -1090.4252, z = 28.4087},  
    --{ x = 21.06, y = -1082.08, z = 31.83},  
    --{ x = 20.17, y = -1081.79, z = 31.83},  
    --{ x = 19.18, y = -1081.37, z = 31.83},  
   -- { x = 17.39, y = -1080.80, z = 31.83}, 
   -- { x = 15.40, y = -1080.15, z = 31.83}, 
   -- { x = 14.39, y = -1079.68, z = 31.83}, 
    --{ x = 18.69, y = -1069.38, z = 31.83}, 
    --{ x = 20.58, y = -1070.15, z = 31.83}, 
   -- { x = 22.94, y = -1071.04, z = 31.83}, 
    --{ x = 24.73, y = -1071.72, z = 31.83}, 
   -- { x = 26.84, y = -1072.43, z = 31.83}, 
}
