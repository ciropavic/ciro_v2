-- ESX Start
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)

        Citizen.Wait(0)
    end
end)

local spawner = { 
  -- Apartments
{x = -297.75103759766, y = -990.17083740234, z = 30.382287979126, h = 160.48181152344},
{x = -301.13061523438, y = -989.25421142578, z = 30.382507324219, h = 159.13877868652},
{x = -304.76168823242, y = -987.94537353516, z = 30.382326126099, h = 160.21347045898},
{x = -308.1022644043, y = -986.42156982422, z = 30.382331848145, h = 160.2209777832},
{x = -311.48770141602, y = -985.13073730469, z = 30.381658554077, h = 160.04656982422},
{x = -315.02319335938, y = -983.90789794922, z = 30.382717132568, h = 159.42034912109},
{x = -318.62377929688, y = -982.68408203125, z = 30.382619857788, h = 160.26667785645},
{x = -321.98165893555, y = -981.45068359375, z = 30.382167816162, h = 159.37214660645},
{x = -325.5563659668, y = -980.07800292969, z = 30.383239746094, h = 161.51536560059},
{x = -328.95230102539, y = -978.86938476563, z = 30.382530212402, h = 158.70896911621},
{x = -332.53405761719, y = -977.62048339844, z = 30.382936477661, h = 160.90693664551},
{x = -335.91452026367, y = -976.53582763672, z = 30.382148742676, h = 159.15158081055},
{x = -339.44738769531, y = -975.05773925781, z = 30.382076263428, h = 160.82446289063},
{x = -342.83990478516, y = -973.77862548828, z = 30.382375717163, h = 159.57429504395},
{x = -346.30346679688, y = -972.55688476563, z = 30.382083892822, h = 159.47114562988},
{x = -349.67657470703, y = -971.28735351563, z = 30.382110595703, h = 159.11413574219},
{x = -353.1916809082, y = -969.87188720703, z = 30.38210105896, h = 158.80892944336},
{x = -356.79992675781, y = -968.78692626953, z = 30.381502151489, h = 159.5834197998},
-- Pink Cage
{x = 276.92697143555, y = -339.90936279297, z = 44.222145080566, h = 249.58587646484},
{x = 278.21887207031, y = -336.54647827148, z = 44.221649169922, h = 249.66078186035},
{x = 279.30474853516, y = -333.34573364258, z = 44.221717834473, h = 249.17852783203},
{x = 280.56042480469, y = -330.1383972168, z = 44.22176361084, h = 248.80285644531},
{x = 281.76080322266, y = -326.9118347168, z = 44.222385406494, h = 247.98779296875},
{x = 282.96514892578, y = -323.66934204102, z = 44.221817016602, h = 249.35446166992},
{x = 289.40991210938, y = -326.24847412109, z = 44.221912384033, h = 69.846321105957},
{x = 288.21612548828, y = -329.34338378906, z = 44.221660614014, h = 70.589042663574},
{x = 287.11434936523, y = -332.63626098633, z = 44.222156524658, h = 69.844192504883},
{x = 285.95431518555, y = -335.97366333008, z = 44.221466064453, h = 69.427688598633},
{x = 284.8313293457, y = -339.10357666016, z = 44.221202850342, h = 69.856422424316},
{x = 283.45956420898, y = -342.49523925781, z = 44.222278594971, h = 69.823715209961},
-- Casino
{x = 894.89868164063, y = -5.5265755653381, z = 78.065734863281, h = 327.04611206055},
{x = 898.24841308594, y = -7.622875213623, z = 78.06568145752, h = 327.04611206055},
{x = 901.56231689453, y = -9.7840633392334, z = 78.065589904785, h = 327.04611206055},
{x = 904.98175048828, y = -11.796902656555, z = 78.066612243652, h = 327.04611206055},
{x = 908.40026855469, y = -13.988408088684, z = 78.066566467285, h = 327.04611206055},
{x = 911.76208496094, y = -16.190013885498, z = 78.065849304199, h = 327.04611206055},
-- Mirror Park
{x = 1030.4437255859, y = -787.86853027344, z = 57.351222991943, h = 129.39399719238},
{x = 1028.0716552734, y = -784.86413574219, z = 57.360961914063, h = 129.39399719238},
{x = 1025.908203125, y = -781.93963623047, z = 57.367191314697, h = 129.39399719238},
{x = 1023.2981567383, y = -779.06872558594, z = 57.368171691895, h = 129.39399719238},
{x = 1020.9409790039, y = -776.16418457031, z = 57.370769500732, h = 129.39399719238},
{x = 1018.5529785156, y = -773.33172607422, z = 57.382774353027, h = 129.39399719238},
{x = 1016.2561645508, y = -770.42834472656, z = 57.371845245361, h = 129.39399719238},
-- Paleto
{x = -77.211029052734, y = 6347.1420898438, z = 30.792123794556, h = 224.51022338867},
{x = -80.012809753418, y = 6344.4350585938, z = 30.792608261108, h = 224.51022338867},
{x = -82.842391967773, y = 6341.75390625, z = 30.792699813843, h = 224.51022338867},
{x = -85.320922851563, y = 6339.0073242188, z = 30.791818618774, h = 224.51022338867},
{x = -80.065101623535, y = 6333.65625, z = 30.791198730469, h = 44.527069091797},
{x = -77.439910888672, y = 6336.4125976563, z = 30.792781829834, h = 44.527069091797},
{x = -74.780212402344, y = 6339.0263671875, z = 30.792066574097, h = 44.527069091797},
{x = -72.08943939209, y = 6341.9370117188, z = 30.791791915894, h = 44.527069091797},
-- Uwu Cafe
{x = -573.01123046875, y = -1100.9536132813, z = 21.651517868042, h = 90.279716491699},
{x = -573.02075195313, y = -1104.6618652344, z = 21.651514053345, h = 90.279716491699},
{x = -573.07067871094, y = -1108.2747802734, z = 21.651344299316, h = 90.279716491699},
{x = -572.89874267578, y = -1111.8999023438, z = 21.650579452515, h = 90.279716491699},
{x = -572.90533447266, y = -1115.6630859375, z = 21.651338577271, h = 90.279716491699},
{x = -573.02789306641, y = -1119.3356933594, z = 21.651256561279, h = 90.279716491699},
{x = -572.92431640625, y = -1123.0808105469, z = 21.651264190674, h = 90.279716491699},
{x = -572.93780517578, y = -1126.6907958984, z = 21.651050567627, h = 90.279716491699},
{x = -572.91595458984, y = -1130.3165283203, z = 21.651643753052, h = 90.279716491699},
{x = -572.92755126953, y = -1134.0109863281, z = 21.651584625244, h = 90.279716491699},
-- Uwu Cafe 2
{x = -582.12725830078, y = -1133.9069824219, z = 21.651220321655, h = 269.16271972656},
{x = -582.23291015625, y = -1130.1591796875, z = 21.651424407959, h = 269.16271972656},
{x = -582.19732666016, y = -1126.6121826172, z = 21.651245117188, h = 269.16271972656},
{x = -582.22351074219, y = -1122.9434814453, z = 21.651584625244, h = 269.16271972656},
{x = -582.18341064453, y = -1119.2523193359, z = 21.650951385498, h = 269.16271972656},
{x = -582.04705810547, y = -1115.6099853516, z = 21.651844024658, h = 269.16271972656},
{x = -582.23010253906, y = -1111.9105224609, z = 21.650957107544, h = 269.16271972656},
{x = -582.15747070313, y = -1108.2248535156, z = 21.651817321777, h = 269.16271972656},
{x = -582.16400146484, y = -1104.5408935547, z = 21.651222229004, h = 269.16271972656},
{x = -582.09692382813, y = -1100.9846191406, z = 21.651248931885, h = 269.16271972656},
-- Pier
{x = -1590.4520263672, y = -1036.2794189453, z = 12.53427696228, h = 205.85089111328},
{x = -1587.9122314453, y = -1033.6374511719, z = 12.534161567688, h = 203.87768554688},
{x = -1585.5718994141, y = -1030.5900878906, z = 12.534735679626, h = 204.62689208984},
{x = -1583.2540283203, y = -1027.6818847656, z = 12.534880638123, h = 203.88916015625},
{x = -1580.9094238281, y = -1024.8666992188, z = 12.535097122192, h = 205.51252746582},
{x = -1578.6004638672, y = -1022.1055297852, z = 12.534299850464, h = 203.7095489502},
{x = -1576.2005615234, y = -1019.1477050781, z = 12.534275054932, h = 203.95393371582},
{x = -1573.6954345703, y = -1016.5882568359, z = 12.534638404846, h = 204.16879272461},
{x = -1571.3483886719, y = -1013.5702514648, z = 12.534304618835, h = 203.99356079102},
{x = -1568.8612060547, y = -1010.7911987305, z = 12.53466129303, h = 203.4528503418},
{x = -1566.4727783203, y = -1007.8209838867, z = 12.534271240234, h = 203.63423156738},
{x = -1564.0819091797, y = -1004.9247436523, z = 12.534689903259, h = 204.68609619141},
{x = -1561.5635986328, y = -1002.1983642578, z = 12.533581733704, h = 203.31517028809},
{x = -1559.2362060547, y = -999.32000732422, z = 12.533630371094, h = 204.7818145752},
{x = -1556.9356689453, y = -996.25494384766, z = 12.533668518066, h = 203.42988586426},
{x = -1554.5059814453, y = -993.31353759766, z = 12.534134864807, h = 204.27618408203},
{x = -1551.9833984375, y = -990.58685302734, z = 12.533259391785, h = 204.26976013184},
{x = -1549.5927734375, y = -987.60235595703, z = 12.534009933472, h = 203.07257080078},
{x = -1547.1362304688, y = -984.92102050781, z = 12.533676147461, h = 203.97134399414},
{x = -1543.6055908203, y = -992.52130126953, z = 12.533866882324, h = 23.575275421143},
{x = -1546.0703125, y = -995.28198242188, z = 12.533574104309, h = 23.118236541748},
{x = -1548.4923095703, y = -998.12451171875, z = 12.533638000488, h = 24.40571975708},
{x = -1550.9162597656, y = -1000.9817504883, z = 12.534227371216, h = 26.286842346191},
{x = -1553.3872070313, y = -1003.7652587891, z = 12.533929824829, h = 26.745498657227},
{x = -1555.5424804688, y = -1007.0243530273, z = 12.534215927124, h = 23.226554870605},
{x = -1558.0131835938, y = -1009.7853393555, z = 12.533627510071, h = 24.314685821533},
{x = -1560.5604248047, y = -1012.6585693359, z = 12.534157752991, h = 22.870742797852},
{x = -1562.9362792969, y = -1015.4942626953, z = 12.533550262451, h = 25.036615371704},
{x = -1565.4130859375, y = -1018.2064208984, z = 12.534701347351, h = 22.895456314087},
{x = -1567.8795166016, y = -1020.8701171875, z = 12.53465461731, h = 24.18034362793},
{x = -1570.1136474609, y = -1024.0411376953, z = 12.534407615662, h = 25.522871017456},
{x = -1572.5451660156, y = -1026.9105224609, z = 12.533857345581, h = 24.75101852417},
{x = -1574.8707275391, y = -1029.9234619141, z = 12.534311294556, h = 23.927152633667},
{x = -1577.3688964844, y = -1032.5421142578, z = 12.534275054932, h = 24.249238967896},
{x = -1579.7358398438, y = -1035.1333007813, z = 12.534453392029, h = 24.450666427612},
{x = -1582.2481689453, y = -1037.8988037109, z = 12.534391403198, h = 22.696731567383},
{x = -1584.6618652344, y = -1040.7054443359, z = 12.534172058105, h = 24.680324554443},
{x = -1587.2081298828, y = -1043.4671630859, z = 12.534525871277, h = 22.376977920532},
-- Sandy
{x = 1962.6041259766, y = 3766.4165039063, z = 31.711715698242, h = 210.00016784668},
{x = 1959.3708496094, y = 3764.6574707031, z = 31.714567184448, h = 210.00016784668},
{x = 1956.1104736328, y = 3762.8000488281, z = 31.716785430908, h = 210.00016784668},
{x = 1953.0041503906, y = 3761.1364746094, z = 31.719333648682, h = 210.00016784668},
{x = 1949.7108154297, y = 3758.9450683594, z = 31.721240997314, h = 210.00016784668},
}

