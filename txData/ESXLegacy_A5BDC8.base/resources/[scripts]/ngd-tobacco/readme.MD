```lua
--------INSTALLATION:---------
--If you don't have an inventory that supports displaying metadata by default (such as QB/PS), you need to add the following into your html>js>app.js file if you would like to display the moisture content of the tobacco leaves.--

        } else if (itemData.name == "ngd_cigtobaccoleaf") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Description: </strong><span>" + itemData.info.description +
                "</span></p>"
            );
        } else if (itemData.name == "ngd_pipetobaccoleaf") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Description: </strong><span>" + itemData.info.description +
                "</span></p>"
            );
        } else if (itemData.name == "ngd_cigartobaccoleaf") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Description: </strong><span>" + itemData.info.description +
                "</span></p>"
            );



--Add jobs to your framework:  If you have ESX you'll have to build it into your database or whatever job script you have.

--OLD QB JOB
    ['tobacco'] = {
        label = 'Tobacco Farmer',
        defaultDuty = true,
		offDutyPay = false,
        grades = {
            ['0'] = { name = 'Employee', payment = 25 },
            ['1'] = { name = 'Owner', payment = 75, isboss = true },
        },
    },
--NEW QB JOB
		tobacco = {
		label = 'Tobacco Farmer',
		type = 'Tobacco',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Farmhand', payment = 50 },
			['1'] = { name = 'Owner', payment = 75, isboss = true },
		},
	},
-----------------------------------------------------------------------------------------------------
--QB OLD ITEMS:
['ngd_tobaccotrimmer'] = {['name'] = 'ngd_tobaccotrimmer', ['label'] = 'Tobacco Trimmer', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_tobaccotrimmer.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigtobaccoleaf'] = {['name'] = 'ngd_cigtobaccoleaf', ['label'] = 'Cigarette Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigtobaccoleaf.png', ['unique'] = true, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_pipetobaccoleaf'] = {['name'] = 'ngd_pipetobaccoleaf', ['label'] = 'Pipe Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_pipetobaccoleaf.png', ['unique'] = true, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigartobaccoleaf'] = {['name'] = 'ngd_cigartobaccoleaf', ['label'] = 'Cigar Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigartobaccoleaf.png', ['unique'] = true, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_drypipetobacco'] = {['name'] = 'ngd_drypipetobacco', ['label'] = 'Dried Pipe Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_drypipetobacco.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_drycigtobacco'] = {['name'] = 'ngd_drycigtobacco', ['label'] = 'Dried Cigarette Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_drycigtobacco.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_drycigartobacco'] = {['name'] = 'ngd_drycigartobacco', ['label'] = 'Dried Cigar Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_drycigartobacco.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_drycherrytobacco'] = {['name'] = 'ngd_drycherrytobacco', ['label'] = 'Dried Cherry Pipe Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_drycherrytobacco.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_drymapletobacco'] = {['name'] = 'ngd_drymapletobacco', ['label'] = 'Dried Maple Pipe Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_drymapletobacco.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_drylemontobacco'] = {['name'] = 'ngd_drylemontobacco', ['label'] = 'Dried Lemon Pipe Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_drylemontobacco.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_drywintergtobacco'] = {['name'] = 'ngd_drywintergtobacco', ['label'] = 'Dried Wintergreen Pipe Tobacco Leaves', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_drywintergtobacco.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigrollingpaper'] = {['name'] = 'ngd_cigrollingpaper', ['label'] = 'Cigarette Rolling Paper', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigrollingpaper.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_premcigrollingpaper'] = {['name'] = 'ngd_premcigrollingpaper', ['label'] = 'Premium Cigarette Rolling Paper', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_premcigrollingpaper.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigfilter'] = {['name'] = 'ngd_cigfilter', ['label'] = 'Cigarette Filter', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigfilter.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigarrollingpaper'] = {['name'] = 'ngd_cigarrollingpaper', ['label'] = 'Cigar Rolling Paper', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigarrollingpaper.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigarbinder'] = {['name'] = 'ngd_cigarbinder', ['label'] = 'Cigar Binder', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigarbinder.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigarillopaper'] = {['name'] = 'ngd_cigarillopaper', ['label'] = 'Cigarillo Rolling Paper', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigarillopaper.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_menthol'] = {['name'] = 'ngd_menthol', ['label'] = 'Menthol', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_menthol.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_premiumcigarpaper'] = {['name'] = 'ngd_premiumcigarpaper', ['label'] = 'Premium Cigar Rolling Paper', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_premiumcigarpaper.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_importcuban'] = {['name'] = 'ngd_importcuban', ['label'] = 'Imported Cuban Tobacco', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_importcuban.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cig1'] = {['name'] = 'ngd_cig1', ['label'] = 'Standard Cigarette', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cig1.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cig2'] = {['name'] = 'ngd_cig2', ['label'] = 'Premium Cigarette', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cig2.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cig3'] = {['name'] = 'ngd_cig3', ['label'] = 'Cigarillo', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cig3.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cig4'] = {['name'] = 'ngd_cig4', ['label'] = 'Menthol Cigarette', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cig4.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigar1'] = {['name'] = 'ngd_cigar1', ['label'] = 'Standard Cigar', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigar1.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigar2'] = {['name'] = 'ngd_cigar2', ['label'] = 'Premium Cigar', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigar2.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigar3'] = {['name'] = 'ngd_cigar3', ['label'] = 'Cuban Cigar', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigar3.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_pipe1'] = {['name'] = 'ngd_pipe1', ['label'] = 'Ivory Pipe', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_pipe1.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_pipe2'] = {['name'] = 'ngd_pipe2', ['label'] = 'Cherrywood Pipe', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_pipe2.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_pipe3'] = {['name'] = 'ngd_pipe3', ['label'] = 'Cocobolo Pipe', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_pipe3.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_pipe4'] = {['name'] = 'ngd_pipe4', ['label'] = 'Corncob Pipe', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_pipe4.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_pipe5'] = {['name'] = 'ngd_pipe5', ['label'] = 'Churchwarden Pipe', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_pipe5.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cherryoil'] = {['name'] = 'ngd_cherryoil', ['label'] = 'Cherry Tobacco Flavoring', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cherryoil.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_mapleoil'] = {['name'] = 'ngd_mapleoil', ['label'] = 'Maple Tobacco Flavoring', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_mapleoil.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_lemonoil'] = {['name'] = 'ngd_lemonoil', ['label'] = 'Lemon Tobacco Flavoring', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_lemonoil.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_wintergreenoil'] = {['name'] = 'ngd_wintergreenoil', ['label'] = 'Wintergreen Tobacco Flavoring', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_wintergreenoil.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_standardcigpack'] = {['name'] = 'ngd_standardcigpack', ['label'] = 'Pack Of Cigarettes', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_standardcigpack.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_premiumcigpack'] = {['name'] = 'ngd_premiumcigpack', ['label'] = 'Pack Of Premium Cigarettes', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_premiumcigpack.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cigarillopack'] = {['name'] = 'ngd_cigarillopack', ['label'] = 'Pack Of Cigarillos', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cigarillopack.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_mentholcigpack'] = {['name'] = 'ngd_mentholcigpack', ['label'] = 'Pack Of Menthol Cigarettes', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_mentholcigpack.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_stdcigarbox'] = {['name'] = 'ngd_stdcigarbox', ['label'] = 'Box Of Cigars', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_stdcigarbox.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_premiumcigarbox'] = {['name'] = 'ngd_premiumcigarbox', ['label'] = 'Premium Box Of Cigars', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_premiumcigarbox.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_cubancigarbox'] = {['name'] = 'ngd_cubancigarbox', ['label'] = 'Box Of Cuban Cigars', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_cubancigarbox.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_tobaccowhisky'] = {['name'] = 'ngd_tobaccowhisky', ['label'] = 'Whisky', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_tobaccowhisky.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
-----------------------------------------------------------------------------------------------------
--NEW QB ITEMS:
ngd_tobaccotrimmer = { name = 'ngd_tobaccotrimmer', label = 'Tobacco Trimmer', weight = 0, type = 'item', image = 'ngd_tobaccotrimmer.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_cigtobaccoleaf = { name = 'ngd_cigtobaccoleaf', label = 'Cigarette Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_cigtobaccoleaf.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_pipetobaccoleaf = { name = 'ngd_pipetobaccoleaf', label = 'Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_pipetobaccoleaf.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_cigartobaccoleaf = { name = 'ngd_cigartobaccoleaf', label = 'Cigar Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_cigartobaccoleaf.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_drypipetobacco = { name = 'ngd_drypipetobacco', label = 'Dried Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drypipetobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_drycigtobacco = { name = 'ngd_drycigtobacco', label = 'Dried Cigarette Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drycigtobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_drycigartobacco = { name = 'ngd_drycigartobacco', label = 'Dried Cigar Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drycigartobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_drycherrytobacco = { name = 'ngd_drycherrytobacco', label = 'Dried Cherry Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drycherrytobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_drymapletobacco = { name = 'ngd_drymapletobacco', label = 'Dried Maple Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drymapletobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_drylemontobacco = { name = 'ngd_drylemontobacco', label = 'Dried Lemon Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drylemontobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_drywintergtobacco = { name = 'ngd_drywintergtobacco', label = 'Dried Wintergreen Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drywintergtobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_cigrollingpaper = { name = 'ngd_cigrollingpaper', label = 'Cigarette Rolling Paper', weight = 0, type = 'item', image = 'ngd_cigrollingpaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_premcigrollingpaper = { name = 'ngd_premcigrollingpaper', label = 'Premium Cigarette Rolling Paper', weight = 0, type = 'item', image = 'ngd_premcigrollingpaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_cigfilter = { name = 'ngd_cigfilter', label = 'Cigarette Filter', weight = 0, type = 'item', image = 'ngd_cigfilter.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_cigarrollingpaper = { name = 'ngd_cigarrollingpaper', label = 'Cigar Rolling Paper', weight = 0, type = 'item', image = 'ngd_cigarrollingpaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_cigarbinder = { name = 'ngd_cigarbinder', label = 'Cigar Binder', weight = 0, type = 'item', image = 'ngd_cigarbinder.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_cigarillopaper = { name = 'ngd_cigarillopaper', label = 'Cigarillo Rolling Paper', weight = 0, type = 'item', image = 'ngd_cigarillopaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_menthol = { name = 'ngd_menthol', label = 'Menthol', weight = 0, type = 'item', image = 'ngd_menthol.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_premiumcigarpaper = { name = 'ngd_premiumcigarpaper', label = 'Premium Cigar Rolling Paper', weight = 0, type = 'item', image = 'ngd_premiumcigarpaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_importcuban = { name = 'ngd_importcuban', label = 'Imported Cuban Tobacco', weight = 0, type = 'item', image = 'ngd_importcuban.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_cig1 = { name = 'ngd_cig1', label = 'Standard Cigarette', weight = 0, type = 'item', image = 'ngd_cig1.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cig2 = { name = 'ngd_cig2', label = 'Premium Cigarette', weight = 0, type = 'item', image = 'ngd_cig2.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cig3 = { name = 'ngd_cig3', label = 'Cigarillo', weight = 0, type = 'item', image = 'ngd_cig3.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cig4 = { name = 'ngd_cig4', label = 'Menthol Cigarette', weight = 0, type = 'item', image = 'ngd_cig4.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cigar1 = { name = 'ngd_cigar1', label = 'Standard Cigar', weight = 0, type = 'item', image = 'ngd_cigar1.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cigar2 = { name = 'ngd_cigar2', label = 'Premium Cigar', weight = 0, type = 'item', image = 'ngd_cigar2.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cigar3 = { name = 'ngd_cigar3', label = 'Cuban Cigar', weight = 0, type = 'item', image = 'ngd_cigar3.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_pipe1 = { name = 'ngd_pipe1', label = 'Ivory Pipe', weight = 0, type = 'item', image = 'ngd_pipe1.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_pipe2 = { name = 'ngd_pipe2', label = 'Cherrywood Pipe', weight = 0, type = 'item', image = 'ngd_pipe2.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_pipe3 = { name = 'ngd_pipe3', label = 'Cocobolo Pipe', weight = 0, type = 'item', image = 'ngd_pipe3.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_pipe4 = { name = 'ngd_pipe4', label = 'Corncob Pipe', weight = 0, type = 'item', image = 'ngd_pipe4.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_pipe5 = { name = 'ngd_pipe5', label = 'Churchwarden Pipe', weight = 0, type = 'item', image = 'ngd_pipe5.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cherryoil = { name = 'ngd_cherryoil', label = 'Cherry Tobacco Flavoring', weight = 0, type = 'item', image = 'ngd_cherryoil.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_mapleoil = { name = 'ngd_mapleoil', label = 'Maple Tobacco Flavoring', weight = 0, type = 'item', image = 'ngd_mapleoil.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_lemonoil = { name = 'ngd_lemonoil', label = 'Lemon Tobacco Flavoring', weight = 0, type = 'item', image = 'ngd_lemonoil.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_wintergreenoil = { name = 'ngd_wintergreenoil', label = 'Wintergreen Tobacco Flavoring', weight = 0, type = 'item', image = 'ngd_wintergreenoil.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' }
ngd_standardcigpack = { name = 'ngd_standardcigpack', label = 'Pack Of Cigarettes', weight = 0, type = 'item', image = 'ngd_standardcigpack.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_premiumcigpack = { name = 'ngd_premiumcigpack', label = 'Pack Of Premium Cigarettes', weight = 0, type = 'item', image = 'ngd_premiumcigpack.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cigarillopack = { name = 'ngd_cigarillopack', label = 'Pack Of Cigarillos', weight = 0, type = 'item', image = 'ngd_cigarillopack.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_mentholcigpack = { name = 'ngd_mentholcigpack', label = 'Pack Of Menthol Cigarettes', weight = 0, type = 'item', image = 'ngd_mentholcigpack.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_stdcigarbox = { name = 'ngd_stdcigarbox', label = 'Box Of Cigars', weight = 0, type = 'item', image = 'ngd_stdcigarbox.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_premiumcigarbox = { name = 'ngd_premiumcigarbox', label = 'Premium Box Of Cigars', weight = 0, type = 'item', image = 'ngd_premiumcigarbox.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_cubancigarbox = { name = 'ngd_cubancigarbox', label = 'Box Of Cuban Cigars', weight = 0, type = 'item', image = 'ngd_cubancigarbox.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
ngd_tobaccowhisky = { name = 'ngd_tobaccowhisky', label = 'Whisky', weight = 0, type = 'item', image = 'ngd_tobaccowhisky.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' }
-----------------------------------------------------------------------------------------------------
--OX INVENTORY ITEMS:
["ngd_tobaccotrimmer"] = {
		label = "Tobacco Trimmer",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_tobaccotrimmer.png",
		}
	},
	["ngd_cigtobaccoleaf"] = {
		label = "Cigarette Tobacco Leaves",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "ngd_cigtobaccoleaf.png",
		}
	},
	["ngd_pipetobaccoleaf"] = {
		label = "Pipe Tobacco Leaves",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "ngd_pipetobaccoleaf.png",
		}
	},
	["ngd_cigartobaccoleaf"] = {
		label = "Cigar Tobacco Leaves",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "ngd_cigartobaccoleaf.png",
		}
	},
	["ngd_drypipetobacco"] = {
		label = "Dried Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drypipetobacco.png",
		}
	},
	["ngd_drycigtobacco"] = {
		label = "Dried Cigarette Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drycigtobacco.png",
		}
	},
	["ngd_drycigartobacco"] = {
		label = "Dried Cigar Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drycigartobacco.png",
		}
	},
	["ngd_drycherrytobacco"] = {
		label = "Dried Cherry Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drycherrytobacco.png",
		}
	},
	["ngd_drymapletobacco"] = {
		label = "Dried Maple Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drymapletobacco.png",
		}
	},
	["ngd_drylemontobacco"] = {
		label = "Dried Lemon Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drylemontobacco.png",
		}
	},
	["ngd_drywintergtobacco"] = {
		label = "Dried Wintergreen Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drywintergtobacco.png",
		}
	},
	["ngd_cigrollingpaper"] = {
		label = "Cigarette Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigrollingpaper.png",
		}
	},
	["ngd_premcigrollingpaper"] = {
		label = "Premium Cigarette Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_premcigrollingpaper.png",
		}
	},
	["ngd_cigfilter"] = {
		label = "Cigarette Filter",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigfilter.png",
		}
	},

	["ngd_cigarrollingpaper"] = {
		label = "Cigar Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigarrollingpaper.png",
		}
	},
	["ngd_cigarbinder"] = {
		label = "Cigar Binder",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigarbinder.png",
		}
	},
	["ngd_cigarillopaper"] = {
		label = "Cigarillo Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigarillopaper.png",
		}
	},
	["ngd_menthol"] = {
		label = "Menthol",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_menthol.png",
		}
	},
	["ngd_premiumcigarpaper"] = {
		label = "Premium Cigar Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_premiumcigarpaper.png",
		}
	},
	["ngd_importcuban"] = {
		label = "Imported Cuban Tobacco",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_importcuban.png",
		}
	},
	["ngd_cig1"] = {
		label = "Standard Cigarette",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cig1.png",
		}
	},
	["ngd_cig2"] = {
		label = "Premium Cigarette",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cig2.png",
		}
	},
	["ngd_cig3"] = {
		label = "Cigarillo",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cig3.png",
		}
	},
	["ngd_cig4"] = {
		label = "Menthol Cigarette",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cig4.png",
		}
	},
	["ngd_cigar1"] = {
		label = "Standard Cigar",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigar1.png",
		}
	},
	["ngd_cigar2"] = {
		label = "Premium Cigar",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigar2.png",
		}
	},
	["ngd_cigar3"] = {
		label = "Cuban Cigar",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigar3.png",
		}
	},
	["ngd_pipe1"] = {
		label = "Ivory Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe1.png",
		}
	},
	["ngd_pipe2"] = {
		label = "Cherrywood Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe2.png",
		}
	},
	["ngd_pipe3"] = {
		label = "Cocobolo Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe3.png",
		}
	},
	["ngd_pipe4"] = {
		label = "Corncob Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe4.png",
		}
	},
	["ngd_pipe5"] = {
		label = "Churchwarden Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe5.png",
		}
	},
	["ngd_cherryoil"] = {
		label = "Cherry Tobacco Flavoring",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cherryoil.png",
		}
	},
	["ngd_mapleoil"] = {
		label = "Maple Tobacco Flavoring",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_mapleoil.png",
		}
	},
	["ngd_lemonoil"] = {
		label = "Lemon Tobacco Flavoring",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_lemonoil.png",
		}
	},
	["ngd_wintergreenoil"] = {
		label = "Wintergreen Tobacco Flavoring",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_wintergreenoil.png",
		}
	},
	["ngd_standardcigpack"] = {
		label = "Pack Of Cigarettes",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_standardcigpack.png",
		}
	},
	["ngd_premiumcigpack"] = {
		label = "Pack Of Premium Cigarettes",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_premiumcigpack.png",
		}
	},
	["ngd_cigarillopack"] = {
		label = "Pack Of Cigarillos",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigarillopack.png",
		}
	},
	["ngd_mentholcigpack"] = {
		label = "Pack Of Menthol Cigarettes",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_mentholcigpack.png",
		}
	},
	["ngd_stdcigarbox"] = {
		label = "Box Of Cigars",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_stdcigarbox.png",
		}
	},
	["ngd_premiumcigarbox"] = {
		label = "Premium Box Of Cigars",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_premiumcigarbox.png",
		}
	},
	["ngd_cubancigarbox"] = {
		label = "Box Of Cuban Cigars",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cubancigarbox.png",
		}
	},
	["ngd_tobaccowhisky"] = {
		label = "Whisky",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_tobaccowhisky.png",
		}
	},

```
