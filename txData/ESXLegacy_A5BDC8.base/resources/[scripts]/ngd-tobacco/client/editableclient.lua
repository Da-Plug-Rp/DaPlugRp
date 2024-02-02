-- ███████ ██    ██ ███    ██  ██████ ████████ ██  ██████  ███    ██ ███████
-- ██      ██    ██ ████   ██ ██         ██    ██ ██    ██ ████   ██ ██
-- █████   ██    ██ ██ ██  ██ ██         ██    ██ ██    ██ ██ ██  ██ ███████
-- ██      ██    ██ ██  ██ ██ ██         ██    ██ ██    ██ ██  ██ ██      ██
-- ██       ██████  ██   ████  ██████    ██    ██  ██████  ██   ████ ███████

--Boss menu functions
RegisterNetEvent('ngd-tobacco:Client:BossMenu', function()
  if Bridge.Framework == 'esx' then
    TriggerEvent('esx_society:openBossMenu', Config.Job, function(data, menu)
      menu.close()
    end, { wash = false })
  elseif Bridge.Framework == 'qb' then
    TriggerEvent('qb-bossmenu:client:OpenMenu')
  end
end)

--Duty toggle functions
RegisterNetEvent('ngd-tobacco:Client:DutyToggle', function()
  Framework.ToggleDuty()
end)

--Blip Creation
if Config.Blip.Enabled then
  CreateThread(function()
    local blip = AddBlipForCoord(Config.Blip.Location.x, Config.Blip.Location.y, Config.Blip.Location.z)
    SetBlipSprite(blip, Config.Blip.Sprite)
    SetBlipDisplay(blip, 6)
    SetBlipScale(blip, Config.Blip.Scale)
    SetBlipAsShortRange(blip, Config.Blip.ShortRange)
    SetBlipColour(blip, Config.Blip.Color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Blip.Name)
    EndTextCommandSetBlipName(blip)
  end)
end

--Notify Logic
RegisterNetEvent('ngd-tobacco:Client:Notify', function(title, message, length, type)
  Config.Notification(title, message, length, type)
end)

--Stress status for ESX
AddEventHandler('esx_status:loaded', function(status)
  TriggerEvent('esx_status:registerStatus', 'stress', 0, '#8F15A5', function(status)
    return true
  end, function(status)
    status.remove(500)
  end)
end)

-- ██████  ██████   ██████   ██████  ██████  ███████ ███████ ███████     ██████   █████  ██████  ███████
-- ██   ██ ██   ██ ██    ██ ██       ██   ██ ██      ██      ██          ██   ██ ██   ██ ██   ██ ██
-- ██████  ██████  ██    ██ ██   ███ ██████  █████   ███████ ███████     ██████  ███████ ██████  ███████
-- ██      ██   ██ ██    ██ ██    ██ ██   ██ ██           ██      ██     ██   ██ ██   ██ ██   ██      ██
-- ██      ██   ██  ██████   ██████  ██   ██ ███████ ███████ ███████     ██████  ██   ██ ██   ██ ███████

--Pick Cigarette tobacco
RegisterNetEvent('ngd-tobacco:Client:CigPickAnim', function()
  Framework.ProgressBar({
    duration = Config.Animations.PickCigTobaccoTime,
    label = Config.Lang.PickCigTobacco,
    canCancel = true,
    useWhileDead = false,
    anim = {
      dict = Config.Animations.PickCigTobaccoDict,
      clip = Config.Animations.PickCigTobaccoAnim
    },
    disable = {
      combat = true,
      mouse = false,
      move = true,
      vehicle = true
    },
  })
end)

--Pick Pipe tobacco
RegisterNetEvent('ngd-tobacco:Client:PipePickAnim', function()
  Framework.ProgressBar({
    duration = Config.Animations.PickPipeTobaccoTime,
    label = Config.Lang.PickPipeTobacco,
    canCancel = true,
    useWhileDead = false,
    anim = {
      dict = Config.Animations.PickPipeTobaccoDict,
      clip = Config.Animations.PickPipeTobaccoAnim
    },
    disable = {
      combat = true,
      mouse = false,
      move = true,
      vehicle = true
    },
  })
end)

