Config = {}
local seconds = 1000

--Coming soon in next updates
--Config.Target = true --- only support ox_target

Config.Table = {
    Item = 'wigtable',
    Prop = 'fs_prop_table_queens',
}

Config.Settings = {
    Blip = { enable = true, sprite = 10, color = 5, scale = 1.0 },
    -- ox inventory = 'nui://ox_inventory/web/images/'
    -- qs inverse  = 'nui://qs-inventory/html/images/'
    -- or u can add according to ur inventory icon path
    iconPath = 'nui://ox_inventory/web/images/',
}

Config.Stash = { --currently only support ox_inventory
    slots = 50,
    weight = 50000,
}

Config.Crafting = {
    time = 5 * seconds,
    anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
    circleprogressbar = true,
}


Config.Shop = {
    coords = vector3(382.9349, -1077.1467, 29.4232),
    items = {

        { label = 'Wig Table',    name = 'wigtable',    price = 1000 },
        { label = 'Sew in Kit',   name = 'sewinkit',    price = 5 },
        { label = 'Wig Cap',      name = 'wigcap',      price = 5 },
        { label = 'Hair Bundles', name = 'hairbundles', price = 20 },
    }

}

Config.Selling = {
    phone = 'wigphone', --spawn name of phone item
    items = {
        --['spawnname'] = { label = 'label of item', price = price of item},

        ['fortyinchwig'] = { label = '40 inch Wig', price = 10 },
        ['braidswig'] = { label = 'Braids Wig', price = 10 },
        ['curlywig'] = { label = 'Curly Wig', price = 10 },
        ['bangwig'] = { label = 'Bang Wig', price = 10 },

    }

}

Config.Recipe = {
    {
        reward = { label = '40 inch Wig', name = 'fortyinchwig', count = 20 },
        needed = {
            { label = 'Wig Cap',      name = 'wigcap',      count = 1 },
            { label = 'Sew in Kit',   name = 'sewinkit',    count = 1 },
            { label = 'Hair Bundles', name = 'hairbundles', count = 40 },


        }
    },
    {
        reward = { label = 'Braids Wig', name = 'braidswig', count = 20 },
        needed = {
            { label = 'Wig Cap',      name = 'wigcap',      count = 1 },
            { label = 'Sew in Kit',   name = 'sewinkit',    count = 1 },
            { label = 'Hair Bundles', name = 'hairbundles', count = 30 },

        }
    },
    {
        reward = { label = 'Curly Wig', name = 'curlywig', count = 20 },
        needed = {
            { label = 'Wig Cap',      name = 'wigcap',      count = 1 },
            { label = 'Sew in Kit',   name = 'sewinkit',    count = 1 },
            { label = 'Hair Bundles', name = 'hairbundles', count = 20 },

        }
    },
    {
        reward = { label = 'Bang Wig', name = 'bangwig', count = 20 },
        needed = {
            { label = 'Wig Cap',      name = 'wigcap',      count = 1 },
            { label = 'Sew in Kit',   name = 'sewinkit',    count = 1 },
            { label = 'Hair Bundles', name = 'hairbundles', count = 10 },

        }
    },
}

Config.Business = {
    -- if with job and only job can do stuff
    {
        --make job = false if u want menu can be accessed without any job
        job = 'hairsaloon',
        craft = vector3(373.8807, -1104.8584, 29.5046),
        stash = vector3(370.0128, -1093.7054, 29.4806), --only work with ox inventory currently
        boss = vector3(367.5869, -1097.4948, 29.4786),
        distance = 2.0,                                 --marker/ target inside distance
        blip = { enable = true, title = 'Capy Saloon', sprite = 52, color = 8, scale = 0.7 },

    },

    -- --if without any job /anyone can do
    -- {
    --     craft = vector3(361.0679, -942.2016, 29.4377),
    --     distance = 2.0, --marker/ target inside distance,
    --     blip = { enable = true, title = 'Capy Saloon', sprite = 52, color = 8, scale = 0.7 },

    -- },

}

Config.Boss = function(job)
    TriggerEvent('esx_society:openBossMenu', job, function(menu)
        ESX.CloseContext()
    end, { wash = false })
end


Config.pedlist = {
    'ig_abigail',
    'csb_abigail',
    'u_m_y_abner',
    'a_m_m_afriamer_01',
    'ig_mp_agent14',
    'csb_mp_agent14',
    'csb_agent',
    's_f_y_airhostess_01',
    's_m_y_airworker',
    'u_m_m_aldinapoli',
    'ig_amandatownley',
    'cs_amandatownley',
    's_m_y_ammucity_01',
}

 