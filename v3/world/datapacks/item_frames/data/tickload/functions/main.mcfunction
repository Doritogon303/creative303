execute as @e[type=minecraft:item_frame] at @s if entity @e[type=minecraft:potion,distance=..2,nbt={Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:long_invisibility"}}}] run tag @s add invisible
execute as @e[type=minecraft:item_frame] at @s if entity @e[type=minecraft:potion,distance=..2,nbt={Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:invisibility"}}}] run tag @s add invisible
execute as @e[type=minecraft:item_frame] at @s if entity @e[type=minecraft:potion,distance=..2,nbt={Item:{id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:invisibility"}}}] run tag @s add invisible
execute as @e[type=minecraft:item_frame] at @s if entity @e[type=minecraft:potion,distance=..2,nbt={Item:{id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:long_invisibility"}}}] run tag @s add invisible
execute as @e[type=minecraft:item_frame,tag=invisible,nbt={Item:{}},tag=!item] at @s run data merge entity @s {Invisible:1}
execute as @e[type=minecraft:item_frame,tag=invisible,nbt=!{Item:{}},tag=!item] at @s run data merge entity @s {Invisible:0}
execute as @e[type=minecraft:item_frame,tag=invisible,nbt={Item:{}}] at @s run tag @s add item
execute as @e[type=minecraft:item_frame,tag=invisible,nbt=!{Item:{}}] at @s run tag @s remove item