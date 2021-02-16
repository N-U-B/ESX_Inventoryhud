--------------------------Esx inventory---------------------
 --Re-done by TRP with added functions and functional hot-bar--
-------------------------------------------------------------
-------------------Any questions please message me------------
-------------------------nub@tassierp.com--------------------------------------
-----------------------Please feel free to use this how you please--------------------- 
local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---------------------------------------------------------------------------
--- Get's Character Information                                         ---
---------------------------------------------------------------------------
function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			phone_number = identity['phone_number'],
		    name = identity['name'],
		}
	else
		return nil
	end
end

ESX.RegisterServerCallback(
	"esx_inventoryhud:getPlayerInventory",
	function(source, cb, target)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if targetXPlayer ~= nil then
			cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		else
			cb(nil)
		end
	end
)

RegisterServerEvent("esx_inventoryhud:tradePlayerItem")
AddEventHandler("esx_inventoryhud:tradePlayerItem", function(from, target, type, itemName, itemCount)
local src = from
local src1 = target
local peepee = 'Hacker Triggering Events or Victim having events triggered to steal items or give items'
	TriggerClientEvent('esx:ScreenshotAC', src, src, peepee)
	TriggerClientEvent('esx:ScreenshotAC', target, target, peepee)
end)

RegisterServerEvent("esx:core:PWNED")
AddEventHandler("esx:core:PWNED", function(from, target, type, itemName, itemCount)
		local _source = from

		local sourceXPlayer = ESX.GetPlayerFromId(_source)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if type == "item_standard" then
			local sourceItem = sourceXPlayer.getInventoryItem(itemName)
			local targetItem = targetXPlayer.getInventoryItem(itemName)

			if itemCount > 0 and sourceItem.count >= itemCount then
				if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
				else
					sourceXPlayer.removeInventoryItem(itemName, itemCount)
					targetXPlayer.addInventoryItem(itemName, itemCount)
				end
			end
		elseif type == "item_money" then
			if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
				sourceXPlayer.removeMoney(itemCount)
				targetXPlayer.addMoney(itemCount)
			end
		elseif type == "item_account" then
			if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
				sourceXPlayer.removeAccountMoney(itemName, itemCount)
				targetXPlayer.addAccountMoney(itemName, itemCount)
			end
		elseif type == "item_weapon" then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)
			end
		end
	end)

TriggerEvent('es:addGroupCommand', 'openinventory', "superadmin", function(source, args, user)
	if args[1] then
		if(GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])
			local target = tonumber(args[1])
			local targetXPlayer = ESX.GetPlayerFromId(target)
			local _source = source
	
				-- User permission check
				TriggerEvent("es:getPlayerFromId", player, function(target)
	
					--TriggerClientEvent('esx_admin:kill', player)
					TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
					--TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been killed.")
				end)
			else
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
			end
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
		end
	end, function(source, args, user)
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
	end, {help = "Open Inventory", params = {{name = "userid", help = "The ID of the player"}}})

--[[RegisterCommand(
	"openinventory",
	function(source, args, rawCommand)
		if IsPlayerAceAllowed(source, "inventory.openinventory") then
			local target = tonumber(args[1])
			local targetXPlayer = ESX.GetPlayerFromId(target)

			if targetXPlayer ~= nil then
				TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
			else
				TriggerClientEvent("chatMessage", source, "^1" .. _U("no_player"))
			end
		else
			TriggerClientEvent("chatMessage", source, "^1" .. _U("no_permissions"))
		end
	end
)

]]