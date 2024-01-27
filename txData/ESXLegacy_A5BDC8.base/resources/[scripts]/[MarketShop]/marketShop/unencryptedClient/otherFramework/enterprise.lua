if string.lower(FrameWork) ~= "other" then 
	return
end

local PlayerJob = {}
local onDuty = false

--local QBCore = exports['qb-core']:GetCoreObject()


---------------------------------------------------------
-- Function To check if the player work at supermarket --
---------------------------------------------------------
function IsMarketEmployee()
	local isMarketEmployee = false
	if PlayerJob.name == 'supermarket' then
		isMarketEmployee = true
	end
	return isMarketEmployee, onDuty
end

--------------------------------------------------------------------
-- Function To check if the player is the boss of the supermarket --
--------------------------------------------------------------------
function IsPatron()
	aff("IsPatron : "..tostring(PlayerJob.isboss))
	return PlayerJob.isboss
end


----------------------------------------
-- Client side on/off duty management --
----------------------------------------
RegisterNetEvent("marketShop:SetDutyStatus")
AddEventHandler('marketShop:SetDutyStatus', function()
	onDuty = not onDuty
    TriggerServerEvent("QBCore:ToggleDuty")
end)






---------------------------------------------------------------------------------
-- All event below are QB relative, but i let it their to remind you to manage --
-- disconnection / connection and job changing                                 --
---------------------------------------------------------------------------------
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
	aff("^4-----------OnJobUpdate-----------^7 "..tostring(JobInfo.name))
    PlayerJob = JobInfo
    if PlayerJob.name == 'supermarket' then
        onDuty = PlayerJob.onduty
        if PlayerJob.onduty then
            TriggerServerEvent("marketShop:AddActifEmployee")
        else
            TriggerServerEvent("marketShop:RemoveActifEmployee")
        end
    end
end)



RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    if PlayerJob.name == 'supermarket' and duty ~= onDuty then
        if duty then
            TriggerServerEvent("marketShop:AddActifEmployee")
        else
            TriggerServerEvent("marketShop:RemoveActifEmployee")
        end
    end

    onDuty = duty
end)



RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()

    CreateThread(function()
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            onDuty = PlayerData.job.onduty
            
            if PlayerJob.name == 'supermarket' and onDuty then
                TriggerServerEvent("marketShop:AddActifEmployee", PlayerJob.name)
            end
        end)
		TriggerServerEvent("marketShop:getAllLockStatus")
		TriggerServerEvent("marketShop:getAllAutoLockStatus")
    end)
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        PlayerJob = QBCore.Functions.GetPlayerData().job
		onDuty = PlayerJob.onduty
		for k,v in pairs(PlayerJob) do
			aff("k : "..tostring(k).." v: "..tostring(v))
		end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    if PlayerJob.name == 'supermarket' and onDuty then
        TriggerServerEvent("marketShop:RemoveActifEmployee", PlayerJob.name)
    end
end)