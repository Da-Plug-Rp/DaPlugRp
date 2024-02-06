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
            Location = vector3(22.0, -1107.2, 29.8),
        },
        Price = 15000,
        Location =  vector3(22.0, -1107.2, 29.8),
    },

    Practical = {
        Blip = {
            Enabled = false,
            Scale = 0.7,
            Color = 3,
            Sprite = 150,
            Location = vector3(14.39, -1097.57, 29.83),
        },
        Location = vector3(14.39, -1097.57, 29.83),
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
        Location = vector3(12.67, -1096.94, 29.8),
    },
    Price = 0, -- Use 0 to disable it
    Location =  vector3(12.67, -1096.94, 29.8),
    SecondsToEndPractise = 20,
    TotalTargetsToEnd = 25,
    Weapon = 'WEAPON_PISTOL', -- WEAPON_PISTOL list: https://wiki.rage.mp/index.php?title=Weapons
}

Config.PreventDuplicationOnInit = true -- Prevents targets to being stuck on client when shooting starts
Config.DisarmIfExits = true -- Disarm the player if exiting the shooting range room
Config.DoorPointToDisarm = vector3(7.4896187782288,-1098.8973388672,28.797010421753)

Config.WeaponLicenseProp = "prop_range_target_03"
Config.WeaponLicensePropPosition = {
    { x = 12.50, y = -1088.64, z = 31.83}, 
    { x = 14.25, y = -1089.40, z = 31.83}, 
    { x = 16.08, y = -1090.03, z = 31.83}, 
    { x = 20.70, y = -1091.64, z = 31.83}, 
    { x = 23.85, y = -1083.24, z = 31.83}, 
    { x = 22.26, y = -1082.57, z = 31.83},  
    { x = 21.06, y = -1082.08, z = 31.83},  
    { x = 20.17, y = -1081.79, z = 31.83},  
    { x = 19.18, y = -1081.37, z = 31.83},  
    { x = 17.39, y = -1080.80, z = 31.83}, 
    { x = 15.40, y = -1080.15, z = 31.83}, 
    { x = 14.39, y = -1079.68, z = 31.83}, 
    { x = 18.69, y = -1069.38, z = 31.83}, 
    { x = 20.58, y = -1070.15, z = 31.83}, 
    { x = 22.94, y = -1071.04, z = 31.83}, 
    { x = 24.73, y = -1071.72, z = 31.83}, 
    { x = 26.84, y = -1072.43, z = 31.83}, 
}
