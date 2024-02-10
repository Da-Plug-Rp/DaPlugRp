-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = true -- Check for Updates?

Config.PayAccount = 'black_money' -- Account you want the black market to use('black_money', 'money', 'bank')
Config.OldESX = false -- Set to true for older ESX versions lacking xPlayer.canCarryItem function
Config.qtarget = true -- Use target? If set to false will use 3D text
Config.MarketPed = `a_m_m_og_boss_01` -- Jenkins hash of ped here
Config.WebhookLink = 'https://discord.com/api/webhooks/1205309373664993310/8fyhq3-OdjTASuUFoBEmFZ9ziUM2e6lpynoX8yMPtzkRNppJVbI4caMJWpp3eEaIy5v0' -- Webhook here / leave as is if you don't want to use

Config.Locations = { --[[ Locations black market ped will spawn at random per restart.
					 	  If only one desired, that works too]]--
	[1] = {
		coords = vector3(-3575.5042, 6292.9985, 11.1436),
		heading = 277.7951
	},

	[2] = {
		coords = vector3(-3575.5042, 6292.9985, 11.1436),
		heading = 277.7951
	},

	[3] = {
		coords = vector3(-3575.5042, 6292.9985, 11.1436),
		heading = 277.7951
	},

	[4] = {
		coords = vector3(-3575.5042, 6292.9985, 11.1436),
		heading = 277.7951
	},
}

Config.randomLocation = Config.Locations[math.random(1,#Config.Locations)]

Config.Items = { -- If weapons are not as items (Older inventories) then set type = 'weapon' to paramaters like the one commented out under
--	{
--		label = 'Compact Rifle',
--		item = 'WEAPON_COMPACTRIFLE',
--		price = 42500,
--		type = 'weapon'
--	},
	{
		label = 'AK-47',
		item = 'weapon_ak47',
		price = 42500,
	},
	{
		label = 'GLOCK-22',
		item = 'WEAPON_GLOCK22',
		price = 19250,
	},
	{
		label = 'GLOCK-19',
		item = 'WEAPON_GLOCK19',
		price = 41000,
	},
	{
		label = 'GLOCK-18C',
		item = 'WEAPON_GLOCK18C',
		price = 112000,
	},
	{
		label = 'Baseball Bat',
		item = 'WEAPON_BAT',
		price = 40
	},
	{
		label = 'Money Wash Card',
		item = 'moneywashcard',
		price = 1250
	},
}