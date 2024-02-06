-- BLIPS
Citizen.CreateThread(function()
    if Config.WeaponLicenses.Practical.Blip.Enabled then
        local blip = AddBlipForCoord(Config.WeaponLicenses.Practical.Blip.Location)
        SetBlipSprite(blip, Config.WeaponLicenses.Practical.Blip.Sprite)
        SetBlipScale(blip, Config.WeaponLicenses.Practical.Blip.Scale)
        SetBlipColour(blip, Config.WeaponLicenses.Practical.Blip.Color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(L('practical_test_blip_text'))
        EndTextCommandSetBlipName(blip)
    end

    if Config.WeaponLicenses.Theorical.Blip.Enabled then
        local blip = AddBlipForCoord(Config.WeaponLicenses.Theorical.Blip.Location)
        SetBlipSprite(blip, Config.WeaponLicenses.Theorical.Blip.Sprite)
        SetBlipScale(blip, Config.WeaponLicenses.Theorical.Blip.Scale)
        SetBlipColour(blip, Config.WeaponLicenses.Theorical.Blip.Color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(L('theorical_test_blip_text'))
        EndTextCommandSetBlipName(blip)
    end

    if Config.WeaponPractisePoint.Enabled and Config.WeaponPractisePoint.Blip.Enabled then
        local blip = AddBlipForCoord(Config.WeaponPractisePoint.Blip.Location)
        SetBlipSprite(blip, Config.WeaponPractisePoint.Blip.Sprite)
        SetBlipScale(blip, Config.WeaponPractisePoint.Blip.Scale)
        SetBlipColour(blip, Config.WeaponPractisePoint.Blip.Color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(L('ammo_practise_blip_text'))
        EndTextCommandSetBlipName(blip)
    end
end)