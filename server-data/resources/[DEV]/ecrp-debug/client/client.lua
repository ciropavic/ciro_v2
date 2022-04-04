local points       = {}
local isCollecting = false
local dev = false

--
-- Threads
--

function startCollectionThread()
    points = {}


    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            if not isCollecting then
                return
            end

            TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>[E] Save point</B>', 'blue', 'blue')
            EndTextCommandDisplayHelp(0, false, false, -1)
        
            if IsControlJustReleased(0, 38) then
                local playerCoordinates = GetEntityCoords(PlayerPedId())
                
                playerCoordinates = (playerCoordinates - vector3(0.0, 0.0, 1.0))
                
                table.insert(points, playerCoordinates)
        
                TriggerEvent('chat:debug', "ECRP Debug", ("Saved Point #%s: vector3(%s, %s, %s)"):format(
                  #points,
                  mathRound(playerCoordinates.x, 2),
                  mathRound(playerCoordinates.y, 2),
                  mathRound(playerCoordinates.z, 2)
                ))
            end
        end
    end)
end

--
-- Functions
--

function mathRound(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10^numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end

--
-- Commands
--

RegisterCommand('getcoords', function()
  if dev then
    if not isCollecting then
      isCollecting = true

      startCollectionThread()

      return
    end

    isCollecting = false
    TriggerEvent('cd_drawtextui:HideUI')
    TriggerServerEvent('ecrp_debug:points', points)
  else
    exports['mythic_notify']:DoHudText('error', 'Dev mode not active')
  end
end)

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(500)
    dev = exports['cosmo_hud']:DevActive()
  end
end)

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  TriggerEvent('cd_drawtextui:HideUI')
end)
