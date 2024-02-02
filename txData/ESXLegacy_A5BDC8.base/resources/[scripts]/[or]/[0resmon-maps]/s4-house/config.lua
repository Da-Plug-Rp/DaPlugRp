Config = {}

Config.Support = "discord.gg/0resmon"

Config.OpenKey = 38

Config.RealEstateJob = true -- RealEstate Job
Config.BossMenuCommand = "realestatemenu"
Config.CreateHouseCommand = "createhouse"
Config.RealeStateJobName = 'realestate'
Config.RealeStateJobGradeName = 'recrue'
Config.RealeStateJobGradeLevel = 2

Config.PhotoWebhook = "https://discord.com/api/webhooks/1130674484299436052/Q4V2rtMU9215BqW0zn1VJlOU6A80XLfJ56tmbY8gwAb8-fVK80dou5t3F3TVoXsr7AYr" -- Discord Webhook

Config.MoneyIsItem = true

Config.DefaultJob = {'unemployed', 0}

Config.SellTax = 10

Config.IHaveMultiChar = false

--- Installing, Docs and more
--- https://0resmons-docs.gitbook.io/0resmon/s4-resources/s4-house/installation
--  if you have multichar script you need to call this script when player is fully loaded
--  TriggerServerEvent('s4-house:server:request') this trigger will need triggered!
--  If you don't know how to do this, come to our discord and open a ticket!

Config.PutOnlyOwnedVehicleInGarage = false

Config.DeleteFromOwnedVehicles = true

Config.LoadIPLHouseOnStart = true

Config.UseMysqlForInterrior = true

Config.AlarmPrice = 1999

Config.IhaveDispacthScript = false

Config.EnableRobbery = true -- made for trial only, not a 100% working feature

Config.LockpickName = "lockpick"

Config.RandomPoliceCall = true

Config.PoliceJobName = "police"

Config.HttpServer = {
      active = false,
      ip = "185.243.182.233",
      port = 8124
}

Config.DispacthFunction = function(coords)
   if Config.IhaveDispacthScript == true then 
       
   else 
      TriggerClientEvent('s4-house:client:police_alert', -1, coords)
   end
end

Config.RealEstateStarterMoney = 1000

Config.WardrobeFunction = function()
   print("wardrobe")
end