--Pick Cigar tobacco
RegisterNetEvent('ngd-tobacco:Client:CigarPickAnim', function()
  Framework.ProgressBar({
    duration = Config.Animations.PickCigarTobaccoTime,
    label = Config.Lang.PickCigarTobacco,
    canCancel = true,
    useWhileDead = false,
    anim = {
      dict = Config.Animations.PickCigarTobaccoDict,
      clip = Config.Animations.PickCigarTobaccoAnim
    },
    disable = {
      combat = true,
      mouse = false,
      move = true,
      vehicle = true
    },
  })
end)

--Open Dried Stash
RegisterNetEvent('ngd-tobacco:Client:OpenDryStashAnimAnim', function()
  Framework.ProgressBar({
    duration = Config.Animations.OpenDryTableTime,
    label = Config.Lang.OpenDriedTable,
    canCancel = true,
    useWhileDead = false,
    anim = {
      dict = Config.Animations.OpenDryTableDict,
      clip = Config.Animations.OpenDryTableAnim
    },
    disable = {
      combat = true,
      mouse = false,
      move = true,
      vehicle = true
    },
    onFinish = function()
      TriggerEvent('ngd-tobacco:Client:OpenDryStash')
    end,
  })
end)

--Create Products
RegisterNetEvent('ngd-tobacco:Client:CreateProductsAnim', function(ItemName)
  Framework.ProgressBar({
    duration = Config.Animations.CreateProductsTime,
    label = Config.Lang.CreateTobProducts .. ItemName,
    canCancel = true,
    useWhileDead = false,
    anim = {
      dict = Config.Animations.CreateProductsDict,
      clip = Config.Animations.CreateProductsAnim
    },
    disable = {
      combat = true,
      mouse = false,
      move = true,
      vehicle = true
    },
  })
end)

--Package Products
RegisterNetEvent('ngd-tobacco:Client:PackageProductsAnim', function(ItemName)
  Framework.ProgressBar({
    duration = Config.Animations.PackageProductsTime,
    label = Config.Lang.CreateTobProducts .. ItemName,
    canCancel = true,
    useWhileDead = false,
    anim = {
      dict = Config.Animations.PackageProductsDict,
      clip = Config.Animations.PackageProductsAnim
    },
    disable = {
      combat = true,
      mouse = false,
      move = true,
      vehicle = true
    },
  })
end)

--Open Products
RegisterNetEvent('ngd-tobacco:Client:OpenProductsAnim', function(ItemName)
  Framework.ProgressBar({
    duration = Config.Animations.OpenProductsTime,
    label = Config.Lang.OpenTobProducts .. ItemName,
    canCancel = true,
    useWhileDead = false,
    anim = {
      dict = Config.Animations.OpenProductsDict,
      clip = Config.Animations.OpenProductsAnim
    },
    disable = {
      combat = true,
      mouse = false,
      move = true,
      vehicle = true
    },
  })
end)

--Progress bar to drink
RegisterNetEvent('ngd-tobacco:Client:Drink', function(itemName)
  local item = itemName
  local drink = Config.TobaccoDrinks[itemName]
  Framework.ProgressBar({
    duration = drink.time,
    label = Config.Lang.ProgBarDrink .. Framework.Items[item].label .. "..",
    canCancel = true,
    useWhileDead = false,
    anim = {
      dict = drink.dict,
      clip = drink.anim
    },
    disable = {
      combat = Config.DisableCombat,
      mouse = Config.DisableMouse,
      move = Config.DisableMovement,
      vehicle = Config.DisableCarMovement
    },
    props = {
      model = drink.prop,
      pos = drink.coords,
      rot = drink.rotation,
      bone = drink.bone
    },
    onFinish = function()
      TriggerServerEvent('ngd-tobacco:Server:Drink', itemName)
    end,
  })
end)

