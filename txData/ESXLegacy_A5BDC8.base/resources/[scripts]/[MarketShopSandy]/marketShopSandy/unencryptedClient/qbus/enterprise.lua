

if string.lower(FrameWork) ~= "qb" and string.lower(FrameWork) ~= "qbus" and string.lower(FrameWork) ~= "qbcore" then 
	return
end

local PlayerJob = {}
local onDuty = false

local QBCore = exports['qb-core']:GetCoreObject()






function IsMarketEmployee()
	local isMarketEmployee = false
	if PlayerJob.name == 'supermarketsandy' then
		isMarketEmployee = true
	end
	return isMarketEmployee, onDuty
end

function IsPatron()
	aff("IsPatron : "..tostring(PlayerJob.isboss))
	if PlayerJob.name == 'supermarketsandy' then
		
		return PlayerJob.isboss
	else
		return false
	end
end
-- QBCore:ToggleDuty --pour mettre duty on

RegisterNetEvent("marketShopSandy:SetDutyStatus")
AddEventHandler('marketShopSandy:SetDutyStatus', function()
	onDuty = not onDuty
    TriggerServerEvent("QBCore:ToggleDuty")
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





RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
	aff("^4-----------OnJobUpdate-----------^7 "..tostring(JobInfo.name))
    PlayerJob = JobInfo
    if PlayerJob.name == 'supermarketsandy' then
        onDuty = PlayerJob.onduty
        if PlayerJob.onduty then
            TriggerServerEvent("marketShopSandy:AddActifEmployee")
        else
            TriggerServerEvent("marketShopSandy:RemoveActifEmployee")
        end
    end
end)


RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    if PlayerJob.name == 'supermarketsandy' and onDuty then
        TriggerServerEvent("marketShopSandy:RemoveActifEmployee", PlayerJob.name)
    end
	
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    if PlayerJob.name == 'supermarketsandy' and duty ~= onDuty then
        if duty then
            TriggerServerEvent("marketShopSandy:AddActifEmployee")
        else
            TriggerServerEvent("marketShopSandy:RemoveActifEmployee")
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
            
            if PlayerJob.name == 'supermarketsandy' and onDuty then
                TriggerServerEvent("marketShopSandy:AddActifEmployee", PlayerJob.name)
            end
        end)
		TriggerServerEvent("marketShopSandy:getAllLockStatus")
		TriggerServerEvent("marketShopSandy:getAllAutoLockStatus")
		Wait(2000)
		RefreshGigzEntitySet()
    end)
end)

