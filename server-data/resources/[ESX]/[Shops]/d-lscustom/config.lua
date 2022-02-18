--[[DisplayPrompt = function()

end]]

Locale = {
	['prompt'] = "~INPUT_PICKUP~ Open LS Customs"
}

Config = {
	menuEvent = true, -- exposes event handler to open shop in any place [d-lscustom:openShop]
	mods = { 
		performance = {
			{ label = "ENGINE", name = "engine", id = 11 },
			{ label = "TRANSMISSION", name = "transmission", id = 13 },
			{ label = "SUSPENSION", name = "suspension", id = 15 },
			{ label = "BRAKES", name = "brakes", id = 12 },
		},
		body = {
			{ label = "SPOILER", name = "spoiler", id = 0 },

			{ label = "FRONTBUMPER", name = "frontbumper", id = 1, parentMenu = "bodykitparts" },
			{ label = "REARBUMPER", name = "rearbumper", id = 2, parentMenu = "bodykitparts" },
			{ label = "SIDESKIRT", name = "sideskirt", id = 3, parentMenu = "bodykitparts" },
			{ label = "LEFT FENDER", name = "leftfender", id = 8, parentMenu = "bodykitparts" },
			{ label = "RIGHT FENDER", name = "rightfender", id = 9, parentMenu = "bodykitparts" },

			{ label = "ROOF", name = "roof", id = 44, parentMenu = "body" },
			
			{ label = "ENGINE BLOCK", name = "engineblock", id = 39, parentMenu = "enginebay" },
			{ label = "AIR FILTER", name = "airfilter", id = 40, parentMenu = "enginebay" },
			{ label = "GRILLE", name = "grille", id = 6, parentMenu = "enginebay" },
			{ label = "STRUTS", name = "struts", id = 41, parentMenu = "enginebay" },
			{ label = "HOOD", name = "hood", id = 7, parentMenu = "enginebay" },

			{ label = "HORNS", name = "horns", id = 14, parentMenu = "customization" },
			{ label = "WRAP", name = "wrap", id = 48, parentMenu = "paintjob" },

			{ label = "STEERING WHEEL", name = "steeringwheel", id = 33, parentMenu = "interiormods" },
			{ label = "SEATS", name = "seats", id = 32, parentMenu = "interiormods" }, 
			{ label = "SPEEDOMETER", name = "speedometer", id = 30, parentMenu = "interiormods" }, 
			{ label = "DASHBOARD", name = "dashboard", id = 29, parentMenu = "interiormods" }, 
			{ label = "INTERIOR", name = "interior", id = 27, parentMenu = "interiormods" },

			{ label = "WINGS", name= "wings", id = 10, parentMenu = "misc" },
			{ label = "HOOD PINS", name = "aerials", id = 43, parentMenu = "misc" }, 
			{ label = "HYDRAULICS", name = "hydraulics", id = 38, parentMenu = "misc" },
			{ label = "SPEAKERS", name = "speakers", id = 31, parentMenu = "misc" },

			-- { label = "ARMOUR", name = "armour", id = 16, parentMenu = "customization" },
		},
		cosmetics = {
			{ name = "EXHAUST", id = 4 },
		}
	},
	customLabels = {
		engine = { [0] = "PRO", [1] = "SUPER", [2] = "ELITE", [3] = "ULTIMATE" },
		transmission = { [0] = "PRO", [1] = "SUPER", [2] = "ELITE", [3] = "ULTIMATE" },
		suspension = { [0] = "PRO", [1] = "SUPER", [2] = "ELITE", [3] = "ULTIMATE" },
		brakes = { [0] = "PRO", [1] = "SUPER", [2] = "ELITE", [3] = "ULTIMATE" },
		turbo = { [0] = "PRO", [1] = "SUPER", [2] = "ELITE", [3] = "ULTIMATE" },
		armour = { [0] = "20%", [1] = "40%", [2] = "60%", [3] = "80%", [4] = "100%" },
	},
	cameras = {
		general = { fov = 35.0, x = 5.5, y = 7.5, z = 1.5, rotX = -8.0, rotY = 0.0, rotZ = -145.0 },
		frontbumper = { fov = 30.0, x = 2.5, y = 6.5, z = 0.5, rotX = -3.0, rotY = 0.0, rotZ = -160.0 },
		stance = { fov = 30.0, x = 3.25, y = 5.5, z = 0.25, rotX = -3.0, rotY = 0.0, rotZ = -155.0 },
		rearbumper = { fov = 40.0, x = 1.3, y = -5.0, z = 0.7, rotX = -8.0, rotY = 0.0, rotZ = -30.0 },
		exhaust = { fov = 40.0, x = 1.3, y = -5.0, z = 0.7, rotX = -8.0, rotY = 0.0, rotZ = -30.0 },
		plates = { fov = 40.0, x = 1.0, y = -5.0, z = 0.7, rotX = -8.0, rotY = 0.0, rotZ = -25.0 },
		sideskirt = { fov = 40.0, x = -1.9, y = -2.0, z = 0.2, rotX = -8.0, rotY = 0.0, rotZ = 25.0 },
		interiormods = { fov = 40.0, x = -2.2, y = -1.8, z = 0.55, rotX = -8.0, rotY = 0.0, rotZ = 35.0 },
		steeringwheel = { fov = 40.0, x = -2.2, y = -1.8, z = 0.55, rotX = -8.0, rotY = 0.0, rotZ = 35.0 },
		speedometer = { fov = 40.0, x = -2.2, y = -1.8, z = 0.55, rotX = -8.0, rotY = 0.0, rotZ = 35.0 },
		dashboard = { fov = 40.0, x = -2.2, y = -1.8, z = 0.55, rotX = -8.0, rotY = 0.0, rotZ = 35.0 },
		hood = { fov = 35.0, x = 3.2, y = 3.5, z = 2.2, rotX = -29.0, rotY = 0.0, rotZ = -135.0 },
		enginebay = { fov = 35.0, x = 3.2, y = 3.5, z = 2.2, rotX = -29.0, rotY = 0.0, rotZ = -135.0 },
		airfilter = { fov = 35.0, x = 3.2, y = 3.5, z = 2.2, rotX = -29.0, rotY = 0.0, rotZ = -135.0 },
		struts = { fov = 35.0, x = 3.2, y = 3.5, z = 2.2, rotX = -29.0, rotY = 0.0, rotZ = -135.0 },
		engineblock = { fov = 35.0, x = 3.2, y = 3.5, z = 2.2, rotX = -29.0, rotY = 0.0, rotZ = -135.0 },
		aerials = { fov = 35.0, x = 3.2, y = 3.5, z = 2.2, rotX = -29.0, rotY = 0.0, rotZ = -135.0 },
		spoiler = { fov = 30.0, x = -3.0, y = -5.0, z = 1.2, rotX = -8.0, rotY = 0.0, rotZ = 35.0 },
		seats = { fov = 35.0, x = 2.7, y = 2.8, z = 1.0, rotX = -8.0, rotY = 0.0, rotZ = -135.0 },
	},
	shops = {
		{ 
			name = "Bennys", -- name to be shown as a blip label
			coords = vector3(-338.56442260742, -136.2606048584, 39.009624481201),
			range = 4.0, 
			whitelistedJobs = {'mechanic'}, -- access granting if [whitelistedJob] is enabled below
			-- blip = { sprite = 402, colour = 5 },
			jobPrices = {
				['default'] = 1.0,
				--['mechanic'] = 0.8,
			}
		}
	},
	whitelistedJob = false, -- enables shop access granting for configure jobs
	-- make sure to define whitelisted jobs on each shop, otherwise the shop will be unaccessible if enabled
	priceRatios = { -- price ratios for the vehicle mods
		-- if it's only one value like ([0] = 0.025), for every mod that price will be applied
		-- if it's a table like this ([11] = { [1] = 0.0, [2] = 0.05, [3] = 0.08, [4] = 0.1, [5] = 0.15 }), and you know that
		-- it will always have fixed amount of mods for example - engine, you can determine price ratio for each individual mod stage 
		-- like it's done now
		[11] = { [0] = 0.0125, [1] = 0.05, [2] = 0.08, [3] = 0.1, [4] = 0.15 }, -- ENGINE
		[12] = { [0] = 0.0125, [1] = 0.05, [2] = 0.08, [3] = 0.1, [4] = 0.15 }, -- BRAKES
		[13] = { [0] = 0.0125, [1] = 0.05, [2] = 0.08, [3] = 0.1, [4] = 0.15 }, -- TRANSMISSION
		[15] = { [0] = 0.0125, [1] = 0.05, [2] = 0.08, [3] = 0.1, [4] = 0.15 }, -- SUSPENSION
		[0] = 0.025, -- SPOILER
		[1] = 0.025, -- FRONT BUMPER
		[2] = 0.025, -- REAR BUMPER
		[3] = 0.025, -- SIDESKIRT
		[4] = 0.025, -- EXHAUST
		[6] = 0.025, -- GRILLE
		[7] = 0.025, -- HOOD
		[8] = 0.025, -- LEFT FENDER
		[9] = 0.025, -- RIGHT FENDER
		[10] = 0.025, -- WINGS
		[18] = 0.025, -- TURBO
		[14] = 0.025, -- HORNS
		[18] = 0.025, -- 
		[23] = 0.025, -- 
		[27] = 0.025, -- INTERIOR
		[29] = 0.025, -- DASHBOARD
		[30] = 0.025, -- SPEEDOMETER
		[31] = 0.025, -- SPEAKERS
		[32] = 0.025, -- SEATS
		[33] = 0.025, -- STEERING WHEEL
		[38] = 0.025, -- HYDRAULICS
		[39] = 0.025, -- ENGINE BLOCK
		[40] = 0.025, -- AIR FILTER
		[41] = 0.025, -- STRUTS
		[43] = 0.025, -- HOOD PINS
		[44] = 0.025, -- ROOG
		[48] = 0.005, -- WRAP
		["plates"] = 0.005, -- PLATES
	},
	toggleMinimap = true,
	wheeltypesections = {
		[0] = "wheelssection1", [1] = "wheelssection1", [2] = "wheelssection1", [3] = "wheelssection1", [4] = "wheelssection1", 
		[5] = "wheelssection2", [6] = "wheelssection2", [7] = "wheelssection2", [8] = "wheelssection2", [9] = "wheelssection2", 
	},
	doorsOpen = {
		{
			id = 4,
			menus = { 'engineblock', 'airfilter', 'enginebay', 'struts', 'grille' },
		},
		{
			id = 0,
			menus = { 'interiormods', 'steeringwheel', 'speedometer', 'dashboard' },
		},
		{
			id = 1,
			menus = { 'interiormods', 'steeringwheel', 'speedometer', 'dashboard' },
		},
		--[[{
			id = 2,
			menus = { 'interiormods', 'steeringwheel', 'speedometer', 'dashboard' },
		},
		{
			id = 3,
			menus = { 'interiormods', 'steeringwheel', 'speedometer', 'dashboard' },
		},]]
	},
	stance = {
		enable = true, -- toggles stance menu [READ INSTRUCTIONS HOW TO ENABLE!]
		range = {
			frontWidth = 0.1,
			rearWidth = 0.1,
			frontCamber = 0.19,
			rearCamber = 0.19,
		}
	},
	society = {
		enable = false, -- enables paying for mods out of society account
		enableSavings = true, -- when enabled, the configured part of mod price will go to the society account
		ratio = 0.2, -- (vehicle_price * ratio) this amount will be saved to the society account if enabled
	},
	marker = {
		enable = false, -- toggles visible marker for the shop range
		type = 27,
		zOffset = -0.2,
		range = 30.0,
		color = { r = 255, g = 255, b = 255},
		alpha = 0
	}
}

