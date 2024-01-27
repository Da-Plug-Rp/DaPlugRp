-- SERVER SIDE FILE

DBGSTOCK = {
	{name = "Banane", quantity = 7, sellingprice = 3},
	{name = "Pomme", quantity = 5, sellingprice = 5},
	{name = "Cola", quantity = 17, sellingprice = 4},


}



function GetDatabaseStock()
	local currentStock = {}
	aff("GetDatabaseStock")
	
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystock')
	if r then
		-- aff("r not nil")
		-- if #r > 0 then
			for k,v in pairs(r) do
				-- aff("k: "..tostring(k).." v: "..tostring(v))
				for k1,v1 in pairs(v) do
				-- aff("   k1: "..tostring(k1).." v1: "..tostring(v1))
				
				end
			end
			currentStock = r
		-- end
	else
		-- aff("r nil:"..tostring(r))
	end
	return currentStock
end

function Definesellingprice(Item,Price)
	local priceSet = false
	aff("func Definesellingprice")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystock WHERE name = ?',{Item})
	if r then
		-- aff("r")
		if #r > 0 then
		-- aff("#r > 0")
			-- aff("current price : "..tostring(r[1].sellingprice))
			local newPrice = tostring(Price)
			MySQL.update.await('UPDATE pata_marketshopsandystock SET sellingprice = ? WHERE name = ? ', {Price, Item}, function(affectedRows)
				if affectedRows then
					-- aff("done : "..affectedRows)
				else 
					-- aff("not done")
				end
			end)
			priceSet = true
			-- aff("after mysql")
		else

		end
	else

	end
end

function AddDatabaseStock(Item,Qte)
	local currentStock = {}
	
	-- currentStock = DBGSTOCK
	-- aff("func AddDatabaseStock")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystock WHERE name = ?',{Item})
	if r then
		-- aff("r")
		if #r > 0 then
		-- aff("#r > 0")
			-- aff("current quantity : "..tostring(r[1].quantity))
			local newQte = tonumber(r[1].quantity) + tonumber(Qte)
			MySQL.update.await('UPDATE pata_marketshopsandystock SET quantity = ? WHERE name = ? ', {newQte, Item}, function(affectedRows)
				if affectedRows then
					-- aff("done : "..affectedRows)
				else 
					-- aff("not done")
				end
			end)
			-- aff("after mysql")
		else
			-- aff("#r < 0 ---")
			MySQL.insert('INSERT INTO pata_marketshopsandystock (name, quantity) VALUES (?, ?) ', {Item, Qte}, function(id)
			-- aff("created: "..id)
			end)
		end
	else
		-- aff("r nil")
		MySQL.insert('INSERT INTO pata_marketshopsandystock (name, quantity) VALUES (?, ?) ', {Item, Qte}, function(id)
		-- aff("created: "..id)
		end)
	end
	-- for k,v in pairs(r) do
		-- aff("k: "..tostring(k).." v: "..tostring(v))
	-- end
	-- return currentStock
end

function RemoveDatabaseStock(Item,Qte)
	-- aff("func RemoveDatabaseStock")
	local QteOk = false
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystock WHERE name = ?',{Item})
	if r then
		-- aff("r")
		if #r > 0 then
			-- aff("#r > 0")
			-- aff("current quantity : "..tostring(r[1].quantity))
			
			if tonumber(r[1].quantity) - tonumber(Qte) >= 0 then
				QteOk = true
				local newQte = tonumber(r[1].quantity) - tonumber(Qte)
				MySQL.update.await('UPDATE pata_marketshopsandystock SET quantity = ? WHERE name = ? ', {newQte, Item}, function(affectedRows)
					if affectedRows then
						-- aff("done : "..affectedRows)
					else 
						-- aff("not done")
					end
				end)
				-- aff("after mysql")
			end
		end
	end
	-- aff("QteOk: "..tostring(QteOk))
	return QteOk
end

function RemoveMaxPossibleDatabaseStock(Item,Qte)
	-- aff("func RemoveDatabaseStock")
	local QteRemoved = Qte
	local CountIsOk = false
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystock WHERE name = ?',{Item})
	if r then
		-- aff("r")
		if #r > 0 then
			-- aff("#r > 0")
			-- aff("current quantity : "..tostring(r[1].quantity))
			
			if tonumber(r[1].quantity) - tonumber(Qte) >= 0 then
				-- QteOk = true
				CountIsOk = true
				QteRemoved = Qte
				local newQte = tonumber(r[1].quantity) - tonumber(Qte)
				MySQL.update.await('UPDATE pata_marketshopsandystock SET quantity = ? WHERE name = ? ', {newQte, Item}, function(affectedRows)
					if affectedRows then
						-- aff("done : "..affectedRows)
					else 
						-- aff("not done")
					end
				end)
			else
				CountIsOk = false
				QteRemoved = r[1].quantity
				local newQte = 0
				MySQL.update.await('UPDATE pata_marketshopsandystock SET quantity = ? WHERE name = ? ', {newQte, Item}, function(affectedRows)
					if affectedRows then
						-- aff("done : "..affectedRows)
					else 
						-- aff("not done")
					end
				end)
				-- aff("after mysql")
			end
		end
	end
	-- aff("QteOk: "..tostring(QteOk))
	return QteRemoved, CountIsOk
end

