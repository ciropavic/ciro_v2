-- // Appartments \\ --

function CreateMidAppartement(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":33.0,"y":3.5,"x":4.0,"h":0.0}')
    POIOffsets.stash = json.decode('{"z":33.0,"y": -0.25,"x":-1.725,"h":0.0}')
	POIOffsets.closet = json.decode('{"z":33.0,"y": -2.5,"x": 0.3,"h":0.0}')
	POIOffsets.logout = json.decode('{"z":33.0,"y": 2.5,"x":-4.0,"h":0.0}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`gabz_pinkcage`)
    while not HasModelLoaded(`gabz_pinkcage`) do
	    Citizen.Wait(1000)
	end
	local house = CreateObject(`gabz_pinkcage`, spawn.x, spawn.y, spawn.z + 0.48, false, false, false)
    FreezeEntityPosition(house, true)
	table.insert(objects, house)
    Citizen.Wait(100)
    SetEntityCoords(GetPlayerPed(-1), spawn.x - POIOffsets.exit.x , spawn.y - POIOffsets.exit.y, spawn.z + 0.5)
    Citizen.Wait(45)
    DoScreenFadeIn(500)
    return {objects, POIOffsets}
end