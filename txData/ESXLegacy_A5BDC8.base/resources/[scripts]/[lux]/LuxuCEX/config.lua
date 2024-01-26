Config.locale = 'en'

Config.OpenCommand = "cex"  -- Name of the "open" command e.g. /cex will open the crypto exchange
Config.openAnimation = true -- Set to true if you want to play tablet animation when you open the crypto exchange

--[[ Enable Disable Features ]]
Config.EnableFutures = true
Config.EnableMarket = true

--[[ Market Tab ]]
Config.EnableBuy = true
Config.EnableSell = true

---
Config.EnableOpenCommand = true -- Set to false if you don't want players to open the exchange with chat/console commands | Default= true

Config.Debug = false

--- Control how often players will be able to request prices and charts from the server
Config.ServerRequestsDelay = {
      prices = 1000, -- 1 second
      chart = 10000  -- 10 seconds
}

Config.currency = 'EUR'                       -- Change this to custom currency if you want

Config.NoTransferToAlternateCharacters = true -- Set to true if you don't want players to transfer crypto to their other characters | Default = true

-- Buy Sell Fee - Market Only
-- Example, fee = 2%, coin = BTC, price = 1000
-- Buying= When he buy $1000 of btc, the player will receive 0.98 BTC
-- Selling= When he sells 1 BTC he will receive  $980
Config.BnS_Fee = 2 -- 2% | This fee will be charged everytime they buy or sell crypto on the market

-- Taker Fees are essential in Futures trading.
Config.TakerFee = 1.0 -- 0.02% | This is the fee people pay when opening/closing a long/short position in future markets.
