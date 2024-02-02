Config = {}
Config.Locale  = 'en'
Config.ReqireHuntingJob = false
Config.HuntingWeapon = "WEAPON_MARKSMANRIFLE"
Config.SpawnJobVehicle = false
Config.JobVehicle = "blazer"
Config.UseOldESX = false
Config.Animals = {
    [1] = {
        ['model'] = "a_c_boar",
        ['probability'] = 0.1, --  = 10%
        ['loot'] = {
            boar_meat=5,  -- maximum item number
            leather=2, -- maximum item number
        }
    },
    [2] = {
        ['model'] = "a_c_deer",
        ['probability'] = 0.3, --  = 30%
        ['loot'] = {
            deer_meat=5,  -- maximum item number
            leather=2, -- maximum item number
            Suede=5,
        }
    },
    [3] = {
        ['model'] = "a_c_coyote",
        ['probability'] = 0.3, --  = 30%
        ['loot'] = {
            coyote_meat=5,  -- maximum item number
            leather=2, -- maximum item number
            fur=4,
            cotton=3,
        }
    },
  [4] = {
        ['model'] = "a_c_husky",
        ['probability'] = 0.3, --  = 30%
        ['loot'] = {
            leather=2, -- maximum item number
            fur=3,
            wool=4,
        }
    },
   [5] = {
    ['model'] = "a_c_pig",
    ['probability'] = 0.3, --  = 30%
    ['loot'] = {
        pig_meat=5,  -- maximum item number
        leather=2, -- maximum item number
    }
   },
   [6] = {
    ['model'] = "a_c_rabbit_01",
    ['probability'] = 0.3, --  = 30%
    ['loot'] = {
        rabbit_meat=1,  -- maximum item number
        leather=3, -- maximum item number
        wool=2,
    }
   },
}
Config.HuntingAreaRanges = {
    [1] = {
        ["coord"]= vector3(-398.1493, 4332.1035, 56.6588),
        ["radius"] = 100.0
    }
}
Config.Mensions = {
    StartHunting = {
        vector3(-388.4253, 4341.0488, 56.1573),
    },
    Sell = {
        vector3(-674.1743, 5838.9219, 17.3314),
    }
}

Config.Notification = {}
Config.Notification.System = 'lp_notify' -- none / lp_notify -- not finished implemented jet
Config.Notification.displaytime = 1300 --ms
Config.Notification.Postion = "top right" -- Only works lp_notify! | lp_"top right", [top Left, top Right, bottom Left, bottom Right}


--[[
    If no animals spawning try to restart your server sometimes there to mutch Entities on it.
]]