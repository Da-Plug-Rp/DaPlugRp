Config.useable['eatable'] = {

    ['fs_hotdog'] = {
        text = 'Eating Hotdog', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'mp_player_inteat@burger',
            clip = 'mp_player_int_eat_burger'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_hotdog`, 
            pos = vec3(0.11, 0.04, 0.02),
            rot = vec3(1.0, 14.0, 65.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        },
    },
    
    ['fs_nuget'] = {
        text = 'Eating nuget', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'missheistdockssetup1clipboard@base',
            clip = 'base'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `prop_food_cb_nugets`, 
            pos = vec3(0.07, 0.0, 0.02),
            rot = vec3(0.0, 0.0, 0.0),
           bone = 18905,    --if you donot need to set bone remove this line 
        },
    },


    ['fs_ramen'] = {
        text = 'Eating Ramen', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1',
            clip = 'base_idle'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            {
                model = `fs_prop_ramen`, 
            pos = vec3(0.17, 0.03, 0.09),
            rot = vec3(-60.0, 5.0, 25.0),
           bone = 18905,    --if you donot need to set bone remove this line
            },

            {
           model = `h4_prop_h4_caviar_spoon_01a`, 
            pos = vec3(0.18, 0.07, -0.02),
            rot = vec3(-120.0, 97.0, 20.0),
           bone = 57005,    --if you donot need to set bone remove this line 
            },
        },
    },

    ['fs_ricechicken'] = {
        text = 'Eating ChickenRice', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'missheistdockssetup1clipboard@base',
            clip = 'base'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_ricechicken`, 
            pos = vec3(0.1, 0.0, 0.05),
            rot = vec3(-7.0, -17.0, 0.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    ['fs_cupcake'] = {
        text = 'Eating Cupcake', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'mp_player_inteat@burger',
            clip = 'mp_player_int_eat_burger'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_cupcake`, 
            pos = vec3(0.13, 0.05, 0.02),
            rot = vec3(-113.0, -5.0, -24.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    ['fs_doritos'] = {
        text = 'Eating Doritos', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'mp_player_inteat@pnq',
            clip = 'loop'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_doritos`, 
            pos = vec3(0.1, -0.1, 0.05),
            rot = vec3(-80.0, 108.0, 0.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    ['fs_steak'] = {
        text = 'Eating Steak', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'missheistdockssetup1clipboard@base',
            clip = 'base'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_steak`, 
            pos = vec3(0.13, 0.06, 0.05),
            rot = vec3(-10.0, -11.0, -52.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    ['fs_soup'] = {
        text = 'Eating Soup', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1',
            clip = 'base_idle'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            {
         model = `fs_prop_soup`, 
         pos = vec3(0.15, 0.06, 0.08),
         rot = vec3(-60.0, 5.0, 25.0),
         bone = 18905,    --if you donot need to set bone remove this line
            },

            {
         model = `h4_prop_h4_caviar_spoon_01a`, 
         pos = vec3(0.18, 0.07, -0.02),
         rot = vec3(-120.0, 97.0, 20.0),
         bone = 57005,    --if you donot need to set bone remove this line 
            },
        }, 
    },

    ['fs_rollcake'] = {
        text = 'Eating Rollcake', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'missheistdockssetup1clipboard@base',
            clip = 'base'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_rollcake`, 
            pos = vec3(0.09, 0.0, 0.06),
            rot = vec3(-16.0, 0.0, 87.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    ['fs_lays'] = {
        text = 'Eating Lays', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'mp_player_inteat@pnq',
            clip = 'loop'
        },
        benefits = {
            
            hunger = 30, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_lays`, 
            pos = vec3(0.14, 0.0, 0.06),      -- thek nahi hai.
            rot = vec3(-70.0, 110.0, 0.0),    
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    ['fs_frenchfries'] = {
        text = 'Eating Steak', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'missheistdockssetup1clipboard@base',
            clip = 'base'
        },
        benefits = {
            
            hunger = 10, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `fs_prop_frenchfries`, 
            pos = vec3(0.14, 0.0, 0.01),
            rot = vec3(107.0, 236.0, 84.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    ['fs_chaser'] = {
        text = 'Eating choco', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'mp_player_inteat@burger',
            clip = 'mp_player_int_eat_burger'
        },
        benefits = {
            
            hunger = 10, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `prop_choc_ego`, 
            pos = vec3(0.13, 0.05, 0.02),
            rot = vec3(50.0, 30.0, 260.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    ['fs_meteorite'] = {
        text = 'Eating choco', --text for progressbar
        duration = 5,          --in seconds
        anim = {
            dict = 'mp_player_inteat@burger',
            clip = 'mp_player_int_eat_burger'
        },
        benefits = {
            
            hunger = 10, -- hunger fill in %   
        },
        prop = {    --if u donot need prop remove it whole prop with arrray
            model = `prop_choc_meto`, 
            pos = vec3(0.13, 0.05, 0.02),
            rot = vec3(50.0, 30.0, 260.0),
            bone = 18905,    --if you donot need to set bone remove this line 
        }, 
    },

    
    









}
