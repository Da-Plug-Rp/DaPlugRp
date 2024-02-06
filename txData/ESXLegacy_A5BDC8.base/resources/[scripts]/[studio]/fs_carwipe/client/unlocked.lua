
function wipestartNotification()
    -- don't touch if you don't know what u are doing
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 2 minutes.  \n If you don\'t want your car to disappear, sit in it')
    Wait(60000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 1 minutes.  \n If you don\'t want your car to disappear, sit in it')
    Wait(15000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 45 seconds.  \n If you don\'t want your car to disappear, sit in it')
    Wait(15000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 30 seconds.  \n If you don\'t want your car to disappear, sit in it')
    Wait(15000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 15 seconds.  \n If you don\'t want your car to disappear, sit in it')
    Wait(5000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 10 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 9 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 8 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 7 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 6 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 5 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 4 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 3 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 2 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
    Wait(1000)
    TriggerEvent('fs_carwipe:notification','A car wipe is coming in 1 seconds.  \n If you don\'t want your car to disappear, sit in it', 1000)
end

function wipeendNotification()
    lib.notify({
        description = "Carwipe completed. you can leave your vehicle again (if you were in it)!",
        type = 'success',
        position = 'top',
        duration = 5000,
        icon = 'fa-solid fa-check',
        style = {
            width = '500px',
            color = 'green',
            ['.description'] = {
                ['font-weight'] = 'bold',
                ['font-size'] = '18px',
                color = 'green',
            }
        },
    })
end

RegisterNetEvent('fs_carwipe:notification')
AddEventHandler('fs_carwipe:notification', function(msg,time)
    lib.notify({
        description = msg,
        type = 'inform',
        position = 'top',
        duration = time or 5000,
        icon = 'fa-solid fa-car-burst',
        style = {
            width = '500px',
            color = 'green',
            ['.description'] = {
                ['font-weight'] = 'bold',
                ['font-size'] = '18px',
                color = 'red',
            }
        },
    })
end)