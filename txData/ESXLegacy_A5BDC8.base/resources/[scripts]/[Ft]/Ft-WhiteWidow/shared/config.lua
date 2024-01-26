Config = { }

Config.SQLWrapper = 'oxmysql' -- oxmysql / mysql-async / ghmattimysql

Config.active = false -- or "owned", "self-service"
Config.Stock = 50

Config.pogressBar = 5000
Config.PogTitle = "You Are Making Item"
Config.Purchase = "You Bought"

Config.Job = 'whitewidow'

Config.Bank = true -- false = cash

Config.Buy = {
    Position = vector3(189.1033, -242.5748, 54.070),
    Text = '~o~[E]~s~ Shop'
}

Config.Manage = {
    Position = vector3(185.9368, -242.2989, 54.0705),
    Text = '~o~[E]~s~ Manage'
}

Config.Make = {
    Position = vector3(167.0320, -233.3371, 50.0553),
    Text = '~o~[E]~s~ Make Item'
}

Config.BossMenu = {
    Position = vector3(182.6729, -251.5344, 54.0705),
    Text = '~o~[E]~s~ Boss Menu'
}


Config.Categories = {
    ['packet'] = {
        Label = 'Packet',
        Items = {
            {
                Item = 'gelatti',
                Label = 'Gelatti',
                Price = 50,
                Image = 'gelatti.png',
                CookReward = 5
            },
            {
                Item = 'gary_payton',
                Label = 'Gary Payton',
                Price = 50,
                Image = 'gary_payton.png',
                CookReward = 5
            },
            {
                Item = 'cereal_milk',
                Label = 'Cereal Milk',
                Price = 50,
                Image = 'cereal_milk.png',
                CookReward = 5
            },
            {
                Item = 'cheetah_piss',
                Label = 'Cheetah Piss',
                Price = 50,
                Image = 'cheetah_piss.png',
                CookReward = 5
            },
            {
                Item = 'snow_man',
                Label = 'Snow Man',
                Price = 50,
                Image = 'snow_man.png',
                CookReward = 5
            },
            {
                Item = 'georgia_pie',
                Label = 'Georgia Pie',
                Price = 50,
                Image = 'georgia_pie.png',
                CookReward = 5
            },
            {
                Item = 'jefe',
                Label = 'Jefe',
                Price = 50,
                Image = 'jefe.png',
                CookReward = 5
            },
            {
                Item = 'cake_mix',
                Label = 'Cake Mix',
                Price = 50,
                Image = 'cake_mix.png',
                CookReward = 5
            },
            {
                Item = 'white_runtz',
                Label = 'White Runtz',
                Price = 50,
                Image = 'white_runtz.png',
                CookReward = 5
            },
            {
                Item = 'whitecherry_gelato',
                Label = 'Whitecherry Gelato',
                Price = 50,
                Image = 'whitecherry_gelato.png',
                CookReward = 5
            },
            {
                Item = 'blueberry_cruffin',
                Label = 'Blueberry Cruffin',
                Price = 50,
                Image = 'blueberry_cruffin.png',
                CookReward = 5
            },
            {
                Item = 'fine_china',
                Label = 'Fine China',
                Price = 50,
                Image = 'fine_china.png',
                CookReward = 5
            },
            {
                Item = 'pink_sandy',
                Label = 'Pink Sandy',
                Price = 50,
                Image = 'pink_sandy.png',
                CookReward = 5
            },
            {
                Item = 'zushi',
                Label = 'Zushi',
                Price = 50,
                Image = 'zushi.png',
                CookReward = 5
            },
            {
                Item = 'apple_gelato',
                Label = 'Apple Gelato',
                Price = 50,
                Image = 'apple_gelato.png',
                CookReward = 5
            },
            {
                Item = 'biscotti',
                Label = 'Biscotti',
                Price = 50,
                Image = 'biscotti.png',
                CookReward = 5
            },
            {
                Item = 'collins_ave',
                Label = 'Collins AVE',
                Price = 50,
                Image = 'collins_ave.png',
                CookReward = 5
            },
            {
                Item = 'marathon',
                Label = 'Marathon',
                Price = 50,
                Image = 'marathon.png',
                CookReward = 5
            },
            {
                Item = 'oreoz',
                Label = 'Oreoz',
                Price = 50,
                Image = 'oreoz.png',
                CookReward = 5
            },
            {
                Item = 'pirckly_pear',
                Label = 'Pirckly Pear',
                Price = 50,
                Image = 'pirckly_pear.png',
                CookReward = 5
            },
            {
                Item = 'runtz_og',
                Label = 'Runtz OG',
                Price = 50,
                Image = 'runtz_og.png',
                CookReward = 5
            },
            {
                Item = 'blue_tomyz',
                Label = 'Blue Tomyz',
                Price = 50,
                Image = 'blue_tomyz.png',
                CookReward = 5
            },
            {
                Item = 'ether',
                Label = 'Ether',
                Price = 50,
                Image = 'ether.png',
                CookReward = 5
            },
            {
                Item = 'froties',
                Label = 'Froties',
                Price = 50,
                Image = 'froties.png',
                CookReward = 5
            },
            {
                Item = 'gmo_cookies',
                Label = 'GMO cookies',
                Price = 50,
                Image = 'gmo_cookies.png',
                CookReward = 5
            },
            {
                Item = 'ice_cream_cake_pack',
                Label = 'Ice Cream Cake Pack',
                Price = 50,
                Image = 'ice_cream_cake_pack.png',
                CookReward = 5
            },
            {
                Item = 'khalifa_kush',
                Label = 'Khalifa Kush',
                Price = 50,
                Image = 'khalifa_kush.png',
                CookReward = 5
            },
            {
                Item = 'la_confidential',
                Label = 'LA Confidential',
                Price = 50,
                Image = 'la_confidential.png',
                CookReward = 5
            },
            {
                Item = 'marshmallow_og',
                Label = 'Marshmallow OG',
                Price = 50,
                Image = 'marshmallow_og.png',
                CookReward = 5
            },
            {
                Item = 'moon_rock',
                Label = 'Moon Rock',
                Price = 50,
                Image = 'moon_rock.png',
                CookReward = 5
            },
            {
                Item = 'sour_diesel',
                Label = 'Sour Diesel',
                Price = 50,
                Image = 'sour_diesel.png',
                CookReward = 5
            },
            {
                Item = 'tahoe_og',
                Label = 'Tahoe OG',
                Price = 50,
                Image = 'tahoe_og.png',
                CookReward = 5
            }
        }
    },
    ['flavors'] = {
        Label = 'Flavors',
        Items = {
            {
                Item = 'blueberry_jam_cookie',
                Label = 'Blueberry Jam Cookie',
                Price = 50,
                Image = 'blueberry_jam_cookie.png',
                CookReward = 5
            },
            {
                Item = 'butter_cookie',
                Label = 'Butter Cookie',
                Price = 50,
                Image = 'butter_cookie.png',
                CookReward = 5
            },
            {
                Item = 'cookie_craze',
                Label = 'Cookie Craze',
                Price = 50,
                Image = 'cookie_craze.png',
                CookReward = 5
            },
            {
                Item = 'get_figgy',
                Label = 'Get Figgy',
                Price = 50,
                Image = 'get_figgy.png',
                CookReward = 5
            },
            {
                Item = 'key_lime_cookie',
                Label = 'Key Lime Cookie',
                Price = 50,
                Image = 'key_lime_cookie.png',
                CookReward = 5
            },
            {
                Item = 'marshmallow_crisp',
                Label = 'Marshmallow Crisp',
                Price = 50,
                Image = 'marshmallow_crisp.png',
                CookReward = 5
            },
            {
                Item = 'no_99',
                Label = 'NO 99',
                Price = 50,
                Image = 'no_99.png',
                CookReward = 5
            },
            {
                Item = 'paris_fog',
                Label = 'Paris Fog',
                Price = 50,
                Image = 'paris_fog.png',
                CookReward = 5
            },
            {
                Item = 'pogo',
                Label = 'Pogo',
                Price = 50,
                Image = 'pogo.png',
                CookReward = 5
            },
            {
                Item = 'pumpkin_cookie',
                Label = 'Pumpkin Cookie',
                Price = 50,
                Image = 'pumpkin_cookie.png',
                CookReward = 5
            },
            {
                Item = 'shamrock_cookie',
                Label = 'Shamrock Cookie',
                Price = 50,
                Image = 'shamrock_cookie.png',
                CookReward = 5
            },
            {
                Item = 'strawberry_jam_cookie',
                Label = 'Strawberry Jam Cookie',
                Price = 50,
                Image = 'strawberry_jam_cookie.png',
                CookReward = 5
            }
        }
    },
    ['extra'] = {
        Label = 'Extra',
        Items = {
            {
                Item = 'empty_vape',
                Label = 'Empty Vape',
                Price = 50,
                Image = 'empty_vape.png',
                CookReward = 5
            },
            {
                Item = 'empty_joint_pack',
                Label = 'Empty Joint Pack',
                Price = 50,
                Image = 'empty_joint_pack.png',
                CookReward = 5
            },
            {
                Item = 'lighter',
                Label = 'Lighter',
                Price = 50,
                Image = 'lighter.png',
                CookReward = 5
            },
            {
                Item = 'cutter',
                Label = 'Cutter',
                Price = 50,
                Image = 'cutter.png',
                CookReward = 5
            }
        }
    }
}



----Bong


Config.Bong = {
    [1] = vector3(199.4201, -247.0046, 54.070),
    [2] = vector3(188.2616, -252.8651, 54.070),
    [3] = vector3(186.1669, -258.3779, 54.070),
    [4] = vector3(183.7176, -264.8612, 54.070),
    [5] = vector3(191.9965, -267.6905, 54.070),
    [6] = vector3(193.6648, -263.0647, 54.070),
    [7] = vector3(195.7106, -257.5943, 54.070),
    [8] = vector3(197.3129, -252.8375, 54.070),
}



----Blip

Config.Sprite = 469

Config.Scale = 1.2

Config.color = 25

Config.Name = "White Widow"

