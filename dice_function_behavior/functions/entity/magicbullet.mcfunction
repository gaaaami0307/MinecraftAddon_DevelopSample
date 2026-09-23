scoreboard players add @s death_timer 1
execute as @s at @s run tp @s ^^^0.5
execute as @s at @s positioned ~~-10~ run particle minecraft:balloon_gas_particle ~~~
execute as @s[tag=mc_penetration] at @s positioned ~~-10~ run particle gami:penetration ~~~
execute as @s at @s positioned ~~-10~ as @e[family=mob,type=!player,x=~-0.3,y=~-0.3,z=~-0.3,dx=0,dy=0,dz=0] if entity @s[x=~-0.7,y=~-0.7,z=~-0.7,dx=0,dy=0,dz=0] run damage @s 6 entity_attack entity @p
execute as @s at @s positioned ~~-10~ as @e[family=mob,type=!player,x=~-0.3,y=~-0.3,z=~-0.3,dx=0,dy=0,dz=0] if entity @e[x=~-0.7,y=~-0.7,z=~-0.7,dx=0,dy=0,dz=0] run playsound use.chain @a ~~~ 1 1.2
execute as @s at @s positioned ~~-10~ as @e[family=mob,type=!player,x=~-0.3,y=~-0.3,z=~-0.3,dx=0,dy=0,dz=0] if entity @e[x=~-0.7,y=~-0.7,z=~-0.7,dx=0,dy=0,dz=0] run particle minecraft:critical_hit_emitter ~~1~
execute as @s[tag=!mc_penetration] at @s positioned ~~-10~ as @e[family=mob,type=!player,x=~-0.3,y=~-0.3,z=~-0.3,dx=0,dy=0,dz=0] if entity @e[x=~-0.7,y=~-0.7,z=~-0.7,dx=0,dy=0,dz=0] positioned ~~10~ run kill @e[c=1,type=rouge:magicbullet]
execute as @s[scores={death_timer=31}] at @s run tp @s ~~200~
execute as @s[scores={death_timer=33..}] at @s run kill @s