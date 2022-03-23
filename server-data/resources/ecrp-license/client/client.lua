ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
		ESX = obj
		end)
	end
end)

exports.qtarget:AddBoxZone("cityHallCompLeft", vector3(-550.96, -191.53, 38.22), 1.0, 0.4, {
  name="cityHallCompLeft",
  heading=302,
  -- debugPoly=true,
  minZ=38.02,
  maxZ=38.22,
  }, {
    options = {
      {
        event = "ecrp:cityHallComp",
        icon = "fas fa-sign-in-alt",
        label = "Log In",
        job = {['bcso'] = 0, ['police'] = 0},
      },
    },
    distance = 2.0
})

exports.qtarget:AddBoxZone("cityHallCompRight", vector3(-553.33, -192.81, 38.22), 1, 0.4, {
  name="cityHallCompRight",
  heading=295,
  -- debugPoly=true,
  minZ=38.02,
  maxZ=38.22,
  }, {
    options = {
      {
        event = "ecrp:cityHallComp",
        icon = "fas fa-sign-in-alt",
        label = "Log In",
        job = {['bcso'] = 0, ['police'] = 0},
      },
    },
    distance = 2.0
})

RegisterNetEvent("ecrp:cityHallComp", function()
  TriggerEvent("nh-context:createMenu", {
      {
          header = "Change License Plate",
          context = "Change civilian license plates",
          event = "ecrp:changeplate",
      }
  })
end)

RegisterNetEvent('ecrp:changeplate')
AddEventHandler('ecrp:changeplate', function ()
  local oldPlate = nil
  local newPlate = nil
  local keyboard = exports["nh-keyboard"]:KeyboardInput({
    header = "Change Plate", 
    rows = {
        {
            id = 0, 
            txt = "Current Plate"
        },
        {
            id = 1, 
            txt = "New Plate (Max 8 Characters)"
        }
    }
  })

  if keyboard ~= nil then
      if keyboard[1].input == nil or keyboard[2].input == nil then 
        exports['mythic_notify']:DoHudText('error', 'Inputs must be filled')
        return
      end

      if #keyboard[2].input > 8 then
        exports['mythic_notify']:DoHudText('error', 'License plate too long')
        return
      end

      oldPlate = keyboard[1].input
      newPlate = keyboard[2].input
      print('Old Plate: ' .. oldPlate)
      print('New Plate: ' .. newPlate)
      plateCheck(newPlate, oldPlate)
  end
end)

function plateCheck(plate, oldPlate) -- Check if requested plate is duplicate/valid.
  local ped = GetPlayerPed(-1)
  ESX.TriggerServerCallback('ecrp_licenseplates:update', function( cb ) -- Check on server side to access database
      if cb == 'confirm' then -- Plate Valid
          SetVehicleNumberPlateText(GetVehiclePedIsIn(ped, false), plate)
          exports['mythic_notify']:DoHudText('success', 'Vehicle license plate changed to: ' .. plate)
          SendNUIMessage({
              type = "valid"
          })
      elseif cb == 'error' then -- Plate invalid
          exports['mythic_notify']:DoHudText('error', 'The plate: ' .. plate .. ' is currently not available')
          SendNUIMessage({
              type = "notValid"
          })
      elseif cb == 'money' then -- Cannot afford plate
          exports['mythic_notify']:DoHudText('error', 'The plate: ' .. plate .. ' is valid but you cannot afford it')
      elseif cb == 'unowned' then -- Vehicle isn't owned by player
          exports['mythic_notify']:DoHudText('error', 'You cannot purchase a license plate for a vehicle you don\'t own')
      end
    end, oldPlate, plate)
end