Config = {}

Config.target = false --false will use textui and true will use ox target

Config.Admin = {
    enable = true,
    command = 'dutymenu',
    groups = {
        ['admin'] = true,
        ['mod'] = true
    }
}

Config.DutyPoints = {

    {
        department = 'LSPD',
        jobs = { onduty = 'police', offduty = 'offpolice' },
        ped = {
            coords = vector4(-72.5268, -1820.8704, 26.9421, 230.5248),
            model = 's_m_m_ciasec_01', 
            {spaw = false, id = nil} --donot break it in any case otherwsie script gonna break
        },
    },
    {
        department = 'EMS',
        jobs = { onduty = 'ambulance', offduty = 'offambulance' },
        ped = {
            coords = vector4(-81.5411, -1832.2010, 27.0970, 226.0478),
            model = 's_m_m_doctor_01', 
            {spaw = false, id = nil} --donot touch it in any case otherwise script gonna break
        },
    },




   


}