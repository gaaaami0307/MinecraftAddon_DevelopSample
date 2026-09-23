#death_timer...秒数
scoreboard players add @s death_timer 1
#
# 初期化
#
#ID=E_spspsty
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tag @s add E_spspsty
#高さ調整
execute as @s[scores={death_timer=1}] at @s positioned ~~~ run tp @s ~~100.5~
#
# 動作
#
#arg1=個数
#arg2=召喚ティック
execute as @s at @s positioned ~~~ run scoreboard players add @s arg2 1
#召喚リキャスト
execute as @s[scores={arg2=1..}] at @s positioned ~~~ run tag @s add E_spspsty_fire
#召喚
execute as @s[tag=E_spspsty_fire] at @s positioned ~~~ run summon rouge:beam_damage_rain ~ ~3 ~
#召喚個数追加
execute as @s[tag=E_spspsty_fire] at @s positioned ~~~ run scoreboard players add @s arg1 1
#召喚したものにターゲットタグをつける
execute as @s[tag=E_spspsty_fire] at @s positioned ~~3~ run tag @e[c=1,r=0.02] add E_spspsty_target
#散布 対象同士の最小距離、半径、ターゲット
execute as @s[tag=E_spspsty_fire] at @s positioned ~~3~ run spreadplayers ~ ~ 1 12 @e[tag=E_spspsty_target]
#ターゲットの高度をさげる
execute as @s[tag=E_spspsty_fire] at @s positioned ~~~ run execute as @e[tag=E_spspsty_target] at @s run tp @s ~~-1~
#ターゲットタグを削除
execute as @s[tag=E_spspsty_fire] at @s positioned ~~~ run tag @e[tag=E_spspsty_target] remove E_spspsty_target 
#リキャストをリセット
execute as @s[tag=E_spspsty_fire] at @s positioned ~~~ run scoreboard players set @s arg2 0
#召喚タグを削除
execute as @s[tag=E_spspsty_fire] at @s positioned ~~~ run tag @s remove E_spspsty_fire 
#個数制限消滅
execute as @s[scores={arg1=120..}] at @s run kill @s
#時間制限消滅
execute as @s[scores={death_timer=150..}] at @s run kill @s