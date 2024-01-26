if context == 'server' then
      SetConvarReplicated('luxudebug', 'true')
end

Config.EnableWebhook = true

-- UI
Config.Locale = 'en' -- Language | Check locales folder

Config.DateLocale = {
      locale = 'en-US',
      options = {
            weekday = "long",
            year = "numeric",
            month = "long",
            day = "numeric",
            hour = "numeric",
            minute = "numeric",
      } -- Delete options you dont want, https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options
}

Config.CurrencyLocale = {
      locale = "en-US",
      currency = "USD",
}

Config.Menus = {
      PaymentsTab = true,
      OrdersTab = true

}

Config.Commands = {
      CancelPickup = {
            enabled = true,
            command = 'cancelpickup',
            description = 'Cancel your active pickup order',
      },
}

--[[ Script ]]

Config.ScanDuration = 1000 -- Finger Print Reader scan duration in milliseconds

Config.CameraAnimations = true

Config.Save_Delay = 5     -- Minutes | How often should the script save to the database
Config.SaveMessage = true -- Save message to console when saving to database

Config.Mining = {
      delay = 5, -- Minutes beteween each block
      dificulty = 36000000,
      miningDamage = 1,
      progressive = {
            enabled = false,
            dificultyIncreasePerBlock = 100,
      },
      block_reward = { 30, 40 },
      job_settings = {
            job_exclusive = false,
            job_name = 'lcryptominer'
      },
      MaxWarehousesPerPlayer = 1
}

Config.PowerBills = {
      blocks_mined = 2, --- How many blocks the warehouse can mine until next power bill
      killowatCost = 1, --- Price of energy consumed
}

Config.Warehouses = {
      [1] = {          -- Warehouse key, must be unique
            price = 1000,
            route = 1, -- Must match the key of the warehouse key
            label = "Warehouse 1",
            max_employees = 10,
            entrance = vector3(-620.70, -308.3, 34.84),
            exit = vector4(-632.24, -313.74, 35.07, 127.48),
            truckExit = vector4(-632.24, -313.74, 35.07, 127.48),
            blip = {
                  enabled = true,
                  entryKey = "Warehouse1",
                  entryText = "Warehouse 1",
                  sprite = 473,
                  colour = 50,
                  display = 6,
                  scale = 1.0,
                  shortrange = true
            }, -- blip customization
            marker = {
                  enabled = true,
                  label = "Warehouse 1",
                  showDistance = 85,
                  rgba = { 255, 182, 72, 255 },
                  offset = vector3(0, 0, -2),
                  scale = vector3(2.0, 2.0, 2.0),
                  dir = vector3(0, 0, 0),
                  rotation = vector3(0, 0, 0),
                  rotate = false,
                  facecamera = false,
                  bobUpAndDown = false,
                  shape = 1,
                  txd = nil,
                  txn = nil
            },
            text = {
                  enabled = true,
                  outline = true,
                  font = nil,
                  offset = 2.5,
                  scale = 2.5,
                  rgba = { 255, 255, 255, 255 },
                  label = "Warehouse 1",
            },
            debug = false
      },
      [2] = {          -- Warehouse key, must be unique
            price = 1000,
            route = 2, -- Must match the key of the warehouse key
            label = "Warehouse 2",
            max_employees = 5,
            entrance = vector3(349.83, 329.09, 104.32),
            exit = vector4(355.11, 322.59, 104.01, 179.65),
            truckExit = vector4(355.11, 322.59, 104.01, 179.65),
            blip = {
                  enabled = true,
                  entryKey = "Warehouse2",
                  entryText = "Warehouse 2",
                  sprite = 473,
                  colour = 50,
                  display = 6,
                  scale = 1.0,
                  shortrange = true
            }, -- blip customization
            marker = {
                  enabled = true,
                  label = "Warehouse 2",
                  showDistance = 85,
                  rgba = { 255, 182, 72, 255 },
                  offset = vector3(0, 0, -2),
                  scale = vector3(2.0, 2.0, 2.0),
                  dir = vector3(0, 0, 0),
                  rotation = vector3(0, 0, 0),
                  rotate = false,
                  facecamera = false,
                  bobUpAndDown = false,
                  shape = 1,
                  txd = nil,
                  txn = nil
            },
            text = {
                  enabled = true,
                  outline = true,
                  font = nil,
                  offset = 2.5,
                  scale = 2.5,
                  rgba = { 255, 255, 255, 255 },
                  label = "Warehouse 2",
            },
            debug = false
      },
      [3] = {          -- Warehouse key, must be unique
            price = 10000000,
            route = 3, -- Must match the key of the warehouse key
            label = "Warehouse 3",
            max_employees = 5,
            entrance = vector3(292.45, -222.79, 53.98),
            exit = vector4(282.56, -218.9, 53.98, 21.36),
            truckExit = vector4(282.56, -218.9, 53.98, 21.36),
            blip = {
                  enabled = true,
                  entryKey = "Warehouse3",
                  entryText = "Warehouse 3",
                  sprite = 473,
                  colour = 50,
                  display = 6,
                  scale = 1.0,
                  shortrange = true
            }, -- blip customization
            marker = {
                  enabled = true,
                  label = "Warehouse 3",
                  showDistance = 85,
                  rgba = { 255, 182, 72, 255 },
                  offset = vector3(0, 0, -2),
                  scale = vector3(2.0, 2.0, 2.0),
                  dir = vector3(0, 0, 0),
                  rotation = vector3(0, 0, 0),
                  rotate = false,
                  facecamera = false,
                  bobUpAndDown = false,
                  shape = 1,
                  txd = nil,
                  txn = nil
            },
            text = {
                  enabled = true,
                  outline = true,
                  font = nil,
                  offset = 2.5,
                  scale = 2.5,
                  rgba = { 255, 255, 255, 255 },
                  label = "Warehouse 3",
            },
            debug = false
      },
}

