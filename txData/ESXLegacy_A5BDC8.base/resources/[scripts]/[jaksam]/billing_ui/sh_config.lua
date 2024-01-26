config = config or {}

config.locale = "en"

--[[
    Is billing mode enabled just for certain jobs or for everyone?
    If set to false, everyone will be able to send invoices, otherwise only specific jobs can send invoices
    Also, if set to true player won't be able to choose "You will receive money" option in billing menu
    NOTE: If using Jobs Creator, this option will be ignored
]]
config.exclusiveBilling = false

--[[
    if config.exclusiveBilling = true, which jobs should be able to use billing mode?
    NOTE: If using Jobs Creator, this option will be ignored
]]
config.jobs = {
    ['police'] = true,
    ['ambulance'] = true,
    ['mechanic'] = true,
}

-- Define here the job society name, if you don't define a job here, it will be society_jobname default
config.societies = {
    -- Just some examples
    --['police'] = 'society_police',
    --['ambulance'] = 'society_ambulance',
    --['mechanic'] = 'society_mechanic',
}

-- Jobs that can also check unpaid invoices of other players
config.jobsAllowedToCheckUnpaidBills = {
    ['police'] = true,
    ['sheriff'] = true,
    ['fbi'] = true,
}

-- Jobs that can delete all the unpaid invoices of other players (the job must also be in config.jobsAllowedToCheckUnpaidBills)
config.jobsAllowedToDeleteUnpaidBills = {
    ['police'] = true,
    ['sheriff'] = true,
    ['fbi'] = true,
}

-- Maximum amount that can have a billing
config.maxAmount = 10000000

-- Maximum characters that can have a billing in reason
config.maxReasonCharacter = 50