Config.Aparts = {
  ["apartment3"] = {
    ApartmentNamee = "apartment3",
    RealEstatePrice = 10000, -- RealEstate Buy Price
    out = vector3(-782.2, 319, 187.9),
    manage = vector3(-785.6, 327.3, 187.3),
    garage = vector3(519.9, -2638.7, -38.69),
    stash = vector3(-796.5, 328.2, 187.3),
    wardrobe = vector3(-797.8, 328.3, 190.7),
    garage_out_heading = 350.6,
    Theme = {
      modern = {interiorId = 227841,  ipl = "apa_v_mp_h_01_c", img = "./interiors/modern.png" },
      moody = {interiorId = 228609, ipl = "apa_v_mp_h_02_c", img = "./interiors/moody.png" },
      vibrant = {interiorId = 229377, ipl = "apa_v_mp_h_03_c", img = "./interiors/vibrant.png" },
      sharp = {interiorId = 230145, ipl = "apa_v_mp_h_04_c", img = "./interiors/sharp.png" },
      monochrome = {interiorId = 230913, ipl = "apa_v_mp_h_05_c", img = "./interiors/monochrome.png" },
      seductive = {interiorId = 231681, ipl = "apa_v_mp_h_06_c", img = "./interiors/seductive.png" },
      regal = {interiorId = 232449, ipl = "apa_v_mp_h_07_c", img = "./interiors/regal.png" },
      aqua = {interiorId = 233217, ipl = "apa_v_mp_h_08_c", img = "./interiors/aqua.png" }
    }, 
    DefaultIPL = "apa_v_mp_h_01_c",
    UsingTheme = true,
    props = {},
    GarageTheme = {
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    }
  },

  ["house_low"] = { 
    ApartmentNamee = "house_low",
    RealEstatePrice = 7000, -- RealEstate Buy Price
    out = vector3(-896.6, -446.8, -22.3),
    manage = vector3(-893.5, -445.6, -22.3),
    garage =  vector3(519.9, -2638.7, -38.69),
    stash = vector3(-892.2, -440.8, -22.3),
    wardrobe = vector3(-894.8, -443.6, -22.3),
    garage_out_heading = 350.6,
    Theme = {},
    DefaultIPL = "qua_adez_k_milo",
    UsingTheme = false,
    props = {
      "esyali", "esyasiz", "kirmizi", "mavi", "mor", "turuncu", "yesil", "bw"
    },
    GarageTheme = {
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    }
  },

  ["house_mid"] = { 
    ApartmentNamee = "house_mid",
    RealEstatePrice = 12000, -- RealEstate Buy Price
    out = vector3(-896.9, -446.7, -16),
    manage = vector3(-894.7, -445.4, -16),
    garage =  vector3(519.9, -2638.7, -38.69),
    stash = vector3(-897.5, -440.9, -16.1),
    wardrobe = vector3(-892.6, -440.1, -16),
    garage_out_heading = 350.6,
    Theme = {},
    DefaultIPL = "qua_adez_o_milo",
    UsingTheme = false,
    props = {
      "esyali", "esyasiz", "kirmizi", "mavi", "mor", "turuncu", "yesil", "bw"
    },
    GarageTheme = {
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    }
  },

  ["house_high"] = { 
    ApartmentNamee = "house_high",
    RealEstatePrice = 15000, -- RealEstate Buy Price
    out = vector3(-630.16, -748.95, -115.42),
    manage = vector3(vector3(-627.38, -746.95, -115.42)),
    garage =  vector3(519.9, -2638.7, -38.69),
    stash = vector3(-631.24, -739.24, -115.42),
    wardrobe = vector3(-629.14, -739.96, -115.42),
    garage_out_heading = 350.6,
    Theme = {},
    DefaultIPL = "qua_adez_b_milo",
    UsingTheme = false,
    props = {
      "esyali", "esyasiz", "kirmizi", "mavi", "mor", "turuncu", "yesil", "bw"
    },
    GarageTheme = {
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    }
  }
}


