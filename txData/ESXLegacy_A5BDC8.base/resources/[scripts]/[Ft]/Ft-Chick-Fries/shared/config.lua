Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = "self-service" -- or "owned", "self-service"
Config.Stock = 100

Config.pogressBar = 10000
Config.PogTitle = "You Are Making Food"
Config.Purchase = "You Bought Food"

Config.Job = 'kfc'

Config.Bank = true -- false = cash

Config.Buy = {
    Position = vector3(346.0805, -883.3217, 29.339),
    Text = '~r~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(345.0540, -888.4293, 29.339),
    Text = '~r~[E]~s~ Manage'
}

Config.Cook = {
    Position = vector3(341.1790, -896.1128, 29.33),
    Text = '~r~[E]~s~ Cooking'
}

Config.BossMenu = {
    Position = vector3(337.2864, -894.5977, 29.339),
    Text = '~r~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['deals'] = {
        Label = 'Deals',
        Items = {
            {
                Item = 'crispy-duo-box',
                Label = 'Crispy Duo Box',
                Price = 50,
                Image = 'crispy-duo-box.png',
                CookReward = 5
            },
            
            {
                Item = 'crunch-with-friesdrink',
                Label = 'Crunch Fries&drink',
                Price = 50,
                Image = 'crunch-with-friesdrink.png',
                CookReward = 5
            },
            
            {
                Item = 'family-festivle-3',
                Label = 'Family Festivle',
                Price = 50,
                Image = 'family-festivle-3.png',
                CookReward = 5
            },
            
            {
                Item = 'kfc-meal',
                Label = 'Kfc Meal',
                Price = 50,
                Image = 'kfc-meal.png',
                CookReward = 5
            },
            
            {
                Item = 'midnight-deal',
                Label = 'Midnight Deal',
                Price = 50,
                Image = 'midnight-deal.png',
                CookReward = 5
            },
            
            {
                Item = 'sharing',
                Label = 'Sharing',
                Price = 50,
                Image = 'sharing.png',
                CookReward = 5
            },
            
            {
                Item = 'signaturebox-deal',
                Label = 'Signaturebox Deal',
                Price = 50,
                Image = 'signaturebox-deal.png',
                CookReward = 5
            },
            
            {
                Item = 'snacks-deal',
                Label = 'Snacks Deal',
                Price = 50,
                Image = 'snacks-deal.png',
                CookReward = 5
            },
            
            {
                Item = 'twister-combo',
                Label = 'Cwister Combo',
                Price = 50,
                Image = 'twister-combo.png',
                CookReward = 5
            },
            
            {
                Item = 'zingerstack-combo',
                Label = 'Zingerstack Combo',
                Price = 50,
                Image = 'zingerstack-combo.png',
                CookReward = 5
            }
        }
    },
    ['best'] = {
        Label = 'Best',
        Items = {
            {
                Item = 'alacart',
                Label = 'Alacart',
                Price = 50,
                Image = 'alacart.png',
                CookReward = 5
            },
            
            {
                Item = 'bacon_double_cheeseburger',
                Label = 'Bacon Double Cheeseburger',
                Price = 50,
                Image = 'bacon_double_cheeseburger.png',
                CookReward = 5
            },
            
            {
                Item = 'bacon_ham_sausage',
                Label = 'Bacon Ham Sausage',
                Price = 50,
                Image = 'bacon_ham_sausage.png',
                CookReward = 5
            },
            
            {
                Item = 'bs_chicken_jr',
                Label = 'Chicken Jr',
                Price = 50,
                Image = 'bs_chicken_jr.png',
                CookReward = 5
            },
            
            {
                Item = 'bs_hamburger',
                Label = 'Hamburger',
                Price = 50,
                Image = 'bs_hamburger.png',
                CookReward = 5
            },
            
            {
                Item = 'chick_fil_a_nuggets',
                Label = 'Chicken Nuggets',
                Price = 50,
                Image = 'chick_fil_a_nuggets.png',
                CookReward = 5
            },
            
            {
                Item = 'kfc-fries',
                Label = 'Kfc Fries',
                Price = 50,
                Image = 'kfc-fries.png',
                CookReward = 5
            },
            
            {
                Item = 'sausage_burrito',
                Label = 'Sausage Burrito',
                Price = 50,
                Image = 'sausage_burrito.png',
                CookReward = 5
            }
        }
    },
    ['drinks'] = {
        Label = 'Drinks',
        Items = {
            {
                Item = 't_diet_pepsi',
                Label = 'Pepsi',
                Price = 50,
                Image = 't_diet_pepsi.png',
                CookReward = 3
            },
            
            {
                Item = 't_seven_up',
                Label = '7 UP',
                Price = 50,
                Image = 't_seven_up.png',
                CookReward = 3
            },
            
            {
                Item = 't_tango_orange',
                Label = 'Tango Orange',
                Price = 50,
                Image = 't_tango_orange.png',
                CookReward = 3
            }
        }
    }
}



-----Dogs

Config.Dogs = { -- locations de spawn dos gatos
    ['1'] = {['coords'] = vector4(334.7447, -873.9277, 29.2916, 319.8414),['sitting'] = true},
    ['2'] = {['coords'] = vector4(336.7175, -874.0811, 29.2916, 7.1921),['sitting'] = true},
    ['3'] = {['coords'] = vector4(343.6123, -874.2324, 29.2916, 47.0246),['sitting'] = true}
}



Config.DogBar = "HAVING FUN WITH Dog..."
Config.DogNotify = "Feeling Great 😊"


----Blip

Config.Sprite = 206

Config.Scale = 1.0

Config.color = 1

Config.Name = ""