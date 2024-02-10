EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
}

-- Key used to break a vehicle glass
KEY_TO_BREAK_GLASS = 38

-- Key used to hotwire a vehicle
KEY_TO_HOTWIRE = 74

-- This is the vehicle blip that appears when the player selects a vehicle from the remote UI list
TEMPORARY_VEHICLE_BLIP = {
    active = true,
    sprite = 225,
    color = 5,
    scale = 0.8,
    duration = 4000, -- ms to display the blip
}

-- Used for stolen NPC vehicles
BLIP_TIME_AFTER_POLICE_ALERT = 120

--[[
    You can edit this function if you want to add second jobs or anything like that (editing this function is down to you)
    If you edit this, you WILL have also to edit the function in sv_integrations.lua file
]]
function isAllowedForJobs(allowedJobs)
    if(not allowedJobs) then return true end

    local playerJob = Framework.getPlayerJob()

    if(allowedJobs[playerJob] == true) then
        return true
    elseif(allowedJobs[playerJob]) then
        local playerJobGrade = tostring( Framework.getPlayerJobGrade() )

        return allowedJobs[playerJob] and allowedJobs[playerJob][playerJobGrade]
    else
        return false
    end
end

-- The font to use in 3D text
FONT_FOR_3D_TEXT = 4

--[[
    Default progressbar color (must be a hex code). Examples:
    "#0fffef" - Light blue
    "#ff0f0f" - Red
    "#0f0fff" - Blue
]]
DEFAULT_PROGRESSBAR_COLOR = "#47ff33"