Config.Houses = { 
  { 
    name = "",
    price = 10000,
    coords = {      
      house_in = vector3(-974.3, 582.2, 102.7),
      house_out = Config.Aparts["house_mid"].out, -- vector3(-782.2, 319, 187.9)
      garage_in = vector3(-986.3, 584.6, 102.4),
      garage_out = Config.Aparts["house_mid"].garage, -- vector3(232.4, -1005.8, -99)
      manage = Config.Aparts["house_mid"].manage, -- vector3(-785.6, 327.3, 187.3)
      stash = Config.Aparts["house_mid"].stash,
      wardrobe = Config.Aparts["house_mid"].wardrobe,
      garage_out_heading = Config.Aparts["house_mid"].garage_out_heading, --  350.6
    },
    owner = "",
    friends = {},
    garage = {},
    stars = 2,
    theme = "kirmizi",
    garageId = 1,
    garage_stock = 12,
    pool_or_garden = true,
    extends = {},
    props = {},
    alarm = false,
    info = Config.Aparts["house_mid"]
  },
  { 
    name = "",
    price = 10000,
    coords = {      
      house_in = vector3(-947.8, 568.4, 101.5),
      house_out = Config.Aparts["house_low"].out, -- vector3(-782.2, 319, 187.9)
      garage_in = vector3(-955.9, 578.5, 101.2),
      garage_out = Config.Aparts["house_low"].garage,
      manage = Config.Aparts["house_low"].manage, -- vector3(-785.6, 327.3, 187.3)
      stash = Config.Aparts["house_low"].stash,
      wardrobe = Config.Aparts["house_low"].wardrobe,
      garage_out_heading = Config.Aparts["house_low"].garage_out_heading, --  350.6
    },
    owner = "",
    friends = {},
    garage = {},
    stars = 3,
    theme = "kirmizi",
    garageId = 1,
    garage_stock = 12,
    pool_or_garden = true,
    extends = {},
    props = {},
    alarm = false,
    info = Config.Aparts["house_low"]
  },
  { 
    name = "",
    price = 10000,
    coords = {      
      house_in = vector3(-958.4, 607.1, 106.3),
      house_out = Config.Aparts["house_high"].out, -- vector3(-782.2, 319, 187.9)
      garage_in = vector3(-945.1, 597.8, 101.0),
      garage_out = Config.Aparts["house_high"].garage,
      manage = Config.Aparts["house_high"].manage, -- vector3(-785.6, 327.3, 187.3)
      stash = Config.Aparts["house_high"].stash,
      wardrobe = Config.Aparts["house_high"].wardrobe,
      garage_out_heading = Config.Aparts["house_high"].garage_out_heading, --  350.6
    },
    owner = "",
    friends = {},
    garage = {},
    stars = 4,
    theme = "kirmizi",
    garageId = 1,
    garage_stock = 12,
    pool_or_garden = false,
    extends = {},
    props = {},
    alarm = false,
    info = Config.Aparts["house_high"]
  },
  { 
    name = "",
    price = 10000,
    coords = {      
      house_in = vector3(-924.3, 563, 99.7),
      house_out = Config.Aparts["apartment3"].out, -- vector3(-782.2, 319, 187.9)
      garage_in = vector3(-934.2, 569.3, 100.1),
      garage_out = Config.Aparts["apartment3"].garage,
      manage = Config.Aparts["apartment3"].manage, -- vector3(-785.6, 327.3, 187.3)
      stash = Config.Aparts["apartment3"].stash,
      wardrobe = Config.Aparts["apartment3"].wardrobe,
      garage_out_heading = Config.Aparts["apartment3"].garage_out_heading, --  350.6
    },
    owner = "",
    friends = {},
    garage = {},
    stars = 4,
    theme = "modern",
    garageId = 1,
    garage_stock = 12,
    pool_or_garden = false,
    extends = {},
    props = {},
    alarm = false,
    info = Config.Aparts["apartment3"]
  },
  { 
    name = "",
    price = 10000,
    coords = {      
      house_in = vector3(-924.3, 566, 99.7),
      house_out = Config.Aparts["apartment3"].out, -- vector3(-782.2, 319, 187.9)
      garage_in = vector3(-934.2, 569.3, 100.1),
      garage_out = Config.Aparts["apartment3"].garage,
      manage = Config.Aparts["apartment3"].manage, -- vector3(-785.6, 327.3, 187.3)
      stash = Config.Aparts["apartment3"].stash,
      wardrobe = Config.Aparts["apartment3"].wardrobe,
      garage_out_heading = Config.Aparts["apartment3"].garage_out_heading, --  350.6
    },
    owner = "",
    friends = {},
    garage = {},
    stars = 4,
    theme = "modern",
    garageId = 1,
    garage_stock = 12,
    pool_or_garden = false,
    extends = {},
    props = {},
    alarm = false,
    info = Config.Aparts["apartment3"]
  }

}

Config.Houses_Template = { 
  name = "House for sale",
  price = 5,
  coords = {      
    house_in = vector3(1,1,1),
    house_out = vector3(1,1,1),
    garage_in = vector3(1,1,1),
    garage_out = vector3(1,1,1),
    stash = vector3(1,1,1)
  },
  owner = "",
  friends = {  },
  garage = {},
  theme = "modern",
  garageId = 1,
  stars = 1,
  garage_stock = 6,
  extends = {},
  props = {},
  alarm = false
}


Config.ItemCategory = {
  ["lounge"] = {
      icon = "fa-solid fa-couch"
  },
  ["kitchen"] = {
      icon = "fa-solid fa-utensils"
  },
  ["bathroom"] = {
      icon = "fa-solid fa-sink"
  },
}

Config.HouseItems = {
     {
      label = "TV",
      prop = 'prop_tv_flat_michael',
      price = 100,
      category = "lounge"
     },
     {
      label = "VCR",
      prop = 'prop_vcr_01',
      price = 100,
      category = "lounge"
     },
     {
      label = "Vacuum",
      prop = 'v_res_vacuum',
      price = 100,
      category = "lounge"
     },
     {
      label = "Fridge",
      prop = 'prop_fridge_01',
      price = 100,
      category = "kitchen"
     },
     {
      label = "Washmach",
      prop = 'v_ret_fh_washmach',
      price = 100,
      category = "kitchen"
     }
}


