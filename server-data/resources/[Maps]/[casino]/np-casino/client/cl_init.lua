local casinoInteriorId = nil

function IsTable(T)
  return type(T) == 'table'
end
function SetIplPropState(interiorId, props, state, refresh)
  if refresh == nil then refresh = false end
  if IsTable(interiorId) then
      for key, value in pairs(interiorId) do
          SetIplPropState(value, props, state, refresh)
      end
  else
      if IsTable(props) then
          for key, value in pairs(props) do
              SetIplPropState(interiorId, value, state, refresh)
          end
      else
          if state then
              if not IsInteriorPropEnabled(interiorId, props) then EnableInteriorProp(interiorId, props) end
          else
              if IsInteriorPropEnabled(interiorId, props) then DisableInteriorProp(interiorId, props) end
          end
      end
      if refresh == true then RefreshInterior(interiorId) end
  end
end

Citizen.CreateThread(function()
  Wait(10000)
  -- RequestIpl('vw_casino_main')
  -- RequestIpl('vw_dlc_casino_door')
  -- RequestIpl('hei_dlc_casino_door')
  RequestIpl("hei_dlc_windows_casino")
  -- RequestIpl("vw_casino_penthouse")
  SetIplPropState(274689, "Set_Pent_Tint_Shell", true, true)
  SetInteriorEntitySetColor(274689, "Set_Pent_Tint_Shell", 3)
  -- RequestIpl("vw_casino_carpark")
  -- RequestIpl("vw_casino_garage")
  -- RequestIpl("hei_dlc_windows_casino_lod")
  -- RequestIpl("hei_dlc_casino_aircon")
  -- RequestIpl("hei_dlc_casino_aircon_lod")
  -- RequestIpl("hei_dlc_casino_door")
  -- RequestIpl("hei_dlc_casino_door_lod")
  -- RequestIpl("hei_dlc_vw_roofdoors_locked")
  -- RequestIpl("vw_ch3_additions")
  -- RequestIpl("vw_ch3_additions_long_0")
  -- RequestIpl("vw_ch3_additions_strm_0")
  -- RequestIpl("vw_dlc_casino_door")
  -- RequestIpl("vw_dlc_casino_door_lod")
  -- RequestIpl("vw_casino_billboard")
  -- RequestIpl("vw_casino_billboard_lod(1)")
  -- RequestIpl("vw_casino_billboard_lod")
  -- RequestIpl("vw_int_placement_vw")
  -- RequestIpl("vw_dlc_casino_apart")
  local interiorId = GetInteriorAtCoords(1032.22,40.71,69.87)
  casinoInteriorId = interiorId

  if IsValidInterior(interiorId) then
    RefreshInterior(interiorId)
  end

  local casino_entrance = BoxZone:Create(vector3(930.0, 43.48, 81.1), 12.2, 10, {
    name="casino_entrance",
    -- debugPoly=true,
    heading=328,
    minZ=79.9,
    maxZ=83.9,
  })

  casino_entrance:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
      enterCasino(true)
    end
  end)

  local casino_exit = BoxZone:Create(vector3(921.06, 48.99, 81.1), 10.8, 10, {
    name="casino_exit",
    -- debugPoly=true,
    heading=328,
    minZ=79.7,
    maxZ=83.7,
  })

  casino_exit:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
      enterCasino(false)
    end
  end)

  -- exports["np-polyzone"]:AddBoxZone("casino_post_gate", vector3(1122.36, 240.28, -50.44), 10.8, 5.0, {
  --   heading=42,
  --   minZ=-51.44,
  --   maxZ=-49.04,
  --   data = {
  --     id = "1",
  --   },
  -- })
end)

local interiorSetNames = {
  ["bets"] = "casino_rm_betting_standard",
  ["poker"] = "casino_rm_betting_poker",
}
RegisterNetEvent("np-casino:entitySetSwap", function(set)
  local cInteriorId = GetInteriorAtCoords(993.04, 80.07, 69.67)
  for _, v in pairs(interiorSetNames) do
    DeactivateInteriorEntitySet(cInteriorId, v)
  end
  ActivateInteriorEntitySet(cInteriorId, interiorSetNames[set])
  RefreshInterior(cInteriorId)
end)

-- local interiorSetNamesUtil = {
--   ["util_clean"] = "set_xee_casino_utility",
--   ["util_tun_end"] = "set_xee_casino_tun_end",
--   ["util_broke"] = "set_xee_casino_utility_broken",
--   ["util_tun_end_broke"] = "set_xee_casino_tun_end_broken",
-- }
-- RegisterNetEvent("np-casino:entitySetSwapUtil", function(sets)
--   local cInteriorId = GetInteriorAtCoords(982.18,14.77,51.22)
--   for _, v in pairs(interiorSetNamesUtil) do
--     DeactivateInteriorEntitySet(cInteriorId, v)
--   end
--   for _, set in pairs(sets) do
--     ActivateInteriorEntitySet(cInteriorId, interiorSetNamesUtil[set])
--   end
--   RefreshInterior(cInteriorId)
-- end)

AddEventHandler("np-casino:enterPenthouse", function()
  TriggerEvent("np-casino:elevatorExitCasino")
  local interiorId = GetInteriorAtCoords(968.58,46.92,116.17)
  ActivateInteriorEntitySet(interiorId, "set_pent_creampie")
  RefreshInterior(interiorId)
end)
