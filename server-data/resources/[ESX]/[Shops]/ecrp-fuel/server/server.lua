ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('ecrp-fuel:checkmoney', function(source, callback)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()

    if money >= 100 then
        callback(true)
    else
        callback(false)
    end
end)

RegisterServerEvent('ecrp-fuel:takemoney')
AddEventHandler('ecrp-fuel:takemoney', function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(money)
end)