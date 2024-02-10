Config = {}

Config.DeletePermanent = false -- on choping player owned vehicle it will be permanently removed from player data

Config.AnimTime = 5 --in seconds -- animation time of removing parts in seconds

Config.Price = {
    door = 20,  --price for each door part
    bonnet = 10,    -- price for each bonnet part
    boot = 15,  --price for boot part
    vehicle = 1500  --price for vehicle purchased by alan
}

Config.items = {
    door = 'fs_door',
    bonnet = 'fs_bonnet',
    boot = 'fs_boot'
}

Config.Stash = { --currently only support ox_inventory
    slots = 50,
    weight = 50000,
}

-- true means blacklist and cannot be scrapped
Config.blacklistmodels = {
    ['t20'] = t20,
    ['blista'] = false,
    ['bifta'] = false,
    
}
-- true means blacklist and cannot be scrapped
Config.blacklistClasses = {
    [0] = false,               --Compacts  
    [1] = false,               --Sedans  
    [2] = false,               --SUVs  
    [3] = false,               --Coupes  
    [4] = false,               --Muscle  
    [5] = false,               --Sports Classics  
    [6] = false,               --Sports  
    [7] = false,               --Super  
    [8] = false,               --Motorcycles  
    [9] = false,               --Off-road  
    [10] = false,               --Industrial  
    [11] = false,               --Utility  
    [12] = false,               --Vans  
    [13] = false,               --Cycles  
    [14] = false,               --Boats  
    [15] = false,               --Helicopters  
    [16] = false,               --Planes  
    [17] = false,               --Service  
    [18] = false,               --Emergency  
    [19] = false,               --Military  
    [20] = false,               --Commercial  
    [21] = false,               --Trains  
    [22] = false,               --Open Wheel
        
}
-- true means blacklist and cannot be scrapped
Config.blacklistplates = {
    ['police'] = true,
    ['admincar'] = false,
    ['ambulance'] = true,
    
}

Config.Business = {
    --['scraper'] = { -- jobname  scraper
        --Blip = { enable = true, coords = vector3(-425.2217, -1688.1985, 19.0291) , title = 'Scapper Chop Shop' , id = 527, color = 31 , scale = 0.7},
        --Allowed = { -- what vehicles can be chopped in this location
            --npcvehicles = true, 
           -- playervehicles = true,
        --},
       -- ScapPoints = {  -- configuration points
            --startpoint = vector3(-425.2217, -1688.1985, 19.0291) , --starting process on vehicle at this point 
           -- doordrop = vector3(-422.5697, -1674.4823, 19.0291 ),   --store door
            --bootdrop = vector3(-419.3865, -1675.4242, 19.0291),   --store boot
           -- bonnetdrop = vector3(-415.8058, -1676.7914, 19.0291), --store bonnets
            
            
            --sellSiemon = vector3(-429.5168, -1685.5092, 19.0291), -- point where to call Ped to take vehicle
            --SiemonSpawn = vector3(-435.7994, -1672.0447, 19.0291),  --ped spawn location that will take vehicle and run away
        --},
        
        Management = {

            --scap = { --sell or collect scap
                coords = vector3(-412.1544, -1678.1622, 19.0291), --location to collect or sell scap
            --},
            --stash = {
                --minrank = 2, -- min rank that can access stash
               -- coords = vector3(-484.6925, -1730.6196, 19.5493), --stash marker position
            --},
           -- boss = {
                --moneywash = false,
                --coords = vector3(-499.3454, -1714.1659, 19.8992)   
            --}
        --}
    },

--- Add more here same like above

}


Config.NonBusiness = {


    --uncomment to make non business money will go to player directly


     {    
     Blip = { enable = false, coords = vector3(352.8318, -1157.5365, 29.2919) , title = 'Chop Shop' , id = 527, color = 31, scale = 0.7},
         Allowed = {
             npcvehicles = true,
             playervehicles = true,
         },
         coords = {
             startpoint = vector3(352.8318, -1157.5365, 29.2919) , --starting process on vehicle at this point 
             doordrop = vector3(359.0726, -1166.1667, 29.2918 ),   --store door
             bootdrop = vector3(359.2379, -1163.0635, 29.2918 ),   --store boot
            bonnetdrop = vector3(359.0126, -1159.7523, 29.2918 ), --store bonnets
             SellScap = vector3(359.4843, -1157.0326, 29.2919 ), -- collect or sell scap that store in door boot or bonnets
         
             sellSiemon = vector3(359.2225, -1154.1404, 29.2919 ), -- point where to call Ped to take vehicle
             SiemonSpawn = vector3(359.1487, -1150.1786, 29.2918 ) , --ped spawn location that will take vehicle and run away
         }
     },
 
}
