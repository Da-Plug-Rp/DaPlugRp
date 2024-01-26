tabletcamera = false
tabletId = 0

recording = false

RegisterNetEvent('camera:tablet')
AddEventHandler('camera:tablet', function()
    ToggleTablet(false)
    CreateMobilePhone(0)
    CellCamActivate(true, true)
    tabletcamera = true
    SetNuiFocus(false, false)
end)



frontCam = false

function CellFrontCamActivate(activate)
    return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end

CreateThread(function()
    DestroyMobilePhone()
    local letSleep = true
    while true do
        Wait(0)
        if IsControlJustPressed(0, 27) and tabletcamera then --Selfie
            letSleep = false
            frontCam = not frontCam
            CellFrontCamActivate(frontCam)
        end

        if IsControlJustPressed(0, 177) and tabletcamera then --Close
            letSleep = false
            DestroyMobilePhone()
            tabletcamera = false
            CellCamActivate(false, false)

            SendNUIMessage({
                event = "PushHome"
            })

            SetDisplay(true)
        end

         if IsControlJustPressed(0, 176) and tabletcamera then
            letSleep = false
            SendNUIMessage({event = "TakePhoto"})
        end

        if IsControlJustPressed(0, 174) and tabletcamera then
            letSleep = false
            SendNUIMessage({event = "CameraUP"})
        end

        if IsControlJustPressed(0, 175) and tabletcamera then
            letSleep = false
            SendNUIMessage({event = "CameraDown"})
        end

        if IsControlJustPressed(0, 22) and tabletcamera then
            letSleep = false

            if not recording then
                SendNUIMessage({event = "startRecording"})
            else
                SendNUIMessage({event = "stopRecording"})
            end
        end


        if tabletcamera then
            letSleep = false
            HideHudComponentThisFrame(7)
            HideHudComponentThisFrame(8)
            HideHudComponentThisFrame(9)
            HideHudComponentThisFrame(6)
            HideHudComponentThisFrame(19)
            HideHudAndRadarThisFrame()
        end

        if letSleep then
			Wait(1500)
		end
    end
end)

RegisterNUICallback('camera_open', function(data, cb)
    TriggerEvent('camera:tablet')
    cb('ok')
end)

RegisterNUICallback("camerastop", function(data, cb)
    DestroyMobilePhone()
    tabletcamera = false
    CellCamActivate(false, false)
    --[[SendNUIMessage({
         event = "PushHome"
    })--]]

    SetDisplayCamera(true)

    SetTimeout(1000, function()
        ToggleTablet(not tablet)
    end)

    cb('ok')
end)

RegisterNUICallback('startRecording', function(data, cb)

    recording = true

    cb('ok')
    
end)

RegisterNUICallback('stopRecording', function(data, cb)

    recording = false

    cb('ok')
    
end)

RegisterNUICallback('viewVideo', function(data, cb)

    DestroyMobilePhone()
    tabletcamera = false
    CellCamActivate(false, false)

    SetDisplayCamera(true)

    cb('ok')

    
end)