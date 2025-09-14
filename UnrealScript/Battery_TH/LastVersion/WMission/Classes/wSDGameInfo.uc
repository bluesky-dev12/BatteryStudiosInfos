class wSDGameInfo extends wMSGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string VoiceOurTeamPlantedBomb;
var string VoiceEnemyPlantedBomb;
var string sndModeExplain_Attack;
var string sndModeExplain_Defend;
var float AddScore_Plant;
var float AddScore_Defuse;
var float AddExp_Plant;
var float AddExp_Defuse;
var float AddPoint_Plant;
var float AddPoint_Defuse;
var int StartPlayerCount;
var bool bSentEndRound;

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    bMultiBomb = bool(GetIntOption(Options, "MultiBomb", 0));
    //return;    
}

function GotoDefusePhase(name ObjectTag)
{
    local wSetObjective Set;
    local wDiffuseObjective dif;

    // End:0x21
    foreach DynamicActors(Class'WMission_Decompressed.wSetObjective', Set)
    {
        Set.SetActive(false);        
    }    
    // End:0x5E
    foreach DynamicActors(Class'WMission_Decompressed.wDiffuseObjective', dif)
    {
        // End:0x5D
        if(dif.Tag == ObjectTag)
        {
            dif.SetActive(true);
            // End:0x5E
            break;
        }        
    }    
    //return;    
}

function PlayObjectiveSetVociceBGM(Pawn TP)
{
    TeamReceiveLocalizedMessage(CurrentAttackingTeam, Class'Engine.wMessage_BGM', Class'Engine.wMessage_BGM'.default.Code_AlmostOverLead);
    TeamReceiveLocalizedMessage(CurrentAttackingTeam, Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDAllyBombPlanted, TP.PlayerReplicationInfo);
    TeamQueueAnnouncement(CurrentAttackingTeam, VoiceOurTeamPlantedBomb, 1);
    TeamReceiveLocalizedMessage(byte(int(1) - int(CurrentAttackingTeam)), Class'Engine.wMessage_BGM', Class'Engine.wMessage_BGM'.default.Code_AlmostOverFallBehind);
    TeamReceiveLocalizedMessage(byte(int(1) - int(CurrentAttackingTeam)), Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDEnemyBombPlanted, TP.PlayerReplicationInfo);
    TeamQueueAnnouncement(byte(int(1) - int(CurrentAttackingTeam)), VoiceEnemyPlantedBomb, 1);
    //return;    
}

