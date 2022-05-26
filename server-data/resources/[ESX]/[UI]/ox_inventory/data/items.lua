return {
	-- ['testburger'] = {
	-- 	label = 'Test Burger',
	-- 	weight = 220,
	-- 	degrade = 60,
	-- 	client = {
	-- 		status = { hunger = 200000 },
	-- 		anim = 'eating',
	-- 		prop = 'burger',
	-- 		usetime = 2500,
	-- 		export = 'ox_inventory_examples.testburger'
	-- 	},
	-- 	server = {
	-- 		export = 'ox_inventory_examples.testburger',
	-- 		test = 'what an amazingly delicious burger, amirite?'
	-- 	},
	-- 	buttons = {
	-- 		{
	-- 			label = 'Lick it',
	-- 			action = function(slot)
	-- 				print('You licked the burger')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'Squeeze it',
	-- 			action = function(slot)
	-- 				print('You squeezed the burger :(')
	-- 			end
	-- 		}
	-- 	}
	-- },

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
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

  ['stopsign'] = {
		label = 'Stop sign',
	},

  ['binoculars'] = {
		label = 'Binoculars',
		weight = 7,
    consume = 0,
    degrade = 360000,
    stack = false,
    close = true,
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 5,
    degrade = 360000,
    stack = true,
    close = false,
    consume = 0
	},

	['hacking_device'] = {
		label = 'Hacking Device',
		weight = 6,
		consume = 0,
    degrade = 360000,
    stack = false,
    close = true,
	},


  ['megaphone'] = {
		label = 'Megaphone',
		weight = 7,
    consume = 0,
    degrade = 360000,
    stack = false,
    close = true,
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

  ['id'] = {
		label = 'Citizen ID',
		weight = 0,
		stack = true,
		close = true,
		description = ''
	},

	['phone'] = {
		label = 'Phone',
		weight = 5,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 and GetResourceState('npwd') == 'started' then
					exports.npwd:setPhoneDisabled(false)
				end
			end,

			remove = function(total)
				if total < 1 and GetResourceState('npwd') == 'started' then
					exports.npwd:setPhoneDisabled(true)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 5,
		stack = false,
		consume = 0,
		allowArmed = true
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

  ['turbo'] = {
		label = 'turbo',
		weight = 6,
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

  ['mechanic_tools'] = {
		label = 'mechanic tools',
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

  ['tequila'] = {
		label = 'tequila',
		weight = 1,
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

  ['redlaptop'] = {
		label = 'red laptop',
		weight = 6,
		stack = false,
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

  ['7709_key'] = {
		label = 'Key Fob',
    description = '7709 Great Ocean Highway'
	},
}
