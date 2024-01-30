-- Version: 2.0
Config = {}

-- === GENERAL ===
Config.PauseMenu           = false
Config.MoneyCurrency       = '$'
Config.CreateAnnouncement  = 'create-announcement' -- command name (to use this you need to have the 'command.commandName' ACL object allowed to one of yours identifiers)
Config.HideHudCommand      = 'hud-hide' -- command name
Config.SettingsCommand     = 'hud-settings' -- command name
Config.TimeZonesDifference = 1 -- in hours, add or remove hours to the UTC time
Config.BdamageOnlyHurted   = true -- if true, the body damage will only be displayed when the player is hurted

-- === HUD CUSTOMIZATION ===
Config.ServerDisplayText   = 'DaPlugRoleplay' -- text to display on the left of the server image
Config.LogoImgName         = 'logo.png' -- make sure to add the image in ./html/img
Config.LastValueIcon       = 'fa-brain'
                           -- ESX: money, bank | QBCore: cash, bank
Config.MoneyType           = 'bank'
Config.MoneyIcon           = 'fa-building-columns'
Config.ShowSecondMoneyType = true -- if true, the second money type will be displayed
Config.SecondMoneyType     = 'money'
Config.SecondMoneyIcon     = 'fa-money-bill'
Config.ShowJob             = true -- if true, the job will be displayed

-- === RADIO ===
Config.RadioUsing         = 'pma-voice' -- name of the voip using: mumble-voip, pma-voice, tokovoip_script 

-- === KEY MENU ===
Config.OpenKeyMenu           = "L"
Config.OpenKeyMenuCommand    = "key"
Config.KeyMappingDescription = "Menu to see the server keys"
Config.KeyMenu = {
    ['T']  = 'Talk',
    ['M']  = 'Telephone',
    ['K']  = 'Carplay',
    ['F']  = 'Inventory',
    ['U']  = 'Radio',
    ['-']  = 'Radial menu',
    ['F2'] = 'License menu',
    ['F3'] = 'Police menu'
} -- Max recommended keys to add is 10

-- === STRESS ===
Config.Stress             = false
Config.NoStressJobs       = {
    ['ambulance'] = true
}
Config.StressOnVehicle    = true
Config.StressSpeed        = 100 -- km speed to increase the stress when driving
Config.TimeIncreaseDriving  = 2000 -- time to wait after the stress increase when driving
Config.TimeIncreaseShooting = 2000 -- time to wait after the stress increase when driving
Config.IncreaseChance     = 0.2 -- 0.2 = 20% chance to increase the stress every shot or drive
Config.IncreaseMinValue   = 1 -- min value to increase the stress, random value between this value and max value
Config.IncreaseMaxValue   = 3 -- max value to increase the stress, random value between this value and min value
Config.DecreaseMinValue   = 1 -- max value to decrease the stress, random value between this value and max value
Config.DecreaseMaxValue   = 3 -- max value to decrease the stress, random value between this value and min value
Config.DecreaseStressTime = 10000 -- in ms, every tick will decrease the stress by random value between 1 and 3 
Config.ItemsToDecrease    = {
    ['coffee'] = 10,
    ['water'] = 5
}

-- === SETTINGS ===
Config.DefaultSettings = {
    alwaysOnMap = true,
    timeAboveMap = true,
    streetAboveMap = false,
    showBodyHealth = true,
    showRadioPlayers = true,
    showMoney = false,   
    showStreet = false,
    showCompass = true,
    showLogoLink = true,
    mainColor = '#0099e1',
}

-- === PAUSE MENU ===
-- you can edit the title (text to display on the cards), hide-ui (hide the ui when the card is selected), and function (function to call when the card is selected)
Config.PauseMenuActions = {
    [1] = {
        ['title'] = "MAP",
        ['hide-ui'] = true,
        ['function'] = function()
            ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0, -1)
            Wait(100)
            PauseMenuceptionGoDeeper(0)
            while true do
                Citizen.Wait(1)
                if IsControlJustPressed(0, 200) then
                    SetFrontendActive(0)
                    break
                end
            end
        end
    },
    [2] = {
        ['title'] = "INVENTORY",
        ['hide-ui'] = false,
        ['function'] = function()
            ExecuteCommand('inventory') -- change this based on your inventory script
        end
    },
    [3] = {
        ['title'] = "HUD SETTINGS",
        ['hide-ui'] = true,
        ['function'] = function()
            exports['complete_hud']:openHudSettings()
        end
    },
    [4] = {
        ['title'] = "EMOTES",
        ['hide-ui'] = true,
        ['function'] = function()
            ExecuteCommand('emotes') -- change this based on your emotes script
        end
    },
    [5] = {
        ['title'] = "SETTINGS",
        ['hide-ui'] = true,
        ['function'] = function()
            -- open settings menu
            ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1)
            Wait(100)
            PauseMenuceptionGoDeeper(6)
            while true do
                Citizen.Wait(1)
                if IsControlJustPressed(0, 200) then
                    SetFrontendActive(0)
                    break
                end
            end
        end
    }
}

