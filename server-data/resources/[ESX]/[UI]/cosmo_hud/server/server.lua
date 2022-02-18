ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local dev = false

RegisterNetEvent('toggleDev')
AddEventHandler('toggleDev', function (player)
  local xPlayer = ESX.GetPlayerFromId(player)
  if havePermission(xPlayer) then
    if dev == false then
      dev = true
      TriggerClientEvent('cl:toggleDev', source, dev)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Dev Mode Enabled'})
    elseif dev == true then
      dev = false
      TriggerClientEvent('cl:toggleDev', source, dev)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Dev Mode Disabled'})
    end
  end
end)

function havePermission(xPlayer, exclude)
  if exclude and type(exclude) ~= 'table' then
      exclude = nil;
      print("exclude argument is not table")
  end

  local playerGroup = xPlayer.getGroup()
  for k, v in pairs(Config.Perms) do
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