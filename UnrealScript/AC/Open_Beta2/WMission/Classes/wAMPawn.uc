class wAMPawn extends wPawn;

const HERO_BODY_ITEM_ID = 90204;
const MIN_ALIEN_CRITICAL_HEALTH = 500;

var bool bIsOldDefencing;
var float fKnockRatio;
var name Frag_DefenceProne;
var name Frag_DefenceCrouch;
var name Frag_Defence;
var name Meele_Alien_Pr_LR;
var name Meele_Alien_Cr_LR;
var name Meele_Alien_LR;
var name Meele_Alien_Pr_L;
var name Meele_Alien_Cr_L;
var name Meele_Alien_L;
var name Meele_Alien_Pr_R;
var name Meele_Alien_Cr_R;
var name Meele_Alien_R;
var Emitter TransEffect;
var Emitter SpecialEffect;
var wObjectiveTankerAlienShield ShieldObjective;
var wObjectiveTankerAlienShield ShieldObjective_1st;
var wGameManager.EAlienModeType eAMPawnType;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ClientChangeModelType;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        eAMPawnType;
}

function Human_AddDefaultInventory(optional bool bQuickslotChange)
{
    local wWeapon newWeapon;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local sStartWeaponInfo sInfo;
    local wAlienController ac;
    local wAlienPlayerReplicationInfo PRI;
    local int lp1;
    local wAlienCharParam kHeroParam;
    local Inventory Inv;

    ac = wAlienController(Controller);
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    Log((("[wAMPawn::Human_AddDefaultInventory] name=" $ PlayerReplicationInfo.PlayerName) $ " ") $ string(PRI.eObjType));
    // End:0xA3
    if(Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
    {
        AddDefaultInventory(bQuickslotChange);
        return;
    }
    ChangeModelType(PRI.eObjType);
    ClientChangeModelType(PRI.eObjType);
    kHeroParam = Level.GameMgr.GetAlienCharParam(0);
    kMM = Level.GetMatchMaker();
    // End:0x47B
    if(kMM.UserInfos.Length > 0)
    {
        kUser = kMM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
        // End:0x16E
        if((Weapon != none) && int(Weapon.InventoryGroup) != 1)
        {
            PendingWeapon = GetWeaponByInvenGroup(1);
            ChangedWeapon();
        }
        // End:0x444
        if(kUser.EquippedItems.Length > 0)
        {
            Inv = Inventory;
            J0x18E:

            // End:0x1F2 [Loop If]
            if(Inv != none)
            {
                newWeapon = wWeapon(Inv);
                // End:0x1DB
                if((newWeapon != none) && int(newWeapon.InventoryGroup) != 1)
                {
                    newWeapon.SetHands_Server();
                }
                Inv = Inv.Inventory;
                // [Loop Continue]
                goto J0x18E;
            }
            Weapon = GetWeaponByInvenGroup(1);
            // End:0x216
            if(Weapon != none)
            {
                Weapon.Destroy();
            }
            Log((((string(self) $ "[::AddDefaultInventory] AddWeapon ") $ string(kHeroParam.add_MainWeaponID)) $ " =") $ PlayerReplicationInfo.PlayerName);
            newWeapon = AddWeapon(EmptyBtrDouble(), kHeroParam.add_MainWeaponID, 0, false);
            ClientForceChangedWeapon(newWeapon);
            lp1 = 0;
            J0x29D:

            // End:0x444 [Loop If]
            if(lp1 < 2)
            {
                // End:0x43A
                if(kHeroParam.add_SubWeaponID[lp1] != 0)
                {
                    newWeapon = AddWeapon(EmptyBtrDouble(), kHeroParam.add_SubWeaponID[lp1], 0, false);
                    // End:0x3E7
                    if(newWeapon != none)
                    {
                        switch(newWeapon.WeaponType)
                        {
                            // End:0x324
                            case 14:
                                PlayerReplicationInfo.abySupplyItemFlag[int(3)] = 1;
                                // End:0x381
                                break;
                            // End:0x342
                            case 15:
                                PlayerReplicationInfo.abySupplyItemFlag[int(2)] = 1;
                                // End:0x381
                                break;
                            // End:0x360
                            case 16:
                                PlayerReplicationInfo.abySupplyItemFlag[int(1)] = 1;
                                // End:0x381
                                break;
                            // End:0x37E
                            case 19:
                                PlayerReplicationInfo.abySupplyItemFlag[int(4)] = 1;
                                // End:0x381
                                break;
                            // End:0xFFFF
                            default:
                                break;
                        }
                        // End:0x3B4
                        if(int(newWeapon.InventoryGroup) == 5)
                        {
                            PlayerController(Controller).ClientChangeSlot5(newWeapon);                            
                        }
                        else
                        {
                            // End:0x3E4
                            if(int(newWeapon.InventoryGroup) == 6)
                            {
                                PlayerController(Controller).ClientChangeSlot6(newWeapon);
                            }
                        }
                        // [Explicit Continue]
                        goto J0x43A;
                    }
                    Log("Failed [wAMPawn::Human_AddDefaultInventory] WeaponID : " $ string(kHeroParam.add_SubWeaponID[lp1]));
                }
                J0x43A:

                ++lp1;
                // [Loop Continue]
                goto J0x29D;
            }
        }
        PlayerReplicationInfo.fSpawnedTime = float(Level.Game.GameReplicationInfo.ElapsedTime);
        Human_AddDefaultSkills();
    }
    //return;    
}

function Human_AddDefaultSkills(optional bool bQuickslotChange)
{
    local int lp1;
    local wAlienController ac;
    local wAlienPlayerReplicationInfo PRI;
    local wAlienCharParam kHeroParam;

    ac = wAlienController(Controller);
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    Log((("[wAMPawn::Human_AddDefaultSkills] name=" $ PlayerReplicationInfo.PlayerName) $ " ") $ string(PRI.eObjType));
    ac.AddSkill(40011);
    // End:0xB4
    if(Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
    {
        AddDefaultSkills(bQuickslotChange);
        return;
    }
    kHeroParam = Level.GameMgr.GetAlienCharParam(0);
    lp1 = 0;
    J0xDB:

    // End:0x12E [Loop If]
    if(lp1 < 2)
    {
        // End:0x124
        if(kHeroParam.add_SkillID[lp1] != 0)
        {
            ac.AddSkill(kHeroParam.add_SkillID[lp1]);
        }
        ++lp1;
        // [Loop Continue]
        goto J0xDB;
    }
    //return;    
}

function Human_TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local PlayerReplicationInfo AttakerPRI;
    local GameReplicationInfo GRI;

    GRI = PlayerController(Controller).GameReplicationInfo;
    // End:0x36
    if(float(GRI.GetCurAlienModeWaitingTimeCount()) >= 0.0001000)
    {
        return;
    }
    // End:0x58
    if((DamageType != Class'Engine.wDamageMelee') && DamageType != Class'Engine.wDamageStepOn')
    {
        return;
    }
    AttakerPRI = instigatedBy.PlayerReplicationInfo;
    // End:0x103
    if(AttakerPRI.Team.TeamIndex == PlayerReplicationInfo.Team.TeamIndex)
    {
        // End:0x103
        if(((((int(byte(WeaponType)) == int(7)) || int(byte(WeaponType)) == int(8)) || int(byte(WeaponType)) == int(10)) || int(byte(WeaponType)) == int(11)) || int(byte(WeaponType)) == int(20))
        {
            return;
        }
    }
    TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType, CollisionPart, WeaponType, bWallShot);
    //return;    
}

