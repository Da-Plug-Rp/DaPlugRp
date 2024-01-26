
Citizen.CreateThread(function()
    exports.qtarget:AddTargetModel({`a_c_cat_01`}, {
        options = {
            {
                event = "client:cats",
                icon = "fas fa-cat",
                label = "Play With Cat's",
            },
        },
        distance = 2.0
    })
end)
