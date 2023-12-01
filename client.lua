local QBCore = exports['qb-core']:GetCoreObject()

local Healer = {}

CreateThread(function()
    for k, v in pairs(Config.Locations) do
        local ped = v.ped

        RequestModel(ped)
        while not HasModelLoaded(ped) do
            Wait(0)
        end

        Healer[k] = CreatePed(0, ped, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, false)
        TaskStartScenarioInPlace(Healer[k], v.scenario, 0, true)
        FreezeEntityPosition(Healer[k], true)
        SetEntityInvincible(Healer[k], true)
        SetBlockingOfNonTemporaryEvents(Healer[k], true)

        exports['qb-target']:AddTargetEntity(Healer[k], {
            options = {
                {
                    label = Config.Language['target_text'],
                    icon = "fa fa-clipboard",
                    action = function()
                        QBCore.Functions.Progressbar("healing", Config.Language['proggresbar_info'], v.time, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = true,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            local currentCash = QBCore.Functions.GetPlayerData().money['cash']
                            local player = PlayerPedId()

                            if currentCash >= v.price or v.price <= 0 then
                                if v.shouldRevive then
                                    TriggerEvent('hospital:client:Revive')
                                else
                                    TriggerServerEvent("hospital:server:RestoreWeaponDamage")
                                    SetEntityMaxHealth(player, 200)
                                    SetEntityHealth(player, 200)
                                    ClearPedBloodDamage(player)
                                    SetPlayerSprint(PlayerId(), true)
                                    ResetPedMovementClipset(player, 0.0)
                                end

                                if v.price > 0 then
                                    TriggerServerEvent('qb-healer:pay', v.price)
                                end
                    
                                QBCore.Functions.Notify(Config.Language['successful_healed_info'], 'success')
                            else
                                QBCore.Functions.Notify(Config.Language['not_enought_money'], 'error')
                            end
                        end
                        , function()
                            QBCore.Functions.Notify(Config.Language['cancelled_notify'], 'error')
                        end)
                    end,
                }
            },
            distance = 2.0
        })

        SetModelAsNoLongerNeeded(ped)

        if v.blip ~= nil then
            local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
        
            SetBlipSprite(blip, v.blip.sprite)
            SetBlipColour(blip, v.blip.color)
            SetBlipScale(blip, v.blip.scale)
            SetBlipAsShortRange(blip, true)
            ShowHeightOnBlip(blip, false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.blip.name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)