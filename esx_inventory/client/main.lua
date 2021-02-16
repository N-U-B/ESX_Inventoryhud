--------------------------Esx inventory---------------------
 --Re-done by TRP with added functions and functional hot-bar--
-------------------------------------------------------------
-------------------Any questions please message me------------
-------------------------nub@tassierp.com--------------------------------------
-----------------------Please feel free to use this how you please--------------------- 
local Keys = {

    ["ESC"] = 322,

    ["F1"] = 288,

    ["F2"] = 289,

    ["F3"] = 170,

    ["F5"] = 166,

    ["F6"] = 167,

    ["F7"] = 168,

    ["F8"] = 169,

    ["F9"] = 56,

    ["F10"] = 57,

    ["~"] = 243,

    ["1"] = 157,

    ["2"] = 158,

    ["3"] = 160,

    ["4"] = 164,

    ["5"] = 165,

    ["6"] = 159,

    ["7"] = 161,

    ["8"] = 162,

    ["9"] = 163,

    ["-"] = 84,

    ["="] = 83,

    ["BACKSPACE"] = 177,

    ["TAB"] = 37,

    ["Q"] = 44,

    ["W"] = 32,

    ["E"] = 38,

    ["R"] = 45,

    ["T"] = 245,

    ["Y"] = 246,

    ["U"] = 303,

    ["P"] = 199,

    ["["] = 39,

    ["]"] = 40,

    ["ENTER"] = 18,

    ["CAPS"] = 137,

    ["A"] = 34,

    ["S"] = 8,

    ["D"] = 9,

    ["F"] = 23,

    ["G"] = 47,

    ["H"] = 74,

    ["K"] = 311,

    ["L"] = 182,

    ["LEFTSHIFT"] = 21,

    ["Z"] = 20,

    ["X"] = 73,

    ["C"] = 26,

    ["V"] = 0,

    ["B"] = 29,

    ["N"] = 249,

    ["M"] = 244,

    [","] = 82,

    ["."] = 81,

    ["LEFTCTRL"] = 36,

    ["LEFTALT"] = 19,

    ["SPACE"] = 22,

    ["RIGHTCTRL"] = 70,

    ["HOME"] = 213,

    ["PAGEUP"] = 10,

    ["PAGEDOWN"] = 11,

    ["DELETE"] = 178,

    ["LEFT"] = 174,

    ["RIGHT"] = 175,

    ["TOP"] = 27,

    ["DOWN"] = 173,

    ["NENTER"] = 201,

    ["N4"] = 108,

    ["N5"] = 60,

    ["N6"] = 107,

    ["N+"] = 96,

    ["N-"] = 97,

    ["N7"] = 117,

    ["N8"] = 61,

    ["N9"] = 118

}
isInInventory = false
ESX = nil
local PlayerData 		= {}
local job_name = "Unemployment Benefits"
local job_grade = "Centrelink"
local firstname = 'Hobo Bob'
local lastname  = false
local lastname1 = ''

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	job_name = PlayerData.job.label
	job_grade = PlayerData.job.grade_label   
    ESX.TriggerServerCallback("esx:core:getNames", function(jewsdidnothingwrong)
		firstname = jewsdidnothingwrong
		lastname  = ''
	end)
end)

RegisterNetEvent('esx:core:updateName')
AddEventHandler('esx:core:updateName', function(job)   
    ESX.TriggerServerCallback("esx:core:getNames", function(jewsdidnothingwrong)
		firstname = jewsdidnothingwrong
		lastname  = ''
	end)
end)



RegisterCommand("checknames", function(source, args)   
    ESX.TriggerServerCallback("esx:core:getNames", function(jewsdidnothingwrong)
		firstname = jewsdidnothingwrong
		lastname  = ''
	end)
    job_name = PlayerData.job.label
	job_grade = PlayerData.job.grade_label
end, false)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
  job_name = PlayerData.job.label
  job_grade = PlayerData.job.grade_label
end)

Citizen.CreateThread(function()
        while ESX == nil do 
            TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
            Citizen.Wait(0) -- loops lol
        end
end)

local isDead = false

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)



AddEventHandler('esx_ambulancejob:revive', function()
	IsDead = false
end)



AddEventHandler("esx_inventoryhud:hotbarEquipt", function(slot)
  SendNUIMessage({
    action = "getSlotItem",
    slot = slot
  })
end)



AddEventHandler("esx_inventoryhud:hotbarClear", function()
  SendNUIMessage({
    action = "clearHotbar"
  })
end)

