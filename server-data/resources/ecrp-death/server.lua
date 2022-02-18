ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterCommand("revive", function(src, args, raw, cb)
    local target = tonumber(args[1] or src)
    local xPlayer = ESX.GetPlayerFromId(src)
    local job = xPlayer.job.name
    TriggerEvent("ReviveSystem:ReviveTarget", pSource, pMessage)

    if job == "bcso" or job == "police" or job == "ambulance" then
        if GetPlayerName(target) then
            TriggerClientEvent("ReviveSystem:ReviveTarget", target, src)
            -- TriggerClientEvent("ReviveSystem:checkJob", target, src)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', src, {
                type = 'error',
                text = 'Player not in city'
            })
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, {
            type = 'error',
            text = 'You do not have permissions'
        })
    end
end)

RegisterCommand("heal", function(src, args, raw)
  local target = tonumber(args[1] or src)
  local xPlayer = ESX.GetPlayerFromId(src)

  if havePermission(xPlayer) then
      if GetPlayerName(target) then
          TriggerClientEvent("ReviveSystem:Heal", target)
      else
          TriggerClientEvent('mythic_notify:client:SendAlert', src, {
              type = 'error',
              text = 'Player not in city'
          })
      end
  else
      TriggerClientEvent('mythic_notify:client:SendAlert', src, {
          type = 'error',
          text = 'You do not have permissions'
      })
  end
end, true)

RegisterCommand("respawn", function(src, args, raw)
    TriggerClientEvent("ReviveSystem:RespawnTarget", src)
end)

RegisterCommand("adrev", function(src, args, raw)
    local target = tonumber(args[1] or src)
    local xPlayer = ESX.GetPlayerFromId(src)

    if havePermission(xPlayer) then
        if GetPlayerName(target) then
            TriggerClientEvent("ReviveSystem:AdminRevive", target)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', src, {
                type = 'error',
                text = 'Player not in city'
            })
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, {
            type = 'error',
            text = 'You do not have permissions'
        })
    end
end, true)

RegisterCommand("reviveall", function(src, args, raw)
    local xPlayer = ESX.GetPlayerFromId(src)

    if havePermission(xPlayer) then
        for k, v in pairs(GetPlayers()) do
            TriggerClientEvent("ReviveSystem:AdminRevive", tonumber(v))
        end
        TriggerClientEvent('mythic_notify:client:SendAlert', src, {
            type = 'inform',
            text = 'All downed players revived'
        })
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, {
            type = 'error',
            text = 'You do not have permissions'
        })
    end
end, true)

function havePermission(xPlayer, exclude) -- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
    if exclude and type(exclude) ~= 'table' then
        exclude = nil;
        print("exclude argument is not table")
    end -- will prevent from errors if you pass wrong argument

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
