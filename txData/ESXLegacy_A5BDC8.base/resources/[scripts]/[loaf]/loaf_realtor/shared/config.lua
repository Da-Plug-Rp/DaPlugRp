Config = {}

Config.Framework = "auto" -- esx or qb
Config.JobName = "rea"
Config.CreateGrade = 2 -- minimum grade to create houses
Config.MenuAlign = "bottom-right" -- esx_menu_default alignment

Config.UseRPName = true -- should the transfer & bill menu show the in-game name?

Config.MinPrice = 50000 -- minimum price for a property
Config.CreatePercent = 80 -- set to 0 or false to disable. % of the price will be removed from the realtor society wallet when creating a house

Config.AllowRemoveOwned = true -- allow realtors to remove a house someone owns?
Config.AllowSelf = true -- allow realtors to sell & transfer houses to themselves?
Config.AllowWalkin = true -- allow realtors to create walk in houses? (MLO)

Config.Rent = true -- allow realtors to rent out properties?

Config.Command = "reamenu" -- the command to open the job menu (where you can add a house)
Config.Keybind = {
    Enabled = true, -- should the script register a keybind?
    Mapper = "KEYBOARD", -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
    Parameter = "F6"
}

Config.Teleport = {
    vector4(-198.30014038086, -575.40997314453, 40.489864349365, 71.06999206543),
    vector4(-141.67323303223, -617.73034667969, 168.82054138184, 275.59158325195),
}

Config.BossActions = vector3(-125.89316558838, -641.09680175781, 168.83529663086)