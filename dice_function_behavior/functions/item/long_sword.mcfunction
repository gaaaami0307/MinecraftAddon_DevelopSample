execute as @s at @s run playsound item.trident.riptide_1 @a ~~~ 1 1.8
execute as @s at @s run particle minecraft:large_explosion ^^0.5^1.5
execute as @s at @s run particle minecraft:large_explosion ^0.75^0.5^1.25
execute as @s at @s run particle minecraft:large_explosion ^-0.75^0.5^1.25
execute as @s at @s run particle minecraft:large_explosion ^1.5^0.5^1
execute as @s at @s run particle minecraft:large_explosion ^-1.5^0.5^1
execute as @s at @s positioned ^^^1.5 run damage @e[r=1.49] 8 entity_attack entity @s
execute as @s at @s positioned ^1.5^^1 run damage @e[r=1.49] 8 entity_attack entity @s
execute as @s at @s positioned ^-1.5^^1 run damage @e[r=1.49] 8 entity_attack entity @s