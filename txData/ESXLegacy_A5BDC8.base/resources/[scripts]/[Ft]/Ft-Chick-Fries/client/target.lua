
Citizen.CreateThread(function()
    exports.qtarget:AddTargetModel({`a_c_shepherd`}, {
        options = {
            {
                event = "client:kkdogs",
                icon = "fas fa-dog",
                label = "Play With Dog",
            },
        },
        distance = 2.0
    })
end)