-- PolyZones
local apartmentsParking = BoxZone:Create(vector3(-327.45, -979.65, 31.08), 6.2, 66.4, {
    name = "apartmentsParking",
    heading = 340,
    -- debugPoly=true,
    minZ = 30.08,
    maxZ = 34.08
})

local pinkCageParking = BoxZone:Create(vector3(283.33, -333.18, 44.92), 21.6, 12.6, {
  name="pinkCageParking",
  heading=339,
  --debugPoly=true,
  minZ=43.92,
  maxZ=47.92
})

local casinoParking = BoxZone:Create(vector3(903.75, -10.48, 78.76), 24.0, 6.4, {
  name="casinoParking",
  heading=58,
  --debugPoly=true,
  minZ=77.76,
  maxZ=81.76
})

local mirrorParking = BoxZone:Create(vector3(1022.72, -779.55, 57.85), 26.2, 4.8, {
  name="mirrorParking",
  heading=219,
  --debugPoly=true,
  minZ=56.85,
  maxZ=60.85
})

local paletoParking = BoxZone:Create(vector3(-78.77, 6340.55, 31.62), 15.6, 12.0, {
  name="paletoParking",
  heading=134,
  --debugPoly=true,
  minZ=30.47,
  maxZ=34.47
})

local uwuParking1 = BoxZone:Create(vector3(-573.18, -1117.42, 22.18), 36.8, 5.6, {
  name="uwuParking1",
  heading=0,
  --debugPoly=true,
  minZ=21.18,
  maxZ=25.18
})