MenusTemplate = {
	general = {
		list = {
			{ label = "PERFORMANCE", name = "performance", childMenu = "performance" }, 
			{ label = "CUSTOMIZATION", name = "customization", childMenu = "customization" }, 
		},
		activeElement = 0,
	},
	customization = {
		list = {
			{ label = "BODY", name = "body", childMenu = "body" }, 
			{ label = "HORNS", name = "horns", childMenu = "horns" }, 
			{ label = "PAINTJOB", name = "paintjob", childMenu = "paintjob" },
			{ label = "COSMETICS", name = "cosmetics", childMenu = "cosmetics" },
			{ label = "ARMOUR", name = "armour", childMenu = "armour" },
		},
		activeElement = 0,
		parentMenu = "general"
	},
	body = {
		list = {
			{ label = "BODYKIT PARTS", name = "bodykitparts", childMenu = "bodykitparts" }, 
			{ label = "SPOILER", name = "spoiler", childMenu = "spoiler" }, 
			{ label = "ROOF", name = "roof", childMenu = "roof" },
			{ label = "ENGINE BAY", name = "enginebay", childMenu = "enginebay" },
			{ label = "INTERIOR MODS", name = "interiormods", childMenu = "interiormods" },
		},
		activeElement = 0,
		parentMenu = "customization"
	},
	enginebay = {
		list = {
			{ label = "HOOD", name = "hood", childMenu = "hood" },
			{ label = "ENGINE BLOCK", name = "engineblock", childMenu = "engineblock" }, 
			{ label = "AIR FILTER", name = "airfilter", childMenu = "airfilter" }, 
			{ label = "GRILLE", name = "grille", childMenu = "grille" }, 
			{ label = "STRUTS", name = "struts", childMenu = "struts" },
		},
		activeElement = 0,
		parentMenu = "body"
	},
	interiormods = {
		list = {
			{ label = "STEERING WHEEL", name = "steeringwheel", childMenu = "steeringwheel" },
			{ label = "SEATS", name = "seats", childMenu = "seats" }, 
			{ label = "SPEEDOMETER", name = "speedometer", childMenu = "speedometer" }, 
			{ label = "DASHBOARD", name = "dashboard", childMenu = "dashboard" }, 
			{ label = "INTERIOR", name = "interior", childMenu = "interior" },
		},
		activeElement = 0,
		parentMenu = "body"
	},
	bodykitparts = {
		list = {
			{ label = "FRONTBUMPER", name = "frontbumper", childMenu = "frontbumper" }, 
			{ label = "REARBUMPER", name = "rearbumper", childMenu = "rearbumper" },
			{ label = "SIDESKIRT", name = "sideskirt", childMenu = "sideskirt" },
			{ label = "LEFT FENDER", name = "leftfender", childMenu = "leftfender" },
			{ label = "RIGHT FENDER", name = "rightfender", childMenu = "rightfender" },
		},
		activeElement = 0,
		parentMenu = "body"
	},
	paintjob = {
		list = {
			{ label = "PAINT", name = "paint", childMenu = "paint" }, 
			{ label = "WRAP", name = "wrap", childMenu = "wrap" }, 
		},
		activeElement = 0,
		parentMenu = "customization"
	},
	performance = {
		list = {
			{ label = "ENGINE", name = "engine", childMenu = "engine" }, 
			{ label = "TRANSMISSION", name = "transmission", childMenu = "transmission" }, 
			{ label = "SUSPENSION", name = "suspension", childMenu = "suspension" },
			{ label = "BRAKES", name = "brakes", childMenu = "brakes" },
			{ label = "TURBO", name = "turbo", childMenu = "turbo" },
		},
		activeElement = 0,
		parentMenu = "general"
	},
	paint = {
		list = {{}},
		activeElement = 0,
		parentMenu = "paintjob"
	},
	stance = {
		list = {{}},
		activeElement = 0,
		parentMenu = "general"
	},
	neons = {
		list = {
			{ modId = "neon", label = "NO NEONS", type = "upgrade", price = 0 },
			{ modId = "neon", id = { r = 255, g = 255, b = 255 }, label = "WHITE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 112, g = 128, b = 144 }, label = "GRAY", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 0, g = 0, b = 255 }, label = "BLUE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 0, g = 150, b = 255 }, label = "LIGHT BLUE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 0, g = 0, b = 128 }, label = "NAVY BLUE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 135, g = 206, b = 235 }, label = "SKY BLUE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 0, g = 245, b = 255 }, label = "TURQUOISE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 50, g = 255, b = 155 }, label = "MINT GREEN", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 0, g = 255, b = 0 }, label = "LIME GREEN", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 128, g = 128, b = 0 }, label = "OLIVE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 255, g = 255, b = 0 }, label = "YELLOW", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 255, g = 215, b = 0 }, label = "GOLD", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 255, g = 165, b = 0 }, label = "ORANGE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 245, g = 222, b = 179 }, label = "WHEAT", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 255, g = 0, b = 0 }, label = "RED", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 255, g = 161, b = 211 }, label = "PINK", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 255, g = 0, b = 255 }, label = "BRIGHT PINK", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 153, g = 0, b = 153 }, label = "PURPLE", type = "upgrade", price = 5000 },
			{ modId = "neon", id = { r = 41, g = 36, b = 33 }, label = "IVORY", type = "upgrade", price = 5000 },
		},
		activeElement = 0,
		parentMenu = "cosmetics"
	},
	effects = {
		list = {
			{ modId = "effects", label = "STOCK", type = "upgrade", price = 0 },
			{ modId = "effects", id = { r = 255, g = 255, b = 255 }, label = "WHITE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 112, g = 128, b = 144 }, label = "GRAY", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 0, g = 0, b = 255 }, label = "BLUE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 0, g = 150, b = 255 }, label = "LIGHT BLUE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 0, g = 0, b = 128 }, label = "NAVY BLUE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 135, g = 206, b = 235 }, label = "SKY BLUE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 0, g = 245, b = 255 }, label = "TURQUOISE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 50, g = 255, b = 155 }, label = "MINT GREEN", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 0, g = 255, b = 0 }, label = "LIME GREEN", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 128, g = 128, b = 0 }, label = "OLIVE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 255, g = 255, b = 0 }, label = "YELLOW", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 255, g = 215, b = 0 }, label = "GOLD", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 255, g = 165, b = 0 }, label = "ORANGE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 245, g = 222, b = 179 }, label = "WHEAT", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 255, g = 0, b = 0 }, label = "RED", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 255, g = 161, b = 211 }, label = "PINK", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 255, g = 0, b = 255 }, label = "BRIGHT PINK", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 153, g = 0, b = 153 }, label = "PURPLE", type = "upgrade", price = 5000 },
			{ modId = "effects", id = { r = 41, g = 36, b = 33 }, label = "IVORY", type = "upgrade", price = 5000 },
		},
		activeElement = 0,
		parentMenu = "cosmetics"
	},
	cosmetics = {
		list = {
			{ label = "NEONS", name = "neons", childMenu = "neons" }, 
			{ label = "WINDOW TINT", name= "windowtint", childMenu = "windowtint" },
			{ label = "EXHAUST", name = "exhaust", childMenu = "exhaust" }, 
			{ label = "WHEELS", name = "wheels", childMenu = "wheeltypes" },
			{ label = "MISC", name = "misc", childMenu = "misc" },
		},
		activeElement = 0,
		parentMenu = "customization"
	},
	misc = {
		list = {
			{ label = "PLATES", name = "plates", childMenu = "plates" }, 
			{ label = "WINGS", name= "wings", childMenu = "wings" },
			{ label = "HOOD PINS", name = "aerials", childMenu = "aerials" }, 
			{ label = "HYDRAULICS", name = "hydraulics", childMenu = "hydraulics" },
			{ label = "SPEAKERS", name = "speakers", childMenu = "speakers	" },
		},
		activeElement = 0,
		parentMenu = "cosmetics"
	},
	windowtint = {
		list = {
			{ modId = "windowtint", id = 0, label = "NONE", type = "upgrade", price = 0 },
			{ modId = "windowtint", id = 1, label = "PURE BLACK", type = "upgrade", price = 5000 },
			{ modId = "windowtint", id = 2, label = "DARK SMOKE", type = "upgrade", price = 5000 },
			{ modId = "windowtint", id = 3, label = "LIGHT SMOKE", type = "upgrade", price = 5000 },
			{ modId = "windowtint", id = 4, label = "STOCK", type = "upgrade", price = 5000 },
			{ modId = "windowtint", id = 5, label = "LIMO", type = "upgrade", price = 5000 },
			{ modId = "windowtint", id = 6, label = "GREEN", type = "upgrade", price = 5000 },
		},
		activeElement = 0,
		parentMenu = "cosmetics"
	},
	wheeltypes = {
		list = {
			{ label = "SECTION_1", childMenu = "wheelssection1", icon = "wheels" }, 
			{ label = "SECTION_2", childMenu = "wheelssection2", icon = "wheels" },
			{ label = "EFFECTS", name = "effects", childMenu = "effects" },
		},
		activeElement = 0,
		parentMenu = "cosmetics"
	},
	wheelssection1 = {
		list = {
			{ label = "SPORT", childMenu = "wheels_0", icon = "wheels" }, 
			{ label = "MUSCLE", childMenu = "wheels_1", icon = "wheels" }, 
			{ label = "LOWRIDER", childMenu = "wheels_2", icon = "wheels" }, 
			{ label = "SUV", childMenu = "wheels_3", icon = "wheels" }, 
			{ label = "ALL TERRAIN", childMenu = "wheels_4", icon = "wheels" }, 
		},
		activeElement = 0,
		parentMenu = "wheeltypes"
	},
	wheelssection2 = {
		list = {
			{ label = "TUNING", childMenu = "wheels_5", icon = "wheels" }, 
			{ label = "MOTORCYCLE", childMenu = "wheels_6", icon = "wheels" }, 
			{ label = "HIGH END", childMenu = "wheels_7", icon = "wheels" }, 
			{ label = "IMPORT", childMenu = "wheels_8", icon = "wheels" }, 
			{ label = "LOWRIDER EXTENDED", childMenu = "wheels_9", icon = "wheels" }, 
		},
		activeElement = 0,
		parentMenu = "wheeltypes"
	},
}