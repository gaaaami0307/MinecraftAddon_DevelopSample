execute as @p as @s[lm=8,tag=magicer] at @s run tellraw @s {"rawtext":[{"text":"§6-=【発動】§9MP§d8 §b魔弾 §6=-"}]}
execute as @p as @s[l=7,tag=magicer] at @s run tellraw @s {"rawtext":[{"text":"§4XXX MP§d8§4が必要 XXX"}]}
execute as @p as @s[tag=!magicer] at @s run tellraw @s {"rawtext":[{"text":"§4XXX 使用できない XXX"}]}
execute as @p as @s[lm=8,tag=magicer] as @s[tag=mc_penetration] at @s run tellraw @s {"rawtext":[{"text":"§2||§dカスタマイズ: §b貫通化§2||"}]}
execute as @p as @s[lm=8,tag=magicer] at @s run summon gf:magicbullet ^^^-4
execute as @p as @s[lm=8,tag=magicer] at @s run tag @s add firstsettinger
execute as @p as @s[lm=8,tag=magicer] at @s positioned ^^^-4 run execute as @e[type=gf:magicbullet,tag=!firstsetting,c=1] at @s positioned ^^^4 run tp @s ^^^-4 facing @p[tag=firstsettinger]
execute as @p as @s[lm=8,tag=magicer] at @s positioned ^^^-4 run execute as @e[type=gf:magicbullet,tag=!firstsetting,c=1] at @s positioned ~~11.5~ run tp @s ^^^5.5
execute as @p as @s[lm=8,tag=magicer] as @s[tag=mc_penetration] at @s positioned ^^^-4 run execute as @e[type=gf:magicbullet,tag=!firstsetting,c=1] at @s positioned ~~11.5~ run tag @s add mc_penetration
execute as @p as @s[lm=8,tag=magicer] at @s positioned ^^^-4 run execute as @e[type=gf:magicbullet,tag=!firstsetting,c=1] at @s run tag @s remove firstsetting
execute as @p as @s[lm=8,tag=magicer] at @s run tag @s remove firstsettinger
execute as @p as @s[lm=8,tag=magicer] at @s run tag @s remove mc_penetration
execute as @p as @s[lm=8,tag=magicer] at @s run playsound block.bell.hit @a ~~~ 1 2
execute as @p as @s[lm=8,tag=magicer] at @s positioned ^^^1 run particle gami:magic1 ~~1.5~
execute as @p as @s[lm=8,tag=magicer] at @s run xp -8L @s