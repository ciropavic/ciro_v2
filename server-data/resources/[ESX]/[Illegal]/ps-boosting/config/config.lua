Config = {}

Config.Debug = false
Config.LockpickCommand = 'startLockpick'
Config.AntiPoliceCommand = 'antipolice'
Config.ChangePlateCommand = 'changeplate'
Config.AddContractCommand = 'createContract' --Dont spam it
Config.HackerManCommand = 'hackerman' 

Config.Database = 'oxmysql' --['ghmattimysql' / 'oxmysql' ]
Config.OldVersion = false
Config.Framework = 'esx' --[ 'esx' / 'qbcore' ] -- If you use 'standalone' or 'customfw' some functions may not work as you want
Config.CustomKeySystem = false
-- if you use CustomSystem you need to export this when the door is opened
-- opened export["ps-boosting"]:SetOpenedDoors() this only for continue with process, will not unlock car

Config.XpGain = math.random(1, 10)  --PER CONTRACT
Config.QueueTimeMin = 1 -- in minutes
Config.QueueTimeMax = 2 -- in minutes
Config.ExtraVinGne = 10  --EXTRA FOR VIN
Config.VinCoolDown = 3  --IN MINUTES

Config.NumberOfContracts = {
    D = 6,
    C = 7,
    B = 7,
    A = 9,
    S = 12,
    SPLUS = 12,
}

Config.NumberOfHacks = {  --MAX OF HACKS 10, IF YOU SET MORE WILL GET TONS OF ERRROS
    D = 1,
    C = 1,
    B = 1,
    A = 1,
    S = 1,
    SPLUS = 1,
}

