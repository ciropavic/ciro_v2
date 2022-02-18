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
Config.Language = 'EN' --[ 'EN' / 'BG' / 'DE' / 'CZ' / 'ES' / 'FI' / 'FR' / 'NL' / 'PT' / 'SE' / 'SK' ] You can add your own locales to the Locales.lua. But make sure to change the Config.Language to match it.

Config.UseESX = true --Do you use es_extended?
Config.FrameworkTriggers = { --You can change the esx events (IF NEEDED).
    main = 'esx:getSharedObject',
    load = 'esx:playerLoaded',
    job = 'esx:setJob',
}

Config.NotificationType = { --[ 'esx' / 'mythic_old' / 'mythic_new' / 'chat' / 'other' ] Choose your notification script.
    server = 'mythic_old',
    client = 'mythic_old', 
}


--██████╗ ███████╗ ██████╗ ██╗███████╗████████╗███████╗██████╗      ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗ 
--██╔══██╗██╔════╝██╔════╝ ██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
--██████╔╝█████╗  ██║  ███╗██║███████╗   ██║   █████╗  ██████╔╝    ██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝
--██╔══██╗██╔══╝  ██║   ██║██║╚════██║   ██║   ██╔══╝  ██╔══██╗    ██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗
--██║  ██║███████╗╚██████╔╝██║███████║   ██║   ███████╗██║  ██║    ╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║
--╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝


Config.PassportRegisteringTime = 5 --(in seconds) How long should we wait after creating your identity until the random mesages stop and the passport UI closes.
Config.SpawnPosition = vector4(-206.24, -1013.56, 30.14, 341.3) --This is the location where players will be teleported to after they have created their identity.

Config.UseNationality = false --If enabled, the nationality of players will be saved into the database when they create a new character and can be displayed on the id cards.
Config.UsePlaceOfBirth = false --If enabled, the place of birth of players will be saved into the database when they create a new character and can be displayed on the id cards.


--██╗██████╗ ███████╗███╗   ██╗████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗     ██████╗ █████╗ ██████╗ ██████╗ 
--██║██╔══██╗██╔════╝████╗  ██║╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
--██║██║  ██║█████╗  ██╔██╗ ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██║     ███████║██████╔╝██║  ██║
--██║██║  ██║██╔══╝  ██║╚██╗██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ██║     ██╔══██║██╔══██╗██║  ██║
--██║██████╔╝███████╗██║ ╚████║   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ╚██████╗██║  ██║██║  ██║██████╔╝
--╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 


Config.IDcard = {
    ENABLE = true, --Do you want to allow players to use the id card? (if disabled, none of the options below will be used).
    use_licenses = true, --Do you want to display the players licenses on the id card?
    close_key = Config.Keys['BACKSPACE'], --The key to close the id card.
    close_timer = 10, --(in seconds) The id card will automatically close after x amount of seconds. (This is disabled by default; to enable this replace nil with a number eg., 10).
    
    Usage = {
        item = true, --Do you want to allow players to show their id card to players by using a usable item.
        item_name = 'id', --The spawn name of the usable item.

        command = false, --Do you want to allow players to show their id card to other players by using a command?
        command_itemcheck = true, --Do you want to make players be required to have the id card item in their inventory? (the 'item_name' above will be the item we are checking for ^^^).

        command_name_1 = 'id', --Name of the chat command.
        distance_1 = 5, --Gets the closest player within this distance to show your id card to.
        description_1 = L('command_description_1'), --The description for the chat message.

        --This 2nd command will show your id card to the closest player who is NOT in a vehicle (useful in traffic stops for when you want to show your id card to an officer outside your vehicle instead of your passenger).
        command_name_2 = 'idtraffic',
        distance_2 = 5,
        description_2 = L('command_description_2'),
    },

    ESX_LicenseLabels = { --If you are using esx_license, add your license types into this table and then set alabel for it. (this label will be displayed on the id card).
      ['dmv'] = 'Learners Permit',
      ['drive'] = 'Drivers License',
      ['drive_bike'] = 'Motorcycle License',
      ['drive_truck'] = 'Trucking License',
      ['weapon'] = 'Weapon Permit',
    }
}


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


Config.EnableTestCommand = false ---The test command is 'identitytest'.