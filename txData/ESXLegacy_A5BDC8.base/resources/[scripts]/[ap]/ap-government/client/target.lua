local cfg = Config.Target
local fivemTarget = Config.Interactions.fivem_target
local qTarget = Config.Interactions.qTarget
local oxTarget = Config.Interactions.oxTarget

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
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	jobCheck()
end)

RegisterNetEvent('ap-government:notify')
AddEventHandler('ap-government:notify', function(msg)
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

votingPed = function()
  local cfCoords = cfg['fivem-target']['votingSystem']['votingStaff']['ped'].coords
  if cfg['fivem-target']['votingSystem']['votingStaff']['active'] == true then
    local hash = GetHashKey(cfg['fivem-target']['votingSystem']['votingStaff']['ped'].ped.model)
  
    while not HasModelLoaded(hash) do
      RequestModel(hash)
      Wait(0)
    end

    local sex = 0
    if cfg['fivem-target']['votingSystem']['votingStaff']['ped'].ped.sex == 'male' then
      sex = 4
    elseif cfg['fivem-target']['votingSystem']['votingStaff']['ped'].ped.sex == 'female' then
      sex = 5
    end
    
    local ent = CreatePed(sex, hash, cfCoords.x, cfCoords.y, cfCoords.z, cfCoords.h, false, false)
  
    FreezeEntityPosition(ent,true)
    TaskSetBlockingOfNonTemporaryEvents(ent,true)
    SetEntityInvincible(ent,true)
    
    exports["fivem-target"]:AddTargetLocalEntity({
        name = "candidate_applications",
        label = "Candidate Applications",
        icon = "fas fa-sign-in-alt",
        entId = ent,
        interactDist = 2,
        onInteract = function(zoneName,actionName,vars)
          if actionName == 'apply_as_candidate' then
            TriggerEvent('ap-government:client:applyCandidate')
          end
        end,
        options = {
          {
            name = "apply_as_candidate",
            label = "Apply As Candidate"
          },
        }
    })
  end
end

appointmentPed = function()
  local cfCoords = cfg['fivem-target']['appointmentsPed']['ped'].coords
  if cfg['fivem-target']['appointmentsPed']['active'] == true then
    local hash = GetHashKey(cfg['fivem-target']['appointmentsPed']['ped'].ped.model)
  
    while not HasModelLoaded(hash) do
      RequestModel(hash)
      Wait(0)
    end

    local sex = 0
    if cfg['fivem-target']['appointmentsPed']['ped'].ped.sex == 'male' then
      sex = 4
    elseif cfg['fivem-target']['appointmentsPed']['ped'].ped.sex == 'female' then
      sex = 5
    end
    
    local ent = CreatePed(sex, hash, cfCoords.x, cfCoords.y, cfCoords.z, cfCoords.h, false, false)
  
    FreezeEntityPosition(ent,true)
    TaskSetBlockingOfNonTemporaryEvents(ent,true)
    SetEntityInvincible(ent,true)

    local options = {
      {
        name = "mayor_appointments_main",
        label = "Appointments"
      },
    }

    if Config.VotingLaws then
      table.insert(options, {
        name = 'mayor_passed_laws',
        label = 'Passed Laws'
      })
    end
    
    exports["fivem-target"]:AddTargetLocalEntity({
        name = "mayor_appointments",
        label = "Mayor Actions",
        icon = "fas fa-sign-in-alt",
        entId = ent,
        interactDist = 2,
        onInteract = function(zoneName,actionName,vars)
          if actionName == 'mayor_appointments_main' then
            TriggerEvent('ap-government:target:appointmentData')
          elseif actionName == 'mayor_passed_laws' then
            TriggerEvent('ap-government:client:passedLaws')
          end
        end,
        options = options
    })
  end
end

votingStaff = function()
  local cfCoords = cfg['fivem-target']['votingSystem']['votingStaff']['staff'].coords
  if cfg['fivem-target']['votingSystem']['votingStaff']['active'] == true then
    if Config.VotingSettings.Job then
      exports["fivem-target"]:RemoveTargetPoint('voting_staff_target')
      if checkJob(cfg['fivem-target']['votingSystem']['votingStaff']['staff'].job.name, cfg['fivem-target']['votingSystem']['votingStaff']['staff'].job.grade) then
        exports["fivem-target"]:AddTargetPoint({
          name = "voting_staff_target",
          label = "Voting Staff",
          icon = "fas fa-sign-in-alt",
          point = cfCoords,
          interactDist = 1.5,
          onInteract = function(zoneName,actionName,vars)
            if actionName == 'voting_options' then
              TriggerEvent('ap-government:client:staffVotingMenu') 
            end
          end,
          options = {
            {
              name = "voting_options",
              label = "Voting Management"
            },
          } 
        })
      end
    end
  end
end

votingPoints = function()
  if cfg['fivem-target']['votingSystem']['votingPoints']['active'] == true then
    for k, v in pairs(cfg['fivem-target']['votingSystem']['votingPoints']['points']) do
      exports["fivem-target"]:RemoveTargetPoint(v.name)
      exports["fivem-target"]:AddTargetPoint({
        name = v.name,
        label = "Vote Now",
        icon = "fas fa-sign-in-alt",
        point = v.coords,
        interactDist = 0.9,
        onInteract = function(zoneName,actionName,vars)
          if actionName == 'voting_booth' then
            TriggerServerEvent('ap-government:server:isRegistered')
          elseif actionName == 'voting_laws' then
            TriggerEvent('ap-government:client:openLawVoting')
          end
        end,
        options = {
          {
            name = "voting_booth",
            label = "Vote For Candidate"
          },
          {
            name = "voting_laws",
            label = "Vote For Laws"
          }
        } 
      })
    end
  end
end

mayorPoints = function()
  if cfg['fivem-target']['majorOffice']['active'] == true then
    if checkJob(cfg['fivem-target']['majorOffice']['job'].name, cfg['fivem-target']['majorOffice']['job'].grade) then
      for k, v in pairs(cfg['fivem-target']['majorOffice']['points']) do
        if v.active then
          exports["fivem-target"]:RemoveTargetPoint(v.name)
          exports["fivem-target"]:AddTargetPoint({
            name = v.name,
            label = "Mayor Menu",
            icon = "fas fa-sign-in-alt",
            point = v.coords,
            interactDist = 1.2,
            onInteract = function(zoneName,actionName,vars)
              TriggerEvent('ap-government:client:majorOffice')
            end,
            options = {
              {
                name = "mayor_options",
                label = "Mayor Options"
              },
            } 
          })
        end
      end
    end
  end
end

onstart = function()
  if fivemTarget == true then
    votingPed() votingPoints() mayorPoints() votingStaff() appointmentPed()
  end
end

jobCheck = function()
  if fivemTarget == true then
    votingStaff() mayorPoints()
  end
end

RegisterNetEvent('ap-government:target:appointmentData', function()
	TriggerServerEvent('ap-government:server:appointmentData')
end)

RegisterNetEvent('ap-government:target:isRegistered', function()
	TriggerServerEvent('ap-government:server:isRegistered')
end)

Citizen.CreateThread(function()
  local qtargetcfg = cfg['qtarget']
  local oxtargetcfg = cfg['ox-target']
  if qTarget == true then
    if qtargetcfg['votingSystem']['votingStaff']['active'] == true then
      local hash = GetHashKey(qtargetcfg['votingSystem']['votingStaff']['ped'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

      local sex = 0
      if qtargetcfg['votingSystem']['votingStaff']['ped'].ped.sex == 'male' then
        sex = 4
      elseif qtargetcfg['votingSystem']['votingStaff']['ped'].ped.sex == 'female' then
        sex = 5
      end
    
      local ent = CreatePed(sex, hash, qtargetcfg['votingSystem']['votingStaff']['ped'].coords.x, qtargetcfg['votingSystem']['votingStaff']['ped'].coords.y, qtargetcfg['votingSystem']['votingStaff']['ped'].coords.z, qtargetcfg['votingSystem']['votingStaff']['ped'].coords.h, false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local input = {
        { 
          event = "ap-government:client:applyCandidate", 
          icon = 'fas fa-sign-in-alt',
          label = 'Apply As Candidate'
        },
      }

      if Config.VotingSettings.Job then
        table.insert(input, {event = "ap-government:client:staffVotingMenu", icon = 'fas fa-sign-in-alt', label = 'Voting Management', job = {[qtargetcfg['votingSystem']['votingStaff']['ped'].job.name] = qtargetcfg['votingSystem']['votingStaff']['ped'].job.grade}})
      end
      
      exports['qtarget']:AddTargetModel({qtargetcfg['votingSystem']['votingStaff']['ped'].ped.model}, {
        options = input,
        distance = 2.5,
      })
    end
    if qtargetcfg['appointmentsPed']['active'] == true then
      local hash = GetHashKey(qtargetcfg['appointmentsPed']['ped'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

      local sex = 0
      if qtargetcfg['appointmentsPed']['ped'].ped.sex == 'male' then
        sex = 4
      elseif qtargetcfg['appointmentsPed']['ped'].ped.sex == 'female' then
        sex = 5
      end
    
      local ent = CreatePed(sex, hash, qtargetcfg['appointmentsPed']['ped'].coords.x, qtargetcfg['appointmentsPed']['ped'].coords.y, qtargetcfg['appointmentsPed']['ped'].coords.z, qtargetcfg['appointmentsPed']['ped'].coords.h, false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local options = {
        {
          event = "ap-government:target:appointmentData", 
          icon = 'fas fa-sign-in-alt',
          label = 'Mayor Appointments'
        },
      }

      if Config.VotingLaws then
        table.insert(options, {
          event = "ap-government:client:passedLaws", 
          icon = 'fas fa-sign-in-alt',
          label = 'Passed Laws'
        })
      end

      exports['qtarget']:AddTargetModel({qtargetcfg['appointmentsPed']['ped'].ped.model}, {
        options = options,
        distance = 2.5,
      })
    end
    if qtargetcfg['votingSystem']['votingPoints']['active'] == true then
      local onSelect = {
        {
          event = "ap-government:target:isRegistered",
          icon = "fas fa-sign-in-alt",
          label = "Vote For Candidate"
        },
      }
      if Config.VotingLaws then
        table.insert(onSelect, {
          event = "ap-government:client:openLawVoting",
          icon = "fas fa-sign-in-alt",
          label = "Vote For Laws"
        })
      end
      for k,v in pairs(qtargetcfg['votingSystem']['votingPoints']['points']) do
        if v.active == true then
          exports['qtarget']:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading=v.heading,
            debugPoly=false, 
            minZ=v.minZ,
            maxZ=v.maxZ,
            }, {
              options = onSelect,
            distance = 2.5
          })
        end
      end
    end
    if qtargetcfg['majorOffice']['active'] == true then
      local onSelect = {
        {
            event = "ap-government:client:majorOffice",
            icon = "fas fa-sign-in-alt",
            label = "Major Options",
            job = {[qtargetcfg['majorOffice']['job'].name] = qtargetcfg['majorOffice']['job'].grade},
        }
      }
      for k,v in pairs(qtargetcfg['majorOffice']['points']) do
        if v.active == true then
          exports['qtarget']:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading=v.heading,
            debugPoly=false, 
            minZ=v.minZ,
            maxZ=v.maxZ,
            }, {
              options = onSelect,
            distance = 2.5
          })
        end
      end
    end
  elseif oxTarget == true then
    if oxtargetcfg['votingSystem']['votingStaff']['active'] == true then
      local hash = GetHashKey(oxtargetcfg['votingSystem']['votingStaff']['ped'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

      local ent = CreatePed(0, hash, oxtargetcfg['votingSystem']['votingStaff']['ped'].coords.x, oxtargetcfg['votingSystem']['votingStaff']['ped'].coords.y, oxtargetcfg['votingSystem']['votingStaff']['ped'].coords.z, oxtargetcfg['votingSystem']['votingStaff']['ped'].coords[4], false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local input = {
        { 
          name = 'apply_candidate_menu',
          event = "ap-government:client:applyCandidate", 
          icon = 'fa-solid fa-sign-in-alt',
          label = 'Apply As Candidate'
        },
      }

      if Config.VotingSettings.Job then
        table.insert(input, {name = 'viewRequestedCandidates', event = "ap-government:client:staffVotingMenu", icon = 'fas fa-sign-in-alt', label = 'Voting Management', groups = oxtargetcfg['votingSystem']['votingStaff']['ped'].job.name})
      end
      
      exports["ox_target"]:addLocalEntity(ent, input)
    end
    if oxtargetcfg['votingSystem']['votingPoints']['active'] == true then
      local onSelect = {
        {
            name = "isRegistered",
            serverEvent = "ap-government:server:isRegistered",
            icon = "fas fa-sign-in-alt",
            label = "Vote For Candidate"
        }
      }
      if Config.VotingLaws then
        table.insert(onSelect, {
          name = "openLawVoting",
          event = "ap-government:client:openLawVoting",
          icon = "fas fa-sign-in-alt",
          label = "Vote For Laws"
        })
      end
      for k,v in pairs(oxtargetcfg['votingSystem']['votingPoints']['points']) do
        if v.active == true then
          exports.ox_target:addBoxZone({
            coords=v.coords,
            size=v.size,
            rotation=v.rotation, 
            debug=false,
            drawSprite=true,
            options=onSelect
          })
        end
      end
    end
    if oxtargetcfg['majorOffice']['active'] == true then
      local onSelect = {
        {
            name = "majorOffice",
            event = "ap-government:client:majorOffice",
            icon = "fas fa-sign-in-alt",
            label = "Major Options",
            groups = oxtargetcfg['majorOffice']['job'].name,
        }
      }
      for k,v in pairs(oxtargetcfg['majorOffice']['points']) do
        if v.active == true then
          exports.ox_target:addBoxZone({
            coords=v.coords,
            size=v.size,
            rotation=v.rotation, 
            debug=false,
            drawSprite=true,
            options=onSelect
          })
        end
      end
    end
    if oxtargetcfg['appointmentsPed']['active'] == true then
      local hash = GetHashKey(oxtargetcfg['appointmentsPed']['ped'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

    
      local ent = CreatePed(0, hash, oxtargetcfg['appointmentsPed']['ped'].coords, false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local input = {
        { 
          name = 'appointmentData',
          serverEvent = "ap-government:server:appointmentData", 
          icon = 'fa-solid fa-sign-in-alt',
          label = 'Mayor Appointments'
        },
      }

      if Config.VotingLaws then
        table.insert(input, {
          name = 'passedLaws',
          event = "ap-government:client:passedLaws", 
          icon = 'fa-solid fa-sign-in-alt',
          label = 'Passed Laws'
        })
      end

      exports["ox_target"]:addLocalEntity(ent, input)
    end
  end
end)

local GovControlPress = 0
GovControl = function (v)
  CreateThread(function()
    while GovControlPress ~= 0 do
      if IsControlPressed(0, 38) then
        TriggerEvent('cd_drawtextui:HideUI')
        if v.isServer == true then
          TriggerServerEvent(v.trigger)
        else
          TriggerEvent(v.trigger)
        end
      end
      Wait(100)
    end
  end)
end

CreateThread(function()
  local dcfg = cfg['DrawText']
  if Config.Interactions.drawText then
    for k, v in pairs(dcfg['govpoints']) do
        local govPoly = BoxZone:Create(vector3(v.pos.x, v.pos.y, v.pos.z), v.pos.length, v.pos.width, {
            heading = -20,
            name=v.pos.boxName,
            debugPoly = false,
            minZ = v.pos.z - 1,
            maxZ = v.pos.z + 1,
        })
        govPoly:onPlayerInOut(function(isPointInside)
            if isPointInside then
              if v.enable then
                if v.job.check then
                  if checkJob(v.job.name, v.job.grade) then
                    TriggerEvent('cd_drawtextui:ShowUI', 'show', v.text)
                    GovControl(v)
                    GovControlPress = k
                  end
                else
                  TriggerEvent('cd_drawtextui:ShowUI', 'show', v.text)
                  GovControl(v)
                  GovControlPress = k
                end
              end
            else
                GovControlPress = 0
                TriggerEvent('cd_drawtextui:HideUI')
            end
        end)
    end  
  end
end)


local VotingControlPress = 0
function VotingControl()
  while VotingControlPress ~= 0 do
    if IsControlPressed(0, 38) then
      TriggerEvent('cd_drawtextui:HideUI')
      TriggerEvent('ap-government:client:drawtext:vote')
      Citizen.Wait(1000)
    end
    Wait(0)
  end
end

CreateThread(function()
  local dcfg = cfg['DrawText']
  if Config.Interactions.drawText then
    local votingPoly = {}
    for k, v in pairs(dcfg['votingPoints']) do
      votingPoly[#votingPoly+1] = BoxZone:Create(vector3(v.x, v.y, v.z), 1.35, 0.6, {
            heading = -20,
            name="voting"..k,
            debugPoly = false,
            minZ = v.z - 1,
            maxZ = v.z + 1,
        })
        local votingCombo = ComboZone:Create(votingPoly, {name = "votingPoly"})
        votingCombo:onPlayerInOut(function(isPointInside)
            if isPointInside then
                TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] Vote For Candidate")
                VotingControl()
                VotingControlPress = k
            else
                VotingControlPress = 0
                TriggerEvent('cd_drawtextui:HideUI')
            end
        end)
    end  
  end
end)

local menucheck = Config.Context

RegisterNetEvent('ap-government:client:drawtext:vote', function()
  if menucheck.ZF then
    local registerVoteMenu = ContextMenu({
      {
        id = 0,
        header = "Register Your Vote",
        txt = "Click here to register your vote.",
        params = {
          isServer = true,
          event = "ap-government:server:isRegistered",
          args = {}
        }
      }
    })
  elseif menucheck.NH then
    local registerVoteMenu = ContextMenu({
      {
        header = "Register Your Vote",
        context = "Click here to register your vote.",
        server = true,
        event = "ap-government:server:isRegistered",
        args = {}
      }
    })
  elseif menucheck.OX then
    lib.registerContext({
      id = 'registerVoteMenu',
      title = 'Voting Tablet',
      options = {
        {
          title = "Register Your Vote",
          description = "Click here to register your vote.",
          serverEvent = "ap-government:server:isRegistered",
          args = {}
        }
      }
    })
	  lib.showContext("registerVoteMenu")
  end
end)

RegisterNetEvent('ap-government:client:drawtext:voteSystem', function()
  local job = cfg['DrawText']['govpoints']['voting'].job
  if menucheck.ZF then
    local VotingOptionsMenu = {
      {
        header = "Candidate Application",
        txt = "Apply/View Application Status.",
        params = {
          isServer = false,
          event = "ap-government:client:applyCandidate",
          args = {}
        }
      },
    }
    if Config.VotingSettings.Job then
      if checkJob(job.name, job.grade) then
        table.insert(VotingOptionsMenu, {header = LangClient.menus['staffVotingMenu_header_one'], txt = LangClient.menus['staffVotingMenu_txt_one'], params = {isServer = false, event = "ap-government:client:staffVotingMenu", args = {}}})
      end
    end
    ContextMenu(VotingOptionsMenu)
  elseif menucheck.NH then
    local VotingOptionsMenu = {
      {
        header = "Candidate Application",
        context = "Apply/View Application Status.",
        server = false,
        event = "ap-government:client:applyCandidate",
        args = {}
      },
    }
    if Config.VotingSettings.Job then
      if checkJob(job.name, job.grade) then
        table.insert(VotingOptionsMenu, {header = LangClient.menus['staffVotingMenu_header_one'], context = LangClient.menus['staffVotingMenu_txt_one'], server = false, event = "ap-government:client:staffVotingMenu", args = {}})
      end
    end
    ContextMenu(VotingOptionsMenu)
  elseif menucheck.OX then
    local VotingOptionsMenu = {
      {
        title = "Candidate Application",
        description = "Apply/View Application Status.",
        event = "ap-government:client:applyCandidate",
        args = {}
      },
    }
    if Config.VotingSettings.Job then
      if checkJob(job.name, job.grade) then
        table.insert(VotingOptionsMenu, {title = LangClient.menus['staffVotingMenu_header_one'], description = LangClient.menus['staffVotingMenu_txt_one'], event = "ap-government:client:staffVotingMenu", args = {}})
      end
    end
    lib.registerContext({
      id = 'StaffVotingOptionsMenu',
      title = LangClient.menus['staffVotingMenu_title'],
      options = VotingOptionsMenu
    })
	  lib.showContext("StaffVotingOptionsMenu")
  end
end)