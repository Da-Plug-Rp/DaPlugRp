



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


	RegisterNetEvent('marketShop:OpenEsxEmployee')
	AddEventHandler('marketShop:OpenEsxEmployee', function(job)
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
				TriggerEvent('esx_society:openBossMenu', 'supermarket', function(data, menu)
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
		
		if PlayerJob.name == 'supermarket' then
			isMarketEmployee = true
		end
		return isMarketEmployee, true
	end

	function IsPatron()
		aff("IsPatron : "..tostring(PlayerJob.grade_name))
		if PlayerJob.grade_name == 'boss' and PlayerJob.name == 'supermarket' then
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

	RegisterNetEvent("marketShop:SetDutyStatus")
	AddEventHandler('marketShop:SetDutyStatus', function()
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
			
			TriggerServerEvent("marketShop:getAllLockStatus")
			TriggerServerEvent("marketShop:getAllAutoLockStatus")
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


	RegisterNetEvent('marketShop:OpenEsxEmployee')
	AddEventHandler('marketShop:OpenEsxEmployee', function(job)
		-- OpenMarketActionsMenu()
		TriggerEvent('CompanyManager:company:openBossMenu')
	end)

	
	function IsMarketEmployee()
		local isMarketEmployee = false

		
		if PlayerJob.name == 'supermarket' then
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

	RegisterNetEvent("marketShop:SetDutyStatus")
	AddEventHandler('marketShop:SetDutyStatus', function()
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
			
			TriggerServerEvent("marketShop:getAllLockStatus")
			TriggerServerEvent("marketShop:getAllAutoLockStatus")
			Wait(2000)
			
			RefreshGigzEntitySet()
		end)
	end)
end