scoreboard objectives add sneakDetect minecraft.custom:minecraft.sneak_time
scoreboard objectives add jumpDetect minecraft.custom:minecraft.jump

execute as @a run execute at @s run execute if entity @s[x_rotation=90] run execute if score @s sneakDetect matches 1 run execute unless block ~ ~-1 ~ air run execute unless block ~ ~ ~ water run execute unless entity @e[tag=crawlShulker,distance=..2] run tag @s add crawlStart
execute at @a[tag=crawlStart] run summon minecraft:shulker ~ ~1 ~ {Invulnerable:1b,DeathLootTable:"empty",NoAI:1b,AttachFace:0b,Tags:["crawlShulker"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:100000,ShowParticles:0b}]}

execute as @a[tag=crawling] run execute at @s run fill ~-1 ~ ~-1 ~1 ~2 ~1 air replace barrier
execute as @a[tag=crawling] run execute at @s run execute if block ~ ~ ~ water run tag @e[tag=crawlShulker,distance=..2] add dead
execute as @a[tag=crawling] run execute at @s run execute if score @s jumpDetect matches 1 run tag @e[tag=crawlShulker,distance=..2] add dead
execute as @a[tag=crawling] run execute at @s run execute if block ~ ~ ~ water run tag @s remove crawling
execute as @a[tag=crawling] run execute if score @s jumpDetect matches 1 run tag @s remove crawling
execute as @a[tag=crawling] run execute at @s run execute if block ~ ~-1 ~ air run tag @s remove crawling
execute as @a[tag=crawling] run execute at @s run fill ~ ~1 ~ ~ ~1 ~ barrier replace air

execute as @a[tag=crawling] run execute at @s run execute unless block ~ ~1 ~ barrier run execute unless entity @e[tag=crawlShulker,distance=..2] run summon minecraft:shulker ~ ~1 ~ {Invulnerable:1b,DeathLootTable:"empty",NoAI:1b,AttachFace:0b,Tags:["crawlShulker"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:100000,ShowParticles:0b}]}
execute as @a[tag=crawling] run execute at @s run execute unless block ~ ~1 ~ barrier run tp @e[tag=crawlShulker,distance=..2] ~ ~1 ~

execute as @a[tag=crawling] run execute at @s run execute if block ~ ~1 ~ barrier run tag @e[tag=crawlShulker,distance=..2] add dead

execute at @e[tag=dead] run tp @e[tag=dead] ~ -9999 ~
kill @e[tag=dead]

scoreboard players set @a sneakDetect 0
scoreboard players set @a jumpDetect 0
tag @a[tag=crawlStart] add crawling
tag @a[tag=crawlStart] remove crawlStart
schedule function datapack:crawl 1t
