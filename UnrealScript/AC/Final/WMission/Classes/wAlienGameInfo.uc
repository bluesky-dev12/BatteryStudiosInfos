class wAlienGameInfo extends wMSGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MAX_WAIT_END_ROUND_TIME = 3.0f;

var float fSuperAlien_RemainingTime;
var array<wSupplyRespawnPoint> SupplyRespawnPoints;
var array<wSupplyRespawnPoint> SupplyedRespawnPoints;
var array<int> SupplyRandomBonusPack_SkillIDs;
var float fCurSupplyItemDropTime;
var float fMaxSupplyItemDropTime;
var int iCurSupplyItemDropTryCount;
var int iMaxSupplyItemDropOnetimeCount;
var int iMaxSupplyItemDropMaxCount;
var int iMaxSupplyItemDropTryCount;
var bool bSentEndRound;
var float fCheckEndRoundTime;
var bool bIsSuperHeroTime;
var string sndDropRandomItemBox;
//var delegate<ProcessGameLogic> __ProcessGameLogic__Delegate;

event InitGame(string Options, out string Error)
{
    local wAlienGameReplicationInfo GRI;
    local int lp1, ItemID;
    local wItemBaseParam ItemInfo;

    super.InitGame(Options, Error);
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    MaxRounds = ScoreLimit;
    CurrentAttackingTeam = 1;
    fSuperAlien_RemainingTime = Level.GameMgr.AlienGameParam.fSuperAlien_RemainingTime;
    fMaxSupplyItemDropTime = Level.GameMgr.AlienGameParam.AlienSupplyPackDropTime;
    SupplyRandomBonusPack_SkillIDs.Length = 0;
    lp1 = 0;
    J0x8E:

    // End:0x16B [Loop If]
    if(lp1 < int(Level.GameMgr.AlienGameParam.AlienSupplyPackWeaponCount))
    {
        ItemID = Level.GameMgr.AlienGameParam.AlienSupplyPackWeaponArray[lp1];
        // End:0xF4
        if(ItemID <= 0)
        {
            // [Explicit Continue]
            goto J0x161;
        }
        ItemInfo = Level.GameMgr.GetItemParam(ItemID);
        // End:0x161
        if(ItemInfo != none)
        {
            // End:0x161
            if(!Level.GameMgr.CheckMainWeaponItem(int(ItemInfo.eType)))
            {
                SupplyRandomBonusPack_SkillIDs[SupplyRandomBonusPack_SkillIDs.Length] = ItemID;
            }
        }
        J0x161:

        ++lp1;
        // [Loop Continue]
        goto J0x8E;
    }
    //return;    
}

