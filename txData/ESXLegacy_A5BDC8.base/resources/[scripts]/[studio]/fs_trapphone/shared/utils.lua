function TextUi(text)
    if text then
        lib.showTextUI(text)
    else
        lib.hideTextUI()
    end
end

function notification(title, msg, type, duration, icon)    
    --exports['okokNotify']:Alert(title, msg, duration, type)
    lib.notify({
        title = title,
        description = msg,
        type = type,
        duration = duration,
        icon = icon
    })
    
end

function dispach(coords)
    --configure here
    TriggerServerEvent('fs_trapphone:dispach', coords)
    
    --please remove upper line if u want to add ur own


end
