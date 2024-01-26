-- If you own cs-hall by Critical Scripts, the below config is what I created and used in the video for the Music, Spotlights, Fog, and Bar TV!
-- You can purchase the script from their Tebex @ https://tebex.criticalscripts.shop/package/4517971


-- Gabz Bahama Mama's MLO:

        ['bahama_mamas'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.imgur.com/caUFkXQ.png',
            ['maxVolumePercent'] = 80,
            ['smokeFxMultiplier'] = 5,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 2,
            ['sparklerTimeoutMs'] = 10000,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(-1390.92, -616.56, 30.7),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 28.0,
                                ['max'] = 34.0
                            },
        
                            ['points'] = {
                                vector2(-1393.2956542969, -591.17852783203),
                                vector2(-1412.8685302734, -604.12707519531),
                                vector2(-1393.390625, -635.5615234375),
                                vector2(-1391.7756347656, -636.18267822266),
                                vector2(-1390.1921386719, -635.80145263672),
                                vector2(-1386.5133056641, -633.37365722656),
                                vector2(-1385.4595947266, -632.16204833984),
                                vector2(-1378.9215087891, -627.93719482422),
                                vector2(-1379.4174804688, -626.73046875),
                                vector2(-1379.8040771484, -626.07946777344),
                                vector2(-1376.8967285156, -624.20416259766),
                                vector2(-1379.7535400391, -619.85626220703),
                                vector2(-1379.2469482422, -619.28564453125),
                                vector2(-1372.1070556641, -614.48114013672),
                                vector2(-1371.7408447266, -613.41986083984),
                                vector2(-1371.9544677734, -612.47161865234),
                                vector2(-1374.3500976562, -608.76953125),
                                vector2(-1373.6014404297, -607.71441650391),
                                vector2(-1373.5327148438, -605.79547119141),
                                vector2(-1374.9765625, -604.7919921875),
                                vector2(-1376.7683105469, -605.09027099609),
                                vector2(-1379.4970703125, -601.01477050781),
                                vector2(-1380.7525634766, -600.54827880859),
                                vector2(-1388.9764404297, -605.55206298828),
                                vector2(-1393.4758300781, -598.77935791016),
                                vector2(-1389.8343505859, -596.41625976562),
                                vector2(-1391.2709960938, -593.79638671875)
                            }
                        }
                    }
                } 
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['screens'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-1403.0045, -598.1385, 35.5556),
                    ['rotation'] = nil,
                    ['heading'] = 31.71,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(-1403.0045, -598.1385, 33.5356)
                    }
                }
            },

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,                       
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] =vector3(-1382.9368, -618.2856, 33.3356), 
                    ['rotation'] = nil,
                    ['heading'] = 302.68,
                    ['lodDistance'] = nil,
                    ['color'] = {1, 255, 255}                                      
                },
 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,                        
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1385.8623, -613.6644, 33.3356),
                    ['rotation'] = nil,
                    ['heading'] = 302.68,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 255}                                      
                },
 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,                    
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1388.6615, -609.1795, 33.3356),
                    ['rotation'] = nil,
                    ['heading'] = 302.68,
                    ['lodDistance'] = nil,
                    ['color'] = {1, 255, 255}                                      
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,                    
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1390.2805, -625.6803, 33.3356),
                    ['rotation'] = nil,
                    ['heading'] = 349.11,
                    ['lodDistance'] = nil,
                    ['color'] = {1, 255, 255}                                      
                },
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1377.7495, -608.2741, 30.9565),
                    ['heading'] = 303.45,
                    ['soundOffset'] = vector3(0, 0, 1.7)
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1377.2769, -624.1089, 30.0812),
                    ['heading'] = 257.95,
                    ['soundOffset'] = vector3(0, 0, 1.7)
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1411.3179, -606.7011, 30.5485),
                    ['heading'] = 95.73,
                    ['soundOffset'] = vector3(0, 0, 1.7)
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1391.0099, -596.3868, 29.32),
                    ['heading'] = 266.82,
                    ['soundOffset'] = vector3(0, 0, 1.7)
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1377.9796, -603.175, 29.9461), -- left of DJ booth.
                    ['rotation'] = nil,
                    ['heading'] = 299.15,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1373.1571, -610.601, 29.9517), -- right of DJ booth.
                    ['rotation'] = nil,
                    ['heading'] = 299.15,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1392.7164, -611.5624, 29.7079),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1391.9336, -617.5532, 29.708),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1386.78, -620.6927, 29.7079),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1391.0366, -631.0446, 30.3084),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                }
            }
        },