execute as @a[r=30] at @s run titleraw @s actionbar { "rawtext":[{"text":"順位："},{"score":{"name":"@s","objective":"point"}},{"text":"位 獲得ポイント："},{"score":{"name":"@s","objective":"point"}}]}
function roll/par_roll
effect @s slow_falling