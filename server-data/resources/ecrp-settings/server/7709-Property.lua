RegisterNetEvent("ecrp-settings:SV:7709Computer", function(id, count)
  if exports.ox_inventory:CanCarryItem(source, 'water', 3) then
    exports.ox_inventory:AddItem(id, '7709_key', count, nil, nil)
  else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Person cannot carry this'})
  end
    
end)
