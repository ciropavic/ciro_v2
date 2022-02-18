---@diagnostic disable: undefined-global
local notify = exports['mythic_notify']
local currentChannel = 0
local hasRadio = false
local radioOpen = false

local ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(10)
    end
end)

function SetDisplay(s) 
    SetNuiFocus(s, s)
    SendNUIMessage({type="display", status=s})
end

RegisterCommand("radio", function()
    if not hasRadio then return end
    SetDisplay(true)
end, false)
RegisterKeyMapping("radio", "(Radio): Toggle Radio", "keyboard", Config.DefaultOpenKey)

RegisterNUICallback('close', function()
    SetDisplay(false)
end)

RegisterNUICallback('joinChannel', function(data)
    local channel = tonumber(data.channel)
	local PlayerData = ESX.GetPlayerData(_source)
    local restricted = {}
	
	if channel > 100 then
        exports['mythic_notify']:DoHudText('error', 'There are only 100 channels')
		--notify:SendAlert("error", "Channels above 200 are encrypted.")
		return
	end
	
    for i,v in pairs(Config.jobChannels) do
        if channel >= v.min and channel <= v.max then
            table.insert(restricted, v)
        end
    end

    if #restricted > 0 then
        --exports['mythic_notify']:DoHudText('inform', 'Attempting to connect to channel: '..channel..".")
        --notify:SendAlert("inform", "Attempting to connect to encrypted channel "..channel..".")
        for i,v in pairs(restricted) do
            if PlayerData.job.name == v.job and channel >= v.min and channel <= v.max then
              exports['pma-voice']:setVoiceProperty('radioEnabled', true)
                exports['pma-voice']:setRadioChannel(channel)
                exports['mythic_notify']:DoHudText('inform', 'New Channel: '..channel..'')
                --notify:SendAlert("success", "Connected to encrypted channel "..channel..".")
                currentChannel = channel
                radioOpen = true
                break
            elseif i == #restricted then
                exports['mythic_notify']:DoHudText('error', 'Failed to connect to channel '..channel..'.')
                --notify:SendAlert("error", "Failed to connect to encrypted channel "..channel..".")
                break
            end
        end
    else
      exports['pma-voice']:setRadioChannel(channel)
        exports['mythic_notify']:DoHudText('inform', 'Connected to channel: '..channel..'.')
        --notify:SendAlert("inform", "Connected to channel "..channel..".")
        currentChannel = channel
        radioOpen = true
    end
end)

RegisterCommand('joinChannel0', function(data)
    --local channel = tonumber(data.channel)
	local PlayerData = ESX.GetPlayerData(_source)
    local restricted = {}

    if PlayerData.job.name == 'police' or PlayerData.job.name == 'bcso' or PlayerData.job.name == 'ambulance' then
      exports['pma-voice']:setVoiceProperty('radioEnabled', false)
        exports['pma-voice']:setRadioChannel(0)
        exports['mythic_notify']:DoHudText('inform', 'Radio Off')
        radioOpen = false
        currentChannel = 0
    elseif i == #restricted then
        exports['mythic_notify']:DoHudText('error', 'Failed to connect to channel')
    end
end)
RegisterKeyMapping("joinChannel0", "(Radio): Turn Radio Off", "keyboard", Config.Channel0)

RegisterCommand('joinChannel1', function(data)
    --local channel = tonumber(data.channel)
	local PlayerData = ESX.GetPlayerData(_source)
    local restricted = {}

    if PlayerData.job.name == 'police' or PlayerData.job.name == 'bcso' or PlayerData.job.name == 'ambulance' then
      exports['pma-voice']:setVoiceProperty('radioEnabled', true)
        exports['pma-voice']:setRadioChannel(1)
        exports['mythic_notify']:DoHudText('inform', 'New channel: 1')
        currentChannel = 1
        radioOpen = true
    elseif i == #restricted then
        exports['mythic_notify']:DoHudText('error', 'Failed to connect to channel')
    end
end)
RegisterKeyMapping("joinChannel1", "(Radio): Join Channel 1", "keyboard", Config.Channel1)

RegisterCommand('joinChannel2', function(data)
    --local channel = tonumber(data.channel)
	local PlayerData = ESX.GetPlayerData(_source)
    local restricted = {}

    if PlayerData.job.name == 'police' or PlayerData.job.name == 'bcso' or PlayerData.job.name == 'ambulance' then
      exports['pma-voice']:setVoiceProperty('radioEnabled', true)
        exports['pma-voice']:setRadioChannel(2)
        exports['mythic_notify']:DoHudText('inform', 'New channel: 2')
        currentChannel = 2
        radioOpen = true
    elseif i == #restricted then
        exports['mythic_notify']:DoHudText('error', 'Failed to connect to channel')
    end
end)
RegisterKeyMapping("joinChannel2", "(Radio): Join Channel 2", "keyboard", Config.Channel2)

