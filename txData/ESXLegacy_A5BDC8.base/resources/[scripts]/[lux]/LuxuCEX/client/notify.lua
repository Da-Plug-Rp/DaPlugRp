RegisterNetEvent('LuxuCEX:Utils:Notify', function(msg, type, duration)
      if CurrentFramework == 'qb' then
            QBCore.Functions.Notify(msg, type, duration)
      end
      if CurrentFramework == 'esx' then
            if type == 'primary' then type = 'info' end
            ESX.ShowNotification(msg, duration, type)
      end
end)
