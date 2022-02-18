-- Templates
TriggerEvent('chat:addTemplate', 'OOC', '<div class="chat-message"><span class="ooc"><B>OOC {0} {1}</B>: {2}</span></div>')
TriggerEvent('chat:addTemplate', 'localmsg', '<div class="chat-message"><span class="localmsg"><B>Plate Number</B>: {0}</span></div>')

-- suggestions
TriggerEvent('chat:removeSuggestion', '/trunkgetin')

-- command outputs
RegisterNetEvent('ecrpChat:OOC')
AddEventHandler('ecrpChat:OOC', function (id, firstname, lastname, msg)
  TriggerEvent('chat:addMessage', {
    templateId = 'OOC',
    multiline = false,
    args = {firstname, lastname, msg}
  })
end)

RegisterNetEvent('chat:localmsg')
AddEventHandler('chat:localmsg', function(message)
    TriggerEvent('chat:addMessage', {
      templateId = 'localmsg',
      multiline = false,
      args = {message}
    })
end)