function Human_UpdateDied(int ActualDamage, Controller Killer, Class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local int i;
    local Trigger t;
    local NavigationPoint N;
    local wAlienController ac;
    local wSkill SkillObject;

    // End:0x14B
    if(PlayerReplicationInfo != none)
    {
        // End:0x104
        if(((Killer != Controller) || DamageType != Class'Engine.Suicided') && wAlienPlayerReplicationInfo(PlayerReplicationInfo).bNoTransferAlien == true)
        {
            wAlienPlayerReplicationInfo(PlayerReplicationInfo).bNoTransferAlien = false;
            SkillObject = Controller.SkillBase.FindSkillByClassName('wSkill_NoTransferAlien');
            // End:0x9C
            if(SkillObject != none)
            {
                SkillObject.bUpdateProcess = false;
            }
            // End:0xCF
            if(Controller != none)
            {
                PlayerController(Controller).ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMDefenceToAlien, true);
            }
            // End:0x102
            if(Killer != none)
            {
                PlayerController(Killer).ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMInfectToFail, true);
            }
            return;
        }
        i = 0;
        J0x10B:

        // End:0x13A [Loop If]
        if(i < int(5))
        {
            PlayerReplicationInfo.abySupplyItemFlag[i] = 0;
            ++i;
            // [Loop Continue]
            goto J0x10B;
        }
        PlayerReplicationInfo.IsInvulnerable = false;
    }
    // End:0x180
    if((bDeleteMe || Level.bLevelChange) || Level.Game == none)
    {
        return;
    }
    // End:0x1CE
    if((DamageType.default.bCausedByWorld && (Killer == none) || Killer == Controller) && LastHitBy != none)
    {
        Killer = self.GetKillerController();
    }
    Process_TossWeapon_When_Dying(Level, self, Weapon);
    // End:0x239
    if(Controller != none)
    {
        Controller.WasKilledBy(Killer);
        Level.Game.Killed(Killer, Controller, self, DamageType, CollisionPart, WeaponType, bWallShot);        
    }
    else
    {
        Level.Game.Killed(Killer, Controller(Owner), self, DamageType, CollisionPart, WeaponType, bWallShot);
    }
    DrivenVehicle = none;
    // End:0x2A5
    if(Killer != none)
    {
        TriggerEvent(Event, self, Killer.Pawn);        
    }
    else
    {
        TriggerEvent(Event, self, none);
    }
    // End:0x32C
    if((IsPlayerPawn()) || WasPlayerPawn())
    {
        PhysicsVolume.PlayerPawnDiedInVolume(self);
        // End:0x2F7
        foreach TouchingActors(Class'Engine.Trigger', t)
        {
            t.PlayerToucherDied(self);            
        }        
        // End:0x32B
        foreach TouchingActors(Class'Engine.NavigationPoint', N)
        {
            // End:0x32A
            if(N.bReceivePlayerToucherDiedNotify)
            {
                N.PlayerToucherDied(self);
            }            
        }        
    }
    RemovePowerups();
    //return;    
}

simulated function Human_ClientPickupWeapon()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x36
    if(Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
    {
        ClientPickupWeapon();
    }
    //return;    
}

