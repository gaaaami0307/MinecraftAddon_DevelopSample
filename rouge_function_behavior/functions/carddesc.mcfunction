execute as @e[type=item,tag=!judshift] at @s as @p if entity @s[tag=t:sneaking] run tag @e[type=item,tag=!judshift,c=1,r=1] add using
execute as @e[type=item,tag=!judshift] at @s run tag @s add judshift
execute as @e[type=item,tag=!did] as @s[tag=using] at @s run playsound note.bell @a ~~~ 1 1
execute as @e[type=item,tag=!did] as @s[tag=!using] at @s run playsound note.bass @p ~~~ 1 1
execute as @e[type=item,tag=!did] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"------------------説明-----------------\n "}]}
execute as @e[type=item,tag=!did] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"§6---------------------------------------\n "}]}
#
#
#
execute as @e[type=item,tag=!did,name="カマキリ"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【カマキリ】"}]}
execute as @e[type=item,tag=!did,name="カマキリ"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"HPを3回復"}]}
execute as @e[type=item,tag=!did,name="カマキリ"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【カマキリ】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="カマキリ"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"HPを3回復"}]}
execute as @e[type=item,tag=!did,name="リンゴ"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【リンゴ】"}]}
execute as @e[type=item,tag=!did,name="リンゴ"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"HPを5回復"}]}
execute as @e[type=item,tag=!did,name="リンゴ"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【リンゴ】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="リンゴ"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"HPを5回復"}]}
execute as @e[type=item,tag=!did,name="ゴリラ"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【ゴリラ】"}]}
execute as @e[type=item,tag=!did,name="ゴリラ"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"HPを7回復"}]}
execute as @e[type=item,tag=!did,name="ゴリラ"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【ゴリラ】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="ゴリラ"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"HPを7回復"}]}
execute as @e[type=item,tag=!did,name="錆びた剣（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【錆びた剣（無）】"}]}
execute as @e[type=item,tag=!did,name="錆びた剣（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"2ダメージ"}]}
execute as @e[type=item,tag=!did,name="錆びた剣（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【錆びた剣（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="錆びた剣（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"2ダメージ"}]}
execute as @e[type=item,tag=!did,name="普通の剣（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【普通の剣（無）】"}]}
execute as @e[type=item,tag=!did,name="普通の剣（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"4ダメージ"}]}
execute as @e[type=item,tag=!did,name="普通の剣（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【普通の剣（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="普通の剣（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"4ダメージ"}]}
execute as @e[type=item,tag=!did,name="強固な剣（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【強固な剣（無）】"}]}
execute as @e[type=item,tag=!did,name="強固な剣（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"6ダメージ"}]}
execute as @e[type=item,tag=!did,name="強固な剣（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【強固な剣（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="強固な剣（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"6ダメージ"}]}
execute as @e[type=item,tag=!did,name="錆びた盾（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【錆びた盾（無）】"}]}
execute as @e[type=item,tag=!did,name="錆びた盾（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"防御2"}]}
execute as @e[type=item,tag=!did,name="錆びた盾（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【錆びた盾（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="錆びた盾（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"防御2"}]}
execute as @e[type=item,tag=!did,name="普通の盾（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【普通の盾（無）】"}]}
execute as @e[type=item,tag=!did,name="普通の盾（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"防御4"}]}
execute as @e[type=item,tag=!did,name="普通の盾（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【普通の盾（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="普通の盾（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"防御4"}]}
execute as @e[type=item,tag=!did,name="強固な盾（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【強固な盾（無）】"}]}
execute as @e[type=item,tag=!did,name="強固な盾（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"防御6"}]}
execute as @e[type=item,tag=!did,name="強固な盾（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【強固な盾（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="強固な盾（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"防御6"}]}
execute as @e[type=item,tag=!did,name="魔法の種（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【魔法の種（魔）】"}]}
execute as @e[type=item,tag=!did,name="魔法の種（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"魔法3ダメージ"}]}
execute as @e[type=item,tag=!did,name="魔法の種（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【魔法の種（魔）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="魔法の種（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"魔法3ダメージ"}]}
execute as @e[type=item,tag=!did,name="魔法の本（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【魔法の本（魔）】"}]}
execute as @e[type=item,tag=!did,name="魔法の本（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"魔法5ダメージ"}]}
execute as @e[type=item,tag=!did,name="魔法の本（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【魔法の本（魔）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="魔法の本（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"魔法5ダメージ"}]}
execute as @e[type=item,tag=!did,name="魔法の杖（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【魔法の杖（魔）】"}]}
execute as @e[type=item,tag=!did,name="魔法の杖（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"魔法7ダメージ"}]}
execute as @e[type=item,tag=!did,name="魔法の杖（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【魔法の杖（魔）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="魔法の杖（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"魔法7ダメージ"}]}
execute as @e[type=item,tag=!did,name="魔法の盾（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【魔法の盾（魔）】"}]}
execute as @e[type=item,tag=!did,name="魔法の盾（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"魔法防御3"}]}
execute as @e[type=item,tag=!did,name="魔法の盾（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【魔法の盾（魔）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="魔法の盾（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"魔法防御3"}]}
execute as @e[type=item,tag=!did,name="魔法の結界（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【魔法の結界（魔）】"}]}
execute as @e[type=item,tag=!did,name="魔法の結界（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"魔法防御7"}]}
execute as @e[type=item,tag=!did,name="魔法の結界（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【魔法の結界（魔）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="魔法の結界（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"魔法防御7"}]}
execute as @e[type=item,tag=!did,name="筋力増加（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【筋力増加（無）】"}]}
execute as @e[type=item,tag=!did,name="筋力増加（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"無属性攻撃プラス3ダメージ"}]}
execute as @e[type=item,tag=!did,name="筋力増加（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【筋力増加（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="筋力増加（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"無属性攻撃プラス3ダメージ"}]}
execute as @e[type=item,tag=!did,name="魔力増加（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【魔力増加（魔）】"}]}
execute as @e[type=item,tag=!did,name="魔力増加（魔）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"魔法攻撃プラス3ダメージ"}]}
execute as @e[type=item,tag=!did,name="魔力増加（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【魔力増加（魔）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="魔力増加（魔）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"魔法攻撃プラス3ダメージ"}]}
execute as @e[type=item,tag=!did,name="炎陣（特）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【炎陣（特）】"}]}
execute as @e[type=item,tag=!did,name="炎陣（特）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"特殊4ダメージ、次の無属性の攻撃にプラス3ダメージ（次ターンのみ）"}]}
execute as @e[type=item,tag=!did,name="炎陣（特）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【炎陣（特）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="炎陣（特）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"特殊4ダメージ、次の無属性の攻撃にプラス3ダメージ（次ターンのみ）"}]}
execute as @e[type=item,tag=!did,name="水鋼（特）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【水鋼（特）】"}]}
execute as @e[type=item,tag=!did,name="水鋼（特）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"特殊4ダメージ、次の無属性の防御プラス3（次ターンのみ）"}]}
execute as @e[type=item,tag=!did,name="水鋼（特）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【水鋼（特）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="水鋼（特）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"特殊4ダメージ、次の無属性の防御プラス3（次ターンのみ）"}]}
execute as @e[type=item,tag=!did,name="命の恵み（特）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【命の恵み（特）】"}]}
execute as @e[type=item,tag=!did,name="命の恵み（特）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"自分に特殊4ダメージ、次のターンHPを8回復"}]}
execute as @e[type=item,tag=!did,name="命の恵み（特）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【命の恵み（特）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="命の恵み（特）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"自分に特殊4ダメージ、次のターンHPを8回復"}]}
execute as @e[type=item,tag=!did,name="勇者の剣（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【勇者の剣（無）】"}]}
execute as @e[type=item,tag=!did,name="勇者の剣（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"10ダメージ"}]}
execute as @e[type=item,tag=!did,name="勇者の剣（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【勇者の剣（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="勇者の剣（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"10ダメージ"}]}
execute as @e[type=item,tag=!did,name="勇者の盾（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【勇者の盾（無）】"}]}
execute as @e[type=item,tag=!did,name="勇者の盾（無）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"防御10"}]}
execute as @e[type=item,tag=!did,name="勇者の盾（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【勇者の盾（無）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="勇者の盾（無）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"防御10"}]}
execute as @e[type=item,tag=!did,name="エナジー（物）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【エナジー（物）】"}]}
execute as @e[type=item,tag=!did,name="エナジー（物）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"自分に2ダメージ、相手に1ダメージ、極エナジーが1溜まる"}]}
execute as @e[type=item,tag=!did,name="エナジー（物）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【エナジー（物）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="エナジー（物）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"自分に2ダメージ、相手に1ダメージ、極エナジーが1溜まる"}]}
execute as @e[type=item,tag=!did,name="リセットボタン（極5）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【リセットボタン（極5）】"}]}
execute as @e[type=item,tag=!did,name="リセットボタン（極5）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"HPを全回復する"}]}
execute as @e[type=item,tag=!did,name="リセットボタン（極5）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【リセットボタン（極5）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="リセットボタン（極5）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"HPを全回復する"}]}
execute as @e[type=item,tag=!did,name="絶対安全装置（極5）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"【絶対安全装置（極5）】"}]}
execute as @e[type=item,tag=!did,name="絶対安全装置（極5）"] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":"どんな攻撃でも無効化する"}]}
execute as @e[type=item,tag=!did,name="絶対安全装置（極5）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"【絶対安全装置（極5）】=> §6使用！"}]}
execute as @e[type=item,tag=!did,name="絶対安全装置（極5）"] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":"どんな攻撃でも無効化する"}]}
#
#
#
execute as @e[type=item,tag=!did] as @s[tag=!using] at @s run tellraw @p {"rawtext":[{"text":" \n-------------------------------------------"}]}
execute as @e[type=item,tag=!did] as @s[tag=using] at @s run tellraw @a {"rawtext":[{"text":" \n§6---------------------------------------"}]}
execute as @e[type=item,tag=!using] at @s at @p run tp @s ~~1~
execute as @e[type=item,tag=!did] at @s run tag @s add did