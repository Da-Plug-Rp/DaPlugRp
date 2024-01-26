
Citizen.CreateThread(function()
    while true do
        globalPlayerPedId = PlayerPedId()
        globalPlayerPed = GetPlayerPed(-1)
        globalPlayerId = PlayerId()
        Citizen.Wait(3000)
    end
end)


function Draw2DNeedsMenu(content, m)
    SetTextScale(m.Scale, m.Scale)
    SetTextColour(m.TextColor[1], m.TextColor[2], m.TextColor[3], 255)
	SetTextFont(m.TextFont)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextProportional(1)
    SetTextCentre(true)
	
        -- Calculate width and height
        BeginTextCommandWidth("STRING")
		AddTextComponentString(content)
        local height = GetTextScaleHeight(m.Scale, m.TextFont)
        local width = EndTextCommandGetWidth(m.TextFont)
        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(content)
        EndTextCommandDisplayText(m.Position.x, m.Position.y)
    	DrawText(m.Position.x, m.Position.y)

	    if m.Background.enable then
           local factor = (string.len(content)) / 370
            DrawRect(m.Position.x, m.Position.y+0.0130,  0.015 + factor, height + 0.011, m.Background.color.r, m.Background.color.g, m.Background.color.b , m.Background.color.alpha)
    end
end

LoadModel = function(modelHash)
    if not IsModelInCdimage(modelHash) then return end
    RequestModel(modelHash)
    local loaded
    for i=1, 100 do 
        if HasModelLoaded(modelHash) then
            loaded = true 
            break
        end
        Wait(100)
    end
    return loaded
end

function CreateConsumeProp(propdata)
    DeleteItemProp()
    local item = Config.ConsumeItems[STATE.SELECT_ITEM]
    if item.Type == 'GLASS' then
    if STATE.GLASS_CONTENT ~= 'nil' then
    STATE.CURRENT_PROP = LoadAttachedProp({model = propdata.Main.Model.full, bone_id = propdata.Main.BoneID, coords = propdata.Main.Offset, rotation = propdata.Main.Rot})
    else
        STATE.CURRENT_PROP = LoadAttachedProp({model = propdata.Main.Model.null, bone_id = propdata.Main.BoneID, coords = propdata.Main.Offset, rotation = propdata.Main.Rot})
    end
    else
        STATE.CURRENT_PROP = LoadAttachedProp({model = propdata.Main.Model, bone_id = propdata.Main.BoneID, coords = propdata.Main.Offset, rotation = propdata.Main.Rot})

            if item.Prop.Second ~= nil then
                STATE.SECOND_PROP = LoadAttachedProp({model = propdata.Second.Model, bone_id = propdata.Second.BoneID, coords = propdata.Second.Offset, rotation = propdata.Second.Rot})
            
        end
    end
end

function DeleteSecondProp()
    if (STATE.SECOND_PROP) then 
        RequestNetworkControl(STATE.SECOND_PROP, function()
            DeleteEntity(STATE.SECOND_PROP)
        end)
        STATE.SECOND_PROP = nil
    end
end

function DeleteItemProp()
    if (STATE.CURRENT_PROP) then 
        RequestNetworkControl(STATE.CURRENT_PROP, function()
            DeleteEntity(STATE.CURRENT_PROP)
        end)
        STATE.CURRENT_PROP = nil
        if STATE.SECOND_PROP ~= nil then
            DeleteSecondProp()
        end

    end
end

function LoadAttachedProp(data)
	local ped = PlayerPedId()
	local x, y, z = GetEntityCoords(ped)
	local modelHash = data.model
    if not LoadModel(modelHash) then 
        print("Couldn't load model: " .. modelHash)
        StopConsume()
        return 
    end
	local prop = CreateObject(modelHash, x, y, z, true, false, false)
	AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, data.bone_id), data.coords.x, data.coords.y, data.coords.z,
	data.rotation.x, data.rotation.y, data.rotation.z, true, false, false, true, 1, true)
	return prop
end


function StopConsume(action)
    local item = STATE.SELECT_ITEM
        if (item and Config.ConsumeItems[item]) then
            DeleteItemProp()
            TriggerServerEvent(GetCurrentResourceName()..':server:StopConsume')
            STATE.SIZE = nil
            STATE.SELECT_ITEM = nil
            STATE.ACTION = nil
            STATE.HOLD = false
            STATE.GLASS_CONTENT = 'nil'
        end
        if action == 'die' then
            ShakeGameplayCam('DRUNK_SHAKE', 0.0)
            STATE.ALCOHOL = 0.0
            ResetPedMovementClipset(PlayerPedId(), 0)
            ClearTimecycleModifier()
            ResetScenarioTypesEnabled()
            SetPedIsDrunk(PlayerPedId(), false)
            SetPedMotionBlur(PlayerPedId(), false)
    end
