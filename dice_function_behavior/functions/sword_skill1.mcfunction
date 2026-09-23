execute as @p as @s[lm=3,tag=sworder] at @s run tellraw @s {"rawtext":[{"text":"§6-=【発動】§9MP§d3 §b加速 §6=-"}]}
execute as @p as @s[l=2,tag=sworder] at @s run tellraw @s {"rawtext":[{"text":"§4XXX MP§d3§4が必要 XXX"}]}
execute as @p as @s[tag=!sworder] at @s run tellraw @s {"rawtext":[{"text":"§4XXX 使用できない XXX"}]}
execute as @p as @s[lm=3,tag=sworder] at @s run effect @s speed 1 3 false
execute as @p as @s[lm=3,tag=sworder] at @s run playsound item.trident.riptide_1 @a ~~~ 1 1.8
execute as @p as @s[lm=3,tag=sworder] at @s run particle minecraft:large_explosion ~~~
execute as @p as @s[lm=3,tag=sworder] at @s run xp -3L @s 