local openInventory = false
RegisterCommand('InventoryOpen', function()
    openInventory()
    SendNUIMessage({
        action = "setJobData",
        name = job_name,
        title = job_grade
    })
    SendNUIMessage({
        action = "setNameData",
        first = firstname,
        last = lastname1
      })
end, false)
-----------------------------------------------------------------------------
-- rebindable keys
-----------------------------------------------------------------------------

RegisterKeyMapping('InventoryOpen', 'Open Inventory', 'keyboard', 'F2')
RegisterKeyMapping('InventoryHotBar1', 'Inventory Hot Key 1', 'keyboard', '1')
RegisterKeyMapping('InventoryHotBar2', 'Inventory Hot Key 2', 'keyboard', '2')
RegisterKeyMapping('InventoryHotBar3', 'Inventory Hot Key 3', 'keyboard', '3')
RegisterKeyMapping('InventoryHotBar4', 'Inventory Hot Key 4', 'keyboard', '4')
RegisterKeyMapping('InventoryHotBar5', 'Inventory Hot Key 5', 'keyboard', '5')

RegisterCommand('InventoryHotBar1', function()
    if IsInputDisabled(0) and not IsDead then
        TriggerEvent('esx_inventoryhud:hotbarEquipt', 1)
    end
end, false)

RegisterCommand('InventoryHotBar2', function()
    if IsInputDisabled(0) and not IsDead then
        TriggerEvent('esx_inventoryhud:hotbarEquipt', 2)
    end
end, false)

RegisterCommand('InventoryHotBar3', function()
    if IsInputDisabled(0) and not IsDead then
        TriggerEvent('esx_inventoryhud:hotbarEquipt', 3)
    end
end, false)

RegisterCommand('InventoryHotBar4', function()
    if IsInputDisabled(0) and not IsDead then
        TriggerEvent('esx_inventoryhud:hotbarEquipt', 4)
    end
end, false)
RegisterCommand('InventoryHotBar5', function()
    if IsInputDisabled(0) and not IsDead then
        TriggerEvent('esx_inventoryhud:hotbarEquipt', 5)
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		BlockWeaponWheelThisFrame()
        HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        HideHudComponentThisFrame(17)
		DisableControlAction(0, 37, true) --Disable Tab
		DisableControlAction(0, 157, true) -- 1 Key
		DisableControlAction(0, 158, true) -- 2 Key
		DisableControlAction(0, 160, true) -- 3 Key
		DisableControlAction(0, 164, true) -- 4 Key
		DisableControlAction(0, 157, true) -- 5 Key
		DisableControlAction(0, 159, true) -- 6 Key
		DisableControlAction(0, 161, true) -- 7 Key
		DisableControlAction(0, 162, true) -- 8 Key
		DisableControlAction(0, 163, true) -- 9 Key
    end
end)


local hudToggled = false

RegisterNetEvent("esx:core:toggleHud")

AddEventHandler("esx:core:toggleHud", function()

    if hudToggled then

        hudToggled = false

    else

        hudToggled = true

    end

end)



RegisterNetEvent("esx_inventoryhud:closeInventory")

AddEventHandler("esx_inventoryhud:closeInventory", function()



    closeInventory()



end)



function openInventory()

    loadPlayerInventory()

    isInInventory = true

    SendNUIMessage(

        {

            action = "display",

            type = "normal"

        }

    )

  	TransitionToBlurred(100.0)

    if not hudToggled then

        penis = true

        TriggerEvent('esx:core:toggleHud')

    else

        penis = false

    end

    TriggerEvent('ui:blurHud', true)

    SetNuiFocus(true, true)

end



function closeInventory(doesItExist)

    if not hudToggled then

        TriggerEvent('esx:core:toggleHud')

    end

    if isInInventory then

        if penis then

            TriggerEvent('esx:core:toggleHud')

        else

            penis = false

        end

    end

    isInInventory = false

    SendNUIMessage(

        {

            action = "hide"

        }

    )

  	TransitionFromBlurred(100.0)

    SetNuiFocus(false, false)

end



RegisterNUICallback(

    "NUIFocusOff",

    function()

        closeInventory()

    end

)



