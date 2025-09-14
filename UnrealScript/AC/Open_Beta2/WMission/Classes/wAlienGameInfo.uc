class wAlienGameInfo extends wMSGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MAX_WAIT_END_ROUND_TIME = 10.0f;

var array<wSupplyRespawnPoint> SupplyRespawnPoints;
var array<wSupplyRespawnPoint> SupplyedRespawnPoints;
var float fCurSupplyItemDropTime;
var float fMaxSupplyItemDropTime;
var int iCurSupplyItemDropTryCount;
var int iMaxSupplyItemDropOnetimeCount;
var int iMaxSupplyItemDropMaxCount;
var int iMaxSupplyItemDropTryCount;
var bool bSentEndRound;
var float fCheckEndRoundTime;
var string sndInfectionTransfer;
var string sndDropRandomItemBox;
//var delegate<ProcessGameLogic> __ProcessGameLogic__Delegate;

event InitGame(string Options, out string Error)
{
    local wAlienGameReplicationInfo GRI;

    super.InitGame(Options, Error);
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    MaxRounds = ScoreLimit;
    CurrentAttackingTeam = 1;
    fMaxSupplyItemDropTime = Level.GameMgr.AlienGameParam.AlienSupplyPackDropTime;
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
    local Controller C;
    local wAlienController ac;

    // End:0x109
    if(bNoReset == false)
    {
        GameMgr = Level.GameMgr;
        GRI = wAlienGameReplicationInfo(GameReplicationInfo);
        __ProcessGameLogic__Delegate = InGameAppearAlien;
        fCheckEndRoundTime = 0.0000000;
        GRI.HumanTeamCount = byte(GetNumPlayers());
        GRI.AlienTeamCount = 0;
        C = Level.ControllerList;
        J0x82:

        // End:0x109 [Loop If]
        if(C != none)
        {
            // End:0xF2
            if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.bOnlySpectator == false)
            {
                ac = wAlienController(C);
                ac.SetAlienModeType(0);
                ac.ChangeTeam(0);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x82;
        }
    }
    super.BeginRound(bNoReset);
    // End:0x158
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
    C = Level.ControllerList;
    J0x59:

    // End:0xC6 [Loop If]
    if(C != none)
    {
        // End:0xAF
        if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.bOnlySpectator == false)
        {
            ACList[ACList.Length] = wAlienController(C);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x59;
    }
    GRI.iPlayingNum = int(GRI.HumanTeamCount);
    // End:0x17E
    if(GRI.iPlayingNum >= 12)
    {
        iMaxSupplyItemDropMaxCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackDropMaxCount[2]);
        iMaxSupplyItemDropOnetimeCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackOneTimeCount[2]);
        iMaxSupplyItemDropTryCount = int(Level.GameMgr.AlienGameParam.AlienSupplyPackDropTryCount[2]);        
    }
    else
    {
        // End:0x214
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
    J0x2F2:

    // End:0x3DF [Loop If]
    if(i < iAlienNum)
    {
        idx = Rand(ACList.Length);
        PRI = wAlienPlayerReplicationInfo(ACList[idx].PlayerReplicationInfo);
        // End:0x3D5
        if(Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
        {
            ACList[idx].SetAlienModeType(3);
            ACList[idx].ClientChangeTeam(4);
            ACList.Remove(idx, 1);
            Log("[AlienLog] StartAlienMode :EAM_ALIEN_HOST");
            ++GRI.AlienTeamCount;
            --GRI.HumanTeamCount;
        }
        ++i;
        // [Loop Continue]
        goto J0x2F2;
    }
    iHeroNum = Min(ACList.Length, iHeroNum);
    i = 0;
    J0x3F9:

    // End:0x4AF [Loop If]
    if(i < iHeroNum)
    {
        idx = Rand(ACList.Length);
        PRI = wAlienPlayerReplicationInfo(ACList[idx].PlayerReplicationInfo);
        // End:0x4A5
        if(Class'Engine.wGameManager'.static.IsHumanType(PRI.eObjType))
        {
            ACList[idx].SetAlienModeType(1);
            ACList.Remove(idx, 1);
            Log("[AlienLog] StartAlienMode :EAM_HUMAN_HERO");
        }
        ++i;
        // [Loop Continue]
        goto J0x3F9;
    }
    C = Level.ControllerList;
    J0x4C3:

    // End:0x545 [Loop If]
    if(C != none)
    {
        ac = wAlienController(C);
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0x52E
        if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
        {
            strHeroName = PRI.PlayerName;
            // [Explicit Break]
            goto J0x545;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x4C3;
    }
    J0x545:

    idx = 0;
    J0x54C:

    // End:0x5A8 [Loop If]
    if(idx < ACList.Length)
    {
        // End:0x59E
        if(ACList[idx].PlayerReplicationInfo.Team.TeamIndex == 1)
        {
            ACList[idx].ChangeTeam(0);
        }
        ++idx;
        // [Loop Continue]
        goto J0x54C;
    }
    C = Level.ControllerList;
    J0x5BC:

    // End:0x770 [Loop If]
    if(C != none)
    {
        ac = wAlienController(C);
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0x759
        if(((ac != none) && PRI != none) && PRI.IsConnected == true)
        {
            // End:0x67C
            if(Class'Engine.wGameManager'.static.IsAlienHostType(PRI.eObjType))
            {
                ac.ChangeTeam(int(CurrentAttackingTeam));
                ChangePawn(ac);
                ac.FmodPlaySound(sndInfectionTransfer, 0,,, false);                
            }
            else
            {
                // End:0x6A7
                if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
                {
                    ChangePawn(ac);
                }
            }
            // End:0x723
            if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
            {
                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMAppearHostAlien, true);
                // End:0x720
                if(strHeroName != "")
                {
                    ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMSelectedHero, true,,, strHeroName);
                }                
            }
            else
            {
                // End:0x759
                if(strHeroName != "")
                {
                    ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMSelectedHero, true,,, strHeroName);
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x5BC;
    }
    //return;    
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local wAlienController ac;
    local PlayerController PC;
    local Pawn P;
    local Actor.CollisionPartsType MyCollisionPart;
    local wAlienGameReplicationInfo GRI;
    local wAlienPlayerReplicationInfo PRI;
    local int iAttackLevelIndex, lp1;

    super.Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType, bWallShot);
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x127
    if(Killer == Killed)
    {
        ac = wAlienController(Killed);
        PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
        // End:0x114
        if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
        {
            GRI.AlienTeamCount = byte(Max(int(++GRI.AlienTeamCount), 0));
            GRI.HumanTeamCount = byte(Max(int(--GRI.HumanTeamCount), 0));
            ac.ChangeTeam(int(CurrentAttackingTeam));
            // End:0x114
            if(DamageType != Class'Engine.Suicided')
            {
                ac.ClientChangeTeam(4);
            }
        }
        ac.SetAlienModeType(2);
        return;
    }
    ac = wAlienController(Killed);
    PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
    // End:0x51C
    if(ac != none)
    {
        // End:0x413
        if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
        {
            MyCollisionPart = byte(CollisionPart);
            // End:0x239
            if(int(MyCollisionPart) == int(1))
            {
                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMHeadShotAlien, true);
                ac.DoServerViewNextPlayer = true;
                ac.PlayerReplicationInfo.bOutOfLives = true;
                ac.PlayerReplicationInfo.IsDead = true;
                ac.GotoState('Spectating');
                GRI.AlienTeamCount = byte(Max(int(--GRI.AlienTeamCount), 0));                
            }
            else
            {
                ac.SetAlienModeType(2);
                // End:0x282
                if(wAMPawn(ac.Pawn) != none)
                {
                    wAMPawn(ac.Pawn).ChangeModelType(2);
                }
            }
            lp1 = 0;
            J0x289:

            // End:0x2DE [Loop If]
            if(lp1 < ac.SkillBase.Skills.Length)
            {
                ac.SkillBase.Skills[lp1].bUpdateProcess = false;
                ++lp1;
                // [Loop Continue]
                goto J0x289;
            }
            ++GRI.CurAlienAttackBuffLevel;
            // End:0x333
            if(int(GRI.CurAlienAttackBuffLevel) > int(GRI.MaxAlienAttackBuffLevel))
            {
                GRI.CurAlienAttackBuffLevel = GRI.MaxAlienAttackBuffLevel;                
            }
            else
            {
                // End:0x3C4
                foreach DynamicActors(Class'Engine.PlayerController', PC)
                {
                    // End:0x3C3
                    if(PC != ac)
                    {
                        PRI = wAlienPlayerReplicationInfo(wAlienController(PC).PlayerReplicationInfo);
                        // End:0x3C3
                        if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
                        {
                            PC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMAcquiredAttackBuff, true, int(GRI.CurAlienAttackBuffLevel));
                        }
                    }                    
                }                
            }
            iAttackLevelIndex = GRI.GetAttackLevelIndex();
            // End:0x410
            if((iAttackLevelIndex != -1) && iAttackLevelIndex != GRI.iPrevAlienAttackIndex)
            {
                ChangeAttackLevel(byte(iAttackLevelIndex));
            }            
        }
        else
        {
            // End:0x490
            if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
            {
                // End:0x48F
                foreach DynamicActors(Class'Engine.PlayerController', PC)
                {
                    // End:0x48E
                    if(PC != ac)
                    {
                        PC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMInfectdHero, true,,, ac.PlayerReplicationInfo.PlayerName);
                    }                    
                }                
            }
            ac.ChangeTeam(1);
            ac.SetAlienModeType(2);
            ChangePawn(ac);
            ac.ClientChangeTeam(4);
            ac.FmodPlaySound(sndInfectionTransfer, 0,,, false);
            GRI.HumanTeamCount = byte(Max(int(--GRI.HumanTeamCount), 0));
            ++GRI.AlienTeamCount;
        }
    }
    ac = wAlienController(Killer);
    PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
    // End:0x675
    if(((Killer != Killed) && ac != none) && Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        Log((("[AlienLog] Killer : " $ string(ac.PlayerReplicationInfo.Name)) $ " Level : ") $ string(ac.GetInfectionLevel()));
        // End:0x675
        if(ac.AddInfectionLevel())
        {
            ChangePawn(ac);
            ac.FmodPlaySound(sndInfectionTransfer, 0,,, false);
            // End:0x652
            if(Class'Engine.wGameManager'.static.IsAlienType(PRI.eObjType))
            {
                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTransformdHostAlien, true);                
            }
            else
            {
                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTransformdMasterAlien, true);
            }
        }
    }
    // End:0x6C3
    if((int(GRI.GetCurTeamMemberCount(0)) == 0) || int(GRI.GetCurTeamMemberCount(1)) == 0)
    {
        __ProcessGameLogic__Delegate = InGameRoundEnd;
        GRI.bStopCountDown = true;
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
        ac.ClientUpdate3rdModel(PRI.PlayerID, PRI.eObjType, PRI.bySkinID);        
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
        ac.ClientUpdateDefSuccessFromInfection(PlayerID);        
    }    
    //return;    
}

