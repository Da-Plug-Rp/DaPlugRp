function TextUi(text,icon)
    if text then
        lib.showTextUI(text,{icon = icon})
    else
        lib.hideTextUI()
    end
end

function notification(title, msg, type, icon)
 
  --  exports['okokNotify']:Alert(title, msg, 5000, 'success')
    
      lib.notify({
         title = title,
         description = msg,
         type = type,
         duration = 5000,
         icon = icon
      })
    
end
 
function OpenBossMenu(job)
    TriggerEvent('esx_society:openBossMenu', job, function (menu)
        ESX.CloseContext() 
    end, {wash = false})
end