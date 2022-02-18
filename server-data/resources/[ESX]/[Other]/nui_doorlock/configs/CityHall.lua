

-- Jail Door 1
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	locked = true,
	fixText = false,
	objHash = 631614199,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	slides = false,
	objCoords = vector3(-514.1594, -205.0734, 34.40555),
	objHeading = 119.99998474121,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Jail Door 2
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	locked = true,
	fixText = false,
	objHash = 631614199,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	slides = false,
	objCoords = vector3(-516.2435, -201.4633, 34.40555),
	objHeading = 119.99998474121,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Jail
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	locked = true,
	fixText = false,
	objHash = -519068795,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	slides = false,
	objCoords = vector3(-510.8223, -203.0728, 34.4023),
	objHeading = 119.99998474121,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Entrance Bottom
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	locked = true,
	authorizedJobs = { ['police']=0 },
	audioRemote = false,
	doors = {
		{objHash = 605731446, objHeading = 119.99998474121, objCoords = vector3(-506.0826, -200.8349, 34.40414)},
		{objHash = 605731446, objHeading = 299.99996948242, objCoords = vector3(-507.1621, -198.9598, 34.40414)}
 },
	lockpick = false,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})