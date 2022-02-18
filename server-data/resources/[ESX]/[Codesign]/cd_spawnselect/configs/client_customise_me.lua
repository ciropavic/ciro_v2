--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore = nil, nil

Citizen.CreateThread(function()
    if Config.Framework == 'esx' then
        while ESX == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
            Citizen.Wait(100)
        end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function(xPlayer)
            if GetResourceState('cd_multicharacter') ~= 'started' and GetResourceState('cd_identity') ~= 'started' then
                ESX.TriggerServerCallback('cd_spawnselect:CheckIfNew', function(is_new)
                    if not is_new then
                        DoScreenFadeIn(0)
                        Citizen.Wait(2000)
                        TriggerEvent('cd_spawnselect:OpenUI')
                    end
                end)
            end
            ESX.PlayerData = xPlayer
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(job)
            ESX.PlayerData.job = job
        end)
    
    elseif Config.Framework == 'qbcore' then
        while QBCore == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
            if QBCore == nil then
                QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
            end
            Citizen.Wait(100)
        end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function()

        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(JobInfo)
            QBCore.Functions.GetPlayerData().job = JobInfo
        end)

        RegisterNetEvent('qb-spawn:client:openUI')
        AddEventHandler('qb-spawn:client:openUI', function()
            DoScreenFadeIn(0)
            Citizen.Wait(2000)
            TriggerEvent('cd_spawnselect:OpenUI')
        end)
    
    elseif Config.Framework == 'vrp' or Config.Framework == 'none' then
        Citizen.CreateThread(function()
            DoScreenFadeIn(0)
            Citizen.Wait(2000)
            while true do
                Citizen.Wait(0)
                if NetworkIsSessionStarted() then
                    TriggerEvent('cd_spawnselect:OpenUI')
                    break
                end
            end
        end)

        
    elseif Config.Framework == 'other' then
        --add your framework code here.

    end
end)

function GetJob()
    if Config.Framework == 'esx' then
        while ESX.PlayerData == nil or ESX.PlayerData.job == nil or ESX.PlayerData.job.name == nil do
            Citizen.Wait(0)
        end
        return ESX.PlayerData.job.name or 'unemployed'
    
    elseif Config.Framework == 'qbcore' then
        while QBCore.Functions.GetPlayerData() == nil or QBCore.Functions.GetPlayerData().job == nil or QBCore.Functions.GetPlayerData().job.name == nil do
            Citizen.Wait(0)
        end
        return QBCore.Functions.GetPlayerData().job.name or 'unemployed'

    elseif Config.Framework == 'vrp' or Config.Framework == 'none' then
        return 'unemployed'

    elseif Config.Framework == 'other' then
        return 'unemployed' --return a players job name (string).
    end
end


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


RegisterNetEvent('cd_spawnselect:OpenUI')
AddEventHandler('cd_spawnselect:OpenUI', function(coords)
    while not Authorised do Wait(0) end
    OpenSpawnSelectUI(coords)
end)

function HasFullySpawnedIn(coords) --coords: your chosen spawn location (in a table format {x,y,z,h} ).
    local ped = PlayerPedId()
    RequestCollisionAtCoord(coords.x, coords.y, coords.z) while not HasCollisionLoadedAroundEntity(ped) do RequestCollisionAtCoord(coords.x, coords.y, coords.z) Citizen.Wait(1) end
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.h)
    FreezeEntityPosition(ped, true)
    SetEntityVisible(ped, false, 0)
    SetPlayerInvincible(ped, true)
    SetPlayerInvisibleLocally(ped, true)

    HandleCam(coords)
    
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true, 0)
    SetPlayerInvincible(ped, false)
    SetPlayerInvisibleLocally(ped, false)
    DisplayHud(true)
    DisplayRadar(true)
    local visible = IsEntityVisible(ped)
    if not visible then
        SetEntityVisible(ped, true, 0)
        FreezeEntityPosition(ped, false)
        SetEntityCoords(ped, coords.x, coords.y, coords.z)
        SetEntityHeading(ped, coords.h)
    end
    
    if Config.Framework == 'qbcore' then
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
    end
    ------------------------------------------------------------------------------------------------------
    --Add any trigger events here.

    ------------------------------------------------------------------------------------------------------
end


-- ██████╗██╗  ██╗ █████╗ ████████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██╔════╝██║  ██║██╔══██╗╚══██╔══╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--██║     ███████║███████║   ██║       ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██║     ██╔══██║██╔══██║   ██║       ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--╚██████╗██║  ██║██║  ██║   ██║       ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


if Config.SpawnOptions.personal then
    TriggerEvent('chat:addSuggestion', '/'..Config.SpawnOptions.personal_command, 'Customise and choose a personal spawn location', {{ name="action", help='[show / set / delete]'}, { name="name", help='Enter the name of your chosen spawn location'}})
    RegisterCommand(Config.SpawnOptions.personal_command, function(source, args)
        local action = args[1]
        local name = args[2]

        if action then
            if action == 'show' then
                TriggerServerEvent('cd_spawnselect:Command', action)

            elseif action == 'set' then
                if name then
                    if #name <= 10 then
                        local ped = PlayerPedId()
                        local coords = GetEntityCoords(ped)
                        local heading = GetEntityHeading(ped)
                        local personal_spawn = {x = round(coords.x), y = round(coords.y), z = round(coords.z), h = round(heading), name = name}
                        TriggerServerEvent('cd_spawnselect:Command', action, personal_spawn)
                    else
                        Notif(3, 'command_maxchars')
                    end
                else
                    Notif(3, 'command_choosename', Config.SpawnOptions.personal_command)
                end

            elseif action == 'delete' then
                TriggerServerEvent('cd_spawnselect:Command', action)
            else
                Notif(3, 'command_invalidformat', Config.SpawnOptions.personal_command)
            end
        else
            Notif(3, 'command_invalidformat', Config.SpawnOptions.personal_command)
        end
    end)
end

if Config.EnableTestCommand then
    RegisterCommand('openspawnselect', function()
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        TriggerEvent('cd_spawnselect:OpenUI', coords)
    end)
end


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(notif_type, message)
    if notif_type and message then
        if Config.NotificationType.client == 'esx' then
            ESX.ShowNotification(message)
        
        elseif Config.NotificationType.client == 'qbcore' then
            if notif_type == 1 then
                QBCore.Functions.Notify(message, 'success')
            elseif notif_type == 2 then
                QBCore.Functions.Notify(message, 'primary')
            elseif notif_type == 3 then
                QBCore.Functions.Notify(message, 'error')
            end

        elseif Config.NotificationType.client == 'mythic_old' then
            if notif_type == 1 then
                exports['mythic_notify']:DoCustomHudText('success', message, 10000)
            elseif notif_type == 2 then
                exports['mythic_notify']:DoCustomHudText('inform', message, 10000)
            elseif notif_type == 3 then
                exports['mythic_notify']:DoCustomHudText('error', message, 10000)
            end

        elseif Config.NotificationType.client == 'mythic_new' then
            if notif_type == 1 then
                exports['mythic_notify']:SendAlert('success', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 2 then
                exports['mythic_notify']:SendAlert('inform', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 3 then
                exports['mythic_notify']:SendAlert('error', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            end

        elseif Config.NotificationType.client == 'chat' then
            TriggerEvent('chatMessage', message)
            
        elseif Config.NotificationType.client == 'other' then
            --add your own notification.
            
        end
    end
end
