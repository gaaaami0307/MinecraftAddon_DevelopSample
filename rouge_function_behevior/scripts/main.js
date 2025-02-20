import * as server from '@minecraft/server';

function lack_mp_msg(pl,id){
    pl.runCommandAsync("execute as @s at @s run playsound random.pop2 @a ~~~ 0.5 0.9");
    pl.runCommandAsync("execute as @s at @s positioned ^^^0.5 run particle minecraft:white_smoke_particle ~~1.5~");
    pl.runCommandAsync("tellraw @s {\"rawtext\":[{\"text\":\"§cMP不足\"}]}");
    pl.startItemCooldown(id,5);
}

function lack_hp_msg(pl,id){
    pl.runCommandAsync("execute as @s at @s run playsound random.pop2 @a ~~~ 0.5 0.9");
    pl.runCommandAsync("execute as @s at @s positioned ^^^0.5 run particle minecraft:white_smoke_particle ~~1.5~");
    pl.runCommandAsync("tellraw @s {\"rawtext\":[{\"text\":\"§cHP不足\"}]}");
    pl.startItemCooldown(id,5);
}

function limit_weapon_msg(pl,id){
    pl.runCommandAsync("execute as @s at @s run playsound random.pop2 @a ~~~ 0.5 0.9");
    pl.runCommandAsync("execute as @s at @s positioned ^^^0.5 run particle minecraft:white_smoke_particle ~~1.5~");
    pl.runCommandAsync("tellraw @s {\"rawtext\":[{\"text\":\"§c武器所持数制限\nインベントリ内の武器を5個以下にしてください\"}]}");
    pl.startItemCooldown(id,5);
}

const RankList=["§6B","§2A","§dS","§eUNIQUE"];

//Example
class Example{
    cooldown = [0,0]
    mp=[0,0];
    SID = "weapon_checker";
    ID="rouge:"+this.SID;
    Name="ウェポンチェッカー";
    Rank=RankList[3];
    weapon=false;

    lore_item="武器の性能を確認できるという異質な武器。\nこの武器の所持・使用には所持制限は適用されない。";
    lore_skillname="性能確認";
    lore_skilluse="オフハンドに武器を持って右クリック";
    lore_skilllim="なし";
    lore_skillinfo="オフハンドに持った武器の性能をチェックする。\n\nてか、このテキストを見てる時点でわかってるじゃないか！";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}


//ロングソード
class Long_Sword{
    cooldown = 3;
    mp=[3];
    SID = "long_sword"
    ID="rouge:"+this.SID;
    Name="ロングソード";
    Rank=RankList[0];
    lore="";
    weapon=true;

    lore_item="鉄製の長剣。使いやすく人気のある武器。";
    lore_skillname="大振り";
    lore_skilluse="右クリック";
    lore_skilllim="MP:"+this.mp[0];
    lore_skillinfo="武器を大きく振って前方の敵に攻撃する。\n射程は短い。";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                //mp制限
                if(pl.addLevels(0)>=this.mp[0]){
                    pl.runCommandAsync("execute as @s at @s run function item/"+this.SID);
                    pl.startItemCooldown(this.SID,this.cooldown*20);
                    pl.addLevels(-this.mp[0]);
                }
                else{
                    lack_mp_msg(pl,this.SID);
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }
}

//ふぁーすとわんど
class First_Wand{
    cooldown = 1.5;
    mp=[1];
    SID = "first_wand";
    ID="rouge:"+this.SID;
    Name="ふぁーすとわんど";
    Rank=RankList[0];
    weapon=true;

    lore_item="魔法使いを目指すものに最初に支給される杖。";
    lore_skillname="魔法";
    lore_skilluse="右クリック";
    lore_skilllim="MP:"+this.mp[0];
    lore_skillinfo="無属性の弾を発射し命中した敵1体にダメージを与える。";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                //mp制限
                if(pl.addLevels(0)>=this.mp[0]){
                    pl.runCommandAsync("execute as @s at @s run function item/"+this.SID);
                    pl.startItemCooldown(this.SID,this.cooldown*20);
                    pl.addLevels(-this.mp[0]);
                }
                else{
                    lack_mp_msg(pl,this.SID);
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }
}