function Logout(Controller Exiting)
{
    local wAlienGameReplicationInfo GRI;
    local wAlienPlayerReplicationInfo PRI;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    PRI = wAlienPlayerReplicationInfo(Exiting.PlayerReplicationInfo);
    // End:0xDA
    if((PRI != none) && PRI.bOutOfLives == false)
    {
        // End:0x94
        if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
        {
            GRI.HumanTeamCount = byte(Max(int(--GRI.HumanTeamCount), 0));            
        }
        else
        {
            // End:0xDA
            if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
            {
                GRI.AlienTeamCount = byte(Max(int(--GRI.AlienTeamCount), 0));
            }
        }
    }
    super.Logout(Exiting);
    //return;    
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x1D
    if(N.Class == Class'Engine.PlayerStart_Alien')
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function BeginRound(optional bool bNoReset)
{
    local wGameManager GameMgr;
    local wAlienGameReplicationInfo GRI;

    // End:0x76
    if(bNoReset == false)
    {
        GameMgr = Level.GameMgr;
        GRI = wAlienGameReplicationInfo(GameReplicationInfo);
        __ProcessGameLogic__Delegate = InGameAppearAlien;
        fCheckEndRoundTime = 0.0000000;
        GRI.HumanTeamCount = byte(GetNumPlayers());
        GRI.AlienTeamCount = 0;
        bIsSuperHeroTime = false;
    }
    super.BeginRound(bNoReset);
    // End:0xC5
    if(bNoReset == false)
    {
        GRI.bAlienAppeared = false;
        GRI.bStopCountDown = true;
        bSentEndRound = false;
        iCurSupplyItemDropTryCount = 0;
        ResetItemDrop();
    }
    //return;    
}

function StartAlienMode()
{
    local array<wAlienController> ACList;
    local Controller C;
    local wAlienController ac;
    local wAISentryGunController sentryGunController;
    local wGameManager GameMgr;
    local wAlienGameReplicationInfo GRI;
    local wAlienPlayerReplicationInfo PRI;
    local string strHeroName;
    local int iAlienNum, iHeroNum, i, idx;

    strHeroName = "";
    ACList.Length = 0;
    GameMgr = Level.GameMgr;
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    GRI.bAlienAppeared = true;
    // End:0x156
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0xFD
        if((PRI != none) && int(PRI.eObjType) != int(6))
        {
            Log(("[wAlienGameInfo::StartAlienMode] PlayerName : " $ PRI.PlayerName) $ " ACList Add!!!");
            ACList[ACList.Length] = ac;
            // End:0x155
            continue;
        }
        Log(("[wAlienGameInfo::StartAlienMode] PlayerName : " $ PRI.PlayerName) $ " ACList Not Add!!!");        
    }    
    GRI.iPlayingNum = ACList.Length;
    GRI.HumanTeamCount = byte(GRI.iPlayingNum);
    // End:0x224
    if(GRI.iPlayingNum >= 12)
    {
        iMaxSupplyItemDropMaxCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackDropMaxCount[2]);
        iMaxSupplyItemDropOnetimeCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackOneTimeCount[2]);
        iMaxSupplyItemDropTryCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackDropTryCount[2]);        
    }
    else
    {
        // End:0x2BA
        if(GRI.iPlayingNum >= 6)
        {
            iMaxSupplyItemDropMaxCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackDropMaxCount[1]);
            iMaxSupplyItemDropOnetimeCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackOneTimeCount[1]);
            iMaxSupplyItemDropTryCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackDropTryCount[1]);            
        }
        else
        {
            iMaxSupplyItemDropMaxCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackDropMaxCount[0]);
            iMaxSupplyItemDropOnetimeCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackOneTimeCount[0]);
            iMaxSupplyItemDropTryCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackDropTryCount[0]);
        }
    }
    iMaxSupplyItemDropMaxCount = Min(SupplyRespawnPoints.Length, iMaxSupplyItemDropMaxCount);
    iAlienNum = GameMgr.GetMaxHostAlienCount(GRI.iPlayingNum);
    iHeroNum = GameMgr.GetMaxHeroCount(GRI.iPlayingNum);
    i = 0;
    J0x398:

    // End:0x4C1 [Loop If]
    if(i < iAlienNum)
    {
        idx = Rand(ACList.Length);
        PRI = wAlienPlayerReplicationInfo(ACList[idx].PlayerReplicationInfo);
        // End:0x4B7
        if(Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
        {
            PRI.SetObjType(4);
            PRI.SetSkinType(0);
            ACList[idx].UpdateHPValue(PRI.eSkinType, PRI.eObjType);
            ACList[idx].ClientChangeTeam(4);
            ACList.Remove(idx, 1);
            Log("[AlienLog] StartAlienMode :EAM_ALIEN_HOST");
            ++GRI.AlienTeamCount;
            --GRI.HumanTeamCount;
        }
        ++i;
        // [Loop Continue]
        goto J0x398;
    }
    iHeroNum = Min(ACList.Length, iHeroNum);
    i = 0;
    J0x4DB:

    // End:0x5CD [Loop If]
    if(i < iHeroNum)
    {
        idx = Rand(ACList.Length);
        PRI = wAlienPlayerReplicationInfo(ACList[idx].PlayerReplicationInfo);
        // End:0x5C3
        if(Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
        {
            PRI.SetObjType(1);
            PRI.SetSkinType(2);
            ACList[idx].UpdateHPValue(PRI.eSkinType, PRI.eObjType);
            ACList.Remove(idx, 1);
            Log("[AlienLog] StartAlienMode :EAM_HUMAN_HERO");
        }
        ++i;
        // [Loop Continue]
        goto J0x4DB;
    }
    // End:0x63B
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0x63A
        if((PRI != none) && Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
        {
            strHeroName = PRI.PlayerName;
            // End:0x63B
            break;
        }        
    }    
    idx = 0;
    J0x643:

    // End:0x69F [Loop If]
    if(idx < ACList.Length)
    {
        // End:0x695
        if(ACList[idx].PlayerReplicationInfo.Team.TeamIndex == 1)
        {
            ACList[idx].ChangeTeam(0);
        }
        ++idx;
        // [Loop Continue]
        goto J0x643;
    }
    // End:0x8AF
    foreach DynamicActors(Class'Engine.Controller', C)
    {
        sentryGunController = wAISentryGunController(C);
        // End:0x6FF
        if(none != sentryGunController)
        {
            // End:0x6FB
            if(none != sentryGunController.Pawn)
            {
                wSentryGunPawn(sentryGunController.Pawn).AddAllyEffect();
            }
            continue;            
        }
        ac = wAlienController(C);
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0x8AE
        if(((ac != none) && PRI != none) && PRI.IsConnected == true)
        {
            // End:0x7D1
            if(Class'Engine.wGameManager'.static.IsAlienHostType(PRI.eObjType))
            {
                ac.Pawn.FmodPlaySound(Class'WGame.wAlienMaleSoundGroup'.default.SndInfectionTransfer[int(PRI.eSkinType)], 0,,, false);
                ac.ChangeTeam(1);
                ChangePawn(ac);                
            }
            else
            {
                // End:0x7FC
                if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
                {
                    ChangePawn(ac);
                }
            }
            // End:0x878
            if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
            {
                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMAppearHostAlien, true);
                // End:0x875
                if(strHeroName != "")
                {
                    ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMSelectedHero, true,,, strHeroName);
                }
                // End:0x8AE
                continue;
            }
            // End:0x8AE
            if(strHeroName != "")
            {
                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMSelectedHero, true,,, strHeroName);
            }
        }        
    }    
    //return;    
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local wAlienController KillerAC, KilledAC;
    local wAlienPlayerReplicationInfo KillerPRI, KilledPRI;
    local wAMPawn KillerACPawn, KilledACPawn;
    local wAlienController ac;
    local Actor.CollisionPartsType MyCollisionPart;
    local wAlienGameReplicationInfo GRI;
    local wAlienPlayerReplicationInfo PRI;
    local int iAttackLevelIndex, lp1;
    local bool bCheckSuperHeroCondition;

    super.Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType, bWallShot);
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    KillerAC = wAlienController(Killer);
    KilledAC = wAlienController(Killed);
    KillerPRI = wAlienPlayerReplicationInfo(KillerAC.PlayerReplicationInfo);
    KilledPRI = wAlienPlayerReplicationInfo(KilledAC.PlayerReplicationInfo);
    KilledACPawn = wAMPawn(KilledPawn);
    KillerACPawn = wAMPawn(KillerAC.Pawn);
    bCheckSuperHeroCondition = false;
    // End:0xD7
    if((KillerAC == none) && KilledAC == none)
    {
        return;
    }
    // End:0x204
    if(KillerAC == KilledAC)
    {
        // End:0x1C4
        if(Class'Engine.wGameManager'.static.IsHumanTeamType(KilledPRI.eObjType))
        {
            GRI.AlienTeamCount = byte(Max(int(++GRI.AlienTeamCount), 0));
            GRI.HumanTeamCount = byte(Max(int(--GRI.HumanTeamCount), 0));
            KilledAC.ChangeTeam(1);
            // End:0x182
            if(DamageType != Class'Engine.Suicided')
            {
                KilledAC.ClientChangeTeam(4);
            }
            // End:0x19F
            if(GRI.bAlienAppeared == true)
            {
                bCheckSuperHeroCondition = true;
            }
            KilledPRI.SetObjType(3);
            KilledPRI.SetSkinType(0);            
        }
        else
        {
            // End:0x1EE
            if(KilledACPawn != none)
            {
                KilledACPawn.ChangeModelType(3, KilledPRI.eSkinType);
            }
        }
        KilledAC.UpdateHPValue(0, 3);        
    }
    else
    {
        // End:0x674
        if(KilledAC != none)
        {
            // End:0x4EC
            if(Class'Engine.wGameManager'.static.IsAlienTeamType(KilledPRI.eObjType))
            {
                MyCollisionPart = byte(CollisionPart);
                // End:0x2EE
                if((int(MyCollisionPart) == int(1)) || Class'Engine.wGameManager'.static.IsSuperHeroType(KillerPRI.eObjType))
                {
                    KilledAC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMHeadShotAlien, true);
                    KilledAC.PlayerReplicationInfo.bOutOfLives = true;
                    KilledAC.PlayerReplicationInfo.IsDead = true;
                    GRI.AlienTeamCount = byte(Max(int(--GRI.AlienTeamCount), 0));                    
                }
                else
                {
                    KilledPRI.SetObjType(3);
                    KilledAC.UpdateHPValue(KilledPRI.eSkinType, KilledPRI.eObjType);
                    // End:0x360
                    if(KilledACPawn != none)
                    {
                        KilledACPawn.ChangeModelType(KilledPRI.eObjType, KilledPRI.eSkinType);
                    }
                }
                lp1 = 0;
                J0x367:

                // End:0x3BC [Loop If]
                if(lp1 < KilledAC.SkillBase.Skills.Length)
                {
                    KilledAC.SkillBase.Skills[lp1].bUpdateProcess = false;
                    ++lp1;
                    // [Loop Continue]
                    goto J0x367;
                }
                ++GRI.CurAlienAttackBuffLevel;
                // End:0x411
                if(int(GRI.CurAlienAttackBuffLevel) > int(GRI.MaxAlienAttackBuffLevel))
                {
                    GRI.CurAlienAttackBuffLevel = GRI.MaxAlienAttackBuffLevel;                    
                }
                else
                {
                    // End:0x49D
                    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
                    {
                        // End:0x49C
                        if(ac != KilledAC)
                        {
                            PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
                            // End:0x49C
                            if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
                            {
                                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMAcquiredAttackBuff, true, int(GRI.CurAlienAttackBuffLevel));
                            }
                        }                        
                    }                    
                }
                iAttackLevelIndex = GRI.GetAttackLevelIndex();
                // End:0x4E9
                if((iAttackLevelIndex != -1) && iAttackLevelIndex != GRI.iPrevAlienAttackIndex)
                {
                    ChangeAttackLevel(byte(iAttackLevelIndex));
                }                
            }
            else
            {
                // End:0x560
                if(Class'Engine.wGameManager'.static.IsHeroType(KilledPRI.eObjType))
                {
                    // End:0x55F
                    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
                    {
                        // End:0x55E
                        if(ac != KilledAC)
                        {
                            ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMInfectdHero, true,,, KilledPRI.PlayerName);
                        }                        
                    }                    
                }
                // End:0x581
                if(KilledACPawn != none)
                {
                    KilledACPawn.ChangeModelType(3, 0);                    
                }
                else
                {
                    KilledPRI.SetObjType(3);
                    KilledPRI.SetSkinType(0);
                }
                KilledAC.ChangeTeam(1);
                KilledAC.ClientChangeTeam(4);
                KilledAC.UpdateHPValue(KilledPRI.eSkinType, KilledPRI.eObjType);
                ChangePawn(KilledAC);
                KilledAC.Pawn.FmodPlaySound(Class'WGame.wAlienMaleSoundGroup'.default.SndInfectionTransfer[int(KilledPRI.eSkinType)], 0,,, false);
                GRI.HumanTeamCount = byte(Max(int(--GRI.HumanTeamCount), 0));
                ++GRI.AlienTeamCount;
                bCheckSuperHeroCondition = true;
            }
        }
        // End:0x7BE
        if(((KillerAC != KilledAC) && KillerAC != none) && Class'Engine.wGameManager'.static.IsAlienTeamType(KillerPRI.eObjType))
        {
            Log((("[AlienLog] Killer : " $ string(KillerPRI.Name)) $ " Level : ") $ string(KillerAC.GetInfectionLevel()));
            // End:0x7BE
            if(KillerAC.AddInfectionLevel())
            {
                ChangePawn(KillerAC);
                KillerAC.Pawn.FmodPlaySound(Class'WGame.wAlienMaleSoundGroup'.default.SndInfectionTransfer[int(KillerPRI.eSkinType)], 0,,, false);
                // End:0x79B
                if(Class'Engine.wGameManager'.static.IsAlienType(KillerPRI.eObjType))
                {
                    KillerAC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTransformdHostAlien, true);                    
                }
                else
                {
                    KillerAC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTransformdMasterAlien, true);
                }
            }
        }
    }
    // End:0x80F
    if((int(GRI.GetCurTeamMemberCount(0)) == 0) || int(GRI.GetCurTeamMemberCount(1)) == 0)
    {
        __ProcessGameLogic__Delegate = InGameRoundEnd;
        GRI.bStopCountDown = true;        
    }
    else
    {
        // End:0x82B
        if((bIsSuperHeroTime == true) || bCheckSuperHeroCondition == false)
        {
            return;
        }
        lp1 = Level.GameMgr.GetMaxSuperHeroCount(GRI.iPlayingNum);
        // End:0xA7D
        if(int(GRI.GetCurTeamMemberCount(0)) <= lp1)
        {
            // End:0xA74
            foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
            {
                PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
                // End:0x8F0
                if(((PRI != none) && (PRI.IsConnected == false) || PRI.bPrecached == false) && PRI.IsDead == false)
                {
                    continue;                    
                }
                // End:0xA50
                if(!ac.IsInState('Spectating') && Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType) || Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
                {
                    PRI.SetObjType(2);
                    PRI.SetSkinType(3);
                    ac.UpdateHPValue(PRI.eSkinType, PRI.eObjType);
                    // End:0x9CD
                    if(ac.SkillBase.FindSkillByClassName('wSkill_NoTransferAlien') != none)
                    {
                        PRI.NoTransferAlienPoint += byte(1);
                    }
                    // End:0xA1F
                    if(wAMPawn(ac.Pawn) != none)
                    {
                        wAMPawn(ac.Pawn).ChangeModelType(PRI.eObjType, PRI.eSkinType);
                    }
                    ChangePawn(ac);
                    ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMYouwereSuperHero, true);
                    // End:0xA73
                    continue;
                }
                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMAppearSuperHero, true);                
            }            
            bIsSuperHeroTime = true;
        }
    }
    //return;    
}

