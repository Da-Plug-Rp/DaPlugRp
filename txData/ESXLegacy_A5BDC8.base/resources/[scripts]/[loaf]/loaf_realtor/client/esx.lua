CreateThread(function()
    if Config.Framework ~= "esx" then
        return
    end

    local export, ESX = pcall(function()
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

    function OnJob(job)
        Wait(500)

        if not job then
            job = ESX.GetPlayerData().job
        end

        hasJob = job.name == Config.JobName
        isBoss = hasJob and job.grade_name == "boss"
        canCreate = hasJob and job.grade >= Config.CreateGrade

        RefreshMarkers()
    end
    RegisterNetEvent("esx:setJob", OnJob)

    function Notify(msg)
        ESX.ShowNotification(msg)
    end

    local function CloseMenuHandler(data, menu)
        menu.close()
    end

    function BossActions()
        if not isBoss then
            return
        end

        ESX.UI.Menu.CloseAll()

        TriggerEvent("esx_society:openBossMenu", Config.JobName, CloseMenuHandler, {
            wash = false
        })
    end

    -- job menu
    local jobActions = {}

    function JobMenu()
        if not hasJob then
            return
        end

        ESX.UI.Menu.CloseAll()

        local elements = {
            {label = Strings["bill_player"], value = "transfer_bill"},
            {label = Strings["transfer_property"], value = "transfer_bill"}
        }

        if Config.Rent then
            table.insert(elements, {label = Strings["rent_property"], value = "transfer_bill"})
        end

        if canCreate then
            table.insert(elements, {label = Strings["create_property"], value = "create"})
            if Config.AllowWalkin then
                table.insert(elements, {label = Strings["create_walkin"], value = "create"})
            end
            table.insert(elements, {label = Strings["remove_property"], value = "remove"})
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "job_menu", {
            title = Strings["job_menu"],
            align = Config.MenuAlign,
            elements = elements
        }, function(data, menu)
            jobActions[data.current.value](data.current.label)
        end, CloseMenuHandler)
    end

    -- menu to bill a player for a house
    local function BillPlayer(name, serverId)
        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "choose_bill", {
            title = Strings["houseid_bill"]
        }, function(data, menu)
            local propertyId = tonumber(data.value)
            if not propertyId then
                return Notify(Strings["invalid_property"])
            end
            
            TriggerServerEvent("loaf_realtor:bill_house", serverId, propertyId)
            ESX.UI.Menu.CloseAll()
        end, CloseMenuHandler)
    end

    local function SelectInterior(category)
        local elements = {}
        local shells = exports.loaf_housing:GetShells()
        for i, v in pairs(shells[category].shells) do
            table.insert(elements, {
                label = v,
                value = i
            })
        end

        local promise = promise.new()
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_interior", {
            title = Strings["select_interior"],
            align = Config.MenuAlign,
            elements = elements
        }, function(data, menu)
            promise:resolve(data.current.value)
            menu.close()
        end, function(data, menu)
            promise:resolve()
            menu.close()
        end)

        return Citizen.Await(promise)
    end

    local function GetShellId(category, shell)
        local shells = exports.loaf_housing:GetShells()
        for i, v in pairs(shells[category].shells) do
            if v == shell then
                return i
            end
        end

        return
    end

    local function TransferProperty(name, serverId)
        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "property_transfer", {
            title = Strings["property_transfer"]
        }, function(data, menu)
            local propertyId = tonumber(data.value)
            if not propertyId then
                return Notify(Strings["invalid_property"])
            end

            ESX.UI.Menu.CloseAll()
            
            local houseData = exports.loaf_housing:GetHouse(propertyId)
            if not houseData then
                return Notify(Strings["invalid_property"])
            end
            
            local shellId
            if houseData.interiortype == "shell" and not houseData.shell then
                shellId = SelectInterior(houseData.category)
            elseif houseData.interiortype == "shell" then
                shellId = GetShellId(houseData.category, houseData.shell)
            end

            TriggerServerEvent("loaf_realtor:transfer_property", serverId, propertyId, false, shellId)
        end, CloseMenuHandler)
    end

    local function RentProperty(name, serverId)
        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "property_rent", {
            title = Strings["property_rent"]
        }, function(data, menu)
            local propertyId = tonumber(data.value)
            if not propertyId then
                return Notify(Strings["invalid_property"])
            end
            
            local houseData = exports.loaf_housing:GetHouse(propertyId)

            if not houseData?.rent then
                return Notify(Strings["property_no_rent"])
            end
            
            ESX.UI.Menu.CloseAll()
            
            local shellId
            if houseData.interiortype == "shell" and not houseData.shell then
                shellId = SelectInterior(houseData.category)
            elseif houseData.interiortype == "shell" then
                shellId = GetShellId(houseData.category, houseData.shell)
            end
            TriggerServerEvent("loaf_realtor:transfer_property", serverId, propertyId, true, shellId)
        end, CloseMenuHandler)
    end

    function jobActions.transfer_bill(label)
        local elements = {}
        for _, v in pairs(GetPlayers()) do
            table.insert(elements, {
                label = v.name,
                value = v.serverId
            })
        end
        if #elements == 0 then
            table.insert(elements, {
                label = Strings["noone_nearby"]
            })
        end

        local title = "error"
        if label == Strings["bill_player"] then
            title = Strings["who_bill"]
        elseif label == Strings["transfer_property"] then
            title = Strings["who_transfer"]
        elseif label == Strings["rent_property"] then
            title = Strings["who_rent"]
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "transfer_bill_menu", {
            title = title,
            align = Config.MenuAlign,
            elements = elements
        }, function(data, menu)
            if not data.current.value then
                return menu.close()
            end

            if label == Strings["bill_player"] then
                BillPlayer(data.current.label, data.current.value)
            elseif label == Strings["transfer_property"] then
                TransferProperty(data.current.label, data.current.value)
            elseif label == Strings["rent_property"] then
                RentProperty(data.current.label, data.current.value)
            end
        end, CloseMenuHandler)
    end

    -- menu to create a house
    local function FinishHouseCreation(entrance, garageEntrance, garageExit, interiorType, interior, category, propertyType, rent, misc)
        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "house_label", {
            title = Strings[propertyType .. "_label"]
        }, function(data, menu)
            local name = data.value
            if name == nil or #name < 3 then
                return Notify(Strings["short_name"])
            end
            menu.close()

            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "property_price", {
                title = Strings["property_price"]
            }, function(data, menu)
                local price = tonumber(data.value)
                if not price or price < Config.MinPrice then
                    Notify(Strings["price_low"])
                    menu.close()
                    return
                end
                
                if misc then
                    local locations = {}
                    for k, v in pairs(misc.locations) do
                        locations["location_"..k] = v
                    end
                    misc.locations = locations
                end
                
                TriggerServerEvent("loaf_realtor:add_property", {
                    entrance = entrance, 
                    garageEntrance = garageEntrance, 
                    garageExit = garageExit, 
                    interiorType = interiorType,
                    interior = interior, 
                    category = category, 
                    propertyType = propertyType, 
                    name = name, 
                    price = price, 
                    rent = rent, 
                    misc = misc
                })
                
                ESX.UI.Menu.CloseAll()
            end, CloseMenuHandler)

        end, CloseMenuHandler)
    end

    local function SelectHouseType(entrance, garageEntrance, garageExit, interiorType, interior, category, rent)
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "finish_house", {
            title = Strings["set_propertytype"],
            align = Config.MenuAlign,
            elements = {
                {label = Strings["house"], value = "house"},
                {label = Strings["apartment"], value = "apartment"}
            }
        }, function(data, menu)
            FinishHouseCreation(entrance, garageEntrance, garageExit, interiorType, interior, category, data.current.value, rent)
        end, CloseMenuHandler)
    end

    local function SelectInterior(cb)
        local config, shells = exports.loaf_housing:GetConfig(), exports.loaf_housing:GetShells()
        local elements = {}
        
        local elements2 = {}
        for k, v in pairs(config.Interiors) do
            table.insert(elements2, {
                label = v.label,
                interiorType = "interior",
                interior = k
            })
        end
        if #elements2 > 0 then
            table.insert(elements, {
                label = Strings["misc_interiors"],
                elements = elements2
            })
        end

        table.sort(shells)
        for category, data in pairs(shells) do
            local elements2 = {}
            for i, shell in pairs(data.shells) do
                table.insert(elements2, {
                    label = shell,
                    interiorType = "shell",
                    interior = shell,
                    category = category
                })
            end
            if #elements2 > 0 then
                table.insert(elements2, {
                    label = Strings["all_interiors"],
                    interiorType = "shell",
                    category = category
                })
            end
            if #elements2 > 0 then
                table.insert(elements, {
                    label = data.label or category,
                    elements = elements2
                })
            end
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "choose_category", {
            title = Strings["choose_interior"],
            align = Config.MenuAlign,
            elements = elements
        }, function(data, menu)
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "choose_interior", {
                title = Strings["choose_interior"],
                align = Config.MenuAlign,
                elements = data.current.elements
            }, function(data2, menu2)
                cb(data2.current.interiorType, data2.current.interior, data2.current.category, data2.current.label)
                menu.close()
                menu2.close()
            end, CloseMenuHandler)
        end, CloseMenuHandler)
    end

    local function AddDoor(cb)
        local entity, coords, heading
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "add_door", {
            title = Strings["add_door"],
            align = Config.MenuAlign,
            elements = {
                {label = Strings["add_highlighted"], value = "add"},
                {label = Strings["cancel"], value = "cancel"}
            }
        }, function(data, menu)
            if data.current.value == "add" and entity then
                cb(entity, vector4(coords.x, coords.y, coords.z, heading))
                menu.close()
            else
                menu.close()
            end
        end, CloseMenuHandler)

        local nextCheck = GetGameTimer()
        while not ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "add_door") do Wait(0) end
        while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "add_door") do
            Wait(0)

            if nextCheck <= GetGameTimer() then
                nextCheck = GetGameTimer() + 150
                local hit, _entity = GetEntityFromCursor()
                if hit then
                    entity = _entity
                    coords = GetEntityCoords(_entity)
                    heading = GetEntityHeading(_entity)
                end
            end

            if entity then
                DrawEntityBox(entity)
                Draw3DText(Strings["highlighted_door"], coords)
            end
        end
    end

    local function AddLocation(cb)
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "add_location", {
            title = Strings["add_location"],
            align = Config.MenuAlign,
            elements = {
                {label = Strings["storage"], storage = true, wardrobe = false},
                {label = Strings["wardrobe"], storage = false, wardrobe = true},
                {label = Strings["wardobe_storage"], storage = true, wardrobe = true},
            }
        }, function(data, menu)
            cb(GetEntityCoords(PlayerPedId()), data.current.storage, data.current.wardrobe)
            menu.close()
        end, CloseMenuHandler)
    end

    function jobActions.create(label)
        local isWalkin = label == Strings["create_walkin"]

        local entranceVector, exitVector
        local entrance, garageEntrance, garageExit, interiorType, interior, category, misc, rent

        if isWalkin then
            misc = {
                doors = {},
                locations = {}
            }
        end

        local elements = {
            {label = Strings["set_entrance"], value = "entrance"},

            {label = Strings["set_garage_entrance"], value = "garage_entrance"},
            {label = Strings["set_garage_exit"], value = "garage_exit"},
        }
        
        if isWalkin then
            table.insert(elements, {label = Strings["add_door"], value = "add_door"})
            table.insert(elements, {label = Strings["remove_door"], value = "remove_door"})
            
            table.insert(elements, {label = Strings["add_location"], value = "add_location"})
            table.insert(elements, {label = Strings["remove_location"], value = "remove_location"})
        else
            table.insert(elements, {label = Strings["set_interior"], value = "interior"})
        end

        if Config.Rent then
            table.insert(elements, {label = Strings["set_rent"], value = "set_rent"})
        end

        table.insert(elements, {label = Strings["add_property"], value = "create"})

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "create_house", {
            title = label,
            align = Config.MenuAlign,
            elements = elements
        }, function(data, menu)
            if data.current.value == "entrance" then
                local coords = GetEntityCoords(PlayerPedId())
                entrance = vector4(coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()))
                entranceVector = GetEntityForwardVector(PlayerPedId())
            elseif data.current.value == "garage_entrance" then
                garageEntrance = GetEntityCoords(PlayerPedId())
            elseif data.current.value == "garage_exit" then
                local coords = not IsPedInAnyVehicle(PlayerPedId(), true) and GetEntityCoords(PlayerPedId()) or GetEntityCoords(PlayerPedId()) + vec3(0.0, 0.0, 0.5)
                garageExit = vector4(coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()))
                exitVector = GetEntityForwardVector(PlayerPedId())
            elseif data.current.value == "interior" then
                SelectInterior(function(_type, _interior, _category, label)
                    interiorType = _type
                    interior = _interior
                    category = _category

                    print(category)
                    Notify(Strings["interior_set"]:format(label))
                end)
            elseif data.current.value == "create" then
                if not entrance then
                    return Notify(Strings["must_entrance"])
                end
                if not isWalkin then
                    if not interior and not category then
                        return Notify(Strings["must_interior"])
                    end

                    SelectHouseType(entrance, garageEntrance, garageExit, interiorType, interior, category, rent)
                else
                    if #misc.doors == 0 then
                        return Notify(Strings["must_door"])
                    end

                    FinishHouseCreation(entrance, garageEntrance, garageExit, "walkin", nil, nil, "house", rent, misc)
                end
            elseif data.current.value == "set_rent" then
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "set_rent", {
                    title = Strings["rent_amount"]
                }, function(data2, menu2)
                    local _rent = tonumber(data2.value)
                    if _rent then
                        rent = _rent
                        Notify(Strings["rent_set"]:format(_rent))

                        menu2.close()
                    else
                        Notify(Strings["invalid_rent"])
                    end
                end, CloseMenuHandler)
            end

            -- MLO
            if data.current.value == "add_door" then
                AddDoor(function(entity, coords)
                    for _, v in pairs(misc.doors) do
                        if #(v.coords.xyz - coords.xyz) <= 0.5 then
                            return
                        end
                    end
                    table.insert(misc.doors, {
                        object = GetEntityModel(entity),
                        coords = coords
                    })
                end)
            elseif data.current.value == "remove_door" then
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "door_remove", {
                    title = Strings["door_remove"]
                }, function(data, menu)
                    local doorId = tonumber(data.value)
                    if not doorId then
                        return
                    end
                    if misc.doors[doorId] then
                        table.remove(misc.doors, doorId)
                        menu.close()
                    end
                end, CloseMenuHandler)
            elseif data.current.value == "add_location" then
                AddLocation(function(coords, isStorage, isWardrobe)
                    for _, v in pairs(misc.locations) do
                        if #(v.coords - coords) <= 2.5 then
                            return
                        end
                    end
                    table.insert(misc.locations, {
                        coords = coords,
                        scale = vector3(1.5, 1.5, 0.5),
                        storage = isStorage,
                        wardrobe = isWardrobe
                    })
                end)
            elseif data.current.value == "remove_location" then
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "location_remove", {
                    title = Strings["location_remove"]
                }, function(data, menu)
                    local locationId = tonumber(data.value)
                    if not locationId then
                        return
                    end
                    if misc.locations[locationId] then
                        table.remove(misc.locations, locationId)
                        menu.close()
                    end
                end, CloseMenuHandler)
            end
        end, CloseMenuHandler)
        
        while not ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "create_house") do Wait(0) end -- wait for menu to open
        while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "create_house") do
            Wait(0)

            if entrance then
                DrawMarker(1, entrance.xyz - vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), vec3(0.8, 0.8, 0.4), 255, 255, 0, 150)
                DrawMarker(2, entrance.xyz - vec3(0.0, 0.0, 0.5), entranceVector, vec3(90.0, 0.1, 90.0), vec3(0.4, 0.4, 0.4), 255, 255, 0, 150)

                Draw3DText(Strings["entrance"], entrance.xyz - vec3(0.0, 0.0, 0.2))
            end

            if garageEntrance then
                DrawMarker(1, garageEntrance - vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), vec3(0.8, 0.8, 0.4), 255, 255, 0, 150)

                Draw3DText(Strings["garage_entrance"], garageEntrance - vec3(0.0, 0.0, 0.5))
            end

            if garageExit then
                DrawMarker(1, garageExit.xyz - vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), vec3(0.8, 0.8, 0.4), 255, 255, 0, 150)
                DrawMarker(2, garageExit.xyz - vec3(0.0, 0.0, 0.5), exitVector, vec3(90.0, 0.1, 90.0), vec3(0.4, 0.4, 0.4), 255, 255, 0, 150)

                Draw3DText(Strings["garage_exit"], garageExit.xyz - vec3(0.0, 0.0, 0.2))
            end

            if isWalkin then
                for k, v in pairs(misc.locations) do
                    DrawMarker(1, v.coords - vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), v.scale, 255, 255, 0, 150)
                    Draw3DText(Strings["location"]:format(k), v.coords)
                end

                for k, v in pairs(misc.doors) do
                    Draw3DText(Strings["door"]:format(k), v.coords.xyz)
                end
            end
        end
    end

    -- menu to remove a house
    function jobActions.remove()
        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "property_remove", {
            title = Strings["property_remove"]
        }, function(data, menu)
            local propertyId = tonumber(data.value)
            if not propertyId then
                return
            end
            TriggerServerEvent("loaf_realtor:remove_property", propertyId)
            ESX.UI.Menu.CloseAll()
        end, CloseMenuHandler)
    end
    
    loaded = true
end)