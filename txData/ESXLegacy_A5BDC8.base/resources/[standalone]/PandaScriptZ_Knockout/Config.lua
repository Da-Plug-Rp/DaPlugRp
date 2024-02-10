Config = {}

Config.Framework = 'NewESX'                           -- 'ESX', 'NewESX'
Config.item = 'syringe'                            -- Which item is needed for usage
Config.interactRange = 2                           -- What is the maximum distance to knockout a person
Config.knockoutTime = 5                            -- How long the player should be knockedout | Time in seconds
Config.AnimsDict = 'melee@small_wpn@streamed_core' -- All anims need to be from the same dict!
Config.Anims = {
    { attacker = 'plyr_stealth_kill', victim = 'victim_stealth_kill' },
}
Config.UseInteractsound = true                                                     -- set to true if using interactsound and want to have a sound playing during knockout
Config.Soundfile = 'heartbeatsound'                                                -- The name of your soundfile inside Interact-Sound
Config.Cooldown = true                                                             -- Should the player get a cooldown on usage
Config.CooldownTime = 1                                                            -- Time until being able to knockout again | Time in minutes
Config.effectAfterKO = true                                                        -- Show visual effect after being Knockedout
Config.effectAfterKOTime = 30                                                      -- Time in seconds

Config.KnockoutOnPunch = true                                                      -- If you want to enable the option that players are being knocked out when they get punched below a certain health threshold
Config.KnockoutOnPunchHealth = 40                                                  -- The health threshold that players get knocked out when they get punched below this threshold (Value between 0 and 100 (0 NOT RECOMMENDED, may cause problems with ambulance job))
Config.KnockoutWeapons = { 'WEAPON_UNARMED', 'WEAPON_KNUCKLE', 'WEAPON_NIGHTSTICK' } -- You can add any weapon hash here that should be able to knock out players.

Config.Messages = {
    ['no_player'] = 'There is no person near you',
    ['used_item'] = 'You used your syringe to knockout a person',
    ['got_ko'] = 'You have been knockedout by another person',
    ['recovered'] = 'You recovered from your knockout',
    -- If cooldown enabled --
    ['on_cooldown'] = 'You need to wait until you can knockout again',
}

-- Just change the below functions to your notification system
-- Current example using standart ESX
function ShowInfoNotification(message)
    ESX.ShowNotification("~y~" .. message)
end

function ShowErrorNotification(message)
    ESX.ShowNotification("~r~" .. message)
end

function ShowSuccessNotification(message)
    ESX.ShowNotification("~g~" .. message)
end

function GetSharedObject()
    if Config.Framework == "ESX" then
        ESX = nil
        Citizen.CreateThread(function()
            while ESX == nil do
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                Citizen.Wait(0)
            end
        end)
    end

    if Config.Framework == "NewESX" then
        ESX = exports['es_extended']:getSharedObject()
    end
    return
end