function SetObjectiveSetted(Pawn TP, name ObjectTag, Vector FlagLocation)
{
    local int PlayerID;
    local byte byFlagIndex;
    local float fInstallerXCoord, fInstallerYCoord, fInstallerZCoord;
    local int iInstallerPos, iInstallerWeapon, iInstallerWeaponPart, iInstallerRange;

    super.SetObjectiveSetted(TP, ObjectTag, FlagLocation);
    crlog((("[wSDGameInfo::SetObjectiveSetted] tp=" $ TP.OwnerName) $ " ObjectTag=") $ string(ObjectTag));
    TP.Controller.PlayerReplicationInfo.Score += AddScore_Plant;
    TP.Controller.PlayerReplicationInfo.fExp += AddExp_Plant;
    TP.Controller.PlayerReplicationInfo.Point += AddPoint_Plant;
    PlayerController(TP.Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Score', Class'Engine.wMessage_Score'.default.Code_MessageScore_BombSetted);
    GotoDefusePhase(ObjectTag);
    PlayObjectiveSetVociceBGM(TP);
    PlayerID = TP.PlayerReplicationInfo.GetUID();
    byFlagIndex = byte(Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndexByTag(ObjectTag));
    fInstallerXCoord = TP.Location.X;
    fInstallerYCoord = TP.Location.Y;
    fInstallerZCoord = TP.Location.Z;
    iInstallerPos = TP.GetPostureIndex();
    iInstallerWeapon = TP.Weapon.BaseParams.iWeaponID;
    iInstallerWeaponPart = TP.Weapon.Parts[0].PartsGroupID;
    iInstallerRange = int(VSize(TP.Location - FlagLocation));
    Log((("[wSDGameInfo::sfReqGamePlay_InstallBomb] PlayerID=" $ string(PlayerID)) $ "/Tag:") $ string(byFlagIndex));
    // End:0x2D5
    if((BTSend != none) && PlayerID != -1)
    {
        BTSend.sfReqGamePlay_InstallBomb(PlayerID, byFlagIndex, fInstallerXCoord, fInstallerYCoord, fInstallerZCoord, iInstallerPos, iInstallerWeapon, iInstallerWeaponPart, iInstallerRange);
    }
    //return;    
}

function OnBombDiffused(Pawn TP, name Tag, Vector FlagLocation)
{
    local int PlayerID;
    local byte byFlagIndex;
    local float fDefuserXCoord, fDefuserYCoord, fDefuserZCoord;
    local int iDefuserPos, iDefuserWeapon, iDefuserWeaponPart, iDefuserRange;

    PlayerID = TP.PlayerReplicationInfo.GetUID();
    byFlagIndex = byte(Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndexByTag(Tag));
    fDefuserXCoord = TP.Location.X;
    fDefuserYCoord = TP.Location.Y;
    fDefuserZCoord = TP.Location.Z;
    iDefuserPos = TP.GetPostureIndex();
    iDefuserWeapon = TP.Weapon.BaseParams.iWeaponID;
    iDefuserWeaponPart = TP.Weapon.Parts[0].PartsGroupID;
    iDefuserRange = int(VSize(TP.Location - FlagLocation));
    Log((("[wSDGameInfo::sfReqGamePlay_DefuseBomb] PlayerID=" $ string(PlayerID)) $ "/Tag:") $ string(byFlagIndex));
    // End:0x19E
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_DefuseBomb(PlayerID, byFlagIndex, fDefuserXCoord, fDefuserYCoord, fDefuserZCoord, iDefuserPos, iDefuserWeapon, iDefuserWeaponPart, iDefuserRange);
    }
    //return;    
}

function BeginRound(optional bool bNoReset)
{
    bForceRespawn = false;
    super.BeginRound(bNoReset);
    // End:0x20
    if(bNoReset)
    {        
    }
    else
    {
        InitializeSetObjectives();
    }
    StartPlayerCount = CountPlayers();
    bSentEndRound = false;
    RemainingTimeWhenObjectIsSet = DefuseTimeLimit;
    AnnounceBeginRound();
    //return;    
}

function AnnounceBeginRound()
{
    AnnounceSwitchTeam();
    AnnounceMatchInfo();
    //return;    
}

function int CountPlayersByTeam(int Team)
{
    local PlayerController PC;
    local int Count;

    Count = 0;
    // End:0x38
    foreach DynamicActors(Class'Engine.PlayerController', PC)
    {
        // End:0x37
        if(PC.GetTeamNum() == Team)
        {
            Count++;
        }        
    }    
    return Count;
    //return;    
}

function int GetRoundEndType(wMSGameInfo.ERER_Reason RoundEndReason)
{
    local int attackerCount, defenderCount;

    attackerCount = CountPlayersByTeam(int(CurrentAttackingTeam));
    defenderCount = CountPlayersByTeam(1 - int(CurrentAttackingTeam));
    // End:0x75
    if((((int(RoundEndReason) == int(2)) || int(RoundEndReason) == int(3)) || int(RoundEndReason) == int(5)) || int(RoundEndReason) == int(6))
    {
        return 2;        
    }
    else
    {
        // End:0x8B
        if(int(RoundEndReason) == int(0))
        {
            return 3;            
        }
        else
        {
            // End:0xA1
            if(int(RoundEndReason) == int(1))
            {
                return 4;                
            }
            else
            {
                // End:0xBF
                if((attackerCount == 0) || defenderCount == 0)
                {
                    return 11;                    
                }
                else
                {
                    return -1;
                }
            }
        }
    }
    //return;    
}