RegisterNUICallback(

    "GetNearPlayers",

    function(data, cb)

        local playerPed = PlayerPedId()

        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

        local foundPlayers = false

        local elements = {}



        for i = 1, #players, 1 do

            if players[i] ~= PlayerId() then

                foundPlayers = true



                table.insert(

                    elements,

                    {

                        label = GetPlayerName(players[i]),

                        player = GetPlayerServerId(players[i])

                    }

                )

            end

        end



        if not foundPlayers then

            exports.pNotify:SendNotification(

                {

                    text = _U("players_nearby"),

                    type = "error",

                    timeout = 3000,

                    layout = "bottomCenter",

                    queue = "inventoryhud"

                }

            )

        else

            SendNUIMessage(

                {

                    action = "nearPlayers",

                    foundAny = foundPlayers,

                    players = elements,

                    item = data.item

                }

            )

        end



        cb("ok")

    end

)



RegisterNUICallback("UseItem", function(data, cb)

  useItem(data.item.name, true)



  cb("ok")

end)



RegisterNUICallback("sendItemInSlot", function(data, cb)

  if data.name ~= nil then

    useItem(data.name, false)

  end



  cb("ok")

end)



function useItem(item, inInventory)

  if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(item) then

    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
    TriggerServerEvent('esx-Inventory:UseInventoryItem', "WEAPON_UNARMED")
  elseif endsWith(item, "WEAPON") then

    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey(item), true)
    TriggerServerEvent('esx-Inventory:UseInventoryItem', item)
    if inInventory then

      closeInventory()

    end

  else

    TriggerServerEvent("esx:useItem", item)
   TriggerServerEvent('esx-Inventory:UseInventoryItem', item)

  end



  if inInventory then

    if shouldCloseInventory(item) then

        closeInventory()

    else

      Citizen.Wait(250)
      loadPlayerInventory()

    end

  end

end



RegisterNUICallback(

    "DropItem",

    function(data, cb)

        if IsPedSittingInAnyVehicle(playerPed) then

            return

        end



        if type(data.number) == "number" and math.floor(data.number) == data.number then

            TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
            TriggerServerEvent('esx-Inventory:DestroyingPussy', data.number, data.item.name)

        end



        Wait(250)

        loadPlayerInventory()



        cb("ok")

    end

)



RegisterNUICallback(

    "GiveItem",

    function(data, cb, xPlayer)

        local playerPed = PlayerPedId()

        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

        local foundPlayer = false

        for i = 1, #players, 1 do

            if players[i] ~= PlayerId() then

                if GetPlayerServerId(players[i]) == data.player then

                    foundPlayer = true

                end

            end

        end
        



        if foundPlayer then

            local count = tonumber(data.number)



            if data.item.type == "item_weapon" then

                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))

            end



			if data.item.type == "item_money" then

				TriggerServerEvent("esx:giveInventoryItem", data.player, "item_account", "money", count)

			else
                --local steamid = "Recieving xPlayer"
				TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
                TriggerServerEvent('esx-Inventory:Givingdickdoodle', data.player, count, data.item.name)
                
                -- function booleans calls for 4 function booleens in Givingdickdoodle read comments to understand
                --TriggerServerEvent('esx-Inventory:Givingdickdoodle', count, data.item.name)

                Wait(250)

                loadPlayerInventory()
                exports.pNotify:SendNotification(
    
                    {
    
                        text = _U("player_nearby"),
    
                        type = "error",
    
                        timeout = 3000,
    
                        layout = "bottomCenter",
    
                        queue = "inventoryhud"
    
                    }
    
                )
                --TriggerServerEvent('esx-Inventory:Givingdickdoodle', "Gave item", data.item.type, data.item.name, count)
            end
            cb("ok")
    
        end
    end
    )
    
    
    
    function shouldCloseInventory(itemName)
    
      for index, value in ipairs(Config.CloseUiItems) do
    
        if value == itemName then
    
          return true
    
        end
    
      end
    
    
    
      return true
    
    end
    
    
    
    function shouldSkipAccount(accountName)
    
        for index, value in ipairs(Config.ExcludeAccountsList) do
    
            if value == accountName then
    
                return true
    
            end
    
        end
    
    
    
        return false
    
    end
    
    
    function loadPlayerInventory()
        ESX.TriggerServerCallback(
            "esx_inventoryhud:getPlayerInventory",
            function(data)
                items = {}
                inventory = data.inventory
                accounts = data.accounts
                money = data.money
                weapons = data.weapons
    
                if Config.IncludeCash and money ~= nil and money > 0 then
                    moneyData = {
                        label = _U("money"),
                        name = "money",
                        type = "item_money",
                        count = money,
                        usable = false,
                        rare = false,
                        limit = -1,
                        canRemove = true
                    }
    
                    table.insert(items, moneyData)
                end
    
                if Config.IncludeAccounts and accounts ~= nil then
                    for key, value in pairs(accounts) do
                        if not shouldSkipAccount(accounts[key].name) then
                            local canDrop = accounts[key].name ~= "bank"
    
                            if accounts[key].money > 0 then
                                accountData = {
                                    label = accounts[key].label,
                                    count = accounts[key].money,
                                    type = "item_account",
                                    name = accounts[key].name,
                                    usable = false,
                                    rare = false,
                                    limit = -1,
                                    canRemove = true
                                }
                                table.insert(items, accountData)
                            end
                        end
                    end
                end
    
                if inventory ~= nil then
                    for key, value in pairs(inventory) do
                        if inventory[key].count <= 0 then
                            inventory[key] = nil
                        else
                            inventory[key].type = "item_standard"
                            table.insert(items, inventory[key])
                        end
                    end
                end
    
                if Config.IncludeWeapons and weapons ~= nil then
                    for key, value in pairs(weapons) do
                        local weaponHash = GetHashKey(weapons[key].name)
                        local playerPed = PlayerPedId()
                        if weapons[key].name ~= "WEAPON_UNARMED" then
                            local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                            table.insert(
                                items,
                                {
                                    label = weapons[key].label,
                                    count = ammo,
                                    limit = -1,
                                    type = "item_weapon",
                                    name = weapons[key].name,
                                    usable = false,
                                    rare = false,
                                    canRemove = true
                                }
                            )
                        end
                    end
                end
    
                SendNUIMessage(
                    {
                        action = "setItems",
                        itemList = items
                    }
                )
            end,
            GetPlayerServerId(PlayerId())
        )
    end



