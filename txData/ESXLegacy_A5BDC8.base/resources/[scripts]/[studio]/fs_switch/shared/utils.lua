function notification(title, msg, type, duration, icon)
    lib.notify({
        title = title,
        description = msg,
        type = type,
        duration = duration,
        icon = icon
    })
end
