ESX = nil
PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
    if Config.Framework.ESX == "legacy" then
      ESX = exports[Config.Framework.FrameworkExport]:getSharedObject()
    else
		  TriggerEvent(Config.Framework.getSharedObject, function(obj) ESX = obj end)
		  Citizen.Wait(0)
    end
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()

  while not ESX.IsPlayerLoaded() do
    Wait(500)
  end
end)

local cfg = Config.Target
local Interactions = Config.Interactions

RegisterNetEvent('ap-addonjob:notify')
AddEventHandler('ap-addonjob:notify', function(msg)
	AddonJobNotify(msg)
end)

AddonJobNotify = function(msg)
  ESX.ShowNotification(msg)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer, isNew, skin)
  PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

checkJob = function(name, grade)
  if not PlayerData then return false end
  if not PlayerData.job then return false end
  if grade ~= nil then
    if PlayerData.job.name == name and PlayerData.job.grade >= tonumber(grade) then
      return true
    end
  else
    if PlayerData.job.name == name then
      return true
    end
  end
  return false   
end

GetIdentifier = function()
  return PlayerData.identifier
end

GetPlayerSource = function()
  return PlayerData.source
end

Citizen.CreateThread(function()
  UtilisePeds()
end)

UtilisePeds = function()
  ESX.TriggerServerCallback('ap-addonjob:getJobsFromDatabase', function(data)
    for k, v in pairs(data) do
      if v.enable == "true" then
        SetupPedLocation({coords = v.coords, pedModel = v.ped, job = v.job, joblabel = v.joblabel})
      end
    end
  end)
end

SetupPedLocation = function(data)
  local hash = GetHashKey(data.pedModel)
  
  while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(0)
  end

  local ent = CreatePed(0, hash, data.coords.x, data.coords.y, data.coords.z, data.coords.h, false, false)
  
  FreezeEntityPosition(ent,true)
  TaskSetBlockingOfNonTemporaryEvents(ent,true)
  SetEntityInvincible(ent,true)

  SetupPeds[data.job] = {
    coords = data.coords,
    ped = data.pedModel,
    job = data.job,
    entity = ent
  }

  if Config.Interactions.fivem_target then
    exports["fivem-target"]:AddTargetLocalEntity({
      name = "job_reception",
      label = data.joblabel..' Reception',
      icon = "fas fa-sign-in-alt",
      entId = ent,
      interactDist = 2,
      onInteract = function(zoneName,actionName,vars)
        if actionName == 'getJobReception' then
          TriggerEvent('ap-addonjob:client:publicMenu', {args = {job = data.job}})
        end
      end,
      options = {
        {
          name = "getJobReception",
          label = 'Open'
        },
      }
    })
  elseif Config.Interactions.qTarget then
    exports['qtarget']:AddTargetEntity(ent, {
      options = {
        { 
          event = "ap-addonjob:client:publicMenu", 
          icon = 'fas fa-sign-in-alt',
          label = data.joblabel..' Reception',
          args = {job = data.job}
        }
      },
      distance = 2.5,
    })
  elseif Config.Interactions.OX then
    exports["ox_target"]:addLocalEntity(ent, {{
      name = 'job_reception',
      event = 'ap-addonjob:client:publicMenu',
      icon = 'fa-solid fa-sign-in-alt',
      label = data.joblabel..' Reception',
      args = {job = data.job}
    }})
  end
end




