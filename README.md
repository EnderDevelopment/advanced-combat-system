# Advanced Combat System

Enhance your FiveM server with advanced combat mechanics.

## Features

- Fast attacks
- Heavy attacks
- Parry mechanics
- Block mechanics
- Perfect parry mechanics
- Reward system for winning combats

## Requirements

- FiveM server
- ESX Framework
- MySQL

## Installation

1. Download the script files.
2. Place them in your server's resources folder.
3. Add `start advanced-combat-system` to your server.cfg file.

## Usage

### Commands

- `/fastattack [target]` - Perform a fast attack on the target player.
- `/heavyattack [target]` - Perform a heavy attack on the target player.
- `/parry` - Attempt to parry an incoming attack.
- `/block` - Attempt to block an incoming attack.
- `/perfectparry` - Attempt to perform a perfect parry.

## Configuration

The script can be configured in the `config.lua` file. Adjust the following settings:

- `FastAttackCooldown` - Cooldown for fast attacks.
- `HeavyAttackCooldown` - Cooldown for heavy attacks.
- `ParryWindow` - Time window for successful parry.
- `BlockWindow` - Time window for successful block.
- `PerfectParryWindow` - Time window for successful perfect parry.
- `FastAttackDamage` - Damage dealt by fast attacks.
- `HeavyAttackDamage` - Damage dealt by heavy attacks.
- `ParryDamageReduction` - Damage reduction when parrying.
- `BlockDamageReduction` - Damage reduction when blocking.
- `PerfectParryDamageReduction` - Damage reduction when perfect parrying.
- `Reward` - Reward for winning a combat.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=advanced-combat-system&utm_content=bottom) — describe it in one sentence and get the full source code.