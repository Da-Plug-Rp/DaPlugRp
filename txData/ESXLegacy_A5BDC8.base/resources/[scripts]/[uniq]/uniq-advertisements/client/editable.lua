function sendNotify(title, description, type)
    lib.notify({
        title = title,
        description = description,
        duration = Shared.Notify.duration,
        type = type,
        position = Shared.Notify.position
    })
end

RegisterNetEvent('advertisements:notify', sendNotify)

-- Target
exports["qtarget"]:AddTargetModel(Shared.Target.ped, {
    options = {
        {
            icon = "ad",
            label = L('target.help'),
            action = function()
                ads()
            end
        }
    },
    distance = Shared.Target.distance
})