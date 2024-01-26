**Menu:**

Inside the folder: [Dependencies] have a menu to work fine with all script, start the menu on server.cfg

**Sounds:**
-> /resources/[standalone]/interact-sound/client/html/sounds/

**Database:**
-> Run the SQL

**Minigame:**
-> https://github.com/Project-Sloth/ps-ui

**Step 1:**

-> *ox_inventory/data/items.lua*

    ['turbo'] = { label = 'Turbo', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['headlights'] = { label = 'Headlights', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['coilovers'] = { label = 'Coilovers', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['coilover_wrenches'] = { label = 'Coilover Wrenches', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['hid_controller'] = { label = 'Hid Controller', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['underglow_controller'] = { label = 'Underglow Controller', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['tint_supplies'] = { label = 'Tint Supplies', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine0'] = { label = 'Engine 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine1'] = { label = 'Engine 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine2'] = { label = 'Engine 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine3'] = { label = 'Engine 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine4'] = { label = 'Engine 4', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake0'] = { label = 'Brake 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake1'] = { label = 'Brake 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake2'] = { label = 'Brake 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake3'] = { label = 'Brake 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission0'] = { label = 'Transmission 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission1'] = { label = 'Transmission 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission2'] = { label = 'Transmission 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission3'] = { label = 'Transmission 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['blackwrap'] = { label = 'Black Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['graywrap'] = { label = 'Gray Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['redwrap'] = { label = 'Red Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['orangewrap'] = { label = 'Orange Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['goldenwrap'] = { label = 'Golden Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowwrap'] = { label = 'Yellow Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewrap'] = { label = 'Blue Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bronzewrap'] = { label = 'Bronze Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brownwrap'] = { label = 'Brown Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['whitewrap'] = { label = 'White Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['pinkwrap'] = { label = 'Pink Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['pink2wrap'] = { label = 'Pink 2 Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['purplewrap'] = { label = 'Purple Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['greenwrap'] = { label = 'Green Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhiteplate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowblackplate'] = { label = 'Yellow Black Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowblueplate'] = { label = 'Yellow Blue Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhite2plate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhite3plate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['diagnosismachine'] = { label = 'Diagnostic Machine', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['airsuspension'] = { label = 'Air Suspension', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['mechaniccamera'] = { label = 'Mechanic Camera', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['nitrous'] = { label = 'Nitrous', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['emptynitrous'] = { label = 'Empty Nitrous', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['tire'] = { label = 'Tire', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['drift_tires'] = { label = 'Drift Tires', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['normal_tires'] = { label = 'Normal Tires', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['repairkit'] = { label = 'Repair Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['advancedrepairkit'] = { label = 'Advanced Repair Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['cleaningkit'] = { label = 'Cleaning Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['metalscrap'] = { label = 'Metalscrap', weight = 50, stack = true, allowArmed = false },
    ['steel'] = { label = 'Steel', weight = 50, stack = true, allowArmed = false },
    ['glass'] = { label = 'Glass', weight = 50, stack = true, allowArmed = false },
    ['rubber'] = { label = 'rubber', weight = 50, stack = true, allowArmed = false },