-- When players forfeit their warehouse
Config.WarehouseRefunds = {
      enabled = true,
      rate = 0.5 -- refund rate | 0.5 = 50%
}

Config.WarehouseTableSettings = {
      model = "prop_ff_counter_03",
      interior = vector3(2050.02, 2997.91, -72.7),
      coords = {
            vector4(2024.121, 3021.991, -73.72, -60.0),
            vector4(2025.398, 3019.779, -73.72, -60.0),
            vector4(2026.672, 3017.573, -73.72, -60.0),
            vector4(2027.955, 3015.352, -73.72, -60.0),
            vector4(2029.224, 3013.152, -73.72, -60.0),
            vector4(2030.497, 3010.948, -73.72, -60.0),
            vector4(2020.638, 3020.006, -73.72, 120.0),
            vector4(2021.915, 3017.794, -73.72, 120.0),
            vector4(2023.188, 3015.588, -73.72, 120.0),
            vector4(2024.471, 3013.366, -73.72, 120.0),
            vector4(2025.741, 3011.167, -73.72, 120.0),
            vector4(2027.013, 3008.963, -73.72, 120.0),
      }, -- Add more to add more tables
      zone = {
            name = "Mining Rig",
            coords = nil,
            size = vec3(1.6, 2.4, 3),
            rotation = 30.0,
            debug = false
      },

}

Config.MinerSettings = {
      ['antminers9'] = {
            model             = 'antminers9',
            img               = 'antminers9.webp',
            label             = "Antminer S9",
            price             = 5000,
            health            = 100,
            energyConsumption = 1.372, --- Killowats
            data              = {
                  hashrate = 400,
                  temps = 60,
                  power = 1.372,
                  fanspeed = 45
            },
            position          = {
                  TopRow = {
                        x = 1,
                        y = 0,
                        z = 1.04,
                        xR = 0.0,
                        yR = 0.0,
                        zR = 0.0
                  },
                  BottomRow = {
                        x = 1,
                        y = 0,
                        z = 0.29,
                        xR = 0.0,
                        yR = 0.0,
                        zR = 0.0
                  }
            }
      },
      --[[      ['example_miner'] = {
            model             = 'example_miner_model_name',
            img               = 'example_miner_model_image.png',
            label             = "Example Miner",
            price             = 40000,
            health            = 200,
            energyConsumption = 1.372, --- Killowats
            data              = {
                  hashrate = 40000,
                  temps = 60,
                  power = 1.372,
                  fanspeed = 45
            },
            position          = {
                  TopRow = {
                        x = 1,
                        y = 0,
                        z = 1.04,
                        xR = 0.0,
                        yR = 0.0,
                        zR = 0.0
                  },
                  BottomRow = {
                        x = 1,
                        y = 0,
                        z = 0.29,
                        xR = 0.0,
                        yR = 0.0,
                        zR = 0.0
                  }
            }
      } ]]
}

Config.Satoshi = {
      enabled = true,
      model = 'ig_taostranslator',
      label = "Satoshi Nakamoto",
      coords = vector4(-624.34, -309.15, 34.85, 162.94), --vector4(-601.29, -116.32, 41.73, 339.07),
      blip = {
            enabled = true,
            entryKey = "satoshi",
            entryText = "Satoshi Nakamoto",
            sprite = 606,
            colour = 47,
            display = 6,
            scale = 1.0,
            shortrange = true
      },
      shop = {
            enabled = true,
            items = {
                  ['asic_miner_fan'] = {
                        label = 'Asic Miner Fan',
                        price = 250,
                  },
                  ['asic_miner_hashing_board'] = {
                        label = 'Hashing Board',
                        price = 1500,
                  },
                  ['miner_pcb'] = {
                        label = 'Miner PCB',
                        price = 1000,
                  },
                  ['miner_s9shell'] = {
                        label = 'Antminers9 Shell',
                        price = 500,
                  },
                  ['antminers9'] = {
                        label = 'Antminer S9',
                        price = 500,
                  },
            }
      },
}


