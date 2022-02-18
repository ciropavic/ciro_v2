ESX = nil
Citizen.CreateThread(function()
    while true do
        Wait(5)
        if ESX ~= nil then
       
        else
            ESX = nil
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
    end
end)

local isPolice = false
local isMedic = false
local isInstructorMode = false
local myJob = "unemployed"
 
rootMenuConfig =  {
    {
        id = "general",
        displayName = "General",
        icon = "#globe-europe",
        enableMenu = function()
        dead = exports["ecrp-death"]:GetDeath()
            return not dead
        end,
        subMenus = {"general:keysgive",  "general:emotes",  "general:checkvehicle"}
    },
    {
        id = "police-action",
        displayName = "Police Actions",
        icon = "#police-action",
        enableMenu = function()
           local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           dead = exports["ecrp-death"]:GetDeath()
            if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" and not dead then
                return true
            end
        end,
        subMenus = {"cuffs:cuff", "cuffs:softcuff", "police:escort", "police:putinvehicle", "police:unseatnearest", "cuffs:checkinventory", "police:gsr", "police:getid", "police:impound", }
    },
    {
      id = "policeGarage",
      displayName = "Police Share Lot",
      icon = "#police-vehicle-garage",
      functionName = "nh-context:policeGarage",
      enableMenu = function()
      local ped = PlayerPedId()
         PlayerData = ESX.GetPlayerData()
         dead = exports["ecrp-death"]:GetDeath()
         inGarage = exports["ecrp-policegarage"]:InGarage()
          if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" and not dead and inGarage then
              return true
          end
      end,
    },
    {
      id = "personalGarage",
      displayName = "Parking",
      icon = "#police-vehicle-garage",
      functionName = "ecrp-garage:Main",
      enableMenu = function()
      local ped = PlayerPedId()
         PlayerData = ESX.GetPlayerData()
         dead = exports["ecrp-death"]:GetDeath()
         inGarage = exports["ecrp-garage"]:InGarage()
          if not dead and inGarage then
              return true
          end
      end,
    },
    {
      id = "bennys",
      displayName = "Bennys",
      icon = "#police-vehicle-garage",
      functionName = "d-lscustom:openShop",
      enableMenu = function()
      local ped = PlayerPedId()
         PlayerData = ESX.GetPlayerData()
         dead = exports["ecrp-death"]:GetDeath()
         inBennys = exports["d-lscustom"]:InBennys()
          if not dead and inBennys and IsPedInAnyVehicle(PlayerPedId(), false) then
              return true
          end
      end,
    },
    {
        id = "police-emergency",
        displayName = "Emergency",
        icon = "#police-emergency",
        enableMenu = function()
           local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           dead = exports["ecrp-death"]:GetDeath()
            if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" and dead then
                return true
            end
        end,
        subMenus = {"police:downed", "police:downedE"}
    },
    -- {
    --     id = "police-vehicle",
    --     displayName = "Police Vehicle",
    --     icon = "#police-vehicle",
    --     enableMenu = function()
    --     local ped = PlayerPedId()
    --        PlayerData = ESX.GetPlayerData()
    --        dead = exports["ecrp-death"]:GetDeath()
    --         if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" and not dead and IsPedInAnyVehicle(PlayerPedId(), false) then
    --             return true
    --         end
    --     end,
    --     subMenus = {--[[ "general:unseatnearest", ]] "police:runplate", --[[ "police:toggleradar" ]]}
    -- },
    {
        id = "emsDead",
        displayName = "10-14",
        icon = "#ems-dead",
        functionName = "st:panicTriggerMedic",
        enableMenu = function()
        local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           dead = exports["ecrp-death"]:GetDeath()
            if PlayerData.job.name == "ambulance" and dead then
                return true
            end
        end,
    },
    {
        id = "medic-emergency",
        displayName = "Emergency",
        icon = "#police-emergency",
        enableMenu = function()
           local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           dead = exports["ecrp-death"]:GetDeath()
            if PlayerData.job.name == "ambulance" and not dead then
                return true
            end
        end,
        subMenus = {"medic:downed"}
    },
    {
        id = "police-radio",
        displayName = "Radio Channels",
        icon = "#police-radio",
        enableMenu = function()
           local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           dead = exports["ecrp-death"]:GetDeath()
            if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" or PlayerData.job.name == "ambulance" and not dead then
                return true
            end
        end,
        subMenus = {"police:radio", "police:radio2", "police:radio3", "police:radio4", "police:radio5", "police:radio6",}
    },
    {
        id = "animations",
        displayName = "Walking Styles",
        icon = "#walking",
        enableMenu = function()
        dead = exports["ecrp-death"]:GetDeath()
            return not dead
        end,
        subMenus = { "animations:brave", "animations:brave2", "animations:hurry", "animations:hurry2", "animations:hurry3", "animations:hurry4", "animations:hurry5", "animations:hurry6", "animations:quick", "animations:business", "animations:business2", "animations:business3", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:swagger2", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:sad2", "animations:sad3", "animations:posh", "animations:alien" }
    },
    {
        id = "expressions",
        displayName = "Expressions",
        icon = "#expressions",
        enableMenu = function()
        dead = exports["ecrp-death"]:GetDeath()
            return not dead
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },
    {
      id = "mdw",
      displayName = "MDW",
      icon = "#judge-licenses-grant-business",
      functionName = "police:openMDW",
      enableMenu = function()
      dead = exports["ecrp-death"]:GetDeath()
        if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" and not dead then
              return true
          end
      end,
    },
    {
        id = "vehicle",
        displayName = "Vehicle",
        icon = "#vehicle-options-vehicle",
        functionName = "veh:options",
        enableMenu = function()
        dead = exports["ecrp-death"]:GetDeath()
            if not dead and IsPedInAnyVehicle(PlayerPedId(), false) then
                return true
            end
        end,
    }, 
}

