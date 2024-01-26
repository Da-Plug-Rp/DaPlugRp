config = config or {}

-- Enable or not discord logs
config.areDiscordLogsActive = true

-- Discord webhook for ALL script logs
config.mainDiscordWebhook = "https://discord.com/api/webhooks/898123492824854529/7xsDCk4s4bk5huNQe2nnhuBmYM_soAoMRgNe7aon2WBdlnTh6ac-y9gRZyOzjysS2baj"

--[[
    Discord webhooks IF YOU WANT TO SEPARATE logs types
    If a log type is set to nil, the log will be sent in config.discordWebhook webhook

    Example: 
    
    -- In this way the invoice_created log will be sent to config.discordWebhook

    config.specificWebhooks = {
        ['invoice_created'] = nil,
    }
    
    -- In this way the invoice_created log will be sent to the specific webhook
    
    config.specificWebhooks = {
        ['invoice_created'] = "https://discord.com/api/webhooks/YOUR_DISCORD_WEBHOOK_HERE",
    }
]]
config.specificWebhooks = {
    ['invoice_created'] = nil,
    ['invoice_paid'] = nil,
    ['not_allowed'] = nil,
}

-- Enables or not the notification when a player pays an invoice for all society members
config.notifyAllEmployeesWhenInvoiceIsPaid = true

-- Hours after the unpaid invoices will be paid automatically (can be nil to disable the feature)
config.hoursBeforeAutoPay = 48

-- Will the money be removed in any case? This will make player bank money negative if the player doesn't have enough money in the bank
config.autoPayForcedMoneyRemoval = true

-- Account used for bills
config.accountUsed = "bank"