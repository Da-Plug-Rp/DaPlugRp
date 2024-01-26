Config = {}
Config.HitchDist = 1.5 -- Distance to check between hitches Default: 1.0
Config.Debug = false
--ONLY ENABLE ONE SYSTEM BELOW. BY DEFAULT BOTH ARE FALSE, WHICH ALLOWS ANY TOWING CAPABLE VEHICLE TO TOW ANY TRAILER

--Enable / Disable blacklisting if you still want to prevent certain trailers from being used but allow the rest
-- For example, stop vehicles from being able to freely connect to semi trailers
Config.UseBlacklist = false -- If FALSE (Default) the below section does NOT need filled out
Config.Blacklist = {
    'trailers',
    'trailers2',
    'trailers3',
    'tvtrailer',
    'trailers4',
    'docktrailer',
    'tr2',
    'tr3',
    'tr4',
    'tanker',
    'tanker2',
    'armytanker',
    'trflat',
    'trailerlogs',
    'trailerlarge'
}

----
--Enable / Disable whitelisting if you still want full control what trucks can tow what trailers
Config.UseWhitelist = false -- If FALSE (Default) the below sections do NOT need filled out

Config.BallHitchTrucks = {
    'sadler'
}

Config.BallHitchTrailers = {
    'trailersmall'
}

Config.GooseHitchTrucks = {

}

Config.GooseHitchTrailers = {
    
}

Config.SaddleHitchTrucks = {
    'packer',
    'phantom',
    'phantom2',
    'phantom3',
    'hauler',
    'hauler2',
    'barracks2'
}

Config.SaddleHitchTrailers = {
    'trailers',
    'trailers2',
    'trailers3',
    'tvtrailer',
    'trailers4',
    'docktrailer',
    'tr2',
    'tr3',
    'tr4',
    'tanker',
    'tanker2',
    'armytanker',
    'trflat',
    'trailerlogs',
    'trailerlarge'
}