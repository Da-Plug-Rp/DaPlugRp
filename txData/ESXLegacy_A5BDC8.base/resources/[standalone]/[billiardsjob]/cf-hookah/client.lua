local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}


local nargileObjects = {}
local nargileSingleObject = nil
local carryingNargile = false
local marpuc = nil
local sessionStarted = false
local currentHookah = nil
local carryingKoz = false
local koz = {
    obj = nil
}
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job

end)
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

CreateThread(function()
    while true do
        Wait(0)
        local ply = PlayerPedId()
        local coords = GetEntityCoords(ply, true)
        if #(coords - Config.nargileYap.coords) < 1.5 and PlayerJob.name == "hookah" then
            local text = '~g~E~w~ - Take Hookah | ~d~K~w~ - Take Hookah Embers'

            if carryingNargile then
                text = '~r~E~w~ - Delete Hookah | ~d~K~w~ - Take Hookah Embers'
            end

            if carryingKoz then
                text = '~g~E~w~ - Take Hookah | ~r~K~w~ - Delete hookah embers'
            end

            QBCore.Functions.DrawText3D(Config.nargileYap.coords.x, Config.nargileYap.coords.y, Config.nargileYap.coords.z, text)

            if IsControlJustReleased(0, 38) then
                if PlayerJob.name == "hookah" then
                    if not carryingNargile then
                        if not carryingKoz then
                            local obj = CreateObject(4037417364, 0, 0, 0, true, 0, true)
                            local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
                            nargileSingleObject = obj
                            carryingNargile = true
                            anim()
                            AttachEntityToEntity(obj, ply, boneIndex2, -0.15, 0.2, 0.18, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                        else
                            QBCore.Functions.Notify("You're already carrying something", "error", 3000)
                        end
                    else
                        DeleteEntity(nargileSingleObject)
                        nargileSingleObject = nil
                        carryingNargile = false
                        ClearPedTasks(PlayerPedId())
                    end
                else
                    QBCore.Functions.Notify("You are not authorized to do this", "error", 3000)
                end
            end
            if IsControlJustPressed(0, 311) then
                if PlayerJob.name == "hookah" and koz.obj == nil and not carryingKoz then
                    if not carryingNargile then
                        carryingKoz = true
                        attachKoz()
                    else
                        QBCore.Functions.Notify("You're already carrying something", "error", 3000)
                    end
                else
                    DeleteEntity(koz.obj)
                    koz.obj = nil
                    carryingKoz = false
                    ClearPedTasks(PlayerPedId())
                end
            end
        end
    end
end)


CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(Config.Masalar) do
            if carryingNargile or v.alreadyHaveHookah and QBCore ~= nil  then
                 local ply = PlayerPedId()
                 local coords = GetEntityCoords(ply, true)
                  if #(coords - v.coords) < 1.6 and not v.alreadyHaveHookah then 
                    QBCore.Functions.DrawText3D(v.coords.x, v.coords.y, v.coords.z, "~y~E~w~ - Put Hookah To Table")
                    if IsControlJustReleased(0, 38) then
                        putNargileToTable(k)
                     end
                 elseif #(coords - v.coords) < 1.6 and v.alreadyHaveHookah then 
                    QBCore.Functions.DrawText3D(v.coords.x, v.coords.y, v.coords.z, "~r~E~w~ - Take Hookah From Table")
                     if PlayerJob.name == "hookah" and IsControlJustReleased(0, 38) then
                           takeNargileFromTable(k)
                     end
                end
            end
        end
    end
end)

RegisterNetEvent('cf-hookah:client:deleteMarpuc')
AddEventHandler('cf-hookah:client:deleteMarpuc', function(masa)
    local masa = Config.Masalar[masa].coords
    if sessionStarted then
        local ply = PlayerPedId()
        local coords = GetEntityCoords(ply, true)
        if #(masa - coords ) < 3.0 then

            currentHookah = nil
            SetEntityAsMissionEntity(marpuc, true, true)
            DeleteEntity(marpuc)
            marpuc = nil
            ClearPedTasks(ply)
            QBCore.Functions.Notify("Hookah taking from table", "primary", 3000) 
        end
    end
end)


RegisterNetEvent('cf-hookah:client:deleteNargile')
AddEventHandler('cf-hookah:client:deleteNargile', function(masa)

    local ply = PlayerPedId()
    local coords = GetEntityCoords(ply, true)

    for k,v in pairs(nargileObjects) do
       -- print(v.table, masa)
        if v.table == masa then
           -- QBCore.Functions.Notify("You took the hookah off the table", "primary", 3000) 
             SetEntityAsMissionEntity(NetworkGetEntityFromNetworkId(v.obj), true, true)
             DeleteEntity(NetworkGetEntityFromNetworkId(v.obj))

             table.remove(nargileObjects, k)

             return;
        end
    end
  
end)

