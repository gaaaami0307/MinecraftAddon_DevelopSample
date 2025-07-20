execute as @e[type=item,tag=!judshift] at @s as @p if entity @s[tag=t:sneaking] run tag @e[type=item,tag=!judshift,c=1,r=1] add using
execute as @e[type=item,tag=!judshift] at @s run tag @s add judshift
execute as @e[type=item,tag=!did] as @s[tag=using] at @s run playsound note.bell @a ~~~ 1 1
execute as @e[type=item,tag=!did] as @s[tag=!using] at @s run playsound note.bass @p ~~~ 1 1
execute as @e[type=item,tag=!did] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"------------------説明-----------------\n "}]}
execute as @e[type=item,tag=!did] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"§6---------------------------------------\n "}]}
#
#
#
execute as @e[type=item,tag=!did,name="りんご"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【りんご】"}]}
execute as @e[type=item,tag=!did,name="りんご"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"HPを10回復する"}]}
execute as @e[type=item,tag=!did,name="りんご"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【りんご】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="りんご"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"HPを10回復する"}]}
#
#
#
execute as @e[type=item,tag=!did] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":" \n-------------------------------------------"}]}
execute as @e[type=item,tag=!did] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":" \n§6---------------------------------------"}]}
execute as @e[type=item,tag=!using] at @s at @p run tp @s ~~1~
execute as @e[type=item,tag=!did] at @s run tag @s add did