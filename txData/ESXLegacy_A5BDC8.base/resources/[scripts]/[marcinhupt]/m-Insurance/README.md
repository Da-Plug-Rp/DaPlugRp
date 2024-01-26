# m-Insurance script for ESX

| If you are intested in recieving updates join the community on **[Discord](https://discord.gg/marcinhu)**! |

# Features
- Optimized
- Many Features
- Full and easy customization
- 0.00ms
- Car Registration
- Car Insurance
- Health Insurance
- Home Insurance
- 30/60/90 Days Insurance
- Item with all information of the vehicle and expire date
- Command `checkinsurance` to check insurance on specific plate.
- Command `removeinsurance` to remove insurance on specific plate.
- Command `checkhealthinsurance` to check health insurance on specific citizenid.
- Command `removehealthinsurance` to remove health insurance on specific citizenid.
- Command `checkhomeinsurance` to check home insurance on specific citizenid.
- Command `removehomeinsurance` to remove home insurance on specific citizenid.
- All the commands can be blocked by job.
- Every hour, the SQL dates are checked and if any date is exceeded, the insurance information is removed from the SQL.
- Support for ox target.
- Support for ox inventory.
- Support for dp/rp emotes.
- Support for ox menu.

# Exports:
- Check if car has insurance use: `exports["m-Insurance"]:haveInsurance(plate)`
- Check if player has health insurance: `exports["m-Insurance"]:haveHealthInsurance(identifier)`
- Check if player has home insurance: `exports["m-Insurance"]:haveHomeInsurance(identifier)`

# Required

- if the Vehicle Model appears NULL to check the vehicles.meta and that the gameName needs to be the same as the modelName

You need to SetUp `SQL.sql`. Basically click on the file and run it using HeidSQL.


## Installation ##

1. ox_inventory/data/items.lua

```lua

    ['car_registration'] = { label = 'Car Registration', weight = 50, stack = true, allowArmed = false },
    ['health_insurance'] = { label = 'Health Insurance', weight = 50, stack = true, allowArmed = false },
    ['insurance'] = { label = 'Car Insurance', weight = 50, stack = true, allowArmed = false },
    ['home_insurance'] = { label = 'Home Insurance', weight = 50, stack = true, allowArmed = false },

```

1.2. If you use quasar-inventory

- Go to metadaja.js and add:

```lua

} else if (itemData.name == "insurance") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Name: </strong><span>" +
            itemData.info.name +
            "</span></p><p><strong>Plate: </strong><span>" +
            itemData.info.plate +
            "</span></p><p><strong>Vehicle Model: </strong><span>" +
            itemData.info.model +
            "</span></p><p><strong>Date: </strong><span>" +
            itemData.info.date +
            "</span></p><p><strong>Expires: </strong><span>" +
            itemData.info.expire +
            "</span></p>"
        );

    } else if (itemData.name == "car_registration") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Name: </strong><span>" +
            itemData.info.name +
            "</span></p><p><strong>Plate: </strong><span>" +
            itemData.info.plate +
            "</span></p><p><strong>Vehicle Model: </strong><span>" +
            itemData.info.model +
            "</span></p>"
        );

    } else if (itemData.name == "health_insurance") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Name: </strong><span>" +
            itemData.info.name +
            "<p><strong>CitizenID: </strong><span>" +
            itemData.info.citizenid +
            "</span></p><p><strong>Date: </strong><span>" +
            itemData.info.date +
            "</span></p><p><strong>Expires: </strong><span>" +
            itemData.info.expire +
            "</span></p>"
        );
    } else if (itemData.name == "home_insurance") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Name: </strong><span>" +
            itemData.info.name +
            "<p><strong>CitizenID: </strong><span>" +
            itemData.info.citizenid +
            "</span></p><p><strong>Date: </strong><span>" +
            itemData.info.date +
            "</span></p><p><strong>Expires: </strong><span>" +
            itemData.info.expire +
            "</span></p>"
        );

```

2. dpemotes/Client/AnimationList.lua

```lua

    ["health_insurance"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Card", AnimationOptions =
    {
        Prop = "m-insurance_prop_card_health",
        PropBone = 18905,
        PropPlacement = {0.17, 0.03, 0.04, 1.0, 184.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["car_insurance"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Card", AnimationOptions =
    {
        Prop = "m-insurance_prop_card_vehicle",
        PropBone = 18905,
        PropPlacement = {0.17, 0.03, 0.04, 1.0, 184.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["car_registration"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Card", AnimationOptions =
    {
        Prop = "m-insurance_prop_card_registration",
        PropBone = 18905,
        PropPlacement = {0.17, 0.03, 0.04, 1.0, 184.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["home_insurance"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Card", AnimationOptions =
    {
        Prop = "m-insurance_prop_card_house",
        PropBone = 18905,
        PropPlacement = {0.17, 0.03, 0.04, 1.0, 184.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},

```

2. scully_emotemenu/data/animations/prop_emotes.lua

```lua
    {
        Label = 'Health Insurance',
        Command = 'health_insurance',
        Animation = 'ped_a_enter_loop',
        Dictionary = 'anim@heists@humane_labs@finale@keycards',
        Options = {
            Props = {
                {
                    Bone = 18905,
                    Name = 'm-insurance_prop_card_health',
                    Placement = {
                        vector3(0.17, 0.03, 0.04),
                        vector3(1.0, 184.0, 0.0),
                    },
                },
            },
        },
    },
    {
        Label = 'Car Insurance',
        Command = 'car_insurance',
        Animation = 'ped_a_enter_loop',
        Dictionary = 'anim@heists@humane_labs@finale@keycards',
        Options = {
            Props = {
                {
                    Bone = 18905,
                    Name = 'm-insurance_prop_card_vehicle',
                    Placement = {
                        vector3(0.17, 0.03, 0.04),
                        vector3(1.0, 184.0, 0.0),
                    },
                },
            },
        },
    },
    {
        Label = 'Car Registration',
        Command = 'car_registration',
        Animation = 'ped_a_enter_loop',
        Dictionary = 'anim@heists@humane_labs@finale@keycards',
        Options = {
            Props = {
                {
                    Bone = 18905,
                    Name = 'm-insurance_prop_card_registration',
                    Placement = {
                        vector3(0.17, 0.03, 0.04),
                        vector3(1.0, 184.0, 0.0),
                    },
                },
            },
        },
    },
    {
        Label = 'Home Registration',
        Command = 'home_insurance',
        Animation = 'ped_a_enter_loop',
        Dictionary = 'anim@heists@humane_labs@finale@keycards',
        Options = {
            Props = {
                {
                    Bone = 18905,
                    Name = 'm-insurance_prop_card_house',
                    Placement = {
                        vector3(0.17, 0.03, 0.04),
                        vector3(1.0, 184.0, 0.0),
                    },
                },
            },
        },
    },

```

# Compatibilities ( Give car registration on vehicle shops when you buy a new vehicle ):

1. okokVehicleShop/sv_utils.lua

Search this code:

```lua
    RegisterServerEvent(Config.EventPrefix..':setVehicleOwned')
    AddEventHandler(Config.EventPrefix..':setVehicleOwned', function (vehicleProps, model, id)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        if Config.Boats[model] == true then
            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate,
                ['@vehicle'] = json.encode(vehicleProps),
                ['@type'] = 'boat'
            }, function (rowsChanged)
            end)
        elseif Config.Aircrafts[model] == true then
            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate,
                ['@vehicle'] = json.encode(vehicleProps),
                ['@type'] = 'air'
            }, function (rowsChanged)
            end)
        else
            MySQLexecute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
            {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate:match( "^%s*(.-)%s*$" ),
                ['@vehicle'] = json.encode(vehicleProps)
            }, function (rowsChanged)
            end)
        end
    end)
```

Replace with: 

```lua
    RegisterServerEvent(Config.EventPrefix..':setVehicleOwned')
    AddEventHandler(Config.EventPrefix..':setVehicleOwned', function (vehicleProps, model, id)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        local name     = xPlayer.getName()
        local identifier = GetPlayerIdentifier(src, 0)

        if Config.Boats[model] == true then
            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate,
                ['@vehicle'] = json.encode(vehicleProps),
                ['@type'] = 'boat'
            }, function (rowsChanged)
            end)
        elseif Config.Aircrafts[model] == true then
            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate,
                ['@vehicle'] = json.encode(vehicleProps),
                ['@type'] = 'air'
            }, function (rowsChanged)
            end)
        else
            MySQLexecute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
            {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate:match( "^%s*(.-)%s*$" ),
                ['@vehicle'] = json.encode(vehicleProps)
            }, function (rowsChanged)
            end)
        end

        local metadata = { description = 'Name: '..name..'   \nPlate: '..vehicleProps.plate..'   \nModel: '..model }
        exports.ox_inventory:AddItem(_source, 'car_registration', 1, metadata)
        MySQLexecute('INSERT INTO m_insurance_registration (plate, model, registration,identifier) VALUES (?, ?, ?, ?)', {vehicleProps.plate, model, 1, identifier})
    end)
```

2. esx_vehicleshop/server/main.lua

Search this code:

```lua
    RegisterServerEvent('esx_vehicleshop:setVehicleOwned')
    AddEventHandler('esx_vehicleshop:setVehicleOwned', function (vehicleProps)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
        {
            ['@owner']   = xPlayer.identifier,
            ['@plate']   = vehicleProps.plate,
            ['@vehicle'] = json.encode(vehicleProps)
        }, function (rowsChanged)
            TriggerClientEvent('esx:showNotification', _source, _U('vehicle_belongs', vehicleProps.plate))
        end)
    end)
```

Replace with: 

```lua
    RegisterServerEvent('esx_vehicleshop:setVehicleOwned')
    AddEventHandler('esx_vehicleshop:setVehicleOwned', function (vehicleProps)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        local name = xPlayer.getName()
        local identifier = GetPlayerIdentifier(_source, 0)

        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
        {
            ['@owner']   = xPlayer.identifier,
            ['@plate']   = vehicleProps.plate,
            ['@vehicle'] = json.encode(vehicleProps)
        }, function (rowsChanged)
            TriggerClientEvent('esx:showNotification', _source, _U('vehicle_belongs', vehicleProps.plate))
        end)

        local metadata = { description = 'Name: '..name..'   \nPlate: '..vehicleProps.plate..'   \nModel: '..vehicle }
        exports.ox_inventory:AddItem(src, 'car_registration', 1, metadata)
        MySQL.insert('INSERT INTO m_insurance_registration (plate, model, registration, identifier) VALUES (?, ?, ?, ?)', {vehicleProps.plate, vehicle, 1, identifier})
    end)
```