//モードスイッチャー
class Mode_Switcher{
    cooldown = 1;
    mp=[0];
    SID = "mode_switcher";
    ID="rouge:"+this.SID;
    Name="モードスイッチャー";
    Rank=RankList[2];
    weapon=true;

    lore_item="高度な文明で作られた装置。使用者のゲームモードを変更する。";
    lore_skillname="転換";
    lore_skilluse="右クリック";
    lore_skilllim="権限:admin";
    lore_skillinfo="使用するたびにゲームモードを変更する。";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                //mp制限
                if(pl.addLevels(0)>=this.mp[0]){
                    pl.runCommandAsync("execute as @s at @s run function item/"+this.SID);
                    pl.startItemCooldown(this.SID,this.cooldown*20);
                    pl.addLevels(-this.mp[0]);
                }
                else{
                    lack_mp_msg(pl,this.SID);
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }
}

//エクスプロージョン
class Explosion_Wand{
    cooldown = 30;
    mp=[50];
    SID = "explosion_wand";
    ID="rouge:"+this.SID;
    Name="エクスプロージョン";
    Rank=RankList[2];
    weapon=true;

    lore_item="かつて高名な魔法使いが使っていたとされる杖。\n発動できる魔法はただ一つ、爆裂魔法のみ。";
    lore_skillname="爆裂魔法エクスプロージョン";
    lore_skilluse="右クリック";
    lore_skilllim="HP:20以上 MP:"+this.mp[0];
    lore_skillinfo="爆裂魔法を唱え、周囲の敵に§d100§rダメージを与える。\nしかし、使用の反動から19ダメージを負ってしまう。";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                //mp制限
                if(pl.addLevels(0)>=this.mp[0]){
                    const health = pl.getComponent("health");
                    if(health.currentValue>=20){
                    pl.runCommandAsync("execute as @s at @s run function item/"+this.SID);
                    pl.startItemCooldown(this.SID,this.cooldown*20);
                    pl.addLevels(-this.mp[0]);
                    //etc
                    pl.addEffect('slowness',10,{ amplifier: 2 });
                    }
                    else{
                        lack_hp_msg(pl,this.SID);
                    }
                }
                else{
                    lack_mp_msg(pl,this.SID);
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }
}

//ウェポンチェッカー(Unique)
class Weapon_Checker{
    cooldown = 1;
    mp=[0];
    SID = "weapon_checker";
    ID="rouge:"+this.SID;
    Name="ウェポンチェッカー";
    Rank=RankList[3];
    weapon=false;

    lore_item="武器の性能を確認できるという異質な武器。\nこの武器の所持・使用には所持制限は適用されない。";
    lore_skillname="性能確認";
    lore_skilluse="オフハンドに武器を持って右クリック";
    lore_skilllim="なし";
    lore_skillinfo="オフハンドに持った武器の性能をチェックする。\n\nてか、このテキストを見てる時点でわかってるじゃないか！";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //クールダウン
        if(pl.getItemCooldown(this.SID)==0){
            //mp制限
            if(pl.addLevels(0)>=this.mp[0]){
                pl.runCommandAsync("tag @s add check_weapon");
            }
            else{
                lack_mp_msg(pl,this.SID);
            }
        }
    }
}

//たいまつソード
class Torch_Sword{
    cooldown = [3,0]
    mp=[0,0];
    SID = "torch_sword";
    ID="rouge:"+this.SID;
    Name="たいまつソード";
    Rank=RankList[0];
    weapon=true;

    lore_item="★★武器説明★★";
    lore_skillname="点火";
    lore_skilluse="右クリック";
    lore_skilllim="自身が燃えている時";
    lore_skillinfo="自身の炎をたいまつソードに移し、たいまつソードを「点火」する。";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}

//炎のたいまつソード
class Fire_Torch_Sword{
    cooldown = [3,5]
    mp=[6,0];
    SID = "fire_torch_sword";
    ID="rouge:"+this.SID;
    Name="炎のたいまつソード";
    Rank=RankList[1];
    weapon=true;

