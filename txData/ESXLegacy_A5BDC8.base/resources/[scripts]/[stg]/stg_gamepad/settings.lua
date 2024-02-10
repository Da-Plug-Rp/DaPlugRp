Settings = {
    botToken = "MTE4ODQ4NjgwNzM4NjYwNzc1OA.Gyy1w7.QzRuAOREslz_Itxs1j6Oyc0T44bZvw5ksP89TU" -- set your discord bot token, if you dont know you can get help on our discord.
}

Citizen.CreateThread(function()
    while true do
        if Settings["botToken"] == "" then
            print("Please check settings.lua")
        end
        Citizen.Wait(3000)
    end
end)