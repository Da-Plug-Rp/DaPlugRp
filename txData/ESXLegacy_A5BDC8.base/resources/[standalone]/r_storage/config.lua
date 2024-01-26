R = {}

-- Framework config
R.Framework = "ESX" -- Options: ESX, qbcore
R.newESX = true -- if you use esx 1.1 version set this to false

-- Essential config
R.InteractionType = "ox_target" -- Options: ox_target, textui
R.inventory = "ox_inventory" -- Options: ESX, qbcore, ox_inventory, quasar

-- Notify config
R.NotificationType = "ox_lib" -- options: ESX, esx_help, ox_lib, okok, qbcore, quasar_notify
R.Progress = "ox_lib_square" -- options: progressBars, ox_lib_square, ox_lib_circle, ESX, qbcore

--target config
R.TargetIcon = "fas fa-box-archive" -- change the target icon
R.TargetDistance = 1.0 -- change the distance from which you can target storage

-- Police notify
R.EnablePoliceNotify = false -- set to true if you want to use police notifys
R.Policenotify = "cd_dispatch" -- options cd_dispatch, ps-dispatch, linden_outlawalert, quasar-dispatch, core-dispatch, op-dispatch

-- textui config
R.TextUI = "ox_lib" -- options: ESX, ox_lib, LUKE, qbcore | ONLY USED if R.interActionType is textui
R.TextUiDistance = 1.5 -- The distance from which you can see the textUI | ONLY USED if R.interActionType is textui

-- minigame config
R.Searchminigame = "ox_lib" -- options: ox_lib, pd-safe, howdy-hackminigame

-- Logs config
R.Enablelogs = true -- set to true if you want to use logs
R.Logtype = "webhook" -- options: webhook or ox_lib

-- search config
R.searchtime = 2000 -- how long it takes to search

-- cooldown config
R.Enablecooldown = true -- set to true if you want to use cooldown
R.Cooldowntime = 20 --in minutes) how long it takes to search again (currently only used with ox_target)
R.Policeneeded = 0 -- Needed police amount to search storage
R.AlertJobs = { -- jobs that are counted in police check and they also get the alerts
    'police',
    'ballas'
}

-- Blips config
R.enableBlips = false -- Should blips be added to the map for all Postions
R.Blip = { -- ONLY USED if R.enableBlips is true
	Sprite  = 478, --https://docs.fivem.net/docs/game-references/blips/#blips
	Display = 4, --https://docs.fivem.net/natives/?_0x9029B2F3DA924928
	Scale   = 0.8, -- Blip size
	Colour  = 31 --https://docs.fivem.net/docs/game-references/blips/#blip-colors
}

R.rewards = { -- chooses one of these items and gives it to the player on a chance
    {item = "water", min = 1, max = 2, chance = 100},
    --{item = "weapon_knife", min = 1, max = 2, chance = 10},
}

R.Postions = {
    vector4(242.4330, 368.8112, 105.7381, 75.3330),
	vector4(244.4446, 364.9872, 105.7381, 250.7205)
}