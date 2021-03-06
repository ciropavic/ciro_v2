function HandleCam(coords)
    DoScreenFadeIn(0)
    local cam, cam2 = nil, nil
    startcam = CreateCam('DEFAULT_SCRIPTED_CAMERA', 1)
    SetCamCoord(startcam, coords.x, coords.y, coords.z+500)
    SetCamActive(startcam, true)
    PointCamAtCoord(startcam, coords.x, coords.y, coords.z+500)
    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', 1)
    SetCamCoord(cam, coords.x, coords.y, coords.z+500)
    PointCamAtCoord(cam, coords.x, coords.y, coords.z+2)
    SetCamActiveWithInterp(cam, startcam, 5000, true, true)
    Wait(5000)
    cam2 = CreateCam('DEFAULT_SCRIPTED_CAMERA', 1)
    SetCamCoord(cam2, coords.x, coords.y, coords.z+1)
    PointCamAtCoord(cam2, coords.x+10, coords.y, coords.z)
    SetCamActiveWithInterp(cam2, cam, 3000, true, true)
    Wait(3000)
    SetCamActiveWithInterp(cam, cam2, 5000, true, true)
    RenderScriptCams(false, true, 500, true, true)
    PlaySoundFrontend(-1, 'Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    PlaySoundFrontend(-1, 'CAR_BIKE_WHOOSH', 'MP_LOBBY_SOUNDS', 1)
    DestroyCam(startcam, false)
    DestroyCam(cam, false)
    DestroyCam(cam2, false)
end

RegisterNetEvent('cd_spawnselect:ToggleNUIFocus')
AddEventHandler('cd_spawnselect:ToggleNUIFocus', function()
    NUI_status = true
    while NUI_status do
        SetNuiFocus(NUI_status, NUI_status)
        Wait(500)
    end
    SetNuiFocus(false, false)
end)

function round(num)
    local mult = math.pow(10, 2)
    return math.floor(num * mult + 0.5) / 100
end