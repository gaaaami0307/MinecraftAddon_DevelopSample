#death_timer...秒数
scoreboard players add @s death_timer 1
#
# 初期化
#
#ID=E_tdp
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @s add E_tdp
#高さ調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp @s ~~100~
#設置時効果音 pitch/audio
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run playsound mob.breeze.jump @a ~~~ 1.5 0.8
#設置時パーティクル
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run particle minecraft:wind_charged_emitter ~~~
#
# 動作
#
#速度
execute as @s at @s run tp @s ^^^
#パーティクル
execute as @s at @s positioned ~~-100~ run particle minecraft:explosion_particle ~~~
#踏み判定--E_tdp_step -1.2~1.8 -1.8~1.2 => -1.2~1.2
execute as @s at @s positioned ~~-100~ as @e[family=!inanimate,type=!item,x=~-1.2,y=~-0.3,z=~-1.2,dx=2,dy=0,dz=2] if entity @s[x=~-1.8,y=~-0.7,z=~-1.8,dx=2,dy=0,dz=2] run tag @s add E_tdp_step
#ヒット時効果音 pitch/audio
execute as @s at @s positioned ~~-100~ as @e[tag=E_tdp_hitter] at @s run playsound mob.breeze.death @a ~~~ 1.0 0.8
#ヒット時パーティクル
execute as @s at @s positioned ~~-100~ as @e[tag=E_tdp_hitter] at @s run particle minecraft:wind_explosion_emitter ~~1~
#ヒット時消滅
execute as @s at @s positioned ~~-100~ if entity @e[tag=E_tdp_hitter] run scoreboard players set @s death_timer 1000000
#ヒット時ダメージ*最後に持ってくること*
execute as @s at @s positioned ~~-100~ as @e[tag=E_tdp_hitter] run damage @s 5 entity_attack entity @p
#ヒット時エフェクト
#execute as @s at @s positioned ~~-100~ as @e[tag=E_tdp_hitter] run effect @s levitation 1 20 true
#ヒット時処理終了
execute as @s at @s positioned ~~-100~ as @e[tag=E_tdp_hitter] run tag @s remove E_tdp_hitter
#時間制限消滅
execute as @s[scores={death_timer=33..}] at @s run kill @s