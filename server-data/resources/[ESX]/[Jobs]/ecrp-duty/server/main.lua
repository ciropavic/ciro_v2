ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local dutyjobsinfo = {}
local offdutyjobsinfo = {}
local OnDutyJobsList = {}
local OffDutyJobsList = {}

Citizen.CreateThread(function()
	for k,v in pairs(Config.Jobs) do
		if not dutyjobsinfo[v.job] then OnDutyJobsList[#OnDutyJobsList+1] = v.job end
		if not offdutyjobsinfo[v.offjob] then OffDutyJobsList[#OffDutyJobsList+1] = v.offjob end
		dutyjobsinfo[v.job] = v.offjob
		offdutyjobsinfo[v.offjob] = v.job
	end
end)

RegisterServerEvent('esx_duty:signoff')
AddEventHandler('esx_duty:signoff', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    
    if dutyjobsinfo[job] then
        xPlayer.setJob(dutyjobsinfo[job], grade)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = '10-42'})
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Already off duty'})
    end
end)

RegisterServerEvent('esx_duty:signon')
AddEventHandler('esx_duty:signon', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    
  if offdutyjobsinfo[job] then
    xPlayer.setJob(offdutyjobsinfo[job], grade)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = '10-41 and Restocked'})
  else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Already on duty'})
  end
end)
