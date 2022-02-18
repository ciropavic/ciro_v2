RegisterNetEvent('cu:togglecuffentity')
AddEventHandler('cu:togglecuffentity', function(player, cop)
  TriggerClientEvent('cu:togglecuff', tonumber(player), tonumber(cop))
end)

RegisterNetEvent('cu:togglesoftcuffentity')
AddEventHandler('cu:togglesoftcuffentity', function(player, cop)
  TriggerClientEvent('cu:togglesoftcuff', tonumber(player), tonumber(cop))
end)

RegisterNetEvent('cu:cuffanim')
AddEventHandler('cu:cuffanim', function(cop)
    TriggerClientEvent('cu:cuffanim', cop)
end)

RegisterNetEvent('cu:uncuffanim')
AddEventHandler('cu:uncuffanim', function(cop)
    TriggerClientEvent('cu:uncuffanim', cop)
end)

RegisterNetEvent('cu:crimanim')
AddEventHandler('cu:crimanim', function(ped)
    TriggerClientEvent('cu:crimanim', ped)
end)

RegisterServerEvent("Drag")
AddEventHandler("Drag", function(Target)
	local Source = source
	TriggerClientEvent("Drag", Target, Source)
end)