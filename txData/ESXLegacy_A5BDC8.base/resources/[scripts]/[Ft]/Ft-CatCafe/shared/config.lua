Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = "self-service" -- or "owned", "self-service"
Config.Stock = 100

Config.pogressBar = 10000
Config.PogTitle = "You Are Making Food"
Config.Purchase = "You Bought Food"

Config.Job = 'catcafe'

Config.Bank = true -- false = cash

Config.Buy = {
    Position = vector3(-583.3204, -1060.4270, 22.344),
    Text = '~r~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(-586.2299, -1059.7688, 22.34),
    Text = '~r~[E]~s~ Manage'
}

Config.Cook = {
    Position = vector3(-590.4023, -1056.6937, 22.356),
    Text = '~r~[E]~s~ Cooking'
}

Config.BossMenu = {
    Position = vector3(-597.8433, -1053.3955, 22.344),
    Text = '~r~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['cake'] = {
        Label = 'Cake',
        Items = {
            {
                Item = 'cupchocolate',
                Label = 'Chocolate Cup',
                Price = 50,
                Image = 'cupchocolate.png',
                CookReward = 5
            },
            {
                Item = 'cuplimao',
                Label = 'Limao Cup',
                Price = 50,
                Image = 'cuplimao.png',
                CookReward = 5
            },
            {
                Item = 'cupmorango',
                Label = 'Morango Cup',
                Price = 50,
                Image = 'cupmorango.png',
                CookReward = 5
            },
            {
                Item = 'gechocolate',
                Label = 'Chocolate Ge',
                Price = 50,
                Image = 'gechocolate.png',
                CookReward = 5
            },
            {
                Item = 'gemorango',
                Label = 'Morango Ge',
                Price = 50,
                Image = 'gemorango.png',
                CookReward = 5
            },
            {
                Item = 'mufchocolate',
                Label = 'Chocolate Muf',
                Price = 50,
                Image = 'mufchocolate.png',
                CookReward = 5
            },
            {
                Item = 'panutela',
                Label = 'Panutela',
                Price = 50,
                Image = 'panutela.png',
                CookReward = 5
            },
            {
                Item = 'paoreo',
                Label = 'Paoreo',
                Price = 50,
                Image = 'paoreo.png',
                CookReward = 5
            }
        }
    },
    ['choco'] = {
        Label = 'Choco',
        Items = {
            {
                Item = 'amoras',
                Label = 'Amoras',
                Price = 50,
                Image = 'amoras.png',
                CookReward = 5
            },
            {
                Item = 'chocolate',
                Label = 'Chocolate',
                Price = 50,
                Image = 'chocolate.png',
                CookReward = 5
            },
            {
                Item = 'graoscafe',
                Label = 'Graos Cafe',
                Price = 50,
                Image = 'graoscafe.png',
                CookReward = 5
            },
            {
                Item = 'morangos',
                Label = 'Morangos',
                Price = 50,
                Image = 'morangos.png',
                CookReward = 5
            },
            {
                Item = 'nutela',
                Label = 'Nutela',
                Price = 50,
                Image = 'nutela.png',
                CookReward = 5
            },
            {
                Item = 'oreo',
                Label = 'Oreo',
                Price = 50,
                Image = 'oreo.png',
                CookReward = 5
            },
            {
                Item = 'pfrango',
                Label = 'Pfrango',
                Price = 50,
                Image = 'pfrango.png',
                CookReward = 5
            },
            {
                Item = 'wnutela',
                Label = 'Wnutela',
                Price = 50,
                Image = 'wnutela.png',
                CookReward = 5
            }
        }
    },
    ['Juice'] = {
        Label = 'Juice',
        Items = {
            {
                Item = 'btamora',
                Label = 'Btamora',
                Price = 30,
                Image = 'btamora.png',
                CookReward = 3
            },
            {
                Item = 'btmenta',
                Label = 'Btmenta',
                Price = 30,
                Image = 'btmenta.png',
                CookReward = 3
            },
            {
                Item = 'btmorango',
                Label = 'Btmorango',
                Price = 30,
                Image = 'btmorango.png',
                CookReward = 3
            },
            {
                Item = 'mschocolate',
                Label = 'Ms Chocolate',
                Price = 30,
                Image = 'mschocolate.png',
                CookReward = 3
            },
            {
                Item = 'msmorango',
                Label = 'Ms Morango',
                Price = 30,
                Image = 'msmorango.png',
                CookReward = 3
            }
        }
    }
}



-----Cats

Config.Cats = { -- locations For Spawn Cats
    ['1'] = {['coords'] = vector4(-573.9, -1056.29, 22.43, 115.15),['sitting'] = true},
    ['2'] = {['coords'] = vector4(-574.16, -1053.91, 22.34, 146.09),['sitting'] = true},
    ['3'] = {['coords'] = vector4(-576.37, -1054.71, 22.43, 143.33),['sitting'] = true},
    ['4'] = {['coords'] = vector4(-584.91, -1052.77, 22.35, 232.57),['sitting'] = true},
    ['5'] = {['coords'] = vector4(-582.36, -1054.65, 22.43, 255.45),['sitting'] = false},
    ['6'] = {['coords'] = vector4(-582.18, -1056.0, 22.43, 306.29),['sitting'] = true},
    ['7'] = {['coords'] = vector4(-575.52, -1063.21, 22.34, 44.51),['sitting'] = true},
    ['8'] = {['coords'] = vector4(-581.82, -1066.43, 22.34, 287.58),['sitting'] = true},
    ['9'] = {['coords'] = vector4(-583.49, -1069.39, 22.99, 293.01) ,['sitting'] = false},
    ['10'] = {['coords'] = vector4(-584.27, -1065.85, 22.34, 181.7),['sitting'] = true},  
    ['11'] = {['coords'] = vector4(-581.1, -1063.61, 22.79, 219.69),['sitting'] = false},
    ['12'] = {['coords'] = vector4(-572.98, -1057.41, 24.5, 88.18),['sitting'] = true}
}



Config.CatBar = "HAVING FUN WITH CAT's..."
Config.CatNotify = "Feeling Great 😊"


----Blip

Config.Sprite = 489

Config.Scale = 1.1

Config.color = 8

Config.Name = "Cat Cafe"