function giveKey(playerID, xPlayer, actualMotel, room)
    if Config.Framework == "esx" then
        print("im trying 1")
        if not getKey(playerID, xPlayer, room) then
            print("im trying 2")
            local name     = xPlayer.getName()
            local metadata = { description = 'Motel: '..actualMotel..'   \nRoom: '..room..'   \nRenter: '..name }
            exports.ox_inventory:AddItem(xPlayer, 'motelkey', 1, metadata)
            TriggerClientEvent("bit-motels:notifications", playerID, Noti.check, Lang.receivedKey.." "..room, Noti.time)
        else
            TriggerClientEvent("bit-motels:notifications", playerID, Noti.error, Lang.haveKey, Noti.time)
        end
    elseif Config.Framework == "qb" then
        if not getKey(playerID, xPlayer, room) then
            local info = {}
            info.motel = actualMotel
            info.room = room
            info.renter = xPlayer.PlayerData.citizenid
            xPlayer.Functions.AddItem('motelkey', 1, nil, info)
            TriggerClientEvent('inventory:client:ItemBox', playerID, QBCore.Shared.Items['motelkey'], 'add')
            TriggerClientEvent("bit-motels:notifications", playerID, Noti.check, Lang.receivedKey.." "..room, Noti.time)
        else
            TriggerClientEvent("bit-motels:notifications", playerID, Noti.error, Lang.haveKey, Noti.time)
        end
    end
end