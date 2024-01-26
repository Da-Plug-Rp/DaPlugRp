Loc = {}
Seashell = {}

--------------------------------
-- Seashell digging locations
--------------------------------
Seashell.SeashellPositions = {
	--- Del Perro Beach
	{ coords = vector3(-1829.62, -921.85, 1.38), },
	{ coords = vector3(-1832.6, -913.39, 1.53), },
	{ coords = vector3(-1836.59, -904.83, 1.64), },
	{ coords = vector3(-1840.76, -898.2, 1.61), },
	{ coords = vector3(-1847.78, -883.88, 1.92), },
	{ coords = vector3(-1858.07, -879.07, 1.12), },
	{ coords = vector3(-1865.4, -868.86, 1.15), },
	{ coords = vector3(-1870.49, -858.11, 1.59), },
	{ coords = vector3(-1878.14, -852.61, 1.19), },
	{ coords = vector3(-1884.04, -846.5, 1.06), },
	--- Vespucci Beach
	{ coords = vector3(-1497.0, -1431.94, 1.05), },
	{ coords = vector3(-1499.12, -1426.74, 1.03), },
	{ coords = vector3(-1501.66, -1419.64, 1.06), },
	{ coords = vector3(-1505.51, -1409.47, 1.04), },
	{ coords = vector3(-1510.28, -1399.52, 0.91), },
	{ coords = vector3(-1513.82, -1386.18, 1.07), },
	{ coords = vector3(-1515.68, -1374.09, 1.25), },
	{ coords = vector3(-1518.85, -1362.97, 1.28), },
	{ coords = vector3(-1523.53, -1350.11, 1.21), },
	{ coords = vector3(-1525.52, -1335.57, 1.39), },
}

-- This is the rewards after digging
Seashell.RewardPool = {
	[1] = "conch",
	[2] = "sea_snail",
	[3] = "shell",
	[4] = "shell_2",
	[5] = "starfish",
}

-- Prices for selling
Seashell.SellItems = {
	conch = 100,
	sea_snail = 120,
	shell = 150,
	shell_2 = 80,
	starfish = 70,
}