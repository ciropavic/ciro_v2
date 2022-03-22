-- ## GABZ - DAVIS POLICE DEPARTMENT
-- ## COORDINATES: 383.423,-1590.407,29.276

-- main entrance
table.insert(Config.DoorList, {
	doors = {
		{objHash = 1670919150, objHeading = 140.00004577637, objCoords = vector3(379.7842, -1592.606, 30.20128)}, -- gabz_davispd_maindoor_left
		{objHash = 618295057, objHeading = 140.00004577637, objCoords = vector3(381.776, -1594.277, 30.20128)} -- gabz_davispd_maindoor_right
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- back entrance
table.insert(Config.DoorList, {
	doors = {
		{objHash = 1670919150, objHeading = 320.0, objCoords = vector3(371.512, -1615.871, 30.20128)}, -- gabz_davispd_maindoor_left
		{objHash = 618295057, objHeading = 320.0, objCoords = vector3(369.5202, -1614.2, 30.20128)} -- gabz_davispd_maindoor_right
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- reception
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(382.8243, -1599.025, 30.14451),
	fixText = false,
	objHash = -425870000, -- gabz_davispd_singledoor_02
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- captain office
table.insert(Config.DoorList, {
	doors = {
		{objHash = -425870000, objHeading = 50.000118255615, objCoords = vector3(363.1489, -1592.496, 31.14457)}, -- gabz_davispd_singledoor_02
		{objHash = -425870000, objHeading = 230.00004577637, objCoords = vector3(361.6097, -1594.33, 31.14457)} -- gabz_davispd_singledoor_02
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office left
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(358.3827, -1595.001, 31.14457),
	fixText = false,
	objHash = -425870000, -- gabz_davispd_singledoor_02
	objHeading = 50.000106811523,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office right
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(363.2424, -1589.209, 31.14457),
	fixText = false,
	objHash = -425870000, -- gabz_davispd_singledoor_02
	objHeading = 230.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- cell women (main floor)
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(369.067, -1605.688, 29.94213),
	fixText = true,
	objHash = -674638964, -- gabz_davispd_cell_door
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- cell men (main floor)
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(368.2669, -1605.016, 29.94213),
	fixText = true,
	objHash = -674638964, -- gabz_davispd_cell_door
	objHeading = 140.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- staircase left (from main floor)
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(384.4286, -1601.96, 30.14451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 50.000118255615,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- staircase right (from main floor)
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(374.636, -1613.63, 30.14451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 230.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - mugshot
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(379.1723, -1603.826, 25.54451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - observation
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(375.543, -1608.151, 25.54451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - interrogation
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(371.9582, -1605.143, 25.54544),
	fixText = false,
	objHash = -728950481,
	objHeading = 140.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - restroom
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(368.894, -1602.572, 25.54544),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 140.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - cell women
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(375.0779, -1598.435, 25.34306),
	fixText = true,
	objHash = -674638964, -- gabz_davispd_cell_door
	objHeading = 140.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - cell men
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(375.878, -1599.106, 25.34306),
	fixText = true,
	objHash = -674638964, -- gabz_davispd_cell_door
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - hallway double door
table.insert(Config.DoorList, {
	doors = {
		{objHash = -1335406364, objHeading = 230.00004577637, objCoords = vector3(368.864, -1600.432, 25.54544)}, -- gabz_davispd_singledoor_01
		{objHash = -1335406364, objHeading = 50.000072479248, objCoords = vector3(370.4107, -1598.589, 25.54544)} -- gabz_davispd_singledoor_01
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - forensics
table.insert(Config.DoorList, {
	doors = {
		{objHash = -425870000, objHeading = 140.00004577637, objCoords = vector3(367.8591, -1594.313, 25.54551)}, -- gabz_davispd_singledoor_02
		{objHash = -425870000, objHeading = 320.0, objCoords = vector3(369.7023, -1595.86, 25.54551)} -- gabz_davispd_singledoor_02
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - armory
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(367.119, -1601.082, 25.54451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - lockers
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(363.8884, -1595.472, 25.54544),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 230.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - showers left
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(361.0061, -1595.953, 25.54544),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 319.99996948242,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - showers right
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(364.6354, -1591.628, 25.54544),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 319.99996948242,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- right_gate
table.insert(Config.DoorList, {
	objHash = 1286535678,
	maxDistance = 6.0,
	slides = true,
	garage = false,
	fixText = false,
	authorizedJobs = { ['police']=0, ['bcso']=0 },
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(397.8851, -1607.386, 28.34166),
	objHeading = 139.98545837402,
	locked = true,			
		-- oldMethod = true,
  audioLock = {['file'] = 'garage-lock.ogg', ['volume'] = 0.5},
  audioUnlock = {['file'] = 'garage-lock.ogg', ['volume'] = 0.5},
		-- autoLock = 1000
})

-- left_gate
table.insert(Config.DoorList, {
	objHash = -1483471451,
	maxDistance = 6.0,
	slides = true,
	garage = false,
	fixText = false,
	authorizedJobs = { ['police']=0, ['bcso']=0 },
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(413.3649, -1620.036, 28.34509),
	objHeading = 140.01405334473,
	locked = true,			
		-- oldMethod = true,
  audioLock = {['file'] = 'garage-lock.ogg', ['volume'] = 0.5},
  audioUnlock = {['file'] = 'garage-lock.ogg', ['volume'] = 0.5},
		-- autoLock = 1000
})

-- left_gate2
table.insert(Config.DoorList, {
	objHash = -1483471451,
	maxDistance = 6.0,
	slides = true,
	garage = false,
	fixText = false,
	authorizedJobs = { ['police']=0, ['bcso']=0 },
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(418.2896, -1651.396, 28.2951),
	objHeading = 50.75407409668,
	locked = true,			
		-- oldMethod = true,
  audioLock = {['file'] = 'garage-lock.ogg', ['volume'] = 0.5},
  audioUnlock = {['file'] = 'garage-lock.ogg', ['volume'] = 0.5},
		-- autoLock = 1000
})