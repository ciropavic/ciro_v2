local Inventory = exports.ox_inventory

Citizen.CreateThread(function ()
  Inventory:RegisterStash('burgerShotTray1', 'Burger Shot Tray', 5, 10000)
  Inventory:RegisterStash('burgerShotTray2', 'Burger Shot Tray', 5, 10000)
end)