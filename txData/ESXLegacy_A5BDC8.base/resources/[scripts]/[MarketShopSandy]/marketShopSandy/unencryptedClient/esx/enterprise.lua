



if string.lower(FrameWork) ~= "es" and string.lower(FrameWork) ~= "esx" then 
	return
end

local ESX = nil

local PlayerJob = {}
local onDuty = true

if string.lower(JobManagement) == "esx_society" then

	Citizen.CreateThread(function()
	   while ESX == nil do
		  ESX = exports['es_extended']:getSharedObject()
		  Citizen.Wait(0)
		  if not ESX then 
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  end
	   end

	   while ESX.GetPlayerData().job == nil do
		  Citizen.Wait(10)
	   end
	 
	   ESX.PlayerData = ESX.GetPlayerData()
	   PlayerJob = ESX.GetPlayerData().job
		-- aff("PlayerJob : "..tostring(PlayerJob))
		-- for k,v in pairs(PlayerJob) do
			-- aff("k : "..tostring(k).." v: "..tostring(v))
		-- end
		-- aff("---------")
	   LocalOwner = ESX.PlayerData.identifier
	 
	   -- if Config.LoadIPLHouseOnStart == true then 
		  -- FreezeEntityPosition(GetPlayerPed(-1), true)
	   -- end
	end)


	RegisterNetEvent('marketShopSandy:OpenEsxEmployee')
	AddEventHandler('marketShopSandy:OpenEsxEmployee', function(job)
		OpenMarketActionsMenu()

	end)



	function OpenMarketActionsMenu()
		aff("OpenMarketActionsMenu")
		local elements = {
			{ unselectable = true, icon = "fas fa-shirt", title = "Super Market Actions" }
			-- { icon = "fas fa-shirt", title = TranslateCap('cloakroom'), value = 'cloakroom' }
		}

		if ESX.PlayerData.job.grade_name == 'boss' then
			elements[#elements + 1] = {
				icon = "fa-solid fa-shop",
				title = TRAD['Trad-bossactions'],
				value = 'boss_actions'
			}
		end

		ESX.OpenContext("right", elements, function(menu, element)
			if element.value == 'boss_actions' then
				TriggerEvent('esx_society:openBossMenu', 'supermarketsandy', function(data, menu)
					menu.close()
				end, { wash = false })
			end
		end)
	end



	function IsMarketEmployee()
		local isMarketEmployee = false
		-- aff("IsMarketEmployee : "..tostring(PlayerJob.name))
		
		-- for k,v in pairs(PlayerJob) do
			-- aff("k : "..tostring(k).." v: "..tostring(v))
		
		
		-- end
		-- aff("---------")
		
		if PlayerJob.name == 'supermarketsandy' then
			isMarketEmployee = true
		end
		return isMarketEmployee, true
	end

	function IsPatron()
		aff("IsPatron : "..tostring(PlayerJob.grade_name))
		if PlayerJob.grade_name == 'boss' and PlayerJob.name == 'supermarketsandy' then
			return true
		else
			return false
		end
	end

	RegisterNetEvent('esx:setJob')
	AddEventHandler('esx:setJob', function(job)
		aff("esx:setJob : "..tostring(PlayerJob.grade_name).."-"..tostring(PlayerJob.name))
	   ESX.PlayerData.job = job
	   PlayerJob = job
	end)
	-- QBCore:ToggleDuty --pour mettre duty on

	RegisterNetEvent("marketShopSandy:SetDutyStatus")
	AddEventHandler('marketShopSandy:SetDutyStatus', function()
		onDuty = true
		TriggerServerEvent("QBCore:ToggleDuty")
	end)


	AddEventHandler('onResourceStart', function(resource)
		if GetCurrentResourceName() == resource then
			Citizen.Wait(1000)
			ESX.PlayerData = ESX.GetPlayerData()
			PlayerJob = ESX.GetPlayerData().job
			-- PlayerJob = QBCore.Functions.GetPlayerData().job
			-- onDuty = PlayerJob.onduty
			for k,v in pairs(PlayerJob) do
				aff("k : "..tostring(k).." v: "..tostring(v))
			end
		end
	end)



	RegisterNetEvent('esx:playerLoaded')
	AddEventHandler('esx:playerLoaded', function(xPlayer)
		CreateThread(function()
			Wait(1000)
			while ESX.GetPlayerData().job == nil do
				Citizen.Wait(10)
			end
		 
			ESX.PlayerData = ESX.GetPlayerData()
			PlayerJob = ESX.GetPlayerData().job
			
			TriggerServerEvent("marketShopSandy:getAllLockStatus")
			TriggerServerEvent("marketShopSandy:getAllAutoLockStatus")
		end)
	end)

