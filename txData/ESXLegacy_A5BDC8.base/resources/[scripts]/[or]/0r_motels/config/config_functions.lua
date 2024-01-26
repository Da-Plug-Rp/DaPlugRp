Config.CustomStash = function(id)
    -- You can add the stash function of the inventory you are using here.
end

Config.VehicleSpawnAddEvent = function(vehicle, vehicleProperties)

end

Config.OpenWardrobe = function()
     TriggerEvent('illenium-appearance:client:openOutfitMenu') -- for illenium-appearance
    --TriggerEvent('qb-clothing:client:openOutfitMenu') -- for qb-clothing
    TriggerEvent('ox_appearance:wardrobe') -- for ox_appearance
    -- TriggerEvent('ex_clothingstore:wardrobe') -- for bp_clothing v3
    -- TriggerEvent("rcore_clothes:openOutfits") -- rcore clothes
end

Config.CustomLockPickSystem = function() -- if Config.LockPickSystemOxSkillbar is work for false 
    return exports["2na_lockpick"]:createGame(3, 1)
end

Config.TakeAShower = function()
    exports['k_hygiene']:ClearAllHygiene()
    TriggerServerEvent('k_hygiene:clearall', source)
    TriggerEvent('k_hygiene:clearall')
end

Config.CustomNotifyFunc = function(title, text, type)
    exports['okokNotify']:Alert(title, text, 3000, type)
end