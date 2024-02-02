Config = {

MaxJobs = 4, -- Maximum amount of jobs avalable for every player (Only applies to jobs that are auto savable)
AllowAutoJobSavining = true, -- When the script detects a new job it will add it to your jobs Ex. You get police job and it saves that job (if maximum not reached) to your job list
DefaultJobWhenPlayerIsFire = 'unemployed', -- the default job player get when someone fire (from police to unemployed for example)

OpenJobUIKey = 'F6', -- The key used to open the UI (Leave blank if you do not want to use key)
OpenJobUICommand = 'jobs', -- Command used to open the UI (MUST NOT BE BLANK!!)
NewESX = true,

--Set up blip info (https://docs.fivem.net/docs/game-references/blips/)
--BLIPS FOR MANAGEMENT LOCATIONS
BlipSprite = 457,
BlipColor = 3,
BlipText = 'Job Managment',

--BLIPS FOR JOB CENTERS
BlipCenterSprite = 498,
BlipCenterColor = 3,
BlipCenterText = 'Job Center',

MarkerSprite = 27,
MarkerColor = {66, 135, 245},
MarkerSize = 1.5,

LocationsJobCenters = { -- If you want you can setup locations to change jobs (Leave without entiries if you dont want locations) (ADDS 0.02 MS)
	{coords = vector3(-261.82537841797,-965.21392822266,31.22407531738), blip = true}
},


LocationsToChangeJobs = { -- If you want you can setup locations to change jobs (Leave without entiries if you dont want locations) (ADDS 0.02 MS)
	{coords = vector3(-267.58975219727,-958.55718994141,31.22312927246), blip = true}
},

OffdutyForEveryone = true, -- Everyone can go into offduty job
JobsThatCanUseOffduty = { -- Jobs that can use offduty if option above is false
	'police',
	'ambulance',
	'mechanic'
},

DefaultJobsInJobCenter = { -- Jobs that can be added by going to the job center. For icons use https://fontawesome.com/
	
	{job = 'scammer', label = "Scammer", icon = "fa-thin fa-print", description = "Criminal World Into Scamming"},
	{job = 'taxi', label = "Taxi", icon = "fa-solid fa-joint", description = "Uber"}

},

DefaultJobs = { -- Jobs that will be added in menu by default and wont be removable
	
	--{job = 'miner', grade = 0},
	--{job = 'fueler', grade = 0}
},

Text = {

	['cant_offduty'] = 'You cant go offduty!',
	['open_ui_hologram'] = '[~b~E~w~] Open Job Managment',
	['open_jobcenter_ui_hologram'] = '[~b~E~w~] Open Job Center',
	['wrong_usage'] = 'Wrong command usage',
	['job_added'] = 'Job added!'

}
	

}

-- Only change if you know what are you doing!
function SendTextMessage(msg)

		SetNotificationTextEntry('STRING')
		AddTextComponentString(msg)
		DrawNotification(0,1)

		--EXAMPLE USED IN VIDEO
		--exports['mythic_notify']:SendAlert('error', msg)

end
