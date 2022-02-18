Config = {

UsersUpdateRate = 300, -- Interval in seconds when users are updated in script. For example user buys a vehicle it will be only shown if users are updated.

DiscordWebhook = '', -- Discord webhook to send mdw changes

OpenCommand = 'mdw', -- Command to open MDW

UsingCoreEvidence = false, -- You can link evidence to an incident
UsingCoreMultijob = false, -- Shows every job user has saved on core_multijob
UsingCoreInsurance = false, -- This will show if the vehicle is insured
UsingESXProperties = false, -- Shows owned houses in user profile

Departaments = { -- Add departaments that can access MDW
	['police'] = {label = "LSPD"},
	['bcso'] = {label = "BCSO"}
},

EmergencyJobs = { -- Add emergency jobs that will get emergency broadcasts
    ['ambulance'] = true
},

Badges = { -- Add badges for officers that can be added with administrator permission
    ['bcso'] = "Blaine County Sheriffs Office",
    ['lspd'] = "Los Santos Police Department",

},

InstantAdministrator = { -- Get identifier from users table in database
    ['IDENTIFIER'] = true
},

ExcludeJobs = {
    ['mafia'] = true
},

WarrantEndingWarningTime = 48, -- Hours before warrant will become visable in dashboard as its close to expiering


Charges = { -- Specify the jail time and fine for each crime 
  -- Blue
  ['assault'] = {label = "Assault", jail = 7, fine = 0, color= "#2e93ff"},
  ['battery'] = {label = "Battery", jail = 11, fine = 0, color= "#2e93ff"},
  ['unlawfulimprisonment'] = {label = "Unlawful Imprisonment", jail = 11, fine = 0, color= "#2e93ff"},
  ['criminalthreats'] = {label = "Criminal Threats", jail = 14, fine = 0, color= "#2e93ff"},
  ['recklessendagerment'] = {label = "Reckless Endangerment", jail = 11, fine = 0, color= "#2e93ff"},
  ['grandtheft'] = {label = "Grand Theft", jail = 5, fine = 0, color= "#2e93ff"},
  ['brandishingafirearm'] = {label = "Brandishing of a Firearm", jail = 7, fine = 0, color= "#2e93ff"},
  ['tamperingavehicle'] = {label = "Tampering with a vehicle", jail = 7, fine = 0, color= "#2e93ff"},
  ['joyriding'] = {label = "Joy Riding", jail = 7, fine = 0, color= "#2e93ff"},
  ['recstolenproperty3d'] = {label = "Receiving Stolen Property in the Third Degree", jail = 7, fine = 0, color= "#2e93ff"},
  ['posessionofstolenid'] = {label = "Posession of Stolen Identification", jail = 12, fine = 0, color= "#2e93ff"},
  ['recstolenproperty2d'] = {label = "Receiving Stolen Property in the Second Degree", jail = 12, fine = 0, color= "#2e93ff"},
  ['possdm2d'] = {label = "Possession of Dirty Money in Second Degree ", jail = 12, fine = 0, color= "#2e93ff"},
  ['leavingwoutpaying'] = {label = "Leaving Without Paying", jail = 12, fine = 0, color= "#2e93ff"},
  ['trespassing'] = {label = "Trespassing", jail = 5, fine = 0, color= "#2e93ff"},
  ['conspiracy'] = {label = "Conspiracy", jail = 7, fine = 0, color= "#2e93ff"},
  ['contemptofcourt'] = {label = "Contempt of Court", jail = 10, fine = 0, color= "#2e93ff"},
  ['unauthptcoflaw'] = {label = "Unauthorized Practice of Law", jail = 5, fine = 0, color= "#2e93ff"},
  ['failuretoappear'] = {label = "Failure to Appear", jail = 9, fine = 0, color= "#2e93ff"},
  ['misuseof911'] = {label = "Misuse of 911 System", jail = 7, fine = 525, color= "#2e93ff"},
  ['animalcruelty'] = {label = "Animal Cruelty", jail = 7, fine = 0, color= "#2e93ff"},
  ['disobeypeaceofc'] = {label = "Disobeying a Peace Officer", jail = 7, fine = 0, color= "#2e93ff"},
  ['disorderlycoc'] = {label = "Disorderly Conduct", jail = 5, fine = 0, color= "#2e93ff"},
  ['dtcpeace'] = {label = "Disturbing the Pace", jail = 5, fine = 0, color= "#2e93ff"},
  ['falsereport'] = {label = "False Reporting", jail = 7, fine = 0, color= "#2e93ff"},
  ['tampevd'] = {label = "Tampering with Evidence", jail = 7, fine = 0, color= "#2e93ff"},
  ['posdrugpara'] = {label = "Possession of Drug Paraphernalla", jail = 7, fine = 0, color= "#2e93ff"},
  ['publicintox'] = {label = "Public Intoxication", jail = 7, fine = 0, color= "#2e93ff"},
  ['publicindey'] = {label = "Public Indecency", jail = 7, fine = 0, color= "#2e93ff"},
  ['pdcmeds'] = {label = "Practicing Medicine Without a License", jail = 7, fine = 0, color= "#2e93ff"},
  ['branddishnonfirm'] = {label = "Brandishing Non Firearm", jail = 5, fine = 0, color= "#2e93ff"},
  ['crimposfc1'] = {label = "Criminal Possession of a Firearm [Class 1]", jail = 7, fine = 0, color= "#2e93ff"},
  ['crimufc'] = {label = "Criminal Use of a Firearm", jail = 7, fine = 0, color= "#2e93ff"},
  ['resistarrest'] = {label = "Resisting Arrest", jail = 5, fine = 0, color= "#2e93ff"},

  -- Yellow
  ['assaultwdeadwp'] = {label = "Assault with a Deadly Weapon", jail = 21, fine = 0, color = "#ffae2b"},
  ['kidnapping'] = {label = "Kidnapping", jail = 14, fine = 0, color = "#ffae2b"},
  ['manslaughter'] = {label = "Manslaughter", jail = 25, fine = 0, color = "#ffae2b"},
  ['atcmurder'] = {label = "Attempted Murder", jail = 35, fine = 0, color = "#ffae2b"},
  ['atcmurdergov'] = {label = "Attempted Murder of a Government Employee", jail = 45, fine = 0, color = "#ffae2b"},
  ['gngraltshooting'] = {label = "Gang Related Shooting", jail = 45, fine = 0, color = "#ffae2b"},
  ['acssatcmud'] = {label = "Accessory to Attempted Murder", jail = 35, fine = 0, color = "#ffae2b"},
  ['accatcgovmd'] = {label = "Accessory to Attempted Murder of a Government Employee", jail = 0, fine = 0, color = "#ffae2b"},
  ['robbery'] = {label = "Robbery", jail = 14, fine = 0, color = "#ffae2b"},
  ['gta'] = {label = "Grand Theft Auto", jail = 14, fine = 0, color = "#ffae2b"},
  ['fdr'] = {label = "First Degree Robbery", jail = 20, fine = 0, color = "#ffae2b"},
  ['acrob'] = {label = "Accessory to Robbery", jail = 14, fine = 0, color = "#ffae2b"},
  ['acfdrob'] = {label = "Accessory to First Degree Robbery", jail = 20, fine = 0, color = "#ffae2b"},
  ['posstgoods'] = {label = "Possession of Stolen Goods", jail = 14, fine = 0, color = "#ffae2b"},
  ['recstlprft'] = {label = "Receiving Stolen Property in the First Degree", jail = 14, fine = 0, color = "#ffae2b"},
  ['grandlarc'] = {label = "Grand Larceny", jail = 24, fine = 0, color = "#ffae2b"},
  ['posdcfd'] = {label = "Possession of Dirty Money in the First Degree", jail = 21, fine = 0, color = "#ffae2b"},
  ['extortion'] = {label = "Extortion", jail = 14, fine = 0, color = "#ffae2b"},
  ['fraud'] = {label = "Fraud", jail = 14, fine = 0, color = "#ffae2b"},
  ['impajudge'] = {label = "Impersonating a Judge", jail = 21, fine = 0, color = "#ffae2b"},
  ['impaofc'] = {label = "Impersonating a Peace Officer", jail = 21, fine = 0, color = "#ffae2b"},
  ['impersonation'] = {label = "Impersonation", jail = 14, fine = 0, color = "#ffae2b"},
  ['idtheft'] = {label = "Identity Theft", jail = 21, fine = 0, color = "#ffae2b"},
  ['vregfraud'] = {label = "Vehicle Registration Fraud", jail = 21, fine = 0, color = "#ffae2b"},
  ['impems'] = {label = "Impersonating EMS", jail = 21, fine = 0, color = "#ffae2b"},
  ['buglary'] = {label = "Buglary", jail = 12, fine = 0, color = "#ffae2b"},
  ['feltrespass'] = {label = "Felony Trespassing", jail = 12, fine = 0, color = "#ffae2b"},
  ['arson'] = {label = "Arson", jail = 21, fine = 0, color = "#ffae2b"},
  ['accbug'] = {label = "Accessory to Buglary", jail = 12, fine = 0, color = "#ffae2b"},
  ['bribery'] = {label = "Bribery", jail = 12, fine = 0, color = "#ffae2b"},
  ['embezzlement'] = {label = "Embezzlement", jail = 21, fine = 0, color = "#ffae2b"},
  ['escapecust'] = {label = "Escaping Custody", jail = 14, fine = 0, color = "#ffae2b"},
  ['jailbreak'] = {label = "Jailbreak", jail = 28, fine = 0, color = "#ffae2b"},
  ['perjury'] = {label = "Perjury", jail = 21, fine = 0, color = "#ffae2b"},
  ['atcjb'] = {label = "Attempted JailBreak", jail = 28, fine = 0, color = "#ffae2b"},
  ['actojb'] = {label = "Accessory to Jailbreak", jail = 28, fine = 0, color = "#ffae2b"},
  ['voccocod'] = {label = "Violating a Court Order", jail = 28, fine = 0, color = "#ffae2b"},
  ['aocescust'] = {label = "Accessory to Escaping Custody", jail = 14, fine = 0, color = "#ffae2b"},
  ['introcontogovfc'] = {label = "Introducing Contraband into a Government Facility", jail = 20, fine = 0, color = "#ffae2b"},
  ['objjust'] = {label = "Obstruction of Justice", jail = 12, fine = 0, color = "#ffae2b"},
  ['riot'] = {label = "Riot", jail = 18, fine = 0, color = "#ffae2b"},
  ['dtpbut'] = {label = "Disruption of a Public Utility", jail = 28, fine = 0, color = "#ffae2b"},
  ['felmaj'] = {label = "Felony Possession of Marijuana", jail = 25, fine = 0, color = "#ffae2b"},
  ['felco'] = {label = "Felony Possession of Cocaine", jail = 25, fine = 0, color = "#ffae2b"},
  ['feloxy'] = {label = "Feloney Possession of COntrolled Dangerous Substance OXY or METH", jail = 25, fine = 0, color = "#ffae2b"},
  ['sod'] = {label = "Sale of Drugs", jail = 25, fine = 0, color = "#ffae2b"},
  ['felcoc'] = {label = "Felony Posession of Crack Cocaine", jail = 25, fine = 0, color = "#ffae2b"},
  ['cultmari'] = {label = "Cultivation of Marijuana", jail = 0, fine = 0, color = "#ffae2b"},
  ['dehumcor'] = {label = "Desecration of a Human Corpse", jail = 18, fine = 0, color = "#ffae2b"},
  ['cocfc2'] = {label = "Criminal Possession of a Firearm [Class 2]", jail = 28, fine = 0, color = "#ffae2b"},
  ['cocssf'] = {label = "Criminal Sale of a Firearm", jail = 12, fine = 0, color = "#ffae2b"},
  ['cocf3'] = {label = "Criminal Possession of a Firearm [Class 3]", jail = 35, fine = 0, color = "#ffae2b"},

  -- Red
  ['murder'] = {label = "Murder", jail = 50, fine = 0, color= "#ff2e2e"},
  ['murdergov'] = {label = "Murder of a Government Employee", jail = 50, fine = 0, color= "#ff2e2e"},
  ['acctomurder'] = {label = "Accessory to Murder", jail = 35, fine = 0, color= "#ff2e2e"},
  ['acctomurdergov'] = {label = "Accessory to Murder of a Government Employee", jail = 35, fine = 0, color= "#ff2e2e"},
  ['drugtraf'] = {label = "Drug Trafficking", jail = 40, fine = 0, color= "#ff2e2e"},
  ['terrorism'] = {label = "Terrorism", jail = 70, fine = 0, color= "#ff2e2e"},
},
 

Text = {

    ['license_revoked'] = 'Your license was revoked!',
    ['license_revoked_success'] = 'You revoked license!',
    ['waypoint_set']= 'Waypoint set!',
    ['no_permission'] = 'You dont have rights to do this'
    

}

}


-- Called when you press sentance button in charges menu (Only appears if criminal is online)
-- function SentanceCriminal(target, jail, fine, charges)



-- TriggerEvent('esx-qalle-jail:jailPlayer', target, jail, charges)
-- TriggerEvent('esx_billing:sendBill', target, 'society_police', charges, fine, false)



-- end



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