end


if string.lower(JobManagement) == "bcs_companymanager" then

	Citizen.CreateThread(function()
	   while ESX == nil do
		  ESX = exports['es_extended']:getSharedObject()
		  Citizen.Wait(0)
		  if not ESX then 
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  end
	   end

	   while ESX.GetPlayerData().job == nil do
		  Citizen.Wait(10)
	   end
	 
	   ESX.PlayerData = ESX.GetPlayerData()
	   PlayerJob = ESX.GetPlayerData().job
		-- aff("PlayerJob : "..tostring(PlayerJob))
		-- for k,v in pairs(PlayerJob) do
			-- aff("k : "..tostring(k).." v: "..tostring(v))
		-- end
		-- aff("---------")
	   LocalOwner = ESX.PlayerData.identifier
	 
	   -- if Config.LoadIPLHouseOnStart == true then 
		  -- FreezeEntityPosition(GetPlayerPed(-1), true)
	   -- end
	end)


	RegisterNetEvent('marketShopSandy:OpenEsxEmployee')
	AddEventHandler('marketShopSandy:OpenEsxEmployee', function(job)
		-- OpenMarketActionsMenu()
		TriggerEvent('CompanyManager:company:openBossMenu')
	end)

	
	function IsMarketEmployee()
		local isMarketEmployee = false

		
		if PlayerJob.name == 'supermarketsandy' then
			isMarketEmployee = true
		end
		return isMarketEmployee, true
	end
	
	RegisterNetEvent('esx:setJob')
	AddEventHandler('esx:setJob', function(job)
		aff("esx:setJob : "..tostring(PlayerJob.grade_name).."-"..tostring(PlayerJob.name))
	   ESX.PlayerData.job = job
	   PlayerJob = job
	end)
	-- QBCore:ToggleDuty --pour mettre duty on

	RegisterNetEvent("marketShopSandy:SetDutyStatus")
	AddEventHandler('marketShopSandy:SetDutyStatus', function()
		onDuty = true
		TriggerServerEvent("QBCore:ToggleDuty")
	end)


	AddEventHandler('onResourceStart', function(resource)
		if GetCurrentResourceName() == resource then
			Citizen.Wait(1000)
			ESX.PlayerData = ESX.GetPlayerData()
			PlayerJob = ESX.GetPlayerData().job
			-- PlayerJob = QBCore.Functions.GetPlayerData().job
			-- onDuty = PlayerJob.onduty
			for k,v in pairs(PlayerJob) do
				aff("k : "..tostring(k).." v: "..tostring(v))
			end
		end
	end)


	RegisterNetEvent('esx:playerLoaded')
	AddEventHandler('esx:playerLoaded', function(xPlayer)
		CreateThread(function()
			Wait(1000)
			while ESX.GetPlayerData().job == nil do
				Citizen.Wait(10)
			end
		 
			ESX.PlayerData = ESX.GetPlayerData()
			PlayerJob = ESX.GetPlayerData().job
			
			TriggerServerEvent("marketShopSandy:getAllLockStatus")
			TriggerServerEvent("marketShopSandy:getAllAutoLockStatus")
			Wait(2000)
			
			RefreshGigzEntitySet()
		end)
	end)
end