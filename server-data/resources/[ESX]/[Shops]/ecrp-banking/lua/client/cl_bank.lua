local insideBank = false

-- PolyZones
local legionSquare = BoxZone:Create(vector3(150.09, -1040.63, 29.37), 1.2, 7.6, {
  name="legionSquare",
  heading=340,
  --debugPoly=true,
  minZ=28.37,
  maxZ=31.17
})

local delPerro = BoxZone:Create(vector3(-1212.82, -330.5, 37.78), 1.4, 7.2, {
  name="delPerro",
  heading=27,
  --debugPoly=true,
  minZ=36.78,
  maxZ=40.78
})

local greatOcean = BoxZone:Create(vector3(-2962.8, 482.79, 15.7), 1.4, 7.2, {
  name="greatOcean",
  heading=88,
  --debugPoly=true,
  minZ=14.1,
  maxZ=17.7
})

local paleto = BoxZone:Create(vector3(-113.18, 6469.74, 31.63), 1.4, 8, {
  name="paleto",
  heading=135,
  --debugPoly=true,
  minZ=30.63,
  maxZ=33.43
})

local hawick = BoxZone:Create(vector3(314.11, -278.69, 54.17), 1.4, 6.8, {
  name="hawick",
  heading=340,
  --debugPoly=true,
  minZ=53.17,
  maxZ=56.17
})

local hawick2 = BoxZone:Create(vector3(-351.0, -49.56, 49.04), 1.4, 7.3, {
  name="hawick2",
  heading=341,
  --debugPoly=true,
  minZ=48.04,
  maxZ=51.04
})

local pacific = BoxZone:Create(vector3(242.15, 224.74, 106.29), 1.4, 5.2, {
  name="pacific",
  heading=340,
  --debugPoly=true,
  minZ=105.29,
  maxZ=108.29
})

local sandy = BoxZone:Create(vector3(1175.0, 2706.55, 38.09), 1.4, 7.3, {
  name="sandy",
  heading=0,
  --debugPoly=true,
  minZ=37.09,
  maxZ=40.09
})

local bankLoc = ComboZone:Create({legionSquare, delPerro, greatOcean, paleto, hawick, hawick2, pacific, sandy}, {
  -- debugPoly = true
})

bankLoc:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>[E] Bank</B>', 'blue', 'blue')
        insideBank = true
    else
        TriggerEvent('cd_drawtextui:HideUI')
        insideBank = false
    end
end)

-----------

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)
    if insideBank then
      if IsControlJustReleased(0, 38) then
        ToggleUI()
      end
    end
  end
end)

RegisterNetEvent('openATM')
AddEventHandler('openATM', function()
	if not bMenuOpen then
		ToggleUIATM()
	end
end)

RegisterNetEvent("ecrp:Bank:ExtNotify")
AddEventHandler("ecrp:Bank:ExtNotify", function(msg)
	if (not msg or msg == "") then return end

	exports['mythic_notify']:DoLongHudText('inform', msg, { ['background-color'] = "#4086EB", ['color'] = '#fff' })
end)