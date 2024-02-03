-- client/main.lua

local isPulling = false
local pulledPlayer = nil

RegisterKeyMapping("pullVehicle", "Pull Vehicle", "keyboard", "F")

RegisterCommand("pullVehicle", function()
    isPulling = not isPulling

    if isPulling then
        TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Hold 'F' to pull out the driver.")
    else
        TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Stopped pulling.")
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isPulling then
            local playerPed = PlayerPedId()
            local targetVehicle = GetVehicleInFront()

            if targetVehicle and DoesEntityExist(targetVehicle) then
                local driver = GetPedInVehicleSeat(targetVehicle, -1)

                if driver and driver ~= playerPed then
                    pulledPlayer = driver
                    TaskLeaveVehicle(driver, targetVehicle, 1)
                end
            end
        end
    end
end)

function GetVehicleInFront()
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local entityHit = nil

    for i = 5.0, 15.0, 0.1 do
        local x, y, z = table.unpack(pos + i * GetEntityForwardVector(playerPed))
        local rayHandle = StartShapeTestRay(x, y, z, x, y, z - 2.0, 10, playerPed, 0)
        local _, _, _, _, entity = GetShapeTestResult(rayHandle)

        if entity and IsEntityAVehicle(entity) then
            entityHit = entity
            break
        end
    end

    return entityHit
end

