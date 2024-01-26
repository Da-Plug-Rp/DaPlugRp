CreateThread(function()
    while not loaded do
        Wait(500)
    end
    lib = exports.loaf_lib:GetLib()

    local blipCoords = Config.BossActions
    if Config.Teleport then 
        blipCoords = Config.Teleport[1].xyz
    end
    lib.AddBlip({
        coords = blipCoords,
        sprite = 475,
        color = 13,
        scale = 0.75,
        label = Strings["blip"]
    })

    if Config.Command then
        RegisterCommand(Config.Command, JobMenu)
        if Config.Keybind.Enabled then
            RegisterKeyMapping(Config.Command, Strings["keybind"], Config.Keybind.Mapper, Config.Keybind.Parameter)
        end
    end

    if Config.Teleport then
        for i, v in pairs(Config.Teleport) do
            lib.AddMarker({
                coords = v.xyz - vector3(0.0, 0.0, 1.0),
                type = 1,
                callbackData = {
                    press = Config.Teleport[i == 1 and 2 or 1]
                },
                key = "primary",
                text = i == 1 and Strings["enter"] or Strings["exit"],
            }, nil, nil, Teleport)
        end
    end

    local markers = {}
    function RefreshMarkers()
        if not hasJob then
            for _, v in pairs(markers) do
                lib.RemoveMarker(v)
            end
            markers = {}
            return
        end

        if isBoss and not markers.boss then
            markers.boss = lib.AddMarker({
                coords = Config.BossActions.xyz - vector3(0.0, 0.0, 1.0),
                type = 1,
                callbackData = {},
                key = "primary",
                text = Strings["boss"],
            }, nil, nil, BossActions)
        elseif markers.boss then
            lib.RemoveMarker(markers.boss)
            markers.boss = nil
        end
    end
    OnJob()
end)

function Teleport(coords)
    DoScreenFadeOut(500)
    Wait(750)
    SetEntityCoordsNoOffset(PlayerPedId(), coords.xyz)
    if coords.w then 
        SetEntityHeading(PlayerPedId(), coords.w) 
    end
    DoScreenFadeIn(500)
end

-- function to get nearby players
function GetPlayers()
    local found = {}
    for _, player in pairs(GetActivePlayers()) do
        if Config.AllowSelf or player ~= PlayerId() then
            local playerPed = GetPlayerPed(player)
            if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(playerPed)) <= 5.0 then
                local foundName, startedSearch, name = false, GetGameTimer(), GetPlayerName(player)
                
                if Config.UseRPName then
                    name = lib.TriggerCallbackSync("loaf_billing:get_name", GetPlayerServerId(player)) or name
                end

                found[#found+1] = {
                    serverId = GetPlayerServerId(player),
                    name = name  .. (" [%i]"):format(GetPlayerServerId(player))
                }
            end
        end
    end
    return found
end

function Draw3DText(text, coords)
    SetDrawOrigin(coords)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetTextScale(0.35, 0.35)
    SetTextCentre(1)
    SetTextFont(4)
    EndTextCommandDisplayText(0.0, 0.0)

    BeginTextCommandGetWidth("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)

    local height = GetRenderedCharacterHeight(0.35, 4) * 1.2
    DrawRect(0.0, height/2, EndTextCommandGetWidth(1) + 0.0015, height, 45, 45, 45, 150)

    ClearDrawOrigin()
end

function DrawEntityBox(entity)
    local min, max = GetModelDimensions(GetEntityModel(entity))
    
    local pad = 0.001
    local box = {
        -- Bottom
        GetOffsetFromEntityInWorldCoords(entity, min.x - pad, min.y - pad, min.z - pad),
        GetOffsetFromEntityInWorldCoords(entity, max.x + pad, min.y - pad, min.z - pad),
        GetOffsetFromEntityInWorldCoords(entity, max.x + pad, max.y + pad, min.z - pad),
        GetOffsetFromEntityInWorldCoords(entity, min.x - pad, max.y + pad, min.z - pad),

        -- Top
        GetOffsetFromEntityInWorldCoords(entity, min.x - pad, min.y - pad, max.z + pad),
        GetOffsetFromEntityInWorldCoords(entity, max.x + pad, min.y - pad, max.z + pad),
        GetOffsetFromEntityInWorldCoords(entity, max.x + pad, max.y + pad, max.z + pad),
        GetOffsetFromEntityInWorldCoords(entity, min.x - pad, max.y + pad, max.z + pad)
    }

    local lines = {
        {box[1], box[2]},
        {box[2], box[3]},
        {box[3], box[4]},
        {box[4], box[1]},
        {box[5], box[6]},
        {box[6], box[7]},
        {box[7], box[8]},
        {box[8], box[5]},
        {box[1], box[5]},
        {box[2], box[6]},
        {box[3], box[7]},
        {box[4], box[8]}
    }

    local polyMatrix = {
        -- BOTTOM
        {box[3], box[2], box[1]},
        {box[4], box[3], box[1]},

        -- TOP
        {box[5], box[6], box[7]},
        {box[5], box[7], box[8]},

        -- LEFT SIDE
        {box[3], box[4], box[7]},
        {box[8], box[7], box[4]},

        -- RIGHT SIDE
        {box[1], box[2], box[5]},
        {box[6], box[5], box[2]},

        -- FRONT SIDE
        {box[2], box[3], box[6]},
        {box[3], box[7], box[6]},

        -- BACK SIDE
        {box[5], box[8], box[4]},
        {box[5], box[4], box[1]}
    }

    
    for k, v in pairs(lines) do
		DrawLine(v[1].x, v[1].y, v[1].z, v[2].x, v[2].y, v[2].z, 255, 255, 255, 255)
	end

    for _, poly in pairs(polyMatrix) do
        DrawPoly(poly[1], poly[2], poly[3], 250, 92, 92, 75)
    end
end

-- get entity from cursor
local function RotationToDirection()
    local cameraRotation = GetGameplayCamRot()
	local adjustedRotation = vector3(
        (math.pi / 180) * cameraRotation.x,
        (math.pi / 180) * cameraRotation.y,
        (math.pi / 180) * cameraRotation.z
    )
	local direction = vector3(
        -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        math.sin(adjustedRotation.x)
    )
	return direction
end

function GetEntityFromCursor()
    local distance = 15
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection()
	local destination = vector3(
        cameraCoord.x + direction.x * distance,
        cameraCoord.y + direction.y * distance,
        cameraCoord.z + direction.z * distance
    )

    local shapeTest = StartExpensiveSynchronousShapeTestLosProbe(cameraCoord, destination, 16, 0, 4)
	local retval, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
    hit = hit == 1

	return hit, entityHit
end

function HelpText(text)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, false, -1)
end