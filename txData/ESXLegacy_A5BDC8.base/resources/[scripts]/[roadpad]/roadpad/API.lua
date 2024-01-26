Cfg = {}

--REQUIRED

Cfg.PhotoWebhook = 'DISCORD WEBHOOK'


--OPTIONAL
Cfg.ValetWebhook = 'DISCORD WEBHOOK'
Cfg.CryptoWebhook = 'DISCORD WEBHOOK'
Cfg.TwitterWebhook = 'DISCORD WEBHOOK'
Cfg.MailWebhook = 'DISCORD WEBHOOK'
Cfg.TransactionsWebhook = 'DISCORD WEBHOOK'

Cfg.BankPayTax = 0.05 -- 5% tax on bank payments
Cfg.MinimumBankTransfer = 5000 -- Minimum amount of money to be transferred before it gets logged in the bank transactions channel