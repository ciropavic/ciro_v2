cfg = {}
--This is where you put your DiscordAppID you can get it from here https://discord.com/developers/applications
cfg.DiscordAppID = 568621812456488960 

cfg.discordImageName = 'ecrp'
cfg.hoverText = 'East Coast Roleplay'
cfg.richPresenceText = "ID: " ..GetPlayerServerId(PlayerId()).. " | " .. #GetActivePlayers() .. " Players"
cfg.smallDiscordImageName = 'monke'
cfg.smallHoverText = 'Monke'

cfg.button1 = {
    text = 'Join!',
    url = 'fivem://connect/68.9.77.46:30120'
}

cfg.button2 = {
    text = 'Discord',
    url = 'https://discord.gg/EYXyng6'
}
-- Just to clarify something, you can only have 2 buttons
