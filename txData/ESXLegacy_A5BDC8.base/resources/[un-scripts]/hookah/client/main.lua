-- client/main.lua
local shopMenu = NativeUI.CreateMenu("Hookah Shop", "Welcome to the Hookah Shop!")

function OpenShopMenu()
    shopMenu:Clear()

    -- Add menu items here (e.g., hookahs, crafting items)

    shopMenu:Visible(true)
end

-- Trigger this function when you want to open the shop menu
RegisterNetEvent('your-resource:openShopMenu')
AddEventHandler('your-resource:openShopMenu', function()
    OpenShopMenu()
end)

RegisterNetEvent('your-resource:syncSmoke')
AddEventHandler('your-resource:syncSmoke', function(status, x, y, z)
    if status then
        TriggerEvent('esx_smoke:startSmoke', 'smoke_hookah', vector3(x, y, z))
    else
        TriggerEvent('esx_smoke:stopSmoke', 'smoke_hookah')
    end
end)