--Smoke effects / client sync
RegisterNetEvent('ngd-tobacco:Client:StartSmokeEffect', function(data, netid)
  local entity = NetworkGetEntityFromNetworkId(netid)
  RequestNamedPtfxAsset('core')
  while not HasNamedPtfxAssetLoaded('core') do
    Wait(100)
  end
  UseParticleFxAssetNextCall('core')
  if data.itemtype == 'cigarette' then
    print(entity)
    StartParticleFxLoopedOnEntity('exp_grd_bzgas_smoke', entity, -0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.CigSmokeAmount,
      false, false, false)
  else
    if
        data.itemtype == 'cigar' then
      print(entity)
      StartParticleFxLoopedOnEntity('exp_grd_bzgas_smoke', entity, -0.050, 0.0, 0.0, 0.0, 0.0, 0.0,
        Config.CigarSmokeAmount, false, false, false)
    else
      if data.itemtype == 'pipe' then
        print(entity)
        StartParticleFxLoopedOnEntity('exp_grd_bzgas_smoke', entity, -0.070, 0.0, 0.0, 0.0, 0.0, 0.0,
          Config.PipeSmokeAmount, false, false, false)
      else
        if data.itemtype == 'longpipe' then
          print(entity)
          StartParticleFxLoopedOnEntity('exp_grd_bzgas_smoke', entity, -0.090, 0.0, 0.0, 0.0, 0.0, 0.0,
            Config.PipeSmokeAmount, false, false, false)
        end
      end
    end
  end
end)

--Stop smoke sync
RegisterNetEvent('ngd-tobacco:Client:StopSmokeEffect', function(data, netid)
  local entity = NetworkGetEntityFromNetworkId(netid)
  RemoveParticleFxFromEntity(entity)
end)

-- ██████  ██████  ██    ██ ███    ██ ██   ██     ███████ ██    ██ ███████ ████████ ███████ ███    ███
-- ██   ██ ██   ██ ██    ██ ████   ██ ██  ██      ██       ██  ██  ██         ██    ██      ████  ████
-- ██   ██ ██████  ██    ██ ██ ██  ██ █████       ███████   ████   ███████    ██    █████   ██ ████ ██
-- ██   ██ ██   ██ ██    ██ ██  ██ ██ ██  ██           ██    ██         ██    ██    ██      ██  ██  ██
-- ██████  ██   ██  ██████  ██   ████ ██   ██     ███████    ██    ███████    ██    ███████ ██      ██

local function DrunkEffect(player)
  if Config.debug then print('DrunkEffectStarted') end
  Framework.LoadAnimSet("MOVE_M@DRUNK@MODERATEDRUNK")
  SetPedIsDrunk(player, true)
  SetPedMovementClipset(player, "MOVE_M@DRUNK@MODERATEDRUNK", 1.0)
  SetTransitionTimecycleModifier("spectator5", 10.00)
  SetTimeout(60000, function()
      SetPedIsDrunk(player, false)
      ResetPedMovementClipset(player, 1.0)
      SetTransitionTimecycleModifier("default", 10.00)
      if Config.debug then print('DrunkEffectEnded') end
  end)
end
local alcoholCount = 0
RegisterNetEvent('ngd-tobacco:Client:Drunks', function(itemName)
  if Config.debug then print('DrunkEvent') end
  local player = PlayerPedId()
  alcoholCount += 1
  if Config.debug then print('AlcCount:', alcoholCount) end
  AlcoholLoop()
  if Bridge.Framework == 'qb' or 'qbox' then
      if alcoholCount > 2 and alcoholCount < 5 then
          TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
          DrunkEffect(player)
      elseif alcoholCount >= 7 then
          TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
          DrunkEffect(player)
      end
  elseif Bridge.Framework == 'esx' then
      AlcoholLoop()
      if alcoholCount > 2 and alcoholCount < 5 then
          DrunkEffect(player)
      elseif alcoholCount >= 6 then
          DrunkEffect(player)
      end
  end
end)
--Loop for drunk system--
function AlcoholLoop()
  CreateThread(function()
      while alcoholCount > 0 do
          Wait(1000 * 60 * 15)
          alcoholCount -= 1
      end
  end)
end
