*****************************************************************************************************************
 ______  __    __   ______  ________   ______   __        __         ______  ________  ______   ______   __    __ 
|      \|  \  |  \ /      \|        \ /      \ |  \      |  \       /      \|        \|      \ /      \ |  \  |  \
 \$$$$$$| $$\ | $$|  $$$$$$\\$$$$$$$$|  $$$$$$\| $$      | $$      |  $$$$$$\\$$$$$$$$ \$$$$$$|  $$$$$$\| $$\ | $$
  | $$  | $$$\| $$| $$___\$$  | $$   | $$__| $$| $$      | $$      | $$__| $$  | $$     | $$  | $$  | $$| $$$\| $$
  | $$  | $$$$\ $$ \$$    \   | $$   | $$    $$| $$      | $$      | $$    $$  | $$     | $$  | $$  | $$| $$$$\ $$
  | $$  | $$\$$ $$ _\$$$$$$\  | $$   | $$$$$$$$| $$      | $$      | $$$$$$$$  | $$     | $$  | $$  | $$| $$\$$ $$
 _| $$_ | $$ \$$$$|  \__| $$  | $$   | $$  | $$| $$_____ | $$_____ | $$  | $$  | $$    _| $$_ | $$__/ $$| $$ \$$$$
|   $$ \| $$  \$$$ \$$    $$  | $$   | $$  | $$| $$     \| $$     \| $$  | $$  | $$   |   $$ \ \$$    $$| $$  \$$$
 \$$$$$$ \$$   \$$  \$$$$$$    \$$    \$$   \$$ \$$$$$$$$ \$$$$$$$$ \$$   \$$   \$$    \$$$$$$  \$$$$$$  \$$   \$$

******************************************************************************************************************

