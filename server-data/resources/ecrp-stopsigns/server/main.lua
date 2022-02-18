ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('ecrp:stopsignItem')
AddEventHandler('ecrp:stopsignItem', function(player, itemName, amount)
  local ox_inventory = exports.ox_inventory
  local item = ox_inventory:GetItem(player, itemName)

  if item and item.count == 0 then
      if ox_inventory:CanCarryItem(player, itemName, amount) then
          ox_inventory:RemoveItem(player, itemName, amount)
          ox_inventory:AddItem(player, itemName, amount)
      else
          print(ox_inventory:Inventory(player).label..' is unable to carry 1 stopsign')
      end
  else
      print(ox_inventory:Inventory(player).label..' does not have 1 stopsign')
  end
end)

ESX.RegisterUsableItem('stopsign', function(source)
	local _source = source
	TriggerClientEvent('ecrp:useStopsign', _source)
end)