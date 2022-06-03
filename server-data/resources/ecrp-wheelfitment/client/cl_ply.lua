DecorRegister("np-wheelfitment_applied", 2)
DecorRegister("np-wheelfitment_w_width", 1)
DecorRegister("np-wheelfitment_w_fl", 1)
DecorRegister("np-wheelfitment_w_fr", 1)
DecorRegister("np-wheelfitment_w_rl", 1)
DecorRegister("np-wheelfitment_w_rr", 1)

local vehiclesToCheckFitment = {}
local didPlyAdjustFitments = false
local performVehicleCheck = true
local currentFitmentsToSet = {width = 0, fl = 0, fr = 0, rl = 0, rr = 0}
local devmode = false

local function roundNum(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

local function isNear(pos1, pos2, distMustBe)
    local diff = #(pos2 - pos1)
    return (diff < (distMustBe))
end

function SyncWheelFitment()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if didPlyAdjustFitments then
        if not DecorExistOn(plyVeh, "np-wheelfitment_applied") then
            DecorSetBool(plyVeh, "np-wheelfitment_applied", true)
        end

        DecorSetFloat(plyVeh, "np-wheelfitment_w_width", roundNum(GetVehicleWheelWidth(plyVeh), 2))
        DecorSetFloat(plyVeh, "np-wheelfitment_w_fl", roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2))
        DecorSetFloat(plyVeh, "np-wheelfitment_w_fr", roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2))
        DecorSetFloat(plyVeh, "np-wheelfitment_w_rl", roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2))
        DecorSetFloat(plyVeh, "np-wheelfitment_w_rr", roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2))

        didPlyAdjustFitments = false
    end

    currentFitmentsToSet = {width = 0, fl = 0, fr = 0, rl = 0, rr = 0}

    performVehicleCheck = true

    checkVehicleFitment()

    FreezeEntityPosition(plyVeh, false)
    SetEntityCollision(plyVeh, true, true)
end

function AdjustWheelFitment(state, wheel, amount)
    if amount == -1 then
        amount = -1.00
    elseif amount == 1 then
        amount = 1.00
    elseif amount == 0 then
        amount = 0.00
    end

    if state then
        if wheel == "w_fl" then
            wheel = 0

            currentFitmentsToSet.fl = amount
        elseif wheel == "w_fr" then
            wheel = 1

            currentFitmentsToSet.fr = amount
        elseif wheel == "w_rl" then
            wheel = 2

            currentFitmentsToSet.rl = amount
        elseif wheel == "w_rr" then
            wheel = 3

            currentFitmentsToSet.rr = amount
        end

        if not didPlyAdjustFitments then
            didPlyAdjustFitments = true
        end
    else
        if not didPlyAdjustFitments then
            didPlyAdjustFitments = true
        end

        currentFitmentsToSet.width = amount
    end
end

function checkVehicleFitment()
    vehiclesToCheckFitment = {}

    local vehicles = GetGamePool("CVehicle")

    for _, veh in ipairs(vehicles) do
        local plyPed = PlayerPedId()
        local plyPos = GetEntityCoords(plyPed)

        if isNear(plyPos, GetEntityCoords(veh), 150) then
            if DecorExistOn(veh, "np-wheelfitment_applied") then
                vehiclesToCheckFitment[#vehiclesToCheckFitment + 1] = {
                    vehicle = veh,
                    w_width = DecorGetFloat(veh, "np-wheelfitment_w_width"),
                    w_fl = DecorGetFloat(veh, "np-wheelfitment_w_fl"),
                    w_fr = DecorGetFloat(veh, "np-wheelfitment_w_fr"),
                    w_rl = DecorGetFloat(veh, "np-wheelfitment_w_rl"),
                    w_rr = DecorGetFloat(veh, "np-wheelfitment_w_rr")
                }
            end
        end
    end
end

local tuner = BoxZone:Create(vector3(135.88, -3030.43, 7.04), 6.4, 4.0, {
  name="tuner",
  heading = 0, 
  minZ = 6.04, 
  maxZ = 9.04,
})

