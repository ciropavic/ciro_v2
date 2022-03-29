return {
	-- ['testburger'] = {
	-- 	label = 'Test Burger',
	-- 	weight = 220,
	-- 	degrade = 60,
	-- 	limit = 3,
	-- 	client = {
	-- 		status = { hunger = 200000 },
	-- 		anim = 'eating',
	-- 		prop = 'burger',
	-- 		usetime = 2500,
	-- 		export = 'ox_inventory_examples.testburger'
	-- 	},
	-- 	server = {
	-- 		test = 'what an amazingly delicious burger, amirite?'
	-- 	}
	-- },

	-- ['firstaid'] = {
	-- 	label = 'First Aid Kit',
	-- 	weight = 2,
	-- 	client = {
	-- 		anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
	-- 		prop = { model = 'prop_rolled_sock_02', pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
	-- 		disable = { move = true, car = true, combat = true },
	-- 		usetime = 2500,
	-- 	}
	-- },

	['black_money'] = {
		label = 'Dirty Money',
	},

	['7709_key'] = {
		label = 'Key Fob',
    description = '7709 Great Ocean Highway'
	},

	['firstaid'] = {
		label = 'First Aid Kit',
		weight = 2,
    client = {
      anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
      usetime = 10000,
    }
	},

	['pdchestarmor'] = {
		label = '(PD) Chest Armor',
		weight = 37,
    client = {
      anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
      usetime = 12000,
    }
	},

	['chestarmor'] = {
		label = 'Chest Armor',
		weight = 37,
    client = {
      anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
      usetime = 12000,
    }
	},

	['burger'] = {
		label = 'Burger',
		weight = 1,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 7,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['stopsign'] = {
		label = 'Stop sign',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 5,
    degrade = 360000,
    stack = true,
    close = true,
	},

	['hacking_device'] = {
		label = 'Hacking Device',
		weight = 6,
		consume = 0,
    degrade = 360000,
    stack = false,
    close = true,
	},

	['phone'] = {
		label = 'Phone',
		weight = 5,
		stack = false,
		consume = 0,
	},

	['money'] = {
		label = 'Money',
	},

	['water'] = {
		label = 'Water',
		weight = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['a_brakes'] = {
		label = 'a class breaks',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['a_engine'] = {
		label = 'a class engine',
		weight = 15,
		stack = true,
		close = true,
		description = ''
	},

	['a_oil'] = {
		label = 'a class oil',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['a_suspension'] = {
		label = 'a class suspension',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['a_tires'] = {
		label = 'a class tires',
		weight = 12,
		stack = true,
		close = true,
		description = ''
	},

	['a_transmission'] = {
		label = 'a class transmission',
		weight = 10,
		stack = true,
		close = true,
		description = ''
	},

	['ammo-pistol'] = {
		label = 'Pistol Ammo',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['ammo-shotgun'] = {
		label = 'Shotgun Ammo',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['ammo-rifle'] = {
		label = 'Rifle Ammo',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['ammo-smg'] = {
		label = 'Sub Ammo',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['b_brakes'] = {
		label = 'b class breaks',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['b_engine'] = {
		label = 'b class engine',
		weight = 15,
		stack = true,
		close = true,
		description = ''
	},

	['b_oil'] = {
		label = 'b class oil',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['b_suspension'] = {
		label = 'b class suspension',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['b_tires'] = {
		label = 'b class tires',
		weight = 12,
		stack = true,
		close = true,
		description = ''
	},

	['b_transmission'] = {
		label = 'b class transmission',
		weight = 10,
		stack = true,
		close = true,
		description = ''
	},

	['beer'] = {
		label = 'beer',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['blowtorch'] = {
		label = 'blowtorch',
		weight = 2,
		stack = true,
		close = true,
		description = ''
	},

	['bread'] = {
		label = 'bread',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['c_brakes'] = {
		label = 'c class breaks',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['c_engine'] = {
		label = 'c class engine',
		weight = 15,
		stack = true,
		close = true,
		description = ''
	},

	['c_oil'] = {
		label = 'c class oil',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['c_suspension'] = {
		label = 'c class suspension',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['c_tires'] = {
		label = 'c class tires',
		weight = 12,
		stack = true,
		close = true,
		description = ''
	},

	['c_transmission'] = {
		label = 'c class transmission',
		weight = 10,
		stack = true,
		close = true,
		description = ''
	},

	['coffee'] = {
		label = 'coffee',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['cupcake'] = {
		label = 'cupcake',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['d_brakes'] = {
		label = 'd class breaks',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['d_engine'] = {
		label = 'd class engine',
		weight = 15,
		stack = true,
		close = true,
		description = ''
	},

	['d_oil'] = {
		label = 'd class oil',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['d_suspension'] = {
		label = 'd class suspension',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['d_tires'] = {
		label = 'd class tires',
		weight = 12,
		stack = true,
		close = true,
		description = ''
	},

	['d_transmission'] = {
		label = 'd class transmission',
		weight = 10,
		stack = true,
		close = true,
		description = ''
	},

	['greenlaptop'] = {
		label = 'green laptop',
		weight = 6,
		stack = false,
		close = true,
		description = ''
	},

	['laptop'] = {
		label = 'Laptop',
		weight = 6,
		stack = false,
		close = true,
		description = ''
	},

	['plates_change'] = {
		label = 'Change Plate',
		weight = 5,
		stack = true,
		close = true,
    consume = 1,
		description = 'Change vin scratch plates'
	},

	['icetea'] = {
		label = 'iced tea',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['id'] = {
		label = 'Citizen ID',
		weight = 0,
		stack = true,
		close = true,
		description = ''
	},

	['mechanic_tools'] = {
		label = 'mechanic tools',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['milk'] = {
		label = 'milk',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['nos'] = {
		label = 'nos',
		weight = 6,
		stack = true,
		close = true,
		description = ''
	},

	['radio'] = {
		label = 'radio',
		weight = 5,
		stack = true,
		close = true,
		description = ''
	},

	['redlaptop'] = {
		label = 'red laptop',
		weight = 6,
		stack = false,
		close = true,
		description = ''
	},

	['s_brakes'] = {
		label = 's class breaks',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['s_engine'] = {
		label = 's class engine',
		weight = 15,
		stack = true,
		close = true,
		description = ''
	},

	['s_oil'] = {
		label = 's class oil',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['s_suspension'] = {
		label = 's class suspension',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['s_tires'] = {
		label = 's class tires',
		weight = 12,
		stack = true,
		close = true,
		description = ''
	},

	['s_transmission'] = {
		label = 's class transmission',
		weight = 10,
		stack = true,
		close = true,
		description = ''
	},

	['sandwich'] = {
		label = 'sandwich',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['stock_brakes'] = {
		label = 'stock breaks',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['stock_engine'] = {
		label = 'stock engine',
		weight = 15,
		stack = true,
		close = true,
		description = ''
	},

	['stock_oil'] = {
		label = 'stock oil',
		weight = 7,
		stack = true,
		close = true,
		description = ''
	},

	['stock_suspension'] = {
		label = 'stock suspension',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['stock_tires'] = {
		label = 'stock tires',
		weight = 12,
		stack = true,
		close = true,
		description = ''
	},

	['stock_transmition'] = {
		label = 'stock transmission',
		weight = 10,
		stack = true,
		close = true,
		description = ''
	},

	['tequila'] = {
		label = 'tequila',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['thermite'] = {
		label = 'thermite',
		weight = 5,
		stack = true,
		close = true,
		description = ''
	},

	['turbo'] = {
		label = 'turbo',
		weight = 6,
		stack = true,
		close = true,
		description = ''
	},


	['weapon_advancedrifle'] = {
		label = 'advanced rifle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_appistol'] = {
		label = 'ap pistol',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_browning'] = {
		label = 'Browning',
		weight = 9,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_dp9'] = {
		label = 'Glock 18',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_staff'] = {
		label = 'Staff',
		weight = 15,
		stack = true,
		close = true,
		description = 'Weapon forged by the gods themselves.'
	},

	['weapon_cash'] = {
		label = 'Cash',
		weight = 2,
		stack = true,
		close = true,
		description = 'Pile of cash.'
	},

	['weapon_book'] = {
		label = 'Book',
		weight = 2,
		stack = true,
		close = true,
		description = 'Books ResidentSleeper.'
	},

	['weapon_brick'] = {
		label = 'Brick',
		weight = 5,
		stack = true,
		close = true,
		description = "What's heavier..."
	},

	['weapon_shoe'] = {
		label = 'Shoe',
		weight = 2,
		stack = true,
		close = true,
		description = "Gottcha shoe bitch."
	},

	['weapon_assaultrifle'] = {
		label = 'assault rifle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_assaultrifle_mk2'] = {
		label = 'assault rifle mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_assaultshotgun'] = {
		label = 'assault shotgun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_assaultsmg'] = {
		label = 'assault smg',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_autoshotgun'] = {
		label = 'auto shotgun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_ball'] = {
		label = 'ball',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_bat'] = {
		label = 'bat',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_battleaxe'] = {
		label = 'battle axe',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_bluelightsaber'] = {
		label = 'Blue Lightsaber',
		weight = 7,
		stack = true,
		close = true,
		description = 'One with the force.'
	},

  ['weapon_redlightsaber'] = {
    label = 'Red Lightsaber',
		weight = 7,
		stack = true,
		close = true,
		description = 'DEW IT!'
	},

  ['weapon_katanas'] = {
    label = 'Katana',
    weight = 7,
    stack = true,
    close = true,
    description = ''
  },

  ['weapon_shiv'] = {
    label = 'Shiv',
    weight = 7,
    stack = true,
    close = true,
    description = ''
  },

  ['weapon_bats'] = {
    label = 'Bat',
    weight = 7,
    stack = true,
    close = true,
    description = ''
  },
  
	['weapon_bottle'] = {
		label = 'bottle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_bullpuprifle'] = {
		label = 'bullpup rifle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_bullpuprifle_mk2'] = {
		label = 'bullpup rifle mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_bullpupshotgun'] = {
		label = 'bullpup shotgun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_bzgas'] = {
		label = 'bz gas',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_carbinerifle'] = {
		label = 'carbine rifle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_carbinerifle_mk2'] = {
		label = 'carbine rifle mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_combatmg'] = {
		label = 'combat mg',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_combatpdw'] = {
		label = 'combat pdw',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_combatpistol'] = {
		label = 'combat pistol',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_compactlauncher'] = {
		label = 'compact launcher',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_compactrifle'] = {
		label = 'compact rifle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_crowbar'] = {
		label = 'crowbar',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_dagger'] = {
		label = 'dagger',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_dbshotgun'] = {
		label = 'double barrel shotgun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_digiscanner'] = {
		label = 'digiscanner',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_doubleaction'] = {
		label = 'double action revolver',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_fireextinguisher'] = {
		label = 'fire extinguisher',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_firework'] = {
		label = 'firework launcher',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_flare'] = {
		label = 'flare',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_flaregun'] = {
		label = 'flare gun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_flashlight'] = {
		label = 'flashlight',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_garbagebag'] = {
		label = 'garbage bag',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_golfclub'] = {
		label = 'golf club',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_grenade'] = {
		label = 'grenade',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_grenadelauncher'] = {
		label = 'gernade launcher',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_gusenberg'] = {
		label = 'gusenberg',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_hammer'] = {
		label = 'hammer',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_hatchet'] = {
		label = 'hatchet',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_heavypistol'] = {
		label = 'heavy pistol',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_heavyshotgun'] = {
		label = 'heavy shotgun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_heavysniper'] = {
		label = 'heavy sniper',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_hominglauncher'] = {
		label = 'homing launcher',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_knife'] = {
		label = 'knife',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_knuckle'] = {
		label = 'knuckle dusters ',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_machete'] = {
		label = 'machete',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_machinepistol'] = {
		label = 'machine pistol',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_marksmanpistol'] = {
		label = 'marksman pistol',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_marksmanrifle'] = {
		label = 'marksman rifle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_mg'] = {
		label = 'mg',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_microsmg'] = {
		label = 'micro smg',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_minigun'] = {
		label = 'minigun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_minismg'] = {
		label = 'mini smg',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_molotov'] = {
		label = 'molotov',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_musket'] = {
		label = 'musket',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_nightstick'] = {
		label = 'police baton',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_petrolcan'] = {
		label = 'petrol can',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_pipebomb'] = {
		label = 'pipe bomb',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_pistol'] = {
		label = 'pistol',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_pistol_mk2'] = {
		label = 'pistol mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_pistol50'] = {
		label = 'police .50',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_poolcue'] = {
		label = 'pool cue',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_proxmine'] = {
		label = 'proximity mine',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_pumpshotgun'] = {
		label = 'pump shotgun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_pumpshotgun_mk2'] = {
		label = 'pump shotgun mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_railgun'] = {
		label = 'rail gun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_revolver'] = {
		label = 'revolver',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_revolver_mk2'] = {
		label = 'revolver mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_rpg'] = {
		label = 'rpg',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_sawnoffshotgun'] = {
		label = 'sawn off shotgun',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_smg'] = {
		label = 'smg',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_smg_mk2'] = {
		label = 'smg mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_smokegrenade'] = {
		label = 'smoke gernade',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_sniperrifle'] = {
		label = 'sniper rifle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_snowball'] = {
		label = 'snow ball',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_snspistol'] = {
		label = 'sns pistol',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_snspistol_mk2'] = {
		label = 'sns pistol mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_specialcarbine'] = {
		label = 'special rifle',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_specialcarbine_mk2'] = {
		label = 'special rifle mk2',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_stickybomb'] = {
		label = 'sticky bombs',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_stinger'] = {
		label = 'stinger',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_stone_hatchet'] = {
		label = 'stone hatchet',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_stungun'] = {
		label = 'Taser',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_switchblade'] = {
		label = 'Switch Blade',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_vintagepistol'] = {
		label = 'Vintage Pistol',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['weapon_wrench'] = {
		label = 'wrench',
		weight = 25,
		stack = true,
		close = true,
		description = ''
	},

	['whisky'] = {
		label = 'whisky',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['wine'] = {
		label = 'wine',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},
}