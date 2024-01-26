Config, Lang, Noti = {},{},{}

-- $$$$$$\   $$$$$$\  $$\   $$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ $$$$$$$\   $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ 
--$$  __$$\ $$  __$$\ $$$\  $$ |$$  _____|\_$$  _|$$  __$$\ $$ |  $$ |$$  __$$\ $$  __$$\\__$$  __|\_$$  _|$$  __$$\ $$$\  $$ |
--$$ /  \__|$$ /  $$ |$$$$\ $$ |$$ |        $$ |  $$ /  \__|$$ |  $$ |$$ |  $$ |$$ /  $$ |  $$ |     $$ |  $$ /  $$ |$$$$\ $$ |
--$$ |      $$ |  $$ |$$ $$\$$ |$$$$$\      $$ |  $$ |$$$$\ $$ |  $$ |$$$$$$$  |$$$$$$$$ |  $$ |     $$ |  $$ |  $$ |$$ $$\$$ |
--$$ |      $$ |  $$ |$$ \$$$$ |$$  __|     $$ |  $$ |\_$$ |$$ |  $$ |$$  __$$< $$  __$$ |  $$ |     $$ |  $$ |  $$ |$$ \$$$$ |
--$$ |  $$\ $$ |  $$ |$$ |\$$$ |$$ |        $$ |  $$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ |     $$ |  $$ |  $$ |$$ |\$$$ |
--\$$$$$$  | $$$$$$  |$$ | \$$ |$$ |      $$$$$$\ \$$$$$$  |\$$$$$$  |$$ |  $$ |$$ |  $$ |  $$ |   $$$$$$\  $$$$$$  |$$ | \$$ |
 --\______/  \______/ \__|  \__|\__|      \______| \______/  \______/ \__|  \__|\__|  \__|  \__|   \______| \______/ \__|  \__|

--Use "esx" or "qb"
Config.Framework = "esx"
--If you are using one of the most recent versions of ESX, set the script name. Default = "es_extended"
Config.ESXExport = "es_extended"
--Default ESX: "esx:getSharedObject" | Default QB: "qb-core"
Config.Core = "getSharedObject"
-- oxmysql, mysql-async or ghmattisql
Config.Mysql = "oxmysql"
--Text font used for on-screen alerts. Use 0 if your language is Chinese
Config.alertTextFont = 4
--The type of currency you use on the server
Config.currency = "$"
--Activate if you want to use the room key/card as item
Config.useKeyItem = true
--If you want the charges to be made at a specific (real) time on the server
Config.usePayHour = true
--Time of day when rooms will be charged
Config.rentPayHour = 22
--Modify line 53 of the s_functions.lua if you want to activate it
Config.useBillingScript = false
--Enable if you want the user to receive a notification on the phone (modify the function in line 58 in s_functions.lua)
Config.useMobileNotification = false
--Activate if you want users to be able to buy motels with money. Deactivate if you want to manage it manually via Discord or similar.
Config.canBuyMotelWithMoney = true
--Command to make a user the owner of a motel (use: givemotel motelname ID)
Config.ownerCommand = "givemotel"
--Groups that are allowed to use the above command
Config.adminsGroups = {"admin", "superadmin", "god"}
--Camera position while sleeping in bed
Config.sleepCameraCoord = vector3(-378.02, 152.71, 62.12)
--Percentage to be received by the motel owner for customer payments
Config.costspercentage = 0.55
--If you want to use Routing Bucket set to true
Config.useRoutingBucket = true