function CalcPlayingUserCount(out int iHumanTeamCount, out int iAlienTeamCount)
{
    local wAlienController ac;
    local wAlienPlayerReplicationInfo PRI;

    iHumanTeamCount = 0;
    iAlienTeamCount = 0;
    // End:0xC6
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0x74
        if((PRI == none) || (PRI.IsDead == true) && PRI.bOutOfLives == true)
        {
            continue;            
        }
        // End:0x9E
        if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
        {
            ++iAlienTeamCount;
            // End:0xC5
            continue;
        }
        // End:0xC5
        if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
        {
            ++iHumanTeamCount;
        }        
    }    
    //return;    
}

function ChangePawn(PlayerController PC)
{
    local wAlienController ac;
    local wAMPawn P;
    local wAlienPlayerReplicationInfo PRI;

    Log("[wAlienGameInfo::ChangePawn] Call");
    ac = wAlienController(PC);
    PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
    P = wAMPawn(ac.Pawn);
    P.eAMPawnType = PRI.eObjType;
    P.LastStartTime = Level.TimeSeconds;
    P.AddDefaultInventory();
    // End:0xD8
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        P.ChangeModel();
    }
    // End:0x122
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        ac.ClientUpdate3rdModel(PRI.PlayerID, PRI.eObjType, PRI.eSkinType);        
    }    
    //return;    
}

