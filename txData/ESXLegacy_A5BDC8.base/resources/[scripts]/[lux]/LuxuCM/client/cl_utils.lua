function CreateEntityTargets(entity, params)
      local targetSystem = Luxu.GetTargetSystem()

      if targetSystem == 'qb-target' then
            exports['qb-target']:AddTargetEntity(entity, params)
      elseif targetSystem == 'qtarget' then
            exports['qtarget']:AddTargetEntity(entity, params)
      elseif targetSystem == 'ox_target' then
            local options = {
                  name = params.options[1].label,
                  icon = params.options[1].icon,
                  label = params.options[1].label,
                  distance = params.distance,
                  canInteract = params.options[1].canInteract,
                  onSelect = params.options[1].action,
                  event = params.options[1].event or nil
            }
            exports.ox_target:addLocalEntity({ entity }, { options })
      end
end

function RemoveEntityTarget(data)
      local name, options = data[1], data[2]
      local targetSystem = Luxu.GetTargetSystem()

      if targetSystem == 'qb-target' then
            exports['qb-target']:RemoveTargetEntity(name, options)
      elseif targetSystem == 'qtarget' then
            exports['qtarget']:RemoveTargetEntity(name, options)
      elseif targetSystem == 'ox_target' then
            exports.ox_target:removeEntity(name, options)
      end
end

function JobChecker()
      local result = lib.callback.await('LuxuCM:Server:HasJob', false)
      if not result then Notify(Locale('YouDontHaveJob') .. ' ' .. Config.Mining.job_settings.job_name, 'error', 5000) end
      return result
end

-- Commands

if Config.Commands.CancelPickup and Config.Commands.CancelPickup.enabled then
      local info = Config.Commands.CancelPickup
      CancelPickup = {
            enabled = true,
            command = 'cancelorder',
            description = 'Cancel your active pickup order',
      }

      RegisterCommand(info.command, function()
            CancelActivePickup()
      end, false)

      if type(info.description) == 'string' then
            TriggerEvent('chat:addSuggestion', '/' .. info.command, info.description, {})
      end
end

if Config.RefreshDisastersCommand then
      RegisterCommand(Config.RefreshDisastersCommand, function(src, args, raw)
            TriggerEvent('LuxuCM:CheckForActiveDisasters')
      end, false)
end
