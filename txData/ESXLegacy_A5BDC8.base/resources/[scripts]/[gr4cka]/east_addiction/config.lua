Config = {}

Config.Drugs = {
    joint = {
        task = "WORLD_HUMAN_SMOKING_POT",
        effectDuration = 180, -- seconds
        screenEffect = "DefaultFlash", -- Screen FX
        speedMultiplier = 1.0, -- from 1.0 to 1.49
        walkingStyle = "MOVE_M@DRUNK@SLIGHTLYDRUNK",
        cameraShake = 1.0, -- intensity
        addHealth = 10,
        addArmour = 10,
        addictionChance = 5, -- 10%, 100 = 100%
        addictionTime = 60, -- minutes, time between doses
        drugStrenght = 5, -- if player takes more drug strenght than it can take (Config.Overdose) then it overdoses
    },
    cocaine = {
        task = "WORLD_HUMAN_SMOKING_POT",
        effectDuration = 240, -- seconds
        screenEffect = "CamPushInNeutral",
        speedMultiplier = 1.49,
        walkingStyle = "MOVE_M@DRUNK@SLIGHTLYDRUNK",
        cameraShake = 1.5, -- intensity
        addHealth = 0,
        addArmour = 20,
        addictionChance = 60, -- 10%, 100 = 100%
        addictionTime = 240, -- minutes, time between doses
        drugStrenght = 15,
    },
    meth = {
        task = "WORLD_HUMAN_SMOKING_POT",
        effectDuration = 300, -- seconds
        screenEffect = "CamPushInTrevor",
        speedMultiplier = 1.2,
        walkingStyle = "MOVE_M@BAIL_BOND_TAZERED",
        cameraShake = 2.0, -- intensity
        addHealth = -10,
        addArmour = 0,
        addictionChance = 90, -- 10%, 100 = 100%
        addictionTime = 90, -- minutes, time between doses
        drugStrenght = 40,
    },
    heroin = {
        task = "WORLD_HUMAN_SMOKING_POT",
        effectDuration = 240, -- seconds
        screenEffect = "DeathFailFranklinIn",
        speedMultiplier = 1.2,
        walkingStyle = "MOVE_M@DRUNK@VERYDRUNK",
        cameraShake = 3.0, -- intensity
        addHealth = -10,
        addArmour = 0,
        addictionChance = 80, -- 10%, 100 = 100%
        addictionTime = 180, -- minutes, time between doses
        drugStrenght = 35,
    },
    mdma = {
        task = "WORLD_HUMAN_SMOKING_POT",
        effectDuration = 180, -- seconds
        screenEffect = "DMT_flight",
        speedMultiplier = 1.0,
        walkingStyle = "MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP",
        cameraShake = 1.0, -- intensity
        addHealth = 0,
        addArmour = 10,
        addictionChance = 15, -- 10%, 100 = 100%
        addictionTime = 300, -- minutes, time between doses
        drugStrenght = 25,
    },
}

Config.Medication = { -- what addictions can medications get rid off
    buspirone  = {'joint'},
    propranolol = {'cocaine'},
    methadone = {'heroin', 'meth'},
    antimdma = {'mdma'},
}

Config.Overdose = 50 -- how much strenght of drugs can player take until he overdoses

Config.RagdollIntensity = 20 -- seconds, ragdoll every 20 seconds when addiction requires dose

Config.Translations = {
    addiction = "You dream about %s",
    overdose = "You have just overdosed",
    took = "You just took %s",
    healed = "You have healed from addiction to %s",
}

function notification(text)
    TriggerEvent('esx:showNotification', text)
end