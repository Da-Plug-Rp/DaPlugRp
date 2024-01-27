--██╗      █████╗ ███╗   ██╗ ██████╗ ██╗   ██╗ █████╗  ██████╗ ███████╗
--██║     ██╔══██╗████╗  ██║██╔════╝ ██║   ██║██╔══██╗██╔════╝ ██╔════╝
--██║     ███████║██╔██╗ ██║██║  ███╗██║   ██║███████║██║  ███╗█████╗  
--██║     ██╔══██║██║╚██╗██║██║   ██║██║   ██║██╔══██║██║   ██║██╔══╝  
--███████╗██║  ██║██║ ╚████║╚██████╔╝╚██████╔╝██║  ██║╚██████╔╝███████╗
--╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝

local Translations = {
    --[[ General ]]--
    error = {
        missing_materials = 'You don\'t have all the materials',
        cancelled = 'You changed your mind',
    },
    warning = {
    },
    info = {
    },
    success = {
    },
    --[[ Commands ]]--
    commands = {
    },
    --[[ Menu ]]--
    menu = {
        orderingboard = 'Ordering Laptop', -- Feature coming later
        orderingboardicon = 'fas fa-laptop', -- Feature coming later
        cuttingstation = 'Cutting Station',
        cuttingstationicon = 'fas fa-layer-group',
        ammostation = 'Ammo Station',
        ammostationicon = 'fas fa-circle-dot',
        drillstation = 'Drill Station',
        drillstationicon = 'fas fa-bore-hole',
        assemblingstation = 'Assembling Station',
        assemblingstationicon= 'fas fa-gun',
        exit = 'Return',
        exiticon = 'fas fa-circle-arrow-left',
    },
    --[[ Input ]]--

    --[[ Progressbar ]]--
    progressbar = {
        makingweapons = 'Making weapons...',
    },
    --[[ Functions ]]--

    --[[ Targets ]]--
    target = {
        orderingboard = 'Use Laptop', -- Feature coming later
        orderingboardicon = 'fas fa-laptop', -- Feature coming later
        cuttingstation = 'Use Cutting Station',
        cuttingstationicon = 'fas fa-layer-group',
        ammostation = 'Use Ammo Station',
        ammostationicon = 'fas fa-circle-dot',
        drillstation = 'Use Drill Station',
        drillstationicon = 'fas fa-bore-hole',
        assemblingstation = 'Use Assembling Station',
        assemblingstationicon = 'fas fa-gun',
        materials = 'Materials',
        materialsicon = 'fas fa-boxes-stacked',
    },
    --[[ Other ]]--
    other = {
        requirements = 'Requirements:',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})