simulated function Alien_InitStatus()
{
    local wAlienCharParam CharParam;
    local wAlienPlayerReplicationInfo PRI;
    local wAlienController ac;
    local wGameManager GameMgr;

    GameMgr = Level.GameMgr;
    ac = wAlienController(Controller);
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    CharParam = GameMgr.GetAlienCharParam(PRI.bySkinID);
    // End:0x211
    if(CharParam != none)
    {
        wMyParam.F_DiagmoveRatio = CharParam.F_DiagmoveRatio;
        wMyParam.SideMoveRatio = CharParam.SideMoveRatio;
        wMyParam.B_DiagmoveRatio = CharParam.B_DiagmoveRatio;
        wMyParam.BackMoveRatio = CharParam.BackMoveRatio;
        wMyParam.AccelRate = CharParam.AccelRate;
        wMyParam.JumpMaxAcc = CharParam.JumpMaxAcc;
        wMyParam.JumpMinAcc = CharParam.JumpMinAcc;
        wMyParam.JumpReduceRate = CharParam.JumpReduceRate;
        wMyParam.JumpRecoverRate = CharParam.JumpRecoverRate;
        wMyParam.Land_Dropspeed_Rate = CharParam.Land_Dropspeed_Rate;
        wMyParam.ProneCam_MaxPicth = CharParam.ProneCam_MaxPicth;
        wMyParam.ProneCam_MaxYaw = CharParam.ProneCam_MaxYaw;
        wMyParam.ProneCam_RotSpeed = CharParam.ProneCam_RotSpeed;
        fKnockRatio = CharParam.fKnockRatio;
        ChangeCollisionSize(CharParam.CollisionRadius, CharParam.CollisionHeight);
    }
    wMyParam.FL_Rot = MakeVector(0.0000000, 0.0000000, -5000.0000000);
    wMyParam.FR_Rot = MakeVector(0.0000000, 0.0000000, 5000.0000000);
    wMyParam.BL_Rot = MakeVector(0.0000000, 0.0000000, 5000.0000000);
    wMyParam.BR_Rot = MakeVector(0.0000000, 0.0000000, -5000.0000000);
    wMyParam.CFL_Rot = MakeVector(0.0000000, 0.0000000, -5000.0000000);
    wMyParam.CFR_Rot = MakeVector(0.0000000, 0.0000000, 5000.0000000);
    wMyParam.CBL_Rot = MakeVector(0.0000000, 0.0000000, -5000.0000000);
    wMyParam.CBR_Rot = MakeVector(0.0000000, 0.0000000, 5000.0000000);
    wMyParam.BodyFL_Rot = -7500.0000000;
    wMyParam.BodyFR_Rot = 7500.0000000;
    wMyParam.BodyBL_Rot = 5000.0000000;
    wMyParam.BodyBR_Rot = -5500.0000000;
    //return;    
}

function Alien_AddDefaultInventory(optional bool bQuickslotChange)
{
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local wAlienController ac;
    local wAlienPlayerReplicationInfo PRI;
    local wWeapon newWeapon;
    local wAlienCharParam kAlienParam;

    Log("[wAMPawn::Alien_AddDefaultInventory] Call name=" $ PlayerReplicationInfo.PlayerName);
    ac = wAlienController(Controller);
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    ChangeModelType(PRI.eObjType);
    ClientChangeModelType(PRI.eObjType);
    ac.SetFOV(ac.80.0000000);
    kAlienParam = Level.GameMgr.GetAlienCharParam(PRI.bySkinID);
    // End:0x126
    if(kAlienParam == none)
    {
        Log("[wAMParam::Alien_AddDefaultInventory] bySkinID : " $ string(PRI.bySkinID));
    }
    kMM = Level.GetMatchMaker();
    // End:0x288
    if(kMM.UserInfos.Length > 0)
    {
        kUser = kMM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
        Log("[wAMPawn::Alien_AddDefaultInventory] InProcess name=" $ PlayerReplicationInfo.PlayerName);
        RemoveAllInventory();
        // End:0x257
        if(kUser.EquippedItems.Length > 0)
        {
            Log((((string(self) $ "[::Alien_AddDefaultInventory] AddWeapon Knife ") $ string(kAlienParam.add_MainWeaponID)) $ " =") $ PlayerReplicationInfo.PlayerName);
            newWeapon = AddWeapon(EmptyBtrDouble(), kAlienParam.add_MainWeaponID, 0, false);
        }
        PlayerReplicationInfo.fSpawnedTime = float(Level.Game.GameReplicationInfo.ElapsedTime);
    }
    Alien_AddDefaultSkills();
    //return;    
}

function Alien_AddDefaultSkills(optional bool bQuickslotChange)
{
    local wAlienController ac;
    local int lp1;
    local wAlienCharParam kAlienParam;
    local array<int> iDelSkillIds;

    ac = wAlienController(Controller);
    Log("[wAMPawn::Alien_AddDefaultSkills] Call name=" $ PlayerReplicationInfo.PlayerName);
    lp1 = 0;
    J0x57:

    // End:0xB6 [Loop If]
    if(lp1 < ac.SkillBase.Skills.Length)
    {
        iDelSkillIds[iDelSkillIds.Length] = ac.SkillBase.Skills[lp1].SkillID;
        lp1++;
        // [Loop Continue]
        goto J0x57;
    }
    J0xB6:

    // End:0xF3 [Loop If]
    if(iDelSkillIds.Length != 0)
    {
        ac.RemoveSkill(iDelSkillIds[iDelSkillIds.Length - 1]);
        iDelSkillIds.Length = iDelSkillIds.Length - 1;
        // [Loop Continue]
        goto J0xB6;
    }
    kAlienParam = Level.GameMgr.GetAlienCharParam(wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo).bySkinID);
    lp1 = 0;
    J0x134:

    // End:0x187 [Loop If]
    if(lp1 < 2)
    {
        // End:0x17D
        if(kAlienParam.add_SkillID[lp1] != 0)
        {
            ac.AddSkill(kAlienParam.add_SkillID[lp1]);
        }
        ++lp1;
        // [Loop Continue]
        goto J0x134;
    }
    //return;    
}

function Alien_TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    Damage = int(float(Level.GameMgr.GetAlienModeAttackBuff(WeaponType, Damage, int(Level.Game.GetAttackBuff()))) * wAlienPlayerReplicationInfo(PlayerReplicationInfo).fAttackDereaseRate);
    TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType, CollisionPart, WeaponType, bWallShot);
    UpdateCriticalState();
    //return;    
}

