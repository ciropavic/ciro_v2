ControlForPursuitMode = 172

local defaultHash, defaultHash2, defaultHash3, defaultHash4, defaultHash5, defaultHash6, defaultHash7 = "npolchal",
    "npolvette", "npolstang", "polchar", "npolvic", "npolexp", "npolchar"

local pursuitEnabled = false

local InPursuitModeAPlus = false

local InPursuitModeS = false

-- [START]   Events for different modes

RegisterNetEvent("police:Ghost:Pursuit:Mode:A")
AddEventHandler("police:Ghost:Pursuit:Mode:A", function()
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(PlayerPedId(), true)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local Driver = GetPedInVehicleSeat(veh, -1)
        local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
        local First = 'A'
        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, defaultHash) or IsVehicleModel(veh, defaultHash2) or
            IsVehicleModel(veh, defaultHash3) or IsVehicleModel(veh, defaultHash4) or IsVehicleModel(veh, defaultHash5) or
            IsVehicleModel(veh, defaultHash6) or IsVehicleModel(veh, defaultHash7) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 46, 4, true)
            SetVehicleMod(veh, 11, 4, true)
            SetVehicleMod(veh, 12, 4, false)
            SetVehicleMod(veh, 13, 4, false)
            ToggleVehicleMod(veh, 18, false)
            PursuitEnabled = true
            exports['mythic_notify']:DoHudText('inform', 'Pursuit Mode: A')
            SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', 0.3970000)
            SetVehicleHandlingField(veh, 'CHandlingData', 'fDriveInertia', 1.000000)
            print(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce'))
            print(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fDriveInertia'))
        end
    end
end)

RegisterNetEvent("police:Ghost:Pursuit:A:Plus") -- Second Pursuit Mode
AddEventHandler("police:Ghost:Pursuit:A:Plus", function()
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(PlayerPedId(), true)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local Driver = GetPedInVehicleSeat(veh, -1)
        local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
        local mode1 = 'A+'

        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, defaultHash) or IsVehicleModel(veh, defaultHash2) or
            IsVehicleModel(veh, defaultHash3) -- Vehicle Checks
        or IsVehicleModel(veh, defaultHash4) or IsVehicleModel(veh, defaultHash5) or IsVehicleModel(veh, defaultHash6) or
            IsVehicleModel(veh, defaultHash7) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 46, 4, true)
            SetVehicleMod(veh, 11, 4, true)
            SetVehicleMod(veh, 12, 4, true)
            SetVehicleMod(veh, 13, 4, true)
            ToggleVehicleMod(veh, 18, true)
            PursuitEnabled = true
            exports['mythic_notify']:DoHudText('inform', 'Pursuit Mode: A+')
            SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', 0.4270000)
            SetVehicleHandlingField(veh, 'CHandlingData', 'fDriveInertia', 1.000000)
            print(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce'))
            print(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fDriveInertia'))
        end
    end
end)

RegisterNetEvent("police:Ghost:Pursuit:S")
AddEventHandler("police:Ghost:Pursuit:S", function()
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(PlayerPedId(), true)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local Driver = GetPedInVehicleSeat(veh, -1)
        local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
        local mode2 = 'S'

        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, defaultHash) or IsVehicleModel(veh, defaultHash2) or
            IsVehicleModel(veh, defaultHash3) -- Vehicle Checks
        or IsVehicleModel(veh, defaultHash4) or IsVehicleModel(veh, defaultHash5) or IsVehicleModel(veh, defaultHash6) or
            IsVehicleModel(veh, defaultHash7) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 46, 4, true)
            SetVehicleMod(veh, 11, 4, true)
            SetVehicleMod(veh, 12, 4, true)
            SetVehicleMod(veh, 13, 4, true)
            ToggleVehicleMod(veh, 18, true)
            PursuitEnabled = true
            exports['mythic_notify']:DoHudText('inform', 'Pursuit Mode: S+')
            SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', 0.4970000)
            SetVehicleHandlingField(veh, 'CHandlingData', 'fDriveInertia', 1.100000)
            print(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce'))
            print(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fDriveInertia'))
        end
    end
end)

RegisterNetEvent("police:pursuitmodeOff")
AddEventHandler("police:pursuitmodeOff", function()
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(PlayerPedId(), true)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local Driver = GetPedInVehicleSeat(veh, -1)
        local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, defaultHash) or IsVehicleModel(veh, defaultHash2) or
            IsVehicleModel(veh, defaultHash3) or IsVehicleModel(veh, defaultHash4) or IsVehicleModel(veh, defaultHash5) or
            IsVehicleModel(veh, defaultHash6) or IsVehicleModel(veh, defaultHash7) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 46, 4, false)
            SetVehicleMod(veh, 13, 4, false)
            SetVehicleMod(veh, 12, 4, false)
            SetVehicleMod(veh, 11, 4, false)
            ToggleVehicleMod(veh, 18, false)

            InPursuitModeAPlus = false
            pursuitEnabled = false
            InPursuitModeS = false
            exports['mythic_notify']:DoHudText('inform', 'Pursuit Mode: Off')
            SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', 0.305000)
            SetVehicleHandlingField(veh, 'CHandlingData', 'fDriveInertia', 0.850000)
            print(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce'))
            print(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fDriveInertia'))
        end
    end
end)

-- [END]   Events for different modes

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, defaultHash) or IsVehicleModel(veh, defaultHash2) or
            IsVehicleModel(veh, defaultHash3) or IsVehicleModel(veh, defaultHash4) or IsVehicleModel(veh, defaultHash5) or
            IsVehicleModel(veh, defaultHash6) or IsVehicleModel(veh, defaultHash7) then
            if (IsDisabledControlJustReleased(0, ControlForPursuitMode)) and InPursuitModeAPlus == false then
                if (not IsPauseMenuActive()) then
                    if pursuitEnabled == false then
                        pursuitEnabled = true
                        exports['cosmo_hud']:Pursuitmode(1)
                        TriggerEvent('police:Ghost:Pursuit:Mode:A')

                        while pursuitEnabled == true do
                            Citizen.Wait(5)
                            if (not IsPauseMenuActive()) and (IsDisabledControlJustReleased(0, ControlForPursuitMode)) then
                                InPursuitModeAPlus = true
                                pursuitEnabled = false
                                exports['cosmo_hud']:Pursuitmode(2)
                                TriggerEvent('police:Ghost:Pursuit:A:Plus')

                                while InPursuitModeAPlus == true do
                                    Citizen.Wait(5)
                                    if (not IsPauseMenuActive()) and
                                        (IsDisabledControlJustReleased(0, ControlForPursuitMode)) then
                                        InPursuitModeS = true
                                        InPursuitModeAPlus = false
                                        exports['cosmo_hud']:Pursuitmode(3)
                                        TriggerEvent('police:Ghost:Pursuit:S')

                                        while InPursuitModeS == true do
                                            Citizen.Wait(5)
                                            if (not IsPauseMenuActive()) and
                                                (IsDisabledControlJustReleased(0, ControlForPursuitMode)) then
                                                InPursuitModeAPlus = false
                                                exports['cosmo_hud']:Pursuitmode(0)
                                                TriggerEvent('police:pursuitmodeOff')
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
