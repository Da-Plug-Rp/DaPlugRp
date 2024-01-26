Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = "self-service" -- or "owned", "self-service"
Config.Stock = 100

Config.pogressBar = 10000
Config.PogTitle = "You Are Making Food"
Config.Purchase = "You Bought Food"

Config.Job = 'Hornys'

Config.Bank = false -- false = cash

Config.Buy = {
    Position = vector3(1249.4211, -359.8212, 69.0821),
    Text = '~o~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(1251.3561, -357.6724, 69.0821),
    Text = '~o~[E]~s~ Manage'
}

Config.Cook = {
    Position = vector3(1253.4376, -352.5642, 69.0432),
    Text = '~o~[E]~s~ Cooking'
}

Config.BossMenu = {
    Position = vector3(1238.5422, -348.1831, 68.5863),
    Text = '~o~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['mix'] = {
        Label = 'Mix',
        Items = {
            {
                Item = 'brown_scramble_bowl',
                Label = 'Brown Scramble Bowl',
                Price = 50,
                Image = 'brown_scramble_bowl.png',
                CookReward = 5
            },
            {
                Item = 'brown_scramble_burrito',
                Label = 'Brown Scramble Burrito',
                Price = 50,
                Image = 'brown_scramble_burrito.png',
                CookReward = 5
            },
            {
                Item = 'buttered_biscuit',
                Label = 'Buttered Biscuit',
                Price = 50,
                Image = 'buttered_biscuit.png',
                CookReward = 5
            },
            {
                Item = 'chick_fil_a_nuggets',
                Label = 'Chick-fil-A Nuggets',
                Price = 50,
                Image = 'chick_fil_a_nuggets.png',
                CookReward = 5
            },
            {
                Item = 'chick_n_minis',
                Label = 'Chick-n-Minis',
                Price = 50,
                Image = 'chick_n_minis.png',
                CookReward = 5
            },
            {
                Item = 'chick_n_strips',
                Label = 'Chick-n-Strips',
                Price = 50,
                Image = 'chick_n_strips.png',
                CookReward = 5
            },
            {
                Item = 'chicken_noodle_soup',
                Label = 'Chicken Noodle Soup',
                Price = 50,
                Image = 'chicken_noodle_soup.png',
                CookReward = 5
            },
            {
                Item = 'chocolate_chunk_cookie',
                Label = 'Chocolate Chunk Cookie',
                Price = 50,
                Image = 'chocolate_chunk_cookie.png',
                CookReward = 5
            },
            {
                Item = 'chocolate_fudge_brownie',
                Label = 'Chocolate Fudge Brownie',
                Price = 50,
                Image = 'chocolate_fudge_brownie.png',
                CookReward = 5
            },
            {
                Item = 'cobb_salad',
                Label = 'Cobb Salad',
                Price = 50,
                Image = 'cobb_salad.png',
                CookReward = 5
            },
            {
                Item = 'cool_wrap',
                Label = 'Cool Wrap',
                Price = 50,
                Image = 'cool_wrap.png',
                CookReward = 5
            },
            {
                Item = 'english_muffin',
                Label = 'English Muffin',
                Price = 50,
                Image = 'english_muffin.png',
                CookReward = 5
            },
            {
                Item = 'fruit_cup',
                Label = 'Fruit Cup',
                Price = 50,
                Image = 'fruit_cup.png',
                CookReward = 5
            },
            {
                Item = 'greek_yogurt_parfait',
                Label = 'Greek Yogurt Parfait',
                Price = 50,
                Image = 'greek_yogurt_parfait.png',
                CookReward = 5
            },
            {
                Item = 'grilled_nuggets',
                Label = 'Grilled Nuggets',
                Price = 50,
                Image = 'grilled_nuggets.png',
                CookReward = 5
            },
            {
                Item = 'hash_browns',
                Label = 'Hash Browns',
                Price = 50,
                Image = 'hash_browns.png',
                CookReward = 5
            },
            {
                Item = 'icedream_cone',
                Label = 'Icedream Cone',
                Price = 50,
                Image = 'icedream_cone.png',
                CookReward = 5
            },
            {
                Item = 'icedream_cup',
                Label = 'Icedream Cup',
                Price = 50,
                Image = 'icedream_cup.png',
                CookReward = 5
            },
            {
                Item = 'kale_crunch_side',
                Label = 'Kale Crunch Side',
                Price = 50,
                Image = 'kale_crunch_side.png',
                CookReward = 5
            },
            {
                Item = 'mac_cheese',
                Label = 'Mac & Cheese',
                Price = 50,
                Image = 'mac_cheese.png',
                CookReward = 5
            },
            {
                Item = 'market_salad',
                Label = 'Market Salad',
                Price = 50,
                Image = 'market_salad.png',
                CookReward = 5
            },
            {
                Item = 'side_salad',
                Label = 'Side Salad',
                Price = 50,
                Image = 'side_salad.png',
                CookReward = 5
            },
            {
                Item = 'spicy_southwest_salad',
                Label = 'Spicy Southwest Salad',
                Price = 50,
                Image = 'spicy_southwest_salad.png',
                CookReward = 5
            },
            {
                Item = 'waffle_potato_chips',
                Label = 'Waffle Potato Chips',
                Price = 50,
                Image = 'waffle_potato_chips.png',
                CookReward = 5
            },
            {
                Item = 'waffle_potato_fries',
                Label = 'Waffle Potato Fries',
                Price = 50,
                Image = 'waffle_potato_fries.png',
                CookReward = 5
            }
        }
    },
    ['burger'] = {
        Label = 'Burger',
        Items = {
            {
                Item = 'chicken_biscuit',
                Label = 'Chicken Biscuit',
                Price = 50,
                Image = 'chicken_biscuit.png',
                CookReward = 5
            },
            {
                Item = 'egg_white_grill',
                Label = 'Egg White Grill ',
                Price = 50,
                Image = 'egg_white_grill.png',
                CookReward = 5
            },
            {
                Item = 'chicken_egg_cheese',
                Label = 'Chicken, Egg & Cheese Biscuit ',
                Price = 50,
                Image = 'chicken_egg_cheese.png',
                CookReward = 5
            },
            {
                Item = 'sausage_egg_cheese',
                Label = 'Sausage, Egg & Cheese Biscuit ',
                Price = 50,
                Image = 'sausage_egg_cheese.png',
                CookReward = 5
            },
            {
                Item = 'egg_cheese_muffin',
                Label = 'Egg & Cheese Muffin ',
                Price = 50,
                Image = 'egg_cheese_muffin.png',
                CookReward = 5
            },
            {
                Item = 'chicken_sandwich',
                Label = 'Chicken Sandwich ',
                Price = 50,
                Image = 'chicken_sandwich.png',
                CookReward = 5
            },
            {
                Item = 'deluxe_sandwich',
                Label = 'Deluxe Sandwich ',
                Price = 50,
                Image = 'deluxe_sandwich.png',
                CookReward = 5
            },
            {
                Item = 'chicken_club_sandwich',
                Label = 'Chicken Club Sandwich ',
                Price = 50,
                Image = 'chicken_club_sandwich.png',
                CookReward = 5
            }
        }
    },
    ['drinks'] = {
        Label = 'Drinks',
        Items = {
            {
                Item = 'apple_juice',
                Label = 'Honest Kids Apple Juice',
                Price = 30,
                Image = 'apple_juice.png',
                CookReward = 3
            },
            {
                Item = 'apple_sauce',
                Label = 'Apple Sauce',
                Price = 30,
                Image = 'apple_sauce.png',
                CookReward = 3
            },
            {
                Item = 'brewed_iced_tea',
                Label = 'Brewed Iced Tea',
                Price = 30,
                Image = 'brewed_iced_tea.png',
                CookReward = 3
            },
            {
                Item = 'chick_fil_a_lemonade',
                Label = 'Chick-fil-A Lemonade',
                Price = 30,
                Image = 'chick_fil_a_lemonade.png',
                CookReward = 3
            },
            {
                Item = 'chocolate_milk',
                Label = 'Chocolate Milk',
                Price = 30,
                Image = 'chocolate_milk.png',
                CookReward = 3
            },
            {
                Item = 'chocolate_milkshake',
                Label = 'Chocolate Milkshake',
                Price = 30,
                Image = 'chocolate_milkshake.png',
                CookReward = 3
            },
            {
                Item = 'coffee',
                Label = 'Coffee',
                Price = 30,
                Image = 'coffee.png',
                CookReward = 3
            },
            {
                Item = 'cookies_cream_milkshake',
                Label = 'Cookies & Cream Milkshake',
                Price = 30,
                Image = 'cookies_cream_milkshake.png',
                CookReward = 3
            },
            {
                Item = 'frosted_coffee',
                Label = 'Frosted Coffee',
                Price = 30,
                Image = 'frosted_coffee.png',
                CookReward = 3
            },
            {
                Item = 'frosted_lemonade',
                Label = 'Frosted Lemonade',
                Price = 30,
                Image = 'frosted_lemonade.png',
                CookReward = 3
            },
            {
                Item = 'peach_milkshake',
                Label = 'Peach Milkshake',
                Price = 30,
                Image = 'peach_milkshake.png',
                CookReward = 3
            },
            {
                Item = 'simply_orange',
                Label = 'Simply Orange',
                Price = 30,
                Image = 'simply_orange.png',
                CookReward = 3
            },
            {
                Item = 'strawberry_milkshake',
                Label = 'Strawberry Milkshake',
                Price = 30,
                Image = 'strawberry_milkshake.png',
                CookReward = 3
            },
            {
                Item = 'sweet_tea',
                Label = 'Sweet Tea',
                Price = 30,
                Image = 'sweet_tea.png',
                CookReward = 3
            },
            {
                Item = 'vanilla_milkshake',
                Label = 'Vanilla Milkshake',
                Price = 30,
                Image = 'vanilla_milkshake.png',
                CookReward = 3
            }
        }
    }
}



-----Dogs

Config.Dogs = { -- locations de spawn dos gatos
    ['1'] = {['coords'] = vector4(-1052.3524, -1373.9452, 5.5229, 101.0256),['sitting'] = false},
    ['2'] = {['coords'] = vector4(-1040.6636, -1361.7040, 5.5229, 52.4005),['sitting'] = false},
    ['3'] = {['coords'] = vector4(-1042.2568, -1361.1566, 5.5229, 306.0707),['sitting'] = false}
}



Config.DogBar = "HAVING FUN WITH DOG..."
Config.DogNotify = "Feeling Great 😊"


----Blip

Config.Sprite = 80

Config.Scale = 1.0

Config.color = 1

Config.Name = "Horny's"