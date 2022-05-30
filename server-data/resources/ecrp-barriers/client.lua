RegisterNetEvent('barriers:pickup')
RegisterNetEvent('barriers:cone')
RegisterNetEvent('barriers:sbarrier')
RegisterNetEvent('barriers:barrier')

objList = {
    [1] = "prop_mp_cone_01",
    [2] = "prop_mp_barrier_02b",
    [3] = "prop_barrier_work05",
    [4] = "prop_flare_01",
    [5] = "prop_flare_01b",
    [6] = "prop_mp_cone_01"
}

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

AddEventHandler('barriers:pickup', function()
    if lib.progressBar({
        duration = 1800,
        label = 'Picking up barrier',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true
        },
        anim = {
            dict = 'anim@narcotics@trash',
            clip = 'drop_front'
        }
    }) then
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.25, 0.0))
        local heading = GetEntityHeading(PlayerPedId())
        local objFound = 0
        for i = 1, #objList do
            local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.25, 0.0))
            objFound = GetClosestObjectOfType(x, y, z, 5.0, GetHashKey(objList[i]), 0, 0, 0)
            DeleteObject(objFound)
            DeleteEntity(objFound)

            DeleteObject(objFound)
            DeleteEntity(objFound)
        end
    else
        ClearPedSecondaryTask(PlayerPedId())
    end
end)

AddEventHandler('barriers:cone', function()
    if lib.progressBar({
        duration = 1800,
        label = 'Placing cone',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true
        },
        anim = {
            dict = 'anim@narcotics@trash',
            clip = 'drop_front'
        }
    }) then
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.2, 0.0))
        local heading = GetEntityHeading(PlayerPedId())
        RequestModel(`prop_mp_cone_01`)
        while not HasModelLoaded(`prop_mp_cone_01`) do
            Citizen.Wait(1)
        end
        local cone = CreateObject(`prop_mp_cone_01`, x, y, z, true, false, false)
        PlaceObjectOnGroundProperly(cone)
        SetEntityHeading(cone, heading)
    else
        ClearPedSecondaryTask(PlayerPedId())
    end
end)

AddEventHandler('barriers:sbarrier', function()
    if lib.progressBar({
        duration = 1800,
        label = 'Placing barrier',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true
        },
        anim = {
            dict = 'anim@narcotics@trash',
            clip = 'drop_front'
        }
    }) then
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.2, 0.0))
        local heading = GetEntityHeading(PlayerPedId())
        RequestModel(`prop_barrier_work05`)
        while not HasModelLoaded(`prop_barrier_work05`) do
            Citizen.Wait(1)
        end
        local sbarrier = CreateObject(`prop_barrier_work05`, x, y, z, true, false, false)
        PlaceObjectOnGroundProperly(sbarrier)
        SetEntityHeading(sbarrier, heading)
    else
        ClearPedSecondaryTask(PlayerPedId())
    end
end)

AddEventHandler('barriers:barrier', function()
    if lib.progressBar({
        duration = 1800,
        label = 'Placing barrier',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true
        },
        anim = {
            dict = 'anim@narcotics@trash',
            clip = 'drop_front'
        }
    }) then
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.2, 0.0))
        local c1x, c1y, c1z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 1.5, 2.2, 0.0))
        local c2x, c2y, c2z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), -1.5, 2.2, 0.0))
        local heading = GetEntityHeading(PlayerPedId())
        RequestModel(`prop_barrier_work05`)
        while not HasModelLoaded(`prop_barrier_work05`) do
            Citizen.Wait(1)
        end
        local barrier = CreateObject(`prop_barrier_work05`, x, y, z, true, false, false)
        local cone = CreateObject(`prop_mp_cone_01`, c1x, c1y, c1z, true, false, false)
        local cone2 = CreateObject(`prop_mp_cone_01`, c2x, c2y, c2z, true, false, false)
        PlaceObjectOnGroundProperly(barrier)
        PlaceObjectOnGroundProperly(cone)
        PlaceObjectOnGroundProperly(cone2)
        SetEntityHeading(barrier, heading)
    else
        ClearPedSecondaryTask(PlayerPedId())
    end
end)

