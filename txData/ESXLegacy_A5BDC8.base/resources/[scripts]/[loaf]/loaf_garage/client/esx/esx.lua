CreateThread(function()
    if Config.Framework ~= "esx" then
        return
    end

    local export
    export, ESX = pcall(function()
        return exports.es_extended:getSharedObject()
    end)
    if not export then
        while not ESX do
            TriggerEvent("esx:getSharedObject", function(obj)
                ESX = obj
            end)
            Wait(500)
        end
    end

    while not ESX.GetPlayerData()?.job do
        Wait(500)
    end

    function Notify(msg)
        ESX.ShowNotification(msg)
    end

    function GetJob()
        return ESX.GetPlayerData().job.name
    end

    function OpenESXBrowse(vehiclesMenu)
        local elements = {}
        for i, v in pairs(vehiclesMenu) do
            if i > 1 then
                table.insert(elements, {
                    label = v.header,
                    params = v.params
                })
            end
        end
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_vehicle", {
            title = Strings["select_vehicle"],
            align = Config.MenuAlign,
            elements = elements
        }, function(data, menu)
            if not data.current.params then
                return
            end

            TakeOutVehicle(data.current.params.args)
            menu.close()
        end, function(data, menu)
            menu.close()
        end)
    end

    loaded = true

    RegisterNetEvent("esx:setJob", function()
        ReloadGarages()
    end)
end)