function GetDatabaseStall()
	local currentStall = {}
	
	
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystall')
	if r then
		-- aff("r not nil")
		-- if #r > 0 then
			for k,v in pairs(r) do
				-- aff("k: "..tostring(k).." v: "..tostring(v))
				currentStall[k] = {}
				for k1,v1 in pairs(v) do
				-- aff("   k1: "..tostring(k1).." v1: "..tostring(v1))
					if k1 == "itemIn" then
						temp = convertItemInToLua(v1)
						currentStall[k][k1] = temp
					else
						currentStall[k][k1] = v1
					end
				end
			end
	else
		aff("r nil:"..tostring(r))
	end
	return currentStall
end


function convertItemInToLua(data)
	local tempData = json.decode(data)
	local returnData = {}
	-- aff("--------convertItemInToLua-------- : "..tostring(data))
	if tempData ~= nil then
		for k,v in pairs(tempData) do
			returnData[k] = {}
			-- aff("k: "..tostring(k).." v: "..tostring(v))
			
			for k1,v1 in pairs(v) do
				-- aff("   k1: "..tostring(k1).." v1: "..tostring(v1))
				returnData[k][k1] = v1
			end
		end
	end
	-- aff("----------------")
	return returnData
end

function GetDatabaseSpecificStall(id)
	aff("--------GetDatabaseSpecificStall--------")
	local currentStallData = {}
	local StallId = tonumber(id)
	local itemIn = {}
	local AitemIn = {}
	local BitemIn = {}
	local CitemIn = {}
	local DitemIn = {}
	
	aff("id : "..tostring(id).." type: "..tostring(type(id)).." StallId : "..tostring(StallId))
	
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystall WHERE id = ?',{StallId})
	if r then
		-- aff("r not nil")
		local data = r[1]
		currentStallData = data
		
		AitemIn = convertItemInToLua(data.AitemIn)
		BitemIn = convertItemInToLua(data.BitemIn)
		CitemIn = convertItemInToLua(data.CitemIn)
		DitemIn = convertItemInToLua(data.DitemIn)
		
		ACat = data.AtypeOf
		BCat = data.BtypeOf
		CCat = data.CtypeOf
		DCat = data.DtypeOf
		-- itemIn = {a = AitemIn, b = BitemIn, c = CitemIn,d = DitemIn}
		--local itemIn = json.decode(data.itemIn)
		--currentStallData.itemIn = {}
		---- aff("1------------")
		---- aff(itemIn[1].name)
		-- for k,v in pairs(currentStallData) do
			-- aff("k:"..tostring(k).." v:"..tostring(v))
			-- if type(v) == "table" then
				-- for k1,v1 in pairs(v) do
					-- aff("  k1:"..tostring(k1).." v1:"..tostring(v1.name))
				-- end
			-- end
		-- end
	else
		aff("r nil:"..tostring(r))
	end
	return AitemIn,BitemIn,CitemIn,DitemIn,ACat,BCat,CCat,DCat
end

function GetDatabaseSpecificRegularStall(id)
	aff("--------GetDatabaseSpecificRegularStall--------")
	local currentStallData = {}
	local StallId = tonumber(id)
	local itemIn = {}
	local AitemIn = {}
	local BitemIn = {}
	local CitemIn = {}
	local DitemIn = {}
	
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystallnoconf WHERE id = ?',{StallId})
	if r then
		-- aff("r not nil")
		local data = r[1]
		currentStallData = data
		
		AitemIn = convertItemInToLua(data.AitemIn)
		BitemIn = convertItemInToLua(data.BitemIn)
		CitemIn = convertItemInToLua(data.CitemIn)
		DitemIn = convertItemInToLua(data.DitemIn)
		
		ACat = data.AtypeOf
		BCat = data.BtypeOf
		CCat = data.CtypeOf
		DCat = data.DtypeOf
		-- itemIn = {a = AitemIn, b = BitemIn, c = CitemIn,d = DitemIn}
		--local itemIn = json.decode(data.itemIn)
		--currentStallData.itemIn = {}
		---- aff("1------------")
		---- aff(itemIn[1].name)
		-- for k,v in pairs(currentStallData) do
			-- aff("k:"..tostring(k).." v:"..tostring(v))
			-- if type(v) == "table" then
				-- for k1,v1 in pairs(v) do
					-- aff("  k1:"..tostring(k1).." v1:"..tostring(v1.name))
				-- end
			-- end
		-- end
	else
		aff("r nil:"..tostring(r))
	end
	return AitemIn,BitemIn,CitemIn,DitemIn,ACat,BCat,CCat,DCat
end

function GetDatabaseSpecificFixedStall(id)
	aff("--------GetDatabaseSpecificFixedStall--------")
	local currentStallData = {}
	local StallId = tonumber(id)
	local itemIn = {}
	local DitemIn = {}
	
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystallregnoconf WHERE id = ?',{StallId})
	if r then
		-- aff("r not nil")
		local data = r[1]
		currentStallData = data
		
		itemIn = convertItemInToLua(data.itemIn)
		
		ACat = data.typeOf
		-- itemIn = {a = AitemIn, b = BitemIn, c = CitemIn,d = DitemIn}
		--local itemIn = json.decode(data.itemIn)
		--currentStallData.itemIn = {}
		---- aff("1------------")
		---- aff(itemIn[1].name)
		-- for k,v in pairs(currentStallData) do
			-- aff("k:"..tostring(k).." v:"..tostring(v))
			-- if type(v) == "table" then
				-- for k1,v1 in pairs(v) do
					-- aff("  k1:"..tostring(k1).." v1:"..tostring(v1.name))
				-- end
			-- end
		-- end
	else
		aff("r nil:"..tostring(r))
	end
	return itemIn,ACat
end