function ChangeAttackLevel(byte byAttackLevelIndex)
{
    local wAlienController ac;

    // End:0x25
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        ac.ClientUpdateLevelup(byAttackLevelIndex);        
    }    
    //return;    
}

function ProcessDefSuccessFromInfection(int PlayerID)
{
    local wAlienController ac;

    // End:0x25
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        ac.ClientUpdateDefSuccessFromInfection(PlayerID);        
    }    
    //return;    
}

function ProcessQuickRepairByAlien(int PlayerID)
{
    local wAlienController ac;

    // End:0x25
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        ac.ClientQuickRepairByAlien(PlayerID);        
    }    
    //return;    
}

function CheckLastMan(int TeamIndex)
{
    super.CheckLastMan(0);
    //return;    
}

simulated function bool IsRespawnRestrictionTime()
{
    return false;
    //return;    
}

function bool CheckMaxLives(PlayerReplicationInfo Scorer)
{
    local wAlienGameReplicationInfo GRI;
    local PlayerReplicationInfo Living;
    local byte bOtherTeamNoneLeft;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x73
    if(int(GRI.RoundState) != int(1))
    {
        FindLiving(Living, bOtherTeamNoneLeft);
        // End:0x73
        if(int(bOtherTeamNoneLeft) == 1)
        {
            LeaveLogOtherTeamNoneLeft(Living);
            // End:0x67
            if(Living == none)
            {
                Living = Scorer;
            }
            return EndGameByTeamNoneLeft(Living);
        }
    }
    return false;
    //return;    
}

function CheckScore(PlayerReplicationInfo Scorer)
{
    //return;    
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    local wAlienGameReplicationInfo GRI;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x51
    if(int(GRI.HumanTeamCount) == 0)
    {
        EndRound(7, none, "MaxLive - Winner - AlienWin");
        return true;        
    }
    else
    {
        // End:0x8F
        if(int(GRI.AlienTeamCount) == 0)
        {
            EndRound(8, none, "MaxLive - Winner - HumanWin");
            return true;
        }
    }
    return false;
    //return;    
}

function CheckEndGameAfterRoundTimeOver()
{
    local bool bCheckIsHuman;
    local wAlienGameReplicationInfo GRI;

    bCheckIsHuman = false;
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    Log("[wAlienGameInfo::CheckEndGameAfterRoundTimeOver] call.");
    // End:0x70
    if(int(GRI.HumanTeamCount) > 0)
    {
        bCheckIsHuman = true;
    }
    // End:0x98
    if(bCheckIsHuman == true)
    {
        EndRound(8, none, "HumanTeam Wins");        
    }
    else
    {
        EndRound(7, none, "AlienTeam Wins");
    }
    //return;    
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType, optional int iWeaponType)
{
    // End:0x7B
    if(string(DamageType) ~= "WWeapons_Res.wWeaponRes_Artillery")
    {
        // End:0x7B
        if(injured.GetTeamNum() != Level.AirStrikeTeamIndex)
        {
            return super(DeathMatch).ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
        }
    }
    return super.ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
    //return;    
}

function bool CheckLives(PlayerReplicationInfo Scorer)
{
    local bool bCheckIsHuman;
    local wAlienGameReplicationInfo GRI;
    local int iHumanTeamCount, iAlienTeamCount, iCalcHumanTeamCount, iCalcAlienTeamCount;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x27
    if(GRI.bAlienAppeared == false)
    {
        return false;
    }
    iHumanTeamCount = int(GRI.GetCurTeamMemberCount(0));
    iAlienTeamCount = int(GRI.GetCurTeamMemberCount(1));
    // End:0x1AB
    if(Level.GetIsServiceBuild() == false)
    {
        CalcPlayingUserCount(iCalcHumanTeamCount, iCalcAlienTeamCount);
        // End:0x181
        if((iCalcHumanTeamCount != iHumanTeamCount) || iCalcAlienTeamCount != iAlienTeamCount)
        {
            Log((((((("[wAlienGameInfo::CheckLives] H1 : " $ string(iHumanTeamCount)) $ " H2 : ") $ string(iCalcHumanTeamCount)) $ " A1 : ") $ string(iAlienTeamCount)) $ " A2 : ") $ string(iCalcAlienTeamCount));
            Log_ControllerInfo();
            GRI.HumanTeamCount = byte(iCalcHumanTeamCount);
            GRI.AlienTeamCount = byte(iCalcAlienTeamCount);
            iHumanTeamCount = int(GRI.GetCurTeamMemberCount(0));
            iAlienTeamCount = int(GRI.GetCurTeamMemberCount(1));
            GRI.iPlayingNum = iHumanTeamCount + iAlienTeamCount;
        }
        // End:0x1AB
        if((GRI.iPlayingNum == 1) && (iHumanTeamCount + iAlienTeamCount) == 1)
        {
            return false;
        }
    }
    // End:0x224
    if((iHumanTeamCount == 0) || iAlienTeamCount == 0)
    {
        // End:0x1D9
        if(iHumanTeamCount == 0)
        {
            bCheckIsHuman = false;            
        }
        else
        {
            bCheckIsHuman = true;
        }
        // End:0x209
        if(bCheckIsHuman == true)
        {
            EndRound(8, none, "HumanTeam Wins");            
        }
        else
        {
            EndRound(7, none, "AlienTeam Wins");
        }
        return true;
    }
    return false;
    //return;    
}

