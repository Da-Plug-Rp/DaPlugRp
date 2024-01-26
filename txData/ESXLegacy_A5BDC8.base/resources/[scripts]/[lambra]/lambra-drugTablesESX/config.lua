Config = {}

Config.Target = false -- set this to "qb-target" to use the Eye system

Config.TimePickup = 8000 -- time in ms that will take to pickup the table
Config.TimeCollect = 12000 --time in ms that will take to check if the product is ready
Config.threadDelay = 60000 -- time in ms that will take to handle tables behaviour
Config.DamageWithoutHazmat = 10 --Damage ped will take if not wearing required hazmat table

Config.WaterTempRelief = 2 -- How many degrees water will relief temperature to the system PER USE
Config.FanTempRelief = 1 -- How many degrees the fan will relief temperature to the system PER MINUTE

Config.Tables = {
    --You can add as many drug types with the prop you want
    ["bkr_prop_weed_table_01a"] = {--Index is the prop that will be spawning
        tableItem = "weedtable", --The item used to place the table
        ingredients = {--You can add/remove/change more ingredients
            {item = "weedleaf", label = "Weed leaf", requiredAmount = 5}
        },
        rewardItem = {item = "processedweed", amount = 1}, --The final product that the player will receive
        requiredMinCooking = 5, -- minutes that needed to be cooking to get the final product
        overcookMargin = 2, -- requiredMinCooking + overcookMargin value table will explode
        startTemp = 25, --Temperature that table will start with
        tempIncrement = 3, --Raise of temperature of the system PER MINUTE
        minTemp = 20, --If the system goes below that value, it will turn OFF (Flooded system with water)
        maxTemp = 50, --If the system goes up that value, table will explode losing everything
        damage = true -- Turn that to false so it wont give any damage if no hazmat suit is being used
    },
    ["bkr_prop_coke_table01a"] = {--Index is the prop that will be spawning
        tableItem = "coketable", --The item used to place the table
        ingredients = {--You can add/remove/change more ingredients
            {item = "cokeleaf", label = "Coke leaf", requiredAmount = 2},
            {item = "druggasoline", label = "Gasoline", requiredAmount = 1},
            {item = "drugsolvent", label = "Solvent", requiredAmount = 3}
        },
        rewardItem = {item = "processedcoke", amount = 1}, --The final product that the player will receive
        requiredMinCooking = 5, -- minutes that needed to be cooking to get the final product
        overcookMargin = 2, -- requiredMinCooking + overcookMargin value table will explode
        startTemp = 25, --Temperature that table will start with
        tempIncrement = 3, --Raise of temperature of the system PER MINUTE
        minTemp = 20, --If the system goes below that value, it will turn OFF
        maxTemp = 50, --If the system goes up that value, table will explode losing everything
        damage = true -- Turn that to false so it wont give any damage if no hazmat suit is being used
    },
    ["bkr_prop_meth_table01a"] = {--Index is the prop that will be spawning
        tableItem = "methtable", --The item used to place the table
        ingredients = {--You can add/remove/change more ingredients
            {item = "rawmeth", label = "Raw meth", requiredAmount = 1},
            {item = "drugsulfur", label = "Sulfur", requiredAmount = 3},
            {item = "drugphosphorus", label = "Phosphorus", requiredAmount = 2}
        },
        rewardItem = {item = "processedmeth", amount = 1}, --The final product that the player will receive
        requiredMinCooking = 5, -- minutes that needed to be cooking to get the final product
        overcookMargin = 2, -- requiredMinCooking + overcookMargin value table will explode
        startTemp = 25, --Temperature that table will start with
        tempIncrement = 3, --Raise of temperature of the system PER MINUTE
        minTemp = 20, --If the system goes below that value, it will turn OFF
        maxTemp = 50, --If the system goes up that value, table will explode losing everything
        damage = true -- Turn that to false so it wont give any damage if no hazmat suit is being used
    }
}

Config.Hazmat = {
    --https://wiki.rage.mp/index.php?title=Clothes

    --[[
        skinchanger "translation"

        mask = mask_1
        undershirt = tshirt_1
        torso = arms
        tops = torso_1
        legs = pants_1
        shoes = shoes_1 
    ]]

    [0] = {--MALE
        ["mask"] = 46,
        ["undershirt"] = 62,
        ["torso"] = 16,
        ["tops"] = 67,
        ["legs"] = 40,
        ["shoes"] = 24
    },
    [1] = {--FEMALE
        ["mask"] = 46,
        ["undershirt"] = 43,
        ["torso"] = 17,
        ["tops"] = 61,
        ["legs"] = 40,
        ["shoes"] = 24
    }
}

Config.ownImg = "lambra-drugTablesESX/img/" --this will get images that are located at img folder

Locales = {
    ["openTable"] = "[~g~E~w~] Open table",
    ["checkStats"] = "Check stats",
    ["pickupTable"] = "Pickup Table",
    ["checkStatsTitle"] = "Check stats",
    ["tableStatsTitle"] = "Table stats",
    ["gettingDizzy"] = "Im feeling weird",
    ["ingredients"] = "Check recipe",
    ["notInstalled"] = "Not installed",
    ["installed"] = "Installed",
    ["fanStat"] = "Fan: ",
    ["setupFan"] = "Click to setup fan",
    ["noItems"] = "You dont have the required items",
    ["waterStat"] = "Water",
    ["waterDescription"] = "Click to pour some water",
    ["timeCookedStat"] = "Time Cooked: ",
    ["timeMinutes"] = " min",
    ["tempStat"] = "System Temperature: ",
    ["tempUnit"] = "°C",
    ["tableON"] = ": Working",
    ["tableOFF"] = ": Not working",
    ["recipeTitle"] = "Recipe ingredients",
    ["ingredientAmount"] = "Required amount: ",
    ["startTable"] = "Start the process",
    ["waterFlooded"] = ": Water Flooded",
    ["warnWaterFlooded"] = "You just flooded the system",
    ["waterTempDecreased"] = "Systems tempreature decreased",
    ["turningSystemOn"] = "Turning ON the system",
    ["tableTurnedOn"] = "System is now working",
    ["pouringWater"] = "Pouring some water",
    ["collectFinalTitle"] = "Check the product",
    ["collectNotReady"] = "Hmmm, seems like it's not ready yet",
    ["checkingFinal"] = "Checking the mixture",
    ["collectSuccess"] = "Finally, it was time...",
    ["noSpaceInv"] = "Your inventory is full",
    ["pickingTable"] = "Picking the table",
    ["controlPlace"] = " ~INPUT_ATTACK~ Place",
    ["controlDiscard"] = " ~INPUT_AIM~ Discard",
    ["previewCloser"] = "You need to aim closer to place it"
}

function DrawText3D(x, y, z, text)
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
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 100)
    ClearDrawOrigin()
end

function ShowNotification(msg, type)
    --Depending on your notification system you can work with type
    -- There are 3 types
    -- "error"
    -- "success"
    -- nil (for information)
    ESX.ShowNotification(msg) 
end

function Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    --If you dont have this progressbar script you can get it here: https://github.com/qbcore-framework/progressbar
    --Or if you know what your doing you can adapt this to your own progressbar system using those params on the function
    exports['progressbars']:Progress({ 
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish then
                onFinish()
            end
        else
            if onCancel then
                onCancel()
            end
        end
    end)
end