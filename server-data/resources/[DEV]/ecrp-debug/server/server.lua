ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

--
-- Functions
--

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

function mathRound(value, numDecimalPlaces)
  if numDecimalPlaces then
      local power = 10^numDecimalPlaces
      return math.floor((value * power) + 0.5) / (power)
  else
      return math.floor(value + 0.5)
  end
end

--
-- Events
--

RegisterNetEvent('ecrp_debug:points')
AddEventHandler('ecrp_debug:points', function(points)
  local textString = ''

  for k,v in pairs(points) do
      textString = textString .. ("vector3(%s, %s, %s),\n"):format(
          mathRound(v.x, 2),
          mathRound(v.y, 2),
          mathRound(v.z, 2)
      )
  end

  local time = os.time(os.date('*t'))

  SaveResourceFile(GetCurrentResourceName(), 'coords/' .. time .. '.txt', textString)
end)