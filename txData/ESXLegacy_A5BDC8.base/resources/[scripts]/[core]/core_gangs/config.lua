Config = {
    ------------------------
    -- FRAMEWORK SETTINGS --
    ------------------------

    -- Framework use
    -- you can choose between :
    -- 'qb-core'
    -- 'esx'
    Framework = 'esx',

    -- Framework resource name is the name of the resource folder
    -- by default it's :
    -- 'qb-core' for qb-core framework
    -- 'es_extended' for esx framework
    FrameworkResource = 'es_extended',

    ------------------------
    ------- ESX ONLY -------
    ------------------------
    -- Framework version (ESX ONLY)
    -- if you use lower than 1.8 
    -- OR use ESX with getSharedObject event, set it to false
    NewFrameworkVersion = true,

    -- Framework event (ESX ONLY)
    -- to retrieve esx framework (on old version)
    SharedObject = 'esx:getSharedObject',

    -------------------------
    ------ QBCORE ONLY ------
    -------------------------
    AutoCreateQBSharedGang = false, -- Set to true if you want that the script auto create the gang that are in QBCore/shared/gang.lua file into his database
    AutoAssignPlayerToQBSharedGang = false, -- Set to true if you want people to be assign to the gang there are linked to after they create their criminal profiles (only the first time they create their criminal profile when oppening the UI)

    ------------------------
    -- INVENTORY SETTINGS --
    ------------------------    
    -- You can choose between :
    -- 'qb-inventory' (If you use lj-inventory / ps-inventory or any fork of qb-inventory set 'qb-inventory' here and the name of the resource folder of your inventory in QBInventoryResourceName)
    -- 'core_inventory' : https://www.c8re.store/
    -- 'ox_inventory' : https://github.com/overextended/ox_inventory
    -- 'qs-inventory' (version higher or equal to 2.2.8) : https://buy.quasar-store.com/
    -- 'custom' : go to functions_override.lua to implement your own function to be comaptible with your inventory
    UseInventory = 'ox_inventory',

    ------------------------
    -- QB-INVENTORY ONLY ---
    ------------------------
    -- Here you can set the resource folder name (if you use lj-inventory / ps-inventory or any other qb-inventory fork inventory)
    QBInventoryResourceName = 'qb-inventory',

    ------------------------
    ---- BASIC SETTINGS ----
    ------------------------
    -- UI
    OpenKey = 'F9', -- Key for opening the menu

    TransfertOwnershipWhenOwnerLeave = true, -- Transfert the ownership of the organization to the most "stats" player from the org (all the stats added up)
    RemoveOrganizationWhenEveryMembersLeaveIt = true, -- Will remove the organization from database and set neutral all the zone when all the members of an organization lease it 

    -----------------------------------
    ----- ZONE PROTECTION LEVELS ------
    -----------------------------------
    DefaultProtectionValue = 3, -- Default protection value for default zones (zones that are not in database)
    ProtectionValuePrice = 100, -- This price will be multiplied by protection value to get the price for protection level
    MaxProtectionLevel = 5, -- Maximum protection level that can be set on zone

    ------------------------
    ---- NPCS SETTINGS -----
    ------------------------
    DefaultNPCValue = 0, -- Default number of npcs that will spawn to protect the zone (Performance Heavy if set to high)
    NPCValuePrice = 100, -- Default price for one more npc that will spawn to protect the zone
    MaxNPCValue = 5, -- Maximum number of npcs that can be spawned to protect the zone
    NPCSpawnWithWeaponInHand = true, -- Weapon of the npc is display in his hand when he wnader in area
    NPCAttackOnlyWhenWarOnNPCZone = true, -- Npc only attack if a war is start in the zone, else, won't attack anymore (even if you are another organization / player without organization)
    NPCAttackOtherDefaultGroup = true, -- Allow NPC to attack other NPC group like VAGOS / LOST / F4L / COP
    NPCRevertAfterCapture = true, -- Will revert npc value to default after zone is captured, existing npc will stop attacking and will be release / surrender
    NPCStopAttackingOnWarEnd = true, -- NPC will stop attacking on war end (even if enemy take or don't take the zone)
    NPCModels = {"g_m_m_chicold_01", "csb_brucie2", "g_m_y_korean_02", "csb_vincent"}, -- Setup the npc model name (Can be retrieve here : https://docs.fivem.net/docs/game-references/ped-models/)
    NPCWeapons = {"weapon_pistol", "weapon_microsmg", "weapon_pumpshotgun"}, -- Weapon that can be add to Npc spawn to defend the zone.

    -------------------------
    ---- BOUNTY SETTINGS ----
    -------------------------
    IsBountyCK = false,            -- !!WARNING!! Do completed bounties count as Character Kill (automatically deletes character, check functions_override.lua to implement inventory and others information removal)
    IsBountyStatWipe = true,       -- !!WARNING!! Completed bounties will wipe criminals role stats (will revert to base role ex. Pickpocket)
    IsBountyInventoryWipe = false, -- !!WARNING!! Completed bounties will wipe the criminals inventory that just been killed. Go to functions_override.lua to implement ClearPlayerInventory function (Not core_inventory users).
    MinimalBounty = 200,           -- Minimal bounty that can be set on player

    ---------------------------
    ---- ZONE WAR SETTINGS ----
    ---------------------------
    DisplayWarWall = true, -- When a war is start, wall are display in game so you can see which zone is currently in war
    DisplayWallWarForEveryone = false, -- true : only player with criminals profil will see it, false : every player, even player without criminals profile will see the wall

    BaseZoneWarTime = 10, -- Time in minutes after which zone will be captured

    MinimumOnline = 2, -- Amount of players that need to be online to start zone war for an owned zone by another organization, set to false if you want to be able to start war without player organization check

    OwnedZoneAdvantage = 500, -- Amount of points zone's owner organization gets when a war is start in his zone
    WarScoreIncrease = 5, -- Amount of points added every second from each player to your organizations score in battle

    OrganizationCooldown = 5, -- Time in minutes after which player can start another zone war
    ZoneCooldown = 10, -- Time in minutes after which all players can start another war in the same zone

    CurrencyAward = 200, -- Amount of special currency awarded to each criminal when the organization win the war
    Rewards = {          -- Reward send to player when they win the war. Can be fixed amount or random amount ({0,5} will be a random from 0 no obejct to 5 object) 
    --     ['bandage'] = 2,
        -- ['bandage'] = {0, 3} -- Random reward from 0 to max 3
    },

    ---------------------------
    -- ORGANIZATION SETTINGS --
    ---------------------------
    CanCreateOrganizations = true, -- Allow player to create organizaiton from UI (if false, you will need to use the command to create it)
    OrganizationCreationPrice = 500, -- Price for creating organization
    BlacklistedJob = { -- job that are not allow to open the UI of the script (keybind / command won't open the UI)
         ['police'] = true,
         ['sheriff'] = true,
         ['gouvernment'] = true,
         ['ambulance'] = true,
    },

    -- SPECIAL CURRENCY (Inventory Item)
    -- Dont forget to add this item to your inventory items.lua in qb-core
    CurrencyName = 'bitcoin', -- Name of special currency

    -- MULTIPLIER ZONE DRAW SHAPE
    -- The shape will be drawn around the important zones
    CubeShape = false, -- Cube shape
    CircleShape = false, -- Circle shape
    DiamondShape = true, -- Diamond shape

    -------------------------
    -- ZONES CONFIGURATION --
    -------------------------
    -- !!!IMPORTANT!!!! FIND ZONE BY TYPING /CURRENTZONE
    -- You can create any zone you want.
    -- Go in game, find the place where you want to set the zone
    -- Type /currentzone and open you F8 console, the number display is the zone number
    -- Then add the title, image, storage and all other parameters like in hte example provide with the script bellow
    -- Value zones are special areas that can be captured by organizations
    -- These zones provide value for organization in various ways
    -- ValueTypes: processing, sales, storage, generation
    Zones = {
        -- Key of the table is return by the command /currentzone in game
        -- /!\ Make sure every time you change the coords you check the zone with /currentzone command and update the table key if needed to change the location on the map too /!\
        -- If you only change the coords without the zone number you can probably have a zone and coords that doesn't match on the map
        [6740] = {
            Title = 'WEED HARVEST',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {'Produces weed every minute',
                           'Contains a storage box for produced items. Retrieve the product in the storage directly'},
            Type = 'generation', -- can be processing, sales, storage, generation
            Storages = { -- storage unit to handle items, can be multiple
                ['generation-storage01'] = { -- name of the storage, need to be unique accros ALL THE ZONE and HOUSE ZONE, don't forget to change it on your new zone
                    InventoryType = 'stash',
                    Coords = vector3(-1148.1483, -1451.2344, 4.5341 - 0.98),
                    Prop = 'prop_weed_tub_01', -- props model that will handle target to open storage  
                    Rotation = 33.3160,
                    slot = 50, -- qb-inventory integration
                    maxWeight = 2500000 -- qb-inventory integration
                },
            },
            NPCs = {
                ['mp_m_weed_01'] = {
                    Coords = vector3(-1147.5875, -1452.1172, 4.5992 - 0.98),
                    Rotation = 30.7270,
                    animDict = 'amb@lo_res_idles@',
                    animName = 'world_human_lean_male_foot_up_lo_res_base'
                },
            },

            -- Generation parameters
            GenerationItems = { -- List of item Generate in the storage (can one or inifinite)
                {
                    itemName = 'weed_skunk', -- item name that will be placed in the storage x time set
                    itemAmount = 1           -- amount of item placed in the storage x time set
                },
                {
                    itemName = 'weed_purplehaze', -- item name that will be placed in the storage x time set
                    itemAmount = 1                 -- amount of item placed in the storage x time set
                },
            },
            Time = 60000, -- Time in miliseconds after which item will be generated

            -- Set specific NPC model that will spawn for this zone when protection will be increase
            NPCModels = { 'mp_f_weed_01', 'mp_m_weed_01', 'g_m_y_mexgoon_01', ',g_m_y_famfor_01', 'g_f_importexport_01', 'a_f_y_hippie_01'},
            -- Set specific NPC weapon that will give to npc to the npc for this zone when protection will be increase
            NPCWeapons = { 'weapon_pistol', 'weapon_microsmg' }
        },

        -- key return by the command /currentzone 
        -- /!\ Make sure every time you change the coords you check the zone with /currentzone command and update the table key if needed to change the location on the map too /!\
        [5725] = {
            Title = 'COCAINE PROCESSING',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {
                'Process poppyplant to cocaine',
                'Put coca leaf or coke baggy into the storage to get coke baggy or coke small brick every minute'
            },

            Type = 'processing', --  processing, sales, storage, generation

            Storages = { -- storage unit to handle items, can be multiple
                ['processing-storage01'] = { -- name of the storage, need to be unique accros ALL THE ZONE and HOUSE ZONE, don't forget to change it on your new zone
                    InventoryType = 'stash',
                    Coords = vector3(220.7706, 112.2215, 93.4747 - 0.98),
                    Prop = 'prop_weed_tub_01', -- props model that will handle target to open storage  
                    Rotation = 248.1330,
                    slot = 50, -- qb-inventory integration
                    maxWeight = 2500000 -- qb-inventory integration
                },
            },

            NPCs = {
                ['mp_f_meth_01'] = {
                    Coords = vector3(220.2882, 110.9013, 93.4876 - 0.98),
                    Rotation = 248.9632,
                    animDict = 'amb@world_human_leaning@female@coffee@idle_a',
                    animName = 'idle_a'
                },
                ['mp_m_meth_01'] = {
                    Coords = vector3(221.3894, 113.6315, 93.4591 - 0.98),
                    Rotation = 239.3278,
                    animDict = 'amb@world_human_leaning@female@coffee@idle_a',
                    animName = 'idle_a'
                },
            },
            -- Processing parameters
            ProcessingItems = {
                {
                    ProcessingFromItem = 'coca_leaf', -- item required in the storage that will be transform
                    ProcessingFromItemAmount = 10,    -- amount item required that will be transform
                    ProcessingToItem = 'cokebaggy',   -- item that will be add in exchange of the item required 
                    ProcessingToItemAmount = 1        -- amount of item that will be add in the storage when transform
                },
                {
                    ProcessingFromItem = 'cokebaggy',       -- item required in the storage that will be transform
                    ProcessingFromItemAmount = 10,          -- amount item required that will be transform
                    ProcessingToItem = 'coke_small_brick',  -- item that will be add in exchange of the item required 
                    ProcessingToItemAmount = 1              -- amount of item that will be add in the storage when transform
                },
            },
            Time = 60000, -- Time in miliseconds after which item will be processed
        },

        -- key return by the command /currentzone
        -- /!\ Make sure every time you change the coords you check the zone with /currentzone command and update the table key if needed to change the location on the map too /!\
        [3687] = {
            Title = 'COCAINE SALES',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {
                'Sell cocaine every minute',
                'Put bag or brick of cocaine into the storage to get currency in exchange every minute'
            },

            Type = 'sales', -- processing, sales, storage, generation

            Storages = {
                ['sales-storage01'] = {
                    InventoryType = 'stash',
                    Coords = vector3(1997.4465, 3039.4001, 47.0267- (2 * 0.98)),
                    Rotation = 287.7923,        
                    Npc = 's_m_y_dealer_01',    -- NPC model that will handle target to open storage                                   
                    animDict = 'amb@code_human_in_bus_passenger_idles@male@sit@base',
                    animName = 'base',
                    slot = 50, -- qb-inventory integration
                    maxWeight = 2500000 -- qb-inventory integration
                },
            },

            NPCs = {                
            },

            SalesItems = {
                {
                    SaleItem = 'cokebaggy',     -- Item required in the storage that will be sell
                    SaleAmount = 10,            -- Amount required in the storage that will be sell
                    SalePriceForAmount = 100    -- Amount of currency put in exchange in the storage when the amount of items will be sell
                },
                {
                    SaleItem = 'coke_small_brick',  -- Item required in the storage that will be sell
                    SaleAmount = 1,                 -- Amount required in the storage that will be sell
                    SalePriceForAmount = 100        -- Amount of currency put in exchange in the storage when the amount of items will be sell
                },
            },

            Time = 60000, -- Time in miliseconds after which item will be sold
        },
    },

    HouseZoneCapture = true, -- false : unable to get house zone (center), need ot be set via setzone command, true : enable start war on house zone
    HouseZones = {
        -- key return by the command /currentzone 
        [7067] = {
            Title = 'BALLAS GANG HOUSE',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {
                'Gang house with storage', 
                'Provide a secure storage for your gang'
            },
            Type = 'house',
            Storages = {
                ['house-storage01'] = {
                    InventoryType = 'stash',
                    Coords = vector3(115.5899, -1952.1893, 20.7513 - 0.98),
                    Prop = 'prop_weed_tub_01',
                    Rotation = 49.1725,
                    slot = 50,              -- qb-inventory integration
                    maxWeight = 2500000     -- qb-inventory integration
                }
            },
            -- Set specific NPC model that will spawn for this zone when protection will be increase
            NPCModels = { 'csb_ballasog', 'g_f_y_ballas_01', 'g_m_y_ballasout_01', ',ig_ballasog', 'g_m_y_ballaeast_01', 'g_m_y_ballaorig_01', 'g_m_y_ballasout_01' },
            -- Set specific NPC weapon that will give to npc to the npc for this zone when protection will be increase
            NPCWeapons = { 'weapon_pistol', 'weapon_microsmg', 'weapon_crowbar' }             
        },
        [6828] = {
            Title = 'F4L GANG HOUSE',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {
                'Gang house with storage', 
                'Provide a secure storage for your gang'
            },
            Type = 'house',
            Storages = {
                ['house-storage02'] = {
                    InventoryType = 'stash',
                    Coords = vector3(-133.6760, -1563.8821, 34.2504 - 0.98),
                    Prop = 'prop_weed_tub_01',
                    Rotation = 48.4206,
                    slot = 50,              -- qb-inventory integration
                    maxWeight = 2500000     -- qb-inventory integration
                }
            }
        },
        [7148] = {
            Title = 'VAGOS GANG HOUSE',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {
                'Gang house with storage', 
                'Provide a secure storage for your gang'
            },
            Type = 'house',
            Storages = {
                ['house-storage03'] = {
                    InventoryType = 'stash',
                    Coords = vector3(336.7735, -2041.3035, 21.1458 - 0.98),
                    Prop = 'prop_weed_tub_01',
                    Rotation = 53.0486,
                    slot = 50,              -- qb-inventory integration
                    maxWeight = 2500000     -- qb-inventory integration
                }
            }
        },
        [6842] = {
            Title = 'MARABUNTA GANG HOUSE',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {
                'Gang house with storage', 
                'Provide a secure storage for your gang'
            },
            Type = 'house',
            Storages = {
                ['house-storage04'] = {
                    InventoryType = 'stash',
                    Coords = vector3(1434.8049, -1499.6403, 63.2227 - 0.98),
                    Prop = 'prop_weed_tub_01',
                    Rotation = 166.2049,
                    slot = 50,              -- qb-inventory integration
                    maxWeight = 2500000     -- qb-inventory integration
                }
            }
        },
        [6349] = {
            Title = 'TRIAD GANG HOUSE',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {
                'Gang house with storage', 
                'Provide a secure storage for your gang'
            },
            Type = 'house',
            Storages = {
                ['house-storage05'] = {
                    InventoryType = 'stash',
                    Coords = vector3(-698.2991, -877.4205, 23.7610 - 0.98),
                    Prop = 'prop_weed_tub_01',
                    Rotation = 84.7873,
                    slot = 50,              -- qb-inventory integration
                    maxWeight = 2500000     -- qb-inventory integration
                }
            }
        },
        [5890] = {
            Title = 'LOST MC HOUSE',
            Picture = 'https://i.imgur.com/5ZQJ6Xs.png',
            Description = {
                'Gang house with storage', 
                'Provide a secure storage for your gang'
            },
            Type = 'house',
            Storages = {
                ['house-storage06'] = {
                    InventoryType = 'stash',
                    Coords = vector3(978.5403, -111.3509, 74.3531 - 0.98),
                    Prop = 'prop_weed_tub_01',
                    Rotation = 153.2378,
                    slot = 50,              -- qb-inventory integration
                    maxWeight = 2500000     -- qb-inventory integration
                }
            },
            NPCs = {
                ['g_m_y_lost_03'] = {
                    Coords = vector3(979.2112, -110.1103, 74.3531 - 0.98),
                    Rotation = 151.9986,
                    animDict = nil,
                    animName = nil
                },
            }
        },
    },

    --------------------------
    -- CONTINENTAL SETTINGS --
    --------------------------

    -- Continentals are special zones that are not capturable but they serve as a safezone for all criminals
    -- Killing on continental grounds (killer OR victim in the continental zone) will grant you status of excomunicado and you will get a bounty (Can be disable with KillInContinentalZoneSetBounty set to false)
    -- Also they are used for shopping with special currency
    KillInContinentalZoneSetBounty = true, -- Set a bounty on the player direclty if he killed someone in the Continental zone
    BountyPriceSetOnContinentalKill = 200, -- The bounty amount set to the player if the player killed in continental zone or tha amount add to an existing bounty set to this player
    Continentals = {
        -- ZONES
        -- !!!IMPORTANT!!!! FIND ZONE BY TYPING /CURRENTZONE
        -- You can create any zone you want.
        -- Go in game, find the place where you want to set the zone
        -- Type /currentzone and open you F8 console, the number display is the zone number        -- /!\ Make sure every time you change the coords you check the zone with /currentzone command and update the table key if needed to change the location on the map too /!\
        [8025] = {
            Title = 'CONTINENTAL AREA',
            Picture = 'https://static.wikia.nocookie.net/john-wick8561/images/f/f1/Nyc.png/revision/latest?cb=20230513173806',
            Type = 'continental',

            ShopNPCs = {
                ['s_m_y_devinsec_01'] = {
                    Coords = vector3(1196.9603, -3253.4490, 7.0952 - 0.98),
                    Rotation = 88.4567,
                    animDict = nil,
                    animName = nil
                }
            },

            Shop = {
                ['items'] = {
                    ['lockpick'] = 10,
                    ['armor'] = 50,
                    ['bandage'] = 5,
                    ['medikit'] = 20,
                },
                ['weapons'] = {
                    ['weapon_smg'] = 200,
                    ['weapon_assaultrifle'] = 500,
                    ['weapon_knife'] = 20,
                    ['weapon_pistol'] = 100,
                }
            },
            ShopOpenHours = {00, 11} -- if you set false = unlimited, or format is { openHours, closeHours }, 24 hours format (00 to 23)
        }
    },

    -- Criminal titles asigned for achieved criminals
    -- Higher number titles are more exclusive
    CriminalTitles = {

        [1] = {
            Title = 'Pickpocket',
            Color = '#6e6e6e',
            Background = '#454545',

            -- REQUIRED
            Require = {
                ['kills'] = 0,
                ['headshots'] = 0,
                ['captured'] = 0,
                ['bounties'] = 0
            }
        },
        [2] = {
            Title = 'Bandit',
            Color = '#87b5ff',
            Background = '#214173',

            -- REQUIRED
            Require = {
                ['kills'] = 20,
                ['headshots'] = 2,
                ['captured'] = 0,
                ['bounties'] = 0
            }
        },
        [3] = {
            Title = 'The Don',
            Color = '#bf49eb',
            Background = '#711c91',

            -- REQUIRED
            Require = {
                ['kills'] = 50,
                ['headshots'] = 10,
                ['captured'] = 10,
                ['bounties'] = 10
            }
        },
        [4] = {
            Title = 'Baba Yaga',
            Color = '#db212a',
            Background = '#591215',

            -- REQUIRED
            Require = {
                ['kills'] = 100,
                ['headshots'] = 20,
                ['captured'] = 20,
                ['bounties'] = 20
            }
        }

    },

    Text = {

        ['name_already_used'] = 'This name is already being used',
        ['required_organization_name'] = 'Organization name is required',
        ['required_organization_color'] = 'Organization color is required',
        ['required_organization_picture'] = 'Organization picture is required',
        ['invalid_hex_color'] = 'This color code is not an hexadecimal color code',
        ['not_your_zone'] = 'This is not your zone!',
        ['already_in_war'] = 'Your organization is already in war',
        ['only_owner'] = 'Only organization owner is allowed to do this',
        ['not_enough_currency'] = 'You dont have enough currency',
        ['not_enough_space'] = 'You dont have enough space',
        ['account_required'] = 'You need to create your account first',
        ['feature_turnedoff'] = 'This feature is turned off!',
        ['no_nearby_zone'] = 'You dont have a zone that is connected to this one!',
        ['not_online'] = "The criminal is not online!",
        ['invited'] = "Criminal was invited",
        ['received_invite'] = "You received an invite from organization",
        ['already_invited'] = "Already invited!",
        ['success'] = "Operation successful!",
        ['name_cant_contain_spaces'] = 'You cant use spaces!',
        ['cooldown'] = 'Unavailable due to cooldown',
        ['already_accepted'] = 'You cannot take another bounty once current one is settled',
        ['bounty_set'] = 'Bounty registered!',
        ['bounty_deleted'] = 'Bounty deleted!',
        ['bounty_set_continental'] = 'A bounty was set to you head. Killing somone in continental zone is prohibited',
        ['bounty_increase_continental'] = 'The bounty on your head has been increased. Killing somone in continental zone is prohibited',
        ['continental_shop_close'] = 'The contiental shop is closed',
        ['bounty_to_low'] = 'The bounty amount is lower than the minimum required ({{amount}} {{currency}}(S))',
        ['waypointSet'] = 'Waypoint was set!',
        ['zone_capture_global'] = 'Zone war started!',
        ['owned_zone_capturing'] = 'Your zone is being captured!',
        ['not_enough_online'] = 'Zone is underprotected',
        ['zone_max_level_reached'] = 'Max level of zone protection have been reached',
        ['npc_max_level_reached'] = 'Max level of gang protection have been reached'
    }

}

function SendTextMessage(msg)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(msg)
    DrawNotification(0, 1)
    -- QBCore.Functions.Notify(msg, 'error', 5000)
end
