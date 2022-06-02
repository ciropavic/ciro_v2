-- Lobby
exports.qtarget:AddBoxZone("casinoEl", vector3(959.71, 42.18, 71.7), 0.15, 1, {
    name = "casinoEl",
    heading = 15,
    -- debugPoly=true,
    minZ = 71.7,
    maxZ = 72.1
}, {
    options = {{
        event = 'ecrp-casino:casinoElevator',
        icon = 'fa-solid fa-elevator',
        label = "Elevator"
    }},
    distance = 2.0
})

-- Penthouse
exports.qtarget:AddBoxZone("casinoElPent", vector3(982.13, 53.37, 116.16), 0.2, 1, {
  name="casinoElPent",
  heading=240,
  --debugPoly=true,
  minZ=116.16,
  maxZ=116.56
}, {
    options = {{
        event = 'ecrp-casino:casinoElevatorPent',
        icon = 'fa-solid fa-elevator',
        label = "Call Elevator"
    }},
    distance = 2.0
})
-- Rooftop
exports.qtarget:AddBoxZone("casinoElRoof", vector3(964.48, 57.5, 112.55), 0.4, 0.2, {
    name = "casinoElRoof",
    heading = 330,
    -- debugPoly=true,
    minZ = 112.2,
    maxZ = 113.0
}, {
    options = {{
        event = 'ecrp-casino:casinoElevatorRoof',
        icon = 'fa-solid fa-elevator',
        label = "Call Elevator"
    }},
    distance = 2.0
})

RegisterNetEvent("ecrp-casino:casinoElevator", function()
    TriggerEvent("nh-context:createMenu", {{
        header = "Rooftop",
        context = "Rooftop pleasures",
        event = "ecrp-casino:useElevator",
        args = {964.64, 58.84, 112.55, 57.95, false}
    }, {
        header = "Penthouse",
        context = "Only for the rich",
        event = "ecrp-casino:useElevator",
        args = {981.82, 54.64, 116.16, 328.27, false}
    }, {
        header = "Lobby",
        context = "Gamba time",
        event = "ecrp-casino:useElevator",
        disabled = true,
        args = {960.53, 43.36, 70.71, 285.91, true}
    }})
end)

RegisterNetEvent("ecrp-casino:casinoElevatorRoof", function()
    TriggerEvent("nh-context:createMenu", {{
        header = "Rooftop",
        context = "Rooftop pleasures",
        event = "ecrp-casino:useElevator",
        disabled = true,
        args = {964.64, 58.84, 112.55, 57.95, false}
    }, {
        header = "Penthouse",
        context = "Only for the rich",
        event = "ecrp-casino:useElevator",
        args = {981.82, 54.64, 116.16, 328.27, false}
    }, {
        header = "Lobby",
        context = "Gamba time",
        event = "ecrp-casino:useElevator",
        args = {960.53, 43.36, 70.71, 285.91, true}
    }})
end)

RegisterNetEvent("ecrp-casino:casinoElevatorPent", function()
    TriggerEvent("nh-context:createMenu", {{
        header = "Rooftop",
        context = "Rooftop pleasures",
        event = "ecrp-casino:useElevator",
        args = {964.64, 58.84, 112.55, 57.95, false}
    }, {
        header = "Penthouse",
        context = "Only for the rich",
        event = "ecrp-casino:useElevator",
        disabled = true,
        args = {981.82, 54.64, 116.16, 328.27, false}
    }, {
        header = "Lobby",
        context = "Gamba time",
        event = "ecrp-casino:useElevator",
        args = {960.53, 43.36, 70.71, 285.91, true}
    }})
end)

RegisterNetEvent('ecrp-casino:useElevator')
AddEventHandler('ecrp-casino:useElevator', function(x, y, z, heading, inCasino)
    if lib.progressBar({
        duration = 10000,
        label = 'Calling Elevator',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            combat = true
        }
    }) then
        DoScreenFadeOut(500)
        Wait(500)
        NetworkFadeOutEntity(PlayerPedId(), true, true)
        Wait(300)
        SetPedCoordsKeepVehicle(PlayerPedId(), x, y, z)
        SetEntityHeading(PlayerPedId(), heading)
        ClearPedTasksImmediately(PlayerPedId())
        SetGameplayCamRelativeHeading(0.0)
        NetworkFadeInEntity(PlayerPedId(), true)
        enterCasino(inCasino)
        Wait(500)
        DoScreenFadeIn(500)
    end
end)
