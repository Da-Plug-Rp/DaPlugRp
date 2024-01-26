local healthThreadRunning = false
local armorThreadRunning = false

-- if you add more buffs you need to remove them here as well for eg. if you add hacking buff from ps-buffs, remove it here as well
local function RemoveBuffs(buff)
    if Config.PSBuff then
        if buff == "health" then
            TriggerServerEvent("snipe-icebox:server:removebuff", "super-health")

        elseif buff == "armor" then
            TriggerServerEvent("snipe-icebox:server:removebuff", "super-armor")
        end
        Wait(100)
        -- TriggerServerEvent("snipe-icebox:server:removebuff", "hacking")
        -- TriggerServerEvent("snipe-icebox:server:removebuff", "luck")
        -- TriggerServerEvent("snipe-icebox:server:removebuff", "intelligence")
    end
    healthThreadRunning = false
    armorThreadRunning = false
end


local function StartHealthThread(buffData, amount, type)
    if not healthThreadRunning then
        healthThreadRunning = true
    elseif healthThreadRunning and not Config.AllowToStackBuffEffects then
        return
    end
    if Config.PSBuff then
        exports['ps-buffs']:AddBuff("super-health", 3600000)
    end
    if type == "watch" then
        Citizen.CreateThread(function()
            while wearingWatch.hasWatch do
                Citizen.Wait(buffData.threadTime)
                if not wearingWatch.hasWatch then
                    break
                end
                if Config.PSBuff then
                    if not exports['ps-buffs']:HasBuff("super-health") then -- gives back buff if the 1 hour is over 
                        exports['ps-buffs']:AddBuff("super-health", 3600000)
                    end
                end
                if GetEntityHealth(PlayerPedId()) < 200 then
                    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + (buffData.defaultIncrease + (amount * buffData.increasePerAmount)))
                end
            end
            healthThreadRunning = false
            RemoveBuffs("health")
        end)
    elseif type == "chain" then
        Citizen.CreateThread(function()
            while wearingChain.hasChain do
                Citizen.Wait(buffData.threadTime)
                if not wearingChain.hasChain then
                    break
                end
                
                if Config.PSBuff then
                    if not exports['ps-buffs']:HasBuff("super-health") then -- gives back buff if the 1 hour is over 
                        exports['ps-buffs']:AddBuff("super-health", 3600000)
                    end
                end
                if GetEntityHealth(PlayerPedId()) < 200 then
                    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + (buffData.defaultIncrease + (amount * buffData.increasePerAmount)))
                end
            end
            healthThreadRunning = false
            RemoveBuffs("health")
        end)
    end
end

local function StartArmorThread(buffData, amount, type)
    if not armorThreadRunning then
        armorThreadRunning = true
    elseif armorThreadRunning and not Config.AllowToStackBuffEffects then
        return
    end
    if Config.PSBuff then
        exports['ps-buffs']:AddBuff("super-armor", 3600000)
    end
    
    if type == "watch" then
        Citizen.CreateThread(function()
            while wearingWatch.hasWatch do
                Citizen.Wait(buffData.threadTime)
                if not wearingWatch.hasWatch then
                    break
                end
                if Config.PSBuff then
                    if not exports['ps-buffs']:HasBuff("super-armor") then -- gives back buff if the 1 hour is over 
                        exports['ps-buffs']:AddBuff("super-armor", 3600000)
                    end
                end
                if GetPedArmour(PlayerPedId()) < 100 then
                    SetPedArmour(PlayerPedId(), GetPedArmour(PlayerPedId()) + (buffData.defaultIncrease + (amount * buffData.increasePerAmount)))
                end
            end
            armorThreadRunning = false
            RemoveBuffs("armor")
        end)
        
    elseif type == "chain" then
        Citizen.CreateThread(function()
            while wearingChain.hasChain do
                Citizen.Wait(buffData.threadTime)
                if not wearingChain.hasChain then
                    break
                end
                if Config.PSBuff then
                    if not exports['ps-buffs']:HasBuff("super-armor") then -- gives back buff if the 1 hour is over 
                        exports['ps-buffs']:AddBuff("super-armor", 3600000)
                    end
                end
                if GetPedArmour(PlayerPedId()) < 100 then
                    SetPedArmour(PlayerPedId(), GetPedArmour(PlayerPedId()) + (buffData.defaultIncrease + (amount * buffData.increasePerAmount)))
                end
            end
            armorThreadRunning = false
            RemoveBuffs("armor")
        end)
    end
end


function StartBuffThread(item, amount, type)
    local buffData = Config.BuffItems[item]
    Wait(1000)
    if not wearingChain.hasChain and not wearingWatch.hasWatch then
        RemoveBuffs(buffData.buff)
        return
    end
    if buffData.buff == "health" then
        StartHealthThread(buffData, amount, type)
    elseif buffData.buff == "armor" then
        StartArmorThread(buffData, amount, type)
    end
end