local debugMode = false
local debugModeP = false
local oldInterior

RegisterNetEvent('debug')
AddEventHandler('debug', function (msg)
    if debugMode then
        print("Debug Mode:", msg) 
    end
end)

function getDebugStatus()
    return debugMode
end

function debugPrint(msg)
    if debugMode then
        print("Debug Mode:", msg) 
    end
end


function DrawText3Ds(x, y, z, text)
	SetTextScale(0.6, 0.6)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 15, 15, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if debugMode then

       
            local color = {r = 240, g = 15, b = 15, a = 255}
            local position = GetEntityCoords(GetPlayerPed(-1))
            local hit, coords, entity = RayCastGamePlayCamera(1000.0)
            

            if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                local entityCoord = GetEntityCoords(entity)
                local minimum, maximum = GetModelDimensions(GetEntityModel(entity))
                
                DrawEntityBoundingBox(entity, color)
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                DrawText3Ds(entityCoord.x, entityCoord.y, entityCoord.z, "Entity: " .. entity .. " Model: " .. GetEntityModel(entity).. " Coords: x: " .. entityCoord.x .. ", y: " .. entityCoord.y .. " z: " .. entityCoord.z)
                DrawText3Ds(entityCoord.x, entityCoord.y, entityCoord.z + 0.6, "To delete object press [~g~E~s~]!")
       
           

           
                if IsControlJustReleased(0, 38) then
                  
                    SetEntityAsMissionEntity(entity, true, true)
                    if IsEntityAVehicle(entity) then
                        TriggerEvent('persistent-vehicles/forget-vehicle', entity)
                    end
      
                    DeleteEntity(entity)
                end

            elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
            end
           
           if debugModeP then
            local portalVectors = {}
            local ped = PlayerPedId()
            local playerPedId
            local coords = GetEntityCoords(ped)
            local interior = GetInteriorFromEntity(ped)
  
            if interior ~= oldInterior then
                addedVectors = false
            end
 
            oldInterior = interior
            local intPos = {}
            if interior ~= 0 then
               intPos.x, intPos.y, intPos.z =  GetInteriorPosition(interior);
               local portalCount = GetInteriorPortalCount(interior)
               local roomHash = GetRoomKeyFromEntity(ped);
               local currentRoomId = GetInteriorRoomIndexByHash(interior, roomHash);
               local portalCount = portalCount - 1
 
               for i=0, portalCount do 
                  local tempCorners = {}
                  local portalFlags = GetInteriorPortalFlag(interior, i)
                  local portalFrom = GetInteriorPortalRoomFrom(interior, i)
                  local portalTo = GetInteriorPortalRoomTo(interior, i)
                  local vectors = {}
                  for c=0, 3 do 
                      local cornerPos = {}
                      cornerPos.X, cornerPos.Y, cornerPos.Z = GetInteriorPortalCornerPosition(interior, i, c)
                      local irX, irY, irZ, irW  = GetInteriorRotation(interior)
                      local q = quat( irW, irX, irY, irZ)      
                      local multi = QMultiply(q, cornerPos)
                      local cornerPos = {}
                      cornerPos.X = multi.x + intPos.x
                      cornerPos.Y = multi.y + intPos.y
                      cornerPos.Z = multi.z + intPos.z
                      tempCorners[c] = cornerPos
                  end
 
                  local CrossVector = VecLerp(tempCorners[0], tempCorners[2], 0.5);
                  portalVectors[i] = {}
                  portalVectors[i].distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tempCorners[0].X, tempCorners[0].Y, tempCorners[0].Z, true)
                  portalVectors[i].coords = CrossVector
   
       
 
               
                  DrawPoly(tempCorners[0].X, tempCorners[0].Y, tempCorners[0].Z, tempCorners[1].X, tempCorners[1].Y, tempCorners[1].Z, tempCorners[2].X, tempCorners[2].Y, tempCorners[2].Z, 255, 0, 0, 100);
                  DrawPoly(tempCorners[0].X, tempCorners[0].Y, tempCorners[0].Z, tempCorners[2].X, tempCorners[2].Y, tempCorners[2].Z, tempCorners[3].X, tempCorners[3].Y, tempCorners[3].Z, 255, 0, 0, 100);
                  DrawPoly(tempCorners[3].X, tempCorners[3].Y, tempCorners[3].Z, tempCorners[2].X, tempCorners[2].Y, tempCorners[2].Z, tempCorners[1].X, tempCorners[1].Y, tempCorners[1].Z, 255, 0, 0, 100);
                  DrawPoly(tempCorners[3].X, tempCorners[3].Y, tempCorners[3].Z, tempCorners[1].X, tempCorners[1].Y, tempCorners[1].Z, tempCorners[0].X, tempCorners[0].Y, tempCorners[0].Z, 255, 0, 0, 100);
                  if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tempCorners[0].X, tempCorners[0].Y, tempCorners[0].Z, true) < 10 then
                     DrawText3D(CrossVector.x, CrossVector.y, CrossVector.z - 1.7, "~w~From ~g~" .. portalFrom .. " ~w~ To ~g~" .. portalTo)
                     DrawText3D(CrossVector.x, CrossVector.y, CrossVector.z - 1.9, "~w~Flags ~g~ " .. portalFlags .. " ~w~Portal Index ~g~" .. i)
                  end
               end
               drawTxt(0.6, 0.50, 0.4,0.4,0.30, "Room: " .. currentRoomId, 55, 155, 55, 255)
               local nearestPortalIndex, nearestPortal, doorObject = getNearestPortalDoor(portalVectors)
               if nearestPortalIndex ~= 1337 and doorObject ~= 0  then
                   drawTxt(0.6, 0.52, 0.4,0.4,0.30, "(Door) Nearest Portal: " .. nearestPortalIndex .. " Distance: " .. nearestPortal .. " Object ID: " .. doorObject, 55, 155, 55, 255)
               end    
            end
           end

          
        end
    end
