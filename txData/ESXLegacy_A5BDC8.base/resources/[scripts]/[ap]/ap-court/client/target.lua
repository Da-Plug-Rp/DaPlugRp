local cfg = Config.Target
local fivemTarget = Config.Interactions.fivem_target
local qTarget = Config.Interactions.qTarget
local oxTarget = Config.Interactions.ox_target

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
  onstart()
  CourtBlip()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	jobCheck()
end)

RegisterNetEvent('ap-court:notify')
AddEventHandler('ap-court:notify', function(msg)
	ESX.ShowNotification(msg)
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

pedright = function()
  local cfCoords = cfg['fivem-target']['court'].coords
  if cfg['fivem-target']['court'].active == true then
    local hash = GetHashKey('a_f_y_business_02')
  
    while not HasModelLoaded(hash) do
      RequestModel(hash)
      Wait(0)
    end
    
    local ent = CreatePed(5, hash, cfCoords.x, cfCoords.y, cfCoords.z, cfCoords.h, false, false)
  
    FreezeEntityPosition(ent,true)
    TaskSetBlockingOfNonTemporaryEvents(ent,true)
    SetEntityInvincible(ent,true)
    
    exports["fivem-target"]:AddTargetLocalEntity({
        name = "ped_court",
        label = "City Court",
        icon = "fas fa-sign-in-alt",
        entId = ent,
        interactDist = 2.5,
        onInteract = onInteract,
        options = {
          {
            name = "bar_court_one",
            label = "Public Court Cases"
          },
          {
            name = "bar_court_two",
            label = "Appointments"
          },
          {
            name = "bar_court_three",
            label = "Jury Service"
          },
        }  
    })
  end
end

pedleft = function()
  local cfCoords = cfg['fivem-target']['bar'].coords
  if cfg['fivem-target']['bar'].active == true then
    local hash = GetHashKey('a_m_y_business_02')
  
    while not HasModelLoaded(hash) do
      RequestModel(hash)
      Wait(0)
    end
    
    local ent = CreatePed(4, hash, cfCoords.x, cfCoords.y, cfCoords.z, cfCoords.h, false, false)
  
    FreezeEntityPosition(ent,true)
    TaskSetBlockingOfNonTemporaryEvents(ent,true)
    SetEntityInvincible(ent,true)
    
    exports["fivem-target"]:AddTargetLocalEntity({
        name = "ped_bar",
        label = "National Bar Association",
        icon = "fas fa-sign-in-alt",
        entId = ent,
        interactDist = 2.5,
        onInteract = onInteract,
        options = {
          {
            name = "bar_id_one",
            label = "Open Bar"
          }
        }  
    })
  end
end  

judgeTarget = function()
  local cfCoords = cfg['fivem-target']['judge'].coords
  if cfg['fivem-target']['judge'].active == true then
    exports["fivem-target"]:RemoveTargetPoint('judge_bar')
    if checkJob(cfg['fivem-target']['judge'].job.name, cfg['fivem-target']['judge'].job.grade) then
        local options = {
          {
            name = "judge_bar_one",
            label = "Background Checks"
          },
          {
            name = "judge_bar_two",
            label = "Members"
          },
          {
            name = "judge_bar_three",
            label = "Denied Applications"
          },
          {
            name = "judge_bar_four",
            label = "Update Judge Exam"
          },
          {
            name = "judge_App_one",
            label = "Appointment Requests"
          },
          {
            name = "judge_App_two",
            label = "Scheduled Appointments"
          },
          {
            name = "judge_Court_one",
            label = "Create Court Case"
          },
          {
            name = "judge_Court_two",
            label = "Configure Court Cases"
          },
        }  
        if Config.CriminalRecordArchives == true then
          table.insert(options, {name = "criminal_record_one", label = "Search Archives"})
        end
        exports["fivem-target"]:AddTargetPoint({
            name = "judge_bar",
            label = "Bar System",
            icon = "fas fa-sign-in-alt",
            point = cfCoords,
            interactDist = 1.5,
            onInteract = onInteract,
            options = options  
        })
    end
  end
end

judgeCourtTableTarget = function()
  local cfCoords = cfg['fivem-target']['tableCourt'].coords
  if cfg['fivem-target']['tableCourt'].active == true then
    exports["fivem-target"]:RemoveTargetPoint('tableCourt')
    if checkJob(cfg['fivem-target']['tableCourt'].job.name, cfg['fivem-target']['tableCourt'].job.grade) then
      exports["fivem-target"]:AddTargetPoint({
        name = "table_court",
        label = "Judge Table",
        icon = "fas fa-sign-in-alt",
        point = cfCoords,
        interactDist = 2.5,
        onInteract = onInteract,
        options = {
          {
            name = 'judge_system',
            label = 'Case Management'
          },
        }  
      })
    end
  end
end

juryTarget = function()
  local cfCoords = cfg['fivem-target']['juryCourt'].coords
  if cfg['fivem-target']['juryCourt'].active == true then
    exports["fivem-target"]:AddTargetPoint({
      name = "jury_court",
      label = "Jury",
      icon = "fas fa-sign-in-alt",
      point = cfCoords,
      interactDist = 4,
      onInteract = onInteract,
      options = {
        {
          name = 'jury_system',
          label = 'Give Verdict'
        },
      }  
    })
  end
end

onInteract = function(zoneName,actionName,vars)
    if actionName == 'bar_id_one' then
        TriggerServerEvent('ap-court:getBarStatus')
    elseif actionName == 'bar_court_one' then
        TriggerEvent('ap-court:client:courtCases')
    elseif actionName == 'bar_court_two' then
        TriggerServerEvent('ap-court:getAppStatus')
    elseif actionName == 'bar_court_three' then
        TriggerServerEvent('ap-court:getJuryStatus')
    elseif actionName == 'judge_bar_one' then
        TriggerEvent('ap-court:client:backgroundChecks')
    elseif actionName == 'judge_bar_two' then
        TriggerEvent('ap-court:client:barMembers')
    elseif actionName == 'judge_bar_three' then
        TriggerEvent('ap-court:client:barDecMembers')
    elseif actionName == 'judge_bar_four' then
        TriggerEvent('ap-court:client:judgeExamQuestions')        
    elseif actionName == 'criminal_record_one' then
        TriggerEvent('ap-court:client:criminalRecordArc')
    elseif actionName == 'judge_App_one' then
        TriggerEvent('ap-court:client:appointmentRequests')
    elseif actionName == 'judge_App_two' then
        TriggerEvent('ap-court:client:scheduledAppointments')
    elseif actionName == 'judge_Court_one' then
        TriggerEvent('ap-court:client:createCourtCase')
    elseif actionName == 'judge_Court_two' then
        TriggerEvent('ap-court:client:caseConfigureMenu')
    elseif actionName == 'jury_system' then
        TriggerEvent('ap-court:client:verdictMenu')
    elseif actionName == 'judge_system' then
        TriggerEvent('ap-court:client:proManagement')        
    end
end

onstart = function()
  if fivemTarget == true then
    pedright() pedleft() juryTarget() judgeTarget() judgeCourtTableTarget()
  end
end

jobCheck = function()
  if fivemTarget == true then
    judgeTarget()
    judgeCourtTableTarget()
  end
end

RegisterNetEvent('ap-court:target:getAppStatus', function()
	TriggerServerEvent('ap-court:getAppStatus')
end)

RegisterNetEvent('ap-court:target:getJuryStatus', function()
	TriggerServerEvent('ap-court:getJuryStatus')
end)

RegisterNetEvent('ap-court:target:getBarStatus', function()
	TriggerServerEvent('ap-court:getBarStatus')
end)

Citizen.CreateThread(function()
  local qtargetcfg, oxtargetcfg = cfg['qtarget'], cfg['ox-target']
  if qTarget == true then
    if qtargetcfg['bar'].active == true then
      local hash = GetHashKey(qtargetcfg['bar'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

      local sex = 0
      if qtargetcfg['bar'].ped.sex == 'male' then
        sex = 4
      elseif qtargetcfg['bar'].ped.sex == 'female' then
        sex = 5
      end
    
      local ent = CreatePed(sex, hash, qtargetcfg['bar'].coords.x, qtargetcfg['bar'].coords.y, qtargetcfg['bar'].coords.z, qtargetcfg['bar'].coords.h, false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      exports['qtarget']:AddTargetModel({qtargetcfg['bar'].ped.model}, {
        options = {
            {
                event = "ap-court:target:getBarStatus",
                icon = "fas fa-sign-in-alt",
                label = "National Bar Association",
            },
        },
        distance = 2.5,
      })
    end
    if qtargetcfg['court'].active == true then
      local hash = GetHashKey(qtargetcfg['court'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

      local sex = 0
      if qtargetcfg['court'].ped.sex == 'male' then
        sex = 4
      elseif qtargetcfg['court'].ped.sex == 'female' then
        sex = 5
      end
    
      local ent = CreatePed(sex, hash, qtargetcfg['court'].coords.x, qtargetcfg['court'].coords.y, qtargetcfg['court'].coords.z, qtargetcfg['court'].coords.h, false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      exports['qtarget']:AddTargetModel({qtargetcfg['court'].ped.model}, {
        options = {
            {
                event = "ap-court:client:courtCases",
                icon = "fas fa-sign-in-alt",
                label = "Public Court Cases",
            },
            {
              event = "ap-court:target:getAppStatus",
              icon = "fas fa-sign-in-alt",
              label = "Appointments",
            },
            {
              event = "ap-court:target:getJuryStatus",
              icon = "fas fa-sign-in-alt",
              label = "Jury Service",
            },
        },
        distance = 2.5,
      })
    end
    if qtargetcfg['juryCourt'].active == true then
      exports['qtarget']:AddBoxZone(qtargetcfg['juryCourt'].boxzone.name, qtargetcfg['juryCourt'].boxzone.coords, qtargetcfg['juryCourt'].boxzone.length, qtargetcfg['juryCourt'].boxzone.width, {
        name=qtargetcfg['juryCourt'].boxzone.name,
        heading=qtargetcfg['juryCourt'].boxzone.heading,
        debugPoly=qtargetcfg['juryCourt'].boxzone.debugPoly, 
        minZ=qtargetcfg['juryCourt'].boxzone.minZ,
        maxZ=qtargetcfg['juryCourt'].boxzone.maxZ,
        }, {
          options = {
            {
                event = "ap-court:client:verdictMenu",
                icon = "fas fa-sign-in-alt",
                label = "Give Verdict",
            },
          },
        distance = 2.5
      })
    end
    if qtargetcfg['judge'].active == true then
      local input = {
        {
          event = "ap-court:client:backgroundChecks",
          icon = "fas fa-sign-in-alt",
          label = "Background Checks"
        },
        {
          event = "ap-court:client:barMembers",
          icon = "fas fa-sign-in-alt",
          label = "Members"
        },
        {
          event = "ap-court:client:barDecMembers",
          icon = "fas fa-sign-in-alt",
          label = "Denied Applications"
        },
        {
          event = "ap-court:client:judgeExamQuestions",
          icon = "fas fa-sign-in-alt",
          label = "Update Judge Exam"
        },
        {
          event = "ap-court:client:appointmentRequests",
          icon = "fas fa-sign-in-alt",
          label = "Appointment Requests"
        },
        {
          event = "ap-court:client:scheduledAppointments",
          icon = "fas fa-sign-in-alt",
          label = "Scheduled Appointments"
        },
        {
          event = "ap-court:client:createCourtCase",
          icon = "fas fa-sign-in-alt",
          label = "Create Court Case"
        },
        {
          event = "ap-court:client:caseConfigureMenu",
          icon = "fas fa-sign-in-alt",
          label = "Configure Court Cases"
        },
      }  
      if Config.CriminalRecordArchives == true then
        table.insert(input, {event = "ap-court:client:criminalRecordArc", icon = "fas fa-sign-in-alt", label = "Search Archives"})
      end
      exports['qtarget']:AddBoxZone(qtargetcfg['judge'].boxzone.name, qtargetcfg['judge'].boxzone.coords, qtargetcfg['judge'].boxzone.length, qtargetcfg['judge'].boxzone.width, {
        name=qtargetcfg['judge'].boxzone.name,
        heading=qtargetcfg['judge'].boxzone.heading,
        debugPoly=qtargetcfg['judge'].boxzone.debugPoly, 
        minZ=qtargetcfg['judge'].boxzone.minZ,
        maxZ=qtargetcfg['judge'].boxzone.maxZ,
        }, {
          options = input,
        job = {[qtargetcfg['judge'].job.name] = qtargetcfg['judge'].job.grade},
        distance = 2.5
      })
    end
    if qtargetcfg['tableCourt'].active == true then
      exports['qtarget']:AddBoxZone(qtargetcfg['tableCourt'].boxzone.name, qtargetcfg['tableCourt'].boxzone.coords, qtargetcfg['tableCourt'].boxzone.length, qtargetcfg['tableCourt'].boxzone.width, {
        name=qtargetcfg['tableCourt'].boxzone.name,
        heading=qtargetcfg['tableCourt'].boxzone.heading,
        debugPoly=qtargetcfg['tableCourt'].boxzone.debugPoly, 
        minZ=qtargetcfg['tableCourt'].boxzone.minZ,
        maxZ=qtargetcfg['tableCourt'].boxzone.maxZ,
        }, {
          options = {
            {
                event = "ap-court:client:proManagement",
                icon = "fas fa-sign-in-alt",
                label = "Case Management",
            },
          },
        job = {[qtargetcfg['tableCourt'].job.name] = qtargetcfg['tableCourt'].job.grade},
        distance = 2.5
      })
    end
  elseif oxTarget == true then
    if oxtargetcfg['bar'].active == true then
      local hash = GetHashKey(oxtargetcfg['bar'].ped)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end
    
      local ent = CreatePed(0, hash, oxtargetcfg['bar'].coords[1], oxtargetcfg['bar'].coords[2], oxtargetcfg['bar'].coords[3], oxtargetcfg['bar'].coords[4], false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local input = {
        {
          name = "getBarStatus",
          event = "ap-court:target:getBarStatus",
          icon = "fa-solid fa-sign-in-alt",
          label = "National Bar Association",
        },
      }

      exports["ox_target"]:addLocalEntity(ent, input)
    end
    if oxtargetcfg['court'].active == true then
      local hash = GetHashKey(oxtargetcfg['court'].ped)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end
    
      local ent = CreatePed(0, hash, oxtargetcfg['court'].coords[1], oxtargetcfg['court'].coords[2], oxtargetcfg['court'].coords[3], oxtargetcfg['court'].coords[4], false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local input = {
        {
          name = "courtCases",
          event = "ap-court:client:courtCases",
          icon = "fa-solid fa-sign-in-alt",
          label = "Public Court Cases",
        },
        {
          name = "getAppStatus",
          event = "ap-court:target:getAppStatus",
          icon = "fa-solid fa-sign-in-alt",
          label = "Appointments",
        },
        {
          name = "getJuryStatus",
          event = "ap-court:target:getJuryStatus",
          icon = "fa-solid fa-sign-in-alt",
          label = "Jury Service",
        },
      }
      
      exports["ox_target"]:addLocalEntity(ent, input)
    end
    if oxtargetcfg['juryCourt'].active == true then
      exports.ox_target:addBoxZone({
        coords=oxtargetcfg['juryCourt'].coords,
        size=oxtargetcfg['juryCourt'].size,
        rotation=oxtargetcfg['juryCourt'].rotation, 
        debug=false,
        drawSprite=true,
        options = {
          {
            name = "verdictMenu",
            event = "ap-court:client:verdictMenu",
            icon = "fa-solid fa-sign-in-alt",
            label = "Give Verdict",
          },
        }
      })
    end
    if oxtargetcfg['judge'].active == true then
      local input = {
        {
          name = "backgroundChecks",
          event = "ap-court:client:backgroundChecks",
          icon = "fa-solid fa-sign-in-alt",
          label = "Background Checks",
          groups = oxtargetcfg['judge'].job
        },
        {
          name = "barMembers",
          event = "ap-court:client:barMembers",
          icon = "fa-solid fa-sign-in-alt",
          label = "Members",
          groups = oxtargetcfg['judge'].job
        },
        {
          name = "barDecMembers",
          event = "ap-court:client:barDecMembers",
          icon = "fa-solid fa-sign-in-alt",
          label = "Denied Applications",
          groups = oxtargetcfg['judge'].job
        },
        {
          name = "judgeExamQuestions",
          event = "ap-court:client:judgeExamQuestions",
          icon = "fa-solid fa-sign-in-alt",
          label = "Update Judge Exam",
          groups = oxtargetcfg['judge'].job
        },
        {
          name = "appointmentRequests",
          event = "ap-court:client:appointmentRequests",
          icon = "fa-solid fa-sign-in-alt",
          label = "Appointment Requests",
          groups = oxtargetcfg['judge'].job
        },
        {
          name = "scheduledAppointments",
          event = "ap-court:client:scheduledAppointments",
          icon = "fa-solid fa-sign-in-alt",
          label = "Scheduled Appointments",
          groups = oxtargetcfg['judge'].job
        },
        {
          name = "createCourtCase",
          event = "ap-court:client:createCourtCase",
          icon = "fa-solid fa-sign-in-alt",
          label = "Create Court Case",
          groups = oxtargetcfg['judge'].job
        },
        {
          name = "caseConfigureMenu",
          event = "ap-court:client:caseConfigureMenu",
          icon = "fa-solid fa-sign-in-alt",
          label = "Configure Court Cases",
          groups = oxtargetcfg['judge'].job
        },
      }  
      if Config.CriminalRecordArchives == true then
        table.insert(input, {name = "criminalRecordArc", event = "ap-court:client:criminalRecordArc", icon = "fa-solid fa-sign-in-alt", label = "Search Archives", groups = oxtargetcfg['judge'].job})
      end
      exports.ox_target:addBoxZone({
        coords=oxtargetcfg['judge'].coords,
        size=oxtargetcfg['judge'].size,
        rotation=oxtargetcfg['judge'].rotation, 
        debug=false,
        drawSprite=true,
        options = input
      })
    end
    if oxtargetcfg['tableCourt'].active == true then
      exports.ox_target:addBoxZone({
        coords=oxtargetcfg['tableCourt'].coords,
        size=oxtargetcfg['tableCourt'].size,
        rotation=oxtargetcfg['tableCourt'].rotation, 
        debug=false,
        drawSprite=true,
        options = {
          {
            name = "proManagement",
            event = "ap-court:client:proManagement",
            icon = "fa-solid fa-sign-in-alt",
            label = "Case Management",
            groups = oxtargetcfg['judge'].job
          },
        }
      })
    end
  end
end)

local CourtControlPress = 0

Citizen.CreateThread(function()
  local dcfg = cfg['DrawText']
  if Config.Interactions.drawText then
    for k,v in pairs(dcfg['points']) do
      local courtCombo = BoxZone:Create(vector3(v.pos.x, v.pos.y, v.pos.z), v.length, v.width, {
        name = 'court'..k,
        heading = v.heading,
        minZ = v.pos.z - 1,
        maxZ = v.pos.z + 1,
        debugPoly = false
      })
      courtCombo:onPlayerInOut(function(isPointInside)
          if isPointInside then
            if v.enable then
              if v.job.check then
                if checkJob(v.job.name, v.job.grade) then
                  TriggerEvent('cd_drawtextui:ShowUI', 'show', v.text)
                  courtFunctionDraw(v)
                  CourtControlPress = k
                end
              else
                TriggerEvent('cd_drawtextui:ShowUI', 'show', v.text)
                courtFunctionDraw(v)
                CourtControlPress = k
              end
            end
          else
            CourtControlPress = 0
            TriggerEvent('cd_drawtextui:HideUI')
          end
      end)
    end
  end
end)

courtFunctionDraw = function(v)
  CreateThread(function()
    while CourtControlPress ~= 0 do
      if IsControlPressed(0, 38) then
        TriggerEvent('cd_drawtextui:HideUI')
        if v.isServer == true then
          TriggerServerEvent(v.trigger)
        else
          TriggerEvent(v.trigger)
        end
      end
      Wait(0)
    end
  end)
end

function CourtBlip()
  local blips = Config.Blip
	if blips.Active == true then
		local blip = AddBlipForCoord(blips.Coords)
		SetBlipSprite (blip, blips.Sprite)
		SetBlipDisplay(blip, blips.Display)
		SetBlipScale  (blip, blips.Scale)
		SetBlipColour (blip, blips.Color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(blips.Label)
		EndTextCommandSetBlipName(blip)
	end
end

local menucheck = Config.Context

RegisterNetEvent('ap-court:client:drawtext:court', function()
  if menucheck.ZF then
    local courtMainDrawtextOne = ContextMenu({
      {
        id = 0,
        header = "Public Court Cases",
        txt = "View scheduled court cases.",
        params = {
          isServer = false,
          event = "ap-court:client:courtCases",
          args = {}
        }
      },
      {
        id = 1,
        header = "Appointments",
        txt = "View/Make an appointment.",
        params = {
          isServer = false,
          event = "ap-court:target:getAppStatus",
          args = {}
        }
      },
      {
        id = 2,
        header = "Jury Service",
        txt = "View/Join jury service.",
        params = {
          isServer = false,
          event = "ap-court:target:getJuryStatus",
          args = {}
        }
      },
    })
  elseif menucheck.NH then
    local courtMainDrawtextTwo = ContextMenu({
      {
        header = "Public Court Cases",
        context = "View scheduled court cases.",
        server = false,
        event = "ap-court:client:courtCases",
        args = {}
      },
      {
        header = "Appointments",
        context = "View/Make an appointment.",
        server = false,
        event = "ap-court:target:getAppStatus",
        args = {}
      },
      {
        header = "Jury Service",
        context = "View/Join jury service.",
        server = false,
        event = "ap-court:target:getJuryStatus",
        args = {}
      },
    })
  elseif menucheck.OX then
    lib.registerContext({
			id = 'courtMainDrawtextThree',
			title = "Court Services",
			options = {
        {
          title = "Public Court Cases",
          description = "View scheduled court cases.",
          event = "ap-court:client:courtCases",
          args = {}
        },
        {
          title = "Appointments",
          description = "View/Make an appointment.",
          event = "ap-court:target:getAppStatus",
          args = {}
        },
        {
          title = "Jury Service",
          description = "View/Join jury service.",
          event = "ap-court:target:getJuryStatus",
          args = {}
        }
      }
		})  
		lib.showContext("courtMainDrawtextThree")
  end
end)

RegisterNetEvent('ap-court:client:drawtext:judge', function()
  if menucheck.ZF then
    local judgeMainDrawtextOne = {
      {
        id = 0,
        header = "Background Checks",
        txt = "Approve/deny bar applications background checks.",
        params = {
          isServer = false,
          event = "ap-court:client:backgroundChecks",
          args = {}
        }
      },
      {
        id = 1,
        header = "Bar Members",
        txt = "View/Remove bar members.",
        params = {
          isServer = false,
          event = "ap-court:client:barMembers",
          args = {}
        }
      },
      {
        id = 2,
        header = "Denied Applications",
        txt = "View/Reissue denied applications.",
        params = {
          isServer = false,
          event = "ap-court:client:barDecMembers",
          args = {}
        }
      },
      {
        id = 3,
        header = "Update Judge Exam",
        txt = "View/Change the judge exam.",
        params = {
          isServer = false,
          event = "ap-court:client:judgeExamQuestions",
          args = {}
        }
      },
      {
        id = 4,
        header = "Appointment Requests",
        txt = "View/Issue appointment requests.",
        params = {
          isServer = false,
          event = "ap-court:client:appointmentRequests",
          args = {}
        }
      },
      {
        id = 5,
        header = "Scheduled Appointments",
        txt = "View/Close scheduled appointments.",
        params = {
          isServer = false,
          event = "ap-court:client:scheduledAppointments",
          args = {}
        }
      },
      {
        id = 6,
        header = "Create Court Case",
        txt = "Make a court case.",
        params = {
          isServer = false,
          event = "ap-court:client:createCourtCase",
          args = {}
        }
      },
      {
        id = 7,
        header = "Configure Court Cases",
        txt = "View/Change current court cases.",
        params = {
          isServer = false,
          event = "ap-court:client:caseConfigureMenu",
          args = {}
        }
      },
    }
    if Config.CriminalRecordArchives == true then
      table.insert(judgeMainDrawtextOne, {
        id = 8,
        header = "Search Archives",
        txt = "Check a players criminal history.",
        params = {
          isServer = false,
          event = "ap-court:client:criminalRecordArc",
          args = {}
        }
      })
    end
    ContextMenu(judgeMainDrawtextOne)
  elseif menucheck.NH then
    local judgeMainDrawtextTwo = {
      {
        header = "Background Checks",
        context = "Approve/deny bar applications background checks.",
        server = false,
        event = "ap-court:client:backgroundChecks",
        args = {}
      },
      {
        header = "Bar Members",
        context = "View/Remove bar members.",
        server = false,
        event = "ap-court:client:barMembers",
        args = {}
      },
      {
        header = "Denied Applications",
        context = "View/Reissue denied applications.",
        server = false,
        event = "ap-court:client:barDecMembers",
        args = {}
      },
      {
        header = "Update Judge Exam",
        context = "View/Change the judge exam.",
        server = false,
        event = "ap-court:client:judgeExamQuestions",
        args = {}
      },
      {
        header = "Appointment Requests",
        context = "View/Issue appointment requests.",
        server = false,
        event = "ap-court:client:appointmentRequests",
        args = {}
      },
      {
        header = "Scheduled Appointments",
        context = "View/Close scheduled appointments.",
        server = false,
        event = "ap-court:client:scheduledAppointments",
        args = {}
      },
      {
        header = "Create Court Case",
        context = "Make a court case.",
        server = false,
        event = "ap-court:client:createCourtCase",
        args = {}
      },
      {
        header = "Configure Court Cases",
        context = "View/Change current court cases.",
        server = false,
        event = "ap-court:client:caseConfigureMenu",
        args = {}
      },
    }
    if Config.CriminalRecordArchives == true then
      table.insert(judgeMainDrawtextTwo, {
        header = "Search Archives",
        context = "Check a players criminal history.",
        server = false,
        event = "ap-court:client:criminalRecordArc",
        args = {}
      })
    end
    ContextMenu(judgeMainDrawtextTwo)
  elseif menucheck.OX then
    local judgeMainDrawtextThree = {
      {
        title = "Background Checks",
        description = "Approve/deny bar applications background checks.",
        event = "ap-court:client:backgroundChecks",
        args = {}
      },
      {
        title = "Bar Members",
        description = "View/Remove bar members.",
        event = "ap-court:client:barMembers",
        args = {}
      },
      {
        title = "Denied Applications",
        description = "View/Reissue denied applications.",
        event = "ap-court:client:barDecMembers",
        args = {}
      },
      {
        title = "Update Judge Exam",
        description = "View/Change the judge exam.",
        event = "ap-court:client:judgeExamQuestions",
        args = {}
      },
      {
        title = "Appointment Requests",
        description = "View/Issue appointment requests.",
        event = "ap-court:client:appointmentRequests",
        args = {}
      },
      {
        title = "Scheduled Appointments",
        description = "View/Close scheduled appointments.",
        event = "ap-court:client:scheduledAppointments",
        args = {}
      },
      {
        title = "Create Court Case",
        description = "Make a court case.",
        event = "ap-court:client:createCourtCase",
        args = {}
      },
      {
        title = "Configure Court Cases",
        description = "View/Change current court cases.",
        event = "ap-court:client:caseConfigureMenu",
        args = {}
      },
    }
    if Config.CriminalRecordArchives == true then
      table.insert(judgeMainDrawtextThree, {
        title = "Search Archives",
        description = "Check a players criminal history.",
        event = "ap-court:client:criminalRecordArc",
        args = {}
      })
    end
    lib.registerContext({
			id = 'judgeMainDrawtextThree',
			title = "Judge Menu",
			options = judgeMainDrawtextThree
		})  
		lib.showContext("judgeMainDrawtextThree")
  end
end)