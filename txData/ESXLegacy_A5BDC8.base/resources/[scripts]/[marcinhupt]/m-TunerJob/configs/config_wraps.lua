WrapsConfig = {
    ["blackwrap"] = {
        primaryColor = 000, 
        secundaryColor = 000,
        pearlescentColor = 000,
        installedMessage = "Wrap black successfully installed.",
        }, 
    ["graywrap"] = {
        primaryColor = 024, 
        secundaryColor = 024,
        pearlescentColor = 000,
        installedMessage = "Wrap gray successfully installed.",
        },
    ["redwrap"] = {
        primaryColor = 027, 
        secundaryColor = 027,
        installedMessage = "Wrap red successfully installed.",
        },
    ["orangewrap"] = {
        primaryColor = 038, 
        secundaryColor = 038,
        pearlescentColor = 000,
        installedMessage = "Wrap orange successfully installed.",
        },
    ["goldenwrap"] = {
        primaryColor = 037, 
        secundaryColor = 037,
        pearlescentColor = 000,
        installedMessage = "Wrap gold successfully installed.",
        },
    ["yellowwrap"] = {
        primaryColor = 042, 
        secundaryColor = 042,
        pearlescentColor = 000,
        installedMessage = "Wrap yellow successfully installed.",
        },
    ["bluewrap"] = {
        primaryColor = 064, 
        secundaryColor = 064,
        pearlescentColor = 000,
        installedMessage = "Wrap blue successfully installed.",
        },
    ["bronzewrap"] = {
        primaryColor = 090, 
        secundaryColor = 090,
        pearlescentColor = 000,
        installedMessage = "Wrap bronze successfully installed.",
        },
    ["brownwrap"] = {
        primaryColor = 104, 
        secundaryColor = 104,
        installedMessage = "Wrap brown successfully installed.",
        },
    ["whitewrap"] = {
        primaryColor = 111, 
        secundaryColor = 111,
        pearlescentColor = 000,
        installedMessage = "Wrap white successfully installed.",
        },
    ["pinkwrap"] = {
        primaryColor = 135, 
        secundaryColor = 135,
        pearlescentColor = 000,
        installedMessage = "Wrap pink successfully installed.",
        },
    ["pink2wrap"] = {
        primaryColor = 136, 
        secundaryColor = 136,
        pearlescentColor = 000,
        installedMessage = "Wrap pink successfully installed.",
        },
    ["purplewrap"] = {
        primaryColor = 145, 
        secundaryColor = 145,
        pearlescentColor = 000,
        installedMessage = "Wrap purple successfully installed.",
        },
    ["greenwrap"] = {
        primaryColor = 053, 
        secundaryColor = 053,
        pearlescentColor = 000,
        installedMessage = "Wrap green successfully installed.",
        }
}

--[[  CUSTOM WRAP
To create a custom wrap you need to add the table above: 

    ["wrapname"] = {            -- The name of the item inside QBCore -> Shared -> Items
        primaryColor = 053,     -- The primary color of the wrap (according to your FiveM server) (https://wiki.rage.mp/index.php?title=Vehicle_Colors)
        secundaryColor = 053,   -- The secundary color of the wrap (according to your FiveM server) (https://wiki.rage.mp/index.php?title=Vehicle_Colors)
        installedMessage = "",  -- Sucessfuly message when wrap installed
        }

        
    You need to add that item to QBCore -> Shared -> Items: (Don't forget to edit all things and add an image inside your inventory images with the name you put in ["image"])

    ["wrapname"]               = {["name"] = "wrapname",                  ["label"] = "Wrap Name",               ["weight"] = 125,       ["type"] = "item",      ["image"] = "wrapimage.png",            ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A simple vinyl.."},


    You should add it to your Tuner Shop -> config_shop.lua (Don't forget to replace the slot and wrapname)

    [slot] = {
            name = "wrapname",
            price = 125,
            amount = 1,
            info = {},
            type = "item",
            slot = slot,
        },
 ]]