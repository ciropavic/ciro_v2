Config = {}
Config.Keys={['ESC']=322,['F1']=288,['F2']=289,['F3']=170,['F5']=166,['F6']=167,['F7']=168,['F8']=169,['F9']=56,['F10']=57,['~']=243,['1']=157,['2']=158,['3']=160,['4']=164,['5']=165,['6']=159,['7']=161,['8']=162,['9']=163,['-']=84,['=']=83,['BACKSPACE']=177,['TAB']=37,['Q']=44,['W']=32,['E']=38,['R']=45,['T']=245,['Y']=246,['U']=303,['P']=199,['[']=39,[']']=40,['ENTER']=18,['CAPS']=137,['A']=34,['S']=8,['D']=9,['F']=23,['G']=47,['H']=74,['K']=311,['L']=182,['LEFTSHIFT']=21,['Z']=20,['X']=73,['C']=26,['V']=0,['B']=29,['N']=249,['M']=244,[',']=82,['.']=81,['LEFTCTRL']=36,['LEFTALT']=19,['SPACE']=22,['RIGHTCTRL']=70,['HOME']=213,['PAGEUP']=10,['PAGEDOWN']=11,['DELETE']=178,['LEFTARROW']=174,['RIGHTARROW']=175,['TOP']=27,['DOWNARROW']=173,['NENTER']=201,['N4']=108,['N5']=60,['N6']=107,['N+']=96,['N-']=97,['N7']=117,['N8']=61,['N9']=118,['UPARROW']=172,['INSERT']=121}
function L(cd) if Locales[Config.Language][cd] then return Locales[Config.Language][cd] else print('Locale is nil ('..cd..')') end end


--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


Config.Database = 'oxmysql' --[ 'mysql' / 'ghmattimysql' / 'oxmysql' ] Choose your sql database script.
Config.Language = 'EN' --[ 'EN' / 'BG' / 'DE' / 'CZ' / 'ES' / 'FI' / 'FR' / 'NL' / 'SE' / 'SK' ] You can add your own locales to the Locales.lua. But make sure to change the Config.Language to match it.

Config.ESX_version = 'legacy' --[ '1.1' / '1.2' / '1.final' / 'exm' / 'legacy' ] Choose the version of ESX you are using.
Config.FrameworkTriggers = { --You can change the esx events (IF NEEDED).
    main = 'esx:getSharedObject',
    load = 'esx:playerLoaded',
    job = 'esx:setJob'
}

Config.NotificationType = { --[ 'esx' / 'mythic_old' / 'mythic_new' / 'chat' / 'other' ] Choose your notification script.
    server = 'mythic_old',
    client = 'mythic_old' 
}


--██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗
--██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝
--██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   
--██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   
--██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   
--╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝


Config.SkinScript = 'betrayed_clothing_1' --[ 'esx_skin' / 'cui_character' / 'betrayed_clothing_1' / 'betrayed_clothing_2' / 'other' ] Choose the clothing script you use.

