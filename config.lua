Config = {}

-- Combat settings
Config.Combat = {
    FastAttackCooldown = 1.0, -- seconds
    HeavyAttackCooldown = 2.0, -- seconds
    ParryWindow = 0.5, -- seconds
    BlockWindow = 0.3, -- seconds
    PerfectParryWindow = 0.2, -- seconds
    FastAttackDamage = 10,
    HeavyAttackDamage = 20,
    ParryDamageReduction = 0.5, -- 50% damage reduction
    BlockDamageReduction = 0.7, -- 30% damage reduction
    PerfectParryDamageReduction = 0.9, -- 10% damage reduction
    Reward = 500 -- reward for winning a combat
}

-- Database settings
Config.Database = {
    TableName = 'combat_system'
}