    lore_item="★★武器説明★★";
    lore_skillname="放出";
    lore_skilluse="右クリック";
    lore_skilllim="MP 6";
    lore_skillinfo="炎のたいまつソードの炎を消費し、8ダメージの炎の弾を前方3方向に発射する。使用後、この武器は「消火」される";
    lore_skillname2="変転";
    lore_skilluse2="シフト右クリック";
    lore_skilllim2="特定の武器を所持 HP2";
    lore_skillinfo2="自身の魂をソウルブラスターで抽出して、たいまつソードに宿し、「魂炎のたいまつソード」に進化させる。魂の抽出により、2ダメージを受ける。";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}

//魂炎のたいまつソード
class Soul_Torch_Sword{
    cooldown = [3,3]
    mp=[12,15];
    SID = "soul_torch_sword";
    ID="rouge:"+this.SID;
    Name="魂炎のたいまつソード";
    Rank=RankList[2];
    weapon=true;

    lore_item="★★武器説明★★";
    lore_skillname="魂の放出";
    lore_skilluse="右クリック";
    lore_skilllim="MP 12";
    lore_skillinfo="魂炎のたいまつソードの魂を放出し、前方に15ダメージの魂の弾を放出する。この武器は「炎のたいまつソード」に戻る。";
    lore_skillname2="魂炎の放出";
    lore_skilluse2="シフト右クリック";
    lore_skilllim2="MP 15";
    lore_skillinfo2="魂炎のたいまつソードの魂炎を放出し、前方に15ダメージの魂炎の弾を3方向に放出する。この武器は「たいまつソード」に戻る。";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}

//ソウルブラスター
class Soul_Blaster{
    cooldown = [2,0]
    mp=[8,0];
    SID = "soul_blaster";
    ID="rouge:"+this.SID;
    Name="ソウルブラスター";
    Rank=RankList[1];
    weapon=true;

    lore_item="★★武器説明★★";
    lore_skillname="魂弾";
    lore_skilluse="右クリック";
    lore_skilllim="MP8 HP2";
    lore_skillinfo="自身の魂を抽出し、15ダメージの弾にして放つ。魂の抽出により、2ダメージ受ける。";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}

//緑化の斧
class Forest_Axe{
    cooldown = [8,0]
    mp=[8,0];
    SID = "forest_axe";
    ID="rouge:"+this.SID;
    Name="緑化の斧";
    Rank=RankList[1];
    weapon=true;

    lore_item="★★武器説明★★";
    lore_skillname="振り下ろし";
    lore_skilluse="右クリック";
    lore_skilllim="MP 8";
    lore_skillinfo="斧を思い切り振り下ろし、前方の敵に11ダメージを与える。範囲は2.5m5m 各点からr2.49ヒット時に50%の確率で「ツタ纏い」状態を与える";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}

//常緑の石
class Forest_Stone{
    cooldown = [60,0]
    mp=[10,0];
    SID = "forest_stone";
    ID="rouge:"+this.SID;
    Name="常緑の石";
    Rank=RankList[1];
    weapon=true;

    lore_item="★★武器説明★★";
    lore_skillname="森の加護";
    lore_skilluse="右クリック";
    lore_skilllim="MP 10";
    lore_skillinfo="1分間の間スピードIの効果を得る。";
    lore_skillname2="ツタ召喚";
    lore_skilluse2="シフト右クリック";
    lore_skilllim2="MP 15";
    lore_skillinfo2="半径10m以内の敵に「ツタ纏い」状態を与える";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}

//深緑の杖
class Forest_Wand{
    cooldown = [1,0]
    mp=[5,0];
    SID = "forest_wand";
    ID="rouge:"+this.SID;
    Name="深緑の杖";
    Rank=RankList[1];
    weapon=true;

    lore_item="★★武器説明★★";
    lore_skillname="深緑魔法";
    lore_skilluse="右クリック";
    lore_skilllim="MP 5";
    lore_skillinfo="8ダメージの魔法を前方に撃つ。25%の確率で「ツタ纏い」状態を与える";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}

//樹滅の剣
class Forest_Burst_Sword{
    cooldown = [8,15]
    mp=[12,20];
    SID = "forest_burst_sword";
    ID="rouge:"+this.SID;
    Name="樹滅の剣";
    Rank=RankList[2];
    weapon=true;

