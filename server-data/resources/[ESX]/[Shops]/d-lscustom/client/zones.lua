ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

local vinewood = BoxZone:Create(vector3(-338.8, -137.44, 39.01), 11.0, 19.6, {
  name="vinewood",
  heading=340,
  --debugPoly=true,
  minZ=38.01,
  maxZ=42.81
})

local pdm = BoxZone:Create(vector3(-31.58, -1055.17, 27.91), 12.6, 10.0, {
  name="pdm",
  heading=70,
  --debugPoly=true,
  minZ=26.91,
  maxZ=30.91
})

local laMesa = BoxZone:Create(vector3(731.26, -1087.85, 21.68), 10.4, 11.6, {
  name="laMesa",
  heading=0,
  --debugPoly=true,
  minZ=20.68,
  maxZ=24.68
})

local strawberry = BoxZone:Create(vector3(-212.28, -1326.33, 30.41), 13.6, 9.8, {
  name="strawberry",
  heading=0,
  --debugPoly=true,
  minZ=29.41,
  maxZ=33.41
})

local lsia = BoxZone:Create(vector3(-1155.13, -2006.13, 12.7), 11.8, 19.4, {
  name="lsia",
  heading=45,
  --debugPoly=true,
  minZ=11.7,
  maxZ=15.7
})

local sandy = BoxZone:Create(vector3(1178.33, 2640.0, 37.27), 10.0, 14.2, {
  name="sandy",
  heading=0,
  --debugPoly=true,
  minZ=36.27,
  maxZ=40.27
})

local paleto = BoxZone:Create(vector3(108.16, 6624.38, 31.31), 10, 13.4, {
  name="paleto",
  heading=45,
  --debugPoly=true,
  minZ=30.31,
  maxZ=34.31
})

local bennys = ComboZone:Create({vinewood, pdm, laMesa, strawberry, lsia, sandy, paleto}, {
  -- debugPoly = true
})

local insideBennys = false
bennys:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>Bennys</B>', 'blue', 'blue')
        insideBennys = true
    else
        TriggerEvent('cd_drawtextui:HideUI')
        insideBennys = false
    end
end)

function InBennys()
  if insideBennys then
      return true
  elseif not insideBennys then
      return false
  end
end
