local installOptions = {}
for k, miner in pairs(Config.MinerSettings) do
      installOptions[#installOptions + 1] = {
            title = ('Install %s'):format(miner.label),
            description = 'Add a new miner to the selected rig.',
            icon = 'fa fa-wrench',
            close = false,
            onSelect = function()
                  InstallMinerOnTable(k, miner.model)
                  lib.showContext('oxluxuShowMinerMenu')
            end
      }
end
installOptions[#installOptions + 1] = {
      title = Locale('Exit'),
      icon = 'fa fa-times-circle',
      onSelect = function()
            lib.hideContext(false)
      end
}


--[[ Creating All ox_lib menus here ]]
lib.registerContext({
      id = 'oxluxuCraftingTools',
      title = 'Mining Tools',
      options = {
            {
                  title = Locale("Crafting"),
                  description = Locale("CraftMiners"),
                  menu = 'oxluxuCraftingOptions'
            },
            {
                  title = Locale('Exit'),
                  icon = 'fa fa-times-circle',
                  onSelect = function()
                        lib.hideContext(false)
                  end
            },
      },
      --[[ Menu 2 ]]
      {
            id = 'oxluxuCraftingOptions',
            title = Locale("AvailableMiners"),
            options = {
                  {
                        title = 'Antminer S9',
                        description = '2x Asic Miner Fan, 1x Hashing Board, 1x Miner PCB, 1x Antminers9 Shell',
                        icon = 'fa fa-wrench',
                        onSelect = function()
                              CraftMiner('antminers9')
                              lib.hideContext(false)
                        end
                  },
                  {
                        title = Locale("Return"),
                        icon = 'fa-solid fa-backward',
                        menu = 'oxluxuCraftingTools',
                        arrow = false
                  },
                  {
                        title = Locale('Exit'),
                        icon = 'fa fa-times-circle',
                        onSelect = function()
                              lib.hideContext(false)
                        end
                  },
            }
      },
      --[[ Menu3 ]]
      {
            id = 'oxluxuSatoshiShop',
            title = Locale("MinerComponents"),
            options = {

                  {
                        title = Config.Satoshi.shop.items['asic_miner_fan'].label,
                        description = string.format('%s: %s', Locale('Price'),
                              Config.Satoshi.shop.items['asic_miner_fan'].price),
                        icon = 'fa-solid fa-gear',
                        onSelect = function()
                              BuyComponent("asic_miner_fan")
                              lib.showContext('oxluxuSatoshiShop')
                        end,
                  },
                  {
                        title = Config.Satoshi.shop.items['asic_miner_hashing_board'].label,
                        description = string.format('%s: %s', Locale('Price'),
                              Config.Satoshi.shop.items['asic_miner_hashing_board'].price),
                        icon = 'fa-solid fa-gear',
                        onSelect = function()
                              BuyComponent("asic_miner_hashing_board")
                              lib.showContext('oxluxuSatoshiShop')
                        end,

                  },
                  {
                        title = Config.Satoshi.shop.items['miner_pcb'].label,
                        description = string.format('%s: %s', Locale('Price'),
                              Config.Satoshi.shop.items['miner_pcb'].price),
                        icon = 'fa-solid fa-gear',
                        onSelect = function()
                              BuyComponent("miner_pcb")
                              lib.showContext('oxluxuSatoshiShop')
                        end,

                  },
                  {
                        title = Config.Satoshi.shop.items
                            ['miner_s9shell'].label,
                        description = string.format('%s: %s', Locale('Price'), Config.Satoshi.shop.items
                              ['miner_s9shell'].price),
                        icon = 'fa-solid fa-gear',
                        onSelect = function()
                              BuyComponent("miner_s9shell")
                              lib.showContext('oxluxuSatoshiShop')
                        end,

                  },

                  {
                        title = Locale("Return"),
                        icon = 'fa-solid fa-backward',
                        menu = 'oxluxuJobMenu',
                        arrow = false
                  },
                  {
                        title = Locale('Exit'),
                        icon = 'fa fa-times-circle',
                        onSelect = function()
                              lib.hideContext(false)
                        end
                  },
            }
      },
      --[[ Table Menu ]]
      {
            id = 'oxluxuShowMinerMenu',
            title = Locale('MiningRig'),
            options = installOptions
      },
}
)





function SatoshiMenu()
      local JobSettings = Config.Mining.job_settings
      -- local Player = LuxuGetPlayerData()
      local jobName = lib.callback.await('LuxuCM:Server:GetPlayerJob', false)
      if jobName == JobSettings.job_name or not JobSettings.job_exclusive then
            --[[ If player is a crypto miner, show these menus ]]
            if Config.Satoshi.shop.enabled then
                  --[[ If shop is enabled ]]
                  lib.registerContext(
                        {
                              id = 'oxluxuJobMenu',
                              title = 'Crypto Mining Job',
                              options = {
                                    {
                                          title = 'Shop',
                                          description = 'Buy miner parts',
                                          icon = 'fa-solid fa-cart-shopping',
                                          menu = 'oxluxuSatoshiShop',
                                    },
                                    {
                                          title = Locale('Exit'),
                                          icon = 'fa fa-times-circle',
                                          onSelect = function()
                                                lib.hideContext(false)
                                          end
                                    },
                              }
                        }
                  )
                  lib.showContext('oxluxuJobMenu')
            else
                  --[[ If shop is not enabled ]]
                  lib.registerContext(
                        {
                              id = 'oxluxuJobMenu',
                              title = 'Crypto Mining Job',
                              options = {
                                    { title = 'Nothing available' },
                                    {
                                          title = Locale('Exit'),
                                          icon = 'fa fa-times-circle',
                                          onSelect = function()
                                                lib.hideContext(false)
                                          end
                                    },
                              }
                        }
                  )
                  lib.showContext('oxluxuJobMenu')
            end
      else
            --[[ If player isn't a crypto miner and mining is job exclusive ]]
            lib.registerContext(
                  {
                        id = 'oxluxuJobMenu',
                        title = 'Crypto Mining Job',
                        options = {
                              {
                                    title = 'Become a miner',
                                    description = 'Change your job to crypto miner',
                                    icon = 'fa-solid fa-wrench',
                                    onSelect = function()
                                          TriggerServerEvent("LuxuCM:Server:BecomeMiner")
                                          lib.hideContext(false)
                                    end
                              },
                              {
                                    title = Locale('Exit'),
                                    icon = 'fa fa-times-circle',
                                    onSelect = function()
                                          lib.hideContext(false)
                                    end
                              },
                        }
                  }
            )
            lib.showContext('oxluxuJobMenu')
      end
end
