execute  as @s at @s run summon rouge:magicbullet ^^^-4
execute  as @s at @s run tag @s add firstsettinger
execute  as @s at @s positioned ^^^-4 run execute as @e[type=rouge:magicbullet,tag=!firstsetting,c=1] at @s positioned ^^^4 run tp @s ^^^-4 facing @p[tag=firstsettinger]
execute  as @s at @s positioned ^^^-4 run execute as @e[type=rouge:magicbullet,tag=!firstsetting,c=1] at @s positioned ~~11.5~ run tp @s ^^^5.5
execute  as @s at @s positioned ^^^-4 run execute as @e[type=rouge:magicbullet,tag=!firstsetting,c=1] at @s run tag @s remove firstsetting
execute  as @s at @s run tag @s remove firstsettinger
execute  as @s at @s run playsound block.bell.hit @a ~~~ 1 2
execute  as @s at @s positioned ^^^1 run particle gami:magic1 ~~1.5~