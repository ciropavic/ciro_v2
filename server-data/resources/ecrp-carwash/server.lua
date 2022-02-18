ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('ecrp:checkmoney')
AddEventHandler('ecrp:checkmoney', function(player, price)
  local ox_inventory = exports.ox_inventory
  if ox_inventory:GetItem(player, 'money', false, true) >= price then
    TriggerClientEvent('ecrp:cleancar', player)
  else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not enought money'})
  end
end)
