local ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

-- Combat mechanics
local function fastAttack(target)
    if not target then return end
    local playerPed = PlayerPedId()
    local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

    if not DoesEntityExist(targetPed) then return end

    TaskPlayAnim(playerPed, 'melee@unarmed@streamed_core', 'punch', 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(500)
    ClearPedTasks(playerPed)

    TriggerServerEvent('combatSystem:fastAttack', target, Config.Combat.FastAttackDamage)
end

local function heavyAttack(target)
    if not target then return end
    local playerPed = PlayerPedId()
    local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

    if not DoesEntityExist(targetPed) then return end

    TaskPlayAnim(playerPed, 'melee@unarmed@streamed_core', 'punch', 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(1000)
    ClearPedTasks(playerPed)

    TriggerServerEvent('combatSystem:heavyAttack', target, Config.Combat.HeavyAttackDamage)
end

local function parry()
    local playerPed = PlayerPedId()
    TaskPlayAnim(playerPed, 'melee@unarmed@streamed_core', 'punch', 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(300)
    ClearPedTasks(playerPed)

    TriggerServerEvent('combatSystem:parry')
end

local function block()
    local playerPed = PlayerPedId()
    TaskPlayAnim(playerPed, 'melee@unarmed@streamed_core', 'punch', 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(200)
    ClearPedTasks(playerPed)

    TriggerServerEvent('combatSystem:block')
end

local function perfectParry()
    local playerPed = PlayerPedId()
    TaskPlayAnim(playerPed, 'melee@unarmed@streamed_core', 'punch', 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(100)
    ClearPedTasks(playerPed)

    TriggerServerEvent('combatSystem:perfectParry')
end

-- Register commands
RegisterCommand('fastattack', function(source, args)
    local target = tonumber(args[1])
    if target then
        fastAttack(target)
    else
        ESX.ShowNotification('Invalid target')
    end
end, false)

RegisterCommand('heavyattack', function(source, args)
    local target = tonumber(args[1])
    if target then
        heavyAttack(target)
    else
        ESX.ShowNotification('Invalid target')
    end
end, false)

RegisterCommand('parry', function()
    parry()
end, false)

RegisterCommand('block', function()
    block()
end, false)

RegisterCommand('perfectparry', function()
    perfectParry()
end, false)