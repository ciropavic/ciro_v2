function ReturnClosestPlayers(target_dist, show_outsidecar)
    local ped = PlayerPedId()
    local mycoords = GetEntityCoords(ped)
    for c, d in pairs(GetActivePlayers()) do
        local targetped = GetPlayerPed(d)
        local targetcoords = GetEntityCoords(targetped)
        local dist = #(mycoords-targetcoords)
        if dist < target_dist and ped ~= targetped then
            if show_outsidecar then
                if not IsPedInAnyVehicle(targetped, true) then
                    return GetPlayerServerId(d)
                end
            else
                return GetPlayerServerId(d)
            end           
        end
    end
    return nil
end

RegisterNetEvent('cd_identity:ShowIDCard_1')
AddEventHandler('cd_identity:ShowIDCard_1', function()
    TriggerServerEvent('cd_identity:ShowIDCard_2', TakeMugshot(), ReturnClosestPlayers(Config.IDcard.Usage.distance_1, false))
end)

RegisterNetEvent('cd_identity:OpenIdentityUI')
AddEventHandler('cd_identity:OpenIdentityUI', function(charid)
    while not Authorised do Wait(1000) end
    while not NetworkIsPlayerActive(PlayerId()) do Wait(100) end
    OpenIdentityUI(charid)
end)

RegisterNetEvent('cd_identity:ResourceRestart')
AddEventHandler('cd_identity:ResourceRestart', function()
    while not Authorised do Wait(1000) end
    TriggerServerEvent('cd_identity:CacheIdentityData')
end)

RegisterNetEvent('cd_identity:IdentityLoaded')
AddEventHandler('cd_identity:IdentityLoaded', function()
    IdentityLoaded = true
end)