--ADVANCED
Config.UseAdvancedMultiCharMethod = false --DO NOT ENABLE THIS UNLESS YOU HAVE READ THE DOCUMENTATION AND YOU UNDERSTAND WHAT YOU ARE DOING. [https://docs.codesign.pro/paid-scripts/multicharacter-character-selection/#advanced-multi-character-method].
Config.IdentifierType = 'NULL' --[ 'NULL' / 'steamid' / 'license' ] --This is ONLY needed if you have modified your es_extended to use a different identifier type. For example if you use esx 1.final but you have modified it to use steamid instead of license.

--Read here for more info [https://docs.codesign.pro/paid-scripts/multicharacter-character-selection/#step-1-config-databasetables]
--IMPORTANT : The table keys [ table_name ] and [ column_name ] below must stay the same. (If you copy and paste the table from esx_kashacters or an old cd_multicharacter version, be sure to change the table keys back to the default ones).
Config.DatabaseTables = {
    {table_name = 'addon_account_data', column_name = 'owner'},
    {table_name = 'addon_inventory_items', column_name = 'owner'},
    {table_name = 'owned_vehicles', column_name = 'owner'},
    {table_name = 'ox_inventory', column_name = 'owner'},
    {table_name = 'rented_vehicles', column_name = 'owner'},
    {table_name = 'datastore_data', column_name = 'owner'},
    {table_name = 'user_licenses', column_name = 'owner'},
    --
    {table_name = 'users', column_name = 'identifier'},
    {table_name = 'playerstattoos', column_name = 'identifier'},
    {table_name = 'npwd_calls', column_name = 'identifier'},
    {table_name = 'npwd_marketplace_listings', column_name = 'identifier'},
    {table_name = 'npwd_match_profiles', column_name = 'identifier'},
    {table_name = 'npwd_match_views', column_name = 'identifier'},
    {table_name = 'npwd_notes', column_name = 'identifier'},
    {table_name = 'npwd_phone_contacts', column_name = 'identifier'},
    {table_name = 'npwd_phone_gallery', column_name = 'identifier'},
    {table_name = 'npwd_twitter_profiles', column_name = 'identifier'},
    {table_name = 'npwd_twitter_tweets', column_name = 'identifier'},
    {table_name = 'boosting_users', column_name = 'identifier'},
    {table_name = 'boosting', column_name = 'identifier'},
    --
    {table_name = 'character_current', column_name = 'steamid'},
    {table_name = 'character_face', column_name = 'steamid'},
    {table_name = 'character_outfits', column_name = 'steamid'},
    {table_name = 'user_lastcharacter', column_name = 'steamid'},
}

--The coordinates where each ped will spawn.
--IMPORTANT : If you want to add more character slots, you MUST add more PedSpawnCoords to the table below.
Config.PedSpawnCoords = {
    [1] = {x = -458.8, y = 1601.1, z = 358.22, h = 180.72},
    [2] = {x = -457.9, y = 1601.3, z = 358.25, h = 167.72},
    [3] = {x = -457.0, y = 1601.5, z = 358.23, h = 158.72},
    [4] = {x = -456.0, y = 1601.7, z = 358.21, h = 148.72},
    [5] = {x = -455.0, y = 1601.9, z = 358.18, h = 140.72},
    --[6] = {x = 0.0, y = 0.0, z = 0.0, h = 0.0},
}


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


Config.DefaultSpawn = {x = -457.0, y = 1601.5, z = 358.23, h = 158.72} --The default spawn location while creating a new character.
Config.Emoji = '⬇️' --Choose the emoji above the characters head, i guess you can use text here also (https://emojipedia.org/) - (set to 'FALSE' to disable).
Config.SpotLight = true --Do you want to enable the spotlight abov the peds?

Config.PedWalk = {
    type = 'SELECTED', --[ 'ALL' / 'SELECTED' / 'RANDOM' / 'NONE' ] 'ALL' = All peds exept the selected ped will move towards the camera. 'SELECTED' = Only the selected ped will move towards the camera. 'RANDOM' = 50/50 chance for selected and all. 'NONE' = None will move after selecting.
    speed = 1.0, --Choose how fast the peds walk away if Config.PedWalk.TYPE is not set to 'NONE'. (0.1 - 10.0 or 'RANDOM' for random values each time).

    --These are the coords that each ped will walk towards when selected.
    --IMPORTANT : If you want to add more character slots, you MUST add more coords to the table below.
    coords = {
        [1] = {x = -456.0, y = 1596.8, z = 358.22, h = 180.72},
        [2] = {x = -456.8, y = 1597.1, z = 358.22, h = 180.72},
        [3] = {x = -455.9, y = 1597.3, z = 358.25, h = 167.72},
        [4] = {x = -455.0, y = 1597.5, z = 358.23, h = 158.72},
        [5] = {x = -457.9, y = 1590.61, z = 359.55, h = 148.72},
        --[6] = {x = 0.0, y = 0.0, z = 0.0, h = 0.0},
    }
}

Config.JobLabels = { --You can configure this table to replace the job name from the database with a job label (this job label will be displayed on ui).
    ['police'] = 'LSPD',
    ['bcso'] = 'BCSO',
    ['ambulance'] = 'EMS',
}


--██╗  ██╗███████╗██╗   ██╗███████╗ 
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║
--██║  ██╗███████╗   ██║   ███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝


Config.Keys_left = Config.Keys['LEFTARROW'] --Left arrow
Config.Keys_right = Config.Keys['RIGHTARROW'] --Right arrow
Config.Keys_select = Config.Keys['ENTER'] --Enter / Left mouse click


-- ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗     ███████╗██╗      ██████╗ ████████╗███████╗
--██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝██║     ██╔═══██╗╚══██╔══╝██╔════╝
--██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝    ███████╗██║     ██║   ██║   ██║   ███████╗
--██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗    ╚════██║██║     ██║   ██║   ██║   ╚════██║
--╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║    ███████║███████╗╚██████╔╝   ██║   ███████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚══════╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝


Config.DefaultCharAmount = 5 --The amount of characters a player can have by default (MINIMUM = 1).

Config.CharacterSlotCommand = {
    ENABLE = true, --Do you want to staff to use the chat command to add/remove/check the max character amount of a player?
    chat_command = 'charslots', --The chat command.
    Perms = {'superadmin', 'admin', 'mod'} --You decide which permission groups can use the staff command.
}


--███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗     ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗ 
--██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
--███████╗██║ █╗ ██║██║   ██║   ██║     ███████║    ██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝
--╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║    ██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗
--███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║    ╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║
--╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝


Config.SwitchCharacter = {
    ENABLE = true, --Do you want to allow players to switch characters in game?
    
    Command = {
        ENABLE = false, ---Do you want to allow players to use a chat command to switch characters.
        chat_command = 'switchcharacter', --The chat command.
        distance_check = true --If the command is enabled above ^^, players need to go to to certain locations and use the chat command to switch characters.
    },

    KeyPress = {
        ENABLE = true, --Do you want to allow players to go to certain locations and press a key to switch characters.
        key = Config.Keys['E'] --The key used to switch characters.
    },


    Locations = {
        {   Name = '<b>'..L('switch_char_title')..'</b></p>'..L('switch_char_text'), --You dont need to change this.
            x = -219.07, y = -1044.86, z = 30.14, --This is the location where players can press e to switch characters in game.
            Dist = 10, --The distance that you can interact.
            EnableBlip = true, --If disabled, this locations blip will not show on the map.
        },
    
        --[[ --You can add more here.
        {   Name = '<b>'..L('switch_char_title')..'</b></p>'..L('switch_char_text'),
            x = 0.0, y = 0.0, z = 0.0,
            Dist = 10,
            EnableBlip = true,
        },
        --]]
    },

    Blip = {
        sprite = 304, --Icon of the blip. (you can find more here - https://docs.fivem.net/docs/game-references/blips/)
        scale = 0.6, --Size of the blip.
        colour = 0, --Colour of the blip.
        name = L('switch_char_title'), --You dont need to change this.
    }
}


-- ██████╗ █████╗ ███╗   ███╗███████╗██████╗  █████╗ 
--██╔════╝██╔══██╗████╗ ████║██╔════╝██╔══██╗██╔══██╗
--██║     ███████║██╔████╔██║█████╗  ██████╔╝███████║
--██║     ██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗██╔══██║
--╚██████╗██║  ██║██║ ╚═╝ ██║███████╗██║  ██║██║  ██║
-- ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝


Config.CameraType = 'FIXED' --[ 'FIXED' / 'FOCUS' ] 'FIXED' = The camera will not move when choosing a charatcer. 'FOCUS' = The camera will move and focus on the ped you are hovering over.

Config.Cam = { --Settings for the camera when viewing your characters.
    camName = 'DEFAULT_SCRIPTED_CAMERA',
    posX = -458.29,
    posY = 1598.0,
    posZ = 359.90, --All options below this line will only work if the Config.CameraType is set to 'FIXED'.
    rotX = 0.0,
    rotY = 0.0,
    rotZ = -22.0,
    fov = 70.0,
    p8 = false,
    p9 = 0,
}


-- █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


Config.PedAnimations = true --Do you want to allow the peds to do animations when you hover over them before selecting?

Config.AnimationList = { --Ramdom animations the selected ped will play when you hover over them.
    [1] = {anim_dict = 'friends@frj@ig_1', anim_name = 'wave_a'},
    [2] = {anim_dict = 'anim@mp_player_intcelebrationfemale@wave', anim_name = 'wave'},
    [3] = {anim_dict = 'friends@fra@ig_1', anim_name = 'over_here_idle_a'},
    [4] = {anim_dict = 'random@mugging5', anim_name = '001445_01_gangintimidation_1_female_idle_b'},
    [5] = {anim_dict = 'friends@frj@ig_1', anim_name = 'wave_b'},
    [6] = {anim_dict = 'friends@frj@ig_1', anim_name = 'wave_c'},
    [7] = {anim_dict = 'friends@frj@ig_1', anim_name = 'wave_d'},
    [8] = {anim_dict = 'friends@frj@ig_1', anim_name = 'wave_e'},
    [9] = {anim_dict = 'gestures@m@standing@casual', anim_name = 'gesture_hello'},
    [10] = {anim_dict = 'anim@arena@celeb@podium@no_prop@', anim_name = 'flip_off_a_1st'},
    [11] = {anim_dict = 'mp_player_int_uppergang_sign_a', anim_name = 'mp_player_int_gang_sign_a'},
    [12] = {anim_dict = 'mp_player_int_uppergang_sign_b', anim_name = 'mp_player_int_gang_sign_b'},
    [13] = {anim_dict = 'anim@arena@celeb@flat@solo@no_props@', anim_name = 'giggle_a_player_b'},
    [14] = {anim_dict = 'anim@mp_player_intupperair_shagging', anim_name = 'idle_a'},
    [15] = {anim_dict = 'anim@arena@celeb@flat@solo@no_props@', anim_name = 'flip_a_player_a'},
    [16] = {anim_dict = 'anim@arena@celeb@flat@solo@no_props@', anim_name = 'cap_a_player_a'},
    [17] = {anim_dict = 'anim@arena@celeb@flat@solo@no_props@', anim_name = 'slide_a_player_a'},
    [18] = {anim_dict = 'anim@arena@celeb@flat@solo@no_props@', anim_name = 'slide_b_player_a'},
    [19] = {anim_dict = 'anim@arena@celeb@flat@solo@no_props@', anim_name = 'slide_c_player_a'},
    [20] = {anim_dict = 'anim@arena@celeb@flat@solo@no_props@', anim_name = 'slugger_a_player_a'},
    --[21] = {anim_dict = 'CHANGE_ME', anim_name = 'CHANGE_ME'},
}


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


-- DON'T CHANGE THIS! This is just an extra fail safe to make sure you dont enter any incorrect tables into the Config.DatabaseTables table which could break the script.
Config.BlacklistedDatabaseTables = {
    ['user_lastcharacter'] = true,
    ['phone_numbers'] = true,
    ['cd_donatorshop'] = true,
    ['cd_donatorshop_logs'] = true,
}