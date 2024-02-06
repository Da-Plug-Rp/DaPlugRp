Config = {}
local seconds = 1000

Config.Switch = {
    removecommand = 'r_switch', --command to remove switch from weapon
    swap = {
        dict = 'missmic4',
        anim = 'michael_tux_fidget',
        duration = 5 * seconds,
    }
}

Config.Switches = {
    ['fs_redswitch'] = { limitedUse = { enable = false, count = 1 } },
    
    ['fs_blueswitch'] = { limitedUse = { enable = true, count = 2 } },
 
    ['fs_greenswitch'] = { limitedUse = { enable = true, count = 3 } },
}

Config.Weapons = {
    {
        without_switch = 'WEAPON_COMBATPISTOL',
        with_switch = 'WEAPON_APPISTOL'
    },
    {
        without_switch = 'WEAPON_CARBINERIFLE',
        with_switch = 'WEAPON_SPECIALCARBINE'
    },

}

Config.Progressbar = {
    type = 'progressbar', --'circle' or 'progressbar'
    circle = {
        removeSwitchText = 'Removing Switch',
        addSwitchText = 'Adding Switch',
        position = 'middle', --middle or 'bottom'
    },
    progressBar = {
        removeSwitchText = 'Removing Switch',
        addSwitchText = 'Adding Switch',
    }
}
