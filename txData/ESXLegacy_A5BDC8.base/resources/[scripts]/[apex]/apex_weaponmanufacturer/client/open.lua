-- █████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗
--██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝
--███████║██████╔╝█████╗   ╚███╔╝     ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗
--██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║
--██║  ██║██║     ███████╗██╔╝ ██╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║
--╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝

----------------------------------------------------------------------------------------------------

local Apex = exports['apex_lib']:GetApexObject()
---------------------------------------


-- Inventory functions --
function OpenShop(invType, id, label, slots, weight, owner)
    Apex.Functions.OpenShop(invType, id, label, slots, weight, owner)
    -- If we do not support your current Inventory system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- TriggerServerEvent('inventory:server:OpenInventory', 'stash', id, {maxweight = weight, slots = slots})
end

---------------------------------------


-- Notification functions --
function Notifications(message, time, type)
    Apex.Functions.Notify(message, time, type)
    -- If we do not support your current Notification system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- exports['NotificationScript']:Alert("", message, time, type)
    -- TriggerEvent('NotificationScript:sendnotification', message, time, type)
end
---------------------------------------


-- Emotemenu functions --
function Emote(animation)
    Apex.Functions.Emote(animation)
    -- If we do not support your current Emotemenu system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- TriggerEvent('animations:client:EmoteCommandStart', {animation})
end
function EmoteCancel()
    Apex.Functions.EmoteCancel()
    -- If we do not support your current Emotemenu system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end
---------------------------------------