    lore_item="★★武器説明★★";
    lore_skillname="根雷";
    lore_skilluse="右クリック";
    lore_skilllim="MP 12";
    lore_skillinfo="当たった敵に12ダメージを与え、「ツタ纏い」状態にする。";
    lore_skillname2="蔦震";
    lore_skilluse2="シフト右クリック";
    lore_skilllim2="MP 20";
    lore_skillinfo2="周囲10mの「ツタ纏い」状態の敵を、ツタを活性化させることで締め上げる。締め上げた敵はインベントリにある「森系統の武器」の種類×10ダメージを受ける。(最大4種)";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //武器所持数制限
        if(pl.hasTag("limit_has_weapons")==false||!this.weapon){
            //クールダウン
            if(pl.getItemCooldown(this.SID)==0){
                if(pl.isOnGround){ 
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //地上ダッシュスニーク
                            this.skill1(ev);
                        }else{ //地上ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //地上歩きスニーク
                            this.skill1(ev);
                        }else{ //地上歩き立ち
                            this.skill1(ev);
                        }
                    }
                }else{
                    if(pl.isSprinting){
                        if(pl.isSneaking){ //空中ダッシュスニーク
                            this.skill1(ev);
                        }else{ //空中ダッシュ立ち
                            this.skill1(ev);
                        }
                    }else{
                        if(pl.isSneaking){ //空中歩きスニーク
                            this.skill1(ev);
                        }else{ //空中歩き立ち
                            this.skill1(ev);
                        }
                    }
                }
            }
        }else{
            limit_weapon_msg(pl,this.SID);
        }
    }

    skill1(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[0]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"1");
            pl.startItemCooldown(this.SID,this.cooldown[0]*20);
            pl.addLevels(-this.mp[0]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }

    skill2(ev){
        const pl = ev.source;
        //mp制限
        if(pl.addLevels(0)>=this.mp[1]){
            pl.runCommandAsync("execute as @s at @s run function item/"+this.SID+"2");
            pl.startItemCooldown(this.SID,this.cooldown[1]*20);
            pl.addLevels(-this.mp[1]);
        }
        else{
            lack_mp_msg(pl,this.SID);
        }

    }
}


//----------------------------------------------------アイテム

class Forest_Ticket{
    cooldown = 1;
    mp=[0];
    SID = "forest_ticket";
    ID="rouge:"+this.SID;
    Name="森のチケット";
    Rank=RankList[3];
    weapon=false;

    lore_item="森に関係する武器がピックアップされるガチャを引ける。\nこの武器の所持・使用には所持制限は適用されない。";
    lore_skillname="ガチャ召喚";
    lore_skilluse="右クリック";
    lore_skilllim="ガチャを引く会場内";
    lore_skillinfo="ガチャを召喚する。叩くと引くことが出来る。\nこのチケットを消費する。";
    lore_skillname2="";
    lore_skilluse2="";
    lore_skilllim2="";
    lore_skillinfo2="";

    constructor(brand){
        this.brand=brand;
        this.lore="";
        this.lore=this.Rank+"§r Rank 【"+this.Name+"§r】\n"+this.lore_item;
        if(this.lore_skillname!="") this.lore+="\n\nスキル【"+this.lore_skillname+"§r】(§e"+this.lore_skilluse+"§r)\n使用条件:*"+this.lore_skilllim+"*\n"+this.lore_skillinfo;
        if(this.lore_skillname2!="") this.lore+="\n\nスキル【"+this.lore_skillname2+"§r】(§e"+this.lore_skilluse2+"§r)\n使用条件:*"+this.lore_skilllim2+"*\n"+this.lore_skillinfo2;
    }

    skill(ev){
        const pl = ev.source;
        //クールダウン
        if(pl.getItemCooldown(this.SID)==0){
            //mp制限
            if(pl.addLevels(0)>=this.mp[0]){
                pl.runCommandAsync("execute as @s at @s if block ~~-1~ raw_gold_block positioned ^^^1 run summon rouge:forest_gacha ~~1~");
                pl.runCommandAsync("execute as @s at @s if block ~~-1~ raw_gold_block run playsound random.totem @a ~~~ 1 1");
                pl.runCommandAsync("execute as @s at @s if block ~~-1~ raw_gold_block run playsound random.levelup @a ~~~ 1 0.7");
                pl.runCommandAsync("execute as @s at @s if block ~~-1~ raw_gold_block run particle minecraft:trial_spawner_detection ~-0.5~1~-0.5");
                pl.runCommandAsync("execute as @s at @s if block ~~-1~ raw_gold_block run clear @s rouge:forest_ticket 0 1");
                pl.runCommandAsync("execute as @s at @s unless block ~~-1~ raw_gold_block run tellraw @s {\"rawtext\":[{\"text\":\"§cここでガチャを引くことはできない\"}]}");
            }
            else{
                lack_mp_msg(pl,this.SID);
            }
        }
    }
}


