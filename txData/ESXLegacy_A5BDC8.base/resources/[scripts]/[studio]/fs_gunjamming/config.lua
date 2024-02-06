Config = {}

Config.Locale = 'en'

Config.Whitelistedjobs = { -- No jamming for this job
     ['police'] = true,
     ['sheriff'] = true,
}
--for weapon hash
--https://gtahash.ru/weapons/?page=2 hash
Config.Weapons = { -- minimum value 0, maximum value 100. more weapons: https://wiki.rage.mp/index.php?title=Weapons
  --  [`WEAPON_PISTOL`]       = {JamChance = 40, UnjamChance = 30},
    ['WEAPON_PISTOL'] = {JamChance = 40, UnjamChance = 100},                --name should be in capital latter 
    ['WEAPON_CARBINERIFLE'] = {JamChance = 30, UnjamChance = 30},    -- name should be in capital latter
    
}
 
Config.strings = {
  [1] = 'Your weapon is jammed',
  [2] = 'Press ~INPUT_CONTEXT~ to do unjamm weapon!',
}
    
    
    function notify(msg,typee)
      ESX.ShowNotification(msg, 5000, typee or 'info')
    end