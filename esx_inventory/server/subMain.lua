
----Esx inventory Re-done by TRP with added functions and functional hot-bar--
-------------------Any questions please message me-----------------------------
-------------------------nub@tassierp.com--------------------------------------
-----------------------Please feel free to use this how you please--------------------- 
local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function FindSQLname(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]
		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
		    name = identity['name'],
		}
	else
		return nil	
	end
end

ESX.RegisterServerCallback('esx:core:getNames', function(source, cb)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local Name = FindSQLname(_source)
	Combinednames = Name.firstname  .. ' ' .. Name.lastname
cb(Combinednames) -- Callback
end)