function CheckLastMan(int TeamIndex)
{
    // End:0x16
    if(TeamIndex == 0)
    {
        super.CheckLastMan(TeamIndex);
    }
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
    local int InstigatorTeam;

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
    local int iHumanTeamCount, iAlienTeamCount;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x27
    if(GRI.bAlienAppeared == false)
    {
        return false;
    }
    iHumanTeamCount = int(GRI.GetCurTeamMemberCount(0));
    iAlienTeamCount = int(GRI.GetCurTeamMemberCount(1));
    // End:0x96
    if(Level.GetIsServiceBuild() == false)
    {
        // End:0x96
        if((GRI.iPlayingNum == 1) && (iHumanTeamCount + iAlienTeamCount) == 1)
        {
            return false;
        }
    }
    // End:0x10F
    if((iHumanTeamCount == 0) || iAlienTeamCount == 0)
    {
        // End:0xC4
        if(iHumanTeamCount == 0)
        {
            bCheckIsHuman = false;            
        }
        else
        {
            bCheckIsHuman = true;
        }
        // End:0xF4
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

delegate ProcessGameLogic()
{
    //return;    
}

function InGameAppearAlien()
{
    local PlayerController PC;
    local wAlienGameReplicationInfo GRI;
    local wGameManager GameMgr;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    GameMgr = Level.GameMgr;
    // End:0x14D
    if(GRI.WaitingForStart == false)
    {
        // End:0x11D
        if(GRI.iCurTimeOfAppearence >= 1)
        {
            // End:0x85
            if(GRI.iCurTimeOfAppearence == GameMgr.AlienGameParam.20)
            {
                GRI.bStopCountDown = false;
            }
            // End:0x109
            foreach DynamicActors(Class'Engine.PlayerController', PC)
            {
                PC.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMReadyTimeCount, false, GRI.iCurTimeOfAppearence);
                PC.FmodClientPlaySound("Warfare_Sound_Alien_Mode/UI/UI_alien_countdown_01");                
            }            
            GRI.iCurTimeOfAppearence--;            
        }
        else
        {
            // End:0x14D
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
    //return;    
}

function InGameRoundEnd()
{
    // End:0x19
    if(fCheckEndRoundTime >= 10.0000000)
    {
        CheckLives(none);        
    }
    else
    {
        fCheckEndRoundTime += 1.0000000;
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
    local Controller C;
    local wAlienController ac;
    local int ScoringTeam;

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

exec function AlienGame_Levelup()
{
    local wAlienGameReplicationInfo GRI;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    GRI.CurAlienAttackBuffLevel++;
    //return;    
}

function bool IsRightTimeForRespawn(Controller C)
{
    local wAlienController ac;
    local wAlienGameReplicationInfo GRI;
    local wAlienPlayerReplicationInfo PRI;
    local int iAttackLevelIndex;

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
    // End:0x215
    if(((C.PlayerReplicationInfo != none) && !Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(C.PlayerReplicationInfo).eObjType)) && GRI.IsCanRespawnTime() == false)
    {
        ac = wAlienController(C);
        ac.DoServerViewNextPlayer = true;
        ac.GotoState('Spectating');
        ac.PlayerReplicationInfo.bOutOfLives = true;
        ac.PlayerReplicationInfo.IsDead = true;
        // End:0x213
        if(!Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(C.PlayerReplicationInfo).eObjType))
        {
            GRI.HumanTeamCount = 0;
            GRI.AlienTeamCount = 0;
            // End:0x212
            foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
            {
                // End:0x186
                if(ac.IsInState('Spectating'))
                {
                    continue;                    
                }
                PRI = wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo);
                // End:0x1AE
                if(PRI == none)
                {
                    continue;                    
                }
                // End:0x1E1
                if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
                {
                    ++GRI.AlienTeamCount;
                    // End:0x211
                    continue;
                }
                // End:0x211
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
    // End:0x63
    if(bOnlySpectator)
    {
        // End:0x61
        if(Controller(ViewTarget) != none)
        {
            return (Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
        }
        return true;
    }
    // End:0x157
    if(Controller(ViewTarget) != none)
    {
        // End:0x11C
        if(Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(Viewer.PlayerReplicationInfo).eObjType) == true)
        {
            return ((Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator) && Controller(ViewTarget).PlayerReplicationInfo.Team == Viewer.PlayerReplicationInfo.Team;            
        }
        else
        {
            return (Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
        }
    }
    // End:0x1EC
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(wAlienPlayerReplicationInfo(Viewer.PlayerReplicationInfo).eObjType) == true)
    {
        return ((Pawn(ViewTarget) != none) && Pawn(ViewTarget).IsPlayerPawn()) && Pawn(ViewTarget).PlayerReplicationInfo.Team == Viewer.PlayerReplicationInfo.Team;        
    }
    else
    {
        return (Pawn(ViewTarget) != none) && Pawn(ViewTarget).IsPlayerPawn();
    }
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
        local Controller C;
        local wAlienController ac;

        super.ProcessResetCountDown();
        // End:0x85
        if(ResetCountDown == 1)
        {
            C = Level.ControllerList;
            J0x25:

            // End:0x85 [Loop If]
            if(C != none)
            {
                ac = wAlienController(C);
                ac.SetPlayerEquipInfo();
                wAlienPlayerReplicationInfo(ac.PlayerReplicationInfo).bySkinID = 1;
                C = C.nextController;
                // [Loop Continue]
                goto J0x25;
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    sndInfectionTransfer="Warfare_Sound_Alien_Mode/Character/char_alien_infection_01"
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