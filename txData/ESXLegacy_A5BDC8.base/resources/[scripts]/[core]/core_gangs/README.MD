----------------------
--- CORE RESOURCES ---
----------------------

Basic Installation:

* Put core_gangs in resources folder
* Upload sql file on your database
* Add the items in your items.lua (QBCore / ox_inventory) OR in your item database (ESX)
* Read the config file to parameter your framework / inventory script / zone etc.
* Make sure you have qb-target or ox_target script
* Ensure the resource in your server.cfg

Support:

For support join the discord https://discord.gg/EUZ7Yfd8pM
and open a support ticket with your tebex transaction id.

IF YOU USE **QB-INVENTORY / LJ-INVENTORY / PS-INVENTORY** OR any fork of QB-INVENTORY, PLEASE ADD ALL THE CODE BEHIND IN `qb-inventory(lj-inventory / ps-inventory etc.) / server / main.lua` **at the total end** of the file : 

```lua
---------------------------------------------------
--------------- ADDON C8RE GANGS ------------------
--------------------------------------------------- 

---Add an item to the inventory of the player
---@param source number The source of the player
---@param item string The item to add to the inventory
---@param amount? number The amount of the item to add
---@param slot? number The slot to add the item to
---@param info? table Extra info to add onto the item to use whenever you get the item
---@param slots? number of slot of the stash if it s not exist
---@param maxWeight? number of slot of the stash if it s not existmax height of the stash
---@return boolean success Returns true if the item was added, false it the item couldn't be added
local function AddItemIntoStash(stashid, item, amount, slot, info, slots, maxWeight)
	local Stash = Stashes[stashid];
	if not Stash then
		Stashes[stashid] = {}
		
		local items = GetStashItems(stashid)
		if next(items) then
			Stashes[stashid].items = items
		else
			Stashes[stashid].items = {}
		end

		Stashes[stashid].isOpen = false
		Stashes[stashid].label = "Stash-"..stashid
		Stashes[stashid].slot = tonumber(slots) or tonumber(10)
		Stashes[stashid].maxWeight = tonumber(maxWeight) or tonumber(1000000)
	end

	local totalWeight = GetTotalWeight(Stashes[stashid].items)
	local itemInfo = QBCore.Shared.Items[item:lower()]
	if not itemInfo then
		print("^1[ERROR] Item does not exist^7", item:lower())
		return false
	end

	amount = tonumber(amount) or 1
	slot = tonumber(slot) or GetFirstSlotByItem(Stashes[stashid].items, item)
	info = info or {}

	if itemInfo['type'] == 'weapon' then
		info.serie = info.serie or tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
		info.quality = info.quality or 100
	end

	if (slot and Stashes[stashid].items[slot]) and (Stashes[stashid].items[slot].name:lower() == item:lower()) and (itemInfo['type'] == 'item' and not itemInfo['unique']) then
		Stashes[stashid].items[slot].amount = Stashes[stashid].items[slot].amount + amount
		SaveStashItems(stashid, Stashes[stashid].items);
		return true
	elseif not itemInfo['unique'] and slot or slot and Stashes[stashid].items[slot] == nil then
		Stashes[stashid].items[slot] = { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = slot, combinable = itemInfo['combinable'] }
		SaveStashItems(stashid, Stashes[stashid].items);
		return true
	elseif itemInfo['unique'] or (not slot or slot == nil) or itemInfo['type'] == 'weapon' then
		for i = 1, Config.MaxInventorySlots, 1 do -- TO REVIEW
			if Stashes[stashid].items[i] == nil then
				Stashes[stashid].items[i] = { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = i, combinable = itemInfo['combinable'] }
				SaveStashItems(stashid, Stashes[stashid].items);	
				return true
			end
		end
	end
	return false
end

exports("AddItemIntoStash", AddItemIntoStash)

---Remove an item from the inventory of the player
---@param source number The source of the player
---@param item string The item to remove from the inventory
---@param amount? number The amount of the item to remove
---@param slot? number The slot to remove the item from
---@return boolean success Returns true if the item was remove, false it the item couldn't be removed
local function RemoveItemIntoStash(stashid, item, amount, slot, slots, maxWeight)
	local Stash = Stashes[stashid];

	if not Stash then
		Stashes[stashid] = {}
		
		local items = GetStashItems(stashid)
		if next(items) then
			Stashes[stashid].items = items
		else
			Stashes[stashid].items = {}
		end

		Stashes[stashid].isOpen = false
		Stashes[stashid].label = "Stash-"..stashid
		Stashes[stashid].slot = tonumber(slots) or tonumber(10)
		Stashes[stashid].maxWeight = tonumber(maxWeight) or tonumber(1000000)
	end

	amount = tonumber(amount) or 1
	slot = tonumber(slot)

	if slot then
		if Stashes[stashid].items[slot].amount > amount then
			Stashes[stashid].items[slot].amount = Stashes[stashid].items[slot].amount - amount

			SaveStashItems(stashid, Stashes[stashid].items);
			return true

		elseif Stashes[stashid].items[slot].amount == amount then
			Stashes[stashid].items[slot] = nil
			SaveStashItems(stashid, Stashes[stashid].items);
			return true
		end
	else
		local slots = GetSlotsByItem(Stashes[stashid].items, item)
		local amountToRemove = amount

		if not slots then return false end

		for _, _slot in pairs(slots) do
			if Stashes[stashid].items[_slot].amount > amountToRemove then
				Stashes[stashid].items[_slot].amount = Stashes[stashid].items[_slot].amount - amountToRemove
				return true
			elseif Stashes[stashid].items[_slot].amount == amountToRemove then
				Stashes[stashid].items[_slot] = nil
				SaveStashItems(stashid, Stashes[stashid].items);
				return true
			end
		end
	end
	return false
end

exports("RemoveItemIntoStash", RemoveItemIntoStash)

---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
```