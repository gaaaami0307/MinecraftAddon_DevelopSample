scoreboard players add @e[name="testkun"] death_timer 1
execute as @e[name="testkun"] at @s run tp ~~1~
execute if entity @e[name="testkun",scores={..5}] run function penetrationtest