Config.GaragePos = {
  { coord =  vector3(514.0, -2612.69, -38.69), h = 273.83  },
  { coord =  vector3(514.0, -2616.69, -38.69), h = 273.83  },
  { coord =  vector3(514.0, -2620.69, -38.69), h = 273.83  },
  { coord =  vector3(514.0, -2624.69, -38.69), h = 273.83  },
  { coord =  vector3(514.0, -2628.69, -38.69), h = 273.83  },
  { coord =  vector3(514.0, -2632.69, -38.69), h = 273.83  },

  { coord =  vector3(525.46, -2612.53, -38.69), h = 92.52  },
  { coord =  vector3(525.46, -2616.64, -38.69), h = 92.52  },
  { coord =  vector3(525.46, -2620.64, -38.69), h = 92.52  },
  { coord =  vector3(525.46, -2624.64, -38.69), h = 92.52  },
  { coord =  vector3(525.46, -2628.64, -38.69), h = 92.52  },
  { coord =  vector3(525.46, -2632.64, -38.69), h = 92.52  },
}

Config.StashWeight = 100 

Config.StashFunction = function(id, house)
    local HouseId = 0 
    if Config.RealEstateJob then
      HouseId = house.data.id
    else
      HouseId = house.id
    end
    local maxweight = 64000
    local slot = 100
    exports["codem-inventory"]:OpenStash('HOUSE_'..HouseId, maxweight,  slot)
end 

Config.Lang = {
  setCoords = "Set House and Garage Coords.",
  leave = "Leave the house and re-enter please.",
  manage = "~g~[E] ~w~Manage",
  wardrobe = "~g~[E] ~w~Wardrobe",
  out_garage = "~g~[E] ~w~Out Garage",
  stash = "~o~[E] ~w~Open Stash",
  notauth = 'You are not a real estate agent.',
  enter_garage = "~g~[E] ~w~Enter Garage",
  leave_house = "~o~[E] ~w~Leave House",
  not_your_veh = "This car is not yours!",
  no_garage_slot = "No garage slot!",
  garajdakurtvar = "The garage is full right now, there's a player inside",
  blips = "House blips changed!",
  friend = function(name)
    return "~o~[E] ~w~"..name.." ~g~[Your Friend Property]"
  end,
  your = function(name)
    return "~o~[E] ~w~"..name.." ~g~[Your Property]"
  end,
  sale = function(price, name)
    return "~o~[E] ~g~["..price.."$]  ~w~"..name.." ~g~[Sale]"
  end,
  markar_props = "~w~[E] ~g~Change Location \n ~w~[R] ~o~Replace \n ~w~[x] ~r~Sell  ~g~$",
  helper_text = "Furniture movements\n"..
  "~INPUT_VEH_FLY_PITCH_UD~\n"..
  "~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ ~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~\n"..
  "~INPUT_VEH_FLY_SELECT_TARGET_LEFT~ ~INPUT_VEH_FLY_SELECT_TARGET_RIGHT~\n"..
  "~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~\n"..
  "~INPUT_FRONTEND_RRIGHT~\n",
  house_rob = "~w~[E] ~r~Rob the house",
  house_raid = "~w~[E] ~b~Raid the house",
  success_alarm = "Successfully purchased an alarm system",
  error_alarm = "You don't have enough money in the bank!",
  remove_alarm = "The alarm system has been removed.",
  police_alert = "There's a house robbery going on.",
  alarm_alert = "Someone is trying to rob your house!",
  society_notEnoughMoney = "You don't have enough money in the Society Safe!",
  nolockpick = "You don't have lockpick!",
}

Config.Keys = {
    ["replace"] = 310,
    ["sell"] = 323,
    ["location"] = 38,
    ["lift_up"] = 314,
    ["lift_down"] = 315,
    ["move_forward"] = 111,
    ["move_back"] = 112,
    ["move_left"] = 108,
    ["move_right"] = 109,
    ["rot_left"] = 117,
    ["rot_right"] = 118,
    ["rot_up"] = 316,
    ["rot_down"] = 317,
    ["plus"] = 312,
    ["minus"] = 313
}