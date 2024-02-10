-- You can edit the events on the right side if you for any reason don't use the default event name

EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
}

-- Skips or not if an item exists (useful with inventories that doesn't save items in database or in ESX.Items table, example ox_inventory)
SKIP_ITEM_EXISTS_CHECK = false

-- Edit here your police jobs
POLICE_JOBS_NAMES = {
    ["police"] = true,
    ["sheriff"] = true,
}


--[[
    If you set this to true, the script will retrieve all the online players vehicles from the database each X seconds (defined below)
    If you set this to false, the script will need you to use the exports and the events in the Vehicles Keys documentation to manually refresh the vehicles

    Note: setting this to true will result in worse performance than setting this to false,
    but if you don't have scripting knowledge, enabling this will be extremely easier to use
]]
CONTINUOUSLY_REFRESH_PLAYERS_OWNED_VEHICLES = true
REFRESH_PLAYERS_OWNED_VEHICLES_TIME = 10 -- in seconds

-- Account vehicle transfer feature
VEHICLE_TRANSFER_ACCOUNT = "bank"

--[[
    You can edit this function if you want to add second jobs or anything like that (editing this function is down to you)
    If you edit this, you WILL have also to edit the function in cl_integrations.lua file
]]
function isPlayerAllowedForJobs(playerId, allowedJobs)
    if(not allowedJobs) then return true end
    
    local playerJob = Framework.getPlayerJobName(playerId)

    if(allowedJobs[playerJob] == true) then
        return true
    elseif(allowedJobs[playerJob]) then
        local playerJobGrade = tostring( Framework.getPlayerJobGrade(playerId) )

        return allowedJobs[playerJob] and allowedJobs[playerJob][playerJobGrade]
    else
        return false
    end
end