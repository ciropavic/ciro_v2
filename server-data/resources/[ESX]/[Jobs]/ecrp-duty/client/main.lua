exports.qtarget:AddBoxZone("mrpdsignin", vector3(441.8, -982.05, 30.69), 0.6, 0.4, {
    name = "mrpdsignin",
    heading = 11,
    -- debugPoly=true,
    minZ = 30.79,
    maxZ = 31.04
}, {
    options = {{
        event = "nh-context:policeSignon",
        icon = "fas fa-sign-in-alt",
        label = "Duty",
        job = {['bcso'] = 0, ['offbcso'] = 0, ['police'] = 0, ['offpolice'] = 0}
    }},
    distance = 2.5
})

RegisterNetEvent("nh-context:policeSignon", function()
  TriggerEvent("nh-context:createMenu", {
      {
          header = "Sign On",
          context = "",
          event = "esx_duty:signon",
          server = true,
      },
      {
          header = "Sign Off",
          context = "",
          event = "esx_duty:signoff",
          server = true,
      },
  })
end)