Config = {}

local seconds = 1000

Config.Drugs = {
    -- { name = 'drugname', quantity = max quantity can sell, price = price of single drug}
    { name = 'water', quantity = math.random(1, 2), price = math.random(10, 100) }, -- for random quantity or price
    { name = 'bread', quantity = 2,                 price = 10 },                   -- for exect quantity or price

}

Config.Dispatch = {
    enable = true,-- if u want to use it then put your export into /shared/utils.lua line 21 --its a client side function
    --any dispach call work only if you configure it 
    notifyOnMakingCall = false, -- this notify when player will choose any option to sell
    --in case of custom edit in client/utils.lua
    jobs = {
        ['police'] = true,
        ['sheriff'] = true,
        ['statepolice'] = true,

    }
}

Config.TrapPhone = {
    itemname = 'fs_trapphone',
    removeOnUse = false,
}

--limit number of drugs turn can make with clients on each restart 
Config.LimitedCalls = {
    enable = false,          --enable to disable this feature
    limit = 50,     --player can only sell drugs on this limit on each restart it will be reset automatically
    command = 'checklimit', --command to check how many calls you made out of total limit
}

Config.Account = 'money' -- money,bank,black_money


--can ped reject
Config.Reject = {
    enable = true,
    perentage = 25,
    notifyOnReject = true, -- if your want to enable it please configure dispach function first put your export into /shared/utils.lua line 21 --its a client side function
}

-- if job needed to sell --
-- ['jobname'] = required job persons
-- ['police'] = 2
Config.jobsNeeded = {
    enable = false,
    jobs = {
        --this example shows script either needed 2 poilice active or 4 state police active
        ['police'] = 2,
        ['statepolice'] = 4,

    }
}

Config.SellingArea = {
    --center location coordinates to allow drug sell
    enable = false, -- false = can sell ever where , true = can sell only inside zone
    center = vector3(263.0207, -1430.7174, 29.3564),
    radius = 1000,


}

Config.buyer = {
    walkspeed = 1.2,         -- walk speed of buyers
    nextped = 1 * seconds,  --after how many seconds player will recieve next call from clients
    sendtext = 3 * seconds, -- how many seconds player will be in text animations
    makecall = 5 * seconds, -- how many seconds player will be in call animations
    cooldown = 10 * seconds, -- if player didnot respawn to ped in betweeen cooldown then ped will be removed automatic to match either player is afk
}


Config.seller = {
    cangofar = 10, -- player can go far from destination coordinates untill ped is coming if player go far from this buyer will be deleted automatically   
}

--write peds here mainly its for anticheat whitelist
Config.PedList = {
    'ig_abigail',
    'csb_abigail',
    'u_m_y_abner',
    'a_m_m_afriamer_01',
    'ig_mp_agent14',
    'csb_mp_agent14',
    'csb_agent',

}

--ped spawn offsets
Config.Offsets = {
    [1] = { x = 0.0, y = 15.0 },
    [2] = { x = 0.0, y = -15.0 },
    [3] = { x = 15.0, y = 0.0 },
    [4] = { x = -15.0, y = 0.0 },
    [5] = { x = 15.0, y = 15.0 },
    [6] = { x = -15.0, y = 15.0 },
    [7] = { x = 15.0, y = -15.0 },
    [8] = { x = -15.0, y = -15.0 },
    [9] = { x = 0.0, y = 25.0 },
    [10] = { x = 0.0, y = -25.0 },
    [11] = { x = 25.0, y = 0.0 },
    [12] = { x = -25.0, y = 0.0 },
    [13] = { x = 25.0, y = 25.0 },
    [14] = { x = -25.0, y = 25.0 },
    [15] = { x = 25.0, y = -25.0 },
    [16] = { x = -25.0, y = -25.0 },
    [17] = { x = 0.0, y = 20.0 },
    [18] = { x = 0.0, y = -20.0 },
    [19] = { x = 20.0, y = 0.0 },
    [20] = { x = -20.0, y = 0.0 },
    [21] = { x = 20.0, y = 20.0 },
    [22] = { x = -20.0, y = 20.0 },
    [23] = { x = 20.0, y = -20.0 },
    [24] = { x = -20.0, y = -20.0 }
}


-- for developers only!!!

--Progressbars confiurations

Config.SendBuyerTextProgressBar = {
    --for duration go on uper Config.buyer then sendtext
    Type = 'circle', --'circle' or 'progressBar' select setting bellow according to type


    circle = {
        position = 'bottom',    -- 'middle' , 'bottom'
        anim = {
            dict = 'cellphone@',
            clip = 'cellphone_text_read_base',
        },
        prop = {
            bone = 28422,
            model = `prop_npc_phone_02`,
            pos = vec3(0.0, 0.0, 0.0),
            rot = vec3(0.0, 0.0, 0.0)
        }
    },


    progressBar = {
        anim = {
            dict = 'cellphone@',
            clip = 'cellphone_text_read_base',
        },
        prop = {
            bone = 28422,
            model = `prop_npc_phone_02`,
            pos = vec3(0.0, 0.0, 0.0),
            rot = vec3(0.0, 0.0, 0.0)
        }
    }
}

Config.BuyerCallClientProgressBar = {
    Type = 'circle', --'circle' or 'progressBar' select setting bellow according to type


    circle = {
        position = 'bottom',-- 'middle' , 'bottom'
        anim = {
            dict = 'cellphone@',
            clip = 'cellphone_call_listen_base',
        },
        prop = {
            bone = 28422,
            model = `prop_npc_phone_02`,
            pos = vec3(0.0, 0.0, 0.0),
            rot = vec3(0.0, 0.0, 0.0)
        }
    },


    progressBar = {
        anim = {
            dict = 'cellphone@',
            clip = 'cellphone_call_listen_base',
        },
        prop = {
            bone = 28422,
            model = `prop_npc_phone_02`,
            pos = vec3(0.0, 0.0, 0.0),
            rot = vec3(0.0, 0.0, 0.0)
        }
    }
}


Config.argueAnim = {
    enable = true,  --argue anim before selling anims
    argueTime = 6 * seconds, --time for argue anim

}