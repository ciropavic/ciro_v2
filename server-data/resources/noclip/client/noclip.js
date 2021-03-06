const noclip = exports.noclip;

let noclipTarget = null;

on('noclip:onNoclipUpdate', () => {
    const position = noclip.GetPosition();
    const rotation = noclip.GetRotation();

    if (noclipTarget) {
        SetEntityCoordsNoOffset(noclipTarget, position[0], position[1], position[2], false, false, false);
        SetEntityRotation(noclipTarget, rotation[0], rotation[1], rotation[2], 0, true);
    }
});

function disableNoclip() {
    SetEntityInvincible(noclipTarget, false);
    FreezeEntityPosition(noclipTarget, false);
    SetEntityCollision(noclipTarget, true, true);
    SetEntityVisible(noclipTarget, true, false);

    if (noclipTarget !== PlayerPedId()) {
        SetEntityVisible(PlayerPedId(), true, false);
    }

    noclipTarget = null;

    noclip.SetEnabled(false);
}

function enableNoclip() {
    noclipTarget = PlayerPedId();

    if (IsPedInAnyVehicle(noclipTarget)) {
        noclipTarget = GetVehiclePedIsIn(noclipTarget, false);
    }

    if (!NetworkHasControlOfEntity(noclipTarget)) {
        noclipTarget = null;
        return;
    }

    SetEntityInvincible(noclipTarget, true);
    FreezeEntityPosition(noclipTarget, true);
    SetEntityCollision(noclipTarget, false, false);
    SetEntityVisible(noclipTarget, false, false);

    if (noclipTarget !== PlayerPedId()) {
        SetEntityVisible(PlayerPedId(), false, false);
    }

    const entityCoords = GetEntityCoords(noclipTarget);

    noclip.SetEnabled(true);
    noclip.SetPosition(...entityCoords);
}

function toggleNoclip() {
    if (noclip.IsEnabled()) {
        disableNoclip();
    } else {
        enableNoclip();
    }
}