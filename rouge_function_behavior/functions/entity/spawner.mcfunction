execute as @s[tag=!firstsetting] at @s run tp @s ~~50~
execute as @s[tag=!firstsetting] at @s run tag @s add firstsetting
execute as @s at @s positioned ~~-50~ unless entity @e[r=15,type=husk] run scoreboard players add @s death_timer 1
execute as @s[scores={death_timer=1..99}] at @s positioned ~~-50~ if entity @a[r=15] unless entity @e[r=15,type=husk] run particle minecraft:falling_dust_top_snow_particle ~~1~
execute as @s[scores={death_timer=100..199}] at @s positioned ~~-50~ if entity @a[r=15] unless entity @e[r=15,type=husk] run particle minecraft:falling_dust_sand_particle ~~1~
execute as @s[scores={death_timer=200..299}] at @s positioned ~~-50~ if entity @a[r=15] unless entity @e[r=15,type=husk] run particle minecraft:falling_dust_red_sand_particle ~~1~
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run playsound wind_charge.burst @a ~~~ 1 0.5
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run particle minecraft:wind_explosion_emitter ~~1~
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s positioned ~~-50~ if entity @a[r=15] run summon husk
execute as @s[scores={death_timer=300..}] at @s run scoreboard players set @s death_timer 0
