local inClothing = true
local inBarber = true
local inTattoo = true

-- Clothing Stores
local strawberry = BoxZone:Create(vector3(73.73, -1391.96, 29.38), 10.0, 7.8, {
  name="strawberry",
  heading=0,
  --debugPoly=true,
  minZ=28.18,
  maxZ=31.98
})

local lagunas = BoxZone:Create(vector3(-165.91, -300.71, 39.74), 7.2, 13.2, {
  name="lagunas",
  heading=340,
  --debugPoly=true,
  minZ=38.74,
  maxZ=42.74
})

local sinner = BoxZone:Create(vector3(426.97, -807.79, 29.49), 9.8, 8.0, {
  name="sinner",
  heading=0,
  --debugPoly=true,
  minZ=28.29,
  maxZ=32.29
})

local NRockford = BoxZone:Create(vector3(-1191.52, -769.92, 17.32), 10.0, 7.8, {
  name="NRockford",
  heading=35,
  --debugPoly=true,
  minZ=16.32,
  maxZ=20.32
})

local portola = BoxZone:Create(vector3(-706.35, -152.52, 37.42), 7.2, 13.2, {
  name="portola",
  heading=208,
  --debugPoly=true,
  minZ=36.42,
  maxZ=40.42
})

local grapeseed = BoxZone:Create(vector3(1695.45, 4821.46, 42.06), 9.8, 8, {
  name="grapeseed",
  heading=7,
  --debugPoly=true,
  minZ=41.06,
  maxZ=45.06
})

local hawick = BoxZone:Create(vector3(122.8, -223.11, 54.56), 10, 7.8, {
  name="hawick",
  heading=250,
  --debugPoly=true,
  minZ=53.56,
  maxZ=57.56
})

local route68hwy = BoxZone:Create(vector3(-1101.32, 2712.74, 19.11), 9.8, 8, {
  name="route68",
  heading=312,
  --debugPoly=true,
  minZ=18.11,
  maxZ=22.11
})

local greatOcean = BoxZone:Create(vector3(-3173.22, 1044.26, 20.87), 10, 7.8, {
  name="greatOcean",
  heading=246,
  -- debugPoly=true,
  minZ=19.86,
  maxZ=22.86
})

local route68 = BoxZone:Create(vector3(1198.28, 2711.75, 38.22), 9.8, 8, {
  name="route68",
  heading=270,
  --debugPoly=true,
  minZ=37.22,
  maxZ=41.22
})

local route68Suburban = BoxZone:Create(vector3(616.89, 2763.63, 42.09), 9.8, 8, {
  name="route68Suburban",
  heading=275,
  --debugPoly=true,
  minZ=41.09,
  maxZ=45.09
})

local paleto = BoxZone:Create(vector3(4.72, 6510.35, 31.88), 9.8, 8, {
  name="paleto",
  heading=313,
  --debugPoly=true,
  minZ=30.88,
  maxZ=34.88
})

local cougarAve = BoxZone:Create(vector3(-1448.84, -240.45, 49.81), 13.4, 7.8, {
  name="cougarAve",
  heading=230,
  --debugPoly=true,
  minZ=48.81,
  maxZ=52.81
})

local palomino = BoxZone:Create(vector3(-821.81, -1071.23, 11.33), 7.4, 9.6, {
  name="palomino",
  heading=31,
  --debugPoly=true,
  minZ=10.33,
  maxZ=14.33
})
-- Clothing Stores END

-- Barber Shops
local sandyBarber = BoxZone:Create(vector3(1932.31, 3729.78, 32.84), 8.2, 5, {
  name="sandyBarber",
  heading=30,
  --debugPoly=true,
  minZ=31.84,
  maxZ=34.84
})

local dulozAveBarber = BoxZone:Create(vector3(-278.9, 6228.63, 31.69), 8.2, 5, {
  name="duluozAveBarber",
  heading=45,
  --debugPoly=true,
  minZ=30.69,
  maxZ=34.69
})

local mirrorBarber = BoxZone:Create(vector3(1211.59, -472.71, 66.2), 8.2, 5, {
  name="mirrorBarber",
  heading=75,
  --debugPoly=true,
  minZ=65.2,
  maxZ=69.2
})

local hawickBarber = BoxZone:Create(vector3(-32.84, -151.61, 57.08), 8.2, 5, {
  name="mirrorBarber",
  heading=340,
  --debugPoly=true,
  minZ=56.08,
  maxZ=60.08
})

local carsonAveBarber = BoxZone:Create(vector3(136.6, -1708.75, 29.29), 8.2, 5, {
  name="carsonAveBarber",
  heading=320,
  --debugPoly=true,
  minZ=28.29,
  maxZ=32.29
})

local madWayneBarber = BoxZone:Create(vector3(-814.06, -184.56, 37.56), 8.8, 6.8, {
  name="madWayneBarber",
  heading=300,
  --debugPoly=true,
  minZ=36.56,
  maxZ=40.56
})

