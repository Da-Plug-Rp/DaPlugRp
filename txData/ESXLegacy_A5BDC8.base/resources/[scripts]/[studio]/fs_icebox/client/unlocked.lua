
function Textui(msg)
    if msg then
        lib.showTextUI(msg)
    else
        lib.hideTextUI()
    end
end
    

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

 CreateThread(function ()
    if Config.Shop.blip.enable then
        local coords = Config.Shop.boss_action
        local radius = Config.Shop.blip.radius + 0.00
        local blipRd = AddBlipForRadius(coords, radius)
        SetBlipHighDetail(blipRd, true)
        SetBlipColour(blipRd, Config.Shop.blip.radius_color)
        SetBlipAlpha (blipRd, 128)
        SetBlipAsShortRange(blipRd, true)
        local blip = AddBlipForCoord(coords)
        SetBlipHighDetail(blip, true)
        SetBlipSprite (blip, Config.Shop.blip.sprite)
        SetBlipScale (blip, Config.Shop.blip.size)
        SetBlipColour (blip, Config.Shop.blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Shop.blip.name)
        EndTextCommandSetBlipName(blip)
    end
 end)
    
 



RegisterNetEvent(Settings.Prefix..':openbossaction')
AddEventHandler(Settings.Prefix..':openbossaction', function(job)
    TriggerEvent('esx_society:openBossMenu', job, function(data, menu)
        ESX.CloseContext()
    end, {wash = false})
end)

RegisterNetEvent(Settings.Prefix..':notify')
AddEventHandler(Settings.Prefix..':notify', function(msg)
    lib.notify({
        title = 'Icebox',
        description = msg,
        icon = "fa-solid fa-gem",
        type = 'inform',
        position = 'top'
    })
end)
