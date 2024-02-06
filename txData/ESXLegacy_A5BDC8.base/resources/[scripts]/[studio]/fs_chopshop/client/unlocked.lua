 

function notification(msg)
 
  --  exports['okokNotify']:Alert(title, msg, 5000, 'success')
    
      lib.notify({
         title = "Chop Shop System",
         description = msg,
         type = 'info',
         duration = 5000,
         icon = 'fa-solid fa-anchor'
      })
    
end
 
function OpenBossMenu(job)
    TriggerEvent('esx_society:openBossMenu', job, function(menu)
        ESX.CloseContext()
    end, { wash = false })
end
 
function Draw3DText(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75) --comment this out to remove background on 3dtext
    ClearDrawOrigin()
end
 
 