function GetStockSpecificRegularStall(id,shelves)
	local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystallnoconf WHERE id = ?',{id})
	aff("GetStockSpecificRegularStall")
	if r then
		aff("r")
		local data = r[1]
		if shelves == "a" or shelves == "A" then
		aff("a")
			itemIn = convertItemInToLua(data.AitemIn)
		elseif shelves == "b" or shelves == "B" then
		aff("b")
			itemIn = convertItemInToLua(data.BitemIn)
		elseif shelves == "c" or shelves == "C" then
		aff("c")
			itemIn = convertItemInToLua(data.CitemIn)
		elseif shelves == "d" or shelves == "D" then
			aff("d")
			itemIn = convertItemInToLua(data.DitemIn)
		end
	end
	return itemIn
end

function GetStockSpecificFixedStall(id)
local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystallregnoconf WHERE id = ?',{id})
	aff("GetStockSpecificFixedStall")
	if r then
		aff("r")
		local data = r[1]
		itemIn = convertItemInToLua(data.itemIn)
	end
	return itemIn
end

function GetStockSpecificStall(id,shelves)
	local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystall WHERE id = ?',{id})
	if r then
		local data = r[1]
		if shelves == "a" or shelves == "A" then
			itemIn = convertItemInToLua(data.AitemIn)
		elseif shelves == "b" or shelves == "B" then
			itemIn = convertItemInToLua(data.BitemIn)
		elseif shelves == "c" or shelves == "C" then
			itemIn = convertItemInToLua(data.CitemIn)
		elseif shelves == "d" or shelves == "D" then
			itemIn = convertItemInToLua(data.DitemIn)
		end
	end
	return itemIn
end

function GetDatabaseSpecificStallConfig(id)
	aff("^GetDatabaseSpecificStallConfig id : ^7"..tostring(id))
	local currentStallData = {}
	-- local StallId = id
	local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystall WHERE id = ?',{id})
	if r then
		-- aff("r not nil")
		for k,v in pairs(r) do
			if v.id == id then
				aff("^8specific stall founded^7")
				local data = v
				
				currentStallData[k] = data
				currentStallData[k].AitemIn = convertItemInToLua(data.AitemIn)
				currentStallData[k].BitemIn = convertItemInToLua(data.BitemIn)
				currentStallData[k].CitemIn = convertItemInToLua(data.CitemIn)
				currentStallData[k].DitemIn = convertItemInToLua(data.DitemIn)
			end
		end
	end
	aff("^1-------------------------------^7")
	return currentStallData
end

function GetDatabaseSpecificRegularStallConfig(id)
	aff("^GetDatabaseSpecificStallConfig id : ^7"..tostring(id))
	local currentStallData = {}
	-- local StallId = id
	local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystallnoconf WHERE id = ?',{id})
	if r then
		-- aff("r not nil")
		for k,v in pairs(r) do
			if v.id == id then
				aff("^8specific stall founded^7")
				local data = v
				
				currentStallData[k] = data
				currentStallData[k].AitemIn = convertItemInToLua(data.AitemIn)
				currentStallData[k].BitemIn = convertItemInToLua(data.BitemIn)
				currentStallData[k].CitemIn = convertItemInToLua(data.CitemIn)
				currentStallData[k].DitemIn = convertItemInToLua(data.DitemIn)
			end
		end
	end
	aff("^1-------------------------------^7")
	return currentStallData
end

function GetDatabaseSpecificFixedStallConfig(id)
	aff("^GetDatabaseSpecificStallConfig id : ^7"..tostring(id))
	local currentStallData = {}
	-- local StallId = id
	local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystallregnoconf WHERE id = ?',{id})
	if r then
		-- aff("r not nil")
		for k,v in pairs(r) do
			if v.id == id then
				aff("^8specific stall founded^7")
				local data = v
				
				currentStallData[k] = data
				currentStallData[k].itemIn = convertItemInToLua(data.itemIn)
			end
		end
	end
	aff("^1-------------------------------^7")
	return currentStallData
end

function GetDatabaseAllStallConfig(id)
	aff("^1GetDatabaseAllStallConfig^7")
	local currentStallData = {}
	-- local StallId = id
	local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystall')
	if r then
		-- aff("r not nil")
		for k,v in pairs(r) do
			local data = v
			
			currentStallData[k] = data
			currentStallData[k].AitemIn = convertItemInToLua(data.AitemIn)
			currentStallData[k].BitemIn = convertItemInToLua(data.BitemIn)
			currentStallData[k].CitemIn = convertItemInToLua(data.CitemIn)
			currentStallData[k].DitemIn = convertItemInToLua(data.DitemIn)
		end
	end
	aff("^1-------------------------------^7")
	return currentStallData
end

function GetDatabaseAllFixedStallConfig(id)
	aff("^1GetDatabaseAllFixedStallConfig^7")
	local currentStallData = {}
	-- local StallId = id
	local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystallregnoconf')
	if r then
		-- aff("r not nil")
		for k,v in pairs(r) do
			local data = v
			currentStallData[k] = data
			currentStallData[k].itemIn = convertItemInToLua(data.itemIn)
			-- currentStallData[k].itemIn = convertItemInToLua(data.itemIn)
		end
	end
	aff("^1-------------------------------^7")
	return currentStallData
end

