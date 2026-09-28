local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Database setup
MySQL.ready(function()
    MySQL.Async.execute('CREATE TABLE IF NOT EXISTS combat_system (
        id INT AUTO_INCREMENT PRIMARY KEY,
        player_id INT NOT NULL,
        wins INT DEFAULT 0,
        losses INT DEFAULT 0,
        FOREIGN KEY (player_id) REFERENCES users(identifier)
    );', {})

    MySQL.Async.execute('INSERT INTO combat_system (player_id) SELECT identifier FROM users WHERE identifier NOT IN (SELECT player_id FROM combat_system);', {})
end)

-- Combat event handlers
RegisterNetEvent('combatSystem:fastAttack')
AddEventHandler('combatSystem:fastAttack', function(target, damage)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(target)

    if xPlayer and xTarget then
        TriggerClientEvent('combatSystem:applyDamage', target, damage)
        MySQL.Async.execute('UPDATE combat_system SET wins = wins + 1 WHERE player_id = @player_id', {['@player_id'] = xPlayer.identifier})
        MySQL.Async.execute('UPDATE combat_system SET losses = losses + 1 WHERE player_id = @player_id', {['@player_id'] = xTarget.identifier})

        xPlayer.addMoney(Config.Combat.Reward)
        xPlayer.showNotification('You won the combat and earned $' .. Config.Combat.Reward)
        xTarget.showNotification('You lost the combat')
    end
end)

RegisterNetEvent('combatSystem:heavyAttack')
AddEventHandler('combatSystem:heavyAttack', function(target, damage)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(target)

    if xPlayer and xTarget then
        TriggerClientEvent('combatSystem:applyDamage', target, damage)
        MySQL.Async.execute('UPDATE combat_system SET wins = wins + 1 WHERE player_id = @player_id', {['@player_id'] = xPlayer.identifier})
        MySQL.Async.execute('UPDATE combat_system SET losses = losses + 1 WHERE player_id = @player_id', {['@player_id'] = xTarget.identifier})

        xPlayer.addMoney(Config.Combat.Reward)
        xPlayer.showNotification('You won the combat and earned $' .. Config.Combat.Reward)
        xTarget.showNotification('You lost the combat')
    end
end)

RegisterNetEvent('combatSystem:parry')
AddEventHandler('combatSystem:parry', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        xPlayer.showNotification('You successfully parried the attack')
    end
end)

RegisterNetEvent('combatSystem:block')
AddEventHandler('combatSystem:block', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        xPlayer.showNotification('You successfully blocked the attack')
    end
end)

RegisterNetEvent('combatSystem:perfectParry')
AddEventHandler('combatSystem:perfectParry', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        xPlayer.showNotification('You successfully performed a perfect parry')
    end
end)