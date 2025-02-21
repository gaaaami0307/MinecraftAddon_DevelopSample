#death_timer...秒数
scoreboard players add @s death_timer 1
#
# 初期化
#
#ID=E_tdp
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @s add E_tdp
#場所調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run spreadplayers ~ ~ 1 1 @s
#高さ調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp @s ~~100~
#設置時効果音 pitch/audio
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run playsound close.fence_gate @a ~~~ 1.7 0.8
#設置時パーティクル
execute as @s[scores={death_timer=1}] at @s positioned ~~-100~ run particle minecraft:wind_charged_emitter ~~~
#起爆時間初期化
execute as @s[scores={death_timer=1}] at @s run scoreboard players set @s arg1 0
#
# 動作
#
#速度
execute as @s at @s run tp @s ^^^
#踏まれる前パーティクル
execute as @s as @s[tag=!E_tdp_steped,scores={arg1=0}] at @s positioned ~~-100~ run particle minecraft:falling_dust_top_snow_particle ~~~
#踏まれた判定--E_tdp_steped(これに付く) -1.2~1.8 -1.8~1.2 => -1.2~1.2
execute as @s as @s[tag=!E_tdp_steped,scores={arg1=0}] at @s positioned ~~-100~ as @e[family=!inanimate,type=!item,x=~-1.2,y=~-0.3,z=~-1.2,dx=2,dy=0,dz=2] if entity @s[x=~-1.8,y=~-0.7,z=~-1.8,dx=2,dy=0,dz=2] run tag @e[y=~100,c=1,r=5,tag=E_tdp] add E_tdp_steped
#踏み判定--E_tdp_step(踏んだ人に付く) -1.2~1.8 -1.8~1.2 => -1.2~1.2
execute as @s as @s[tag=E_tdp_steped,scores={arg1=0}] at @s positioned ~~-100~ as @e[family=!inanimate,type=!item,c=1] run tag @s add E_tdp_step
#踏みエフェクト
execute as @s as @s[tag=E_tdp_steped,scores={arg1=0}] at @s positioned ~~-100~ run effect @e[c=1,tag=E_tdp_step] slowness 1 1
#踏まれたパーティクル
execute as @s as @s[tag=E_tdp_steped,scores={arg1=0}] at @s positioned ~~-100~ run particle rouge:ice_bomb ~~~
#踏まれた効果音
execute as @s as @s[tag=E_tdp_steped,scores={arg1=0}] at @s positioned ~~-100~ run playsound random.anvil_land @a ~~~ 1.7 0.2
#踏まれた際に生存時間リセット
execute as @s as @s[tag=E_tdp_steped,scores={arg1=0}] at @s positioned ~~-100~ run scoreboard players set @s death_timer 0
#秒数カウント--{arg1}(これに付く)
execute as @s as @s[tag=E_tdp_steped] at @s positioned ~~-100~ run scoreboard players add @s arg1 1
#起爆判定--E_tdp_bombed(これに付く)
execute as @s as @s[scores={arg1=20..}] at @s positioned ~~-100~ run tag @s add E_tdp_bombed
#被爆判定--E_tdp_bomb(人に付く)
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run tag @e[family=!inanimate,type=!item,r=3] add E_tdp_bomb
#起爆時に踏み判定を消す
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run tag @e[c=1,tag=E_tdp_step] remove E_tdp_step
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run tag @s remove E_tdp_steped
#起爆時パーティクル
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run particle rouge:ice_explode ~~~
#起爆時効果音 pitch/audio
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run playsound random.explode @a ~~~ 1.0 0.8
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run playsound item.trident.thunder @a ~~~ 2.0 0.2
#起爆時消滅
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run scoreboard players set @s death_timer 1000000
#起爆時ダメージ*最後に持ってくること*
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run damage @e[tag=E_tdp_bomb,r=8] 5 entity_attack entity @s
#起爆時エフェクト
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run effect @e[tag=E_tdp_bomb,r=8] slowness 5 4
#起爆時処理終了
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run tag @e[tag=E_tdp_bomb,r=8] remove E_tdp_bomb
execute as @s as @s[tag=E_tdp_bombed] at @s positioned ~~-100~ run tag @s remove E_tdp_bombed
#時間制限消滅
execute as @s[scores={death_timer=401..}] at @s run kill @s