function GetDatabaseAllRegularStallConfig(id)
	aff("^1GetDatabaseAllRegularStallConfig^7")
	local currentStallData = {}
	-- local StallId = id
	local itemIn = {}
	local r = MySQL.Sync.fetchAll('SELECT * FROM pata_marketshopsandystallnoconf')
	if r then
		-- aff("r not nil")
		for k,v in pairs(r) do
			local data = v
			currentStallData[k] = data
			currentStallData[k].AitemIn = convertItemInToLua(data.AitemIn)
			currentStallData[k].BitemIn = convertItemInToLua(data.BitemIn)
			currentStallData[k].CitemIn = convertItemInToLua(data.CitemIn)
			currentStallData[k].DitemIn = convertItemInToLua(data.DitemIn)
			-- currentStallData[k].itemIn = convertItemInToLua(data.itemIn)
		end
	end
	aff("^1-------------------------------^7")
	return currentStallData
end

function DefineDatabaseStall(StallData,param)
	
	local StallId = StallData.AisleId
	-- currentStock = DBGSTOCK
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystall WHERE id = ?',{StallId})
	if r then
		-- aff("r")
		if #r > 0 then
		-- aff("#r > 0")

			local stallModel = string.lower(tostring(StallData.AisleSize))
			local stallType = string.lower(tostring(StallData.AisleColor))
			-- aff("Maj of Aisle: "..tostring(StallId).." "..stallModel.." "..stallType)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET color = ?, sizeOf = ? WHERE id = ? ', {stallType,stallModel, StallId}, function(affectedRows)
				if affectedRows then
					aff("done : "..affectedRows)
				else 
					aff("not done")
				end
			end)

			-- aff("after mysql")
		else

		end
	else

	end
end



function DefineDatabaseSpecificStall(StallId,model,typeOf,whichOne)
	
	-- local StallId = StallData.id
	-- currentStock = DBGSTOCK
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystall WHERE id = ?',{StallId})
	if r then
		-- aff("r")
		if #r > 0 then
		-- aff("#r > 0")
			local isAdrink = false
			
			if LargeBottleStallType[typeOf] ~= nil then 
				isAdrink = true 
				aff("isAdrink !!")
			else
				aff("is not Adrink ")
				
			end
			local stallModel = string.lower(tostring(model))
			local stallType = string.lower(tostring(typeOf))
			if isAdrink then
				if stallModel == "large" then stallModel = "bottlelarge" end
				if stallModel == "medium" then stallModel = "bottlemedium" end
			end
			if whichOne == "a" then
				MySQL.update.await('UPDATE pata_marketshopsandystall SET AtypeOf = ?, Amodel = ? WHERE id = ? ', {stallType,stallModel, StallId}, function(affectedRows)
					if affectedRows then
						aff("done : "..affectedRows)
					else 
						aff("not done")
					end
				end)
			elseif whichOne == "b" then
				MySQL.update.await('UPDATE pata_marketshopsandystall SET BtypeOf = ?, Bmodel = ? WHERE id = ? ', {stallType,stallModel, StallId}, function(affectedRows)
					if affectedRows then
						aff("done : "..affectedRows)
					else 
						aff("not done")
					end
				end)
			elseif whichOne == "c" then
				MySQL.update.await('UPDATE pata_marketshopsandystall SET CtypeOf = ?, Cmodel = ? WHERE id = ? ', {stallType,stallModel, StallId}, function(affectedRows)
					if affectedRows then
						aff("done : "..affectedRows)
					else 
						aff("not done")
					end
				end)
			elseif whichOne == "d" then
				MySQL.update.await('UPDATE pata_marketshopsandystall SET DtypeOf = ?, Dmodel = ? WHERE id = ? ', {stallType,stallModel, StallId}, function(affectedRows)
					if affectedRows then
						aff("done : "..affectedRows)
					else 
						aff("not done")
					end
				end)
			end
			
			
			
			
			-- aff("after mysql")
		else

		end
	else

	end
end

function DefineDatabaseSpecificRegularStall(StallId,typeOf,whichOne)
	
	-- local StallId = StallData.id
	-- currentStock = DBGSTOCK
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallnoconf WHERE id = ?',{StallId})
	if r then
		-- aff("r")
		if #r > 0 then
		-- aff("#r > 0")
			
			-- local stallModel = string.lower(tostring(model))
			local stallType = string.lower(tostring(typeOf))
			-- if typeOf == "drink" then
				-- if stallModel == "large" then stallModel = "bottlelarge" end
				-- if stallModel == "medium" then stallModel = "bottlemedium" end
			-- end
			if whichOne == "a" then
				MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET AtypeOf = ? WHERE id = ? ', {stallType, StallId}, function(affectedRows)
					if affectedRows then
						aff("done : "..affectedRows)
					else 
						aff("not done")
					end
				end)
			elseif whichOne == "b" then
				MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET BtypeOf = ? WHERE id = ? ', {stallType, StallId}, function(affectedRows)
					if affectedRows then
						aff("done : "..affectedRows)
					else 
						aff("not done")
					end
				end)
			elseif whichOne == "c" then
				MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET CtypeOf = ? WHERE id = ? ', {stallType, StallId}, function(affectedRows)
					if affectedRows then
						aff("done : "..affectedRows)
					else 
						aff("not done")
					end
				end)
			elseif whichOne == "d" then
				MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET DtypeOf = ? WHERE id = ? ', {stallType, StallId}, function(affectedRows)
					if affectedRows then
						aff("done : "..affectedRows)
					else 
						aff("not done")
					end
				end)
			end
			
			
			
			
			-- aff("after mysql")
		else

		end
	else

	end
end