-- you can edit the title (text to display on the cards), icon (font awesome icon), and function (function to call when the card is selected)
Config.PauseData = {
    [1] = {
        ['title'] = "BANK",
        ['icon'] = 'fa-building-columns',
        ['function'] = function()
            -- ESX
            local xPlayer = ESX.GetPlayerData()
            local money = xPlayer.accounts
            if money then                
                for k,v in pairs(money) do
                    if v.name == "bank" then
                        return '$' .. v.money
                    end
                end
            end
            return Config.MoneyCurrency .. "0"

            -- QBCore
            /* 
            local xPlayer = QBCore.Functions.GetPlayerData()
            local money = xPlayer.money["bank"] and Config.MoneyCurrency .. tostring(xPlayer.money["bank"]) or Config.MoneyCurrency .. "0"
            return money
            */
         end
     },
    [2] = {
        ['title'] = "JOB",
        ['icon'] = 'fa-cog',
        ['function'] = function()
            -- ESX
            local xPlayer = ESX.GetPlayerData()

            -- QBCore
            --local xPlayer = QBCore.Functions.GetPlayerData()
            
            local job = xPlayer.job and xPlayer.job.label or 'Unemployed'
            return job
        end
    },
    [3] = {
        ['title'] = "ID",
        ['icon'] = 'fa-id-card',
        ['function'] = function()
            -- ESX
            local xPlayer = ESX.GetPlayerData()
            local id = xPlayer.identifier and xPlayer.identifier or '???'

            -- QBCore
            /*
            local xPlayer = QBCore.Functions.GetPlayerData()
            local id = xPlayer.cid and xPlayer.cid or '???'
            */

            return id
        end
    },
    [4] = {
        ['title'] = "BIRTHDAY",
        ['icon'] = 'fa-cake-candles',
        ['function'] = function()
            -- ESX
            local xPlayer = ESX.GetPlayerData()
            local birthday = xPlayer.dateofbirth and xPlayer.dateofbirth or '???'

            -- QBCore
            /*
            local xPlayer = QBCore.Functions.GetPlayerData()
            local birthday = xPlayer.charinfo.birthdate and xPlayer.charinfo.birthdate or '???'
            */
            
            return birthday
        end
    },
    [5] = {
        ['title'] = "GENDER",
        ['icon'] = 'fa-user',
        ['function'] = function()
            -- ESX
            local xPlayer = ESX.GetPlayerData()
            local gender = xPlayer.sex and xPlayer.sex or 'Unidentified'

            -- QBCore
            /*
            local xPlayer = QBCore.Functions.GetPlayerData()
            local gender = xPlayer.charinfo.gender and xPlayer.charinfo.gender or 'Unidentified'
            */

            return gender
        end
    },
    [6] = {
        ['title'] = "CASH",
        ['icon'] = 'fa-money-bill',
        ['function'] = function()
            -- ESX
            local xPlayer = ESX.GetPlayerData()
            local money = xPlayer.accounts
            if money then                
                for k,v in pairs(money) do
                    if v.name == 'money' then
                        return Config.MoneyCurrency .. v.money
                    end
                end
            end
            return Config.MoneyCurrency .. "0"

            -- QBCore
            /*
            local xPlayer = QBCore.Functions.GetPlayerData()
            local money = xPlayer.money["cash"] and Config.MoneyCurrency .. tostring(xPlayer.money["cash"]) or Config.MoneyCurrency .. 0
            return money
            */
        end
    }
}

-- === GET VALUES FOR STATUS CIRCLES ===
Config.GetLastValue = function(cb)
    local last_value = 0

    -- ESX
    TriggerEvent("esx_status:getStatus", "stress", function(stress)
        cb(stress.val)
    end)

    -- QBCore
    /*
    local Player = QBCore.Functions.GetPlayerData()
    if not Player.metadata then cb(0) end
    
    cb(Player.metadata['stress'])
    */
end

-- === NOTIFY ===
Config.Notify = function(text, type)
    -- ESX
    ESX.ShowNotification(text, type, 3000)

    -- QBCore
    -- QBCore.Functions.Notify(text, type, 3000)
end

Config.Locales = {
    ['stress_increase'] = "Your stress increased",
    ['stress_decrease'] = "Your stress decreased",
    ['initialized'] = "The HUD has been initialized"
}

