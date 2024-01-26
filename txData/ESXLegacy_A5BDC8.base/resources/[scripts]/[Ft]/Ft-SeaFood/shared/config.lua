Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = "self-service" -- or "owned", "self-service"
Config.Stock = 100

Config.pogressBar = 10000
Config.PogTitle = "You Are Making Food"
Config.Purchase = "You Bought Food"

Config.Job = 'pearl'

Config.Bank = true -- false = cash

Config.Buy = {
    Position = vector3(-1833.7577, -1190.7595, 14.3092),
    Text = '~r~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(-1838.2722, -1193.7238, 14.3092),
    Text = '~r~[E]~s~ Manage'
}

Config.Cook = {
    Position = vector3(-1846.6885, -1194.5118, 14.3092),
    Text = '~r~[E]~s~ Cooking'
}

Config.BossMenu = {
    Position = vector3(-1839.7460, -1183.3727, 13.9985),
    Text = '~r~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['food'] = {
        Label = 'Food',
        Items = {
            {
                Item = 'baby_lobster',
                Label = 'Baby Lobster',
                Price = 50, -- You can set the actual price here
                Image = 'baby_lobster.png', -- You can set the image filename
                CookReward = 5 -- You can set the actual cook reward here
            },
            {
                Item = 'catfish',
                Label = 'Catfish',
                Price = 50,
                Image = 'catfish.png',
                CookReward = 5 
            },
            {
                Item = 'crab_cake',
                Label = 'Crab Cake',
                Price = 50,
                Image = 'crab_cake.png',
                CookReward = 5 
            },
            {
                Item = 'crablegs_meal',
                Label = 'Crablegs Meal',
                Price = 50,
                Image = 'crablegs_meal.png',
                CookReward = 5 
            },
            {
                Item = 'double_gourmet',
                Label = 'Double Gourmet',
                Price = 50,
                Image = 'double_gourmet.png',
                CookReward = 5 
            },
            {
                Item = 'fish_tilapia',
                Label = 'Fish Tilapia',
                Price = 50,
                Image = 'fish_tilapia.png',
                CookReward = 5 
            },
            {
                Item = 'fried_mushrooms',
                Label = 'Fried Mushrooms',
                Price = 50,
                Image = 'fried_mushrooms.png',
                CookReward = 5 
            },
            {
                Item = 'glazed_almon',
                Label = 'Glazed Almon',
                Price = 50,
                Image = 'glazed_almon.png',
                CookReward = 5 
            },
            {
                Item = 'half_oysters',
                Label = 'Half Oysters',
                Price = 50,
                Image = 'half_oysters.png',
                CookReward = 5 
            },
            {
                Item = 'lobster_bisque',
                Label = 'Lobster Bisque',
                Price = 50,
                Image = 'lobster_bisque.png',
                CookReward = 5 
            },
            {
                Item = 'shrimp_alfredo',
                Label = 'Shrimp Alfredo',
                Price = 50,
                Image = 'shrimp_alfredo.png',
                CookReward = 5 
            },
            {
                Item = 'shrimp_pasta',
                Label = 'Shrimp Pasta',
                Price = 50,
                Image = 'shrimp_pasta.png',
                CookReward = 5 
            },
            {
                Item = 'tropical_chick',
                Label = 'Tropical Chick',
                Price = 50,
                Image = 'tropical_chick.png',
                CookReward = 5 
            }
        }
    },
    ['salad'] = {
        Label = 'Salad',
        Items = {
            {
                Item = 'caesar_side_salad',
                Label = 'Caesar Side Salad',
                Price = 50,
                Image = 'caesar_side_salad.png',
                CookReward = 5 
            },
            {
                Item = 'chicken_caesar_salad',
                Label = 'Chicken Caesar Salad',
                Price = 50,
                Image = 'chicken_caesar_salad.png',
                CookReward = 5 
            },
            {
                Item = 'classic_caesar_salad',
                Label = 'Classic Caesar Salad',
                Price = 50,
                Image = 'classic_caesar_salad.png',
                CookReward = 5 
            },
            {
                Item = 'salmon_caesar_salad',
                Label = 'Salmon Caesar Salad',
                Price = 50,
                Image = 'salmon_caesar_salad.png',
                CookReward = 5 
            },
            {
                Item = 'side_caesar_salad',
                Label = 'Side Caesar Salad',
                Price = 50,
                Image = 'side_caesar_salad.png',
                CookReward = 5 
            }
        }
    },
    ['drinks'] = {
        Label = 'Drinks',
        Items = {
            {
                Item = 'pr_coca_cola',
                Label = 'Coca Cola',
                Price = 50,
                Image = 'pr_coca_cola.png',
                CookReward = 3 
            },
            {
                Item = 'pr_diet_coke',
                Label = 'Diet Coke',
                Price = 50,
                Image = 'pr_diet_coke.png',
                CookReward = 3 
            },
            {
                Item = 'pr_dr_pepper',
                Label = 'Dr. Pepper',
                Price = 50,
                Image = 'pr_dr_pepper.png',
                CookReward = 3 
            },
            {
                Item = 'pr_fanta_orange',
                Label = 'Fanta',
                Price = 50,
                Image = 'pr_fanta_orange.png',
                CookReward = 3 
            },
            {
                Item = 'pr_fruit_punch',
                Label = 'Fruit Punch',
                Price = 50,
                Image = 'pr_fruit_punch.png',
                CookReward = 3 
            },
            {
                Item = 'pr-softdrink',
                Label = 'Soft Drink',
                Price = 50,
                Image = 'pr-softdrink.png',
                CookReward = 3 
            },

        }
    }
}



-----Dogs

Config.Dogs = { -- locations de spawn dos gatos
    ['1'] = {['coords'] = vector4(-1840.1128, -1198.5691, 14.3050, 204.4712),['sitting'] = true},
    ['2'] = {['coords'] = vector4(-1842.6683, -1197.1700, 19.1913, 127.1916),['sitting'] = true},
    ['3'] = {['coords'] = vector4(-1816.5826, -1191.0356, 14.3050, 189.1025),['sitting'] = true}
}



Config.DogBar = "HAVING FUN WITH Dog..."
Config.DogNotify = "Feeling Great 😊"


----Blip

Config.Sprite = 267

Config.Scale = 1.0

Config.color = 3

Config.Name = "Pearl"