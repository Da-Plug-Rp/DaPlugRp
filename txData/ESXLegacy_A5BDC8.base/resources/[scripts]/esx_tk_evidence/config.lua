Config = {}

Config.Locale = 'en' -- en / fi 
Config.NotificationType = 'esx' -- esx / mythic
Config.DatabaseUsersTableName = 'users' -- Name for the 'users' table in your database, change if it is different from this
Config.MenuAlign = 'top-left' -- Align for the ESX menu
Config.DebugMode = false -- true / false, used for debugging

Config.UseOxLib = true -- false / true, remember to add " shared_script '@ox_lib/init.lua' " to fxmanifest.lua if set to true
Config.UseOxInventory = true -- false / true
Config.UseOxTarget = true -- false / true
Config.TargetDistance = 2.0

Config.CollectKey = 38 -- key to collect evidence

Config.PoliceJobs = { -- Jobs that can collect and analyze the evidence and do GSR tests if NeedJobGSR is set to true
    ['police'] = 0, -- job name, minimum grade
    ['sheriff'] = 0,
}

Config.EnableEvidence = true -- true / false, set to false if you wan't to disable evidence (bullet shells, blood, etc.)
Config.EnableVehFingerprints = true -- true / false, should being in a vehicle leave fingerprints that police can analyze

Config.WeaponsNoShells = { -- Weapons that shouldn't drop shells
    --[`WEAPON_STUNGUN`] = true,
}