local mrpd = BoxZone:Create(vector3(435.41, -975.99, 25.7), 4.0, 8.6, {
  name="mrpd",
  heading=0,
  minZ=24.5,
  maxZ=27.1,
})

local fitmentzones = ComboZone:Create({tuner, mrpd}, {
  -- debugPoly = true
})

local insideFitment = false
fitmentzones:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    local plyPed = PlayerPedId()
    local plyVeh = IsPedSittingInAnyVehicle(plyPed)
    if isPointInside and devmode and plyVeh then
        TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>[E]</B> Wheel Alignment', 'blue', 'blue')
        insideFitment = true
    else
        TriggerEvent('cd_drawtextui:HideUI')
        insideFitment = false
    end
end)

Citizen.CreateThread(function()
    while true do
        if performVehicleCheck then
            for _, vehData in ipairs(vehiclesToCheckFitment) do
                if vehData.vehicle ~= nil and DoesEntityExist(vehData.vehicle) then
                    if GetVehicleWheelWidth(vehData.vehicle) ~=vehData.w_width then
                        SetVehicleWheelWidth(vehData.vehicle, vehData.w_width)
                    end
                    if GetVehicleWheelXOffset(vehData.vehicle, 0) ~= vehData.w_fl then
                        SetVehicleWheelXOffset(vehData.vehicle, 0, vehData.w_fl)
                        SetVehicleWheelXOffset(vehData.vehicle, 1, vehData.w_fr)
                        SetVehicleWheelXOffset(vehData.vehicle, 2, vehData.w_rl)
                        SetVehicleWheelXOffset(vehData.vehicle, 3, vehData.w_rr)
                    end
                end
            end
        else
            if isMenuShowing then
                local plyPed = PlayerPedId()
                local plyVeh = GetVehiclePedIsIn(plyPed, false)

                SetVehicleWheelWidth(plyVeh, currentFitmentsToSet.width)
                SetVehicleWheelXOffset(plyVeh, 0, currentFitmentsToSet.fl)
                SetVehicleWheelXOffset(plyVeh, 1, currentFitmentsToSet.fr)
                SetVehicleWheelXOffset(plyVeh, 2, currentFitmentsToSet.rl)
                SetVehicleWheelXOffset(plyVeh, 3, currentFitmentsToSet.rr)
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        if performVehicleCheck then
            checkVehicleFitment()
        end

        Citizen.Wait(cfg_scanVehicleTimer)
    end
end)

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)
    local plyPed = PlayerPedId()
    local plyVeh = IsPedSittingInAnyVehicle(plyPed)
    if insideFitment and plyVeh then
      if IsControlJustReleased(1, 38) then
        ToggleFitment()
      end
    end
  end
end)

