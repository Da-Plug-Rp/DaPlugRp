function TextUi(text)
    if text then
        lib.showTextUI(text)
    else
        lib.hideTextUI()
    end
end

function notification(title, msg, type, duration, icon)
     
   -- exports['okokNotify']:Alert(title, msg, 5000, type)
    lib.notify({
        title = title,
        description = msg,
        type = type,
        duration = duration,
        icon = icon
    })
    
end
 