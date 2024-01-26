ESX = exports.es_extended:getSharedObject()
Webhook = ''

function GetAccountMoney(xPlayer, account)
	local moneyCount = 0
	if account == "money" then
		moneyCount = xPlayer.getAccount('money').money
	else
		moneyCount = xPlayer.getAccount('bank').money
	end
	
	return moneyCount
end

function AddMoney(xPlayer, account, amount)
	xPlayer.addAccountMoney(account, tonumber(amount))
end

function RemoveMoney(xPlayer, account, amount)
	xPlayer.removeAccountMoney(account, tonumber(amount))
end

function MySQLexecute(query, values, func)
	return MySQL.query(query, values, func)
end

function MySQLinsert(query, values, func)
	return MySQL.Async.insert(query, values, func)
end

function MySQLfetchAll(query, values, func)
	return MySQL.query(query, values, func)
end

-- Buy Store Event
ESX.RegisterServerCallback(Config.EventPrefix..':buyStore', function (source, cb, id, name, price, currency)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local PlayerName = getName(_source)
	local bankMoney = GetAccountMoney(xPlayer, currency)
	local vehicles = {}
	local businessPrice = 0

	if bankMoney >= price then
		MySQLfetchAll('SELECT * FROM okokgasstation_stores WHERE owner = @owner', {
			['@owner'] = xPlayer.identifier,
		}, function(owning)

			if #owning < Config.MaxGasStationsPerPlayer then
				for k,v in pairs(Config.Stores) do
					if v.id == id then
						vehicles = v.vehicles
						businessPrice = v.price
					end
				end
				MySQLexecute('UPDATE okokgasstation_stores SET owner = @owner, owner_name = @name, business_price = @business_price, vehicles = @vehicles WHERE store_id = @store_id AND owner IS NULL', {
					['@owner'] = xPlayer.identifier,
					['@name'] = getName(_source),
					['@store_id'] = id,
					['@business_price']	= businessPrice,
					['@vehicles'] = json.encode(vehicles),
				}, function (rowsChanged)
					xPlayer.removeAccountMoney(currency, price)
					TriggerClientEvent(Config.EventPrefix..":updateStoresOwned", -1)
					TriggerClientEvent(Config.EventPrefix..':notification', _source, _okok('bought_store').title, interp(_okok('bought_store').text, {name = name, price = price}), _okok('bought_store').type, _okok('bought_store').time)
					cb(true)
					if Config.UseOkokBanking then
						TriggerEvent('okokBanking:AddNewTransaction', 'Gas Station', 'gasstation', PlayerName, xPlayer.identifier, price, 'Buy Business')
					end
					if Webhook ~= '' and Config.BuyBusinessWebhook then
						local identifierlist = ExtractIdentifiers(_source)
						local data = {
							playerid = _source,
							identifier = identifierlist.license:gsub("license2:", ""),
							discord = "<@"..identifierlist.discord:gsub("discord:", "")..">",
							color = Config.BuyBusinessWebhookColor,
							type = "buyBusiness",
							action = "Bought a business",
							item = id,
							price = price,
							title = "Gas Station - Business",
						}
						discordWebhook(data)
					end
				end)
			else
				TriggerClientEvent(Config.EventPrefix..':notification', _source, _okok('max_stores').title, _okok('max_stores').text, _okok('max_stores').type, _okok('max_stores').time)
			end
		end)
	else
		TriggerClientEvent(Config.EventPrefix..':notification', _source, _okok('not_enough_money').title, _okok('not_enough_money').text, _okok('not_enough_money').type, _okok('not_enough_money').time)
		cb(false)
	end
end)

RegisterServerEvent(Config.EventPrefix..':addBankingTransaction')
AddEventHandler(Config.EventPrefix..':addBankingTransaction', function(price)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	local identifier = Player.identifier
	local PlayerName = getName(src)

    TriggerEvent('okokBanking:AddNewTransaction', 'Gas Station', 'Gas Station', PlayerName, identifier, price, 'Refueling')

end)

RegisterServerEvent(Config.EventPrefix..':UpdateWeaponAmmoMetadata')
AddEventHandler(Config.EventPrefix..':UpdateWeaponAmmoMetadata', function(fuel)
	local src = source
	local jerrycan = exports['qs-inventory']:GetItemByName(source, 'weapon_petrolcan')

	if Config.MetadataInventory == 'qs-inventory' then
		local slot = jerrycan.slot
		jerrycan.info.ammo = fuel

		exports['qs-inventory']:SetItemMetadata(src, slot, jerrycan.info)

	else
		-- Add your setItemMetadata here
	end

end)


-- Webhooks
function discordWebhook(data)
	local information = {}

	if data.type == 'buyBusiness' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Price:** '..data.price..' ' .. Config.Currency .. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'sellBusiness' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Received:** '..data.price..' ' .. Config.Currency .. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'deposit' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Deposited:** '..data.price..' ' .. Config.Currency .. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'withdraw' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Withdrawn:** '..data.price..' ' .. Config.Currency .. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'hire' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee name:** '..data.employee_name..'\n**Employee identifier:** '..data.employee_id..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'fire' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee name:** '..data.employee_name..'\n**Employee identifier:** '..data.employee_id..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'fireMyself' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee name:** '..data.employee_name..'\n**Employee identifier:** '..data.employee_id..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'changeRank' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee Name:** '..data.employee_name..'\n**Employee Identifier:** '..data.employee_id..'\n**Rank:** '..data.rank..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'changeGasPrice' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee Name:** '..data.employee_name..'\n**Employee Identifier:** '..data.employee_id..'\n\n**Old Price:** '..data.oldPrice.. ' ' ..Config.Currency.. '\n**New Price:** '..data.newPrice.. ' ' ..Config.Currency.. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'newOrder' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Vehicle:** '..data.vehicle..'\n**Liters:** '..data.liters..'L\n**Price:** '..data.amount.. ' ' ..Config.Currency.. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'orderAccepted' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee Name:** '..data.employee_name..'\n**Employee Identifier:** '..data.employee_id..'\n\n**Order ID:** '..data.orderID..'\n**Reward:** '..data.amount..' ' ..Config.Currency.. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'orderCanceled' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee Name:** '..data.employee_name..'\n**Employee Identifier:** '..data.employee_id..'\n\n**Order ID:** '..data.orderID..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'saleHistory' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Player Name:** '..data.playerName..'\n**Player Identifier:** '..data.playerID..'\n**Liters:** '..data.liters..'\n\n**Price:** '..data.price..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	end
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end