Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = "self-service" -- or "owned", "self-service"
Config.Stock = 100

Config.pogressBar = 10000
Config.PogTitle = "You Are Making Food"
Config.Purchase = "You Bought Food"

Config.Job = 'burgershot'

Config.Bank = true -- false = cash

Config.Buy = {
    Position = vector3(-1193.9452, -892.7839, 13.995),
    Text = '~o~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(-1193.7819, -895.9709, 13.99),
    Text = '~o~[E]~s~ Manage'
}

Config.Cook = {
    Position = vector3(-1197.4333, -897.5319, 13.99),
    Text = '~o~[E]~s~ Cooking'
}

Config.BossMenu = {
    Position = vector3(-1192.9598, -901.1309, 13.999),
    Text = '~o~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['burger'] = {
        Label = 'Burger',
        Items = {
            {
                Item = 'bacon_double_cheeseburger',
                Label = 'Bacon Double Cheeseburger',
                Price = 50,
                Image = 'bacon_double_cheeseburger.png',
                CookReward = 5
            },
            {
                Item = 'bacon_ham_sausage',
                Label = 'Fully Loaded Bacon Ham Sausage',
                Price = 50,
                Image = 'bacon_ham_sausage.png',
                CookReward = 5
            },
            {
                Item = 'bacon_king',
                Label = 'Bacon King',
                Price = 50,
                Image = 'bacon_king.png',
                CookReward = 5
            },
            {
                Item = 'big_fish',
                Label = 'Big Fish',
                Price = 50,
                Image = 'big_fish.png',
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
                Item = 'buttermilk_biscuit',
                Label = 'Fully Loaded Buttermilk',
                Price = 50,
                Image = 'buttermilk_biscuit.png',
                CookReward = 5
            },
            {
                Item = 'deluxe_chicken_sandwich',
                Label = 'Ch King Deluxe Chicken Sandwich',
                Price = 50,
                Image = 'deluxe_chicken_sandwich.png',
                CookReward = 5
            }
        }
    },
    ['mix'] = {
        Label = 'Mix',
        Items = {
            {
                Item = 'bs_mozzarella_sticks',
                Label = 'Mozzarella Sticks',
                Price = 50,
                Image = 'bs_mozzarella_sticks.png',
                CookReward = 5
            },
            {
                Item = 'cheesy_tots',
                Label = 'Cheesy Tots',
                Price = 50,
                Image = 'cheesy_tots.png',
                CookReward = 5
            },
            {
                Item = 'chicken_fries',
                Label = '9 pc Chicken Fries',
                Price = 50,
                Image = 'chicken_fries.png',
                CookReward = 5
            },
            {
                Item = 'chicken_nuggets',
                Label = 'Chicken Nuggets',
                Price = 50,
                Image = 'chicken_nuggets.png',
                CookReward = 5
            },
            {
                Item = 'egg_normous_burrito',
                Label = 'Egg Normous Burrito',
                Price = 50,
                Image = 'egg_normous_burrito.png',
                CookReward = 5
            },
            {
                Item = 'ham_egg_cheese',
                Label = 'Ham, Egg, & Cheese CroissanWich',
                Price = 50,
                Image = 'ham_egg_cheese.png',
                CookReward = 5
            },
            {
                Item = 'jalapeno_cheddar_bites',
                Label = 'Jalapeno Cheddar Bites',
                Price = 50,
                Image = 'jalapeno_cheddar_bites.png',
                CookReward = 5
            },
            {
                Item = 'pancake_sausage_platter',
                Label = 'Pancake & Sausage Platter',
                Price = 50,
                Image = 'pancake_sausage_platter.png',
                CookReward = 5
            }
        }
    },
    ['drinks'] = {
        Label = 'Drinks',
        Items = {
            {
                Item = 'bs_coca_cola',
                Label = 'Medium Coca-Cola',
                Price = 30,
                Image = 'bs_coca_cola.png',
                CookReward = 3
            },
            {
                Item = 'bs_fanta_orange',
                Label = 'Medium Fanta Orange',
                Price = 30,
                Image = 'bs_fanta_orange.png',
                CookReward = 3
            },
            {
                Item = 'bs_fruit_punch',
                Label = 'Medium Hi-C Fruit Punch',
                Price = 30,
                Image = 'bs_fruit_punch.png',
                CookReward = 3
            },
            {
                Item = 'bs_iced_tea',
                Label = 'Medium Sweetened Iced Tea',
                Price = 30,
                Image = 'bs_iced_tea.png',
                CookReward = 3
            },
            {
                Item = 'bs_sprite',
                Label = 'Medium Sprite',
                Price = 30,
                Image = 'bs_sprite.png',
                CookReward = 3
            },
            {
                Item = 'bs_yello_mello',
                Label = 'Medium Mello Yello',
                Price = 30,
                Image = 'bs_yello_mello.png',
                CookReward = 3
            },
            {
                Item = 'chocolate_cookie_shake',
                Label = 'Chocolate OREO Cookie Shake',
                Price = 30,
                Image = 'chocolate_cookie_shake.png',
                CookReward = 3
            },
            {
                Item = 'pink_lemonade',
                Label = 'Medium Hi-C Pink Lemonade',
                Price = 30,
                Image = 'pink_lemonade.png',
                CookReward = 3
            }
        }
    }
}



-----Dogs

Config.Dogs = { -- locations de spawn dos gatos
    ['1'] = {['coords'] = vector4(-1189.0089, -884.5160, 13.9952, 268.9771),['sitting'] = true},
    ['2'] = {['coords'] = vector4(-1180.2899, -885.7803, 13.7950, 21.1619),['sitting'] = true},
    ['3'] = {['coords'] = vector4(-1178.9930, -886.8202, 13.8116, 339.4003),['sitting'] = true}
}



Config.DogBar = "HAVING FUN WITH DOG..."
Config.DogNotify = "Feeling Great 😊"


----Blip

Config.Sprite = 106

Config.Scale = 1.0

Config.color = 17

Config.Name = "Burger Shot"