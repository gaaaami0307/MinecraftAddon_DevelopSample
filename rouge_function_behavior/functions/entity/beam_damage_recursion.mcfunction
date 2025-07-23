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
#set ID
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run scoreboard players operation @s UUID = @e[tag=E_bedr_settinger,c=1] UUID
#発射位置
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp ^^^30.5
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @e[tag=E_bedr_settinger,c=1] remove E_bedr_settinger
#高さ調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp @s ~~101.5~
#発射時効果音 audio/pitch
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run playsound mob.breeze.jump @a ~~~ 1.5 0.8
#発射時パーティクル
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run particle minecraft:wind_charged_emitter ~~~
#
# 動作
#
#移動
execute as @s at @s positioned ~~~ run tp @s ^^^0.5 true
execute as @s at @s positioned ~~-100~ unless block ~~~ air run kill @s
#パーティクル
execute as @s at @s positioned ~~-100~ run particle minecraft:balloon_gas_particle ~~~
#当たり判定--E_bedr_hitter
execute as @s at @s positioned ~~-100~ as @e[family=!inanimate,type=!item,x=~-0.3,y=~-0.3,z=~-0.3,dx=0,dy=0,dz=0] if entity @s[x=~-0.7,y=~-0.7,z=~-0.7,dx=0,dy=0,dz=0] positioned ~~100~ unless score @e[tag=E_bedr,c=1] UUID = @s UUID run tag @s add E_bedr_hitter
#ヒット時効果音 audio/pitch
execute as @s at @s positioned ~~-100~ as @e[tag=E_bedr_hitter] at @s run playsound mob.breeze.shoot @a ~~~ 1.0 2.0
#ヒット時パーティクル
execute as @s at @s positioned ~~-100~ as @e[tag=E_bedr_hitter] at @s run particle minecraft:critical_hit_emitter ~~1~
#ヒット時消滅
#execute as @s at @s positioned ~~-100~ if entity @e[tag=E_bedr_hitter] run scoreboard players set @s death_timer 1000000
#ヒット時ダメージ*最後に持ってくること*
execute as @s at @s positioned ~~~ as @e[tag=!E_bedr,family=!inanimate,type=!item] if score @s UUID = @e[tag=E_bedr,c=1] UUID run damage @e[tag=E_bedr_hitter] 2 entity_attack entity @s
#ヒット処理終了
execute as @s at @s positioned ~~-100~ as @e[tag=E_bedr_hitter] run tag @s remove E_bedr_hitter
#回数制限消滅
execute as @s[scores={death_timer=200..}] at @s run kill @s
#再帰
execute as @e[tag=E_bedr,c=1,scores={death_timer=..199}] at @s run function entity/beam_damage_recursion