RegisterCommand('joinChannel3', function(data)
    --local channel = tonumber(data.channel)
	local PlayerData = ESX.GetPlayerData(_source)
    local restricted = {}

    if PlayerData.job.name == 'police' or PlayerData.job.name == 'bcso' or PlayerData.job.name == 'ambulance' then
      exports['pma-voice']:setVoiceProperty('radioEnabled', true)  
      exports['pma-voice']:setRadioChannel(3)
        exports['mythic_notify']:DoHudText('inform', 'New channel: 3')
        currentChannel = 3
        radioOpen = true
    elseif i == #restricted then
        exports['mythic_notify']:DoHudText('error', 'Failed to connect to channel')
    end
end)
RegisterKeyMapping("joinChannel3", "(Radio): Join Channel 3", "keyboard", Config.Channel3)

RegisterCommand('joinChannel4', function(data)
    --local channel = tonumber(data.channel)
	local PlayerData = ESX.GetPlayerData(_source)
    local restricted = {}

    if PlayerData.job.name == 'police' or PlayerData.job.name == 'bcso' or PlayerData.job.name == 'ambulance' then
      exports['pma-voice']:setVoiceProperty('radioEnabled', true)  
      exports['pma-voice']:setRadioChannel(4)
        exports['mythic_notify']:DoHudText('inform', 'New channel: 4')
        currentChannel = 4
        radioOpen = true
    elseif i == #restricted then
        exports['mythic_notify']:DoHudText('error', 'Failed to connect to channel')
    end
end)
RegisterKeyMapping("joinChannel4", "(Radio): Join Channel 4", "keyboard", Config.Channel4)

RegisterCommand('joinChannel5', function(data)
    --local channel = tonumber(data.channel)
	local PlayerData = ESX.GetPlayerData(_source)
    local restricted = {}

    if PlayerData.job.name == 'police' or PlayerData.job.name == 'bcso' or PlayerData.job.name == 'ambulance' then
      exports['pma-voice']:setVoiceProperty('radioEnabled', true)
        exports['pma-voice']:setRadioChannel(5)
        exports['mythic_notify']:DoHudText('inform', 'New channel: 5')
        currentChannel = 5
        radioOpen = true
    elseif i == #restricted then
        exports['mythic_notify']:DoHudText('error', 'Failed to connect to channel')
    end
end)
RegisterKeyMapping("joinChannel5", "(Radio): Join Channel 5", "keyboard", Config.Channel5)

RegisterCommand('joinChannel6', function(data)
    --local channel = tonumber(data.channel)
	local PlayerData = ESX.GetPlayerData(_source)
    local restricted = {}

    if PlayerData.job.name == 'police' or PlayerData.job.name == 'bcso' or PlayerData.job.name == 'ambulance' then
      exports['pma-voice']:setVoiceProperty('radioEnabled', true)  
      exports['pma-voice']:setRadioChannel(6)
        exports['mythic_notify']:DoHudText('inform', 'New channel: 6')
        currentChannel = 6
        radioOpen = true
    elseif i == #restricted then
        exports['mythic_notify']:DoHudText('error', 'Failed to connect to channel')
    end
end)
RegisterKeyMapping("joinChannel6", "(Radio): Join Channel 6", "keyboard", Config.Channel6)

RegisterNUICallback('leaveChannel', function()
  exports['pma-voice']:setVoiceProperty('radioEnabled', false)
    exports['pma-voice']:setRadioChannel(0)
    currentChannel = 0
    radioOpen = false
    exports['mythic_notify']:DoHudText('inform', 'Radio off')
    --notify:SendAlert("inform", "Radio turned off.")
end)

RegisterNUICallback('setVolume', function(data)
    for i,v in pairs(GetActivePlayers()) do
      exports['pma-voice']:setRadioVolume(data.volume)
    end
end)

RegisterNetEvent("radioCount")
AddEventHandler("radioCount", function(count)
    if hasRadio and count ~= 0 or not hasRadio and count == 0 then return end
	
	  if count == 0 then
        exports['pma-voice']:setRadioChannel(0)
		hasRadio = false
    else
        exports['pma-voice']:setRadioChannel(currentChannel)
		hasRadio = true
    end
end)

CreateThread(function()
	while true do
		Wait(1000)
		TriggerServerEvent('getRadioCount', GetPlayerServerId(PlayerId()))
	end
end)

Citizen.CreateThread(function()
	local radioInUse = false
	while true do
		if IsControlJustPressed(PlayerPedId(), 137) and currentChannel > 0 then
			radioInUse = true
		
			local dict = "random@arrests"
			local anim = "generic_radio_enter"
			
			RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(1)
            end
				
			TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 2.0, -1, 50, 2.0, false, false, false)
		end
		if not IsControlPressed(PlayerPedId(), 137) and radioInUse then
			ClearPedTasks(PlayerPedId())
			radioInUse = false
		end
		Wait(0)
	end
end)

exports('radioOn', function ()
  if radioOpen then
      return true
  elseif not radioOpen then
      return false
  end
end)