function Log_ControllerInfo()
{
    local wAMPawn Pawn;
    local wAlienPlayerReplicationInfo PRI;

    Log("[wAlienGameInfo::Log_ControllerInfo] Log Print Start");
    // End:0x1A1
    foreach DynamicActors(Class'WMission_Decompressed.wAMPawn', Pawn)
    {
        PRI = wAlienPlayerReplicationInfo(Pawn.PlayerReplicationInfo);
        Log((((((((("PlayerName : " $ PRI.PlayerName) $ " eObjType : ") $ string(PRI.eObjType)) $ " SkinType : ") $ string(PRI.eSkinType)) $ " Team : ") $ string(PRI.Team.TeamIndex)) $ " BodyItemID : ") $ string(PRI.aiBodyItemID[0]));
        Log((((((("Dead : " $ string(PRI.IsDead)) $ " IsSpecator : ") $ string(PRI.bIsSpectator)) $ " Intervented : ") $ string(PRI.IsIntervented)) $ " Precached : ") $ string(PRI.bPrecached));        
    }    
    Log("[wAlienGameInfo::Log_ControllerInfo] Log Print End");
    //return;    
}

delegate ProcessGameLogic()
{
    //return;    
}

function InGameAppearAlien()
{
    local wAlienGameReplicationInfo GRI;
    local wGameManager GameMgr;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    GameMgr = Level.GameMgr;
    // End:0xD0
    if(GRI.WaitingForStart == false)
    {
        // End:0xA0
        if(GRI.iCurTimeOfAppearence >= 1)
        {
            // End:0x85
            if(GRI.iCurTimeOfAppearence == GameMgr.AlienGameParam.20)
            {
                GRI.bStopCountDown = false;
            }
            AlarmAppearAlien(4, GRI.iCurTimeOfAppearence--);            
        }
        else
        {
            // End:0xD0
            if(GRI.iCurTimeOfAppearence == 0)
            {
                StartAlienMode();
                __ProcessGameLogic__Delegate = InGameAlienMode;
                fCurSupplyItemDropTime = 0.0000000;
            }
        }
    }
    //return;    
}

function InGameAlienMode()
{
    local wAlienController ac;

    fCurSupplyItemDropTime += 1.0000000;
    // End:0x3B
    if(iMaxSupplyItemDropTryCount > iCurSupplyItemDropTryCount)
    {
        // End:0x3B
        if(fCurSupplyItemDropTime >= fMaxSupplyItemDropTime)
        {
            ExecuteItemDrop();
            fCurSupplyItemDropTime = 0.0000000;
        }
    }
    // End:0x167
    if((wAlienGameReplicationInfo(GameReplicationInfo).bSuperAlienAppeared == false) && (fSuperAlien_RemainingTime + 10.0000000) >= float(GetRemainingTime()))
    {
        // End:0x14E
        if((float(GetRemainingTime()) - fSuperAlien_RemainingTime) == float(0))
        {
            wAlienGameReplicationInfo(GameReplicationInfo).bSuperAlienAppeared = true;
            wAlienGameReplicationInfo(GameReplicationInfo).fAlienSpeedDelta *= Level.GameMgr.AlienGameParam.fSuperAlien_SpeedRatio;
            wAlienGameReplicationInfo(GameReplicationInfo).fAlienKnockBackDelta *= Level.GameMgr.AlienGameParam.fSuperAlien_KnockBackRatio;
            // End:0x14A
            foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
            {
                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMAppearSuperAlien, false);
                ac.ClientChangeSuperAlien();                
            }                        
        }
        else
        {
            AlarmAppearAlien(3, int(float(GetRemainingTime()) - fSuperAlien_RemainingTime));
        }
    }
    //return;    
}

function InGameRoundEnd()
{
    // End:0x19
    if(fCheckEndRoundTime >= 3.0000000)
    {
        CheckLives(none);        
    }
    else
    {
        fCheckEndRoundTime += 1.0000000;
    }
    //return;    
}

function AlarmAppearAlien(wGameManager.EAlienModeType eObjType, int iTimeCount)
{
    local PlayerController PC;

    // End:0x8F
    if(int(eObjType) == int(4))
    {
        // End:0x8B
        foreach DynamicActors(Class'Engine.PlayerController', PC)
        {
            PC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMReadyTimeCount, false, iTimeCount);
            PC.FmodClientPlaySound("Warfare_Sound_Alien_Mode/UI/UI_alien_countdown_01");            
        }                
    }
    else
    {
        // End:0x10A
        foreach DynamicActors(Class'Engine.PlayerController', PC)
        {
            PC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMReadyTimeCountSuperAlien, false, iTimeCount);
            PC.FmodClientPlaySound("Warfare_Sound_Alien_Mode/UI/UI_alien_countdown_01");            
        }        
    }
    //return;    
}

function ExecuteItemDrop()
{
    local PlayerController PC;
    local wSupplyRespawnPoint Point;
    local wRandomBonusPack ItemPack;
    local Vector loc;
    local int lp1, lp2, iMaxItemDropCount, iTryCount;

    iMaxItemDropCount = Min(iMaxSupplyItemDropMaxCount - SupplyedRespawnPoints.Length, iMaxSupplyItemDropOnetimeCount);
    lp2 = 0;
    iTryCount = 0;
    lp1 = 0;
    J0x2F:

    // End:0x96 [Loop If]
    if(lp1 < SupplyedRespawnPoints.Length)
    {
        // End:0x81
        if(SupplyedRespawnPoints[lp1].bSpawnDropItem == false)
        {
            SupplyRespawnPoints[SupplyRespawnPoints.Length] = SupplyedRespawnPoints[lp1];
            SupplyedRespawnPoints.Remove(lp1, 1);            
        }
        else
        {
            ++lp1;
        }
        lp1 = lp1;
        // [Loop Continue]
        goto J0x2F;
    }
    // End:0xA3
    if(iMaxItemDropCount <= 0)
    {
        return;
    }
    J0xA3:

    // End:0x1FA [Loop If]
    if(true)
    {
        // End:0xC4
        if((SupplyRespawnPoints.Length == 0) || iTryCount > 3)
        {
            // [Explicit Break]
            goto J0x1FA;
        }
        lp1 = Rand(SupplyRespawnPoints.Length);
        Point = SupplyRespawnPoints[lp1];
        // End:0xFB
        if(Point.bSpawnDropItem == true)
        {            
        }
        else
        {
            ItemPack = Spawn(Class'WMission_Decompressed.wRandomBonusPack',,, Point.Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)));
            // End:0x1DE
            if(ItemPack != none)
            {
                loc = Point.Location;
                loc.Z = Point.Location.Z - ItemPack.CollisionHeight;
                ItemPack.respawnPoint = Point;
                Point.bSpawnDropItem = true;
                ItemPack.InitDroppedPack();
                ++lp2;
                SupplyedRespawnPoints[SupplyedRespawnPoints.Length] = SupplyRespawnPoints[lp1];
                SupplyRespawnPoints.Remove(lp1, 1);                
            }
            else
            {
                ++iTryCount;
            }
            // End:0x1F7
            if(iMaxItemDropCount <= lp2)
            {
                // [Explicit Break]
                goto J0x1FA;
            }
        }
        // [Loop Continue]
        goto J0xA3;
    }
    J0x1FA:

    // End:0x24E
    if(lp2 > 0)
    {
        // End:0x24D
        foreach DynamicActors(Class'Engine.PlayerController', PC)
        {
            PC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMDropRandomItemBox, true);
            PC.FmodClientPlaySound(sndDropRandomItemBox);            
        }        
    }
    //return;    
}

