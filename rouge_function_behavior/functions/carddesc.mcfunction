execute as @e[type=item,tag=!judshift] at @s as @p as @s[tag=t:sneaking] run tag @e[type=item,tag=!judshift,c=1,r=1] add using
execute as @e[type=item,tag=!judshift] at @s run tag @s add judshift
execute as @e[type=item,tag=!did] as @s[tag=using] at @s run playsound note.harp @a ~~~ 1 1
#
#
#
execute as @e[type=item,tag=!did,name="りんご"] as @s[tag=!using] at @s run tellraw @p[r=1] {"rawtext":[{"text":"【りんご】"}]}
execute as @e[type=item,tag=!did,name="りんご"] as @s[tag=!using] at @s run tellraw @p[r=1] {"rawtext":[{"text":"HPを10回復する"}]}
execute as @e[type=item,tag=!did,name="りんご"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"§6【りんご】=>"}]}
execute as @e[type=item,tag=!did,name="りんご"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"HPを10回復する"}]}
#
#
#
execute as @e[type=item,tag=!did] at @s run tag @s add did