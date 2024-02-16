

--██████╗░██╗░░██╗███████╗  ██████╗░░█████╗░██████╗░██╗░░░██╗██████╗░░█████╗░░██████╗░
--██╔══██╗╚██╗██╔╝██╔════╝  ██╔══██╗██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗██╔══██╗██╔════╝░
--██████╦╝░╚███╔╝░█████╗░░  ██████╦╝██║░░██║██║░░██║░╚████╔╝░██████╦╝███████║██║░░██╗░
--██╔══██╗░██╔██╗░██╔══╝░░  ██╔══██╗██║░░██║██║░░██║░░╚██╔╝░░██╔══██╗██╔══██║██║░░╚██╗
--██████╦╝██╔╝╚██╗███████╗  ██████╦╝╚█████╔╝██████╔╝░░░██║░░░██████╦╝██║░░██║╚██████╔╝
--╚═════╝░╚═╝░░╚═╝╚══════╝  ╚═════╝░░╚════╝░╚═════╝░░░░╚═╝░░░╚═════╝░╚═╝░░╚═╝░╚═════╝░


Config = {}



--▀█▀ █ █▀▄▀█ █▀▀ █▀█ █▀
--░█░ █ █░▀░█ ██▄ █▀▄ ▄█

Config.BurialTimer = 30000 --- 30 secs
Config.BodybagTimer = 10000 --- 10 secs
Config.FuneralTime = 30000 -- 30 secs

--█▀█ █▀█ █░░ █ █▀▀ █▀▀   ▄▀█ █░░ █▀▀ █▀█ ▀█▀
--█▀▀ █▄█ █▄▄ █ █▄▄ ██▄   █▀█ █▄▄ ██▄ █▀▄ ░█░

Config.PoliceAlert = true

--█▀▄ █▀▀ █░░ █▀▀ ▀█▀ █▀▀   █▀█ █▀█   █▄▀ █ █▀▀ █▄▀
--█▄▀ ██▄ █▄▄ ██▄ ░█░ ██▄   █▄█ █▀▄   █░█ █ █▄▄ █░█


Config.DeleteFromDatabase = true

--█░░ █▀█ █▀▀ ▄▀█ ▀█▀ █ █▀█ █▄░█ █▀
--█▄▄ █▄█ █▄▄ █▀█ ░█░ █ █▄█ █░▀█ ▄█

Config.BurialLocation = vector3(-1763.4736, -263.5303, 48.1091)                
Config.FuneralLocation = vector4(-1766.2108, -260.1263, 48.5051, 152.0686)
Config.FuneralHeading = 152.0686


--█▄▄ █▀█ █▀▄ █▄█ █▄▄ ▄▀█ █▀▀   █ █▄░█ █▀▀ █▀█
--█▄█ █▄█ █▄▀ ░█░ █▄█ █▀█ █▄█   █ █░▀█ █▀░ █▄█

-- Bag Model
Config.bag_model = "xm_prop_body_bag"
Config.bag_hash = `xm_prop_body_bag`


--█▄░█ █▀▀ █░█░█ █▀   ▄▀█ █░░ █▀▀ █▀█ ▀█▀
--█░▀█ ██▄ ▀▄▀▄▀ ▄█   █▀█ █▄▄ ██▄ █▀▄ ░█░

Config.ShowNews = {
    Title = "Funeral Announcment",
    Msg = "Unfortunatly We have lost another soul",
    Footer = "Rest in peace",
    Time = 8 -- time for how long the server alert stays on all players screen 
}

--█▀▄ █ █▀ █▀▀ █▀█ █▀█ █▀▄   █░█░█ █▀▀ █▄▄ █░█ █▀█ █▀█ █▄▀
--█▄▀ █ ▄█ █▄▄ █▄█ █▀▄ █▄▀   ▀▄▀▄▀ ██▄ █▄█ █▀█ █▄█ █▄█ █░█


Config.DiscordLogs = {
    Webhooks = {
        default = 'https://discord.com/api/webhooks/1207860932202725427/vusXCpXrYI9LOFfmSouWPvl0AJMbJaqogHsX7qTnynyFENF-oJzNI1mIoglpGNbbA1Oh'
    },

    Colors = { -- https://www.spycolor.com/
        default = 14423100,
        blue = 255,
        red = 16711680,
        green = 65280,
        white = 16777215,
        black = 0,
        orange = 16744192,
        yellow = 16776960,
        pink = 16761035,
        lightgreen = 65309
    }
}