simulated function Alien_StartFiring(bool bHeavy, bool bRapid)
{
    local name FireAnim;

    // End:0x12
    if(int(Physics) == int(3))
    {
        return;
    }
    // End:0x20
    if(bIsTurreting == true)
    {
        return;
    }
    // End:0x54
    if(bIsCrouched == true)
    {
        // End:0x46
        if(FRand() <= 0.5000000)
        {
            FireAnim = Meele_Alien_Cr_L;            
        }
        else
        {
            FireAnim = Meele_Alien_Cr_LR;
        }        
    }
    else
    {
        // End:0x88
        if(bIsProned == true)
        {
            // End:0x7A
            if(FRand() <= 0.5000000)
            {
                FireAnim = Meele_Alien_Pr_L;                
            }
            else
            {
                FireAnim = Meele_Alien_Pr_LR;
            }            
        }
        else
        {
            // End:0xA2
            if(FRand() <= 0.5000000)
            {
                FireAnim = Meele_Alien_L;                
            }
            else
            {
                FireAnim = Meele_Alien_LR;
            }
        }
    }
    AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
    // End:0xFB
    if(bRapid)
    {
        // End:0xF8
        if(int(FireState) != int(2))
        {
            LoopAnim(FireAnim,, 0.0000000, 1);
            FireState = 2;
        }        
    }
    else
    {
        PlayAnim(FireAnim,, 0.0000000, 1);
        FireState = 1;
    }
    IdleTime = Level.TimeSeconds;
    //return;    
}

simulated function Alien_PlayMelee(bool bMeleeKnifeOrButt)
{
    local name CurrentMelee3rd;

    // End:0x55
    if(bIsProned == true)
    {
        // End:0x47
        if(bMeleeKnifeOrButt || int(WeaponAttachment.BaseParams.eType) == int(17))
        {
            CurrentMelee3rd = Meele_Alien_Pr_R;            
        }
        else
        {
            CurrentMelee3rd = Meele_Rifle_Pr;
        }        
    }
    else
    {
        // End:0xAA
        if(bIsCrouched == true)
        {
            // End:0x9C
            if(bMeleeKnifeOrButt || int(WeaponAttachment.BaseParams.eType) == int(17))
            {
                CurrentMelee3rd = Meele_Alien_Cr_R;                
            }
            else
            {
                CurrentMelee3rd = Meele_Rifle_Cr;
            }            
        }
        else
        {
            // End:0xE5
            if(bMeleeKnifeOrButt || int(WeaponAttachment.BaseParams.eType) == int(17))
            {
                CurrentMelee3rd = Meele_Alien_R;                
            }
            else
            {
                CurrentMelee3rd = Meele_Rifle;
            }
        }
    }
    AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, FireRootBone);
    PlayAnim(CurrentMelee3rd, 1.0000000, 0.0000000, 1);
    bMeleeAttacking = true;
    Log("MeleeAni - " $ string(CurrentMelee3rd));
    //return;    
}

simulated function Alien_PlayDefence()
{
    local name CurrentDefence3rd;

    // End:0x1A
    if(bIsProned == true)
    {
        CurrentDefence3rd = Frag_DefenceProne;        
    }
    else
    {
        // End:0x34
        if(bIsCrouched == true)
        {
            CurrentDefence3rd = Frag_DefenceCrouch;            
        }
        else
        {
            CurrentDefence3rd = Frag_Defence;
        }
    }
    AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, FireRootBone);
    PlayAnim(CurrentDefence3rd, 0.0000000, 0.5000000, 1);
    //return;    
}

function Alien_ChangedWeapon()
{
    ChangedWeapon();
    // End:0x83
    if((((PlayerController(Controller) == Level.GetLocalPlayerController()) || Controller.IsA('wAIBot')) && Weapon != none) && Weapon.BaseParams != none)
    {
        wMyParam.iCurWeaponId = Weapon.BaseParams.iWeaponID;
    }
    //return;    
}

function Alien_ServerChangedWeapon(wWeapon OldWeapon, wWeapon newWeapon)
{
    ServerChangedWeapon(OldWeapon, newWeapon);
    //return;    
}

function float Alien_GetSprintJumpZ()
{
    return JumpZ;
    //return;    
}

function float Alien_GetBaseStaminaTime()
{
    return wMyParam.Stm_MaxTime;
    //return;    
}

simulated function Alien_ClientPickupWeapon()
{
    //return;    
}

simulated function Class<wEmitter> Alien_GetBloodHitClass(bool bHeadShot)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Alpha;
    //return;    
}

function Alien_TakeDamageSound(int LeftHealth, int ActualDamage, Vector HitLocation, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional Controller Killer)
{
    // End:0x0D
    if(ActualDamage <= 0)
    {
        return;
    }
    // End:0x29
    if((sndScream == "") && sndDie == "")
    {
        return;
    }
    // End:0x135
    if(LeftHealth <= 0)
    {
        // End:0xB0
        if(Killer != none)
        {
            // End:0x82
            if(int(byte(CollisionPart)) == int(1))
            {
                PlayerController(Killer).ClientFmodPlaySoundLocal(sndDie, 0, 1.0000000, false, true, false, -1, false, Location);                
            }
            else
            {
                PlayerController(Killer).ClientFmodPlaySoundLocal(sndDie, 0, 1.0000000, false, true, false, -1, false, Location);
            }
        }
        // End:0xF6
        if(int(byte(CollisionPart)) == int(1))
        {
            FmodPlaySound("Warfare_Sound_Impact/Char/headshot_rand", 0);            
        }
        else
        {
            FmodPlaySound(sndScream, 0);
            FmodPlaySound("Warfare_Sound_Impact/Char/normal_rand", 0);
        }        
    }
    else
    {
        // End:0x216
        if(DamageType != Class'Engine.fell')
        {
            // End:0x186
            if(Killer != none)
            {
                PlayerController(Killer).ClientFmodPlaySoundLocal(Class'WGame.wAlienMaleSoundGroup'.default.SndAlienHitSound, 0, 1.0000000, false, true, false, -1, false, Location);
            }
            FmodPlaySound(Class'WGame.wAlienMaleSoundGroup'.default.SndAlienHitSound, 0, 1.0000000);
            // End:0x1E7
            if(int(byte(CollisionPart)) == int(1))
            {
                FmodPlaySound("Warfare_Sound_Impact/Char/headshot_rand", 0);                
            }
            else
            {
                FmodPlaySound("Warfare_Sound_Impact/Char/normal_rand", 0);
            }
        }
    }
    //return;    
}