-- === FIRST VALUE IS HASH, THE SECOND ONE IS THE NAME OF THE IMAGE ===
Config.Weapon_names = {
    [453432689] = 'WEAPON_PISTOL.png',
    [1593441988] = 'WEAPON_COMBATPISTOL.png',
    [584646201] = 'WEAPON_APPISTOL.png',
    [2578377531] = 'WEAPON_PISTOL50.png',
    [324215364] = 'WEAPON_MICROSMG.png',
    [736523883] = 'WEAPON_SMG.png',
    [4024951519] = 'WEAPON_ASSAULTSMG.png',
    [3220176749] = 'WEAPON_ASSAULTRIFLE.png',
    [2210333304] = 'WEAPON_CARBINERIFLE.png',
    [2937143193] = 'WEAPON_ADVANCEDRIFLE.png',
    [2634544996] = 'WEAPON_MG.png',
    [2144741730] = 'WEAPON_COMBATMG.png',
    [487013001] = 'WEAPON_PUMPSHOTGUN.png',
    [2017895192] = 'WEAPON_SAWNOFFSHOTGUN.png',
    [3800352039] = 'WEAPON_ASSAULTSHOTGUN.png',
    [2640438543] = 'WEAPON_BULLPUPSHOTGUN.png',
    [911657153] = 'WEAPON_STUNGUN.png',
    [100416529] = 'WEAPON_SNIPERRIFLE.png',
    [205991906] = 'WEAPON_HEAVYSNIPER.png',
    [856002082] = 'WEAPON_REMOTESNIPER.png',
    [2726580491] = 'WEAPON_GRENADELAUNCHER.png',
    [1305664598] = 'WEAPON_GRENADELAUNCHER_SMOKE.png',
    [2982836145] = 'WEAPON_RPG.png',
    [375527679] = 'WEAPON_PASSENGER_ROCKET.png',
    [324506233] = 'WEAPON_AIRSTRIKE_ROCKET.png',
    [1752584910] = 'WEAPON_STINGER.png',
    [1119849093] = 'WEAPON_MINIGUN.png',
    [2481070269] = 'WEAPON_GRENADE.png',
    [741814745] = 'WEAPON_STICKYBOMB.png',
    [4256991824] = 'WEAPON_SMOKEGRENADE.png',
    [2694266206] = 'WEAPON_BZGAS.png',
    [615608432] = 'WEAPON_MOLOTOV.png',
    [101631238] = 'WEAPON_FIREEXTINGUISHER.png',
    [883325847] = 'WEAPON_PETROLCAN.png',
    [4256881901] = 'WEAPON_DIGISCANNER.png',
    [2294779575] = 'WEAPON_BRIEFCASE.png',
    [28811031] = 'WEAPON_BRIEFCASE_02.png',
    [600439132] = 'WEAPON_BALL.png',
    [1233104067] = 'WEAPON_FLARE.png',
    [3218215474] = 'WEAPON_SNSPISTOL.png',
    [4192643659] = 'WEAPON_BOTTLE.png',
    [1627465347] = 'WEAPON_GUSENBERG.png',
    [3231910285] = 'WEAPON_SPECIALCARBINE.png',
    [3523564046] = 'WEAPON_HEAVYPISTOL.png',
    [2132975508] = 'WEAPON_BULLPUPRIFLE.png',
    [2460120199] = 'WEAPON_DAGGER.png',
    [137902532] = 'WEAPON_VINTAGEPISTOL.png',
    [2138347493] = 'WEAPON_FIREWORK.png',
    [-1466123874] = 'WEAPON_MUSKET.png',
    [984333226] = 'WEAPON_HEAVYSHOTGUN.png',
    [3342088282] = 'WEAPON_MARKSMANRIFLE.png',
    [1672152130] = 'WEAPON_HOMINGLAUNCHER.png',
    [2874559379] = 'WEAPON_PROXMINE.png',
    [126349499] = 'WEAPON_SNOWBALL.png',
    [1198879012] = 'WEAPON_FLAREGUN.png',
    [3794977420] = 'WEAPON_GARBAGEBAG.png',
    [3494679629] = 'WEAPON_HANDCUFFS.png',
    [171789620] = 'WEAPON_COMBATPDW.png',
    [3696079510] = 'WEAPON_MARKSMANPISTOL.png',
    [3638508604] = 'WEAPON_KNUCKLE.png',
    [4191993645] = 'WEAPON_HATCHET.png',
    [1834241177] = 'WEAPON_RAILGUN.png',
    [3713923289] = 'WEAPON_MACHETE.png',
    [3675956304] = 'WEAPON_MACHINEPISTOL.png',
    [738733437] = 'WEAPON_AIR_DEFENCE_GUN.png',
    [3756226112] = 'WEAPON_SWITCHBLADE.png',
    [3249783761] = 'WEAPON_REVOLVER.png',
    [4019527611] = 'WEAPON_DBSHOTGUN.png',
    [1649403952] = 'WEAPON_COMPACTRIFLE.png',
    [317205821] = 'WEAPON_AUTOSHOTGUN.png',
    [125959754] = 'WEAPON_COMPACTLAUNCHER.png',
    [3173288789] = 'WEAPON_MINISMG.png',
    [3125143736] = 'WEAPON_PIPEBOMB.png',
    [2484171525] = 'WEAPON_POOLCUE.png',
    [419712736] = 'WEAPON_WRENCH.png'
}