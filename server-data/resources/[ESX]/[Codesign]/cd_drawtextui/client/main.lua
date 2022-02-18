RegisterNetEvent('cd_drawtextu:ShowUI')
AddEventHandler('cd_drawtextui:ShowUI', function(action, text, color, color2)
	SendNUIMessage({
		action = action,
		text = text,
		color = color,
		color2 = color2,
	})
end)

RegisterNetEvent('cd_drawtextui:HideUI')
AddEventHandler('cd_drawtextui:HideUI', function()
	SendNUIMessage({
		action = 'hide'
	})
end)

-- RegisterCommand('testui', function ()
--   SendNUIMessage({
-- 		action = 'show',
-- 		text = "<span class='outline'>[G]</span> Drop the sign",
-- 		color = "blue",
-- 		color2 = "blue",
-- 	})
-- end)