Config.BoostingContracts = {
    ["D"] ={   -- LEVEL 1
        [1] = {id = 1, vehicle = "panto", vehicleName = "Panto", type = "D", owner = "Palacios", expires = 8, units = 150},
        [2] = {id = 2, vehicle = "rhapsody", vehicleName = "Rhapsody", type = "D", owner = "Palacios", expires = 8, units = 150},
        [3] = {id = 3, vehicle = "blista", vehicleName = "Blista", type = "D", owner = "Palacios", expires = 8, units = 150},
        [4] = {id = 4, vehicle = "issi2", vehicleName = "Issi", type = "D", owner = "Palacios", expires = 8, units = 150},
        [5] = {id = 5, vehicle = "warrener", vehicleName = "Warrener", type = "D", owner = "Palacios", expires = 8, units = 150},
        [6] = {id = 6, vehicle = "pigalle", vehicleName = "Pigalle", type = "D", owner = "Palacios", expires = 8, units = 150},
    },
    ["C"] ={   -- LEVEL 2
        [1] = {id = 1, vehicle = "seminole2", vehicleName = "Seminole", type = "C", owner = "Palacios", expires = 7, units = 200},
        [2] = {id = 2, vehicle = "patriot", vehicleName = "Patriot", type = "C", owner = "Palacios", expires = 7, units = 200},
        [3] = {id = 3, vehicle = "huntley", vehicleName = "Huntley", type = "C", owner = "Palacios", expires = 7, units = 200},
        [4] = {id = 4, vehicle = "fq2", vehicleName = "FQ 2", type = "C", owner = "Palacios", expires = 7, units = 200},
        [5] = {id = 5, vehicle = "gb200", vehicleName = "GB 200", type = "C", owner = "Palacios", expires = 7, units = 200},
        [6] = {id = 6, vehicle = "savestra", vehicleName = "Savestra", type = "C", owner = "Palacios", expires = 7, units = 200},
        [7] = {id = 7, vehicle = "schafter3", vehicleName = "Schafter", type = "C", owner = "Palacios", expires = 7, units = 200},
    },
    ["B"] ={   -- LEVEL 3
        [1] = {id = 1, vehicle = "stanier", vehicleName = "Stainer", type = "B", owner = "Palacios", expires = 6, units = 250},
        [2] = {id = 2, vehicle = "stratum", vehicleName = "Stratum", type = "B", owner = "Palacios", expires = 6, units = 250},
        [3] = {id = 3, vehicle = "premier", vehicleName = "Premier", type = "B", owner = "Palacios", expires = 6, units = 250},
        [4] = {id = 4, vehicle = "kanjo", vehicleName = "Kanjo", type = "B", owner = "Palacios", expires = 6, units = 250},
        [5] = {id = 5, vehicle = "penumbra2", vehicleName = "Penumbra FF", type = "B", owner = "Palacios", expires = 6, units = 250},
        [6] = {id = 6, vehicle = "jugular", vehicleName = "Jugular", type = "B", owner = "Palacios", expires = 6, units = 250},
        [7] = {id = 7, vehicle = "flashgt", vehicleName = "Flash GT", type = "B", owner = "Palacios", expires = 6, units = 250},
    },
    ["A"] ={   -- LEVEL 4
        [1] = {id = 1, vehicle = "elegy2", vehicleName = "Elegy", type = "A", owner = "Palacios", expires = 5, units = 300},
        [2] = {id = 2, vehicle = "fusilade", vehicleName = "Fusilade", type = "A", owner = "Palacios", expires = 5, units = 300},
        [3] = {id = 3, vehicle = "jester", vehicleName = "Jester", type = "A", owner = "Palacios", expires = 5, units = 300},
        [4] = {id = 4, vehicle = "neon", vehicleName = "Neon", type = "A", owner = "Palacios", expires = 5, units = 300},
        [5] = {id = 5, vehicle = "dafter", vehicleName = "8F Drafter", type = "A", owner = "Palacios", expires = 5, units = 300},
        [6] = {id = 6, vehicle = "sultan3", vehicleName = "Sultan RS Classic", type = "A", owner = "Palacios", expires = 5, units = 300},
        [7] = {id = 7, vehicle = "vectre", vehicleName = "Vectre", type = "A", owner = "Palacios", expires = 5, units = 300},
        [8] = {id = 8, vehicle = "tailgater2", vehicleName = "Tailgater S", type = "A", owner = "Palacios", expires = 5, units = 300},
        [9] = {id = 9, vehicle = "dominator3", vehicleName = "Dominator GTX", type = "A", owner = "Palacios", expires = 5, units = 300},
    },
    ["S"] ={   -- LEVEL 5
        [1] = {id = 1, vehicle = "torero", vehicleName = "Torreo", type = "S", owner = "Palacios", expires = 4, units = 350},
        [2] = {id = 2, vehicle = "ztype", vehicleName = "ZType", type = "S", owner = "Palacios", expires = 4, units = 350},
        [3] = {id = 3, vehicle = "turismo2", vehicleName = "Turismo", type = "S", owner = "Palacios", expires = 4, units = 350},
        [4] = {id = 4, vehicle = "stingergt", vehicleName = "Stinger GT", type = "S", owner = "Palacios", expires = 4, units = 350},
        [5] = {id = 5, vehicle = "comet6", vehicleName = "Comet S2", type = "S", owner = "Palacios", expires = 4, units = 350},
        [6] = {id = 5, vehicle = "exor", vehicleName = "Camero ZL1", type = "S", owner = "Palacios", expires = 4, units = 350},
        [7] = {id = 7, vehicle = "srt8b", vehicleName = "Jeep SRT", type = "S", owner = "Palacios", expires = 4, units = 350},
        [8] = {id = 8, vehicle = "na6", vehicleName = "Mazda Miata", type = "S", owner = "Palacios", expires = 4, units = 350},
        [9] = {id = 9, vehicle = "por930", vehicleName = "Porsche 911 930", type = "S", owner = "Palacios", expires = 4, units = 350},
        [10] = {id = 10, vehicle = "subwrx", vehicleName = "Subaru Impreza WRX", type = "S", owner = "Palacios", expires = 4, units = 350},
        [11] = {id = 11, vehicle = "gt86", vehicleName = "Toyota GT86", type = "S", owner = "Palacios", expires = 4, units = 350},
        [12] = {id = 12, vehicle = "focusrs", vehicleName = "Ford Focus RS", type = "S", owner = "Palacios", expires = 4, units = 350},
    },
    ["S+"] ={  -- LEVEL 6
        [1] = {id = 1, vehicle = "turismor", vehicleName = "Torismo R", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [2] = {id = 2, vehicle = "visione", vehicleName = "Visione", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [3] = {id = 3, vehicle = "xa21", vehicleName = "XA-21", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [4] = {id = 4, vehicle = "ignus", vehicleName = "Ignus", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [5] = {id = 5, vehicle = "r8", vehicleName = "Audi R8", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [6] = {id = 6, vehicle = "huracan", vehicleName = "Lamborghini Huracan", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [7] = {id = 7, vehicle = "granlb", vehicleName = "Maserati Gran Turismo LW", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [8] = {id = 8, vehicle = "22g63", vehicleName = "Mercedes AMG G63", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [9] = {id = 9, vehicle = "r35", vehicleName = "Nissan GTR R35", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [10] = {id = 10, vehicle = "bc", vehicleName = "Pagani Huayra BC", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [11] = {id = 11, vehicle = "bdragon", vehicleName = "Bentley Continental GT Dragon", type = "S+", owner = "Palacios", expires = 3, units = 400},
        [12] = {id = 12, vehicle = "audirs6tk", vehicleName = "Audi RS6", type = "S+", owner = "Palacios", expires = 3, units = 400},
    },
}

Config.NumberBoostingLocations = 21  --VEHICLESPAWN LOCATIONS
Config.BoostinSpawnLocations = {
  [1] = {coords = vector3(378.7975769043, 282.14947509766, 102.58084106445)},
  [2] = {coords = vector3(30.466577529907, 97.64624786377, 78.497093200684)},
  [3] = {coords = vector3(-163.60258483887, -30.784902572632, 52.175842285156)},
  [4] = {coords = vector3(-187.3991394043, -176.41627502441, 43.098373413086)},
  [5] = {coords = vector3(-791.52966308594, -191.37702941895, 36.758182525635)},
  [6] = {coords = vector3(-841.36682128906, -138.6941986084, 37.100749969482)},
  [7] = {coords = vector3(-1304.8438720703, 251.50241088867, 61.889923095703)},
  [8] = {coords = vector3(-1319.4166259766, 279.68063354492, 63.24125289917)},
  [9] = {coords = vector3(-1664.9545898438, -220.5765838623, 54.46753692627)},
  [10] = {coords = vector3(-1736.8406982422, -717.09924316406, 9.7799291610718)},
  [11] = {coords = vector3(-1353.9654541016, -890.46685791016, 13.340107917786)},
  [12] = {coords = vector3(-701.54089355469, -985.41595458984, 19.86254119873)},
  [13] = {coords = vector3(-686.45367431641, -975.11877441406, 19.863235473633)},
  [14] = {coords = vector3(-620.78369140625, -1036.6120605469, 21.261985778809)},
  [15] = {coords = vector3(42.756618499756, -1630.9841308594, 28.762657165527)},
  [16] = {coords = vector3(31.57544708252, -1580.2338867188, 28.721664428711)},
  [17] = {coords = vector3(148.8404083252, -1518.1467285156, 28.615280151367)},
  [18] = {coords = vector3(439.89862060547, -1517.1246337891, 28.751476287842)},
  [19] = {coords = vector3(499.97146606445, -1524.6879882813, 28.762100219727)},
  [20] = {coords = vector3(-625.02899169922, -1657.4742431641, 25.298578262329)},
  [21] = {coords = vector3(359.9489440918, 271.39041137695, 102.55739593506)},
}

Config.NumberDropZones = 4  --NORMAL DROP
Config.DropZones = {
    [1] = {coords = vector3(201.88290405273,-158.49359130859,56.783882141113)},
    [2] = {coords = vector3(-1277.8936767578,-280.75573730469,38.155086517334)},
    [3] = {coords = vector3(516.95355224609,-540.58734130859,24.73127746582)},
    [4] = {coords = vector3(-1079.4503173828,-2172.3471679688,13.281025886536)},
}
Config.NumberVinDropZones = 1 --VIN SCRATCH
Config.VinDropZones = {
    [1] = {coords = vector3(479.78033447266,-1315.9255371094,29.203012466431)}
}

Config.NumberDropBennysZones = 2 --BENNYS PARTS
Config.DropBennysZones = {
    [1] = {coords = vector3(1182.705078125,-3322.177734375,6.0287265777588)},
    [2] = {coords = vector3(1778.5551757812,3641.6020507812,34.496780395508)},
}


Config.Locale = {
    ReceivedContract = "A new contract has been received",
    StartedContract = 'Your contract has been started Information Plate:',
    DoorOpen = "Lockpick Success!",
    DoorFail = "Lockpick Failed!",
    HackSuccess = "Hack Success!",
    HackFail = "Hack Failed!",
    PlateFail = "Broke a plate screw",
    JoinedQueue = "You have joined the queue",
    NotGNE = "You don't have enough GNE",
    ContractInProgress = "There is a contract in progress",
    PurchasedItems = "You have purchased items, in the amount of ",
    PendingItems = "You have pending items to collect!",
    FinishItems = "You have to pick up a pending order to order more!",
    ReceivedTransferedContract = "You received a transfered contract",
    NotTransferContract = "It was not possible to send the contract", 
    CoolDown = "You can't start this contract wait ",
    Step1Vin = "You need to find the car and lockpick it in zone marked in map",
    Step2Vin = "You need to disable gps",
    Step3Vin = "Go to the marked place, format paper and change plate",
    Step4Vin = "Now enjoy your car",
    BeforeScratch = "You need to disable gps before scratching",
    BeforeDropOff = "You need to disable gps before dropoff",
    minutes = " minutes",
}

Config.probabilityTracker = 80

--Bennys
Config.ConsumableItems = { --Set Consumable Items In Bennys App
    {label = 'Hacker USB', item = 'racing_usb', price = 125, icon = 'https://i.imgur.com/t9vIiuS.png'},
    {label = 'Police Jammer', item = 'antipolice', price = 125, icon =   'https://i.imgur.com/a9WnI87.png'},
    -- {label = 'Boosting Lockpick', item = 'lockpickboosting', price = 125, icon = 'https://imgur.com/tNi4CND.png'},
    {label = 'Plate Change', item = 'fake_plate', price = 125, icon = 'https://i.imgur.com/P32BkrM.png'},

}

Config.PerformanceObject = { --Set Performance Items In Bennys App
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Performance', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
}

Config.CosmeticObject =  {  --Set Cosmetic Items In Bennys App
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
    {label = 'Item Cosmetic', item = 'item', price = 125, icon = 'https://imgur.com/UxYwiKC.png'},
}

CustomNotification = function(msg)
    exports['mythic_notify']:DoHudText('inform', msg)
end

CustomMinigame = function()  --The minigame will start when you lockpick a vehicle, [NEEDS TO RETURN TRUE OR FALSE]
    local game = exports["taskbarskill"]:taskBar(1200,7)
    if game == 100 then
        return true  
    else
        return false  
    end
end

CustomMinigameHack = function() --The minigame will start when you get in car, [NEEDS TO RETURN TRUE OR FALSE]
    return exports["mobilehack"]:Open()
end

ScratchProgress = function()
  local game = exports["taskbarskill"]:taskBar(100,700)
  if game == 100 then
      return true
  else
      return false
  end
en