config = config or {}

-- Define here all the premade amounts for each job (default it's the amount that will autofill the amount field, otherAmounts are the selectable premade amounts)
config.defaultAmounts = {
    ['police'] = {default = 5000, otherAmounts = {5000, 2000, 10000, 20000, 50000}},
    ['ambulance'] = {default = 2000, otherAmounts = {2000, 500}},
    ['mechanic'] = {default = 3000, otherAmounts = {3000, 300, 10000, 50000}},
}

-- Define here all the premade reason for each job (default it's the reason that will autofill the reason field, otherReasons are the selectable premade reasons)
config.defaultReasons = {
    ['police'] = {default = "Exceeded speed limit", otherReasons = {'Exceeded speed limit', 'Bank robbery', 'Murder'}},
    ['ambulance'] = {default = "Medical care", otherReasons = {'Medical care', 'Bandages', 'Medical examination'}},
    ['mechanic'] = {default = "Vehicle repaired", otherReasons = {'Vehicle repaired', 'Fixkits', 'Vehicle washed'}},
}

-- Jobs that won't require target player to accept the invoice, the invoice will be automatically accepted for jobs defined here
config.jobsForcedBills = {
    ['police'] = true,
    ['ambulance'] = true
}

-- Allow user to create and use custom reasons
config.allowCustomReasons = true

-- Allow user to create and use custom amount
config.allowCustomAmounts = true

-- Marker that appears on the player when selecting it
config.marker = {
    color = {r = 255, g = 255, b = 50},
    alpha = 255,
    scale = {x = 0.3, y = 0.3, z = 0.3},
    dir = {x = 0.0, y = 0.0, z = 0.0},
    rot = {x = 0.0, y = 180.0, z = 0.0}
}

-- Max Distance player can be in order to be selected from billing mode
config.maxDistance = 10.0

-- Defaults keybinds (set to nil to disable, example: config.defaultKeybindCreateInvoice = nil)
config.defaultKeybindCreateInvoice = "f6"
config.defaultKeybindViewInvoices = "f7"

-- All menus position
config.menuPosition = "bottom-right"