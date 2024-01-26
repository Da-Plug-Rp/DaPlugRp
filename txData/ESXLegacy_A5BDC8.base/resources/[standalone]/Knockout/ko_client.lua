--[[ ====================================================================================================================================

			DELTA DISTRICT

			Simple Knockout
				by Cosmo

]]-- ====================================================================================================================================

local ko = {active=false, ped=0, prev=200, health=200, damage=0, timer=0, reducing=false}

RegisterNetEvent("ko:helpPlayer")
AddEventHandler("ko:helpPlayer", function(sender)
	if #(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(sender)))-GetEntityCoords(ko.ped)) < 10.0 then
		ko.active=false
		ko.timer=0
		ko.damage=0
		SetPedToRagdoll(ko.ped, 100, 100, 0, 0, 0, 0)
		if KO_Config.blackOutScreen then DoScreenFadeIn(8000) end
	end
end)

function KnockoutPlayer(length)
	ko.timer=length
	ko.active=true
	SetPedToRagdoll(ko.ped, 6000, 6000, 0, 0, 0, 0)
	ShowNotification("~r~You were knocked out!")
	if KO_Config.blackOutScreen then DoScreenFadeOut(1000) end
	Citizen.CreateThread(function()
		while ko.active do
			Wait(5000)
			ko.timer=ko.timer-5
			if ko.timer<=0 then
				if KO_Config.blackOutScreen then DoScreenFadeIn(10000) end
				ko.damage=0
				ko.active=false
			else
				SetPedToRagdoll(ko.ped, 6000, 6000, 0, 0, 0, 0)
				ResetPedRagdollTimer(ko.ped)
			end
		end
	end)
end

function ReduceDamage()
	if not ko.reducing and KO_Config.reduceDamageAmount>0 then
		ko.reducing=true
		Citizen.CreateThread(function()
			while ko.damage > 0 do
				Wait(5000)
				ko.damage=ko.damage-KO_Config.reduceDamageAmount if ko.damage<0 then ko.damage=0 end
				--ShowNotification("~r~DEBUG Reduced: "..ko.damage)
			end
			ko.reducing=false
		end)
	end
end

Citizen.CreateThread(function()
	ko.ped = GetPlayerPed(-1)
	SetEntityMaxHealth(ko.ped, 200)
	while true do
		Wait(1)
		ko.ped = GetPlayerPed(-1)
		ko.health = GetEntityHealth(ko.ped)

		if ko.active and not KO_Config.blackOutScreen then
			DisablePlayerFiring(PlayerId(), true)
		end

		if ko.active and KO_Config.dieAfterKnockout then
			-- Let player receive damage
		else
			if ko.health<ko.prev then -- Has been damaged
				if HasEntityBeenDamagedByWeapon(ko.ped, 0xA2719263, 0) then -- Fists
					ko.damage=ko.damage+(ko.prev-ko.health) ReduceDamage() --ShowNotification("~r~DEBUG Damage: "..ko.damage)
					ClearPedLastWeaponDamage(ko.ped) SetEntityHealth(ko.ped, ko.prev)
					if ko.damage>KO_Config.maximumDamageKO then KnockoutPlayer(KO_Config.knockoutLengthFist) end
				elseif not KO_Config.fistsOnly then
					if HasEntityBeenDamagedByWeapon(ko.ped, 0, 1) then -- Blunt Melee
						ko.damage=ko.damage+(ko.prev-ko.health) ReduceDamage()
						ClearPedLastWeaponDamage(ko.ped) SetEntityHealth(ko.ped, ko.prev)
						if ko.damage>KO_Config.maximumDamageKO then KnockoutPlayer(KO_Config.knockoutLengthMelee) end
					end
				end
			end
		end
		ko.prev=ko.health
	end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