end


    function OpenPourMenu(data)
            local i_data = Config.ConsumeItems[data.item]
            local value = data.size
            
            local input = lib.inputDialog(Translations['TEXT']['add_content'] ..data.item, {
                {type = 'number', label = STATE.SELECT_ITEM.. ' : ' ..STATE.SIZE.. ' ml', description = value.. ' / ' ..i_data.Size.. ' ml', icon = 'hashtag', min = 1, max = i_data.Size},
            })
            if json.encode(input) ~= 'null' then

            value = value + input[1]


            if value <= i_data.Size then
               if input[1] <= STATE.SIZE then

            PlayAnim(i_data.Anim.Pour, function()
                STATE.SIZE = STATE.SIZE - input[1]
                STATE.USING = false
                TriggerServerEvent("devcore_needs:server:SaveContent", data.id, value, STATE.SELECT_ITEM)
        end)

        else
            STATE.USING = false
                Config.Notify(Translations['TEXT']['dont_have_ml'], 'error')
        end
    else
        STATE.USING = false
            Config.Notify(Translations['TEXT']['large_number'], 'error')
        
        end
            else
                STATE.USING = false
            end
        end


local bite = nil

function OnUsed(item)
    local data = Config.ConsumeItems[item]
        STATE.USING = true

         bite = math.random(data.Consume.Bite.min, data.Consume.Bite.max)

        if STATE.GLASS_CONTENT ~= 'nil' then
             data = Config.ConsumeItems[STATE.SELECT_ITEM]
            local g = Config.ConsumeItems[STATE.SELECT_ITEM]
            bite = math.random(g.Consume.Bite.min, g.Consume.Bite.max)
        end
           PlayAnim(data.Anim.Use, function()
               
               STATE.SIZE = STATE.SIZE - bite
   
               AddStatus(item)
               
            STATE.USING = false
        end)    
   end


function AddStatus(item)
    local data = Config.ConsumeItems[item]
    if (STATE.SELECT_ITEM) then
        if (STATE.USING) then

            Config.Status[data.Type](data)

            if data.Consume.Stress ~= nil then
                Config.Status['STRESS'](data)
            end
            if data.Consume.Alcohol ~= nil then
                Config.Status['ALCOHOL'](data)
            end
        end
    end
end

function setAlcohol(value)
    local b = 0.00 ..bite
    STATE.ALCOHOL = STATE.ALCOHOL + b * value
end


function startAnimHold(data)
  
    Citizen.CreateThread(function()
      
      local player = PlayerPedId()
      SetPedCanPlayGestureAnims(player, false)
      SetPedPathCanUseLadders(player, false)
      LoadDictionary(data.dict)
      while STATE.HOLD == true do
          sleep = 200
          if not IsEntityPlayingAnim(player, data.dict, data.anim, 49) or IsPedRagdoll(player) then
            if STATE.USING == false then
              sleep = 1
              TaskPlayAnim(player, data.dict, data.anim, 8.0, -8, -1, 49, 0, false, false, false)
            end
          end
          Citizen.Wait(sleep)
      end
        STATE.HOLD = false
        ClearPedTasks(player)
        SetPedCanPlayGestureAnims(player, true)
        SetPedPathCanUseLadders(player, true)
    end)
   
  end




function AutoConsume(item)
    Citizen.CreateThread(function()
        while STATE.ACTION == 'AUTOCONSUME' do
            Citizen.Wait(200)
        if STATE.ACTION == 'AUTOCONSUME' then
                time = math.random(3000, 9000)
                OnUsed(item)
                    Citizen.Wait(time)
        else
            break
            end
        end
    end)
end