newSubMenus = {    
    ['general:emotes'] = {
        title = "Emotes",
        icon = "#general-emotes",
        functionName = "emotes:OpenMenu"
    },    
    ['general:keysgive'] = {
        title = "Give Key",
        icon = "#general-keys-give",
        functionName = "general:givekey"
    }, 
    ['animations:brave'] = {
        title = "Brave",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave"
    },
    ['animations:brave2'] = {
        title = "Brave 2",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave2"
    },
    ['animations:hurry'] = {
        title = "Hurry",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry"
    },
    ['animations:hurry2'] = {
        title = "Hurry 2",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry2"
    },
    ['animations:hurry3'] = {
        title = "Hurry 3",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry3"
    },
    ['animations:hurry4'] = {
        title = "Hurry 4",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry4"
    },
    ['animations:hurry5'] = {
        title = "Hurry 5",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry5"
    },
    ['animations:hurry6'] = {
        title = "Hurry 6",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry6"
    },
    ['animations:quick'] = {
        title = "Quick",
        icon = "#animation-hurry",
        functionName = "AnimSet:Quick"
    },
    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },
    ['animations:business2'] = {
        title = "Business 2",
        icon = "#animation-business",
        functionName = "AnimSet:Business2"
    },
    ['animations:business3'] = {
        title = "Business 3",
        icon = "#animation-business",
        functionName = "AnimSet:Business3"
    },
    ['animations:tipsy'] = {
        title = "Tipsy",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },
    ['animations:injured'] = {
        title = "Injured",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },
    ['animations:tough'] = {
        title = "Tough",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },
    ['animations:sad'] = {
        title = "Sad",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },
    ['animations:sad2'] = {
        title = "Sad 2",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad2"
    },
    ['animations:sad3'] = {
        title = "Sad 3",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad3"
    },
    ['animations:posh'] = {
        title = "Posh",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },
    ['animations:nonchalant'] =
    {
        title = "Nonchalant",
        icon = "#animation-nonchalant",
        functionName = "AnimSet:NonChalant"
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },
    ['animations:money'] = {
        title = "Money",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },
    ['animations:swagger'] = {
        title = "Swagger",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },
    ['animations:swagger2'] = {
        title = "Swagger 2",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger2"
    },
    ['animations:shady'] = {
        title = "Shady",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },
    ['animations:maneater'] = {
        title = "Man Eater",
        icon = "#animation-maneater",
        functionName = "AnimSet:ManEater"
    },
    ['animations:chichi'] = {
        title = "ChiChi",
        icon = "#animation-chichi",
        functionName = "AnimSet:ChiChi"
    },
    ['animations:default'] = {
        title = "Default",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },
    ['cuffs:cuff'] = {
        title = "Hard Cuff",
        icon = "#cuffs-cuff",
        functionName = "ecrp-cuff"
    }, 
    ['cuffs:softcuff'] = {
        title = "Soft Cuff",
        icon = "#cuffs-cuff",
        functionName = "ecrp-softcuff"
    },
    ['cuffs:checkinventory'] = {
        title = "Search Person",
        icon = "#cuffs-check-inventory",
        functionName = "st:search"
    },
    ['cuffs:unseat'] = {
        title = "Unseat",
        icon = "#cuffs-unseat-player",
        functionName = "esx_ambulancejob:pullOutVehicle"
    },
    ['medic:heal'] = {
        title = "Treat Small Wounds",
        icon = "#medic-heal",
        functionName = "st:emssmallheal"
    },
    ['medic:bigheal'] = {
        title = "Treat Serious Wounds",
        icon = "#medic-heal",
        functionName = "st:emsbigheal"
    },
    ['medic:putinvehicle'] = {
        title = "Put in vehicle",
        icon = "#general-put-in-veh",
        functionName = "st:emsputinvehicle"
    },
    ['medic:takeoutvehicle'] = {
        title = "Take out vehicle",
        icon = "#general-unseat-nearest",
        functionName = "st:emstakeoutvehicle"
    },
    ['medic:drag'] = {
        title = "Drag",
        icon = "#general-escort",
        functionName = "st:emsdrag"
    },
    ['medic:undrag'] = {
        title = "Undrag",
        icon = "#general-escort",
        functionName = "st:emsundrag"
    },
    ['medic:downed'] = {
        title = "10-13",
        icon = "#police-dead",
        functionName = "medicdowned"
    },
    ['police:escort'] = {
        title = "Escort",
        icon = "#general-escort",
        functionName = "st:escort"
    },
    ['police:putinvehicle'] = {
        title = "Seat Vehicle",
        icon = "#general-put-in-veh",
        functionName = "st:putinvehicle"
    },
    ['police:unseatnearest'] = {
        title = "Unseat Nearest",
        icon = "#general-unseat-nearest",
        functionName = "st:takeoutvehicle"
    },
    ['police:impound'] = {
        title = "Impound",
        icon = "#police-vehicle",
        functionName = "st:menuimpound"
    },
    ['police:radio'] = {
        title = "Channel 1",
        icon = "#police-radio",
        functionName = "joinChannel1"
    },
    ['police:radio2'] = {
        title = "Channel 2",
        icon = "#police-radio",
        functionName = "joinChannel2"
    },
    ['police:radio3'] = {
        title = "Channel 3",
        icon = "#police-radio",
        functionName = "joinChannel3"
    },
    ['police:radio4'] = {
        title = "Channel 4",
        icon = "#police-radio",
        functionName = "joinChannel4"
    },
    ['police:radio5'] = {
        title = "Channel 5",
        icon = "#police-radio",
        functionName = "joinChannel5"
    },
    ['police:radio6'] = {
        title = "Channel 6",
        icon = "#police-radio",
        functionName = "joinChannel6"
    },
    ['police:downed'] = {
        title = "10-13B",
        icon = "#police-dead",
        functionName = "ecrp:officerdowned"
    },
    ['police:downedE'] = {
        title = "10-13A",
        icon = "#police-dead",
        functionName = "ecrp:officerdownedE"
    },
    ['police:cuff'] = {
        title = "Cuff",
        icon = "#cuffs-cuff",
        functionName = "police:cuffFromMenu"
    },
    ['police:checkbank'] = {
        title = "Check Bank",
        icon = "#police-check-bank",
        functionName = "police:checkBank"
    },
    ['police:checklicenses'] = {
        title = "Check Licenses",
        icon = "#police-check-licenses",
        functionName = "police:checkLicenses"
    },
    ['police:gsr'] = {
        title = "GSR Test",
        icon = "#police-action-gsr",
        functionName = "ecrp:gsr"
    },
    ['police:getid'] = {
        title = "Get ID",
        icon = "#police-vehicle-plate",
        functionName = "st:getid"
    },
    ['police:runplate'] = {
        title = "Run Plate",
        icon = "#police-vehicle-plate",
        functionName = "st:mdtvehiclesearch"
    },
    ['judge:grantDriver'] = {
        title = "Grant Drivers",
        icon = "#judge-licenses-grant-drivers",
        functionName = "police:grantDriver"
    }, 
    ['judge:grantBusiness'] = {
        title = "Grant Business",
        icon = "#judge-licenses-grant-business",
        functionName = "police:grantBusiness"
    },  
    ['judge:grantWeapon'] = {
        title = "Grant Weapon",
        icon = "#judge-licenses-grant-weapon",
        functionName = "police:grantWeapon"
    },
    ['judge:grantHouse'] = {
        title = "Grant House",
        icon = "#judge-licenses-grant-house",
        functionName = "police:grantHouse"
    },
    ['judge:grantBar'] = {
        title = "Grant BAR",
        icon = "#judge-licenses-grant-bar",
        functionName = "police:grantBar"
    },
    ['judge:grantDA'] = {
        title = "Grant DA",
        icon = "#judge-licenses-grant-da",
        functionName = "police:grantDA"
    },
    ['judge:removeDriver'] = {
        title = "Remove Drivers",
        icon = "#judge-licenses-remove-drivers",
        functionName = "police:removeDriver"
    },
    ['judge:removeBusiness'] = {
        title = "Remove Business",
        icon = "#judge-licenses-remove-business",
        functionName = "police:removeBusiness"
    },
    ['judge:removeWeapon'] = {
        title = "Remove Weapon",
        icon = "#judge-licenses-remove-weapon",
        functionName = "police:removeWeapon"
    },
    ['judge:removeHouse'] = {
        title = "Remove House",
        icon = "#judge-licenses-remove-house",
        functionName = "police:removeHouse"
    },
    ['judge:removeBar'] = {
        title = "Remove BAR",
        icon = "#judge-licenses-remove-bar",
        functionName = "police:removeBar"
    },
    ['judge:removeDA'] = {
        title = "Remove DA",
        icon = "#judge-licenses-remove-da",
        functionName = "police:removeDA"
    },
    ['judge:denyWeapon'] = {
        title = "Deny Weapon",
        icon = "#judge-licenses-deny-weapon",
        functionName = "police:denyWeapon"
    },
    ['judge:denyDriver'] = {
        title = "Deny Drivers",
        icon = "#judge-licenses-deny-drivers",
        functionName = "police:denyDriver"
    },
    ['judge:denyBusiness'] = {
        title = "Deny Business",
        icon = "#judge-licenses-deny-business",
        functionName = "police:denyBusiness"
    },
    ['judge:denyHouse'] = {
        title = "Deny House",
        icon = "#judge-licenses-deny-house",
        functionName = "police:denyHouse"
    },
    ['news:setCamera'] = {
        title = "Camera",
        icon = "#news-job-news-camera",
        functionName = "camera:setCamera"
    },
    ['news:setMicrophone'] = {
        title = "Microphone",
        icon = "#news-job-news-microphone",
        functionName = "camera:setMic"
    },
    ['news:setBoom'] = {
        title = "Microphone Boom",
        icon = "#news-job-news-boom",
        functionName = "camera:setBoom"
    },
    ['weed:currentStatusServer'] = {
        title = "Request Status",
        icon = "#weed-cultivation-request-status",
        functionName = "weed:currentStatusServer"
    },   
    ['weed:weedCrate'] = {
        title = "Remove A Crate",
        icon = "#weed-cultivation-remove-a-crate",
        functionName = "weed:weedCrate"
    },
    ['cocaine:currentStatusServer'] = {
        title = "Request Status",
        icon = "#meth-manufacturing-request-status",
        functionName = "cocaine:currentStatusServer"
    },
    ['cocaine:methCrate'] = {
        title = "Remove A Crate",
        icon = "#meth-manufacturing-remove-a-crate",
        functionName = "cocaine:methCrate"
    },
    ["expressions:angry"] = {
        title="Angry",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },
    ["expressions:drunk"] = {
        title="Drunk",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },
    ["expressions:dumb"] = {
        title="Dumb",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },
    ["expressions:electrocuted"] = {
        title="Electrocuted",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },
    ["expressions:grumpy"] = {
        title="Grumpy",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },
    ["expressions:happy"] = {
        title="Happy",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },
    ["expressions:injured"] = {
        title="Injured",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },
    ["expressions:joyful"] = {
        title="Joyful",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },
    ["expressions:mouthbreather"] = {
        title="Mouthbreather",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" }
    },
    ["expressions:normal"]  = {
        title="Normal",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },
    ["expressions:oneeye"]  = {
        title="One Eye",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },
    ["expressions:shocked"]  = {
        title="Shocked",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },
    ["expressions:sleeping"]  = {
        title="Sleeping",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },
    ["expressions:smug"]  = {
        title="Smug",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },
    ["expressions:speculative"]  = {
        title="Speculative",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },
    ["expressions:stressed"]  = {
        title="Stressed",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },
    ["expressions:sulking"]  = {
        title="Sulking",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },
    ["expressions:weird"]  = {
        title="Weird",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },
    ["expressions:weird2"]  = {
        title="Weird 2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = { "effort_3" }
    }
}

