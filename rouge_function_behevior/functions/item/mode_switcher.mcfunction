execute as @p as @s[tag=admin] run execute as @s[m=creative] run tag @s add switch_to_s
execute as @p as @s[tag=admin] run execute as @s[m=survival] run tag @s add switch_to_a
execute as @p as @s[tag=admin] run execute as @s[m=adventure] run tag @s add switch_to_c
execute as @p as @s[tag=admin] run execute as @s[tag=switch_to_a] run gamemode a @s
execute as @p as @s[tag=admin] run execute as @s[tag=switch_to_a] run say @s "スイッチャー:アドベンチャーに変更しました。"
execute as @p as @s[tag=admin] run execute as @s[tag=switch_to_s] run gamemode s @s
execute as @p as @s[tag=admin] run execute as @s[tag=switch_to_s] run say @s "スイッチャー:サバイバルに変更しました。"
execute as @p as @s[tag=admin] run execute as @s[tag=switch_to_c] run gamemode c @s
execute as @p as @s[tag=admin] run execute as @s[tag=switch_to_c] run say @s "スイッチャー:クリエイティブに変更しました。"
execute as @p as @s[tag=admin] run tag @s remove switch_to_s
execute as @p as @s[tag=admin] run tag @s remove switch_to_a
execute as @p as @s[tag=admin] run tag @s remove switch_to_c
execute as @p as @s[tag=!admin] run say "スイッチャー:権限がありません。"