local magellanAveBarber = BoxZone:Create(vector3(-1283.49, -1117.42, 6.99), 8.2, 5, {
  name="magellanAveBarber",
  heading=270,
  --debugPoly=true,
  minZ=5.99,
  maxZ=9.99
})
-- Barber Shops END

-- Tattoo Parlor
local innocenceTat = BoxZone:Create(vector3(1323.0, -1652.6, 52.27), 4.6, 7.8, {
  name="innocenceTat",
  heading=39,
  --debugPoly=true,
  minZ=51.27,
  maxZ=55.27
})

local agujaTat = BoxZone:Create(vector3(-1153.47, -1425.94, 4.96), 4.6, 7.8, {
  name="agujaTat",
  heading=34,
  --debugPoly=true,
  minZ=3.96,
  maxZ=7.96
})

local vinewoodTat = BoxZone:Create(vector3(322.76, 180.94, 103.59), 4.6, 7.8, {
  name="vinewoodTat",
  heading=340,
  --debugPoly=true,
  minZ=102.59,
  maxZ=106.59
})

local greatOceanTat = BoxZone:Create(vector3(-3170.2, 1076.81, 20.83), 4.6, 7.8, {
  name="greatOceanTat",
  heading=66,
  --debugPoly=true,
  minZ=19.83,
  maxZ=23.83
})

local sandyTat = BoxZone:Create(vector3(1863.84, 3748.08, 33.03), 4.6, 7.65, {
  name="sandyTat",
  heading=301,
  --debugPoly=true,
  minZ=32.03,
  maxZ=35.03
})

local paletoTat = BoxZone:Create(vector3(-293.4, 6199.76, 31.48), 4.6, 7.6, {
  name="paletoTat",
  heading=315,
  --debugPoly=true,
  minZ=30.48,
  maxZ=33.48
})

-- Tattoo Parlor END

-- PD Clothing
  local paletoPD = BoxZone:Create(vector3(-438.48, 6010.25, 37.0), 5.2, 4.4, {
    name="paletoPD",
    heading=315,
    --debugPoly=true,
    minZ=36.0,
    maxZ=40.0
  })

  local sandyPd = BoxZone:Create(vector3(1841.21, 3680.43, 34.19), 4.8, 2.6, {
    name="sandyPD",
    heading=30,
    --debugPoly=true,
    minZ=33.19,
    maxZ=36.59
  })

  local mrpd = BoxZone:Create(vector3(461.99, -997.8, 30.69), 4.4, 4.4, {
    name="mrpd",
    heading=0,
    --debugPoly=true,
    minZ=29.49,
    maxZ=33.09
  })
  

  local jail = BoxZone:Create(vector3(1746.79, 2472.87, 45.74), 7.2, 1.6, {
    name="jail",
    heading=30,
    --debugPoly=true,
    minZ=44.64,
    maxZ=48.64
  })
-- PD Clothing END

local jobs = ComboZone:Create({paletoPD, sandyPd, mrpd, jail}, {
  -- debugPoly = true
})
local clothing = ComboZone:Create({strawberry, lagunas, sinner, NRockford, portola, grapeseed, hawick, route68hwy, greatOcean, route68, route68Suburban, paleto, cougarAve, palomino}, {
  -- debugPoly = true
})

local barber = ComboZone:Create({sandyBarber, dulozAveBarber, mirrorBarber, hawickBarber, carsonAveBarber, madWayneBarber, magellanAveBarber}, {
  -- debugPoly = true
})

local tattoo = ComboZone:Create({innocenceTat, agujaTat, vinewoodTat, greatOceanTat, sandyTat, paletoTat}, {
  -- debugPoly = true,
})

clothing:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
  if isPointInside then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>[E] Clothing Store</B>', 'blue', 'blue')
    inClothing = true
  else
    TriggerEvent('cd_drawtextui:HideUI')
    inClothing = false
  end
end)

jobs:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
  if isPointInside then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>[E] Locker</B>', 'blue', 'blue')
    inClothing = true
  else
    TriggerEvent('cd_drawtextui:HideUI')
    inClothing = false
  end
end)

barber:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
  if isPointInside then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>[E] Barber Shop</B>', 'blue', 'blue')
    inBarber = true
  else
    TriggerEvent('cd_drawtextui:HideUI')
    inBarber = false
  end
end)

tattoo:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
  if isPointInside then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>[E] Tattoo Parlor</B>', 'blue', 'blue')
    inTattoo = true
  else
    TriggerEvent('cd_drawtextui:HideUI')
    inTattoo = false
  end
end)

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(1)
    if inClothing then
      if IsControlJustReleased(0, 38) then
        TriggerServerEvent("clothing:checkMoney", "clothesmenu", 0)
      end
    end
  end
end)

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(1)
    if inBarber then
      if IsControlJustReleased(0, 38) then
        TriggerServerEvent("clothing:checkMoney", "barbermenu", 0)
      end
    end
  end
end)

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(1)
    if inTattoo then
      if IsControlJustReleased(0, 38) then
        TriggerServerEvent("clothing:checkMoney", "tattoomenu", 0)
      end
    end
  end
end)