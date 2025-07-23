scoreboard players add @e[name="testkun"] death_timer 1
execute as @e[name="testkun"] at @s run tp @s ^^^1 true
execute if entity @e[name="testkun",scores={death_timer=..5}] run function penetrationtest