Citizen.CreateThread(

    function()

        while true do

            Citizen.Wait(1)

            if isInInventory then

                local playerPed = PlayerPedId()

                DisableControlAction(0, 1, true) -- Disable pan

                DisableControlAction(0, 2, true) -- Disable tilt

                DisableControlAction(0, 24, true) -- Attack

                DisableControlAction(0, 257, true) -- Attack 2

                DisableControlAction(0, 25, true) -- Aim

                DisableControlAction(0, 263, true) -- Melee Attack 1

                DisableControlAction(0, Keys["W"], true) -- W

                DisableControlAction(0, Keys["A"], true) -- A

                DisableControlAction(0, 31, true) -- S (fault in Keys table!)

                DisableControlAction(0, 30, true) -- D (fault in Keys table!)



                DisableControlAction(0, Keys["R"], true) -- Reload

                DisableControlAction(0, Keys["SPACE"], true) -- Jump

                DisableControlAction(0, Keys["Q"], true) -- Cover

                DisableControlAction(0, Keys["TAB"], true) -- Select Weapon

                DisableControlAction(0, Keys["F"], true) -- Also 'enter'?



                DisableControlAction(0, Keys["F1"], true) -- Disable phone

                DisableControlAction(0, Keys["TAB"], true) -- Inventory

                DisableControlAction(0, Keys["F3"], true) -- Animations

                DisableControlAction(0, Keys["F6"], true) -- Job



                DisableControlAction(0, Keys["V"], true) -- Disable changing view

                DisableControlAction(0, Keys["C"], true) -- Disable looking behind

                DisableControlAction(0, Keys["X"], true) -- Disable clearing animation

                DisableControlAction(2, Keys["P"], true) -- Disable pause screen



                DisableControlAction(0, 59, true) -- Disable steering in vehicle

                DisableControlAction(0, 71, true) -- Disable driving forward in vehicle

                DisableControlAction(0, 72, true) -- Disable reversing in vehicle



                DisableControlAction(2, Keys["LEFTCTRL"], true) -- Disable going stealth



                DisableControlAction(0, 47, true) -- Disable weapon

                DisableControlAction(0, 264, true) -- Disable melee

                DisableControlAction(0, 257, true) -- Disable melee

                DisableControlAction(0, 140, true) -- Disable melee

                DisableControlAction(0, 141, true) -- Disable melee

                DisableControlAction(0, 142, true) -- Disable melee

                DisableControlAction(0, 143, true) -- Disable melee

                DisableControlAction(0, 75, true) -- Disable exit vehicle

                DisableControlAction(27, 75, true) -- Disable exit vehicle

            end

        end

    end

)



function endsWith(String, Start)

   return string.sub(String, 1, string.len(Start)) == Start

end