simulated function Alien_PlayBreathSound()
{
    FmodPlaySound(Class'WGame.wAlienMaleSoundGroup'.default.SndAlienMoveHeartBreathSound, 0);
    //return;    
}

function float GetSprintJumpZ()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x3A
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        return super(Pawn).GetSprintJumpZ();        
    }
    else
    {
        return JumpZ;
    }
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    // End:0x45
    if(PlayerReplicationInfo != none)
    {
        // End:0x38
        if(PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            return super.GetBloodHitClass(bHeadShot);            
        }
        else
        {
            return Alien_GetBloodHitClass(bHeadShot);
        }
    }
    //return;    
}

simulated function StartFiring(bool bHeavy, bool bRapid)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x45
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        super.StartFiring(bHeavy, bRapid);        
    }
    else
    {
        Alien_StartFiring(bHeavy, bRapid);
    }
    //return;    
}

simulated function PlayMelee(bool bMeleeKnifeOrButt)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x3F
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        super.PlayMelee(bMeleeKnifeOrButt);        
    }
    else
    {
        Alien_PlayMelee(bMeleeKnifeOrButt);
    }
    //return;    
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    local wAlienPlayerReplicationInfo PRI;
    local wWeapon Weapon;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    Log("[wAMPawn::AddDefaultInventory] eObjType : " $ string(PRI.eObjType));
    // End:0x7F
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        Human_AddDefaultInventory(bQuickslotChange);        
    }
    else
    {
        Alien_AddDefaultInventory(bQuickslotChange);
    }
    //return;    
}

function AddDefaultSkills(optional bool bQuickslotChange)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x3F
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        Human_AddDefaultSkills(bQuickslotChange);        
    }
    else
    {
        Alien_AddDefaultSkills(bQuickslotChange);
    }
    //return;    
}

function ChangedWeapon()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x39
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        super.ChangedWeapon();        
    }
    else
    {
        Alien_ChangedWeapon();
    }
    //return;    
}

simulated function ClientPickupWeapon()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x39
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        Human_ClientPickupWeapon();        
    }
    else
    {
        Alien_ClientPickupWeapon();
    }
    //return;    
}

function ServerChangedWeapon(wWeapon OldWeapon, wWeapon newWeapon)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    clog((("[wAMPawn::ServerChangedWeapon] name=" $ PlayerReplicationInfo.PlayerName) $ ", ") $ string(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType)));
    // End:0xA6
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        super.ServerChangedWeapon(OldWeapon, newWeapon);        
    }
    else
    {
        Alien_ServerChangedWeapon(OldWeapon, newWeapon);
    }
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x62
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        Human_TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType, CollisionPart, WeaponType, bWallShot);        
    }
    else
    {
        Alien_TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType, CollisionPart, WeaponType, bWallShot);
    }
    //return;    
}

function Process_TossWeapon_When_Dying(LevelInfo levenInfo, Pawn Pawn, wWeapon Weapon)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x45
    if(Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
    {
        super(Pawn).Process_TossWeapon_When_Dying(levenInfo, Pawn, Weapon);
    }
    //return;    
}

function UpdateDied(int ActualDamage, Controller Killer, Class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x5D
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        Human_UpdateDied(ActualDamage, Killer, DamageType, HitLocation, CollisionPart, WeaponType, bWallShot);        
    }
    else
    {
        super(Pawn).UpdateDied(ActualDamage, Killer, DamageType, HitLocation, CollisionPart, WeaponType, bWallShot);
    }
    //return;    
}

simulated function ProcessHitFX()
{
    local Coords boneCoords;

    // End:0x42
    if(((int(Level.NetMode) == int(NM_DedicatedServer)) || bSkeletized) || Mesh == SkeletonMesh)
    {
        SimHitFxTicker = HitFxTicker;
        return;
    }
    SimHitFxTicker = SimHitFxTicker;
    J0x4D:

    // End:0x18F [Loop If]
    if(SimHitFxTicker != HitFxTicker)
    {
        // End:0xD2
        if(((HitFx[SimHitFxTicker].damtype == none) || HitFx[SimHitFxTicker].damtype == Class'Engine.wDamageUnknown') || (Level.bDropDetail && (Level.TimeSeconds - LastRenderTime) > float(3)) && !IsHumanControlled())
        {            
        }
        else
        {
            boneCoords = GetBoneCoords(HitFx[SimHitFxTicker].Bone);
            // End:0x130
            if(!bSkeletized)
            {
                AttachEffect(GetBloodHitClass(false), HitFx[SimHitFxTicker].Bone, boneCoords.Origin, HitFx[SimHitFxTicker].rotDir);
            }
            // End:0x155
            if(Level.GetIsNoGore())
            {
                HitFx[SimHitFxTicker].bSever = false;
            }
            // End:0x174
            if(HitFx[SimHitFxTicker].bSever)
            {
                SpawnGoreGiblet(SimHitFxTicker);
            }
        }
        SimHitFxTicker = int(float(SimHitFxTicker + 1) % float(8));
        // [Loop Continue]
        goto J0x4D;
    }
    //return;    
}

simulated function Destroyed()
{
    // End:0x29
    if(TransEffect != none)
    {
        DetachFromBone(TransEffect);
        TransEffect.Destroy();
        TransEffect = none;
    }
    // End:0x52
    if(SpecialEffect != none)
    {
        DetachFromBone(SpecialEffect);
        SpecialEffect.Destroy();
        SpecialEffect = none;
    }
    // End:0xA1
    if(ShieldObjective != none)
    {
        // End:0x8E
        if(ShieldObjective.AttachedActor != none)
        {
            ShieldObjective.AttachedActor.DetachFromBone(ShieldObjective);
        }
        ShieldObjective.Destroy();
        ShieldObjective = none;
    }
    // End:0xF0
    if(ShieldObjective_1st != none)
    {
        // End:0xDD
        if(ShieldObjective_1st.AttachedActor != none)
        {
            ShieldObjective_1st.AttachedActor.DetachFromBone(ShieldObjective);
        }
        ShieldObjective_1st.Destroy();
        ShieldObjective_1st = none;
    }
    super.Destroyed();
    //return;    
}