local uwuParking2 = BoxZone:Create(vector3(-581.85, -1117.52, 22.18), 37.0, 5.6, {
  name="uwuParking2",
  heading=0,
  --debugPoly=true,
  minZ=21.18,
  maxZ=25.18
})

local pierParking = BoxZone:Create(vector3(-1566.93, -1014.21, 13.02), 11.0, 77.400000000001, {
  name="pierParking",
  heading=50,
  -- debugPoly=true,
  minZ=12.02,
  maxZ=16.02
})

local sandyParking = BoxZone:Create(vector3(1956.43, 3762.33, 32.2), 18.4, 5.0, {
  name="sandyParking",
  heading=300,
  --debugPoly=true,
  minZ=31.2,
  maxZ=35.2
})


local parkingZones = ComboZone:Create({apartmentsParking, pinkCageParking, casinoParking, mirrorParking, paletoParking, uwuParking1, uwuParking2, pierParking, sandyParking}, {
    -- debugPoly = true
})

local insideGarage = false
parkingZones:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>Parking</B>', 'blue', 'blue')
        insideGarage = true
    else
        TriggerEvent('cd_drawtextui:HideUI')
        insideGarage = false
    end
end)

RegisterNetEvent('ecrp-garage:Main', function()
    TriggerEvent('nh-context:createMenu', {{
        header = "<B>Parking</B>"
    }, {
        header = "Retrieve",
        context = "<span style='color: grey;'>Take owned vehicle from garage</span>",
        event = "ecrp-garage:openGarage"
    }, {
        header = "Store",
        context = "<span style='color: grey;'>Store vehicle to the parking garage</span>",
        event = "ecrp-garage:storeVehicle"
    }})
end)

