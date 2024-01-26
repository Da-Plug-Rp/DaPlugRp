ESX = exports["es_extended"]:getSharedObject()
PlayerData = false
local logged = false 

CreateThread(function()
	PlayerData = ESX.GetPlayerData()
	if PlayerData then
		PlayerData = PlayerData
    logged = true
	end
end)

function getvehiclepropx(veh)
  return ESX.Game.GetVehicleProperties(veh)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    logged = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    PlayerLoaded = false
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    logged = true
end)


function DrawText3D(x,y,z, text)
      local onScreen,_x,_y=World3dToScreen2d(x,y,z)
      local px,py,pz=table.unpack(GetGameplayCamCoords())
      
      SetTextScale(0.35, 0.35)
      SetTextFont(4)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 215)
    
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
      local factor = (string.len(text)) / 370
      DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end

  function notify(text)
    ESX.ShowNotification(text)
  end

  function getfuel(vehicle)
    if Config.UsingFuel == "legacyfuel" then
      return exports["LegacyFuel"]:GetFuel(vehicle)
    elseif Config.UsingFuel == "bakitelli_fuel" then
      return exports["tb_fuel"]:GetFuel(vehicle)
    elseif Config.UsingFuel == "other" then
      return  -- you trigger or export
    else
      return GetVehicleFuelLevel(vehicle)
    end
  end

  function checkJob(k)
     if Config.Mechanics[k].Job == "unjob" then 
        return true
    else 
        return Config.Mechanics[k].Job == PlayerData.job.name
    end
end

function returnlogin()
  return logged
end