Doors = {
    ["F1"] = {{loc = vector3(312.93, -284.45, 54.16), h = 160.91, txtloc = vector3(312.93, -284.45, 54.16), obj = nil, locked = false}, {loc = vector3(310.93, -284.44, 54.16), txtloc = vector3(310.93, -284.44, 54.16), state = nil, locked = true}},
    ["F2"] = {{loc = vector3(148.76, -1045.89, 29.37), h = 158.54, txtloc = vector3(148.76, -1045.89, 29.37), obj = nil, locked = false}, {loc = vector3(146.61, -1046.02, 29.37), txtloc = vector3(146.61, -1046.02, 29.37), state = nil, locked = true}},
    ["F3"] = {{loc = vector3(-1209.66, -335.15, 37.78), h = 213.67, txtloc = vector3(-1209.66, -335.15, 37.78), obj = nil, locked = false}, {loc = vector3(-1211.07, -336.68, 37.78), txtloc = vector3(-1211.07, -336.68, 37.78), state = nil, locked = true}},
    ["F4"] = {{loc = vector3(-2957.26, 483.53, 15.70), h = 267.73, txtloc = vector3(-2957.26, 483.53, 15.70), obj = nil, locked = false}, {loc = vector3(-2956.68, 481.34, 15.70), txtloc = vector3(-2956.68, 481.34, 15.7), state = nil, locked = true}},
    ["F5"] = {{loc = vector3(-351.97, -55.18, 49.04), h = 159.79, txtloc = vector3(-351.97, -55.18, 49.04), obj = nil, locked = false}, {loc = vector3(-354.15, -55.11, 49.04), txtloc = vector3(-354.15, -55.11, 49.04), state = nil, locked = true}},
    ["F6"] = {{loc = vector3(1174.24, 2712.47, 38.09), h = 160.91, txtloc = vector3(1174.24, 2712.47, 38.09), obj = nil, locked = false}, {loc = vector3(1176.40, 2712.75, 38.09), txtloc = vector3(1176.40, 2712.75, 38.09), state = nil, locked = true}},
}

RegisterServerEvent("ecrp-fleeca:startcheck")
AddEventHandler("ecrp-fleeca:startcheck", function(bank)
    local _source = source
    local copcount = 0
    local Players = ESX.GetPlayers()

    for i = 1, #Players, 1 do
        local xPlayer = ESX.GetPlayerFromId(Players[i])

        if xPlayer.job.name == "police" then
            copcount = copcount + 1
        end
    end
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem("greenlaptop")["count"]

    if copcount >= 2 then
        if not Config.Banks[bank].onaction == true then
            if (os.time() - Config.cooldown) > Config.Banks[bank].lastrobbed then
                Config.Banks[bank].onaction = true
                xPlayer.removeInventoryItem("greenlaptop", 1)
                TriggerClientEvent("ecrp-fleeca:outcome", _source, true, bank)
                -- TriggerClientEvent("ecrp-fleeca:policenotify", -1, bank)
            else
                TriggerClientEvent("ecrp-fleeca:outcome", _source, false, "This bank recently robbed. You need to wait "..math.floor((Config.cooldown - (os.time() - Config.Banks[bank].lastrobbed)) / 60)..":"..math.fmod((Config.cooldown - (os.time() - Config.Banks[bank].lastrobbed)), 60))
            end
        else
            TriggerClientEvent("ecrp-fleeca:outcome", _source, false, "This bank is currently being robbed.")
        end
    else
        TriggerClientEvent("ecrp-fleeca:outcome", _source, false, "There is not enough police in the city.")
    end
end)


RegisterServerEvent("ecrp-fleeca:lootup")
AddEventHandler("ecrp-fleeca:lootup", function(var, var2)
    TriggerClientEvent("ecrp-fleeca:lootup_c", -1, var, var2)
end)

RegisterServerEvent("ecrp-fleeca:openDoor")
AddEventHandler("ecrp-fleeca:openDoor", function(coords, method)
    TriggerClientEvent("ecrp-fleeca:openDoor_c", -1, coords, method)
end)

RegisterServerEvent("ecrp-fleeca:toggleVault")
AddEventHandler("ecrp-fleeca:toggleVault", function(key, state)
    Doors[key][2].locked = state
    TriggerClientEvent("ecrp-fleeca:toggleVault", -1, key, state)
end)

RegisterServerEvent("ecrp-fleeca:updateVaultState")
AddEventHandler("ecrp-fleeca:updateVaultState", function(key, state)
    Doors[key][2].state = state
end)

RegisterServerEvent("ecrp-fleeca:startLoot")
AddEventHandler("ecrp-fleeca:startLoot", function(data, name, players)
    local _source = source

    for i = 1, #players, 1 do
        TriggerClientEvent("ecrp-fleeca:startLoot_c", players[i], data, name)
    end
    TriggerClientEvent("ecrp-fleeca:startLoot_c", _source, data, name)
end)

RegisterServerEvent("ecrp-fleeca:stopHeist")
AddEventHandler("ecrp-fleeca:stopHeist", function(name)
    TriggerClientEvent("ecrp-fleeca:stopHeist_c", -1, name)
end)

RegisterServerEvent("ecrp-fleeca:rewardCash")
AddEventHandler("ecrp-fleeca:rewardCash", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local reward = math.random(Config.mincash, Config.maxcash)

    if Config.black then
        xPlayer.addAccountMoney("black_money", reward)
    else
        xPlayer.addMoney(reward)
    end
end)

RegisterServerEvent("ecrp-fleeca:setCooldown")
AddEventHandler("ecrp-fleeca:setCooldown", function(name)
    Config.Banks[name].lastrobbed = os.time()
    Config.Banks[name].onaction = false
    TriggerClientEvent("ecrp-fleeca:resetDoorState", -1, name)
end)

ESX.RegisterServerCallback("ecrp-fleeca:getBanks", function(source, cb)
    cb(Config.Banks, Doors)
end)
local ox_inventory = exports.ox_inventory

RegisterServerEvent("ecrp-fleeca:metadata")
AddEventHandler("ecrp-fleeca:metadata", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local greenlaptop = ox_inventory:Search(xPlayer.source, 1, 'greenlaptop')
    for k, v in pairs(greenlaptop) do
        greenlaptop = v
    end
    if greenlaptop.metadata.durability == nil then 
        greenlaptop.metadata.durability = 2 
    else
        heistlaptop.metadata.durability = greenlaptop.metadata.durability-1
    end
    if greenlaptop.metadata.durability <= 0 then
        ox_inventory:RemoveItem(xPlayer.source, 'greenlaptop', 1, {durability = 0})
    end
    ox_inventory:SetMetadata(xPlayer.source, greenlaptop.slot, greenlaptop.metadata)
end) 


RegisterServerEvent("ecrp-fleeca:dellaptop")
AddEventHandler("ecrp-fleeca:dellaptop", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    exports.ox_inventory:RemoveItem(xPlayer.source, 'greenlaptop', 1, {durability = 0})
end) 