Config.Deliveries = {
      truckModel = 'mule3',
      forkLiftModel = 'forklift',
      packageModel = 'ex_prop_crate_closed_bc',
      PickupLocations = {
            vector4(-629.05, -438.63, 34.82, 222.38),
            vector4(-629.05, -438.63, 34.82, 222.38)
      },
      WarehouseUnboxLocation = vector4(2030.36, 3004.86, -72.7, 28.68)
}


Config.Disasters = {
      enabled = true,
      delay = 1500, -- time in seconds | big delay recomended | How often there is a chance of a disaster occuring
      ['low'] = {
            marker = { rgb = { r = 255, g = 196, b = 0 }, alpha = 50 },
            effects = { dic = 'core', anim = "ent_amb_smoke_gaswork", alpha = 0.8 },
            probability = 0.60,
            damage = 1,
      },
      ['medium'] = {
            marker = { rgb = { r = 255, g = 196, b = 0 }, alpha = 50 },
            effects = { dic = 'core', anim = "ent_amb_smoke_foundry", alpha = 0.8 },
            probability = 0.20,
            damage = 10
      },
      ['high'] = {
            marker = { rgb = { r = 255, g = 196, b = 0 }, alpha = 50 },
            effects = { dic = 'core', anim = "ent_amb_foundry_arc_heat", alpha = 0.8 },
            probability = 0.15,
            damage = 25,

      },
      ['ultra'] = {
            marker = { rgb = { r = 255, g = 196, b = 0 }, alpha = 50 },
            effects = { dic = 'core', anim = "exp_air_rpg", alpha = 0.8 },
            probability = 0.05,
            damage = 65
      }

}

Config.Crafting = {
      enabled = true,
      animation = {
            dic = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            anim = "machinic_loop_mechandplayer",
            animflags = 51,
            coords = vector4(2039.93, 3013.04, -72.7, 299.4),
            effects = {
                  enabled = true,
                  dic = 'core',
                  anim = 'ent_amb_sparking_wires',
                  coords = vector3(2040.75, 3013.26, -72.8)
            }
      },
      options = {
            ['antminers9'] = {
                  Ingredients = {
                        ['asic_miner_fan'] = 2,
                        ['asic_miner_hashing_board'] = 1,
                        ['miner_pcb'] = 1,
                        ['miner_s9shell'] = 1,
                  },
                  duration = 10,                  -- Crafting Time (in seconds)
                  FinishedProduct = "antminers9", -- Finalized item
            }
      }
}

Config.Screen_targets = {
      ['monitor'] = {
            object = 'sm_prop_smug_tv_flat_01',
            target = 'tv_flat_01',
            txdic = 'sm_prop_smug_tv_flat_01',
            txname = "script_rt_tv_flat_01",
            location = vector3(-31.9001465, 79.4714355, -10.0004349)
      },
      ['cinema'] = {
            object = 'prop_huge_display_02',
            target = 'big_disp',
            txdic = 'big_screens',
            txname = "script_rt_big_disp",
            location = vector3(-33.444458, 90.18701, -7.13388062)
      },
}

WarehouseInteriorBoxZones = {

      {
            name = "Warehouse Crafting",
            coords = vec3(2041.25, 3012.25, -73.0),
            size = vec3(1.5, 4.0, 3.25),
            rotation = 30.5,
            onEnter = function(self)
                  if Config.Crafting.enabled then
                        lib.showContext('oxluxuCraftingTools')
                  end
            end,
            onExit = function()
                  lib.hideContext()
            end
      },
      {
            name = "Warehouse Exit",
            coords = vec3(2052.0, 2995.0, -73.0),
            size = vec3(4.0, 2, 5.0),
            rotation = 30.0,
            onEnter = function(self)
                  OpenExit()
            end,
            onExit = function()
                  lib.hideContext()
            end
      },
      {
            name = "Warehouse Computer",
            coords = vec3(2017.0, 3022.0, -73.0),
            size = vec3(1.5, 4.0, 4.0),
            rotation = 352.5,
            onEnter = function(self)
                  OpenComputer()
            end,
            onExit = function()
                  lib.hideContext()
            end,
            debug = false
      }

}

Config.Orders = {
      InstantDelivery = {
            enabled = true,
            price = 1000,
      },
      Pickups = {
            enabled = true,
            locations = {
                  vector4(-1593.57, -909.37, 9.22, 121.52),
                  vector4(927.46, -3231.95, 5.9, 0.66)
            },
      },
}
