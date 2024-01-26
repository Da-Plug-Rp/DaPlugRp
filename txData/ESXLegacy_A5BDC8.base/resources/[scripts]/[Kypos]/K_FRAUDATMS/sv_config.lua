KonfigSV = {}

KonfigSV.SaleLogsWebhook = "https://discord.com/api/webhooks/1193014239930097715/AHE4Z_H3fgpuwcpljm-ARZA63F6e0sqEsfsvPU64dHnI9kBRrA2qM9E9Sy4Rdy-v6Zmz" --Insert discord webhook between ""

KonfigSV.SetAmount = false --set to false to use random amount vv

----- requires above to false
KonfigSV.CardMaxAmount = 1500 
KonfigSV.CardMinAmount = 100 
-----------------------------


function Notify(message)
    TriggerClientEvent('okokNotify:Alert', source, 'Title', 'Message', Time, 'type', playSound)
end