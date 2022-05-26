-- 7709 Mansion Create Key
exports.qtarget:AddBoxZone("7709Computer", vector3(-3234.27, 812.96, 14.08), 1.0, 0.4, {
  name = "7709Computer",
  heading = 7,
  -- debugPoly=true,
  minZ = 13.78,
  maxZ = 13.98
}, {
  options = {{
      event = "ecrp-settings:7709Computer",
      icon = "fas fa-sign-in-alt",
      label = "Log In",
      item = "7709_key"
  }},
  distance = 2.0
})

RegisterNetEvent("ecrp-settings:7709Computer", function()
  local input = lib.inputDialog('Create Key', {'Player ID', 'Count'})

  if input then
      local plyID = tonumber(input[1])
      local count = tonumber(input[2])

      TriggerServerEvent('ecrp-settings:SV:7709Computer', plyID, count)
  end
end)