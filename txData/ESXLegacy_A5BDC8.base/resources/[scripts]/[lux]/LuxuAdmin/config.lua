if type(Config) ~= 'table' then
      Config = {}
end

Config.Locale = 'en' -- Language of the bot | Locales folder

--[[  Delay for refreshing players cache | Will bypass if player joins or leaves or refresh button is pressed ]]
Config.PlayerCacheDelay = 5 * 60 * 1000 -- milliseconds

--[[  Delay for refreshing database cache | default 20 minutes ]]
Config.DatabaseCacheDelay = 20 * 60 * 1000 -- milliseconds

--[[  Date format ]]
Config.DateLocale = {
      locale = 'en-US', --[[ Locale| Find yours: https://github.com/unicode-cldr/cldr-core/blob/master/availableLocales.json ]]
      options = {
            weekday = "long",
            year = "numeric",
            month = "long",
            day = "numeric",
            hour = "numeric",
            minute = "numeric",
      } --[[ Delete options you dont want, https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options ]]
}

Config.OneReportPerPlayer = true -- If set to true, players can only have one report active at a time

Config.BanOptions = {
      hardware_ban = true,
      identifiers = {
            license = true,
            license2 = true,
            discord = true,
            live = true,
            xbl = true,
            fivem = true,
            steam = true,
            ip = false, -- You might need to disable this if you are using a proxy
      }
}


Config.Commands = {
      ["AdminMenu"] = {
            name = 'luxuadmin',
            key = false,
      },
      ["Report"] = {
            name = 'report',
            key = false,
      },
      ["Noclip"] = {
            name = 'luxunoclip',
            key = 'INSERT',
      },
      ["TPM"] = {
            name = 'luxutpm',
            key = false,
      },
      ["Vector3"] = {
            name = 'vector3',
            key = false,
      },
      ["Vector4"] = {
            name = false,
            key = false,
      },
      ['AdminClothing'] = {
            name = 'adminclothing',
      }
}

Config.Menus = {
      ['Reports'] = {
            enabled = true,
      },
      ['Banned'] = {
            enabled = true,
      },
      ['Resources'] = {
            enabled = true,
      },
      ['Blips'] = {
            enabled = true,
      }
}

Config.DiscordLogs = {
      enabled = true,
      bypass = { 'license:232432424', "discord:424242424", } -- users that will not be logged
}

Config.ox_logger = {
      enabled = true,
      events = { -- Event Names 👇
            dutyToggle = "dutyToggled",
            adminLog = "adminLog",
      }
}

Config.TextFont = 4                           -- GTA Font Type, change this if you have missing characters | SetTextFont()

Config.DisableNotifyLogs = true              -- If set to true will no longer print notifications in console.

Config.WarningStrikes = 3                     -- How many warnings until ban
Config.WarningBanTimeout = 24                 -- How many hours the warning ban should be
Config.WarnBanReason = "Max warnings reached" -- Reason for the warning ban

--[[ Notification Position - Interface only ]]
Config.NotifyX = 'end' -- start | center | end
Config.NotifyY = 'top' -- top | middle | bottom


--[[ PERMISSIONS ]]
Config.IdentifiersAlwaysAllowed = { "fivem:6928201", "fivem:5325741", "discord:1162872334126944357" } -- Identifiers that can always use the panel with ALL permissions (license,fivem,discord)

-- All the ace groups in your server

Config.TeleportEffect = {
      enable = false, -- Set to false to disable teleport effect
      effectLibrary = "scr_rcbarry1",
      effectName = "scr_alien_teleport",
      delay = 5000
}

Config.AdminClothing = {
      enable = true,
      props = {
            [0] = {
                  enabled = false, -- If set to false, the prop will not be changed
                  label = "Face",
                  male = {
                        drawableID = 0, -- Clothing
                        textureID = 0,  -- Color / Texture
                        paletteId = 0,  -- No Idea lol, just goes from 0 to 3
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [1] = {
                  enabled = true,
                  label = "Mask",
                  male = {
                        drawableID = 1,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [2] = {
                  enabled = false,
                  label = "Hair",
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [3] = {
                  enabled = false,
                  label = "jackets", -- Hands ?
                  male = {
                        drawableID = 5,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [4] = {
                  enabled = false,
                  label = "Legs",
                  male = {
                        drawableID = 77,
                        textureID = 9,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [5] = {
                  enabled = false,
                  label = "Hands",
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [6] = {
                  enabled = false,
                  label = "Shoes",
                  male = {
                        drawableID = 24,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [7] = {
                  enabled = false,
                  label = "Accessory",
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [8] = {
                  enabled = false,
                  label = "Undershirt",
                  male = {
                        drawableID = 5,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [9] = {
                  enabled = false,
                  label = "Task",
                  male = {
                        drawableID = 2,
                        textureID = 1,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [10] = {
                  enabled = false,
                  label = "Badge",
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [11] = {
                  enabled = false,
                  label = "Torso 2", -- Jackets ?
                  male = {
                        drawableID = 50,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },

      },
      accessories = {
            ['helmet'] = {
                  enabled = false,
                  propIndex = 0,
                  textureIndex = 0,
            },
            ['hats'] = {
                  enabled     = false,
                  componentId = 0, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },
            ['glasses'] = {
                  enabled     = false,
                  componentId = 1, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },
            ['ears'] = {
                  enabled     = false,
                  componentId = 2, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },
            ['watches'] = {
                  enabled     = false,
                  componentId = 6, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },
            ['bracelets'] = {
                  enabled     = false,
                  componentId = 7, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },

      }
}