function ResetItemDrop()
{
    J0x00:
    // End:0x3E [Loop If]
    if(SupplyedRespawnPoints.Length != 0)
    {
        SupplyedRespawnPoints[0].bSpawnDropItem = false;
        SupplyRespawnPoints[SupplyRespawnPoints.Length] = SupplyedRespawnPoints[0];
        SupplyedRespawnPoints.Remove(0, 1);
        // [Loop Continue]
        goto J0x00;
    }
    //return;    
}

function bool IsRoundLimitReached()
{
    return int(CurrentRound) >= MaxRounds;
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int ScoringTeam;
    local wAlienController ac;
    local wAlienPlayerReplicationInfo PRI;

    // End:0x1A
    if(!IsPlaying() || ResetCountDown > 0)
    {
        return;
    }
    Log((("[wAlienGameInfo::EndRound] - Reason:" @ Reason) @ " RoundEndReason=") $ string(RoundEndReason));
    GameReplicationInfo.SyncRemainingTime();
    NotifyEndRound();
    wMSGameReplicationInfo(GameReplicationInfo).RoundState = 1;
    GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    GameReplicationInfo.bStopCountDown = true;
    // End:0xDE
    if(int(RoundEndReason) == int(7))
    {
        ScoringTeam = 1;        
    }
    else
    {
        // End:0xF5
        if(int(RoundEndReason) == int(8))
        {
            ScoringTeam = 0;
        }
    }
    SetRoundWinner(ScoringTeam);
    wMSGameReplicationInfo(GameReplicationInfo).ScoringTeam = ScoringTeam;
    wMSGameReplicationInfo(GameReplicationInfo).fEndRoundTime = float(RemainingTime);
    TriggerEvent('EndRound', self, Instigator);
    ProcessEndGame();
    // End:0x1BC
    if(IsRoundLimitReached())
    {
        Log("EndRound->EndGame - roundlimit");
        EndGame(none, "roundlimit");
        // End:0x1AB
        if(bGameEnded)
        {
            SetGameEndType("roundlimit");
            GotoState('MatchOver');
        }
        GameReplicationInfo.RoundState = 3;
    }
    QueueAnnouncerSound(NewRoundSound, 1, byte(255));
    ResetCountDown = ResetTimeDelay + 1;
    wAlienGameReplicationInfo(GameReplicationInfo).bAlienAppeared = false;
    wAlienGameReplicationInfo(GameReplicationInfo).CurAlienAttackBuffLevel = 0;
    wAlienGameReplicationInfo(GameReplicationInfo).iCurTimeOfAppearence = Level.GameMgr.AlienGameParam.20;
    // End:0x260
    if(!bSentEndRound)
    {
        ServerLogEndRound(RoundEndReason, Instigator, Reason);
        bSentEndRound = true;
    }
    Log("[wAlienGameInfo::EndRound] CurRound : " $ string(wAlienGameReplicationInfo(GameReplicationInfo).CurrentRound));
    // End:0x3A0
    if(bGameEnded == false)
    {
        Log("[wAlienGameInfo::EndRound] Init PlayerEquipInfo()");
        // End:0x368
        foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
        {
            PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
            PRI.SetSkinType(0);
            ac.SetPlayerEquipInfo();
            ac.ChangeTeam(0);
            Log(("Name : " $ PRI.PlayerName) $ " Init Success");            
        }        
        Log("[wAlienGameInfo::EndRound] Finish PlayerEquipInfo()");
    }
    //return;    
}

