Config = {}
Config.Variables = {
    Debug = false,
    Framework = 'ESX', -- QB/ESX/None 
    Notify = 'ESX', -- QB/ESX/Custom -- custom function below
    UsingTarget = false, TargetResourceName = 'ox_target',
    EnableJobRestrictFeature = true, --Disable job requirements fully (no menu to select a job)
    UseCommand = false,
    InteractionRange = 4.0
}



Config.MenuItems = {
    displayScreen = {
        {type = 'input', label = 'Image URL', description = 'Some input description', required = true},
        {type = 'number', label = 'Width', description = 'Width', icon = 'hashtag', required = true, min = 1, max = 1920},
        {type = 'number', label = 'Height', description = 'Height', icon = 'hashtag', required = true, min = 1, max = 1080},
    },
    panelAmount = {
        {type = 'number', label = 'Number', description = 'Amount of images inside panel', required = true,min = 1, max = 20},
    },
    panelImages = {type = 'input', label = 'Image URL', description = 'Image URL [PNG, JPG, GIF]', required = true},
    panelEdit = {type = 'input', placeholder = 'IMAGE URL', default = q, label = 'Image URL', description = 'Image URL [PNG, JPG, GIF]', required = false},
    panelText = {
        panelOpen = 'Open Panel',
        panelEdit = 'Edit Panel',
        intPanel = '[E] - Open panel [G] - Edit panel' -- if not using target
    },
    panelJob = {
        {type = 'input', label = 'Job name', description = 'Shortname [police, mechanic, unemployed, ect]', default='none', required = true},
        {type = 'number', label = 'Rank', description = 'Job Rank', icon = 'hashtag', default=0, required = true, min = 0, max = 999},
    },
    rotationText = [[Position: 

        [←] Left/Right Arrow [→] 
        [E] Place Display]],
    panelPickup = {type = 'checkbox', label = 'Pickup'},
    cantDo = 'You cannot do this.',
    displayText = 'Display Screen',
    amountText = 'Panel Image Amount',
    setupImagesText = 'Panel Images Setup',
    jobText = 'Job details'
}


Config.Controls = {
    panelControls = {
        openPanel = 51,
        editPanel = 58,
        placePanel = 38, 
    }
}


if not IsDuplicityVersion() then --Client Side


    function TargetSetup(entity, objectData)
        exports[Config.Variables.TargetResourceName]:AddTargetEntity(entity, {
            options = {
                {
                    type = "client",
                    event = "k_displaystand:openpage",
                    icon = "fas fa-box-circle-check",
                    label = Config.MenuItems.panelText.panelOpen,
                    obj = objectData
                },
                {
                    type = "client",
                    event = "k_displaystand:openpageEdit",
                    icon = "fas fa-box-circle-check",
                    label = Config.MenuItems.panelText.panelEdit,
                    obj = objectData
                },
            },
            distance = 10.0
        })
    end
    if Config.Variables.useCommand then
        RegisterCommand('createStand', function(source, args)
            TriggerEvent('k_displaystand:createStand')
         end)
    end

    function OpenPage(images, displayStandData) -- You could use this to add your own menus?
        --[[
            displayStandData has the same structure as savePanels.json entries you can use this to get more info if needed
        ]]
        SetNuiFocus(1, 1)
        SendNUIMessage({
            action = "open",
            pages = images
        })
    end

    function isNearbyADisplay(displayItemData)
        --fires once when nearby a display
        print('nearby')
    end
    
    function Notify(text, type)
        lib.notify({
            title = 'Display Stand',
            description = text,
            position = 'bottom',
            type = type
        })
    end
else
    function DropExploiter(src)
        DropPlayer(src, 'stinky cheetor')
    end
end