--$$\        $$$$$$\  $$\   $$\  $$$$$$\  $$\   $$\  $$$$$$\   $$$$$$\  $$$$$$$$\ 
--$$ |      $$  __$$\ $$$\  $$ |$$  __$$\ $$ |  $$ |$$  __$$\ $$  __$$\ $$  _____|
--$$ |      $$ /  $$ |$$$$\ $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |      
--$$ |      $$$$$$$$ |$$ $$\$$ |$$ |$$$$\ $$ |  $$ |$$$$$$$$ |$$ |$$$$\ $$$$$\    
--$$ |      $$  __$$ |$$ \$$$$ |$$ |\_$$ |$$ |  $$ |$$  __$$ |$$ |\_$$ |$$  __|   
--$$ |      $$ |  $$ |$$ |\$$$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |      
--$$$$$$$$\ $$ |  $$ |$$ | \$$ |\$$$$$$  |\$$$$$$  |$$ |  $$ |\$$$$$$  |$$$$$$$$\ 
--\________|\__|  \__|\__|  \__| \______/  \______/ \__|  \__| \______/ \________|


Lang.pressE = "Press ~q~[~w~E~q~]~w~ to enter the motel"
Lang.pressEroom = "~q~[~w~E~q~]~w~ - Open"
Lang.exitRoom = "Press ~q~[~w~E~q~]~w~ to leave the room"
Lang.openCloset = "Press ~q~[~w~E~q~]~w~ to open the closet"
Lang.openDepositBox = "Press ~q~[~w~E~q~]~w~ to open the deposit box"
Lang.washFace = "Press ~q~[~w~E~q~]~w~ to wash your face"
Lang.shower = "Press ~q~[~w~E~q~]~w~ to take a shower"
Lang.lieBed = "Press ~q~[~w~E~q~]~w~ to sleep in bed"
Lang.noMoney = "You do not have enough money"
Lang.noRenter = "This room is not yours"
Lang.haveKey = "You already have a key"
Lang.receivedKey = "You have received the key to room"
Lang.vacatedRoom = "You have vacated the room"
Lang.acquiredMotel = "You have acquired the motel"
Lang.buyMotelTitle = "Do you want to be your own boss?"
Lang.buyMotelDesc = "Buy this motel for"
Lang.buyMotelConfirmTitle = "BUY MOTEL?"
Lang.buyMotelConfirmDesc = "The fixed costs will be 45% of what you earn from the rent of the rooms, charged once a week, the same as the rent of the rooms."
Lang.youHaveToPay = "You have to pay"
Lang.hasAnOwner = "This motel already has an owner"
Lang.select = "SELECT"
Lang.manage = "MANAGE"
Lang.room = "ROOM"
Lang.rented = "RENTED"
Lang.buy = "BUY MOTEL"
Lang.yes = "YES"
Lang.no = "NO"
Lang.general = "GENERAL"
Lang.employees = "EMPLOYEES"
Lang.storage = "STORAGE"
Lang.customers = "CUSTOMERS"
Lang.earned = "MOTEL PROFITS <br><br> You have earned since the purchase of the Motel:"
Lang.sellMotelDesc = "Want to Sell the Motel? <br><br> You will receive 50% of the purchase price"
Lang.sell = "SELL"
Lang.evicted = "You have evicted the tenant from the room"
Lang.depositok = "The deposit has been made correctly"
Lang.withdrawok = "The withdraw has been made correctly"
Lang.errorCommand = "You must indicate the motel and the player ID"
Lang.noConnected = "The user does not appear to be logged in at the moment"
Lang.deliveredMotel = "Motel has been delivered to the user with ID"


--$$\   $$\  $$$$$$\ $$$$$$$$\ $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\   $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\  $$$$$$\  
--$$$\  $$ |$$  __$$\\__$$  __|\_$$  _|$$  _____|\_$$  _|$$  __$$\ $$  __$$\\__$$  __|\_$$  _|$$  __$$\ $$$\  $$ |$$  __$$\ 
--$$$$\ $$ |$$ /  $$ |  $$ |     $$ |  $$ |        $$ |  $$ /  \__|$$ /  $$ |  $$ |     $$ |  $$ /  $$ |$$$$\ $$ |$$ /  \__|
--$$ $$\$$ |$$ |  $$ |  $$ |     $$ |  $$$$$\      $$ |  $$ |      $$$$$$$$ |  $$ |     $$ |  $$ |  $$ |$$ $$\$$ |\$$$$$$\  
--$$ \$$$$ |$$ |  $$ |  $$ |     $$ |  $$  __|     $$ |  $$ |      $$  __$$ |  $$ |     $$ |  $$ |  $$ |$$ \$$$$ | \____$$\ 
--$$ |\$$$ |$$ |  $$ |  $$ |     $$ |  $$ |        $$ |  $$ |  $$\ $$ |  $$ |  $$ |     $$ |  $$ |  $$ |$$ |\$$$ |$$\   $$ |
--$$ | \$$ | $$$$$$  |  $$ |   $$$$$$\ $$ |      $$$$$$\ \$$$$$$  |$$ |  $$ |  $$ |   $$$$$$\  $$$$$$  |$$ | \$$ |\$$$$$$  |
--\__|  \__| \______/   \__|   \______|\__|      \______| \______/ \__|  \__|  \__|   \______| \______/ \__|  \__| \______/

