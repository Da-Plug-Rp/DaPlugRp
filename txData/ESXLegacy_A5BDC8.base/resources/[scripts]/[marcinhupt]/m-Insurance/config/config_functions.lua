ESX = exports.es_extended:getSharedObject()

function Notify(msg, type, time)
    lib.notify({ title = 'Notification', description = msg, type = type })
end

function GetVehicleName(hash)
    name = GetDisplayNameFromVehicleModel(hash)
    return name
end