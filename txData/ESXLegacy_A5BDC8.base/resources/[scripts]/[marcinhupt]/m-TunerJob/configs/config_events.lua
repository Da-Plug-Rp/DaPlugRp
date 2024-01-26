ESX = exports.es_extended:getSharedObject()

-- Function Air Suspension
function AirSuspensionMenu()
    lib.registerContext({
        id = 'AirSuspension',
        title = 'Air Suspension',
        options = {
            { title = '🔸Stock',         description = 'Click here to adjust the suspension', event = Config.Prefix..":client:AirSuspension", args = 1 },
            { title = '🔹Level 1',       description = 'Click here to adjust the suspension', event = Config.Prefix..":client:AirSuspension", args = 2 },
            { title = '🔹Level 2',       description = 'Click here to adjust the suspension', event = Config.Prefix..":client:AirSuspension", args = 3 },
            { title = '🔹Level 3',       description = 'Click here to adjust the suspension', event = Config.Prefix..":client:AirSuspension", args = 4 },
            { title = '🔹Level 4',       description = 'Click here to adjust the suspension', event = Config.Prefix..":client:AirSuspension", args = 5 },
        }
    })
    lib.showContext('AirSuspension')
end

-- Function Coilovers
function coiloverMenu()
    lib.registerContext({
        id = 'CoiloverMenu',
        title = 'Coilover Menu',
        options = {
            { title = '🔸Stock', description = 'Click here to adjust the vehicle\'s coilovers', event = Config.Prefix..":client:applyCoilovers", args = 1 },
            { title = '🔹Stage 1', description = 'Click here to adjust the vehicle\'s coilovers', event = Config.Prefix..":client:applyCoilovers", args = 2 },
            { title = '🔹Stage 2', description = 'Click here to adjust the vehicle\'s coilovers', event = Config.Prefix..":client:applyCoilovers", args = 3 },
            { title = '🔹Stage 3', description = 'Click here to adjust the vehicle\'s coilovers', event = Config.Prefix..":client:applyCoilovers", args = 4 },
            { title = '🔹Stage 4', description = 'Click here to adjust the vehicle\'s coilovers', event = Config.Prefix..":client:applyCoilovers", args = 5 },
        }
    })
    lib.showContext('CoiloverMenu')
end

-- Function Xenons
function xenonControllerMenu()
    lib.registerContext({
		id = 'XenonLights',
		title = 'Xenon Lights',
		options = {
			{ title = '🔸Stock',         description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 1 },
			{ title = '🔹Ice Blue',      description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 2 },
			{ title = '🔹Blue',          description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 3 },
			{ title = '🔹Electric Blue', description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 4 },
			{ title = '🔹Green',         description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 5 },
			{ title = '🔹Green Lemon',   description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 6 },
			{ title = '🔹Yellow',        description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 7 },
			{ title = '🔹Gold',          description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 8 },
			{ title = '🔹Orange',        description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 9 },
			{ title = '🔹Red',           description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 10 },
			{ title = '🔹Pink',          description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 11 },
			{ title = '🔹Hot Pink',      description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 12 },
			{ title = '🔹Purple',        description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 13 },
			{ title = '🔹Black',         description = 'Click here to adjust the xenon\'s headlights', event = Config.Prefix..":client:applyXenonColor", args = 14 },
		}
	})
	lib.showContext('XenonLights')
end

-- Open menu of cameras
RegisterNetEvent(Config.Prefix..":client:MenuCameras", function()
    lib.registerContext({
        id = 'Cameras',
        title = '🎥 Câmeras',
        options = {
            { title = '🔹ID: #1',       description = 'Click here to access the camera', event = Config.Prefix..":client:AtivarCamera1" },
            { title = '🔹ID: #2',       description = 'Click here to access the camera', event = Config.Prefix..":client:AtivarCamera2" },
            { title = '🔹ID: #3',       description = 'Click here to access the camera', event = Config.Prefix..":client:AtivarCamera3" },
            { title = '🔹ID: #4',       description = 'Click here to access the camera', event = Config.Prefix..":client:AtivarCamera4" },
        }
    })
    lib.showContext('Cameras')
end)

-- Neons

RegisterNetEvent(Config.Prefix..':client:neonMenu', function()
    lib.registerContext({
        id = 'neonMenu',
        title = '[🚨] Neon Underglow',
        options = {
            { title = '[✅] Active Neon',         description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:neonToggleMenu" },
            { title = '[♻️] Change Colour',       description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:neonColorMenu" },
        }
    })
    lib.showContext('neonMenu')
end)

RegisterNetEvent(Config.Prefix..':client:neonToggleMenu', function()
    lib.registerContext({
        id = 'neonToggleMenu',
        title = '[🚨] Neon Underglow',
        options = {
            { title = '[✅] Turn ON',        description = 'Click here to turn on your neon\'s', event = Config.Prefix..":client:applyNeonPostion", args = 1 },
            { title = '[❌] Turn OFF',       description = 'Click here to turn off your neon\'s', event = Config.Prefix..":client:applyNeonPostion", args = 2 },
        }
    })
    lib.showContext('neonToggleMenu')
end)

RegisterNetEvent(Config.Prefix..":client:neonColorMenu", function()
    lib.registerContext({
        id = 'NeonUnderglow',
        title = '[🚨] Neon Underglow',
        options = {
            { title = '🔹White',         description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 1 },
            { title = '🔹Blue',          description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 2 },
            { title = '🔹Electric Blue', description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 3 },
            { title = '🔹Green',         description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 4 },
            { title = '🔹Green Lemon',   description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 5 },
            { title = '🔹Yellow',        description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 6 },
            { title = '🔹Gold',          description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 7 },
            { title = '🔹Orange',        description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 8 },
            { title = '🔹Red',           description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 9 },
            { title = '🔹Pink',          description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 10 },
            { title = '🔹Light Pink',    description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 11 },
            { title = '🔹Hot Pink',      description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 12 },
            { title = '🔹Black',         description = 'Click here to adjust the neon\'s headlights', event = Config.Prefix..":client:applyNeonColor", args = 13 },
        }
    })
    lib.showContext('NeonUnderglow')
end)

-- Menu Vehicles List
RegisterNetEvent(Config.Prefix..":Client:VehiclesMenu", function()
    lib.registerContext({
        id = 'MechanicVehicles',
        title = '🚗 Mechanic Vehicles',
        options = {
            { title = '📃 Vehicle List',         description = '', event = Config.Prefix..":client:ListaVeiculos" },
            { title = '📥 Return Vehicle',       description = '', event = Config.Prefix..":Client:ReturnVehicle" },
        }
    })
    lib.showContext('MechanicVehicles')
end)

-- Function DrawText
function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end