simulated function MakeTransformEffect()
{
    local wAlienPlayerReplicationInfo PRI;

    // End:0x28
    if((PlayerReplicationInfo == none) || int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x61
    if(TransEffect != none)
    {
        DetachFromBone(TransEffect);
        TransEffect.Destroy();
        TransEffect = none;
    }
    // End:0x8A
    if(SpecialEffect != none)
    {
        DetachFromBone(SpecialEffect);
        SpecialEffect.Destroy();
        SpecialEffect = none;
    }
    // End:0x251
    if((IsLocalPlayerViewtarget()) == false)
    {
        // End:0x187
        if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
        {
            TransEffect = Spawn(Class'XEffects.xAlienPawnGidGroup'.default.TransEffectClass_ToAlien, self);
            // End:0x184
            if(int(PRI.bySkinID) == 1)
            {
                SpecialEffect = Spawn(Class'XEffects.xAlienPawnGidGroup'.default.BreathingEffectClass, self);
                // End:0x156
                if((SpecialEffect != none) && AttachToBone(SpecialEffect, 'Bip Eye_L'))
                {
                    Log(("MakeTransformEffect::AttachToBone( " $ string(SpecialEffect)) $ " ) ");                    
                }
                else
                {
                    Log("Failed MakeTransformEffect::AttachToBone()");
                }
            }            
        }
        else
        {
            // End:0x1C2
            if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
            {
                TransEffect = Spawn(Class'XEffects.xAlienPawnGidGroup'.default.TransEffectClass_ToHero, self);                
            }
            else
            {
                return;
            }
        }
        // End:0x220
        if(AttachToBone(TransEffect, MainRootBone))
        {
            Log(((("MakeTransformEffect::AttachToBone( " $ string(TransEffect)) $ ", ") $ string(MainRootBone)) $ " ) ");            
        }
        else
        {
            Log("Failed MakeTransformEffect::AttachToBone()");
        }        
    }
    else
    {
        // End:0x28C
        if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
        {
            TransEffect = Spawn(Class'XEffects.xAlienPawnGidGroup'.default.TransEffectClass_ToAlien_1st, self);            
        }
        else
        {
            // End:0x2C7
            if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
            {
                TransEffect = Spawn(Class'XEffects.xAlienPawnGidGroup'.default.TransEffectClass_ToHero_1st, self);                
            }
            else
            {
                return;
            }
        }
        // End:0x327
        if(TransEffect != none)
        {
            // End:0x327
            if(!AttachToBone(TransEffect, 'None'))
            {
                Log("Failed MakeTransformEffect::AttachToBone() TransEffect_1st");
            }
        }
    }
    //return;    
}

exec function CallEffect_PHJ()
{
    MakeShieldEffect();
    //return;    
}

simulated function MakeShieldEffect()
{
    local Actor FromActor_1st;

    // End:0x0D
    if(PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x5C
    if(ShieldObjective != none)
    {
        // End:0x49
        if(ShieldObjective.AttachedActor != none)
        {
            ShieldObjective.AttachedActor.DetachFromBone(ShieldObjective);
        }
        ShieldObjective.Destroy();
        ShieldObjective = none;
    }
    // End:0xAB
    if(ShieldObjective_1st != none)
    {
        // End:0x98
        if(ShieldObjective_1st.AttachedActor != none)
        {
            ShieldObjective_1st.AttachedActor.DetachFromBone(ShieldObjective);
        }
        ShieldObjective_1st.Destroy();
        ShieldObjective_1st = none;
    }
    // End:0xD3
    if(FPWeaponAttachment != none)
    {
        FromActor_1st = FPWeaponAttachment;
        FPWeaponAttachment.PlayDefence();        
    }
    else
    {
        FromActor_1st = Weapon;
    }
    ShieldObjective = Spawn(Class'WMission_Decompressed.wObjectiveTankerAlienShield', self);
    // End:0x179
    if(ShieldObjective != none)
    {
        // End:0x14C
        if(AttachToBone(ShieldObjective, 'Shield') == false)
        {
            Log("[MakeShieldEffect AttachToBone Fail]");
            ShieldObjective.Destroy();
            ShieldObjective = none;            
        }
        else
        {
            ShieldObjective.LifeSpan = Class'WMission_Decompressed.wSkill_Shield'.default.fMaxActiveTime;
        }
        ShieldObjective.AttachedActor = self;
    }
    // End:0x24B
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        ShieldObjective_1st = Spawn(Class'WMission_Decompressed.wObjectiveTankerAlienShield', self);
        // End:0x24B
        if(ShieldObjective_1st != none)
        {
            // End:0x209
            if(FromActor_1st.AttachToBone(ShieldObjective_1st, 'Shield') == false)
            {
                Log("[MakeShieldEffect AttachToBone Fail]");
                ShieldObjective_1st.Destroy();
                ShieldObjective_1st = none;                
            }
            else
            {
                ShieldObjective_1st.LifeSpan = Class'WMission_Decompressed.wSkill_Shield'.default.fMaxActiveTime;
            }
            ShieldObjective_1st.AttachedActor = FromActor_1st;
            ShieldObjective_1st.bForceCollision = false;
        }
    }
    //return;    
}

simulated function MakeAttackLevelEffect(byte byAttackLevelIndex)
{
    // End:0x28
    if((PlayerReplicationInfo == none) || int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0xD4
    if(int(byAttackLevelIndex) != -1)
    {
        // End:0x62
        if(SpecialEffect != none)
        {
            DetachFromBone(SpecialEffect);
            SpecialEffect.Destroy();
            SpecialEffect = none;
        }
        SpecialEffect = Spawn(Class'XEffects.xAlienPawnGidGroup'.default.LevelupEffectClass[int(byAttackLevelIndex)], self);
        // End:0xD4
        if(SpecialEffect != none)
        {
            // End:0xD4
            if(!AttachToBone(SpecialEffect, 'Bip01 R Clavicle'))
            {
                Log("[MakeAttackLevelEffect Spawn Fail] : " $ string(byAttackLevelIndex));
            }
        }
    }
    //return;    
}

simulated function MakeDefecneSuccessEffect()
{
    // End:0x28
    if((PlayerReplicationInfo == none) || int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x51
    if(TransEffect != none)
    {
        DetachFromBone(TransEffect);
        TransEffect.Destroy();
        TransEffect = none;
    }
    TransEffect = Spawn(Class'XEffects.xAlienPawnGidGroup'.default.EffectClass_DefenceSuccessFromInfection, self);
    // End:0xB4
    if(TransEffect == none)
    {
        Log("[wAMPawn::MakeDefecneSuccessEffect] DefenceEffect Spawn Fail");
    }
    //return;    
}

simulated function ClientReStart()
{
    local wAlienPlayerReplicationInfo PRI;
    local wAlienGameReplicationInfo GRI;

    super.ClientReStart();
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    GRI = wAlienGameReplicationInfo(Level.GRI);
    // End:0x9A
    if(Controller != none)
    {
        // End:0x9A
        if(!(GRI.bAlienAppeared == false) || Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
        {
            wAlienController(Controller).SetFOV(wAlienController(Controller).80.0000000);
        }
    }
    //return;    
}

simulated function Setup(PlayerRecord Rec, optional bool bLoadNow)
{
    local wAlienPlayerReplicationInfo PRI;
    local wAlienGameReplicationInfo GRI;
    local int iAttackLevelIndex;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    GRI = wAlienGameReplicationInfo(Level.GRI);
    Log("[wAMPawn::Setup] ObjType : " $ string(PRI.eObjType));
    super.Setup(Rec, bLoadNow);
    PlayAnim(Frag_Idle_Anim, 1.0000000, 0.0000000);
    PRI.IsCriticalState = false;
    PRI.IsInvulnerable = false;
    // End:0x12C
    if((GRI.bAlienAppeared == false) || Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        ChangeCollisionSize(Class'WGame.wPawn'.default.CollisionRadius, Class'WGame.wPawn'.default.CollisionHeight);
        iAttackLevelIndex = GRI.GetAttackLevelIndex();
        // End:0x129
        if(iAttackLevelIndex != -1)
        {
            MakeAttackLevelEffect(byte(iAttackLevelIndex));
        }        
    }
    else
    {
        // End:0x152
        if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
        {
            Alien_InitStatus();
        }
    }
    // End:0x18E
    if(FPWeaponAttachment != none)
    {
        wFPWeaponAttachmentAlien(FPWeaponAttachment).ChangeHands(PRI.aiBodyItemID[PRI.SideID]);
    }
    //return;    
}

function PossessedBy(Controller C)
{
    super.PossessedBy(C);
    //return;    
}

function CalcItemUsedTime(wMatchUserInfo kUser)
{
    //return;    
}

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local wAlienPlayerReplicationInfo PRI;
    local wAlienGameInfo GameInfo;

    // End:0xCB
    if(Controller != none)
    {
        PRI = wAlienPlayerReplicationInfo(Controller.PlayerReplicationInfo);
        // End:0xA7
        if(PRI != none)
        {
            // End:0xA7
            if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
            {
                // End:0xA7
                if(PRI.bNoTransferAlien == true)
                {
                    GameInfo = wAlienGameInfo(Level.Game);
                    // End:0xA5
                    if(GameInfo != none)
                    {
                        GameInfo.ProcessDefSuccessFromInfection(PRI.PlayerID);
                    }
                    return;
                }
            }
        }
        super.PlayHit(Damage, instigatedBy, HitLocation, DamageType, Momentum, CollisionPart);
    }
    //return;    
}

simulated function ChangeModelType(wGameManager.EAlienModeType eObjType)
{
    local wGameManager GameMgr;
    local wAlienPlayerReplicationInfo PRI;
    local wAlienController ac;
    local wAlienCharParam CharParam;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    GameMgr = Level.GameMgr;
    PRI.eObjType = eObjType;
    ac = wAlienController(Controller);
    Log((("ChangeModelType : " $ string(PRI.eObjType)) $ " ") $ PlayerReplicationInfo.PlayerName);
    // End:0xB8
    if(int(eObjType) == int(0))
    {
        ac.SetPlayerEquipInfo();
        PRI.InfectionLevel = 0;        
    }
    else
    {
        // End:0x10E
        if(int(eObjType) == int(1))
        {
            PRI.NewSetCharacterEquipItem(90204, 90204, -1, -1, -1, -1, -1);
            PRI.InfectionLevel = 0;            
        }
        else
        {
            CharParam = Level.GameMgr.GetAlienCharParam(PRI.bySkinID);
            // End:0x1A6
            if(int(eObjType) == int(2))
            {
                PRI.NewSetCharacterEquipItem(CharParam.charID[0], CharParam.charID[0], -1, -1, -1, -1, -1);
                PRI.InfectionLevel = 0;                
            }
            else
            {
                // End:0x224
                if(int(eObjType) == int(3))
                {
                    PRI.NewSetCharacterEquipItem(CharParam.charID[1], CharParam.charID[1], -1, -1, -1, -1, -1);
                    PRI.InfectionLevel = GameMgr.AlienGameParam.3;                    
                }
                else
                {
                    PRI.NewSetCharacterEquipItem(CharParam.charID[2], CharParam.charID[2], -1, -1, -1, -1, -1);
                    PRI.InfectionLevel = GameMgr.AlienGameParam.5;
                }
            }
        }
    }
    //return;    
}

simulated function ClientChangeModelType(wGameManager.EAlienModeType eObjType)
{
    local wAlienController ac;

    ac = wAlienController(Controller);
    // End:0x2B
    if(int(Role) != int(ROLE_Authority))
    {
        ChangeModelType(eObjType);
    }
    // End:0x75
    if(ac != none)
    {
        // End:0x75
        if(Class'Engine.wGameManager'.static.IsAlienTeamType(eObjType))
        {
            // End:0x75
            if(ac != none)
            {
                ac.SetFOV(ac.80.0000000);
            }
        }
    }
    //return;    
}

simulated function ChangeModel()
{
    local PlayerRecord PawnSetupRecord;

    Setup(PawnSetupRecord);
    MakeTransformEffect();
    //return;    
}

function Controller GetDelayedInstigatorController(Pawn instigatedBy)
{
    local Controller Killer, C;

    Killer = DelayedDamageInstigatorController;
    // End:0x41
    if(Killer != none)
    {
        // End:0x3E
        if(Killer.PlayerReplicationInfo.Team.TeamIndex != 0)
        {
            return none;
        }        
    }
    else
    {
        // End:0x132
        if(instigatedBy.OwnerName != "")
        {
            Log("[wAMPawn::GetDelayedInstigatorController] " $ instigatedBy.OwnerName);
            C = Level.ControllerList;
            J0xA8:

            // End:0x132 [Loop If]
            if(C != none)
            {
                // End:0x11B
                if(C.PlayerReplicationInfo.PlayerName == instigatedBy.OwnerName)
                {
                    // End:0x10D
                    if(C.PlayerReplicationInfo.Team.TeamIndex != 0)
                    {
                        Killer = none;                        
                    }
                    else
                    {
                        Killer = C;
                    }
                    // [Explicit Break]
                    goto J0x132;
                }
                C = C.nextController;
                // [Loop Continue]
                goto J0xA8;
            }
        }
    }
    J0x132:

    return Killer;
    //return;    
}

function TakeDamageSound(int LeftHealth, int ActualDamage, Vector HitLocation, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional Controller Killer)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x6C
    if((PRI != none) && Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType) == true)
    {
        super.TakeDamageSound(LeftHealth, ActualDamage, HitLocation, DamageType, CollisionPart, WeaponType, Killer);        
    }
    else
    {
        Alien_TakeDamageSound(LeftHealth, ActualDamage, HitLocation, DamageType, CollisionPart, WeaponType, Killer);
    }
    //return;    
}

simulated function PlayBreathSounds()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x69
    if((PRI != none) && Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        // End:0x62
        if((iCheckBreath > 3) && Rand(3) > 1)
        {
            Alien_PlayBreathSound();
            iCheckBreath = 0;
        }
        iCheckBreath++;
    }
    //return;    
}

