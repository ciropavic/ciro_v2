RegisterCommand('testgive', function ()
  local Inventory = exports.ox_inventory
  if Inventory.CanCarryItem(1, 'phone', 1) then
    Inventory:AddItem(1, 'phone', 1)
  end
end)