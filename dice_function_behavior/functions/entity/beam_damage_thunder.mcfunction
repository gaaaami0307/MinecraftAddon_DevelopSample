#death_timer...再帰回数
scoreboard players add @s death_timer 1
#
# 初期化
#
#ID=E_bedth
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @s add E_bedth
#発射元ターゲット
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @e[c=1,family=!inanimate,type=!item,tag=!E_bedth] add E_bedth_settinger
#初期位置
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run execute as @e[tag=E_bedth_settinger,c=1] at @s positioned ^^^-30 run tp @e[tag=E_bedth,c=1] ~~~ facing @e[tag=E_bedth_settinger,c=1]
#発射位置
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp ^^^30.5
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @e[tag=E_bedth_settinger,c=1] remove E_bedth_settinger
#高さ調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp @s ~~100.5~
#発射時効果音 audio/pitch
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run playsound firework.blast @a ~~~ 1.0 1.0
#発射時パーティクル
#execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run particle minecraft:wind_charged_emitter ~~~
#
# 動作
#
#移動
execute as @s at @s positioned ~~~ run tp @s ^^^0.5
#移動方向を決める
execute as @s at @s positioned ~~~ run scoreboard players random @s arg1 1 5
#右
execute as @s[scores={arg1=1}] at @s positioned ~~~ run tp @s ^0.5^^
#左
execute as @s[scores={arg1=2}] at @s positioned ~~~ run tp @s ^-0.5^^
#上
execute as @s[scores={arg1=3}] at @s positioned ~~~ run tp @s ^^0.2^
#下
execute as @s[scores={arg1=4}] at @s positioned ~~~ run tp @s ^^-0.2^
#パーティクル
execute as @s at @s positioned ~~-100~ run particle rouge:thunder ~~~
#当たり判定--E_bedth_hitter
execute as @s at @s positioned ~~-100~ as @e[family=!inanimate,type=!item,x=~-0.3,y=~-0.3,z=~-0.3,dx=0,dy=0,dz=0] if entity @s[x=~-0.7,y=~-0.7,z=~-0.7,dx=0,dy=0,dz=0] run tag @s add E_bedth_hitter
#ヒット時効果音 audio/pitch
execute as @s at @s positioned ~~-100~ as @e[tag=E_bedth_hitter] at @s run playsound firework.twinkle @a ~~~ 1.5 1.0
#ヒット時パーティクル
execute as @s at @s positioned ~~-100~ as @e[tag=E_bedth_hitter] at @s run particle rouge:thunder_bomb ~~1~
#ヒット時消滅
#execute as @s at @s positioned ~~-100~ if entity @e[tag=E_bedth_hitter] run scoreboard players set @s death_timer 1000000
#ヒット時ダメージ*最後に持ってくること*
execute as @s at @s positioned ~~-100~ as @e[tag=E_bedth_hitter] run damage @s 12 entity_attack entity @p
#ヒット処理終了
execute as @s at @s positioned ~~-100~ as @e[tag=E_bedth_hitter] run tag @s remove E_bedth_hitter
#回数制限消滅
execute as @s[scores={death_timer=20..}] at @s run kill @s
#再帰
execute as @s[scores={death_timer=..19}] at @s run function entity/beam_damage_thunder