function InitializeEveryPlayerStarts()
{
    local PlayerStart N;
    local PlayerStart_SD S;
    local wSupplyRespawnPoint P;

    Log("[GameInfo::InitializeEveryPlayerStarts]");
    EveryPlayerStarts.Length = 0;
    // End:0x78
    foreach AllActors(Class'Engine.PlayerStart', N)
    {
        // End:0x77
        if((IsAppropriateRespawnPoint(N, 0)) || IsAppropriateRespawnPoint(N, 1))
        {
            EveryPlayerStarts[EveryPlayerStarts.Length] = N;
        }        
    }    
    EverySDPlayerStarts.Length = 0;
    // End:0xA4
    foreach AllActors(Class'Engine.PlayerStart_SD', S)
    {
        EverySDPlayerStarts[EverySDPlayerStarts.Length] = S;        
    }    
    SupplyRespawnPoints.Length = 0;
    // End:0xD0
    foreach AllActors(Class'Engine.wSupplyRespawnPoint', P)
    {
        SupplyRespawnPoints[SupplyRespawnPoints.Length] = P;        
    }    
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint N;
    local wAlienController ac;
    local wAlienPlayerReplicationInfo PRI;
    local wAlienGameReplicationInfo GRI;

    Log("[wAlienGameInfo::FindPlayerStart] InTeam : " $ string(inTeam));
    N = none;
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x82
    if(Player == none)
    {
        N = FindAlienModeStart(false);
        // End:0x7F
        if(N == none)
        {
            N = FindAlienModeStart(true);
        }        
    }
    else
    {
        ac = wAlienController(Player);
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0xEF
        if((GRI.bAlienAppeared == true) && Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
        {
            N = FindAlienModeStart(true);
        }
        // End:0x129
        if((N == none) || Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
        {
            N = FindAlienModeStart(false);
        }
    }
    return N;
    //return;    
}

function NavigationPoint FindAlienModeStart(bool bAlien)
{
    local NavigationPoint N;
    local array<PlayerStart> candidates;
    local int lp1;

    N = none;
    candidates.Length = 0;
    // End:0x85
    if(bAlien == true)
    {
        lp1 = 0;
        J0x22:

        // End:0x82 [Loop If]
        if(lp1 < EveryPlayerStarts.Length)
        {
            // End:0x78
            if(!IsRespawnPointFailedRecently(EveryPlayerStarts[lp1]) && !IsAnyPawnWithinRadius(EveryPlayerStarts[lp1]))
            {
                candidates[candidates.Length] = EveryPlayerStarts[lp1];
            }
            ++lp1;
            // [Loop Continue]
            goto J0x22;
        }        
    }
    else
    {
        lp1 = 0;
        J0x8C:

        // End:0xEC [Loop If]
        if(lp1 < EverySDPlayerStarts.Length)
        {
            // End:0xE2
            if(!IsRespawnPointFailedRecently(EverySDPlayerStarts[lp1]) && !IsAnyPawnWithinRadius(EverySDPlayerStarts[lp1]))
            {
                candidates[candidates.Length] = EverySDPlayerStarts[lp1];
            }
            ++lp1;
            // [Loop Continue]
            goto J0x8C;
        }
    }
    // End:0x10F
    if(candidates.Length > 0)
    {
        N = candidates[Rand(candidates.Length)];        
    }
    else
    {
        Log("[wAlienGameInfo::FindAlienModeStart] Fail, bAlien : " $ string(bAlien));
    }
    return N;
    //return;    
}

function bool ProcessSwitchTeam(bool bNoReset)
{
    return false;
    //return;    
}

function bool NeedPlayers()
{
    return false;
    //return;    
}

function float GetAttackBuff()
{
    local float fAttackBuff;
    local wGameManager GameMgr;
    local wAlienGameReplicationInfo GRI;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    GameMgr = Level.GameMgr;
    // End:0x60
    if(int(GRI.CurAlienAttackBuffLevel) >= 1)
    {
        fAttackBuff = GameMgr.GetAlienGameAttackBuff(GRI.CurAlienAttackBuffLevel);        
    }
    else
    {
        fAttackBuff = 0.0000000;
    }
    return fAttackBuff;
    //return;    
}

function ServerLogEndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int endType, winTeam, winTeamAD, Players, fEndTime;

    local wGameManager GameMgr;
    local wAlienGameReplicationInfo GRI;

    GameMgr = Level.GameMgr;
    Players = CountPlayers();
    winTeam = GetWinTeam(RoundEndReason);
    winTeamAD = GetWinTeamAD(winTeam);
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    endType = GetRoundEndType(RoundEndReason);
    fEndTime = Max(0, RoundStartTime - RemainingTime);
    Log((((((((((((((((((string(self) $ "[BTSend.sfReqLogEndEachRound] StartPlayerCount=") $ string(GRI.iPlayingNum)) $ " players=") $ string(Players)) $ " endType=") $ string(endType)) $ " endTime=") $ string(EndTime)) $ " winTeam=") $ string(winTeam)) $ " winTeamAD=") $ string(winTeamAD)) $ " Teams[0].Score=") $ string(Teams[0].Score)) $ " Teams[1].Score=") $ string(Teams[1].Score)) $ " CurrentRound=") $ string(CurrentRound));
    BTSend.sfReqLogEndEachRound(GRI.iPlayingNum, Players, endType, fEndTime, byte(winTeam), byte(winTeamAD), int(Teams[0].Score), int(Teams[1].Score), int(CurrentRound));
    //return;    
}

function int GetRoundEndType(wMSGameInfo.ERER_Reason RoundEndReason)
{
    // End:0x16
    if(int(RoundEndReason) == int(7))
    {
        return 2;        
    }
    else
    {
        // End:0x2B
        if(int(RoundEndReason) == int(8))
        {
            return 1;            
        }
        else
        {
            return -1;
        }
    }
    //return;    
}

function int GetWinTeam(wMSGameInfo.ERER_Reason RoundEndReason)
{
    // End:0x15
    if(int(RoundEndReason) == int(7))
    {
        return 1;        
    }
    else
    {
        // End:0x2A
        if(int(RoundEndReason) == int(8))
        {
            return 0;            
        }
        else
        {
            return 0;
        }
    }
    //return;    
}

function int GetWinTeamAD(int winTeam)
{
    // End:0x16
    if(winTeam == int(CurrentAttackingTeam))
    {
        return 1;        
    }
    else
    {
        return 2;
    }
    //return;    
}

exec function AlienGame_Exit()
{
    CurrentRound = byte(MaxRounds);
    bGameEnded = true;
    EndRound(7, none, "Console Input");
    //return;    
}

exec function AlienGame_AlienWin()
{
    EndRound(7, none, "Console Input");
    //return;    
}

exec function AlienGame_HumanWin()
{
    EndRound(8, none, "Console Input");
    //return;    
}

exec function AlienGame_TimeOver()
{
    SetRemainingTime(0);
    //return;    
}

exec function AlienGame_Respawn(int Num)
{
    local wAlienController ac;
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x6F [Loop If]
    if(C != none)
    {
        ac = wAlienController(C);
        // End:0x58
        if((ac != none) && ac == Level.GetLocalPlayerController())
        {
            // [Explicit Break]
            goto J0x6F;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    J0x6F:

    ac.Pawn.SetLocation(EverySDPlayerStarts[Num].Location);
    ac.Pawn.SetRotation(EverySDPlayerStarts[Num].Rotation);
    clog((((("Respawn location[x,y,z] : " $ string(EverySDPlayerStarts[Num].Location.X)) $ " , ") $ string(EverySDPlayerStarts[Num].Location.Y)) $ " , ") $ string(EverySDPlayerStarts[Num].Location.Z));
    clog((((("Respawn Rotation[Pitch,Yaw,Roll] : " $ string(EverySDPlayerStarts[Num].Rotation.Pitch)) $ " , ") $ string(EverySDPlayerStarts[Num].Rotation.Yaw)) $ " , ") $ string(EverySDPlayerStarts[Num].Rotation.Roll));
    //return;    
}

exec function AlienGame_AttackLevelup()
{
    local wAlienGameReplicationInfo GRI;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    GRI.CurAlienAttackBuffLevel++;
    //return;    
}

exec function AlienGame_AlienLevelup()
{
    local wAlienController ac;
    local Controller C;

    ac = none;
    C = Level.ControllerList;
    J0x1B:

    // End:0xAE [Loop If]
    if(C != none)
    {
        ac = wAlienController(C);
        // End:0x97
        if(Class'Engine.wGameManager'.static.IsAlienType(wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo).eObjType) || Class'Engine.wGameManager'.static.IsAlienHostType(wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo).eObjType))
        {
            // [Explicit Break]
            goto J0xAE;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1B;
    }
    J0xAE:

    // End:0xD8
    if((ac != none) && ac.AddInfectionLevel())
    {
        ChangePawn(ac);
    }
    //return;    
}

exec function AlienGame_SuperHero()
{
    local wAlienController ac;
    local wAlienPlayerReplicationInfo PRI;

    // End:0xFE
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0xFD
        if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
        {
            // End:0x7F
            if(ac.SkillBase.FindSkillByClassName('wSkill_NoTransferAlien') != none)
            {
                PRI.NoTransferAlienPoint += byte(1);
            }
            PRI.SetObjType(2);
            PRI.SetSkinType(3);
            ac.UpdateHPValue(PRI.eSkinType, PRI.eObjType);
            ChangePawn(ac);
            ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMYouwereSuperHero, true);
            // End:0xFE
            break;
        }        
    }    
    //return;    
}

