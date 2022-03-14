ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterNetEvent('ecrp:togglenoclip:sv')
AddEventHandler('ecrp:togglenoclip:sv', function (player)
  local xPlayer = ESX.GetPlayerFromId(player)

  if havePermission(xPlayer) then
    TriggerClientEvent('ecrp:togglenoclip:cl', player)
  end
end)

function havePermission(xPlayer, exclude)
  if exclude and type(exclude) ~= 'table' then
      exclude = nil;
      print("exclude argument is not table")
  end 

  local playerGroup = xPlayer.getGroup()
  for k, v in pairs(Config.adminRanks) do
      if v == playerGroup then
          if not exclude then
              return true
          else
              for a, b in pairs(exclude) do
                  if b == v then
                      return false
                  end
              end
              return true
          end
      end
  end
  return false
end
