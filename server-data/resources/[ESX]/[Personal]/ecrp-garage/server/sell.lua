RegisterServerEvent('ecrp-garage:sellVehicle')
AddEventHandler('ecrp-garage:sellVehicle', function(target, plate)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local tPlayer = ESX.GetPlayerFromId(target)
    local result = MySQL.scalar('SELECT * FROM owned_vehicles WHERE owner = @identifier AND plate = @plate', {
        ['@identifier'] = xPlayer.identifier,
        ['@plate'] = trim(plate)
    })
    if xPlayer.identifier == tPlayer.identifier then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, {
            type = 'error',
            text = 'You cannot sell a vehicle to yourself'
        })
        return
    end
    if result[1] ~= nil then
        MySQL.update('UPDATE owned_vehicles SET owner = @target WHERE owner = @owner AND plate = @plate', {
            ['@owner'] = xPlayer.identifier,
            ['@plate'] = trim(plate),
            ['@target'] = tPlayer.identifier
        }, function(rowsChanged)
            if rowsChanged ~= 0 then
                TriggerClientEvent('mythic_notify:client:SendAlert', src, {
                    type = 'inform',
                    text = 'Sold vehicle'
                })
                TriggerClientEvent('mythic_notify:client:SendAlert', target, {
                    type = 'success',
                    text = 'Bought vehicle'
                })
            end
        end)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, {
            type = 'error',
            text = 'This is not your vehicle!'
        })
    end
end)

function trim(s)
    return s:match "^%s*(.*)":match "(.-)%s*$"
end