end)


function getNearestPortal(portals)
    local nearestPortal = 30
    local index = 1337
    for k, v in pairs(portals) do
        local distance = v.distance
        if distance < nearestPortal then
            nearestPortal = distance
            index = k
        end
    end
    return index, nearestPortal
end

function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(cameraRotation)
    local destination =
    {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }
    local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
    return b, c, e
end

function getNearestPortalDoor(portals)
    local nearestPortal = 30
    local index = 1337
    local doorObject
    local heading
    for k, v in pairs(portals) do
        local distance = v.distance
        if distance < nearestPortal then
            local pCoords = v.coords
            doorObject = GetClosestObjectOfType(pCoords.x, pCoords.y, pCoords.z, 2.0, GetHashKey('v_ilev_roc_door4'), false, false, false)
            
            nearestPortal = distance
            index = k
        end
    end
    return index, nearestPortal, doorObject
end

function NearestValue(table, number)
    local smallestSoFar, smallestIndex
    for i, y in ipairs(table) do
        print(math.abs(number-y))
        if not smallestSoFar or (math.abs(number-y) < smallestSoFar) then
            smallestSoFar = math.abs(number-y)
            smallestIndex = i
        end
    end
    return smallestIndex, table[smallestIndex]
end

function Lerp(a, b, t)
	return a + (b - a) * t
end

function VecLerp(v1, v2, l)
    local x = Lerp(v1.X, v2.X, l)
    local y = Lerp(v1.Y, v2.Y, l)
    local z = Lerp(v1.Z, v2.Z, l) + 2.0
    return vector3(x, y, z)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

RegisterCommand('debugPortal', function()
    debugModeP = not debugModeP
    if addedVectors == true then
        addedVectors = false
    end
end)

RegisterCommand('getcar', function (source, args)
    local id = tonumber(args[1])
    if id then
        SetEntityCoords(id, GetEntityCoords(GetPlayerPed(-1)))
    end
end)


RegisterCommand('debug', function()
    debugMode = not debugMode
    if addedVectors == true then
        addedVectors = false
    end
end)

function QMultiply(a, b)
    local axx = a.x * 2.0;
    local ayy = a.y * 2.0;
    local azz = a.z * 2.0;
    local awxx = a.w * axx;
    local awyy = a.w * ayy;
    local awzz = a.w * azz;
    local axxx = a.x * axx;
    local axyy = a.x * ayy;
    local axzz = a.x * azz;
    local ayyy = a.y * ayy;
    local ayzz = a.y * azz;
    local azzz = a.z * azz;
    return  {
       x = ((b.X * ((1.0 - ayyy) - azzz)) + (b.Y * (axyy - awzz))) + (b.Z * (axzz + awyy)),
       y =  ((b.X * (axyy + awzz)) + (b.Y * ((1.0 - axxx) - azzz))) + (b.Z * (ayzz - awxx)),
       z =  ((b.X * (axzz - awyy)) + (b.Y * (ayzz + awxx))) + (b.Z * ((1.0 - axxx) - ayyy))
    } 
end

function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim = 
	{ 
		x = 0.5*(max.x - min.x), 
		y = 0.5*(max.y - min.y), 
		z = 0.5*(max.z - min.z)
	}

    local FUR = 
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x, 
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y, 
		z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL = 
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 = 
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 = 
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 = 
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 = 
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 = 
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 = 
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

-- Embed direction in rotation vector
function RotationToDirection(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = 
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.25, 0.25)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

