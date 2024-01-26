--   ______   __                                  ________                                 __               
--  /      \ |  \                                |        \                               |  \              
-- |  $$$$$$\| $$____    ______    ______        | $$$$$$$$__     __   ______   _______  _| $$_     _______    __
-- | $$___\$$| $$    \  /      \  /      \       | $$__   |  \   /  \ /      \ |       \|   $$ \   /       \  |  \
--  \$$    \ | $$$$$$$\|  $$$$$$\|  $$$$$$\      | $$  \   \$$\ /  $$|  $$$$$$\| $$$$$$$\\$$$$$$  |  $$$$$$$   \$$
--  _\$$$$$$\| $$  | $$| $$  | $$| $$  | $$      | $$$$$    \$$\  $$ | $$    $$| $$  | $$ | $$ __  \$$    \    __
-- |  \__| $$| $$  | $$| $$__/ $$| $$__/ $$      | $$_____   \$$ $$  | $$$$$$$$| $$  | $$ | $$|  \ _\$$$$$$\  |  \ 
--  \$$    $$| $$  | $$ \$$    $$| $$    $$      | $$     \   \$$$    \$$     \| $$  | $$  \$$  $$|       $$   \$$
--   \$$$$$$  \$$   \$$  \$$$$$$ | $$$$$$$        \$$$$$$$$    \$      \$$$$$$$ \$$   \$$   \$$$$  \$$$$$$$     
-- 	   							 | $$                                                                       
--  							 | $$                                                                       
-- 								  \$$                                                                       

RegisterNetEvent('xmmx-letscamp:OpenShop', function(data)
	if Config.Inventory == "ox" then
		exports.ox_inventory:openInventory('shop', { type = data.shopname })
	elseif Config.Inventory == "qb" then
    	TriggerServerEvent("inventory:server:OpenInventory", "shop", "letscamp", data.shop)
	elseif Config.Inventory == "qs" then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "letscamp", data.shop) -- works for qs-inventory
	elseif Config.Inventory == "esx" then
		-- Configure your shop event here
		-- TriggerServerEvent("inventory:server:OpenInventory", "shop", "letscamp", data.shop) -- works for qs-inventory
	end
end)

RegisterNetEvent('xmmx-letscamp:OpenCooler', function(data)
	if Config.Inventory == "ox" then
		exports.ox_inventory:openInventory('shop', { type = data.shopname })
	elseif Config.Inventory == "qb" then
    	TriggerServerEvent("inventory:server:OpenInventory", "shop", "campcooler", data.shop)
	elseif Config.Inventory == "qs" then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "campcooler", data.shop) -- works for qs-inventory
	elseif Config.Inventory == "esx" then
		-- Configure your shop event here
		-- TriggerServerEvent("inventory:server:OpenInventory", "shop", "campcooler", data.shop) -- works for qs-inventory
	end
end)



--   ______                                                                   __        __                  ________                                 __                   
--  /      \                                                                 |  \      |  \                |        \                               |  \                  
-- |  $$$$$$\  ______   _______    _______  __    __  ______ ____    ______  | $$____  | $$  ______        | $$$$$$$$__     __   ______   _______  _| $$_     _______  __ 
-- | $$   \$$ /      \ |       \  /       \|  \  |  \|      \    \  |      \ | $$    \ | $$ /      \       | $$__   |  \   /  \ /      \ |       \|   $$ \   /       \|  \
-- | $$      |  $$$$$$\| $$$$$$$\|  $$$$$$$| $$  | $$| $$$$$$\$$$$\  \$$$$$$\| $$$$$$$\| $$|  $$$$$$\      | $$  \   \$$\ /  $$|  $$$$$$\| $$$$$$$\\$$$$$$  |  $$$$$$$ \$$
-- | $$   __ | $$  | $$| $$  | $$ \$$    \ | $$  | $$| $$ | $$ | $$ /      $$| $$  | $$| $$| $$    $$      | $$$$$    \$$\  $$ | $$    $$| $$  | $$ | $$ __  \$$    \  __ 
-- | $$__/  \| $$__/ $$| $$  | $$ _\$$$$$$\| $$__/ $$| $$ | $$ | $$|  $$$$$$$| $$__/ $$| $$| $$$$$$$$      | $$_____   \$$ $$  | $$$$$$$$| $$  | $$ | $$|  \ _\$$$$$$\|  \
--  \$$    $$ \$$    $$| $$  | $$|       $$ \$$    $$| $$ | $$ | $$ \$$    $$| $$    $$| $$ \$$     \      | $$     \   \$$$    \$$     \| $$  | $$  \$$  $$|       $$ \$$
--   \$$$$$$   \$$$$$$  \$$   \$$ \$$$$$$$   \$$$$$$  \$$  \$$  \$$  \$$$$$$$ \$$$$$$$  \$$  \$$$$$$$       \$$$$$$$$    \$      \$$$$$$$ \$$   \$$   \$$$$  \$$$$$$$     
--																																									  																																									  																																									  

