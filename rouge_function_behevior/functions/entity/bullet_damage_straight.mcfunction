#death_timer...秒数
scoreboard players add @s death_timer 1
#
# 初期化
#
#ID=E_bds
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @s add E_bds
#発射元ターゲット
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @e[c=1,family=!inanimate,type=!item,tag=!E_bds] add E_bds_settinger
#初期位置
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run execute as @e[tag=E_bds_settinger,c=1] at @s positioned ^^^-30 run tp @e[tag=E_bds,c=1] ~~~ facing @e[tag=E_bds_settinger,c=1]
#発射位置
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp ^^^30.5
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @e[tag=E_bds_settinger,c=1] remove E_bds_settinger
#高さ調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp @s ~~100.5~
#発射時効果音 pitch/audio
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run playsound mob.breeze.jump @a ~~~ 1.5 0.8
#発射時パーティクル
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run particle minecraft:wind_charged_emitter ~~~
#
# 動作
#
#速度
execute as @s at @s run tp @s ^^^0.5
#パーティクル
execute as @s at @s positioned ~~-100~ run particle minecraft:explosion_particle ~~~
#当たり判定--E_bds_hitter
execute as @s at @s positioned ~~-100~ as @e[family=!inanimate,type=!item,x=~-0.3,y=~-0.3,z=~-0.3,dx=0,dy=0,dz=0] if entity @s[x=~-0.7,y=~-0.7,z=~-0.7,dx=0,dy=0,dz=0] run tag @s add E_bds_hitter
#ヒット時効果音 pitch/audio
execute as @s at @s positioned ~~-100~ as @e[tag=E_bds_hitter] at @s run playsound mob.breeze.death @a ~~~ 1.0 0.8
#ヒット時パーティクル
execute as @s at @s positioned ~~-100~ as @e[tag=E_bds_hitter] at @s run particle minecraft:wind_explosion_emitter ~~1~
#ヒット時消滅
execute as @s at @s positioned ~~-100~ if entity @e[tag=E_bds_hitter] run scoreboard players set @s death_timer 1000000
#ヒット時ダメージ*最後に持ってくること*
execute as @s at @s positioned ~~-100~ as @e[tag=E_bds_hitter] run damage @s 5 entity_attack entity @p
#ヒット時エフェクト
#execute as @s at @s positioned ~~-100~ as @e[tag=E_bds_hitter] run effect @s levitation 1 20 true
#ヒット時処理終了
execute as @s at @s positioned ~~-100~ as @e[tag=E_bds_hitter] run tag @s remove E_bds_hitter
#時間制限消滅
execute as @s[scores={death_timer=33..}] at @s run kill @s