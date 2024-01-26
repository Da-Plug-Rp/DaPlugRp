local alcoholCount = 0
local isDrunk = false

local emotes = {
    ["bm_wings"]           = "eat",         
    ["bm_rissole"]         = "eat",
    ["bm_mgocake"]         = "eat",
    ["bm_caridea"]         = "eat",
    ["bm_kebab"]           = "eat",
    ["bm_nachos"]          = "eat",
    ["bm_pinacolada"]      = "pinacolada",
    ["bm_bluelagoon"]      = "cocktail",
    ["bm_cosmopolitan"]    = "daiquiri",
    ["bm_daiquiri"]        = "daiquiri",
    ["bm_martini"]         = "tequila",
    ["bm_kahlua"]          = "whiskey",
    ["bm_whiskeysour"]     = "whiskey",
    ["bm_oldfashion"]      = "whiskey",
    ["bm_mimosa"]          = "sunrise",
    ["bm_tequilashot"]     = "shotdrink",
    ["bm_whiskeyshot"]     = "shotdrink", 
    ["bm_seabreezeshot"]   = "shotdrink",
    ["bm_caipirinhashot"]  = "shotdrink", 
    ["bm_caipirinhashot"]  = "shotdrink",
    ["bm_jelloshot"]       = "shotdrink", 
    ["bm_budlite"]         = "beer",
    ["bm_millerlite"]      = "beer", 
    ["bm_coorslite"]       = "beer",
    ["bm_corona"]          = "beer",
}

RegisterNetEvent('xmmx-bahamas:client:Eat')
AddEventHandler("xmmx-bahamas:client:Eat", function(itemName)
    removeItem(false, itemName, 1)
    if emotes[itemName] then ExecuteCommand('e '..emotes[itemName]) end
    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = Locales[Config.Language].progress["eating"],
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
        anim = {
            dict = false,
            clip = false, 
            flag = false,
            lockX = false,
            lockY = false,
            lockZ = false,
        },
    })
    ExecuteCommand('e c')
end)

RegisterNetEvent('xmmx-bahamas:client:Drink')
AddEventHandler("xmmx-bahamas:client:Drink", function(itemName)
    removeItem(false, itemName, 1)
    if emotes[itemName] then ExecuteCommand('e '..emotes[itemName]) end
    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = Locales[Config.Language].progress["drinking"],
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
        anim = {
            dict = false,
            clip = false, 
            flag = false,
            lockX = false,
            lockY = false,
            lockZ = false,
        },
    })
    ExecuteCommand('e c')
    alcoholCount = alcoholCount + 1
    if alcoholCount >= 2 then -- 2 or more drinks within a 15 minute period triggers drunk effect.
        isDrunk = true
        DrunkEffect()            
    end
end)

function DrunkEffect()
    if isDrunk then
        StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
        Wait(math.random(5000, 8000))
        local ped = PlayerPedId()
        RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
        while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Citizen.Wait(0) end
        SetPedCanRagdoll( ped, true )
        ShakeGameplayCam('DRUNK_SHAKE', 2.80)
        SetTimecycleModifier("Drunk")
        SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", true)
        SetPedMotionBlur(ped, true)
        SetPedIsDrunk(ped, true)
        Wait(1500)
        SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
        Wait(13500)
        SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
        Wait(10000)
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        SetPedIsDrunk(ped, false)
        SetPedMotionBlur(ped, false)
        AnimpostfxStopAll()
        ShakeGameplayCam('DRUNK_SHAKE', 0.0)
        StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
        Wait(math.random(30000, 60000))
        SetPedToRagdollWithFall(ped, 1500, 2000, 1, GetEntityForwardVector(ped), 1, 0, 0, 0, 0, 0, 0)
        StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
        StopScreenEffect("DrugsMichaelAliensFightIn")
        StopScreenEffect("DrugsMichaelAliensFight")
        StopScreenEffect("DrugsMichaelAliensFightOut")
        Wait(15000)
        ResetPedMovementClipset(ped, 0)
        Wait(15 * 60000) -- 15 Minutes then alcoholCount resets
        isDrunk = false
    end
end