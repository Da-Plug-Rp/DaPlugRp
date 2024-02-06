
Config.Drunks = {
    --limit will reset on effect removed
    drinkslimit = 5, --how many drinks needed to reach cooldown
    --each drink will increase time of effect 
    duration = 60 ,   -- duration in seconds for effect
}

Config.useable['drunks'] = {

    ['fs_redwine'] = {
        text = 'Using Red Wine', --text for progressbar
        duration = 3,          --animation duration in seconds
        anim = {
            dict = 'amb@world_human_drinking@coffee@male@idle_a',
            clip = 'idle_c'
        },
        benefits = {
            stress = 30,  -- stress relif in %
            thirst = 20,    --thirst fill in %
            health = 10,    -- health fill in %
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `prop_drink_redwine`, 
            pos = vec3(0.06, -0.1, -0.1),
            rot = vec3(100.0, 160.0, 220.0),
            bone = 57005,    --if you donot need to set bone remove this line 
        },
    },
    
    ['fs_whtwine'] = {
        text = 'Using Red Wine', --text for progressbar
        duration = 3,          --animation duration in seconds
        anim = {
            dict = 'amb@world_human_drinking@coffee@male@idle_a',
            clip = 'idle_c'
        },
        benefits = {
            stress = 30,  -- stress relif in %
            thirst = 20,    --thirst fill in %
            health = 10,    -- health fill in %
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `prop_drink_whtwine`, 
            pos = vec3(0.06, -0.1, -0.1),
            rot = vec3(100.0, 160.0, 220.0),
            bone = 57005,    --if you donot need to set bone remove this line 
        },
    },
    
    ['fs_rum'] = {
        text = 'Using Red Wine', --text for progressbar
        duration = 3,          --animation duration in seconds
        anim = {
            dict = 'amb@world_human_drinking@coffee@male@idle_a',
            clip = 'idle_c'
        },
        benefits = {
            stress = 30,  -- stress relif in %
            thirst = 20,    --thirst fill in %
            health = 10,    -- health fill in %
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `prop_rum_bottle`, 
            pos = vec3(0.06, -0.13, -0.07),
            rot = vec3(-60.0, 421.0, -10.0),
            bone = 57005,    --if you donot need to set bone remove this line 
        },
    },
    
    ['fs_beer'] = {
        text = 'Using Red Wine', --text for progressbar
        duration = 3,          --animation duration in seconds
        anim = {
            dict = 'amb@world_human_drinking@coffee@male@idle_a',
            clip = 'idle_c'
        },
        benefits = {
            stress = 30,  -- stress relif in %
            thirst = 20,    --thirst fill in %
            health = 10,    -- health fill in %
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `prop_amb_beer_bottle`, 
            pos = vec3(0.13, 0.04, -0.03),
            rot = vec3(-80.0, 120.0, 30.0),
            bone = 57005,    --if you donot need to set bone remove this line 
        },
    },
    
    ['fs_corona1'] = {
        text = 'Drinking Corona', --text for progressbar
        duration = 3,          --progressbar duration in seconds
        anim = {
            dict = 'mp_player_inteat@pnq',
            clip = 'loop'
        },
        benefits = {
           
            stress = 30,  -- stress relif in %
            thirst = 20,    --thirst fill in %
            health = 10,    -- health fill in %
           
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_corona1`, 
            pos = vec3(0.12, -0.06, 0.03),
            rot = vec3(-94.0, -5.0, -11.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        },
    },
    

}
