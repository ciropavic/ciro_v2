RegisterNetEvent('ecrp:officerdowned')
AddEventHandler('ecrp:officerdowned', function ()
  local playerCoords = GetEntityCoords(PlayerPedId())
  local data = {displayCode = '10-13', description = 'Robbery', isImportant = 1, recipientList = {'police', 'bcso', 'ambulance'}, length = '10000', infoM = 'fa-info-circle', info = 'Officer Down'}
  local dispatchData = {dispatchData = data, caller = 'Alarm', coords = playerCoords}
  TriggerEvent('wf-alerts:svNotify', dispatchData)
end)