RegisterNetEvent("ecrp:tow")
AddEventHandler("ecrp:tow", function()
    ExecuteCommand("tow")
end)

RegisterNetEvent("general:givekey")
AddEventHandler("general:givekey", function()
    ExecuteCommand('givekeys')
end)

RegisterNetEvent("ecrp:gsr")
AddEventHandler("ecrp:gsr", function()
    ExecuteCommand("gsr")
end)

RegisterNetEvent("joinChannel1")
AddEventHandler("joinChannel1", function()
    ExecuteCommand("joinChannel1")
end)

RegisterNetEvent("joinChannel2")
AddEventHandler("joinChannel2", function()
    ExecuteCommand("joinChannel2")
end)

RegisterNetEvent("joinChannel3")
AddEventHandler("joinChannel3", function()
    ExecuteCommand("joinChannel3")
end)

RegisterNetEvent("joinChannel4")
AddEventHandler("joinChannel4", function()
    ExecuteCommand("joinChannel4")
end)

RegisterNetEvent("joinChannel5")
AddEventHandler("joinChannel5", function()
    ExecuteCommand("joinChannel5")
end)

RegisterNetEvent("joinChannel6")
AddEventHandler("joinChannel6", function()
    ExecuteCommand("joinChannel6")
end)

RegisterNetEvent("ecrp-softcuff")
AddEventHandler("ecrp-softcuff", function()
    ExecuteCommand('softcuff')
end)

RegisterNetEvent("ecrp-cuff")
AddEventHandler("ecrp-cuff", function()
    ExecuteCommand('cuff')
end)

RegisterNetEvent("police:openMDW")
AddEventHandler("police:openMDW", function()
    ExecuteCommand('mdw')
end)

RegisterNetEvent('enablegangmember')
AddEventHandler('enablegangmember', function(pGangNum)
    gangNum = pGangNum
end)

RegisterNetEvent("medicdowned")
AddEventHandler("medicdowned", function()
    local cord = GetEntityCoords(GetPlayerPed(-1))
    exports['core_dispach']:addCall("10-13", "EMS Downed", {
        {icon="fa-user-injured", info="EMS Downed"}
        }, {cord[1], cord[2], cord[3]}, "ambulance", 3000, 310, 1 )
end)

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local closestPed = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        for index,value in ipairs(players) do
            local target = GetPlayerPed(value)
            if(target ~= ply) then
                local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
                local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
                if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
                    closestPlayer = value
                    closestPed = target
                    closestDistance = distance
                end
            end
        end
        return closestPlayer, closestDistance, closestPed
    end
end
