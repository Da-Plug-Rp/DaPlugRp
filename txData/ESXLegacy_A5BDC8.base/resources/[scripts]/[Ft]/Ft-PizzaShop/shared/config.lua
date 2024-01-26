Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = "self-service" -- or "owned", "self-service"
Config.Stock = 100

Config.pogressBar = 10000
Config.PogTitle = "You Are Making Food"
Config.Purchase = "You Bought Food"

Config.Job = 'pizzathis'

Config.Bank = true -- false = cash

Config.Buy = {
    Position = vector3(810.2472, -752.4400, 26.7808),
    Text = '~r~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(812.9327, -760.4141, 26.7808),
    Text = '~r~[E]~s~ Manage'
}

Config.Cook = {
    Position = vector3(807.5927, -761.2627, 26.7808),
    Text = '~r~[E]~s~ Cooking'
}

Config.BossMenu = {
    Position = vector3(798.5178, -750.7307, 31.2660),
    Text = '~r~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['pizza'] = {
        Label = 'Pizza',
        Items = {
            {
                Item = 'buffalo_chicken',
                Label = 'Buffalo Chicken',
                Price = 50,
                Image = 'buffalo_chicken.png',
                CookReward = 5
            },
            {
                Item = 'cali_chicken_bacon',
                Label = 'Cali Chicken Bacon',
                Price = 50,
                Image = 'cali_chicken_bacon.png',
                CookReward = 5
            },
            {
                Item = 'extra_vagan_zza',
                Label = 'Extra Vagan ZZa',
                Price = 50,
                Image = 'extra_vagan_zza.png',
                CookReward = 5
            },
            {
                Item = 'honolulu_hawaiian',
                Label = 'Honolulu Hawaiian',
                Price = 50,
                Image = 'honolulu_hawaiian.png',
                CookReward = 5
            },
            {
                Item = 'meat_zza',
                Label = 'Meat ZZa',
                Price = 50,
                Image = 'meat_zza.png',
                CookReward = 5
            },
            {
                Item = 'memphis_bbq_chicken',
                Label = 'Memphis BBQ Chicken',
                Price = 50,
                Image = 'memphis_bbq_chicken.png',
                CookReward = 5
            },
            {
                Item = 'pacific_veggie',
                Label = 'Pacific Veggie',
                Price = 50,
                Image = 'pacific_veggie.png',
                CookReward = 5
            },
            {
                Item = 'philly_cheese_steak',
                Label = 'Philly Cheese Steak',
                Price = 50,
                Image = 'philly_cheese_steak.png',
                CookReward = 5
            },
            {
                Item = 'pizza_deluxe',
                Label = 'Pizza Deluxe',
                Price = 50,
                Image = 'pizza_deluxe.png',
                CookReward = 5
            },
            {
                Item = 'spinach_feta',
                Label = 'Spinach & Feta',
                Price = 50,
                Image = 'spinach_feta.png',
                CookReward = 5
            },
            {
                Item = 'ultimate_pepperoni',
                Label = 'Ultimate Pepperoni',
                Price = 50,
                Image = 'ultimate_pepperoni.png',
                CookReward = 5
            },
            {
                Item = 'wisconsin_cheese',
                Label = 'Wisconsin 6 Cheese',
                Price = 50,
                Image = 'wisconsin_cheese.png',
                CookReward = 5
            }
        }
    },
    ['mix'] = {
        Label = 'Mix',
        Items = {
            {
                Item = 'chicken_habanero',
                Label = 'Chicken Habanero',
                Price = 50,
                Image = 'chicken_habanero.png',
                CookReward = 5
            },
            {
                Item = 'mediterranean_veggie',
                Label = 'Mediterranean Veggie',
                Price = 50,
                Image = 'mediterranean_veggie.png',
                CookReward = 5
            },
            {
                Item = 'philly_cheese_sandwich',
                Label = 'Philly Cheese Sandwich',
                Price = 50,
                Image = 'philly_cheese_sandwich.png',
                CookReward = 5
            },
            {
                Item = 'chicken_bacon_ranch',
                Label = 'Chicken Bacon Ranch',
                Price = 50,
                Image = 'chicken_bacon_ranch.png',
                CookReward = 5
            },
            {
                Item = 'italian_sandwich',
                Label = 'Italian Sandwich',
                Price = 50,
                Image = 'italian_sandwich.png',
                CookReward = 5
            },
            {
                Item = 'chicken_parm',
                Label = 'Chicken Parm',
                Price = 50,
                Image = 'chicken_parm.png',
                CookReward = 5
            },
            {
                Item = 'p_chicken_alfredo',
                Label = 'Chicken Alfredo',
                Price = 50,
                Image = 'p_chicken_alfredo.png',
                CookReward = 5
            },
            {
                Item = 'italian_sausage_marinara',
                Label = 'Italian Sausage Marinara',
                Price = 50,
                Image = 'italian_sausage_marinara.png',
                CookReward = 5
            },
            {
                Item = 'chicken_carbonara',
                Label = 'Chicken Carbonara',
                Price = 50,
                Image = 'chicken_carbonara.png',
                CookReward = 5
            },
            {
                Item = 'pasta_primavera',
                Label = 'Pasta Primavera',
                Price = 50,
                Image = 'pasta_primavera.png',
                CookReward = 5
            }
        }
    },
    ['drinks'] = {
        Label = 'Drinks',
        Items = {
            {
                Item = 'd_coca_cola',
                Label = 'Coca Cola',
                Price = 30,
                Image = 'd_coca_cola.png',
                CookReward = 3
            },
            {
                Item = 'd_dr_pepper',
                Label = 'Dr Pepper',
                Price = 30,
                Image = 'd_dr_pepper.png',
                CookReward = 3
            },
            {
                Item = 'd_fanta_orange',
                Label = 'Fanta Orange',
                Price = 30,
                Image = 'd_fanta_orange.png',
                CookReward = 3
            },
            {
                Item = 'd_fruit_punch',
                Label = 'Fruit Punch',
                Price = 30,
                Image = 'd_fruit_punch.png',
                CookReward = 3
            },
            {
                Item = 'd_sprite',
                Label = 'Sprite',
                Price = 30,
                Image = 'd_sprite.png',
                CookReward = 3
            }
        }
    }
}



-----Dogs

Config.Dogs = { -- locations de spawn dos gatos
    ['1'] = {['coords'] = vector4(537.1237, 104.0547, 96.5703, 232.2068),['sitting'] = false},
    ['2'] = {['coords'] = vector4(538.6954, 101.2838, 96.5241, 104.1937),['sitting'] = false}
}



Config.DogBar = "HAVING FUN WITH Dog..."
Config.DogNotify = "Feeling Great 😊"


----Blip

Config.Blip = true

Config.Sprite = 389

Config.Scale = 1.0

Config.color = 1

Config.Name = "pizzathis"