function ToggleFitment()
  local plyPed = PlayerPedId()
  local plyVeh = GetVehiclePedIsIn(plyPed, false)
  local coords = cfg_wheelFitmentPos[1].coords
  local heading = cfg_wheelFitmentPos[1].heading
  local slider_wWidth = {}
  local slider_wfFL = {}
  local slider_wfFR = {}
  local slider_wfRL = {}
  local slider_wfRR = {}
  local sliderStartPos = {}
  

  performVehicleCheck = false

  SetEntityCoords(plyVeh, coords)
  SetEntityHeading(plyVeh, heading)
  FreezeEntityPosition(plyVeh, true)
  SetEntityCollision(plyVeh, false, true)

  for i = 0.0, 1.56, 0.01 do
      slider_wWidth[#slider_wWidth + 1] = roundNum(i, 2)

      if math.abs(i - roundNum(GetVehicleWheelWidth(plyVeh), 2)) < 0.00000001 then
          sliderStartPos[#sliderStartPos + 1] = #slider_wWidth
      end
  end

  for i = 0.0, -1.56, -0.01 do
      slider_wfFL[#slider_wfFL + 1] = roundNum(i, 2)

      if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2)) < 0.00000001 then
          sliderStartPos[#sliderStartPos + 1] = #slider_wfFL
      end
  end

  for i = 0.0, 1.56, 0.01 do
      slider_wfFR[#slider_wfFR + 1] = roundNum(i, 2)

      if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2)) < 0.00000001 then
          sliderStartPos[#sliderStartPos + 1] = #slider_wfFR
      end
  end

  for i = 0.0, -1.56, -0.01 do
      slider_wfRL[#slider_wfRL + 1] = roundNum(i, 2)

      if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2)) < 0.00000001 then
          sliderStartPos[#sliderStartPos + 1] = #slider_wfRL
      end
  end

  for i = 0.0, 1.56, 0.01 do
      slider_wfRR[#slider_wfRR + 1] = roundNum(i, 2)

      if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2)) < 0.00000001 then
          sliderStartPos[#sliderStartPos + 1] = #slider_wfRR
      end
  end

  currentFitmentsToSet.width = GetVehicleWheelWidth(plyVeh)
  currentFitmentsToSet.fl = GetVehicleWheelXOffset(plyVeh, 0)
  currentFitmentsToSet.fr = GetVehicleWheelXOffset(plyVeh, 1)
  currentFitmentsToSet.rl = GetVehicleWheelXOffset(plyVeh, 2)
  currentFitmentsToSet.rr = GetVehicleWheelXOffset(plyVeh, 3)
  checkVehicleFitment()

  DisplayMenu(true, slider_wWidth, slider_wfFL, slider_wfFR, slider_wfRL, slider_wfRR, sliderStartPos)
end

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(500)
    devmode = exports['ecrp-hud']:DevActive()
  end
end)

-- #[Event Handlers]#--
RegisterNetEvent("np-wheelfitment_cl:applySavedWheelFitment")
AddEventHandler("np-wheelfitment_cl:applySavedWheelFitment", function(wheelFitments, plyVeh)
    performVehicleCheck = false

    SetVehicleWheelWidth(plyVeh, wheelFitments.width)
    SetVehicleWheelXOffset(plyVeh, 0, wheelFitments.fl)
    SetVehicleWheelXOffset(plyVeh, 1, wheelFitments.fr)
    SetVehicleWheelXOffset(plyVeh, 2, wheelFitments.rl)
    SetVehicleWheelXOffset(plyVeh, 3, wheelFitments.rr)

    if not DecorExistOn(plyVeh, "np-wheelfitment_applied") then
        DecorSetBool(plyVeh, "np-wheelfitment_applied", true)
    end

    DecorSetFloat(plyVeh, "np-wheelfitment_w_width", wheelFitments.width)
    DecorSetFloat(plyVeh, "np-wheelfitment_w_fl", wheelFitments.fl)
    DecorSetFloat(plyVeh, "np-wheelfitment_w_fr", wheelFitments.fr)
    DecorSetFloat(plyVeh, "np-wheelfitment_w_rl", wheelFitments.rl)
    DecorSetFloat(plyVeh, "np-wheelfitment_w_rr", wheelFitments.rr)

    performVehicleCheck = true
    checkVehicleFitment()
end)

RegisterNetEvent("np-wheelfitment_cl:forceMenuClose")
AddEventHandler("np-wheelfitment_cl:forceMenuClose", function()
    if isMenuShowing then
        local plyPed = PlayerPedId()
        local plyVeh = GetVehiclePedIsIn(plyPed, false)

        if plyVeh ~= 0 or plyVeh ~= nil then
            -- SetEntityCoords(plyVeh, cfg_wheelFitmentPos)
            -- SetEntityHeading(plyVeh, cfg_wheelFitmentHeading)
            FreezeEntityPosition(plyVeh, false)
            SetEntityCollision(plyVeh, true, true)
        end
    end

    SyncWheelFitment()
    DisplayMenu(false)
end)

RegisterCommand("leavefitment", function()
    TriggerEvent("np-wheelfitment_cl:forceMenuClose")
end)