function GiveConsumeItem(item)
    Citizen.CreateThread(function()
        while STATE.ACTION == 'GIVE' do
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

            if closestPlayer ~= -1 and closestDistance <= 2.5 then
    
                target_id = PlayerPedId(closestPlayer)
                playerX, playerY, playerZ = table.unpack(GetEntityCoords(target_id))
                DrawMarker(0, playerX, playerY, playerZ+1.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.6, 0.6, 0.6, 10, 255, 0, 100, true, true, 2, true, false, false, false)

                if IsControlJustPressed(0, Config.Buttons.Accept) then
                    if closestPlayer ~= -1 and closestDistance <= 2.5 then
                        TriggerServerEvent(GetCurrentResourceName()..':server:Receiver', GetPlayerServerId(closestPlayer), item, STATE.SIZE, STATE.GLASS_CONTENT)
                        StopConsume('stop')
                            break
                        end
                    end
                end
            Citizen.Wait(5)
        end
    end)
end

local target = nil
local testing = false
local soundid = GetSoundId()

function UseTesterItem()
    local m = Config.Menu
    Citizen.CreateThread(function()
        while STATE.ACTION == 'TESTER' do
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if STATE.RESULT ~= nil then
                Config.CustomMenu(Translations['TEXT']['result'] ..STATE.RESULT, m['INFO'])
               end

               Config.CustomMenu(Translations['MENU']['tester_menu'], m['MAIN'])

            if closestPlayer ~= -1 and closestDistance <= 2.5 then
                target_id = PlayerPedId(closestPlayer)

                playerX, playerY, playerZ = table.unpack(GetEntityCoords(target_id))
                
                if not testing then
                DrawMarker(0, playerX, playerY, playerZ+1.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.6, 0.6, 0.6, 10, 255, 0, 100, true, true, 2, true, false, false, false)
                else
                targetX, targetY, targetZ = table.unpack(GetEntityCoords(target))
                DrawMarker(0, targetX, targetY, targetZ+1.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 0, 0, 100, true, true, 2, true, false, false, false)
                end
            end


                if IsControlJustPressed(0, Config.Buttons.Use) then
                   if not testing then
                if closestPlayer ~= -1 and closestDistance <= 2.5 then
                    target = GetPlayerServerId(closestPlayer)
                    testing = true
                    STATE.RESULT = Translations['TEXT']['waiting']
                    
					TriggerServerEvent(GetCurrentResourceName()..':server:resultRequest', target)

                else
                    testing = false
                    Config.Notify(Translations['TEXT']['no_near_you'])
                end
            end
        end

    
        
            if IsControlJustPressed(0, Config.Buttons.Hide) then
                if target ~= nil then
                    TriggerServerEvent(GetCurrentResourceName()..':server:cancelTesting', target)
                end
                STATE.RESULT = nil
                testing = false
                STATE.ACTION = nil
                TriggerServerEvent(GetCurrentResourceName()..':server:StopConsume')
            end
                
                    Citizen.Wait(1)
            end
        end)
end



RegisterNetEvent(GetCurrentResourceName()..':client:TesterResult')
AddEventHandler(GetCurrentResourceName()..':client:TesterResult', function(result)
        if result ~= nil then
            PlaySoundFrontend(soundid, 'Beep_Green', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', true)
            Citizen.Wait(Config.DrunkSystem.ResultTime * 1000)
            StopSound(soundid)
            testing = false
            STATE.RESULT = result
    end
end)

RegisterNetEvent(GetCurrentResourceName()..':client:TargetRequest')
AddEventHandler(GetCurrentResourceName()..':client:TargetRequest', function(p1)
    STATE.ACTION = 'TESTED'
    Citizen.CreateThread(function()
        while STATE.ACTION == 'TESTED' do
            local m = Config.Menu
            Config.CustomMenu(Translations['MENU']['tester_menu'], m['MAIN'])
            Config.CustomMenu(Translations['TEXT']['request_text'], m['INFO'])

            if IsControlJustPressed(0, Config.Buttons.Use) then
                local result = STATE.ALCOHOL
                TriggerServerEvent(GetCurrentResourceName()..':server:TargetResult', p1, result)
                PlaySoundFrontend(soundid, 'Beep_Green', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', true)
                Citizen.Wait(Config.DrunkSystem.ResultTime * 1000)
                StopSound(soundid)
                Config.Notify(Translations['TEXT']['result'] ..result)
                break
            end

            if IsControlJustPressed(0, Config.Buttons.Hide) then
                TriggerServerEvent(GetCurrentResourceName()..':server:TargetResult', p1, nil)
                STATE.ACTION = nil
                break
            end

            Citizen.Wait(1)
        end
    end)
end)

RegisterNetEvent(GetCurrentResourceName()..':client:stopTesting')
AddEventHandler(GetCurrentResourceName()..':client:stopTesting', function()
    STATE.ACTION = nil
end)