--- Add the items from line 16 through 79 to your ox_inventory/data/items.lua
 
	-- Bahama Mama's Ingredients
	['bahama_mug'] 			= { label = 'Empty Mug', 		weight = 80, },
	['bahama_glass'] 		= { label = 'Empty Glass', 		weight = 80, },
	['bahama_shotglass'] 	= { label = 'Shot Glass', 		weight = 80, },
	['bahama_whiskey'] 		= { label = 'Whiskey', 			weight = 80, },
	['bahama_tequila'] 		= { label = 'Tequila', 			weight = 80, },
	['bahama_vodka'] 		= { label = 'Vodka', 			weight = 80, },
	['bahama_rum'] 			= { label = 'Rum', 				weight = 80, },
	['bahama_gin'] 			= { label = 'Gin', 				weight = 80, },
	['bahama_cachaca'] 		= { label = 'Cachaca', 			weight = 80, },
	['bahama_curacao'] 		= { label = 'Curacao', 			weight = 80, },
	['bahama_champagne'] 	= { label = 'Champagne', 		weight = 80, },
	['bahama_strawberry'] 	= { label = 'Strawberry', 		weight = 80, },
	['bahama_lime'] 		= { label = 'Lime', 			weight = 80, },
	['bahama_pineapple'] 	= { label = 'Pineapples', 		weight = 80, },
	['bahama_cranjuice'] 	= { label = 'Cranberry Juice', 	weight = 80, },
	['bahama_ojuice'] 		= { label = 'Orange Juice', 	weight = 80, },
	['bahama_coffee']	 	= { label = 'Coffee', 			weight = 80, },
	['bahama_sugarcube'] 	= { label = 'Sugar Cubes', 		weight = 80, },
	['bahama_icecube'] 		= { label = 'Ice Cubes', 		weight = 80, },
	['bahama_jello'] 		= { label = 'Jello Mix', 		weight = 80, },
	['bahama_ccheese'] 		= { label = 'Cream Cheese', 	weight = 80, },
	['bahama_mango'] 		= { label = 'Mango', 			weight = 80, },
	['bahama_cheddar'] 		= { label = 'Cheddar', 			weight = 80, },
	['bahama_rawwing'] 		= { label = 'Raw Wings', 		weight = 80, },
	['bahama_seasoning'] 	= { label = 'Seasoning', 		weight = 80, },
	['bahama_chips'] 		= { label = 'Tortilla Chips', 	weight = 80, },
	['bahama_beef'] 		= { label = 'Beef', 			weight = 80, },
	['bahama_avocado'] 		= { label = 'Avocado', 			weight = 80, },
	['bahama_peppers'] 		= { label = 'Peppers', 			weight = 80, },
	['bahama_bbq'] 			= { label = 'BBQ Sauce', 		weight = 80, },
	['bahama_shrimp'] 		= { label = 'Raw Shrimp', 		weight = 80, },
	['bahama_rawchik'] 		= { label = 'Raw Chicken', 		weight = 80, },
	['bahama_eggs'] 		= { label = 'Fresh Eggs', 		weight = 80, },
	['bahama_bredcrum'] 	= { label = 'Breadcrumbs', 		weight = 80, },
	['bahama_butter']		= { label = 'Butter', 			weight = 80, },

	-- Bahama Mama's Drink Items
	['bm_oldfashion'] 		= { label = 'Old Fashioned', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_drink_whisky`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drank an Old Fashioned Whiskey!' } },
	['bm_pinacolada'] 		= { label = 'Pina Colada', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pinacolada`, 		pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Pina Colada!' } },
	['bm_cosmopolitan'] 	= { label = 'Cosmopolitan', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_daiquiri`, 		pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Cosmopolitan!' } },
	['bm_daiquiri'] 		= { label = 'Daiquiri', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_daiquiri`, 		pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Daiquiri!' } },
	['bm_martini'] 			= { label = 'Martini', 			weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_tequila`, 			pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Martini!' } },
	['bm_kahlua'] 			= { label = 'Kahlua', 			weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_tequila`, 			pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Kahlua!' } },
	['bm_mimosa'] 			= { label = 'Mimosa', 			weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_cocktail`, 		pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Mimosa!' } },
	['bm_whiskeysour'] 		= { label = 'Whiskey Sour', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_drink_whisky`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You qdrunk a Whiskey Sour!' } }, 
	['bm_bluelagoon'] 		= { label = 'Blue Lagoon', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_mojito`, 			pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Blue Lagoon!' } },
	['bm_budlite'] 			= { label = 'Bud Lite', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pint_glass_01`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You quenched your thirst with a Bud Lite!' } },
	['bm_millerlite'] 		= { label = 'Miller Lite', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pint_glass_01`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You quenched your thirst with a Miller Lite!' } },
	['bm_coorslite'] 		= { label = 'BCoors Lite', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pint_glass_01`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You quenched your thirst with Coors Lite!'} },
	['bm_corona'] 			= { label = 'Corona',	 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pint_glass_01`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You quenched your thirst with cola' } },
	['bm_tequilashot'] 		= { label = 'Tequila Shot', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) },	usetime = math.random(3000, 5000), notification = 'You took a shot of Tequila!' } }, 
	['bm_whiskeyshot'] 		= { label = 'Whiskey Shot', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) }, 	usetime = math.random(3000, 5000), notification = 'You took a shot of Whiskey!' } },
	['bm_seabreezeshot'] 	= { label = 'Seabreeze Shot', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) }, 	usetime = math.random(3000, 5000), notification = 'You drank a shot of Sea Breeze!' } },
	['bm_caipirinhashot'] 	= { label = 'Caipirinha Shot', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) }, 	usetime = math.random(3000, 5000), notification = 'You drank a Caipirinha Shot!' } }, 
    ['bm_jelloshot']        = { label = 'Jello Shot', 		weight = 80,        client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) }, 	usetime = math.random(3000, 5000), notification = 'You drank a Jello Shot!' } },
	
	-- Bahama Mama's Food Items
	['bm_wings'] 			= { label = 'Jerk Chicken Wings', 	weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate delicious Jerk Chicken Wings' } },
	['bm_rissole'] 			= { label = 'Chicken Rissole', 		weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate delicious Chicken Rissole' } },
	['bm_mgocake'] 			= { label = 'Mango Cheesecake', 	weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate a delicious Mango Cheesecake' } },
	['bm_caridea'] 			= { label = 'Shrimp Caridean', 		weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate delicious Shrimp Caridean' } },
	['bm_kebab'] 			= { label = 'BBQ Beef Kebab', 		weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate a delicious BBQ Beef Kebab' } },
	['bm_nachos'] 			= { label = 'Guac Nachos', 			weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate some delicious Guacamole Nachos' } },


-- Add below to ox_inventory/modules/items/client.lua 

-- Add the Drunk Effects near the other local functions near the top.

local alcoholCount = 0

local function HvyDrunkEffect()
    local ped = PlayerPedId()
    if IsPedWalking(player) or IsPedRunning(player) then
        SetPedToRagdollWithFall(ped, 2500, 4000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    Wait(8000)
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Citizen.Wait(0) end
    DoScreenFadeOut(1500)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
    Wait(2000)
    SetTimecycleModifier('spectator5')
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(ped, 'MOVE_M@DRUNK@VERYDRUNK', true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    SetPedAccuracy(GetPlayerPed(-1), 0)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 1.10)
    Wait(2000)
    DoScreenFadeIn(1800)
    if IsPedWalking(player) or IsPedRunning(player) then
        SetPedToRagdollWithFall(ped, 2500, 4000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.20)
    Wait(2000)            
    Wait(2*60000) -- 2 mins (you may change the effect time here)
    DoScreenFadeOut(1400)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 1.10)
    Wait(2000)  
    DoScreenFadeIn(1200)
    if IsPedWalking(player) or IsPedRunning(player) then
        SetPedToRagdollWithFall(ped, 2500, 4000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.05)
    Wait(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end

function LightDrunkEffect()
    local player = PlayerPedId()
    Wait(3000)
    DoScreenFadeOut(1000)
    Wait(1000)
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Citizen.Wait(0) end
    SetTimecycleModifier('spectator5')
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(player, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    SetPedAccuracy(GetPlayerPed(-1), 0)
    DoScreenFadeIn(1000)
    if IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
    end
    Wait(2000)
    if (60 >= math.random(1,100)) and IsPedRunning(player) then
        SetPedToRagdollWithFall(ped, 2500, 4000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end            
    Wait(1*60000) -- 1 mins
    if IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
    end
    Wait(2000)
    if (30 >= math.random(1,100)) and IsPedRunning(player) then
        SetPedToRagdollWithFall(ped, 1500, 3000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    DoScreenFadeOut(1000)
    Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end

-- Add below items near the other clientside item use
-----------------------------------------------------------------------------------------------
-- Clientside item use functions
-----------------------------------------------------------------------------------------------

Item('bm_oldfashion', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_pinacolada', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_cosmopolitan', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_daiquiri', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_martini', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_kahlua', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_mimosa', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_whiskeysour', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_bluelagoon', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_tequilashot', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then HvyDrunkEffect() end 
	end)
end)
Item('bm_whiskeyshot', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then HvyDrunkEffect() end 
	end)
end)
Item('bm_seabreezeshot', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then HvyDrunkEffect() end 
	end)
end)
Item('bm_caipirinhashot', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then HvyDrunkEffect() end 
	end)
end)
Item('bm_jelloshot', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then HvyDrunkEffect() end 
	end)
end)
Item('bm_budlite', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_millerlite', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_coorslite', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
Item('bm_corona', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then 
			alcoholCount = alcoholCount + 1

			if alcoholCount > 2 and alcoholCount < 4 then
				LightDrunkEffect() 
			elseif alcoholCount >= 4 then
				HvyDrunkEffect()
			end
		end
	end)
end)
