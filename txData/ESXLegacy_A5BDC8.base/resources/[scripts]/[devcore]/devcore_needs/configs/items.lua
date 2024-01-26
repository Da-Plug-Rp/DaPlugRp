
--------------CONSUME ITEMS---------------
-- PROPS = https://forge.plebmasters.de/
-- BONES INDEX = LEFT HAND : 18905 , RIGHT HAND : 28422
--[[
--------------------- LEFT HAND HOLD ANIM 
    Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
        },
-------------------- RIGHT HAND HOLD ANIM 
    Hold = {
            dict = "anim@heists@humane_labs@finale@keycards",
            anim = "ped_a_enter_loop",
            params = {8.0, -8, -1, 49, 0}
        },

]]


Config.ConsumeItems = {-- It is possible to add custom items

---FOOD--

    ["burger"] = {-- item name
        Size = 220, -- Item size
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_cs_burger_01',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02),
                Rot = vector3(-180.0, 0.0, 0.0),
            },
            --[[Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
                Model = 'alcaprop_fork',
                BoneID = 57005,
                Offset = vector3(0.14, 0.02, 0.01),
                Rot = vector3(-118.0, 192.0, 24.0),
            }]]
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 50000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    

    ["chaser"] = {-- item name
        Size = 70,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_choc_ego',
                BoneID = 18905,
                Offset = vector3(0.13, 0.04, 0.0),
                Rot = vector3(48.0, 18.0, -133.0),
            },
            --[[Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
                Model = 'alcaprop_fork',
                BoneID = 57005,
                Offset = vector3(0.14, 0.02, 0.01),
                Rot = vector3(-118.0, 192.0, 24.0),
            }]]
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 60000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["meteorite"] = {-- item name
        Size = 80,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_choc_meto',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02),
                Rot = vector3(50.0, 30.0, 260.0),
            },
            --[[Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
                Model = 'alcaprop_fork',
                BoneID = 57005,
                Offset = vector3(0.14, 0.02, 0.01),
                Rot = vector3(-118.0, 192.0, 24.0),
            }]]
    },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 60000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["hotdog"] = {-- item name
        Size = 120,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
          Main = {
                Model = 'prop_cs_hotdog_01',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02),
                Rot = vector3(0.0, -140.0, -140.0),
            },
            --[[Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
                Model = 'alcaprop_fork',
                BoneID = 57005,
                Offset = vector3(0.14, 0.02, 0.01),
                Rot = vector3(-118.0, 192.0, 24.0),
            }]]
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 60000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["taco"] = {-- item name
        Size = 100,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
          Main = {
                Model = 'prop_taco_01',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02),
                Rot = vector3(0.0, -140.0, -140.0),
        },
        --[[Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 57005,
            Offset = vector3(0.14, 0.02, 0.01),
            Rot = vector3(-118.0, 192.0, 24.0),
        }]]
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 60000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