RegisterNetEvent('cf-hookah:client:getConfig')
AddEventHandler('cf-hookah:client:getConfig', function(newConfig)
    Config.Masalar = newConfig
end)

function putNargileToTable(masa)
    DeleteEntity(nargileSingleObject)
    nargileSingleObject = nil
    carryingNargile = false
    local obj =  CreateObject(4037417364, Config.Masalar[masa].coords, false, 0, false)
    NetworkRegisterEntityAsNetworked(obj)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(obj), true)
    SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(obj), true)
    NetworkSetNetworkIdDynamic(NetworkGetNetworkIdFromEntity(obj), false)
	FreezeEntityPosition(obj, true)
    table.insert(nargileObjects, {obj = NetworkGetNetworkIdFromEntity(obj), table = masa, koz = 100})
    TriggerServerEvent('cf-hookah:server:syncHookahTable', nargileObjects)

    TriggerServerEvent('cf-hookah:server:setAlreadyHaveHookah',masa, true)


    ClearPedTasks(PlayerPedId())
end

function takeNargileFromTable(masa)
    for k,v in pairs(nargileObjects) do
        if v.table == masa then
            TriggerServerEvent('cf-hookah:server:deleteMarpuc', v.table)

            TriggerServerEvent('cf-hookah:server:deleteNargile', v.table)

            TriggerServerEvent('cf-hookah:server:setAlreadyHaveHookah',masa, false)
        end
    end
end

RegisterNetEvent('cf-hookah:client:setHookahs')
AddEventHandler('cf-hookah:client:setHookahs', function(nargileler)
    nargileObjects = nargileler
end)

RegisterNetEvent('cf-hookah:client:syncHookahTable')
AddEventHandler('cf-hookah:client:syncHookahTable', function()
end)



RegisterNetEvent('cf-hookah:client:syncKoz')
AddEventHandler('cf-hookah:client:syncKoz', function(obj, amount)
    for k,v in pairs(nargileObjects) do
        if v.obj == obj then
            v.koz = v.koz + amount
            if v.koz > 100 then
                v.koz = 100
            elseif v.koz <= 0 then
                v.koz = 0
            end
        end
    end
end)



function attachKoz()
	local hash = GetHashKey('v_corp_boxpaprfd')
	local ped = PlayerPedId()
    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Wait(100)
    end

	local obj = CreateObject(hash,  GetEntityCoords(PlayerPedId()),  true,  true, true)
    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded('core') do
        Wait(0)
    end
    UseParticleFxAsset("core")

    StartNetworkedParticleFxLoopedOnEntity("ent_anim_cig_smoke",obj,0,0,0.1, 0,0,0, 3.0, 0,0,0)
    local anim = "amb@world_human_clipboard@male@base"
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        Wait(0)
    end
	local boneIndex = GetPedBoneIndex(ped, 0x67F2)
    koz.obj = obj;


    TaskPlayAnim(ped, anim, "base",2.0, 2.0, -1, 49, 0, false, false, false)


	AttachEntityToEntity(obj, ped,  boneIndex, 0.15,-0.10,0.0,  -130.0, 310.0, 0.0,  true, true, false, true, 1, true)
end


function kozle(v)
    local ped = PlayerPedId()

    RequestAnimDict("misscarsteal3pullover")
    while not HasAnimDictLoaded("misscarsteal3pullover") do
        Wait(0)
    end
    TaskPlayAnim(ped, "misscarsteal3pullover", "pull_over_right", 2.0, 2.0, -1, 49, 0, false, false, false)
    Wait(5500)
    local anim = "amb@world_human_clipboard@male@base"
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        Wait(0)
    end
    local boneIndex = GetPedBoneIndex(ped, 0x67F2)
    TaskPlayAnim(ped, anim, "base",2.0, 2.0, -1, 49, 0, false, false, false)
	AttachEntityToEntity(koz.obj, ped,  boneIndex, 0.15,-0.10,0.0,  -130.0, 310.0, 0.0,  true, true, false, true, 1, true)
    TriggerServerEvent('cf-hookah:server:syncKoz', v.obj, 50)

end

CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(nargileObjects) do
   
            local coords = GetEntityCoords(NetworkGetEntityFromNetworkId(v.obj), true)
            local ply = PlayerPedId()
            local coordsPly = GetEntityCoords(ply, true)
            if #(coords - coordsPly) < 1.3 then

                if IsControlJustPressed(0, 47) and v.koz < 100 and koz.obj and carryingKoz then
                    kozle(v)

                end
                if not sessionStarted then
                    QBCore.Functions.DrawText3D(coords.x, coords.y,coords.z + 0.20, "~g~A~w~ - Smoke | ~o~G~w~ - Add Hookah Embers | ".. ' Hookah Embers : '.. '~r~' ..v.koz.. '~w~')
                    if IsControlJustReleased(0, 205) then

                        currentHookah = v.obj
                        nargileIc(v.table)
                
                    end  
                else
                    if IsControlJustPressed(0, 80) and v.koz >  0 then -- Normal: R
                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "hookah", 0.3)   
                        TriggerServerEvent("hookah_smokes", PedToNet(ply))  
                        TriggerServerEvent('cf-hookah:server:syncKoz', v.obj,  -2)
                        TriggerServerEvent('hud:server:RelieveStress', math.random(1,2))
                        Wait(3000)
                    end

                    if v.koz > 0 then
                        QBCore.Functions.DrawText3D(coords.x, coords.y,coords.z + 0.7, "~g~R~w~ - Smoke | ~o~G~w~ - Add Hookah Embers | ~r~F~w~ - Stop Smoking ".. ' Hookah Embers : '.. '~r~' ..v.koz.. '~w~')
                    else
                        QBCore.Functions.DrawText3D(coords.x, coords.y,coords.z + 0.7, "~r~F~w~ - Stop Smoking".. ' Hookah Embers : '.. '~r~' ..v.koz.. '~w~')
                    end
                end
            end
        end
    end
end)

CreateThread(function()
	while true do
		Wait(0)
		if sessionStarted then
			local dist = #(GetEntityCoords(PlayerPedId(), true) -  vector3(-1596.29, -987.07, 14.51))
			if dist > 50.0 or IsPedInAnyVehicle(PlayerPedId(), false) then
				sessionStarted = false
				SetEntityAsMissionEntity(marpuc, false, true)
				DeleteObject(marpuc)
				ClearPedTasks(PlayerPedId())
				QBCore.Functions.Notify("You cannot take the hookah outside the cafe","error")
			end
		end
	end
end)

function anim()
	local ped = PlayerPedId()
	local ad = "anim@heists@humane_labs@finale@keycards"
	local anim = "ped_a_enter_loop"
	while (not HasAnimDictLoaded(ad)) do
		RequestAnimDict(ad)
	  Wait(100)
	end
	TaskPlayAnim(ped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)

end

function nargileIc(masa)
   -- TriggerServerEvent('cf-hookah:server:setSessionStarted', masa, true)
    smoke()
    anim()
    local playerPed  = PlayerPedId()
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 12844)
	local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
	local model = GetHashKey('v_corp_lngestoolfd')
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(100)
	end								
	local obj = CreateObject(model,  coords.x+0.5, coords.y+0.1, coords.z+0.4, true, false, true)
	marpuc = obj
	AttachEntityToEntity(obj, playerPed, boneIndex2, -0.43, 0.68, 0.18, 0.0, 90.0, 90.0, true, true, false, true, 1, true)		
	QBCore.Functions.Notify("You started smoking", "primary")
    sessionStarted = true	
end

function smoke()
    CreateThread(function()
        while true do
            Wait(0)

            if IsControlJustReleased(0, 23) and sessionStarted then -- Normal: F
                sessionStarted = false
                SetEntityAsMissionEntity(marpuc, false, true)
                DeleteObject(marpuc)
                currentHookah = nil
                ClearPedTasks(PlayerPedId())
    
            end
        end
    end)
end


p_smoke_location = {
	20279,
}
p_smoke_particle = "exp_grd_bzgas_smoke"
p_smoke_particle_asset = "core" 
RegisterNetEvent("c_hookah_smokes")
AddEventHandler("c_hookah_smokes", function(c_ped)
	local p_smoke_location = {
		20279,
	}
	local p_smoke_particle = "exp_grd_bzgas_smoke"
	local p_smoke_particle_asset = "core" 


	for _,bones in pairs(p_smoke_location) do
		if DoesEntityExist(NetToPed(c_ped)) and not IsEntityDead(NetToPed(c_ped)) then
			createdSmoke = UseParticleFxAssetNextCall(p_smoke_particle_asset)
			createdPart = StartParticleFxLoopedOnEntityBone(p_smoke_particle, NetToPed(c_ped), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToPed(c_ped), bones), 5.0, 0.0, 0.0, 0.0)
			Wait(1000)
			--Wait(250)
			StopParticleFxLooped(createdSmoke, 1)
			Wait(1000)
			RemoveParticleFxFromEntity(NetToPed(c_ped))
			break
		end
	end
end)


CreateThread(function()
    local hookahblip = AddBlipForCoord(Config.nargileYap.coords)
    SetBlipSprite (hookahblip, 0)
    SetBlipDisplay(hookahblip, 4)
    SetBlipScale  (hookahblip,0.9)
    SetBlipAsShortRange(hookahblip, true)
    SetBlipColour(hookahblip, 24)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("HOOKAH LOUNGE")
    EndTextCommandSetBlipName(hookahblip)
end)