function notifications(notitype, message, time)
        --Change this trigger for your notification system keeping the variables
        exports['okokNotify']:Alert("", message, time, notitype)
end
    
--Notifications types:
Noti.info = 'info'
Noti.check = 'check'
Noti.error = 'error'

--Notification time:
Noti.time = 5000


--$$\      $$\  $$$$$$\ $$$$$$$$\ $$$$$$$$\ $$\       $$$$$$\  
--$$$\    $$$ |$$  __$$\\__$$  __|$$  _____|$$ |     $$  __$$\ 
--$$$$\  $$$$ |$$ /  $$ |  $$ |   $$ |      $$ |     $$ /  \__|
--$$\$$\$$ $$ |$$ |  $$ |  $$ |   $$$$$\    $$ |     \$$$$$$\  
--$$ \$$$  $$ |$$ |  $$ |  $$ |   $$  __|   $$ |      \____$$\ 
--$$ |\$  /$$ |$$ |  $$ |  $$ |   $$ |      $$ |     $$\   $$ |
--$$ | \_/ $$ | $$$$$$  |  $$ |   $$$$$$$$\ $$$$$$$$\\$$$$$$  |
--\__|     \__| \______/   \__|   \________|\________|\______/


Motels = {
    ["Bilingsgate"] = {
        coord = vector3(569.85, -1746.51, 29.21),
        marker = {style=23, r=245, g=14, b=70},
        blip = {style=124, color=8, scale=0.8, text="Motel"},
        buyprice = 1000000,
        sellpercentage = 50,
        rooms = {
                [1] = {
                        name = "1",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(566.36, -1778.17, 29.35),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [2] = {
                        name = "2",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(550.41, -1775.53, 29.31),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [3] = {
                        name = "3",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(552.28, -1771.5, 29.31),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [4] = {
                        name = "4",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(554.66, -1766.42, 29.31),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [5] = {
                        name = "5",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(557.87, -1759.52, 29.31),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [6] = {
                        name = "6",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(561.48, -1751.74, 29.28),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [7] = {
                        name = "7",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(560.11, -1777.01, 33.44),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [8] = {
                        name = "8",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(559.21, -1777.3, 33.44),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [9] = {
                        name = "9",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(550.09, -1773.11, 33.44),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [10] = {
                        name = "10",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(550.09, -1770.7, 33.44),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [11] = {
                        name = "11",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(552.62, -1765.31, 33.44),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [12] = {
                        name = "12",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(555.66, -1758.75, 33.44),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [13] = {
                        name = "14",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(559.38, -1750.76, 33.44),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [14] = {
                        name = "15",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(561.7, -1747.36, 33.44),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-378.23, 150.61, 62.12)},
                                
                }    
        }
    },
    ["PinkCage"] = {
        coord = vector3(316.21, -223.46, 54.06),
        marker = {style=23, r=245, g=14, b=70},
        blip = {style=124, color=8, scale=0.8, text="Motel"},
        buyprice = 1000000,
        sellpercentage = 50,
        rooms = {
                [1] = {
                        name = "1",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(312.84, -218.84, 54.22),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [2] = {
                        name = "2",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(310.89, -218.07, 54.22),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [3] = {
                        name = "3",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(307.36, -216.66, 54.22),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [4] = {
                        name = "4",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(307.56, -213.3, 54.22),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [5] = {
                        name = "5",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(309.64, -207.86, 54.22),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [6] = {
                        name = "6",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(313.27, -198.18, 54.22),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [7] = {
                        name = "7",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(315.68, -194.87, 54.23),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [8] = {
                        name = "8",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(319.32, -196.27, 54.23),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [9] = {
                        name = "11",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(312.96, -218.84, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [10] = {
                        name = "12",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(310.68, -217.96, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [11] = {
                        name = "13",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(307.32, -216.67, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [12] = {
                        name = "14",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(307.51, -213.49, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [13] = {
                        name = "15",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(309.65, -207.88, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [14] = {
                        name = "16",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(311.29, -203.59, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-378.23, 150.61, 62.12)},
                                
                }, 
                [15] = {
                        name = "17",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(313.3, -198.31, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-378.23, 150.61, 62.12)},
                                
                },
                [16] = {
                        name = "18",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(315.61, -194.79, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-378.23, 150.61, 62.12)},
                                
                },
                [17] = {
                        name = "19",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(319.29, -196.2, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-378.23, 150.61, 62.12)},
                                
                },                
                [18] = {
                        name = "20",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(321.44, -197.03, 58.02),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-378.23, 150.61, 62.12)},
                                
                },
        }
    },
    ["Eastern"] = {
        coord = vector3(317.2, 2622.89, 44.46),
        marker = {style=23, r=245, g=14, b=70},
        blip = {style=124, color=8, scale=0.8, text="Motel"},
        buyprice = 1000000,
        sellpercentage = 50,
        rooms = {
                [1] = {
                        name = "1",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(341.46, 2614.9, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [2] = {
                        name = "2",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(347.21, 2618.21, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [3] = {
                        name = "3",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(354.22, 2619.69, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [4] = {
                        name = "4",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(359.97, 2622.98, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [5] = {
                        name = "5",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(367.19, 2624.59, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [6] = {
                        name = "6",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(372.57, 2627.7, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [7] = {
                        name = "7",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(380.06, 2629.44, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [8] = {
                        name = "8",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(385.35, 2632.49, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [9] = {
                        name = "9",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(392.69, 2634.16, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [10] = {
                        name = "10",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(397.93, 2637.19, 44.67),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                 
        }
    },
    ["Bayview"] = {
        coord = vector3(-696.73, 5802.42, 17.33),
        marker = {style=23, r=245, g=14, b=70},
        blip = {style=124, color=8, scale=0.8, text="Motel"},
        buyprice = 1000000,
        sellpercentage = 50,
        rooms = {
                [1] = {
                        name = "1",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-681.94, 5770.73, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [2] = {
                        name = "2",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-683.66, 5766.8, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [3] = {
                        name = "3",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-685.51, 5762.89, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [4] = {
                        name = "4",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-687.4, 5759.03, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [5] = {
                        name = "5",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-690.33, 5759.56, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [6] = {
                        name = "6",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-694.24, 5761.38, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [7] = {
                        name = "7",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-698.09, 5763.17, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [8] = {
                        name = "8",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-702.17, 5765.06, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [9] = {
                        name = "9",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-705.86, 5766.76, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                [10] = {
                        name = "10",
                        price= 150,
                        image="./public/playground_assets/imgroom131-fp5q-500w.png",
                        coord = vector3(-709.99, 5768.72, 17.51),
                        usetp = true,
                        tpcoord = vector3(-384.23, 152.27, 62.12),
                        tpheading = 279.1,
                        closet = vector3(-382.71, 152.88, 62.12),
                        depositbox = vector3(-377.39, 153.42, 62.12),
                        animations = {
                                washface = true, washfacecoord = vector3(-382.17, 149.33, 62.13), 
                                shower = true, showercoord = vector3(-383.65, 148.78, 62.17), 
                                sleep = true, sleepcoord = vector3(-379.27, 150.52, 62.63)},
                },
                 
        }
    },
}
