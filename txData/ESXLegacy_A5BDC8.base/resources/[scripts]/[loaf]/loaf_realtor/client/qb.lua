CreateThread(function()
    if Config.Framework ~= "qb" then return end
    local QBCore
    while not QBCore do
        QBCore = exports["qb-core"]:GetCoreObject()
        Wait(500)
    end
    while not QBCore.Functions.GetPlayerData() or not QBCore.Functions.GetPlayerData().job do
        Wait(500)
    end

    function Notify(msg)
        QBCore.Functions.Notify(msg)
    end

    function OnJob(job)
        Wait(500)

        if not job then
            job = QBCore.Functions.GetPlayerData().job
        end

        hasJob = job.name == Config.JobName
        isBoss = hasJob and job.isboss
        canCreate = hasJob and job.grade.level >= Config.CreateGrade

        RefreshMarkers()
    end
    RegisterNetEvent("QBCore:Client:OnJobUpdate", OnJob)

    function BossActions()
        if not isBoss then
            return
        end

        TriggerEvent("qb-bossmenu:client:openMenu")
        TriggerEvent("qb-bossmenu:client:OpenMenu")
    end

    -- house creation
    local creatingHouse = false
    local isWalkin = false
    local entranceVector, exitVector
    local entrance, garageEntrance, garageExit, interiorType, interior, category, misc

    local function FinishProperty(propertyType)
        local dialog = exports["qb-input"]:ShowInput({
            header = Strings["add_property"],
            submitText = Strings["add_property"],
            inputs = {
                {
                    text = Strings[propertyType .. "_label"],
                    name = "label",
                    type = "text",
                    isRequired = true
                },
                {
                    text = Strings["property_price"],
                    name = "price",
                    type = "number",
                    isRequired = true
                },
                {
                    text = Strings["property_rent_amount"],
                    name = "rent",
                    type = "number",
                    isRequired = false
                }
            }
        })

        if dialog and dialog.label and dialog.price then
            local name, price = dialog.label, tonumber(dialog.price)
            if not price or price < Config.MinPrice then
                Notify(Strings["price_low"])
                return
            end

            if name == nil or #name < 3 then
                return Notify(Strings["short_name"])
            end

            local rent = nil
            if dialog.rent and tonumber(dialog.rent) then
                rent = tonumber(dialog.rent)
                if rent <= 0 then
                    return Notify(Strings["invalid_rent"])
                end
            end

            print("RENT", rent)

            if isWalkin then
                interiorType = "walkin"
                interior = ""
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
            creatingHouse = false
        end
    end

    local function SetPropertyType()
        exports["qb-menu"]:openMenu({
            {
                header = Strings["set_propertytype"],
                isMenuHeader = true
            },
            {
                header = Strings["house"],
                params = {
                    args = "house",
                    event = FinishProperty,
                    isAction = true
                }
            },
            {
                header = Strings["apartment"],
                params = {
                    args = "apartment",
                    event = FinishProperty,
                    isAction = true
                }
            }
        })
    end

    local function SetInterior(data)
        interiorType = data.type
        interior = data.interior
        category = data.category

        Notify(Strings["interior_set"]:format(data.label))
    end

    local function SelectInterior()
        if not creatingHouse then
            return
        end

        local config, shells = exports.loaf_housing:GetConfig(), exports.loaf_housing:GetShells()
        local categoryElements = {
            {
                header = Strings["choose_interior"],
                isMenuHeader = true
            }
        }
        local interiorElements = {}

        for k, v in pairs(config.Interiors) do
            if not interiorElements["misc_interiors"] then
                interiorElements["misc_interiors"] = {
                    {
                        header = Strings["choose_interior"],
                        isMenuHeader = true
                    }
                }
            end

            table.insert(interiorElements["misc_interiors"], {
                header = v.label,
                params = {
                    event = SetInterior,
                    args = {
                        type = "interior", 
                        interior = k, 
                        label = v.label
                    },
                    isAction = true
                }
            })
        end
        
        if interiorElements["misc_interiors"] then
            table.insert(categoryElements, {
                header = Strings["misc_interiors"],
                params = {
                    event = function()
                        exports["qb-menu"]:openMenu(interiorElements["misc_interiors"])
                    end,
                    isAction = true
                }
            })
        end

        for category, data in pairs(shells) do
            for i, shell in pairs(data.shells) do
                if not interiorElements[category] then
                    interiorElements[category] = {
                        {
                            header = Strings["choose_interior"],
                            isMenuHeader = true
                        }
                    }
                end

                table.insert(interiorElements[category], {
                    header = shell,
                    params = {
                        event = SetInterior,
                        args = {
                            type = "shell", 
                            interior = shell, 
                            category = category,
                            label = shell
                        },
                        isAction = true
                    }
                })
            end

            if interiorElements[category] then
                table.insert(interiorElements[category], {
                    header = Strings["all_interiors"],
                    params = {
                        event = SetInterior,
                        args = {
                            type = "shell",
                            category = category,
                            label = Strings["all_interiors"]
                        },
                        isAction = true
                    }
                })

                table.insert(categoryElements, {
                    header = data.label or category,
                    params = {
                        event = function()
                            exports["qb-menu"]:openMenu(interiorElements[category])
                        end,
                        isAction = true
                    }
                })
            end
        end

        exports["qb-menu"]:openMenu(categoryElements)
    end

    local function HouseCreationMenu()
        if not creatingHouse then
            creatingHouse = true
            isWalkin = false
            entranceVector, exitVector, entrance, garageEntrance, garageExit, interiorType, interior, category = nil, nil, nil, nil, nil, nil, nil, nil
        end

        exports["qb-menu"]:openMenu({
            {
                header = Strings["create_property"],
                isMenuHeader = true
            },
            {
                header = Strings["set_entrance"], 
                params = {
                    event = function()
                        local coords = GetEntityCoords(PlayerPedId())
                        entrance = vector4(coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()))
                        entranceVector = GetEntityForwardVector(PlayerPedId())
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["set_garage_entrance"], 
                params = {
                    event = function()
                        garageEntrance = GetEntityCoords(PlayerPedId())
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["set_garage_exit"], 
                params = {
                    event = function()
                        local coords = not IsPedInAnyVehicle(PlayerPedId(), true) and GetEntityCoords(PlayerPedId()) or GetEntityCoords(PlayerPedId()) + vec3(0.0, 0.0, 0.5)
                        garageExit = vector4(coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()))
                        exitVector = GetEntityForwardVector(PlayerPedId())
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["set_interior"], 
                params = {
                    event = SelectInterior,
                    isAction = true
                }
            },
            {
                header = Strings["cancel_creation"],
                params = {
                    event = function()
                        creatingHouse = false
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["add_property"], 
                params = {
                    event = SetPropertyType,
                    isAction = true
                }
            }
        })
    end

    local nextCheck = GetGameTimer()
    local entity, coords

    local function AddDoor()
        while true do
            Wait(0)
            
            if nextCheck <= GetGameTimer() then
                nextCheck = GetGameTimer() + 150
                local hit, _entity = GetEntityFromCursor()
                if hit then
                    entity = _entity
                    local _coords = GetEntityCoords(_entity)
                    coords = vector4(_coords.x, _coords.y, _coords.z, GetEntityHeading(entity))
                end
            end

            if entity then
                DrawEntityBox(entity)
                Draw3DText(Strings["highlighted_door"], coords)
            end

            HelpText(Strings["add_door_tip"])
            if IsControlJustReleased(0, 191) then
                table.insert(misc.doors, {
                    object = GetEntityModel(entity),
                    coords = coords
                })
                break
            elseif IsControlJustReleased(0, 194) then
                break
            end
        end
    end

    local function InsertLocation(coords, isStorage, isWardrobe)
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
    end

    local function AddLocation()
        exports["qb-menu"]:openMenu({
            {
                header = Strings["add_location"],
                isMenuHeader = true
            },
            {
                header = Strings["storage"],
                params = {
                    event = function()
                        InsertLocation(GetEntityCoords(PlayerPedId()), true, false)
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["wardrobe"],
                params = {
                    event = function()
                        InsertLocation(GetEntityCoords(PlayerPedId()), false, true)
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["wardobe_storage"],
                params = {
                    event = function()
                        InsertLocation(GetEntityCoords(PlayerPedId()), true, true)
                    end,
                    isAction = true
                }
            },
        })
    end

    local function CreateWalkin()
        if not creatingHouse then
            creatingHouse = true
            isWalkin = true
            entranceVector, exitVector, entrance, garageEntrance, garageExit, interiorType, interior, category = nil, nil, nil, nil, nil, nil, nil, nil
            misc = {
                doors = {},
                locations = {}
            }
        end

        exports["qb-menu"]:openMenu({
            {
                header = Strings["create_property"],
                isMenuHeader = true
            },
            {
                header = Strings["set_entrance"], 
                params = {
                    event = function()
                        local coords = GetEntityCoords(PlayerPedId())
                        entrance = vector4(coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()))
                        entranceVector = GetEntityForwardVector(PlayerPedId())
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["set_garage_entrance"], 
                params = {
                    event = function()
                        garageEntrance = GetEntityCoords(PlayerPedId())
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["set_garage_exit"], 
                params = {
                    event = function()
                        local coords = not IsPedInAnyVehicle(PlayerPedId(), true) and GetEntityCoords(PlayerPedId()) or GetEntityCoords(PlayerPedId()) + vec3(0.0, 0.0, 0.5)
                        garageExit = vector4(coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()))
                        exitVector = GetEntityForwardVector(PlayerPedId())
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["add_door"],
                params = {
                    event = function()
                        AddDoor()
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["remove_door"],
                params = {
                    event = function()
                        local dialog = exports["qb-input"]:ShowInput({
                            header = Strings["door_remove"],
                            submitText = Strings["confirm_remove_door"],
                            inputs = {
                                {
                                    text = Strings["door_remove"],
                                    name = "id",
                                    type = "number",
                                    isRequired = true
                                }
                            }
                        })

                        if dialog and dialog.id and tonumber(dialog.id) and misc.doors[tonumber(dialog.id)] then
                            table.remove(misc.doors, tonumber(dialog.id))
                        end
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["add_location"],
                params = {
                    event = function()
                        AddLocation()
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["remove_location"],
                params = {
                    event = function()
                        local dialog = exports["qb-input"]:ShowInput({
                            header = Strings["location_remove"],
                            submitText = Strings["confirm_remove_location"],
                            inputs = {
                                {
                                    text = Strings["location_remove"],
                                    name = "id",
                                    type = "number",
                                    isRequired = true
                                }
                            }
                        })

                        if dialog and dialog.id and tonumber(dialog.id) and misc.locations[tonumber(dialog.id)] then
                            table.remove(misc.locations, tonumber(dialog.id))
                        end
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["cancel_creation"],
                params = {
                    event = function()
                        creatingHouse = false
                    end,
                    isAction = true
                }
            },
            {
                header = Strings["add_property"], 
                params = {
                    event = function()
                        if not entrance then
                            return Notify(Strings["must_entrance"])
                        end
                        if #misc.doors == 0 then
                            return Notify(Strings["must_door"])
                        end

                        FinishProperty("house")
                    end,
                    isAction = true
                }
            }
        })
    end

    -- remove property
    local function RemoveProperty()
        local dialog = exports["qb-input"]:ShowInput({
            header = Strings["remove_property"],
            submitText = Strings["remove"],
            inputs = {
                {
                    text = Strings["property_remove"],
                    name = "id",
                    type = "number",
                    isRequired = true
                }
            }
        })

        if not (dialog and dialog.id and tonumber(dialog.id)) then
            return
        end

        TriggerServerEvent("loaf_realtor:remove_property", tonumber(dialog.id))
    end

    -- select shell
    local function SelectInteriorFromCategory(category)
        local promise = promise.new()

        local elements = {
            {
                header = Strings["select_interior"],
                isMenuHeader = true
            }
        }
        local shells = exports.loaf_housing:GetShells()
        for i, v in pairs(shells[category].shells) do
            table.insert(elements, {
                header = v,
                params = {
                    event = function()
                        promise:resolve(i)
                    end,
                    isAction = true
                }
            })
        end

        exports["qb-menu"]:openMenu(elements)

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

    -- transfer & bill menu
    local function BillPlayer(serverId)
        local dialog = exports["qb-input"]:ShowInput({
            header = Strings["bill_player"],
            submitText = Strings["send_bill"],
            inputs = {
                {
                    text = Strings["houseid_bill"],
                    name = "id",
                    type = "number",
                    isRequired = true
                }
            }
        })

        if not (dialog and dialog.id and tonumber(dialog.id)) then
            return
        end

        TriggerServerEvent("loaf_realtor:bill_house", serverId, tonumber(dialog.id))
    end

    local function TransferProperty(serverId)
        local dialog = exports["qb-input"]:ShowInput({
            header = Strings["transfer_property"],
            submitText = Strings["transfer"],
            inputs = {
                {
                    text = Strings["property_transfer"],
                    name = "id",
                    type = "number",
                    isRequired = true
                }
            }
        })

        if not (dialog?.id and tonumber(dialog.id)) then
            return Notify(Strings["invalid_property"])
        end

        local propertyId = tonumber(dialog.id)
        local houseData = exports.loaf_housing:GetHouse(propertyId)
        if not houseData then
            return Notify(Strings["invalid_property"])
        end

        local shellId
        if houseData.interiortype == "shell" and not houseData.shell then
            shellId = SelectInteriorFromCategory(houseData.category)
        elseif houseData.interiortype == "shell" then
            shellId = GetShellId(houseData.category, houseData.shell)
        end

        TriggerServerEvent("loaf_realtor:transfer_property", serverId, propertyId, false, shellId)
    end

    local function RentProperty(serverId)
        local dialog = exports["qb-input"]:ShowInput({
            header = Strings["rent_property"],
            submitText = Strings["rent_property"],
            inputs = {
                {
                    text = Strings["property_rent"],
                    name = "id",
                    type = "number",
                    isRequired = true
                }
            }
        })

        if not (dialog?.id and tonumber(dialog.id)) then
            return Notify(Strings["invalid_property"])
        end

        local propertyId = tonumber(dialog.id)
        local houseData = exports.loaf_housing:GetHouse(propertyId)
        if not houseData?.rent then
            return Notify(Strings["property_no_rent"])
        end

        local shellId
        if houseData.interiortype == "shell" and not houseData.shell then
            shellId = SelectInteriorFromCategory(houseData.category)
        elseif houseData.interiortype == "shell" then
            shellId = GetShellId(houseData.category, houseData.shell)
        end

        TriggerServerEvent("loaf_realtor:transfer_property", serverId, propertyId, true, shellId)
    end

    local function TransferBill(transferOrBill)
        local elements = {
            {
                header = Strings["who_" .. transferOrBill],
                isMenuHeader = true
            }
        }

        for _, v in pairs(GetPlayers()) do
            table.insert(elements, {
                header = v.name,
                params = {
                    event = function()
                        if transferOrBill == "bill" then
                            BillPlayer(v.serverId)
                        elseif transferOrBill == "transfer" then
                            TransferProperty(v.serverId)
                        elseif transferOrBill == "rent" then
                            RentProperty(v.serverId)
                        end
                    end, 
                    isAction = true
                }
            })
        end
        if #elements == 0 then
            table.insert(elements, {
                header = Strings["noone_nearby"],
                params = {}
            })
        end

        exports["qb-menu"]:openMenu(elements)
    end

    -- job menu
    function JobMenu()
        if not hasJob then
            return
        end
        if creatingHouse then
            if isWalkin then
                CreateWalkin()
            else
                HouseCreationMenu()
            end
            return
        end

        local elements = {
            {
                header = Strings["job_menu"],
                isMenuHeader = true
            }, 
            {
                header = Strings["bill_player"],
                params = {
                    event = TransferBill,
                    isAction = true,
                    args = "bill"
                }
            },
            {
                header = Strings["transfer_property"],
                params = {
                    event = TransferBill,
                    isAction = true,
                    args = "transfer"
                }
            }
        }

        if Config.Rent then
            table.insert(elements, {
                header = Strings["rent_property"],
                params = {
                    event = TransferBill,
                    isAction = true,
                    args = "rent"
                }
            })
        end

        if canCreate then
            table.insert(elements, {
                header = Strings["create_property"],
                params = {
                    event = function()
                        HouseCreationMenu()
                        while creatingHouse do
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
                        end
                    end, 
                    isAction = true
                }
            })
            if Config.AllowWalkin then
                table.insert(elements, {
                    header = Strings["create_walkin"],
                    params = {
                        event = function()
                            CreateWalkin()

                            while creatingHouse do
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

                                for k, v in pairs(misc.locations) do
                                    DrawMarker(1, v.coords - vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), v.scale, 255, 255, 0, 150)
                                    Draw3DText(Strings["location"]:format(k), v.coords)
                                end
                
                                for k, v in pairs(misc.doors) do
                                    Draw3DText(Strings["door"]:format(k), v.coords.xyz)
                                end
                            end
                        end,
                        isAction = true
                    }
                })
            end
            table.insert(elements, {
                header = Strings["remove_property"],
                params = {
                    event = RemoveProperty,
                    isAction = true
                }
            })
        end

        exports["qb-menu"]:openMenu(elements)
    end
    
    loaded = true
end)