local vehMenu = {{
    header = "<B><< Go Back</B>",
    context = "",
    event = "ecrp-garage:Main"
}}

-- checks for dupe vehicls in vehMenu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if vehMenu[2] then
            table.remove(vehMenu)
        end
    end
end)

-- store vehicles
RegisterNetEvent('ecrp-garage:storeVehicle')
AddEventHandler('ecrp-garage:storeVehicle', function()
    local playerPed = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(playerPed)
    if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
        ESX.TriggerServerCallback('ecrp-garage:validCar', function(cb)
            if cb then
                local vehProps = ESX.Game.GetVehicleProperties(playerVeh)
                ESX.TriggerServerCallback('ecrp-garage:saveVehicle', function(cb)
                    if cb then
                        ESX.Game.DeleteVehicle(playerVeh)
                        exports['mythic_notify']:DoHudText('inform', 'Your vehicle was stored')
                    else
                        exports['mythic_notify']:DoHudText('error',
                            'An error ocurred, try again. If this persist contact with an admin')
                    end
                end, vehProps)
            end
        end)
    end
end)

-- take out vehicles
RegisterNetEvent('ecrp-garage:openGarage')
AddEventHandler('ecrp-garage:openGarage', function()
    ESX.TriggerServerCallback('ecrp-garage:getVehicleList', function(cb)
        if cb ~= "notCars" then

            PreloadAllVehicles(cb)

            -- Menu display
            for k, v in pairs(cb) do
                local vehName = GetLabelText(GetDisplayNameFromVehicleModel(v.vehicle.model))

                if v.stored == 1 then
                    table.insert(vehMenu, {
                        header = vehName,
                        context = '<span style="color: green;">Stored</span>',
                        event = "ecrp:personalVehSpawn",
                        id = "4",
                        args = {v.vehicle.model, v.vehicle.plate, v.vehicle}
                    })
                else
                    table.insert(vehMenu, {
                        header = vehName,
                        context = '<span style="color: red;">Out</span>'
                    })
                end
            end
            TriggerEvent('nh-context:createMenu', vehMenu)

        else
            print('no vehicles?')
        end
    end)
end)

