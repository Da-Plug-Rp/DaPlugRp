Config = {}

Config.EmoteMenu = "rp" -- "rp" or "dp" or "scully"
Config.Debug = true -- If true, some prints happen on console
Config.Webhook = ""
Config.Inventory = "ox" -- "ox" or "qs"
Config.MoneyItem = "cash" -- "cash" or "money"
Config.TargetDistances = 3.0 -- Distance of targets

-- Insurance & Registration Settings
Config.InsuranceSettings = {
    Blip = { 
        [1] = { enable = true, coords = vector3(834.99, -813.01, 26.33), sprite = 89, colour = 5, scale = 0.8, name = "Insurance" },
    },
    Peds = {
        [1] = { coords = vector3(834.99, -813.01, 26.33), pedModel = "s_m_m_fiboffice_01", heading = 90.62},
    }
}

Config.RegistrationPrice = 500 -- Price of registration vehicle

Config.InsurancePrice = {
    [1] = 500, -- 1 Month
    [2] = 1000, -- 2 Month
    [3] = 1500, -- 3 Month
}

-- Health Insurance
Config.HealthInsuranceSettings = {
    Blip = { 
        [1] = { enable = true, coords = vector3(311.38, -594.21, 43.28), sprite = 107, colour = 5, scale = 0.8, name = "Health Insurance" },
    },
    Peds = {
        [1] = { coords = vector3(311.38, -594.21, 43.28), pedModel = "s_m_m_doctor_01", heading = 341.31},
    }
}

Config.HealthInsurancePrice = {
    [1] = 500, -- 1 Month
    [2] = 1000, -- 2 Month
    [3] = 1500, -- 3 Month
}

-- Home Insurance
Config.HomeInsuranceSettings = {
    Blip = { 
        [1] = { enable = true, coords = vector3(-698.25, 271.4, 83.11), sprite = 107, colour = 5, scale = 0.8, name = "Home Insurance" },
    },
    Peds = {
        [1] = { coords = vector3(-698.25, 271.4, 83.11), pedModel = "s_m_m_strpreach_01", heading = 297.82},
    }
}

Config.HomeInsurancePrice = {
    [1] = 500, -- 1 Month
    [2] = 1000, -- 2 Month
    [3] = 1500, -- 3 Month
}

-- Commands
Config.Commands = {
    checkInsurance = {
        command = "checkinsurance",  -- Command to check insurance on specific plate
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    removeInsurance = {
        command = "removeinsurance", -- Command to remove insurance on specific plate
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    checkHealthInsurance = {
        command = "checkhealthinsurance",  -- Command to check health insurance on specific citizenid
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    removeHealthInsurance = {
        command = "removehealthinsurance", -- Command to remove health insurance on specific citizenid
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    checkHomeInsurance = {
        command = "checkhomeinsurance", -- Command to check home insurance on specific citizenid
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    removeHomeInsurance = {
        command = "removehomeinsurance", -- Command to remove home insurance on specific citizenid
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
}

-- Settings Repairs
Config.QuasarGaragesRepairs = false -- You use qs-advancedgarages?
Config.Repairs = {
    [1] = {
        blipRepair = { enable = true, sprite = 402, colour = 5, scale = 1.2, name = "Car Repair" },
        pedCoords = vector3(735.14, -1088.93, 22.17),
        pedHeading = 90.36,
        pedModel = "mp_m_waremech_01",
        repairType = "all", -- "engine", "body", "all"
        repairCost = 500, -- Cost of repair vehicle
        costType = "cash", -- "cash" or "bank"
        withInsurance = false, -- Only can use if have car insurance
        repairTime = 5000, -- Time of progressbar
    }
}