ESX = nil

Citizen.CreateThread(function()
    PlayerData = ESX.GetPlayerData()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)

        Citizen.Wait(0)
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        DrawMarker(36, 463.51, -1019.57, 27.39 + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 255, 255, 100,
            false, true, 2, nil, nil, false)
    end
end)

local pdbuycar = BoxZone:Create(vector3(463.47, -1019.75, 28.14), 4.0, 4.4, {
    name = "pdbuycar",
    heading = 0,
    -- debugPoly=true,
    minZ = 26.94,
    maxZ = 31.14
})

local insideShop = false
pdbuycar:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>Vehicle Shop</B>', 'blue', 'blue')
        insideShop = true
    else
        TriggerEvent('cd_drawtextui:HideUI')
        insideShop = false
    end
end)

RegisterNetEvent('ecrp-policegarage:shopMain', function()
    TriggerEvent('nh-context:createMenu', {{
        header = "Police Vehicle Shop"
    }, {
        header = "Marked",
        event = "ecrp-policegarage:shopmarked",
        subMenu = true
    }, {
        header = "Unmarked",
        event = "ecrp-policegarage:shopunmarked",
        subMenu = true
    }})
end)

RegisterNetEvent('ecrp-policegarage:shopmarked', function()
    TriggerEvent('nh-context:createMenu', {{
        header = "<< Go Back",
        event = "ecrp-policegarage:shopMain"
    }, {
        header = "Ford Crown Victoria",
        context = "$150,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"npolvic", 150000},
    }, {
        header = "Ford Explorer",
        context = "$600,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"npolexp", 600000},
    }, {
        header = "Dodge Charger",
        context = "$775,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"npolchar", 775000},
    }, {
        header = "Chevrolet Corvette",
        context = "$1,300,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"npolvette", 1300000},
    }, {
        header = "Ford Mustang",
        context = "$1,400,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"npolstang", 1400000},
    }, {
        header = "Dodge Challenger",
        context = "$1,600,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"npolchal", 1600000},
    }, {
        header = "Motorcycle",
        context = "$450,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"npolmm", 450000},
    }, {
        header = "Ranger ATV",
        context = "$55,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"npolblazer", 55000},
    }})
end)

RegisterNetEvent('ecrp-policegarage:shopunmarked', function()
    TriggerEvent('nh-context:createMenu', {{
        header = "<< Go Back",
        event = "ecrp-policegarage:shopMain"
    }, {
        header = "Baller",
        context = "$425,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"ucballer", 425000},
    }, {
        header = "Banshee",
        context = "$500,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"ucbanshee", 500000},
    }, {
        header = "Buffalo",
        context = "$600,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"ucbuffalo", 600000},
    }, {
        header = "Comet",
        context = "$750,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"uccomet", 750000},
    }, {
        header = "Comet 2",
        context = "$800,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"uccomet2", 800000},
    }, {
        header = "Coquette",
        context = "$775,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"uccoquette", 775000},
    }, {
        header = "Primo",
        context = "$250,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"ucprimo", 250000},
    }, 
    {
        header = "Rancher",
        context = "$350,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"ucrancher", 350000},
    },
    {
        header = "Washington",
        context = "$300,000",
        event = "ecrp-policegarage:checkmoney",
        server = true,
        args = {"ucwashington", 300000},
    },
  })
end)

-- Spawn police vehicles
RegisterNetEvent('ecrp-policegarage:spawnveh')
AddEventHandler('ecrp-policegarage:spawnveh', function(model)
    if not IsModelInCdimage(model) then
        return
    end
    RequestModel(model)

    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end

    local vehicle = CreateVehicle(model, 463.34, -1019.75, 27.39, 89.35, true, true)
    local plate = GetVehicleNumberPlateText(vehicle)
    exports["onyxLocksystem"]:givePlayerKeys(plate)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetVehicleDirtLevel(vehicle, 0.0)
    exports["ecrp-fuel"]:SetFuel(vehicle, 100)
    SetVehicleModKit(vehicle, 0)
    SetVehicleMod(vehicle, 48, -1, false)
    SetModelAsNoLongerNeeded(model)
    
    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
    TriggerServerEvent('ecrp-policegarage:addPersonalVeh', vehicleProps, vehicleProps.plate)
end)

function InShop()
    if insideShop then
        return true
    elseif not insideShop then
        return false
    end
end
exports('InShop', InShop)
