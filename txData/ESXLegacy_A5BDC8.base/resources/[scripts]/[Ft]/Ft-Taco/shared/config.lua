Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = "self-service" -- or "owned", "self-service"
Config.Stock = 100

Config.pogressBar = 10000
Config.PogTitle = "You Are Making Food"
Config.Purchase = "You Bought Food"

Config.Job = 'taco'

Config.Bank = true -- false = cash

Config.Buy = {
    Position = vector3(386.8174, -315.1323, 46.9558),
    Text = '~y~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(376.1159, -319.4693, 46.9558),
    Text = '~y~[E]~s~ Manage'
}

Config.Cook = {
    Position = vector3(378.1785, -311.1780, 46.9558),
    Text = '~y~[E]~s~ Cooking'
}

Config.BossMenu = {
    Position = vector3(387.1714, -317.2883, 50.5695),
    Text = '~y~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['vegi'] = {
        Label = 'vegi',
        Items = {
            {
                Item = 'chalupa_supreme',
                Label = 'Chalupa Supreme',
                Price = 50,
                Image = 'chalupa_supreme.png',
                CookReward = 5
            },
            {
                Item = 'cheesy_gordita_crunch',
                Label = 'Cheesy Gordita',
                Price = 50,
                Image = 'cheesy_gordita_crunch.png',
                CookReward = 5
            },
            {
                Item = 'crispy_chicken_staco',
                Label = 'Crispy Chicken',
                Price = 50,
                Image = 'crispy_chicken_staco.png',
                CookReward = 5
            },
            {
                Item = 'crunchytaco',
                Label = 'Crunchy Taco',
                Price = 50,
                Image = 'crunchytaco.png',
                CookReward = 5
            },
            {
                Item = 'soft_taco',
                Label = 'Soft Taco',
                Price = 50,
                Image = 'soft_taco.png',
                CookReward = 5
            },
            {
                Item = 'soft_taco_supreme',
                Label = 'Soft Taco Supreme',
                Price = 50,
                Image = 'soft_taco_supreme.png',
                CookReward = 5
            },
            {
                Item = 'taco_regular',
                Label = 'Spicy Burrito',
                Price = 50,
                Image = 'taco_regular.png',
                CookReward = 5
            },
            {
                Item = 'tacomeet',
                Label = 'Taco Meet',
                Price = 50,
                Image = 'tacomeet.png',
                CookReward = 5
            }
        }
    },
    ['meet'] = {
        Label = 'Meet',
        Items = {
            {
                Item = 'cheesy_black_bean',
                Label = 'Cheesy Black',
                Price = 50,
                Image = 'cheesy_black_bean.png',
                CookReward = 5
            },
            {
                Item = 'chicken_burrito',
                Label = 'Chicken Burrito',
                Price = 50,
                Image = 'chicken_burrito.png',
                CookReward = 5
            },
            {
                Item = 'fishtaco',
                Label = 'Fish Taco',
                Price = 50,
                Image = 'fishtaco.png',
                CookReward = 5
            },
            {
                Item = 'spicy_chicken_burrito',
                Label = 'Spicy Burrito',
                Price = 50,
                Image = 'spicy_chicken_burrito.png',
                CookReward = 5
            },
            {
                Item = 'volcano_burrito',
                Label = 'Volcano Burrito',
                Price = 50,
                Image = 'volcano_burrito.png',
                CookReward = 5
            },
            {
                Item = 'crunchwrap_supreme',
                Label = 'Crunchwrap',
                Price = 50,
                Image = 'crunchwrap_supreme.png',
                CookReward = 5
            },
            {
                Item = 'beefy_nacho',
                Label = 'Beefy Nacho',
                Price = 50,
                Image = 'beefy_nacho.png',
                CookReward = 5
            }
        }
    },
    ['spicy'] = {
        Label = 'Spicy',
        Items = {
            {
                Item = 'cheese_quesadilla',
                Label = 'Quesadilla',
                Price = 50,
                Image = 'cheese_quesadilla.png',
                CookReward = 5
            },
            {
                Item = 'churros_dip',
                Label = 'Churros Dip',
                Price = 50,
                Image = 'churros_dip.png',
                CookReward = 5
            },
            {
                Item = 'cinnamon_twists',
                Label = 'Cinnamon Twists',
                Price = 50,
                Image = 'cinnamon_twists.png',
                CookReward = 5
            },
            {
                Item = 'crunchy_taco_supreme',
                Label = 'Crunchy Supreme',
                Price = 50,
                Image = 'crunchy_taco_supreme.png',
                CookReward = 5
            },
            {
                Item = 'fries_grande',
                Label = 'Fries Grande',
                Price = 50,
                Image = 'fries_grande.png',
                CookReward = 5
            },
            {
                Item = 'quesadilla',
                Label = 'Quesadilla',
                Price = 50,
                Image = 'quesadilla.png',
                CookReward = 5
            }
        }
    },
    ['drinks'] = {
        Label = 'Drinks',
        Items = {
            {
                Item = 't_diet_pepsi',
                Label = 'Diet Pepsi',
                Price = 30,
                Image = 't_diet_pepsi.png',
                CookReward = 3
            },
            {
                Item = 't_seven_up',
                Label = 'Seven Up',
                Price = 30,
                Image = 't_seven_up.png',
                CookReward = 3
            },
            {
                Item = 't_tango_apple',
                Label = 'Tango Apple',
                Price = 30,
                Image = 't_tango_apple.png',
                CookReward = 3
            },
            {
                Item = 't_tango_orange',
                Label = 'Tango Orange',
                Price = 30,
                Image = 't_tango_orange.png',
                CookReward = 3
            }
        }
    }
}




----Blip

Config.Sprite = 79

Config.Scale = 1.1

Config.color = 73

Config.Name = "Taco Shop"