ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('ecrp-garage:tradeVehicle')
AddEventHandler('ecrp-garage:tradeVehicle', function(plate)
  local ped = 0
  local keyboard = exports["nh-keyboard"]:KeyboardInput({
    header = "Sell Vehicle", 
    rows = {
        {
            id = 0, 
            txt = "Player ID"
        },
    }
  })

  if keyboard ~= nil then
      if keyboard[1].input == nil then 
        exports['mythic_notify']:DoHudText('error', 'Inputs must be filled')
        return
      end

      ped = keyboard[1].input
      TriggerServerEvent('ecrp-garage:sellVehicle', ped, plate)
  end
end)

function trim(s)
  return s:match"^%s*(.*)":match"(.-)%s*$"
end
