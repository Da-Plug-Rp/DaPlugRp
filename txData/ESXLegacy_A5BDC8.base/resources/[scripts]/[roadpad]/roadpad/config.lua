ESX = exports['es_extended']:getSharedObject()

--Run the code below if ESX nil is displayed in your console and delete the code above.

--ESX = nil
--TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---------------------------------------------------------------------------------------

Config = {}

Config.RoadPhone = false --If you use our Product RoadPhone set this to true!

Config.RegisterKeyMapping = true
Config.OpenKey = "M"
Config.NeedItem = true

Config.Locale = 'en' --DEFAULT LUA CODE LANGUAGE

Config.ESXName = "esx" --change if you use different ESX name
Config.ESXVersion = "Legacy" --1.1 OR Legacy
Config.ESXplayerDeathEvent = "esx:onPlayerDeath" --Trigger when the player dies
Config.ESXplayerSpawnEvent = "esx:onPlayerSpawn" --Trigger when the player is revived  
Config.ESXAddonAccount = "esx_addonaccount:getSharedAccount"
Config.ESXGetEmployees = "esx_society:getEmployees"
Config.ESXSetJob = "esx_society:setJob"

Config.Items = {
    "tablet"
}

Config.ESXInventoryChecks = true 
Config.ESXonAddInventoryItem = "esx:onAddInventoryItem" --Trigger when the player gets an item
Config.ESXonRemoveInventoryItem = "esx:onRemoveInventoryItem" --Trigger when the player loses an item

Config.Fahrenheit = false --Set this to true if you want the temperature in Fahrenheit

Config.SyncFlashlight = true --Set to true if you want to sync the flashlight with other players ( may take higher client performance )
 
--Business App

Config.BusinessAppAccess = {
    {
        job = "police",
        grade = 4
    },
    {
        job = "ambulance",
        grade = 3
    }
}

--Valet App

Config.ValetPedModel = "s_m_y_valet_01"
Config.ValetRadius = 500.0 --Radius the car spawned and drive to the player
Config.ValetDeliveryPrice = 500 --How much it costs to have your car delivered
Config.OwnedVehiclesTable = "owned_vehicles" --Change this if you use a different table name for owned vehicles

Config.Crypto = {
    ['Bitcoin'] = true,
    ['Monero'] = true,
    ['Ethereum'] = true,
    ['Cardano'] = true,
    ['Dogecoin'] = true,
    ['Litecoin'] = true,
    ['Tether'] = true,
    ['VeChain'] = true,
    ['BNB'] = true,
    ['Solana'] = true,
    ['XRP'] = true,
    ['Shiba Inu'] = true,
    ['Bitcoin Cash'] = true,
    ['Chainlink'] = true
}


Config.EbayBlacklistedItems = {
    'marijuana',
    'cannabis'
}

--Other

Config.VisnAre = false --Set the value to true if you use the product visnAre. ( Make sure you are on the latest visnAre! )
Config.cdGarages = false --Set the value to true if you use the product cd_garages. ( Make sure you are on the latest cd_garages! )


--Billing
Config.okokBilling = false --Set the value to true if you use the product okokBilling v1. ( TESTED with v1, v2 maybe not working! )
Config.JaksamBilling = false --Set the value to true if you use the product jaksamBilling. ( Make sure you are on the latest jaksamBilling! )
Config.myBilling = false --Set the value to true if you use the product myBilling. ( Make sure you are on the latest myBilling! )
Config.codemBilling = false --Set the value to true if you use the product codemBilling. ( Make sure you are on the latest codemBilling! )


--Banking
Config.okokBanking = true' --Set the value to true if you use the product okokBanking. ( Make sure you are on the latest okokBanking! )

Config.CarDebug = false 

--Don't change anything if you don't know what are you doing.
--These tables only change code that is not accessible to you, which means you also have to make changes in ServerAPI.lua.

Config.UserTable = "users"
Config.JobsTable = "jobs"
Config.AddonAccountTable = "addon_account_data"
Config.Phone_NumberColumn = "phone_number"
Config.UnemployedJob = "unemployed"