Config.GetRPName = true -- true / false, set to true if the script isn't returning player charnames but you'd wan't it to (should return RP names by default)
Config.WeaponToSeeEvidence = 'WEAPON_FLASHLIGHT' -- Weapon needed to see evidence on ground, leave to blank if you want players to always see evidence on ground
Config.UseEvidenceText = true -- Should there be a text above evidence that isn't the closest to you (true / false, test both for better understanding)
Config.ShellRandomness = true -- Should shells be a bit randomly placed when shot (the shell "flies out" of the gun so it's a bit random)

Config.ShootingWait = 10 -- How many milliseconds to wait before checking again if player is shooting, bigger = better performance
Config.UpdateEvidenceTime = 1000 * 60 * 10 -- How often should server check whether an evidence should be deleted, bigger = better performance (last number = time in minues)
Config.UpdateGSRTime = 1000 * 60 * 60 -- How often should server check whether a gsr should be deleted, bigger = better performance (last number = time in minues)

Config.SeeDistance = 8 -- Distance to see evidence on ground (smaller = better performance)
Config.InteractDistance = 2 -- Distance at which you can interact with the evidence on ground

Config.MaxEvidence = 0 -- Max amount of evidence a police can carry, set to 0 for unlimited
Config.SaveEvidence = true -- Should evidence the player has picked up save in their inventory until they get rid of it
Config.AnalyzeCoords = { -- Coords where you can analyze evidence
    vector3(-316.5824, -266.9948, 39.8663),
}
Config.SeeAnalyzeText = 2 -- Distance at which you will see the 'analyze' text
Config.AnalyzeTime = 1000 -- How long it takes to analyze evidence, how many shells you are carrying * this (eg. You have 5 shells --> 5 * 1000 = 5000ms = 5s)

Config.EnableGSR = true -- false / true, should GSR be enabled
Config.RemoveGSRInWater = true -- Should gsr be removed when player goes into water (true / false)
Config.GSRCleanTime = 15 -- How long should it take to remove gsr when in water (in seconds)
Config.GSRDisappearTime = 60 * 60 -- How long should it take for GSR to disappear from hands (last number = time in minutes)
Config.RecentTime = 60 * 10 -- Time for the GSR test to show that the GSR is 'recent' (see locale file for better understanding) (last number = time in minutes)

Config.GSRTestDuration = 5000 -- How long should it take to do a GSR test (in milliseconds)
Config.GSRClothDuration = 5000 -- How long should it take to use a GSR cloth (in milliseconds)
Config.NeedJobGSR = true -- Do you need a job to use the GSR test kit (true / false)
Config.NeedItemGSR = true -- Do you need a GSR test kit to do a GSR test (true / false)
Config.UseGSRCloth = true -- Use GSR cloth item (allows players to take off GSR by using this item)
Config.WeaponsNoGSR = { -- Weapons that won't leave a GSR
    [`WEAPON_STUNGUN`] = true,
}
Config.WeaponsNoFragments = { -- Weapons that won't leave bullet fragments
    [`WEAPON_STUNGUN`] = true,
}
Config.WeaponsNoHoles = { -- Weapons that won't leave bullet holes
    [`WEAPON_STUNGUN`] = true,
}


Config.Anims = { -- animation settings
    collect = {
        dict = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@',
        name = 'plant_floor',
        duration = 1000,
    },
}

Config.SerialChance = { -- chance for player weapon serial number to be shown when evidence analyzed (percentage), only evidence listed here will have a chance for serial number to be shown (only works with ox_inventory)
    bullet_casing = 100,
    --bullet_fragment = 10,
}

Config.NameChance = { -- chance for player name to be shown when evidence analyzed (percentage), only evidence listed here will have a chance for name to be shown
    bullet_casing = 50,
    fingerprints = 100,
    --bullet_fragment = 50,
}

Config.GlovesAffect = { -- should gloves affect the chance of fingerprints being left in certain evidence
    bullet_casing = true, -- false / true
    bullet_fragment = true,
    fingerprints = true,
}

Config.DuplicateDistance = { -- distance to check for duplicate evidence before spawning new one
    bullet_fragment = 0.1,
    bullet_casing = 0.1,
    bullet_hole = 0.1,
    blood_sample = 0.1,
}

Config.Markers = { -- marker settings for different evidence types
    bullet_casing = {
        type = 27,
        color = {r = 204, g = 150, b = 24, a = 200},
    },
    bullet_fragment = {
        type = 27,
        color = {r = 174, g = 124, b = 0, a = 200},
    },
    bullet_hole = {
        type = 3,
        color = {r = 24, g = 96, b = 240, a = 200},
    },
    fingerprint_sample = {
        type = 3,
        color = {r = 24, g = 96, b = 240, a = 200},
    },
    blood_sample = {
        type = 27,
        color = {r = 150, g = 0, b = 0, a = 200},
    },
    evidence = {
        type = 3,
        color = {r = 24, g = 96, b = 240, a = 200},
    },
}

Config.Disappear = { -- how long for different evidence types to disappear
    bullet_casing = 60 * 360,  -- (last number = time in minutes)
    bullet_fragment = 60 * 360,
    bullet_hole = 60 * 360,
    fingerprint_sample = 60 * 360,
    blood_sample = 60 * 360,
    evidence = 60 * 360,
    vehicle_fingerprint = 1000 * 60 * 120 -- How long should it take for fingerprints to disappear from vehicles (last number = time in minutes)
}

Config.BodyParts = {
    [31085] = true,
    [31086] = true,
    [39317] = true,
    [57597] = true,
    [23553] = true,
    [24816] = true,
    [24817] = true,
    [24818] = true,
    [10706] = true,
    [64729] = true,
    [11816] = true,
    [45509] = true,
    [61163] = true,
    [18905] = true,
    [4089] = true,
    [4090] = true,
    [4137] = true,
    [4138] = true,
    [4153] = true,
    [4154] = true,
    [4169] = true,
    [4170] = true,
    [4185] = true,
    [4186] = true,
    [26610] = true,
    [26611] = true,
    [26612] = true,
    [26613] = true,
    [26614] = true,
    [58271] = true,
    [63931] = true,
    [2108] = true,
    [14201] = true,
    [40269] = true,
    [28252] = true,
    [57005] = true,
    [58866] = true,
    [58867] = true,
    [58868] = true,
    [58869] = true,
    [58870] = true,
    [64016] = true,
    [64017] = true,
    [64064] = true,
    [64065] = true,
    [64080] = true,
    [64081] = true,
    [64096] = true,
    [64097] = true,
    [64112] = true,
    [64113] = true,
    [36864] = true,
    [51826] = true,
    [20781] = true,
    [52301] = true,
}

Config.Taser = {
    [`WEAPON_STUNGUN`] = 'WEAPON_STUNGUN'
}

Config.Pistols = {
    [`WEAPON_VINTAGEPISTOL`] = 'WEAPON_VINTAGEPISTOL',
    [`WEAPON_SNSPISTOL`] = 'WEAPON_SNSPISTOL',
    [`WEAPON_SNSPISTOL_MK2`] = 'WEAPON_SNSPISTOL_MK2',
    [`WEAPON_PISTOL`] = 'WEAPON_PISTOL',
    [`WEAPON_PISTOL_MK2`] = 'WEAPON_PISTOL_MK2',
    [`WEAPON_COMBATPISTOL`] = 'WEAPON_COMBATPISTOL',
    [`WEAPON_APPISTOL`] = 'WEAPON_APPISTOL',
    [`WEAPON_HEAVYPISTOL`] = 'WEAPON_HEAVYPISTOL',
    [`WEAPON_PISTOL50`] = 'WEAPON_PISTOL50',
    [`WEAPON_REVOLVER`] = 'WEAPON_REVOLVER',
    [`WEAPON_REVOLVER_MK2`] = 'WEAPON_REVOLVER_MK2',
    [`WEAPON_MARKSMANPISTOL`] = 'WEAPON_MARKSMANPISTOL',
    [`WEAPON_DOUBLEACTION`] = 'WEAPON_DOUBLEACTION'
}

Config.Smgs = {
    [`WEAPON_MICROSMG`] = 'WEAPON_MICROSMG',
    [`WEAPON_SMG`] = 'WEAPON_SMG',
    [`WEAPON_SMG_MK2`] = 'WEAPON_SMG_MK2',
    [`WEAPON_ASSAULTSMG`] = 'WEAPON_ASSAULTSMG',
    [`WEAPON_COMBATPDW`] = 'WEAPON_COMBATPDW',
    [`WEAPON_MACHINEPISTOL`] = 'WEAPON_MACHINEPISTOL',
    [`WEAPON_MINISMG`] = 'WEAPON_MINISMG'
}

Config.Shotguns = {
    [`WEAPON_PUMPSHOTGUN`] = 'WEAPON_PUMPSHOTGUN',
    [`WEAPON_PUMPSHOTGUN_MK2`] = 'WEAPON_PUMPSHOTGUN_MK2',
    [`WEAPON_ASSAULTSHOTGUN`] = 'WEAPON_ASSAULTSHOTGUN',
    [`WEAPON_BULLPUPSHOTGUN`] = 'WEAPON_BULLPUPSHOTGUN',
    [`WEAPON_SAWNOFFSHOTGUN`] = 'WEAPON_SAWNOFFSHOTGUN',
    [`WEAPON_DBSHOTGUN`] = 'WEAPON_DBSHOTGUN',
    [`WEAPON_HEAVYSHOTGUN`] = 'WEAPON_HEAVYSHOTGUN',
    [`WEAPON_MUSKET`] = 'WEAPON_MUSKET',
    [`WEAPON_AUTOSHOTGUN`] = 'WEAPON_AUTOSHOTGUN',
    [`WEAPON_COMBATSHOTGUN`] = 'WEAPON_COMBATSHOTGUN'
}

Config.Rifles = {
    [`WEAPON_ASSAULTRIFLE`] = 'WEAPON_ASSAULTRIFLE',
    [`WEAPON_ASSAULTRIFLE_MK2`] = 'WEAPON_ASSAULTRIFLE_MK2',
    [`WEAPON_CARBINERIFLE`] = 'WEAPON_CARBINERIFLE',
    [`WEAPON_CARBINERIFLE_MK2`] = 'WEAPON_CARBINERIFLE_MK2',
    [`WEAPON_ADVANCEDRIFLE`] = 'WEAPON_ADVANCEDRIFLE',
    [`WEAPON_SPECIALCARBINE`] = 'WEAPON_SPECIALCARBINE',
    [`WEAPON_SPECIALCARBINE_MK2`] = 'WEAPON_SPECIALCARBINE_MK2',
    [`WEAPON_BULLPUPRIFLE`] = 'WEAPON_BULLPUPRIFLE',
    [`WEAPON_BULLPUPRIFLE_MK2`] = 'WEAPON_BULLPUPRIFLE_MK2',
    [`WEAPON_COMPACTRIFLE`] = 'WEAPON_COMPACTRIFLE',
    [`WEAPON_MILITARYRIFLE`] = 'WEAPON_MILITARYRIFLE'
}

Config.Mgs = {
    [`WEAPON_MG`] = 'WEAPON_MG',
    [`WEAPON_COMBATMG`] = 'WEAPON_COMBATMG',
    [`WEAPON_COMBATMG_MK2`] = 'WEAPON_COMBATMG_MK2',
    [`WEAPON_GUSENBERG`] = 'WEAPON_GUSENBERG'
}

Config.Snipers = {
    [`WEAPON_SNIPERRIFLE`] = 'WEAPON_SNIPERRIFLE',
    [`WEAPON_HEAVYSNIPER`] = 'WEAPON_HEAVYSNIPER',
    [`WEAPON_HEAVYSNIPER_MK2`] = 'WEAPON_HEAVYSNIPER_MK2',
    [`WEAPON_MARKSMANRIFLE`] = 'WEAPON_MARKSMANRIFLE',
    [`WEAPON_MARKSMANRIFLE_MK2`] = 'WEAPON_MARKSMANRIFLE_MK2'
}

Config.AnyWeaponMakesBlood = false -- Should any weapon make a blood sample (true / false)
Config.WeaponsBlood = {
    [`WEAPON_PISTOL`] = true,
    [`WEAPON_COMBATPISTOL`] = true,
    [`WEAPON_APPISTOL`] = true,
    [`WEAPON_COMBATPDW`] = true,
    [`WEAPON_MACHINEPISTOL`] = true,
    [`WEAPON_MICROSMG`] = true,
    [`WEAPON_MINISMG`] = true,
    [`WEAPON_PISTOL_MK2`] = true,
    [`WEAPON_SNSPISTOL`] = true,
    [`WEAPON_SNSPISTOL_MK2`] = true,
    [`WEAPON_VINTAGEPISTOL`] = true,

    [`WEAPON_ADVANCEDRIFLE`] = true,
    [`WEAPON_ASSAULTSMG`] = true,
    [`WEAPON_BULLPUPRIFLE`] = true,
    [`WEAPON_BULLPUPRIFLE_MK2`] = true,
    [`WEAPON_CARBINERIFLE`] = true,
    [`WEAPON_CARBINERIFLE_MK2`] = true,
    [`WEAPON_COMPACTRIFLE`] = true,
    [`WEAPON_DOUBLEACTION`] = true,
    [`WEAPON_GUSENBERG`] = true,
    [`WEAPON_HEAVYPISTOL`] = true,
    [`WEAPON_MARKSMANPISTOL`] = true,
    [`WEAPON_PISTOL50`] = true,
    [`WEAPON_REVOLVER`] = true,
    [`WEAPON_REVOLVER_MK2`] = true,
    [`WEAPON_SMG`] = true,
    [`WEAPON_SMG_MK2`] = true,
    [`WEAPON_SPECIALCARBINE`] = true,
    [`WEAPON_SPECIALCARBINE_MK2`] = true,

    [`WEAPON_ASSAULTRIFLE`] = true,
    [`WEAPON_ASSAULTRIFLE_MK2`] = true,
    [`WEAPON_COMBATMG`] = true,
    [`WEAPON_COMBATMG_MK2`] = true,
    [`WEAPON_HEAVYSNIPER`] = true,
    [`WEAPON_HEAVYSNIPER_MK2`] = true,
    [`WEAPON_MARKSMANRIFLE`] = true,
    [`WEAPON_MARKSMANRIFLE_MK2`] = true,
    [`WEAPON_MG`] = true,
    [`WEAPON_MINIGUN`] = true,
    [`WEAPON_MUSKET`] = true,
    [`WEAPON_RAILGUN`] = true,

    [`WEAPON_ASSAULTSHOTGUN`] = true,
    [`WEAPON_BULLUPSHOTGUN`] = true,
    [`WEAPON_DBSHOTGUN`] = true,
    [`WEAPON_HEAVYSHOTGUN`] = true,
    [`WEAPON_PUMPSHOTGUN`] = true,
    [`WEAPON_PUMPSHOTGUN_MK2`] = true,
    [`WEAPON_SAWNOFFSHOTGUN`] = true,
    [`WEAPON_SWEEPERSHOTGUN`] = true,

    [`WEAPON_BATTLEAXE`] = true,
    [`WEAPON_BOTTLE`] = true,
    [`WEAPON_DAGGER`] = true,
    [`WEAPON_HATCHET`] = true,
    [`WEAPON_KNIFE`] = true,
    [`WEAPON_MACHETE`] = true,
    [`WEAPON_SWITCHBLADE`] = true,

    [`WEAPON_FLASHLIGHT`] = true,
    [`WEAPON_KNUCKLE`] = true,
    [`WEAPON_NIGHTSTICK`] = true,

    [`WEAPON_BAT`] = true,
    [`WEAPON_CROWBAR`] = true,
    [`WEAPON_FIREEXTINGUISHER`] = true,
    [`WEAPON_FIRWORK`] = true,
    [`WEAPON_GOLFLCUB`] = true,
    [`WEAPON_HAMMER`] = true,
    [`WEAPON_PETROLCAN`] = true,
    [`WEAPON_POOLCUE`] = true,
    [`WEAPON_WRENCH`] = true,

    [`WEAPON_EXPLOSION`] = true,
    [`WEAPON_GRENADE`] = true,
    [`WEAPON_COMPACTLAUNCHER`] = true,
    [`WEAPON_HOMINGLAUNCHER`] = true,
    [`WEAPON_PIPEBOMB`] = true,
    [`WEAPON_PROXMINE`] = true,
    [`WEAPON_RPG`] = true,
    [`WEAPON_STICKYBOMB`] = true,

    [`WEAPON_FALL`] = true,
    [`WEAPON_RAMMED_BY_CAR`] = true,
    [`WEAPON_RUN_OVER_BY_CAR`] = true,
    [`WEAPON_HELI_CRASH`] = true,
    [`WEAPON_STUNGUN`] = true,
    [`WEAPON_BLEEDING`] = true,
}