-- Spawn vehicles
RegisterNetEvent('ecrp:personalVehSpawn')
AddEventHandler('ecrp:personalVehSpawn', function(model, plate, mods)
    ESX.TriggerServerCallback('ecrp-garage:changeStatus', function(cb)
        for k in pairs(spawner) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, spawner[k].x, spawner[k].y, spawner[k].z)

            
            if dist <= 3.0 then
                ESX.Game.SpawnVehicle(model, vector3(spawner[k].x, spawner[k].y, spawner[k].z), spawner[k].h,
                    function(vehicle)
                        ESX.Game.SetVehicleProperties(vehicle, mods)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                        exports["onyxLocksystem"]:givePlayerKeys(plate)
                        exports["ecrp-fuel"]:SetFuel(vehicle, GetVehicleFuelLevel(vehicle))
                    end)
                return
            end
        end
    end, plate)
end)

RegisterNetEvent("ecrp-garage:removeSimilarVehicle")
AddEventHandler("ecrp-garage:removeSimilarVehicle", function(plate)
    local vehicles = ESX.Game.GetVehicles()
    local attempts = 0
    if #plate == 7 then
        plate = plate .. " "
    end

    for i = 1, #vehicles, 1 do
        if GetVehicleNumberPlateText(vehicles[i]) == plate then
            while DoesEntityExist(vehicles[i]) do
                Citizen.Wait(500)
                attempts = attempts + 1

                if attempts > 15 then -- 15 attempts to delete, if not, just give up.
                    break
                end
                SetEntityAsMissionEntity(vehicles[i], true, true)
                DeleteVehicle(vehicles[i])
            end
        end
    end
end)

function PreloadAllVehicles(vehicles)
    for k, v in pairs(vehicles) do
        if not HasModelLoaded(v.vehicle.model) then
            RequestModel(v.vehicle.model)

            while not HasModelLoaded(v.vehicle.model) do
                Citizen.Wait(0)
            end
        end
    end
end

-- Vehicle preloading
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    ESX.TriggerServerCallback('ecrp-garage:getVehicleList', function(cb)
        if cb ~= "notCars" then
            PreloadAllVehicles(cb)
        end
    end)
end)

function InGarage()
    if insideGarage then
        return true
    elseif not insideGarage then
        return false
    end
end