exec function AlienGame_Hero()
{
    local wAlienController ac;
    local wAlienPlayerReplicationInfo PRI;

    // End:0xB8
    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
    {
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMSelectedHero, true,,, PRI.PlayerName);
        PRI.SetObjType(1);
        PRI.SetSkinType(2);
        ac.UpdateHPValue(PRI.eSkinType, PRI.eObjType);
        ChangePawn(ac);
        // End:0xB8
        break;        
    }    
    //return;    
}

exec function AlienGame_MagicTime(int RemainTime)
{
    SetRemainingTime(RemainTime);
    //return;    
}

exec function AlienGame_SinTime()
{
    local wAlienGameReplicationInfo GRI;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    GRI.bStopCountDown = !GRI.bStopCountDown;
    __ProcessGameLogic__Delegate = InGameAlienMode;
    //return;    
}

function bool IsRightTimeForRespawn(Controller C)
{
    local wAlienController ac;
    local wAlienGameReplicationInfo GRI;
    local wAlienPlayerReplicationInfo PRI;

    // End:0x12
    if(!super(GameInfo).IsRightTimeForRespawn(C))
    {
        return false;
    }
    // End:0x1F
    if(RoundTimeLimit <= 0)
    {
        return false;
    }
    // End:0x3A
    if(int(GameReplicationInfo.RoundState) == int(1))
    {
        return false;
    }
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x22D
    if(((C.PlayerReplicationInfo != none) && !Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(C.PlayerReplicationInfo).eObjType)) && GRI.IsCanRespawnTime() == false)
    {
        ac = wAlienController(C);
        ac.DoServerViewNextPlayer = true;
        ac.GotoState('Spectating');
        ac.PlayerReplicationInfo.bOutOfLives = true;
        ac.PlayerReplicationInfo.IsDead = true;
        // End:0x22B
        if(!Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(C.PlayerReplicationInfo).eObjType))
        {
            GRI.HumanTeamCount = 0;
            GRI.AlienTeamCount = 0;
            // End:0x22A
            foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
            {
                PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
                // End:0x196
                if(PRI == none)
                {
                    continue;                    
                }
                // End:0x1C6
                if((PRI.bOutOfLives == true) && PRI.IsDead == true)
                {
                    continue;                    
                }
                // End:0x1F9
                if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
                {
                    ++GRI.AlienTeamCount;
                    // End:0x229
                    continue;
                }
                // End:0x229
                if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
                {
                    ++GRI.HumanTeamCount;
                }                
            }            
        }
        return false;
    }
    return true;
    //return;    
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
    // End:0x0D
    if(ViewTarget == none)
    {
        return false;
    }
    // End:0x66
    if(bOnlySpectator)
    {
        // End:0x61
        if(Controller(ViewTarget) != none)
        {
            return (Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
        }
        return true;        
    }
    else
    {
        // End:0x15A
        if(Controller(ViewTarget) != none)
        {
            // End:0x11F
            if(Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(Viewer.PlayerReplicationInfo).eObjType) == true)
            {
                return ((Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator) && Controller(ViewTarget).PlayerReplicationInfo.Team == Viewer.PlayerReplicationInfo.Team;                
            }
            else
            {
                return (Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
            }
        }
    }
    return false;
    //return;    
}

function bool IsAnyPawnWithinRadius(NavigationPoint N)
{
    local int lp1;
    local float dist, PAWN_RADIUS;
    local Pawn P;

    PAWN_RADIUS = Class'WGame.wPawn'.default.CollisionRadius;
    lp1 = 0;
    J0x1B:

    // End:0x8F [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        dist = VSize(P.Location - N.Location);
        // End:0x85
        if(dist < PAWN_RADIUS)
        {
            return true;
        }
        lp1++;
        // [Loop Continue]
        goto J0x1B;
    }
    return false;
    //return;    
}

function SetAssistPoint(Controller Killer, Controller Other)
{
    //return;    
}

function AnnounceMatchInfo()
{
    //return;    
}

state MatchInProgress
{
    function ProcessEndRound()
    {
        // End:0x15
        if((GetRemainingTime()) <= 0)
        {
            CheckEndGameAfterRoundTimeOver();            
        }
        else
        {
            ProcessGameLogic();
        }
        //return;        
    }

    function ProcessResetCountDown()
    {
        local wAlienController ac;
        local wAlienPlayerReplicationInfo PRI;

        super.ProcessResetCountDown();
        // End:0x4D
        if(ResetCountDown == 1)
        {
            // End:0x4C
            foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
            {
                PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
                PRI.SetObjType(0);                
            }            
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    sndDropRandomItemBox="Warfare_Sound_Alien_Mode/UI/UI_alien_dropitem_01"
    DefaultMaxLives=0
    DefaultPlayerClassName="WMission.wAMPawn"
    ScoreBoardType="wMission.xScoreBoardAlienGame"
    HUDType="wMission.wHUD_Alien"
    MutatorClass="wMission.wAlienGameMutator"
    PlayerControllerClassName="WMission.wAlienController"
    GameReplicationInfoClass=Class'WMission_Decompressed.wAlienGameReplicationInfo'
    bHasRespawnRestriction=false
}