--DRINK


    ["raine"] = {-- item name
        Size = 500,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'ba_prop_club_water_bottle',
                BoneID = 18905,
                Offset = vector3(0.14, -0.08, 0.05),
                Rot = vector3(251.0, -14.0, 11.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 60000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["energy_drink"] = {-- item name
        Size = 500,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_energy_drink',
                BoneID = 18905,
                Offset = vector3(0.14, -0.08, 0.05),
                Rot = vector3(251.0, -14.0, 11.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 50000, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
        },


    ["sprunk"] = {-- item name
        Size = 330,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_ld_can_01',
                BoneID = 28422,
                Offset = vector3(0.0, -0.01, -0.02),
                Rot = vector3(05.0, -10.0, 0.0),
            }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 50000, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
        },

    ["coffe"] = {-- item name
        Size = 330,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_fib_coffee',
                BoneID = 28422,
                Offset = vector3(0.0, -0.01, -0.02),
                Rot = vector3(05.0, -10.0, 0.0),
                }
            },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 40000, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
        },

    ["cola"] = {-- item name
        Size = 330,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_ecola_can',
                BoneID = 28422,
                Offset = vector3(0.0, -0.01, -0.02),
                Rot = vector3(05.0, -10.0, 0.0),
                }
            },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 50000, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
        },

    ["piswasser"] = {-- item name
        Size = 500,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_amb_beer_bottle',
                BoneID = 18905,
                Offset = vector3(0.14, -0.08, 0.05),
                Rot = vector3(251.0, -14.0, 11.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 1, -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["mount_whiskey"] = {-- Item spawn name
        Size = 700, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_whiskey_bottle',
                BoneID = 18905,
                Offset = vector3(0.18, -0.19, 0.13),
                Rot = vector3(-120.0, 12.0, 6.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 3, -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["tequila"] = {-- Item spawn name
        Size = 700, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_tequila_bottle',
                BoneID = 18905,
                Offset = vector3(0.14, -0.28, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 4, -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["nogo_vodka"] = {-- Item spawn name
        Size = 700, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_vodka_bottle',
                BoneID = 18905,
                Offset = vector3(0.12, -0.28, 0.19),
                Rot = vector3(-120.0, .0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 3, -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["costa_del_perro"] = {-- Item spawn name
        Size = 500, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_wine_bot_01',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["rockford_hill"] = {-- Item spawn name
        Size = 500, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_wine_bot_02',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },

    
    ["vinewood_red"] = {-- Item spawn name
        Size = 500, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_wine_rose',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["vinewood_blanc"] = {-- Item spawn name
        Size = 500, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_wine_white',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["bleuterd"] = { -- Item spawn name
        Size = 700, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = 'prop_champ_jer_01a',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 40000, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ---GLASSES


    ['whiskey_glass'] = {
        Size = 250,
        Type = 'GLASS', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = {full = 'prop_drink_whisky', null = 'prop_whiskey_01'}, -- Prop model null = prop of empty glass, full = prop of full glass
                BoneID = 28422, -- Id of the bone to which the prop is to be attached
                Offset = vector3(0.0, -0.01, -0.02),
                Rot = vector3(05.0, -10.0, 0.0),
            }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
            },
            Use = {
                dict = "amb@code_human_wander_drinking@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 3000, 49}
            },
            Pour = { -- only for glasses 
                dict = "devcore_fox@pour",
                anim = "foxyando_pour_clip",
                params = {4.0, 4.0, 4000, 16, 0}
            }
        },
        Consume = { -- For glasses, there is no need to indicate alcohol, status, or stress because this information is taken from the beverage that is poured into the glass.
            Bite = {min = 30, max = 40}, -- Set how many ml or g are removed from the item after each drink / bite into food
        },
        AllowedItems = { -- Items that can be poured into the glass
            'mount_whiskey',
            'tequila',
        },
    },

    ['flute_glass'] = {
        Size = 250,
        Type = 'GLASS', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = {full = 'prop_cs_champ_flute', null = 'prop_champ_flute'}, -- Prop model null = prop of empty glass, full = prop of full glass
                BoneID = 28422, -- Id of the bone to which the prop is to be attached
                Offset = vector3(0.06, 0.0, -0.18),
                Rot = vector3(05.0, -10.0, 0.0),
            }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
            },
            Use = { 
                dict = "amb@code_human_wander_drinking@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 3000, 49}
            },
            Pour = { -- only for glasses 
                dict = "devcore_fox@pour",
                anim = "foxyando_pour_clip",
                params = {4.0, 4.0, 4000, 16, 0}
            }
        },
        Consume = { -- For glasses, there is no need to indicate alcohol, status, or stress because this information is taken from the beverage that is poured into the glass.
            Bite = {min = 25, max = 40}, -- Set how many ml or g are removed from the item after each drink / bite into food
        },
        AllowedItems = { -- Items that can be poured into the glass
            'costa_del_perro',
            'vinewood_blanc',
            'vinewood_red',
            'rockford_hill',
            'bleuterd',
        },
    },

    ['wine_glass'] = {
        Size = 250, -- 
        Type = 'GLASS', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = {full = 'prop_drink_redwine', null = 'prop_sh_wine_glass'}, -- -- Prop model null = prop of empty glass, full = prop of full glass
                BoneID = 28422, -- Id of the bone to which the prop is to be attached
                Offset = vector3(0.01, 0.01, -0.1),
                Rot = vector3(05.0, -10.0, 0.0),
            }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
            },
            Use = {
                dict = "amb@code_human_wander_drinking@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 3000, 49}
            },
            Pour = { -- only for glasses 
                dict = "devcore_fox@pour",
                anim = "foxyando_pour_clip",
                params = {4.0, 4.0, 4000, 16, 0}
            },
        },
        Consume = { -- For glasses, there is no need to indicate alcohol, status, or stress because this information is taken from the beverage that is poured into the glass.
            Bite = {min = 30, max = 40}, -- Set how many ml or g are removed from the item after each drink / bite into food
        },
        AllowedItems = { -- Items that can be poured into the glass
            'costa_del_perro',
            'vinewood_blanc',
            'vinewood_red',
            'rockford_hill',
        },
    },

    ['shot_glass'] = {
        Size = 50,
        Type = 'GLASS', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
            Main = {
                Model = {full = 'p_cs_shot_glass_2_s', null = 'prop_sh_shot_glass'}, -- -- Prop model null = prop of empty glass, full = prop of full glass
                BoneID = 18905, -- Id of the bone to which the prop is to be attached
                Offset = vector3(0.11, 0.01, 0.03),
                Rot = vector3(-101.0, -91.0, 11.0),
            }
        },
        Anim = {
            Hold = {
                dict = "anim@heists@humane_labs@finale@keycards",
                anim = "ped_a_enter_loop",
                params = {8.0, -8, -1, 49, 0}
            },
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            },
            Pour = { -- only for glasses 
                dict = "devcore_fox@pour",
                anim = "foxyando_pour_clip",
                params = {4.0, 4.0, 4000, 16, 0}
            }
        },
        Consume = { -- For glasses, there is no need to indicate alcohol, status, or stress because this information is taken from the beverage that is poured into the glass.
            Bite = {min = 50, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
        },
        AllowedItems = { -- Items that can be poured into the glass
            'nogo_vodka',
            'tequila',
            'mount_whiskey',
        },
    },
    
}