simulated function PlayDirectionalHit(Vector HitLoc, optional bool bUseHitStun, optional bool bGoreChange)
{
    // End:0x23
    if(bIsDefencing == false)
    {
        super.PlayDirectionalHit(HitLoc, bUseHitStun, bGoreChange);
    }
    //return;    
}

simulated function ChangeCollisionSize(float fRadius, float fHeight)
{
    StandHeight = fHeight;
    StandRadius = fRadius;
    CrouchRadius = fRadius;
    ProneRadius = fRadius;
    SetCollisionSize(fRadius, fHeight);
    //return;    
}

function bool GiveHealth(int HealAmount, int HealMax)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x4C
    if(super(Pawn).GiveHealth(HealAmount, HealMax) == true)
    {
        // End:0x4C
        if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
        {
            UpdateCriticalState();
        }
    }
    //return;    
}

function UpdateCriticalState()
{
    // End:0x23
    if(Health < 500)
    {
        PlayerReplicationInfo.IsCriticalState = true;        
    }
    else
    {
        PlayerReplicationInfo.IsCriticalState = false;
    }
    //return;    
}

simulated function PlayDying(Class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    // End:0x36
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(eAMPawnType) && int(byte(CollisionPart)) == int(1))
    {
        RagdollLifeSpan = 0.0000000;
    }
    super.PlayDying(DamageType, HitLoc, CollisionPart);
    //return;    
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    // End:0x55
    if((bIsDefencing == true) && bMeleeAttacking == false)
    {
        // End:0x35
        if(false == IsAnimating(1))
        {
            Alien_PlayDefence();
        }
        // End:0x55
        if((bIsDefencing == true) && bIsOldDefencing == false)
        {
            MakeShieldEffect();
        }
    }
    bIsOldDefencing = bIsDefencing;
    //return;    
}

defaultproperties
{
    fKnockRatio=1.0000000
    Frag_DefenceProne="Frag_Prone_Defence"
    Frag_DefenceCrouch="Frag_Crouch_Defence"
    Frag_Defence="Frag_Defence"
    Meele_Alien_Pr_LR="Mattack_Nail02_Prone"
    Meele_Alien_Cr_LR="Mattack_Nail02_Crouch"
    Meele_Alien_LR="Mattack_Nail02"
    Meele_Alien_Pr_L="Mattack_Nail01_Prone"
    Meele_Alien_Cr_L="Mattack_Nail01_Crouch"
    Meele_Alien_L="Mattack_Nail01"
    Meele_Alien_Pr_R="Mattack_Nail03_Prone"
    Meele_Alien_Cr_R="Mattack_Nail03_Crouch"
    Meele_Alien_R="Mattack_Nail03"
    FPWeaponAttachmentClass=Class'Engine.wFPWeaponAttachmentAlien'
    bCanBeBaseForPawns=true
    bInvulnerableOnRespawn=false
    bUseRelativeBaseRotation=false
    bSyncCollsionSizeHK=true
}