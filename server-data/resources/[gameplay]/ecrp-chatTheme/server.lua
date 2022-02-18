ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterCommand('ooc', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = '" .. xPlayer.getIdentifier() .. "'", {},
        function(result)
            local firstname = result[1].firstname
            local lastname = result[1].lastname
            TriggerClientEvent("ecrpChat:OOC", -1, source, firstname, lastname, table.concat(args, " "))
        end)
end, false)