function DefineDatabaseSpecificFixedStall(StallId,typeOf)
	
	-- local StallId = StallData.id
	-- currentStock = DBGSTOCK
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallregnoconf WHERE id = ?',{StallId})
	if r then
		aff("r")
		if #r > 0 then
		aff("#r > 0")
			
			-- local stallModel = string.lower(tostring(model))
			local stallType = string.lower(tostring(typeOf))

			MySQL.update.await('UPDATE pata_marketshopsandystallregnoconf SET typeOf = ? WHERE id = ? ', {stallType, StallId}, function(affectedRows)
				if affectedRows then
					aff("done : "..affectedRows)
				else 
					aff("not done")
				end
			end)
			aff("after mysql")
		else

		end
	else

	end
end

function AddItemDatabaseStall(id,itemData,shelves)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local alreadyIn = false
	-- currentStock = DBGSTOCK
	-- itemIn = { 
				-- [1]={id=1, name="Pomme",  qte="50"},
				-- [2]={id=2, name="Banane", qte="10"},
				-- [3]={id=3, name="Poire",  qte="3",},
				-- [4]={id=4, name="Peche",  qte="37"},
				-- [5]={id=5, name="Raisin", qte="23"},
			-- }
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystall WHERE id = ?',{StallId})
	if r then
		-- aff("ok")
		
		if shelves == "a" or shelves == "A" then
			local currentStock = json.decode(r[1].AitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						local tempQte = currentStock[k].qte + qte
						currentStock[k].qte = tempQte
						alreadyIn = true
						break;
					end
				end
				if not alreadyIn then
					local currentIndex = #currentStock+1
					currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
				end
			else
				currentStock = {}
				currentStock[1] = {id = 1, qte = qte, name = name}
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET AitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "b" or shelves == "B" then
			local currentStock = json.decode(r[1].BitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						local tempQte = currentStock[k].qte + qte
						currentStock[k].qte = tempQte
						alreadyIn = true
						break;
					end
				end
				if not alreadyIn then
					local currentIndex = #currentStock+1
					currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
				end
			else
				currentStock = {}
				currentStock[1] = {id = 1, qte = qte, name = name}
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET BitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "c" or shelves == "C" then
			local currentStock = json.decode(r[1].CitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						local tempQte = currentStock[k].qte + qte
						currentStock[k].qte = tempQte
						alreadyIn = true
						break;
					end
				end
				if not alreadyIn then
					local currentIndex = #currentStock+1
					currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
				end
			else
				currentStock = {}
				currentStock[1] = {id = 1, qte = qte, name = name}
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET CitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "d" or shelves == "D" then
			local currentStock = json.decode(r[1].DitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						local tempQte = currentStock[k].qte + qte
						currentStock[k].qte = tempQte
						alreadyIn = true
						break;
					end
				end
				if not alreadyIn then
					local currentIndex = #currentStock+1
					currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
				end
			else
				currentStock = {}
				currentStock[1] = {id = 1, qte = qte, name = name}
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET DitemIn = ? WHERE id = ? ', {temp, StallId})
		end
		
		
	end
end

function AddItemDatabaseRegularStall(id,itemData,shelves)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local alreadyIn = false
	-- currentStock = DBGSTOCK
	-- itemIn = { 
				-- [1]={id=1, name="Pomme",  qte="50"},
				-- [2]={id=2, name="Banane", qte="10"},
				-- [3]={id=3, name="Poire",  qte="3",},
				-- [4]={id=4, name="Peche",  qte="37"},
				-- [5]={id=5, name="Raisin", qte="23"},
			-- }
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallnoconf WHERE id = ?',{StallId})
	if r then
		-- aff("ok")
		
		if shelves == "a"  or shelves == "A" then
			local currentStock = json.decode(r[1].AitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						local tempQte = currentStock[k].qte + qte
						currentStock[k].qte = tempQte
						alreadyIn = true
						break;
					end
				end
				if not alreadyIn then
					local currentIndex = #currentStock+1
					currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
				end
			else
				currentStock = {}
				currentStock[1] = {id = 1, qte = qte, name = name}
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET AitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "b" or shelves == "B" then
			local currentStock = json.decode(r[1].BitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						local tempQte = currentStock[k].qte + qte
						currentStock[k].qte = tempQte
						alreadyIn = true
						break;
					end
				end
				if not alreadyIn then
					local currentIndex = #currentStock+1
					currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
				end
			else
				currentStock = {}
				currentStock[1] = {id = 1, qte = qte, name = name}
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET BitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "c" or shelves == "C" then
			local currentStock = json.decode(r[1].CitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						local tempQte = currentStock[k].qte + qte
						currentStock[k].qte = tempQte
						alreadyIn = true
						break;
					end
				end
				if not alreadyIn then
					local currentIndex = #currentStock+1
					currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
				end
			else
				currentStock = {}
				currentStock[1] = {id = 1, qte = qte, name = name}
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET CitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "d" or shelves == "D" then
			local currentStock = json.decode(r[1].DitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						local tempQte = currentStock[k].qte + qte
						currentStock[k].qte = tempQte
						alreadyIn = true
						break;
					end
				end
				if not alreadyIn then
					local currentIndex = #currentStock+1
					currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
				end
			else
				currentStock = {}
				currentStock[1] = {id = 1, qte = qte, name = name}
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET DitemIn = ? WHERE id = ? ', {temp, StallId})
		end
		
		
	end
end

function AddItemDatabaseFixedStall(id,itemData)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local alreadyIn = false
	-- currentStock = DBGSTOCK
	-- itemIn = { 
				-- [1]={id=1, name="Pomme",  qte="50"},
				-- [2]={id=2, name="Banane", qte="10"},
				-- [3]={id=3, name="Poire",  qte="3",},
				-- [4]={id=4, name="Peche",  qte="37"},
				-- [5]={id=5, name="Raisin", qte="23"},
			-- }
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallregnoconf WHERE id = ?',{StallId})
	if r then
		-- aff("ok")
		
		local currentStock = json.decode(r[1].itemIn)
		if currentStock then
			for k,v in pairs(currentStock) do
				if v.name == name then
					local tempQte = currentStock[k].qte + qte
					currentStock[k].qte = tempQte
					alreadyIn = true
					break;
				end
			end
			if not alreadyIn then
				local currentIndex = #currentStock+1
				currentStock[currentIndex] = {id = currentIndex, qte = qte, name = name}
			end
		else
			currentStock = {}
			currentStock[1] = {id = 1, qte = qte, name = name}
		end
		temp = json.encode(currentStock)
		MySQL.update.await('UPDATE pata_marketshopsandystallregnoconf SET itemIn = ? WHERE id = ? ', {temp, StallId})
		
		
		
	end
end

function RemoveItemDatabaseStall(id,itemData,shelves,removeFromStall)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	-- currentStock = DBGSTOCK
	-- itemIn = { 
				-- [1]={id=1, name="Pomme",  qte="50"},
				-- [2]={id=2, name="Banane", qte="10"},
				-- [3]={id=3, name="Poire",  qte="3",},
				-- [4]={id=4, name="Peche",  qte="37"},
				-- [5]={id=5, name="Raisin", qte="23"},
			-- }
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystall WHERE id = ?',{StallId})
	if r then
		-- aff("ok")
		
		if shelves == "a" or shelves == "A" then
			local currentStock = json.decode(r[1].AitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						table.remove(currentStock,k)
					end
				end
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET AitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "b" or shelves == "B" then
			local currentStock = json.decode(r[1].BitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						table.remove(currentStock,k)
					end
				end
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET BitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "c" or shelves == "C" then
			local currentStock = json.decode(r[1].CitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						table.remove(currentStock,k)
					end
				end
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET CitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "d" or shelves == "D" then
			local currentStock = json.decode(r[1].DitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						table.remove(currentStock,k)
					end
				end
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystall SET DitemIn = ? WHERE id = ? ', {temp, StallId})
		end
		
		
	end
end


function RemoveItemDatabaseRegularStall(id,itemData,shelves,removeFromStall)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	-- currentStock = DBGSTOCK
	-- itemIn = { 
				-- [1]={id=1, name="Pomme",  qte="50"},
				-- [2]={id=2, name="Banane", qte="10"},
				-- [3]={id=3, name="Poire",  qte="3",},
				-- [4]={id=4, name="Peche",  qte="37"},
				-- [5]={id=5, name="Raisin", qte="23"},
			-- }
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallnoconf WHERE id = ?',{StallId})
	if r then
		-- aff("ok")
		
		if shelves == "a" or shelves == "A" then
			local currentStock = json.decode(r[1].AitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						table.remove(currentStock,k)
					end
				end
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET AitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "b" or shelves == "B" then
			local currentStock = json.decode(r[1].BitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						table.remove(currentStock,k)
					end
				end
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET BitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "c" or shelves == "C" then
			local currentStock = json.decode(r[1].CitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						table.remove(currentStock,k)
					end
				end
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET CitemIn = ? WHERE id = ? ', {temp, StallId})
		elseif shelves == "d" or shelves == "D" then
			local currentStock = json.decode(r[1].DitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						table.remove(currentStock,k)
					end
				end
			end
			temp = json.encode(currentStock)
			MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET DitemIn = ? WHERE id = ? ', {temp, StallId})
		end
		
		
	end
end

function RemoveItemDatabaseFixedStall(id,itemData,removeFromStall)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	-- currentStock = DBGSTOCK
	-- itemIn = { 
				-- [1]={id=1, name="Pomme",  qte="50"},
				-- [2]={id=2, name="Banane", qte="10"},
				-- [3]={id=3, name="Poire",  qte="3",},
				-- [4]={id=4, name="Peche",  qte="37"},
				-- [5]={id=5, name="Raisin", qte="23"},
			-- }
	-- aff("func DefineDatabaseStall")
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallregnoconf WHERE id = ?',{StallId})
	if r then
		-- aff("ok")
		
		local currentStock = json.decode(r[1].itemIn)
		if currentStock then
			for k,v in pairs(currentStock) do
				if v.name == name then
					table.remove(currentStock,k)
				end
			end
		end
		temp = json.encode(currentStock)
		MySQL.update.await('UPDATE pata_marketshopsandystallregnoconf SET itemIn = ? WHERE id = ? ', {temp, StallId})
	
		
		
	end
end

function RemoveSpecificQteItemDatabaseStall(id,itemData,shelves)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local Removed = false
	aff("RemoveSpecificQteItemDatabaseStall id:"..tostring(id).." name: "..tostring(name).." qte:"..tostring(qte).." shelves:"..tostring(shelves))

	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystall WHERE id = ?',{StallId})
	if r then
		if shelves == "a" or shelves == "A" then
			local currentStock = json.decode(r[1].AitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						if tonumber(v.qte) >= tonumber(qte) then 
							-- table.remove(currentStock,k)
							aff("Stock set")
							currentStock[k].qte = v.qte - qte
							temp = json.encode(currentStock)
							MySQL.update.await('UPDATE pata_marketshopsandystall SET AitemIn = ? WHERE id = ? ', {temp, StallId})
							Removed = true
							break;
						else
							-- aff("not enough stock")
						end
					end
				end
			end
		elseif shelves == "b" or shelves == "B" then
			local currentStock = json.decode(r[1].BitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						if tonumber(v.qte) >= tonumber(qte) then 
							-- table.remove(currentStock,k)
							aff("Stock set")
							currentStock[k].qte = v.qte - qte
							temp = json.encode(currentStock)
							MySQL.update.await('UPDATE pata_marketshopsandystall SET BitemIn = ? WHERE id = ? ', {temp, StallId})
							Removed = true
							break;
						else
							-- aff("not enough stock")
						end
					end
				end
			end
		elseif shelves == "c" or shelves == "C" then
			local currentStock = json.decode(r[1].CitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						if tonumber(v.qte) >= tonumber(qte) then 
							-- table.remove(currentStock,k)
							aff("Stock set")
							currentStock[k].qte = v.qte - qte
							temp = json.encode(currentStock)
							MySQL.update.await('UPDATE pata_marketshopsandystall SET CitemIn = ? WHERE id = ? ', {temp, StallId})
							Removed = true
							break;
						else
							-- aff("not enough stock")
						end
					end
				end
			end
		elseif shelves == "d" or shelves == "D" then
			local currentStock = json.decode(r[1].DitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						if tonumber(v.qte) >= tonumber(qte) then 
							-- table.remove(currentStock,k)
							aff("Stock set")
							currentStock[k].qte = v.qte - qte
							temp = json.encode(currentStock)
							MySQL.update.await('UPDATE pata_marketshopsandystall SET DitemIn = ? WHERE id = ? ', {temp, StallId})
							Removed = true
							break;
						else
							-- aff("not enough stock")
						end
					end
				end
			end
		end
	end
	return Removed
end

function RemoveSpecificQteItemDatabaseRegularStall(id,itemData,shelves)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local Removed = false
	aff("RemoveSpecificQteItemDatabaseRegularStall id:"..tostring(id).." name: "..tostring(name).." qte:"..tostring(qte).." shelves:"..tostring(shelves))

	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallnoconf WHERE id = ?',{StallId})
	if r then
		if shelves == "a" or shelves == "A" then
			local currentStock = json.decode(r[1].AitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						if tonumber(v.qte) >= tonumber(qte) then 
							-- table.remove(currentStock,k)
							aff("Stock set")
							currentStock[k].qte = v.qte - qte
							temp = json.encode(currentStock)
							MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET AitemIn = ? WHERE id = ? ', {temp, StallId})
							Removed = true
							break;
						else
							-- aff("not enough stock")
						end
					end
				end
			end
		elseif shelves == "b" or shelves == "B" then
			local currentStock = json.decode(r[1].BitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						if tonumber(v.qte) >= tonumber(qte) then 
							-- table.remove(currentStock,k)
							aff("Stock set")
							currentStock[k].qte = v.qte - qte
							temp = json.encode(currentStock)
							MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET BitemIn = ? WHERE id = ? ', {temp, StallId})
							Removed = true
							break;
						else
							-- aff("not enough stock")
						end
					end
				end
			end
		elseif shelves == "c" or shelves == "C" then
			local currentStock = json.decode(r[1].CitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						if tonumber(v.qte) >= tonumber(qte) then 
							-- table.remove(currentStock,k)
							aff("Stock set")
							currentStock[k].qte = v.qte - qte
							temp = json.encode(currentStock)
							MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET CitemIn = ? WHERE id = ? ', {temp, StallId})
							Removed = true
							break;
						else
							-- aff("not enough stock")
						end
					end
				end
			end
		elseif shelves == "d" or shelves == "D" then
			local currentStock = json.decode(r[1].DitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						if tonumber(v.qte) >= tonumber(qte) then 
							-- table.remove(currentStock,k)
							aff("Stock set")
							currentStock[k].qte = v.qte - qte
							temp = json.encode(currentStock)
							MySQL.update.await('UPDATE pata_marketshopsandystallnoconf SET DitemIn = ? WHERE id = ? ', {temp, StallId})
							Removed = true
							break;
						else
							-- aff("not enough stock")
						end
					end
				end
			end
		end
	end
	return Removed
end


function RemoveSpecificQteItemDatabaseFixedStall(id,itemData)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local Removed = false
	aff("RemoveSpecificQteItemDatabaseFixedStall id:"..tostring(id).." name: "..tostring(name).." qte:"..tostring(qte))
	
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallregnoconf WHERE id = ?',{StallId})
	if r then
		local currentStock = json.decode(r[1].itemIn)
		if currentStock then
			for k,v in pairs(currentStock) do
				if v.name == name then
					if tonumber(v.qte) >= tonumber(qte) then 
						-- table.remove(currentStock,k)
						aff("Stock set")
						currentStock[k].qte = v.qte - qte
						temp = json.encode(currentStock)
						MySQL.update.await('UPDATE pata_marketshopsandystallregnoconf SET itemIn = ? WHERE id = ? ', {temp, StallId})
						Removed = true
						break;
					else
						-- aff("not enough stock")
					end
				end
			end
		end

	end
	return Removed
end

function DoesConfigurableStallHaveItem(id,itemData,shelves)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local curQTE = -1
	local HaveIt = false
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystall WHERE id = ?',{StallId})
	if r then
		if shelves == "a" or shelves == "A" then
			local currentStock = json.decode(r[1].AitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						curQTE = v.qte
						HaveIt = true
						break;
					end
				end
			end
		elseif shelves == "b" or shelves == "B" then
			local currentStock = json.decode(r[1].BitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						curQTE = v.qte
						HaveIt = true
						break;
					end
				end
			end
		elseif shelves == "c" or shelves == "C" then
			local currentStock = json.decode(r[1].CitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						curQTE = v.qte
						HaveIt = true
						break;
					end
				end
			end
		elseif shelves == "d" or shelves == "D" then
			local currentStock = json.decode(r[1].DitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					if v.name == name then
						curQTE = v.qte
						HaveIt = true
						break;
					end
				end
			end
		end
	end
	return curQTE, HaveIt
end

function DoesRegularStallHaveItem(id,itemData,shelves)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local curQTE = -1
	local HaveIt = false
	aff("DoesRegularStallHaveItem id : "..tostring(StallId).." shelves: "..tostring(shelves).." name: "..tostring(name).. " qte: "..tostring(qte))
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallnoconf WHERE id = ?',{StallId})
	if r then
		aff("r : "..tostring(r))
		if shelves == "a" or shelves == "A" then
			local currentStock = json.decode(r[1].AitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					aff("A k : "..tostring(k).." v: "..tostring(v))
					if v.name == name then
						curQTE = v.qte
						HaveIt = true
						break;
					end
				end
			end
		elseif shelves == "b" or shelves == "B" then
			local currentStock = json.decode(r[1].BitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					aff("B k : "..tostring(k).." v: "..tostring(v))
					if v.name == name then
						curQTE = v.qte
						HaveIt = true
						break;
					end
				end
			end
		elseif shelves == "c" or shelves == "C" then
			local currentStock = json.decode(r[1].CitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					aff("C k : "..tostring(k).." v: "..tostring(v))
					if v.name == name then
						curQTE = v.qte
						HaveIt = true
						break;
					end
				end
			end
		elseif shelves == "d" or shelves == "D" then
			local currentStock = json.decode(r[1].DitemIn)
			if currentStock then
				for k,v in pairs(currentStock) do
					aff("D k : "..tostring(k).." v: "..tostring(v))
					if v.name == name then
						curQTE = v.qte
						HaveIt = true
						break;
					end
				end
			end
		end
	end
	return curQTE, HaveIt
end

function DoesFixedStallHaveItem(id,itemData)
	local StallId = id
	local name = itemData.name
	local qte = itemData.qte
	local curQTE = -1
	local HaveIt = false
	local r = MySQL.Sync.fetchAll('SELECT * from pata_marketshopsandystallregnoconf WHERE id = ?',{StallId})
	if r then
		local currentStock = json.decode(r[1].itemIn)
		if currentStock then
			for k,v in pairs(currentStock) do
				if v.name == name then
					curQTE = v.qte
					HaveIt = true
					break;
				end
			end
		end
	end
	return curQTE, HaveIt
end
-- function DoesStockHaveItem(item,qte)
	

-- end







-- TriggerServerEvent("marketShopSandy:TakePutInStock",item,action,qte)





if ENABLECOMMAND == true then

RegisterCommand('AddDatabaseStock', function(source)
	aff("command")
	AddDatabaseStock("Pomme",5)
	-- TriggerServerEvent("marketShopSandy:GetStockDetails")
	-- TriggerEvent("marketShopSandy:OpenUi","Close")
end)

RegisterCommand('GetDatabaseStock', function(source)
	GetDatabaseStock()
	-- TriggerServerEvent("marketShopSandy:GetStockDetails")
	-- TriggerEvent("marketShopSandy:OpenUi","Close")
end)

RegisterCommand('RemoveDatabaseStock', function(source)
	RemoveDatabaseStock("Pomme",5)
	-- TriggerServerEvent("marketShopSandy:GetStockDetails")
	-- TriggerEvent("marketShopSandy:OpenUi","Close")
end)

RegisterCommand('Definesellingprice', function(source)
	Definesellingprice("Pomme",125.5)
	-- TriggerServerEvent("marketShopSandy:GetStockDetails")
	-- TriggerEvent("marketShopSandy:OpenUi","Close")
end)

RegisterCommand('GetDatabaseSpecificStall', function(source)
	local t = GetDatabaseSpecificStall(1)
	-- TriggerServerEvent("marketShopSandy:GetStockDetails")
	-- TriggerEvent("marketShopSandy:OpenUi","Close")
end)

RegisterCommand('GetDatabaseAllStall', function()
	local player = source
	local t = GetDatabaseAllStallConfig()
	
	TriggerClientEvent("marketShopSandy:SendAllStallConfig",player,t)
	-- TriggerServerEvent("marketShopSandy:GetStockDetails")
	-- TriggerEvent("marketShopSandy:OpenUi","Close")
end)

RegisterCommand('AddItemDatabaseStall', function(source)
	item = {name = "Pomme",qte=5}
	local t = AddItemDatabaseStall(1,item,"c")
	-- TriggerServerEvent("marketShopSandy:GetStockDetails")
	-- TriggerEvent("marketShopSandy:OpenUi","Close")
end)

RegisterCommand('GetDatabaseStall', function(source)
	-- item = {name = "Pomme",qte=5}
	local t = GetDatabaseStall()
	-- TriggerServerEvent("marketShopSandy:GetStockDetails")
	-- TriggerEvent("marketShopSandy:OpenUi","Close")
end)
end