function int GetWinTeam(wMSGameInfo.ERER_Reason RoundEndReason)
{
    // End:0x15
    if(int(RoundEndReason) == int(5))
    {
        return 0;        
    }
    else
    {
        // End:0x2A
        if(int(RoundEndReason) == int(6))
        {
            return 1;            
        }
        else
        {
            // End:0x57
            if((int(RoundEndReason) == int(0)) || int(RoundEndReason) == int(2))
            {
                return int(CurrentAttackingTeam);                
            }
            else
            {
                return 1 - int(CurrentAttackingTeam);
            }
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

function ServerLogEndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int endType, winTeam, winTeamAD, Players, fEndTime, iCurrentTime;

    Players = CountPlayers();
    winTeam = GetWinTeam(RoundEndReason);
    winTeamAD = GetWinTeamAD(winTeam);
    endType = GetRoundEndType(RoundEndReason);
    // End:0x79
    if(int(RoundEndReason) == int(0))
    {
        fEndTime = (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - RemainingTimeWhenObjectIsSet) + DefuseTimeLimit;        
    }
    else
    {
        // End:0x158
        if(int(RoundEndReason) == int(1))
        {
            iCurrentTime = Max(0, (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime) + wMSGameReplicationInfo(GameReplicationInfo).RemainingTime);
            fEndTime = ((wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - RemainingTimeWhenObjectIsSet) + DefuseTimeLimit) - iCurrentTime;
            // End:0x155
            if(fEndTime < 0)
            {
                Log((string(self) $ "[ServerLogEndRound] === endTime < 0 ===  /// iCurrentTime: ") $ string(iCurrentTime));
            }            
        }
        else
        {
            fEndTime = RoundStartTime - RemainingTime;
            // End:0x1E2
            if(fEndTime < 0)
            {
                Log((((string(self) $ "[ServerLogEndRound] === endTime < 0 ===  /// RoundStartTime: ") $ string(RoundStartTime)) $ " / RemainingTime:") $ string(RemainingTime));
            }
        }
    }
    // End:0x2B5
    if(fEndTime < 0)
    {
        Log((((((((string(self) $ "[ServerLogEndRound] === endTime < 0 === /// RoundEndReason : ") $ string(RoundEndReason)) $ "/ RoundTimeLimit") $ string(wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit)) $ "/ RemainingTimeWhenObjectIsSet : ") $ string(RemainingTimeWhenObjectIsSet)) $ "/ DefuseTimeLimit: ") $ string(DefuseTimeLimit));
    }
    Log((((((((((((((((((string(self) $ "[BTSend.sfReqLogEndEachRound] StartPlayerCount=") $ string(StartPlayerCount)) $ " players=") $ string(Players)) $ " endType=") $ string(endType)) $ " endTime=") $ string(EndTime)) $ " winTeam=") $ string(winTeam)) $ " winTeamAD=") $ string(winTeamAD)) $ " Teams[0].Score=") $ string(Teams[0].Score)) $ " Teams[1].Score=") $ string(Teams[1].Score)) $ " CurrentRound=") $ string(CurrentRound));
    BTSend.sfReqLogEndEachRound(StartPlayerCount, Players, endType, fEndTime, byte(winTeam), byte(winTeamAD), int(Teams[0].Score), int(Teams[1].Score), int(CurrentRound));
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    super.EndRound(RoundEndReason, Instigator, Reason);
    // End:0x3D
    if(!bSentEndRound)
    {
        ServerLogEndRound(RoundEndReason, Instigator, Reason);
        bSentEndRound = true;
    }
    //return;    
}

function InitializeSetObjectives()
{
    local wSetObjective Set;

    // End:0x39
    foreach DynamicActors(Class'WMission_Decompressed.wSetObjective', Set)
    {
        // End:0x38
        if(Set.Class == Class'WMission_Decompressed.wSetObjective')
        {
            Set.SetActive(true);
        }        
    }    
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    //return;    
}

function AnnounceSwitchTeam()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x9D [Loop If]
    if(C != none)
    {
        // End:0x86
        if(C.IsA('PlayerController'))
        {
            // End:0x6B
            if(wMSGameReplicationInfo(GameReplicationInfo).bChangeAttackingTeam == true)
            {
                PlayerController(C).QueueAnnouncement(sndChangeAttackTeam, 1);                
            }
            else
            {
                PlayerController(C).QueueAnnouncement(sndModeName, 1);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function AnnounceMatchInfo()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x9E [Loop If]
    if(C != none)
    {
        // End:0x87
        if(C.IsA('PlayerController'))
        {
            // End:0x6C
            if(C.GetTeamNum() == int(CurrentAttackingTeam))
            {
                PlayerController(C).QueueAnnouncement(sndModeExplain_Attack, 1);                
            }
            else
            {
                PlayerController(C).QueueAnnouncement(sndModeExplain_Defend, 1);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;
    local float numPlayersFactor;

    numPlayersFactor = float(GameReplicationInfo.MaxPlayersDuringGame) / 16.0000000;
    C = Level.ControllerList;
    J0x31:

    // End:0x12E [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += (((float(CurrentRound) * 7.0000000) * (GetResultPointRatio_Intervention(PRI))) * numPlayersFactor);
        PRI.Point += (((float(CurrentRound) * 7.0000000) * (GetResultPointRatio_Intervention(PRI))) * numPlayersFactor);
        // End:0x117
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += (((PRI.Team.Score * 8.0000000) * (GetResultPointRatio_Intervention(PRI))) * numPlayersFactor);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x31;
    }
    //return;    
}

function CalcRoundResultPoints(int ScoringTeam)
{
    local Controller C;
    local PlayerReplicationInfo PRI;
    local int PlayerCount;

    PlayerCount = 0;
    C = Level.ControllerList;
    J0x1B:

    // End:0x6A [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0x53
        if(C.bIsPlayer)
        {
            PlayerCount++;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1B;
    }
    C = Level.ControllerList;
    J0x7E:

    // End:0x10E [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0xF7
        if(PRI.Team.TeamIndex == ScoringTeam)
        {
            PRI.fExp += ((30.0000000 * float(PlayerCount)) / 16.0000000);
            PRI.Point += float(10);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x7E;
    }
    //return;    
}

function SetPRI4Intervention(PlayerReplicationInfo PRI)
{
    super(GameInfo).SetPRI4Intervention(PRI);
    PRI.RoundWhenIntervented = int(CurrentRound);
    //return;    
}

function float GetResultPointRatio_Intervention(PlayerReplicationInfo PRI)
{
    // End:0x55
    if(Class == Class'WMission_Decompressed.wSDGameInfo')
    {
        // End:0x2C
        if(PRI.RoundWhenIntervented == 0)
        {
            return 1.0000000;            
        }
        else
        {
            return float(int(CurrentRound) - (PRI.RoundWhenIntervented - 1)) / float(CurrentRound);
        }        
    }
    else
    {
        return super(GameInfo).GetResultPointRatio_Intervention(PRI);
    }
    //return;    
}

function AnnounceWinningTeam()
{
    //return;    
}

function AnnounceAlmostWinningTeam()
{
    //return;    
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    // End:0x33
    if((bObjectivePlanted == true) && Living.Team.TeamIndex != int(CurrentAttackingTeam))
    {
        return false;
    }
    // End:0x88
    if(Living.Team.TeamIndex == int(CurrentAttackingTeam))
    {
        EndRound(2, none, "MaxLive - Winner - ERER_AttackersWin");        
    }
    else
    {
        EndRound(3, none, "MaxLive - Winner - ERER_AttackersLose");
    }
    return true;
    //return;    
}

defaultproperties
{
    VoiceOurTeamPlantedBomb="/Mode_SD/v_sd_bomb_plant_team_R"
    VoiceEnemyPlantedBomb="/Mode_SD/v_sd_bomb_plant_enemy_R"
    sndModeExplain_Attack="/Mode_SD/v_sd_destroy_R"
    sndModeExplain_Defend="/Mode_SD/v_sd_guard_R"
    AddScore_Plant=10.0000000
    AddScore_Defuse=10.0000000
    AddExp_Plant=50.0000000
    AddExp_Defuse=50.0000000
    AddPoint_Plant=10.0000000
    AddPoint_Defuse=10.0000000
    sndModeName="/Mode_SD/v_sd_R"
    sndModeExplain=""
    bAllowVehicles=false
    HUDType="wMission.wHUD_SD"
    GameAddExp=25.0000000
    GameAssistExp=8.0000000
    GamePenaltyExp=25.0000000
    GameAddPoint=10.0000000
    GameAssistPoint=3.0000000
    GamePenaltyPoint=10.0000000
    GameAddMultiKillExp=/* Array type was not detected. */
    GameAddMultiKillPoint=/* Array type was not detected. */
    SpawnWeaponPickupLocations=false
}