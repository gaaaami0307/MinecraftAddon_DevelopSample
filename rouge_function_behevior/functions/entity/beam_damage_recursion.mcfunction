#death_timer...再帰回数
scoreboard players add @s death_timer 1
#
# 初期化
#
#ID=E_bedr
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @s add E_bedr
#発射元ターゲット
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @e[c=1,family=!inanimate,type=!item,tag=!E_bedr] add E_bedr_settinger
#初期位置
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run execute as @e[tag=E_bedr_settinger,c=1] at @s positioned ^^^-30 run tp @e[tag=E_bedr,c=1] ~~~ facing @e[tag=E_bedr_settinger,c=1]
#発射位置
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp ^^^30.5
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @e[tag=E_bedr_settinger,c=1] remove E_bedr_settinger
#高さ調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp @s ~~100.5~
#発射時効果音 pitch/audio
#execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run playsound mob.breeze.jump @a ~~~ 1.5 0.8
#発射時パーティクル
#execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run particle minecraft:wind_charged_emitter ~~~
#
# 動作
#
#ダイヤを1個入手
execute as @s at @s positioned ~~-100~ run give @p minecraft:diamond 1 0
#回数制限消滅
execute as @s[scores={death_timer=10..}] at @s run kill @s
#再帰
execute as @s at @s run function entity/beam_damage_recursion