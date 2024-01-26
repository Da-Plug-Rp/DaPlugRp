Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = "self-service" -- or "owned", "self-service"
Config.Stock = 100

Config.pogressBar = 10000
Config.PogTitle = "You Are Making Food"
Config.Purchase = "You Bought Food"

Config.Job = 'upnatom'

Config.Bank = false -- false = cash

Config.Buy = {
    Position = vector3(89.1398, 286.8486, 110.2094),
    Text = '~r~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(91.0234, 288.7158, 110.2094),
    Text = '~r~[E]~s~ Manage'
}

Config.Cook = {
    Position = vector3(94.6395, 291.4598, 110.2094),
    Text = '~r~[E]~s~ Cooking'
}

Config.BossMenu = {
    Position = vector3(81.3273, 296.4530, 110.2495),
    Text = '~r~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['mac'] = {
        Label = 'Mac',
        Items = {
            {
                Item = 'big_mac',
                Label = 'Big Mac',
                Price = 50,
                Image = 'big_mac.png',
                CookReward = 5
            },
            {
                Item = 'chicken_mcnuggets',
                Label = 'Chicken McNuggets',
                Price = 50,
                Image = 'chicken_mcnuggets.png',
                CookReward = 5
            },
            {
                Item = 'crispy_chicken_sandwich',
                Label = 'Crispy Chicken Sandwich',
                Price = 50,
                Image = 'crispy_chicken_sandwich.png',
                CookReward = 5
            },
            {
                Item = 'double_quarter_pounder',
                Label = 'Double Quarter Pounder',
                Price = 50,
                Image = 'double_quarter_pounder.png',
                CookReward = 5
            },
            {
                Item = 'egg_mcmuffin',
                Label = 'Egg McMuffin',
                Price = 50,
                Image = 'egg_mcmuffin.png',
                CookReward = 5
            },
            {
                Item = 'quarter_pounder',
                Label = 'Quarter Pounder',
                Price = 50,
                Image = 'quarter_pounder.png',
                CookReward = 5
            },
            {
                Item = 'quarter_pounder_cheese',
                Label = 'Quarter Pounder Cheese',
                Price = 50,
                Image = 'quarter_pounder_cheese.png',
                CookReward = 5
            },
            {
                Item = 'sausage_biscuit',
                Label = 'Sausage Biscuit',
                Price = 50,
                Image = 'sausage_biscuit.png',
                CookReward = 5
            },
            {
                Item = 'sausage_burrito',
                Label = 'Sausage Burrito',
                Price = 50,
                Image = 'sausage_burrito.png',
                CookReward = 5
            },
            {
                Item = 'spicy_crispy_chicken_sandwich',
                Label = 'Spicy Crispy Chicken Sandwich',
                Price = 50,
                Image = 'spicy_crispy_chicken_sandwich.png',
                CookReward = 5
            },
            {
                Item = 'spicy_deluxe_sandwich',
                Label = 'Spicy Deluxe Sandwich',
                Price = 50,
                Image = 'spicy_deluxe_sandwich.png',
                CookReward = 5
            }
        }
    },
    ['deal'] = {
        Label = 'Deals',
        Items = {
            {
                Item = 'big_mac_combo',
                Label = 'Big Mac Combo',
                Price = 50,
                Image = 'big_mac_combo.png',
                CookReward = 5
            },
            {
                Item = 'cheeseburger_combo_meal',
                Label = 'Cheeseburger Combo Meal',
                Price = 50,
                Image = 'cheeseburger_combo_meal.png',
                CookReward = 5
            },
            {
                Item = 'deluxe_crispy_sandwich_combo',
                Label = 'Deluxe Crispy Sandwich Combo',
                Price = 50,
                Image = 'deluxe_crispy_sandwich_combo.png',
                CookReward = 5
            },
            {
                Item = 'double_quarter_combo',
                Label = 'Double Quarter Combo',
                Price = 50,
                Image = 'double_quarter_combo.png',
                CookReward = 5
            },
            {
                Item = 'egg_cheese_biscuit',
                Label = 'Egg Cheese Biscuit',
                Price = 50,
                Image = 'egg_cheese_biscuit.png',
                CookReward = 5
            },
            {
                Item = 'mc_combo_chicken',
                Label = 'Combo Chicken',
                Price = 50,
                Image = 'mc_combo_chicken.png',
                CookReward = 5
            },
            {
                Item = 'mc_nuggets_happy_meal',
                Label = 'McNuggets Happy Meal',
                Price = 50,
                Image = 'mc_nuggets_happy_meal.png',
                CookReward = 5
            },
            {
                Item = 'spicy_chicken_sandwich_combo',
                Label = 'Spicy Chicken Sandwich Combo',
                Price = 50,
                Image = 'spicy_chicken_sandwich_combo.png',
                CookReward = 5
            },
            {
                Item = 'world_famous_fries',
                Label = 'World Famous Fries',
                Price = 50,
                Image = 'world_famous_fries.png',
                CookReward = 5
            }
        }
    },
    ['drinks'] = {
        Label = 'Drinks',
        Items = {
            {
                Item = 'hot_fudge_sundae',
                Label = 'Hot Fudge Sundae',
                Price = 30,
                Image = 'hot_fudge_sundae.png',
                CookReward = 3
            },
            {
                Item = 'mc_cappuccino',
                Label = 'Cappuccino',
                Price = 30,
                Image = 'mc_cappuccino.png',
                CookReward = 3
            },
            {
                Item = 'mc_diet_coke',
                Label = 'Diet Coke',
                Price = 30,
                Image = 'mc_diet_coke.png',
                CookReward = 3
            },
            {
                Item = 'mc_dr_pepper',
                Label = 'Dr Pepper',
                Price = 30,
                Image = 'mc_dr_pepper.png',
                CookReward = 3
            },
            {
                Item = 'mc_fanta_orange',
                Label = 'Fanta Orange',
                Price = 30,
                Image = 'mc_fanta_orange.png',
                CookReward = 3
            },
            {
                Item = 'mc_flurry_candies',
                Label = 'McFlurry Candies',
                Price = 30,
                Image = 'mc_flurry_candies.png',
                CookReward = 3
            },
            {
                Item = 'mc_flurry_cookies',
                Label = 'McFlurry Cookies',
                Price = 30,
                Image = 'mc_flurry_cookies.png',
                CookReward = 3
            },
            {
                Item = 'mc_fruit_punch',
                Label = 'Fruit Punch',
                Price = 30,
                Image = 'mc_fruit_punch.png',
                CookReward = 3
            },
            {
                Item = 'mc_hot_chocolate',
                Label = 'Hot Chocolate',
                Price = 30,
                Image = 'mc_hot_chocolate.png',
                CookReward = 3
            },
            {
                Item = 'mc_iced_coffee',
                Label = 'Iced Coffee',
                Price = 30,
                Image = 'mc_iced_coffee.png',
                CookReward = 3
            },
            {
                Item = 'mc_iced_tea',
                Label = 'Iced Tea',
                Price = 30,
                Image = 'mc_iced_tea.png',
                CookReward = 3
            },
            {
                Item = 'mc_sprite',
                Label = 'Sprite',
                Price = 30,
                Image = 'mc_sprite.png',
                CookReward = 3
            },
            {
                Item = 'mc_strawberry_shake',
                Label = 'Strawberry Shake',
                Price = 30,
                Image = 'mc_strawberry_shake.png',
                CookReward = 3
            },
            {
                Item = 'mc_vanilla_shake',
                Label = 'Vanilla Shake',
                Price = 30,
                Image = 'mc_vanilla_shake.png',
                CookReward = 3
            },
            {
                Item = 'orange_juice',
                Label = 'Orange Juice',
                Price = 30,
                Image = 'orange_juice.png',
                CookReward = 3
            },
            {
                Item = 'strawberry_watermelon_slushie',
                Label = 'Strawberry Watermelon Slushie',
                Price = 30,
                Image = 'strawberry_watermelon_slushie.png',
                CookReward = 3
            },
            {
                Item = 'tropical_mango_slushie',
                Label = 'Tropical Mango Slushie',
                Price = 30,
                Image = 'tropical_mango_slushie.png',
                CookReward = 3
            }
        }
    }
}



-----Dogs

Config.Dogs = { -- locations de spawn dos gatos
    ['1'] = {['coords'] = vector4(82.5985, 286.0003, 110.2074, 187.3092),['sitting'] = true},
    ['2'] = {['coords'] = vector4(77.1809, 273.9767, 110.2102, 215.5360),['sitting'] = true},
    ['3'] = {['coords'] = vector4(78.2513, 274.3062, 110.2102, 257.0926),['sitting'] = true}
}



Config.DogBar = "HAVING FUN WITH Dog..."
Config.DogNotify = "Feeling Great 😊"


----Blip

Config.Sprite = 838

Config.Scale = 1.0

Config.color = 46

Config.Name = "Up And Atoms"