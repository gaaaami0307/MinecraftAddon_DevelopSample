#death_timer...待機時間
#arg1...再帰回数
scoreboard players add @s death_timer 1
#
# 初期化
#
#ID=E_bedra
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @s add E_bedra
#場所調整
#execute as @s[scores={death_timer=1}] at @s positioned ~~~ run spreadplayers ~ ~ 2 1 @s
#高さ調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp @s ~~100.5~
#再帰回数を0に設定
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run scoreboard players set @s arg1 0
#設置時効果音 audio/pitch
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run playsound random.anvil_land @a ~~~ 0.5 1.5
#
# 動作-待機
#
#待機時間
execute as @s[scores={death_timer=21},tag=!E_bedra_shot] at @s positioned ~~-100~ run tag @s add E_bedra_shot
#一度起動したら全ての同じものが起動する
#execute as @s[scores={arg1=0},tag=E_bedra_shot] at @s positioned ~~-100~ run tag @e[tag=E_bedra] add E_bedra_shot
#待機時パーティクル
execute as @s[tag=!E_bedra_shot] at @s positioned ~~-100~ run particle rouge:danger ~~~
#
# 初期化-発射
#
#発射時効果音 audio/pitch
execute as @s[scores={arg1=0},tag=E_bedra_shot] at @s positioned ~~-100~ run playsound mob.shulker.shoot @a ~~~ 1 1.5
#高さを設定
execute as @s[scores={arg1=0},tag=E_bedra_shot] at @s positioned ~~~ run tp @s ~~30~
#
# 動作-発射
#
#再帰回数加算
execute as @s[tag=E_bedra_shot] at @s positioned ~~-100~ run scoreboard players add @s arg1 1
#移動
execute as @s[tag=E_bedra_shot] at @s positioned ~~~ run tp @s ~~-0.5~
#ブロックで止まる移動(動作しない)
#execute as @s[tag=E_bedra_shot] at @s positioned ~~~ run tp @s ~~-0.5~ true
#パーティクル
execute as @s[tag=E_bedra_shot] at @s positioned ~~-100~ run particle rouge:laser ~~~
#当たり判定--E_bedra_hitter
execute as @s[tag=E_bedra_shot] at @s positioned ~~-100~ as @e[family=!inanimate,type=!item,x=~-0.3,y=~-0.3,z=~-0.3,dx=0,dy=0,dz=0] if entity @s[x=~-0.7,y=~-0.7,z=~-0.7,dx=0,dy=0,dz=0] run tag @s add E_bedra_hitter
#ヒット時効果音 audio/pitch
#execute as @s[tag=E_bedra_shot] at @s positioned ~~-100~ as @e[tag=E_bedra_hitter] at @s run playsound mob.breeze.shoot @a ~~~ 1.0 2.0
#ヒット時パーティクル
#execute as @s[tag=E_bedra_shot] at @s positioned ~~-100~ as @e[tag=E_bedra_hitter] at @s run particle minecraft:critical_hit_emitter ~~1~
#ヒット時消滅
#execute as @s at @s positioned ~~-100~ if entity @e[tag=E_bedra_hitter] run scoreboard players set @s death_timer 1000000
#ヒット時ダメージ*最後に持ってくること*
execute as @s[tag=E_bedra_shot] at @s positioned ~~-100~ as @e[tag=E_bedra_hitter] run damage @s 7 entity_attack entity @p
#ヒット処理終了
execute as @s[tag=E_bedra_shot] at @s positioned ~~-100~ as @e[tag=E_bedra_hitter] run tag @s remove E_bedra_hitter
#回数制限消滅
execute as @s[scores={arg1=60..},tag=E_bedra_shot] at @s run kill @s
#再帰
execute as @s[scores={arg1=..59},tag=E_bedra_shot] at @s run function entity/beam_damage_rain