RegisterNetEvent('xmmx-letscamp:consumable:Eat', function(itemName)
	local source = PlayerId(source)
	if Config.Core == "qb" then
		local emotes = {
			["lcsmores"] 		= "eat",
			["lccookedsteak"] 	= "eat",
			["lccookedcorn"] 	= "eat",
			["lccookedfish"] 	= "eat",
			["lccookedpotato"] 	= "eat",
		}
		if emotes[itemName] then ExecuteCommand('e '..emotes[itemName]) end
		if Config.Utils == "qb" then
			local QBCore = exports[Config.CoreObject]:GetCoreObject()
			QBCore.Functions.Progressbar("eat_something", Locales[Config.Language].progress["eating"]..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function()
				ExecuteCommand('e c')
				removeItem(false, itemName, 1)
				TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.EatsMeta[itemName])
				TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
			end, function()
				ExecuteCommand('e c')
				if Config.Notify == "qb" then
					QBCore.Functions.Notify(Locales[Config.Language].error["cancelled"], "error")
				elseif Config.Notify == "ox" then
					lib.notify({ title = '', description = Locales[Config.Language].error["cancelled"], type = "error", duration = 5000, style = { backgroundColor = '#000000a2', color = '#d6d6d6' }, icon = "ban", position = "top", })
				end
			end, itemName)
		elseif Config.Utils == "ox" then
			lib.progressCircle({
				duration = 5000,
				position = 'bottom',
				label = Locales[Config.Language].progress["eating"],
				useWhileDead = false,
				canCancel = false,
				disable = {
					car = true,
				},
				anim = {
					dict = false,
					clip = false, 
					flag = false,
					lockX = false,
					lockY = false,
					lockZ = false,
				}
			})
			ExecuteCommand('e c')
			removeItem(false, itemName, 1)
			TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.EatsMeta[itemName])
			TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
		end
	elseif Config.Core == "esx" then
        lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = Locales[Config.Language].progress["eating"],
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                dict = 'mp_player_inteat@burger',
                clip = 'mp_player_int_eat_burger', 
                flag = 9,
                lockX = false,
                lockY = false,
                lockZ = false,
            },
            prop = {
                model = `prop_cs_burger_01`,
                bone = 18905,
                pos = vec3(0.130000, 0.050000, 0.020000),
                rot = vec3(-50.000000, 16.000000, 60.000000)
            },
        })
	end
end)

RegisterNetEvent('xmmx-letscamp:consumable:Drink', function(itemName)
	local source = PlayerId(source)
	if Config.Core == "qb" then
		local emotes = {
			["lcherbtea"] 		= "drink",
			["lcwater"] 		= "drink",
			["lccupcoffee"] 	= "drink",
		}
		if emotes[itemName] then ExecuteCommand('e '..emotes[itemName]) end
		if Config.Utils == "qb" then
			local QBCore = exports[Config.CoreObject]:GetCoreObject()
			QBCore.Functions.Progressbar("drink_something", Locales[Config.Language].progress["drinking"]..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function()
				ExecuteCommand('e c')
				removeItem(false, itemName, 1)
				TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.DrinksMeta[itemName]) 
			end, function()
				ExecuteCommand('e c')
				if Config.Notify == "qb" then
					QBCore.Functions.Notify(Locales[Config.Language].error["cancelled"], "error")
				elseif Config.Notify == "ox" then
					lib.notify({ title = '', description = Locales[Config.Language].error["cancelled"], type = "error", duration = 5000, style = { backgroundColor = '#000000a2', color = '#d6d6d6' }, icon = "ban", position = "top", })
				end
			end, itemName)
		elseif Config.Utils == "ox" then
			lib.progressCircle({
				duration = 5000,
				position = 'bottom',
				label = Locales[Config.Language].progress["drinking"],
				useWhileDead = false,
				canCancel = false,
				disable = {
					car = true,
				},
				anim = {
					dict = false,
					clip = false, 
					flag = false,
					lockX = false,
					lockY = false,
					lockZ = false,
				},
			})
			ExecuteCommand('e c')
			removeItem(false, itemName, 1)
			TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.DrinksMeta[itemName])
		end
	elseif Config.Core == "esx" then
        lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = Locales[Config.Language].progress["drinking"],
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                dict = "amb@world_human_drinking@coffee@male@idle_a",
                clip = "idle_c", 
                flag = false,
                lockX = false,
                lockY = false,
                lockZ = false,
            },
            prop = {
                model = `prop_plastic_cup_02`,
                bone = 28422,
                pos = vec3(0.000000, 0.000000, 0.000000),
                rot = vec3(0.000000, 0.000000, 0.000000)
            },
        })
	end
