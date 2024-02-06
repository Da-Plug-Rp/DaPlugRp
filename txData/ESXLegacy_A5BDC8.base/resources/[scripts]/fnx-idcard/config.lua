Config = {}

Config.Core = 'QB' -- 'ESX' or 'QB'
Config.meta = false
Config.Inventory = 'qb' -- 'ox' or 'qs' or 'qb' ox == ox_invnentory, qs == qs-inventory , qb == qb-inventory

Config.UseEsxMenuDefault = false --only esx, if false the used menu is ox_lib 

Config.DriverLicenseTrigger = 'esx_dmvschool:addLicense' ---ONLY ESX
Config.webhooks = 'https://discord.com/api/webhooks/1111200973306740757/dNZJMbIEuvLHCJhR7PXFz0N5ewSjvkjV8bVqyIdJ3R0jn0WdnPG-M2HSWFrmAiApF5BD' -- IMPORTANT SET YOUR WEBHOOK HERE, the script will not work without a webhook! Create a webhook guide: https://www.youtube.com/watch?v=fKksxz2Gdnc&t
Config.align = 'top-right'
Config.MarkerCoords = vec3(-260.123077, -965.248352, 31.217529) -- if you want more points create it by yourself according to the documentation: https://peppesess.gitbook.io/fenix-development-documentation/resources/fnx-idcard
Config.PayInCash = true
Config.IdCardPrice = 150
Config.CustomNotify = false --se custom notifiy in core.lua
Config.ox_lib_Notify  = true

Config.ColorTextUi = '#3F51B5'

Config.Illegal={
    allow = true, --if enable blip create automatically
    item = 'cryptostick', --item to excange to ped is item dirt_money cryptostick
    amount = 1 , 
    minHeight = 60,
    maxHeight = 250,
}

Config.Command = {
    weapon ={
        allow = true,
        name = 'weaponmenu',
        qtarget = {
            allow = false, -- if you want use Qtarget for WeaponMenu, set true
            timer = 15 --in seconds timer to select player 
        }
    },
    drive = {
        allow = true,
        name = 'drive',
        qtarget = {
            allow = false, -- if you want use Qtarget for DriveMenu, set true
            timer = 15 --in seconds timer to select player 
        }
    },
    documentPlus = {
        allow = true,
        name = 'documentPlus',
    },
    illegal = {
        allow = true,
        name = 'illegal',
        cardallow = {
            idcard = true,
            drive = true,
            weapon = false,
        },
        npc = {
            allow = true ,
            startblip = 'stopillegalcard', -- disable npc marker
            stopblip = 'illegalcard', -- enable npc marker     
            TimingDialog = 3000,
            dialogText = 'black',
            posNpcDialog = 'top',
            posPlyDialog = 'left-center',
            dialogColor = '#FF5252',
            MarkerIllegalNpc = vec3(260.1758, 2583.125, 44.81543),
            pedIllegalNpcPos = vec3(266.16, 2587.5, 44.84),
            plyIllegalNpcPos = vec3(260.26, 2583.23, 44.81), -- COORDS PLAYER
            headingPly = 257.26, -- HEADING PLAYER
            headingNpc = 145.55, -- HEADING NPC
            cordCameraPly = vec3(261.69, 2579.26, 47.0), -- COORD CAMERA
            cameraHeading = vec4(-25.0, 0.0, 320.88, 0),  -- HEADING CAMERA (cam, vertial inclination, camera rotation, camera height)
            npcHash = 599294057,
            pedPosToSpawn = vec3(266.16, 2587.5, 44.84),
            movmentPed = vec3(264.1978, 2584.457, 44.83228),
            movmentPly = vec3(262.7868, 2583.389, 44.9165),
            dictPly = "amb@world_human_cop_idles@male@idle_b",
            animPly = "idle_d",
            dictPed = "mini@strip_club@idles@bouncer@base",
            animPed = "base",
            pedBackToCoords = vec3(263.16, 2592.13, 44.93)

        }
    }
}

Config.BaseNameDoc ={---- ITEM NAME ------ ---FOR QUASAR RENEME WEAPON ITEM
    documents ='documents',
    drive = 'drive',
    weapon = 'weapons', -- use 'weapons' if you have Quasar inventory
}

Config.DocumentPlus = {
    documents = {
        boat = {
            illegalAllowed = true,
            label = 'Boat',
            name = 'Boat License',
            bg_front = "./assets/image/img3.png",
            bg_back = "./assets/image/img3.png",
        },
        plane = {
            illegalAllowed = true,
            label = 'Plane',
            name = 'Plane License',
            bg_front = "./assets/image/img3.png",
            bg_back = "./assets/image/img1.png",
        }
    }
}



Config.Lang = {
    ['document-of'] = ' of ',
    ['helpnotification'] = 'Press [E] to take photo',
    ['npcnotification'] = 'Press [E] knock on the door ',
    ['givedrive']= 'give drive license',
    ['givefirearm']= 'give firearm license',
    ['givedoc']= 'give document',
    ['retiredoc']= 'retire document',
    ['retirefirearm']= 'retire firearm license',
    ['look']= 'You are looking at the document',
    ['show']= 'You are showing the document',
    ['documentsgive']= 'You passed the documents',
    ['documentsreceived']= 'You have received the documents',
    ['noidcard']= 'The player did not make the identity document',
    ['emptydocument'] = 'This document is empty',
    ['removedphoto'] = 'your photo has been taken away',
    ['receivedidcard'] = 'You have received your ID card',
    ['checkFoto'] = 'Check your photo, don\'t tick the checkbox if you want to redo the photo',
    ['confirm'] = 'Confirm',
    ['no_money_cash'] = "You do not have enough money on you",
    ['no_money_bank'] = "You do not have enough money in your bank account", 
    ['Menu'] = "License Menu",
    ['weaponMenu'] = "License Weapon Menu",
    ['driveMenu'] = "License Drive Menu",
    ['useQtarget'] = "Use target for select nearby player",
    ['illegalmenu'] = "Notes for abdul",
    ['selectdocuments'] = "select the type of document to be falsified",
    ['documents'] = "Id Card",
    ['drive'] = "Drive License",
    ['weapon'] = "Weapon License",
    ['man'] = "Man",
    ['woman'] = "Woman",
    ['name'] = "Name",
    ['surname'] = "Surname",
    ['height'] = "Height",
    ['dob'] = "date of birth mm/gg/yyyy",
    ['sex'] = "Sex",
    ['drivelicense'] = "Drive",
    ['drive_bike'] = "Drive Bike",
    ['drive_truck'] = "Drive Truck",
    ['no_item'] = "You do not have enough item on you",
    ['dialog_1'] = "Abdul: Hey Ayo, what you doing here ?",
    ['dialog_2'] = "You: Hey bro, i'm going to do a question that can looks strange to you.' ",
    ['dialog_3'] = "Abdul: First don't call me bro! Second, what you need ?",
    ['dialog_4'] = "You: Ok ok calm down, someone says that you create Documents",
    ['dialog_5'] = "Abdul: Yes, but you're sailing in deep water, are you completely sure of this choice?",
    ['dialog_6'] = "You: I know and i'm sure of my choice",
    ['dialog_7'] = "Abdul: Alright, give me some hours, and especially you'll have to give me some money!",
}