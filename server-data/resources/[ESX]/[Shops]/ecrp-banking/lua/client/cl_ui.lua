bMenuOpen = false
local plyName = nil

Citizen.CreateThread(function()
    while (true) do
        ESX.TriggerServerCallback('ecrp:GetPlayerName', function(data)
            plyName = data
        end)
        Wait(20000)
    end
end)

function ToggleUI()
    bMenuOpen = not bMenuOpen
    local player = GetPlayerPed(-1)

    if (not bMenuOpen) then
        ClearPedTasks(PlayerPedId())
        exports.ox_inventory:Progress({
            duration = 1500,
            label = 'Retrieving Documents',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = {
                dict = 'amb@prop_human_atm@male@exit',
                clip = 'exit',
                flags = 0
            }
        }, function(cancel)
            if not cancel then
                ClearPedTasks(PlayerPedId())
                SetNuiFocus(false, false)
                ESX.UI.Menu.CloseAll()
            end
        end)
    else
        ESX.TriggerServerCallback("ecrp:GetBankData", function(data, friends, transactions)
            local PlayerBanks = json.encode(data)
            local FriendsData = {}

            if (friends and #friends >= 1) then
                FriendsData = friends
            end

            exports.ox_inventory:Progress({
                duration = 1000,
                label = 'Handing Documents',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                    mouse = false
                },
                anim = {
                    dict = 'amb@prop_human_atm@male@exit',
                    clip = 'exit',
                    flags = 0
                }
            }, function(cancel)
                if not cancel then
                    SetNuiFocus(true, true)
                    FreezeEntityPosition(player, false)
                    SendNUIMessage({
                        type = 'OpenUI',
                        accounts = PlayerBanks,
                        friends = json.encode(FriendsData),
                        transactions = json.encode(transactions),
                        name = plyName
                    })
                end
            end)
        end)
    end
end

function ToggleUIATM()
    bMenuOpen = not bMenuOpen
    local player = GetPlayerPed(-1)

    if (not bMenuOpen) then
        exports.ox_inventory:Progress({
          duration = 1500,
          label = 'Retrieving Card',
          useWhileDead = false,
          canCancel = false,
          disable = {
              move = true,
              car = true,
              combat = true,
              mouse = false
          },
          anim = {
              dict = 'amb@prop_human_atm@male@exit',
              clip = 'exit',
              flags = 0
          }
      }, function(cancel)
          if not cancel then
              ClearPedTasks(PlayerPedId())
              SetNuiFocus(false, false)
              ESX.UI.Menu.CloseAll()
          end
      end)
    else
        ESX.TriggerServerCallback("ecrp:GetBankData", function(data, friends, transactions)
            local PlayerBanks = json.encode(data)
            local FriendsData = {}

            if (friends and #friends >= 1) then
                FriendsData = friends
            end

            TaskPlayAnim(player, "amb@prop_human_atm@male@exit", "exit", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
            exports.ox_inventory:Progress({
              duration = 3000,
              label = 'Inserting Card',
              useWhileDead = false,
              canCancel = false,
              disable = {
                  move = true,
                  car = true,
                  combat = true,
                  mouse = false
              },
              anim = {
                  dict = 'amb@prop_human_atm@male@exit',
                  clip = 'exit',
                  flags = 0
              }
          }, function(cancel)
              if not cancel then
                  FreezeEntityPosition(player, false)
                  SetNuiFocus(true, true)
                  SendNUIMessage({
                      type = 'OpenUI',
                      accounts = PlayerBanks,
                      friends = json.encode(FriendsData),
                      transactions = json.encode(transactions),
                      name = plyName
                  })
              end
          end)
        end)
    end
end

RegisterNUICallback("CloseATM", function()
    ToggleUIATM()
end)

RegisterNUICallback("CloseBank", function()
    ToggleUI()
end)

RegisterNUICallback("DepositCash", function(data, cb)
    if (not data or not data.account or not data.amount) then
        return
    end

    if (tonumber(data.amount) <= 0) then
        return
    end

    if (data.account == "friend" and not data.steamid) then
        return
    end

    TriggerServerEvent("ecrp:Bank:Deposit", data.account, data.amount, (data.note ~= nil and data.note or ""),
        (data.steamid ~= nil and data.steamid or ""))
end)

RegisterNUICallback("WithdrawCash", function(data, cb)
    if (not data or not data.account or not data.amount) then
        return
    end

    if (tonumber(data.amount) <= 0) then
        return
    end

    if (data.account == "friend" and not data.steamid) then
        return
    end

    TriggerServerEvent("ecrp:Bank:Withdraw", data.account, data.amount, (data.note ~= nil and data.note or ""),
        (data.steamid ~= nil and data.steamid or ""))
end)

RegisterNUICallback("TransferCash", function(data, cb)
    if (not data or not data.account or not data.amount or not data.target) then
        return
    end

    if (tonumber(data.amount) <= 0) then
        return
    end

    if (tonumber(data.target) <= 0) then
        return
    end

    TriggerServerEvent("ecrp:Bank:Transfer", data.target, data.account, data.amount,
        (data.note ~= nil and data.note or ""), (data.steamid ~= nil and data.steamid or ""))
end)

RegisterNUICallback("RemoveAccess", function(data, cb)
    if (not data or not data.target or not data.player) then
        return
    end

    TriggerServerEvent("ecrp:Bank:RemoveAccess", data.target, data.player)
end)

RegisterNUICallback("EditAccount", function(data, cb)
    ESX.TriggerServerCallback("ecrp:Bank:GetBankAuths", function(auths)

        if (auths and #auths >= 1) then
            SendNUIMessage({
                type = 'edit_account',
                auths = json.encode(auths)
            })
        else
            SendNUIMessage({
                type = 'notification',
                msg_type = "error",
                message = "Nobody has access to your bank account!"
            })
        end
    end, "personal")
end)

-- // Net Events \\--
RegisterNetEvent("ecrp:Bank:Notify")
AddEventHandler("ecrp:Bank:Notify", function(type, msg)
    if (bMenuOpen) then
        SendNUIMessage({
            type = 'notification',
            msg_type = type,
            message = msg
        })
    end
end)

RegisterNetEvent("ecrp:Bank:UpdateTransactions")
AddEventHandler("ecrp:Bank:UpdateTransactions", function(transactions)
    if (bMenuOpen) then
        print("Sent update")
        SendNUIMessage({
            type = 'update_transactions',
            transactions = json.encode(transactions)
        })
        -- SendNUIMessage({type = "refresh_accounts"})

        ESX.TriggerServerCallback("ecrp:GetBankData", function(data, friends, transactions)
            local PlayerBanks = json.encode(data)

            local FriendsData = {}

            if (friends and #friends >= 1) then
                FriendsData = friends
            end

            SendNUIMessage({
                type = "refresh_balances",
                accounts = PlayerBanks,
                friends = json.encode(FriendsData)
            })
        end)
    end
end)

RegisterNetEvent("ecrp:Bank:RefreshAccounts")
AddEventHandler("ecrp:Bank:RefreshAccounts", function()
    SendNUIMessage({
        type = "refresh_accounts"
    })
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    SendNUIMessage({
        type = "refresh_accounts"
    })
end)