end)

local stomachAche = 0
RegisterNetEvent('xmmx-letscamp:consumable:EatBeans', function(itemName)
	if Config.Notify == "qb" then
		local QBCore = exports[Config.CoreObject]:GetCoreObject()
		QBCore.Functions.Notify(Locales[Config.Language].notify["bean_warn"], "primary", 2000)
	elseif Config.Notify == "ox" then
		lib.notify({ title = '', description = Locales[Config.Language].notify["bean_warn"], type = "info", duration = 5000, style = { backgroundColor = '#000000a2', color = '#d6d6d6' }, position = "top", })
	end
	if Config.Core == "qb" then
		local emotes = {
			["lccookedbeans"] 	= "beans", -- emote to play
		}
		if emotes[itemName] then ExecuteCommand('e '..emotes[itemName]) end
		if Config.Utils == "qb" then
			local QBCore = exports[Config.CoreObject]:GetCoreObject()
			QBCore.Functions.Progressbar("eat_something", Locales[Config.Language].progress["eating"]..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function()
				ExecuteCommand('e c')
				removeItem(false, itemName, 1)
				TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.BeansMeta[itemName])
				stomachAche = stomachAche + 1
				if stomachAche >= 1 then
					DiarrheaEffect()
				end
			end, function()
				ExecuteCommand('e c')
				if Config.Notify == "qb" then
					QBCore.Functions.Notify(Locales[Config.Language].error["cancelled"], "error")
				elseif Config.Notify == "ox" then
					lib.notify({ title = '', description = Locales[Config.Language].error["cancelled"], type = "error", duration = 5000, style = { backgroundColor = '#000000a2', color = '#d6d6d6' }, icon = "ban", position = "top", })
				end
			end, itemName)
		elseif Config.Utils == "ox" then
			lib.progressCircle({
				duration = 5000,
				position = 'bottom',
				label = Locales[Config.Language].progress["eating"],
				useWhileDead = false,
				canCancel = false,
				disable = {
					car = true,
				},
				anim = {
					dict = 'anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1',
					clip = 'base_idle', 
					flag = 49,
					lockX = false,
					lockY = false,
					lockZ = false,
				},
				prop = {
					{
						model = `h4_prop_h4_caviar_tin_01a`,
						bone = 60309,
						pos = vec3(0.000000, 0.030000, 0.010000),
						rot = vec3(0.000000, 0.000000, 0.000000)
					},
					{
						model = `h4_prop_h4_caviar_spoon_01a`,
						bone = 28422,
						pos = vec3(0.000000, 0.000000, 0.000000),
						rot = vec3(0.000000, 0.000000, 0.000000)
					}
				},
			})
		end
	elseif Config.Core == "esx" then
        lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = Locales[Config.Language].progress["eating"],
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                dict = 'anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1',
                clip = 'base_idle', 
                flag = 9,
                lockX = false,
                lockY = false,
                lockZ = false,
            },
            prop = {
				{
					model = `h4_prop_h4_caviar_tin_01a`,
					bone = 60309,
					pos = vec3(0.000000, 0.030000, 0.010000),
					rot = vec3(0.000000, 0.000000, 0.000000)
				},
				{
					model = `h4_prop_h4_caviar_spoon_01a`,
					bone = 28422,
					pos = vec3(0.000000, 0.000000, 0.000000),
					rot = vec3(0.000000, 0.000000, 0.000000)
				}
            },
        })
		stomachAche = stomachAche + 1
		if stomachAche >= 1 then
			DiarrheaEffect()
		end
	end
end)




