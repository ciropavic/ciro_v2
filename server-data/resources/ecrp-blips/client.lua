--https://docs.fivem.net/docs/game-references/blips/

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Viceroy Medical", colour=1, id=61, x = -834.91082763672, y = -1212.1291503906, z = 6.8932008743286},
     {title="Digital Den", colour=50, id=619, x = 1132.9462890625, y = -470.67614746094, z = 66.483795166016},
     {title="Burger Shot", colour=41, id=106, x = -1183.513671875, y = -884.34259033203, z = 13.7963762283336},
     {title="Art Gallery", colour=57, id=617, x = -424.78656005859, y = 24.685722351074, z = 46.241527557373},
     {title="Pillbox Medical", colour=2, id=61, x = 299.75881958008, y = -584.29272460938, z = 43.283790588379},
     {title="Casino", colour=46, id=272, x = 923.98663330078, y = 47.044296264648, z = 81.106346130371},
     {title="City Hall", colour=0, id=176, x = -549.86126708984, y = -196.08232116699, z = 38.219261169434},
     {title="Impound", colour=17, id=317, x = -190.87364196777, y = -1163.8149414062, z = 23.671369552612}
  }

local clothing = {
    {title="Clothing Store", colour=38, id=73, x = 1693.45667, y = 4823.17725, z = 42.163129},
    {title="Clothing Store", colour=38, id=73, x = -712.215881,y = -155.352982, z = 37.415126},
    {title="Clothing Store", colour=38, id=73, x = -1192.94495,y = -772.688965, z = 17.3255997},
    {title="Clothing Store", colour=38, id=73, x = 425.236,y = -806.008,z = 28.491},
    {title="Clothing Store", colour=38, id=73, x = -162.658,y = -303.397,z = 38.733},
    {title="Clothing Store", colour=38, id=73, x = 75.950,y = -1392.891,z = 28.376},
    {title="Clothing Store", colour=38, id=73, x = -822.194,y = -1074.134,z = 10.328},
    {title="Clothing Store", colour=38, id=73, x = -1450.711,y = -236.83,z = 48.809},
    {title="Clothing Store", colour=38, id=73, x = 4.254,y = 6512.813,z = 30.877},
    {title="Clothing Store", colour=38, id=73, x = 615.180,y = 2762.933,z = 41.088},
    {title="Clothing Store", colour=38, id=73, x = 1196.785,y = 2709.558,z = 37.22},
    {title="Clothing Store", colour=38, id=73, x = -3171.453,y = 1043.857,z = 19.86},
    {title="Clothing Store", colour=38, id=73, x = -1100.959,y = 2710.211,z = 18.10},
    {title="Clothing Store", colour=38, id=73, x = 121.76,y = -224.6,z = 53.5},
    {title="Clothing Store", colour=38, id=73, x = 1780.449, y = 2547.869, z = 44.798},
    {title="Clothing Store", colour=38, id=73, x = 1849.555, y = 3695.773, z = 33.3},
    {title="Clothing Store", colour=38, id=73, x = -454.379, y = 6014.986, z = 30.7}
  }

local bennys = {
    {title="Bennys", colour=5, id=402, x = 1174.73, y = 2640.00, z = 38.76},
    {title="Bennys", colour=5, id=402, x = 731.58, y = -1088.84, z = 21.79},
    {title="Bennys", colour=5, id=402, x = -211.55, y = -1324.55, z = 30.90},
    {title="Bennys", colour=5, id=402, x = -337.38, y = -136.92, z = 38.57},
    {title="Bennys", colour=5, id=402, x = -1155.53, y = -2007.18, z = 12.74},
    {title="Bennys", colour=5, id=402, x = 104.35, y = 6622.14, z = 31.42},
    {title="Bennys", colour=5, id=402, x = -31.93, y = -1055.71, z = 28.02}
  }

local banks = {
    {x = 150.09, y = -1040.63, z = 29.37},
    {x = -1212.82, y = -330.5, z = 37.78},
    {x = -2962.8, y = 482.79, z = 15.7},
    {x = -113.18, y = 6469.74, z = 31.63},
    {x = 314.11, y = -278.69, z = 54.17},
    {x = -351.0, y = -49.56, z = 49.04},
    {x = 242.15, y = 224.74, z = 106.29},
    {x = 1175.0, y = 2706.55, z = 38.09},
  }

local police = {
    {x = 433.57446289063, y = -982.09252929688, z = 30.710870742798},
    {x = 1850.9437255859, y = 3677.1391601563, z = 33.818653106689},
    {x = -430.96496582031, y = 6018.9208984375, z = 31.484621047974}
  }

local carwash = {
    {x = 18.697088241577, y = -1391.4766845703, z = 29.323041915894},
    {x = -699.9208984375, y = -934.02661132813, z = 19.013891220093}
  }

local garage = {
    -- Apartments
    {x = -297.75103759766, y = -990.17083740234, z = 30.382287979126},
    -- Pink Cage
    {x = 276.92697143555, y = -339.90936279297, z = 44.222145080566},
    -- Casino
    {x = 894.89868164063, y = -5.5265755653381, z = 78.065734863281},
    -- Mirror Park
    {x = 1030.4437255859, y = -787.86853027344, z = 57.351222991943},
    -- Paleto
    {x = -77.211029052734, y = 6347.1420898438, z = 30.792123794556},
    -- UwU Cafe
    {x = -573.01123046875, y = -1100.9536132813, z = 21.651517868042},
    -- Pier
    {x = -1590.4520263672, y = -1036.2794189453, z = 12.53427696228},
    -- Sandy
    {x = 1962.6041259766, y = 3766.4165039063, z = 31.711715698242},
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()

    for _, info in pairs(clothing) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()

    for _, info in pairs(bennys) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()

  for _, info in pairs(banks) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, 272)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.7)
    SetBlipColour(info.blip, 2)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Bank")
    EndTextCommandSetBlipName(info.blip)
  end
end)

Citizen.CreateThread(function()

  for _, info in pairs(police) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, 137)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.8)
    SetBlipColour(info.blip, 38)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Police Station")
    EndTextCommandSetBlipName(info.blip)
  end
end)

Citizen.CreateThread(function()

  for _, info in pairs(carwash) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, 100)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.7)
    SetBlipColour(info.blip, 0)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Car Wash")
    EndTextCommandSetBlipName(info.blip)
  end
end)

Citizen.CreateThread(function()

  for _, info in pairs(garage) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, 357)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.8)
    SetBlipColour(info.blip, 3)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Parking")
    EndTextCommandSetBlipName(info.blip)
  end
end)