//----------------------------------------------------Script

const weapons=[new Long_Sword(),new First_Wand(),new Mode_Switcher(),new Explosion_Wand(),new Weapon_Checker(),new Forest_Ticket(),new Torch_Sword(),new Fire_Torch_Sword(),new Soul_Torch_Sword(),new Soul_Blaster(),
    new Forest_Axe(), new Forest_Stone(),new Forest_Wand(), new Forest_Burst_Sword()
];

//ここにスクリプトを記述
server.world.afterEvents.itemUse.subscribe(ev => {
    let item = ev.itemStack.typeId;
    for (const weapon of weapons){
        if(item == weapon.ID){
            weapon.skill(ev);
        }
    }
})

let display_name;
let display_rank;
let display_cooldown;

server.system.runInterval(ev => {

    //-----------------------
    //---各プレイヤー処理-----

    for (const player of server.world.getAllPlayers()){
        const inventory = player.getComponent("inventory");
        const selectedItem = inventory.container.getItem(player.selectedSlotIndex);
        player.runCommandAsync("execute as @s at @s run scoreboard players set @s has_weapons 0");
        for (const weapon of weapons){
            if(selectedItem==null) break;
            //武器所持数カウント
            if(weapon.weapon==true) player.runCommandAsync("execute as @s at @s as @s[hasitem={item="+weapon.ID+"}] run scoreboard players add @s has_weapons 1");
            
            //ウェポンチェッカーの処理
                player.runCommandAsync("execute as @s[tag=check_weapon] at @s as @s[hasitem={item="+weapon.ID+",location=slot.weapon.offhand}] run tag @s add check_weapon_c"); 
                player.runCommandAsync("tellraw @s[tag=check_weapon_c] {\"rawtext\":[{\"text\":\"---------------\n"+weapon.lore+"\n---------------\"}]}");
                player.runCommandAsync("execute as @s[tag=check_weapon_c] at @s run playsound block.enchanting_table.use");
                player.runCommandAsync("execute as @s[tag=check_weapon_c] at @s run tag @s remove check_weapon");
                player.runCommandAsync("execute as @s[tag=check_weapon_c] at @s run tag @s remove check_weapon_c");

            //武器メッセージ出す
            if(selectedItem.typeId == weapon.ID){
                
                display_name=weapon.Name;
                display_rank=weapon.Rank;
                display_cooldown="§a"+(player.getItemCooldown(weapon.SID)/20)+"s";
                if(player.getItemCooldown(weapon.SID)==0) display_cooldown="§6準備完了"
                player.runCommandAsync("execute as @s at @s run titleraw @s actionbar {\"rawtext\":[{\"text\":\""+display_rank+"§r 【§r"+display_name+"§r】　\nクールダウン:§r"+display_cooldown+"§r\"}]}");
            }
        }
        player.runCommandAsync("execute as @s at @s as @s[scores={has_weapons=6..}] run tag @s add limit_has_weapons");
        player.runCommandAsync("execute as @s at @s as @s[scores={has_weapons=..5}] run tag @s remove limit_has_weapons");

        //ウェポンチェッカーの処理
        player.runCommandAsync("tellraw @s[tag=check_weapon] {\"rawtext\":[{\"text\":\"§cオフハンドに武器を持ってください。\"}]}");
        player.runCommandAsync("execute as @s[tag=check_weapon] at @s run tag @s remove check_weapon");

   }

   //---------------------
   //---エンティティ処理----

   const entities=["magicbullet","spawner","bullet_damage_straight","trap_damage_push"];

   const op_player = server.world.getAllPlayers()[0];
   for (const entity of entities){
    op_player.runCommandAsync("execute as @e[type=rouge:"+entity+"] at @s run function entity/"+entity);
   }

})