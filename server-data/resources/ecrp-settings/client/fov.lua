local active = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if active then
            fov(4)
        else
            fov(0)
        end
        if IsControlJustReleased(0, 0) then
            if active then
                fov(4)
                active = false
            else
                fov(0)
                active = true
            end
        end
    end
end)

function fov(value)
    SetFollowPedCamViewMode(value)
end
