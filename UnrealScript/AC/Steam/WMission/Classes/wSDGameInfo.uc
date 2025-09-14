/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wSDGameInfo.uc
 * Package Imports:
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:24
 *
 *******************************************************************************/
class wSDGameInfo extends wMSGameInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

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
}

function GotoDefusePhase(name ObjectTag)
{
    local wSetObjective Set;
    local wDiffuseObjective dif;

    // End:0x21
    foreach DynamicActors(class'wSetObjective', Set)
    {
        Set.SetActive(false);                
    }
    // End:0x5e
    foreach DynamicActors(class'wDiffuseObjective', dif)
    {
        // End:0x5d
        if(dif.Tag == ObjectTag)
        {
            dif.SetActive(true);
        }
        // End:0x5e
        else
        {
            continue;
        }        
    }
}

function PlayObjectiveSetVociceBGM(Pawn TP)
{
    TeamReceiveLocalizedMessage(CurrentAttackingTeam, class'wMessage_BGM', class'wMessage_BGM'.default.Code_AlmostOverLead);
    TeamReceiveLocalizedMessage(CurrentAttackingTeam, class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDAllyBombPlanted, TP.PlayerReplicationInfo);
    TeamQueueAnnouncement(CurrentAttackingTeam, class'wGameManager'.default.VoicePackageName $ "." $ VoiceOurTeamPlantedBomb, 1);
    TeamReceiveLocalizedMessage(byte(1 - CurrentAttackingTeam), class'wMessage_BGM', class'wMessage_BGM'.default.Code_AlmostOverFallBehind);
    TeamReceiveLocalizedMessage(byte(1 - CurrentAttackingTeam), class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDEnemyBombPlanted, TP.PlayerReplicationInfo);
    TeamQueueAnnouncement(byte(1 - CurrentAttackingTeam), class'wGameManager'.default.VoicePackageName $ "." $ VoiceEnemyPlantedBomb, 1);
}

function SetObjectiveSetted(Pawn TP, name ObjectTag, Vector FlagLocation)
{
    local int PlayerID;
    local byte byFlagIndex;
    local float fInstallerXCoord, fInstallerYCoord, fInstallerZCoord;
    local int iInstallerPos, iInstallerWeapon, iInstallerWeaponPart, iInstallerRange;

    super.SetObjectiveSetted(TP, ObjectTag, FlagLocation);
    crlog("[wSDGameInfo::SetObjectiveSetted] tp=" $ TP.OwnerName $ " ObjectTag=" $ string(ObjectTag));
    TP.Controller.PlayerReplicationInfo.Score += AddScore_Plant;
    TP.Controller.PlayerReplicationInfo.fExp += AddExp_Plant;
    TP.Controller.PlayerReplicationInfo.Point += AddPoint_Plant;
    PlayerController(TP.Controller).ReceiveLocalizedMessage(class'wMessage_Score', class'wMessage_Score'.default.Code_MessageScore_BombSetted);
    GotoDefusePhase(ObjectTag);
    PlayObjectiveSetVociceBGM(TP);
    PlayerID = TP.PlayerReplicationInfo.GetUID();
    byFlagIndex = byte(class'wHUD_Mission'.static.GetGameObjectIndexByTag(ObjectTag));
    fInstallerXCoord = TP.Location.X;
    fInstallerYCoord = TP.Location.Y;
    fInstallerZCoord = TP.Location.Z;
    iInstallerPos = TP.GetPostureIndex();
    iInstallerWeapon = TP.Weapon.BaseParams.iWeaponID;
    iInstallerWeaponPart = TP.Weapon.Parts[0].PartsGroupID;
    iInstallerRange = int(VSize(TP.Location - FlagLocation));
    Log("[wSDGameInfo::sfReqGamePlay_InstallBomb] PlayerID=" $ string(PlayerID) $ "/Tag:" $ string(byFlagIndex));
    // End:0x2d5
    if(BTSend != none && PlayerID != -1)
    {
        BTSend.sfReqGamePlay_InstallBomb(PlayerID, byFlagIndex, fInstallerXCoord, fInstallerYCoord, fInstallerZCoord, iInstallerPos, iInstallerWeapon, iInstallerWeaponPart, iInstallerRange);
    }
}

function OnBombDiffused(Pawn TP, name Tag, Vector FlagLocation)
{
    local int PlayerID;
    local byte byFlagIndex;
    local float fDefuserXCoord, fDefuserYCoord, fDefuserZCoord;
    local int iDefuserPos, iDefuserWeapon, iDefuserWeaponPart, iDefuserRange;

    PlayerID = TP.PlayerReplicationInfo.GetUID();
    byFlagIndex = byte(class'wHUD_Mission'.static.GetGameObjectIndexByTag(Tag));
    fDefuserXCoord = TP.Location.X;
    fDefuserYCoord = TP.Location.Y;
    fDefuserZCoord = TP.Location.Z;
    iDefuserPos = TP.GetPostureIndex();
    iDefuserWeapon = TP.Weapon.BaseParams.iWeaponID;
    iDefuserWeaponPart = TP.Weapon.Parts[0].PartsGroupID;
    iDefuserRange = int(VSize(TP.Location - FlagLocation));
    Log("[wSDGameInfo::sfReqGamePlay_DefuseBomb] PlayerID=" $ string(PlayerID) $ "/Tag:" $ string(byFlagIndex));
    // End:0x19e
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_DefuseBomb(PlayerID, byFlagIndex, fDefuserXCoord, fDefuserYCoord, fDefuserZCoord, iDefuserPos, iDefuserWeapon, iDefuserWeaponPart, iDefuserRange);
    }
}

function BeginRound(optional bool bNoReset)
{
    bForceRespawn = false;
    super.BeginRound(bNoReset);
    // End:0x20
    if(bNoReset)
    {
    }
    // End:0x26
    else
    {
        InitializeSetObjectives();
    }
    StartPlayerCount = CountPlayers();
    bSentEndRound = false;
    RemainingTimeWhenObjectIsSet = DefuseTimeLimit;
    AnnounceBeginRound();
}

function AnnounceBeginRound()
{
    AnnounceSwitchTeam();
    deleAnnounceMatchInfo();
}

function int CountPlayersByTeam(int Team)
{
    local PlayerController PC;
    local int Count;

    Count = 0;
    // End:0x38
    foreach DynamicActors(class'PlayerController', PC)
    {
        // End:0x37
        if(PC.GetTeamNum() == Team)
        {
            ++ Count;
        }                
    }
    return Count;
}

function int GetRoundEndType(wMSGameInfo.ERER_Reason RoundEndReason)
{
    local int attackerCount, defenderCount;

    attackerCount = CountPlayersByTeam(CurrentAttackingTeam);
    defenderCount = CountPlayersByTeam(1 - CurrentAttackingTeam);
    // End:0x75
    if(RoundEndReason == 2 || RoundEndReason == 3 || RoundEndReason == 5 || RoundEndReason == 6)
    {
        return 2;
    }
    // End:0xc5
    else
    {
        // End:0x8b
        if(RoundEndReason == 0)
        {
            return 3;
        }
        // End:0xc5
        else
        {
            // End:0xa1
            if(RoundEndReason == 1)
            {
                return 4;
            }
            // End:0xc5
            else
            {
                // End:0xbf
                if(attackerCount == 0 || defenderCount == 0)
                {
                    return 11;
                }
                // End:0xc5
                else
                {
                    return -1;
                }
            }
        }
    }
}

function int GetWinTeam(wMSGameInfo.ERER_Reason RoundEndReason)
{
    // End:0x15
    if(RoundEndReason == 5)
    {
        return 0;
    }
    // End:0x62
    else
    {
        // End:0x2a
        if(RoundEndReason == 6)
        {
            return 1;
        }
        // End:0x62
        else
        {
            // End:0x57
            if(RoundEndReason == 0 || RoundEndReason == 2)
            {
                return CurrentAttackingTeam;
            }
            // End:0x62
            else
            {
                return 1 - CurrentAttackingTeam;
            }
        }
    }
}

function int GetWinTeamAD(int winTeam)
{
    // End:0x16
    if(winTeam == CurrentAttackingTeam)
    {
        return 1;
    }
    // End:0x19
    else
    {
        return 2;
    }
}

function ServerLogEndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int endType, winTeam, winTeamAD, Players, fEndTime, iCurrentTime;

    Players = CountPlayers();
    winTeam = GetWinTeam(RoundEndReason);
    winTeamAD = GetWinTeamAD(winTeam);
    endType = GetRoundEndType(RoundEndReason);
    // End:0x79
    if(RoundEndReason == 0)
    {
        fEndTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - RemainingTimeWhenObjectIsSet + DefuseTimeLimit;
    }
    // End:0x1e2
    else
    {
        // End:0x158
        if(RoundEndReason == 1)
        {
            iCurrentTime = Max(0, wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime + wMSGameReplicationInfo(GameReplicationInfo).RemainingTime);
            fEndTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - RemainingTimeWhenObjectIsSet + DefuseTimeLimit - iCurrentTime;
            // End:0x155
            if(fEndTime < 0)
            {
                Log(string(self) $ "[ServerLogEndRound] === endTime < 0 ===  /// iCurrentTime: " $ string(iCurrentTime));
            }
        }
        // End:0x1e2
        else
        {
            fEndTime = RoundStartTime - RemainingTime;
            // End:0x1e2
            if(fEndTime < 0)
            {
                Log(string(self) $ "[ServerLogEndRound] === endTime < 0 ===  /// RoundStartTime: " $ string(RoundStartTime) $ " / RemainingTime:" $ string(RemainingTime));
            }
        }
    }
    // End:0x2b5
    if(fEndTime < 0)
    {
        Log(string(self) $ "[ServerLogEndRound] === endTime < 0 === /// RoundEndReason : " $ string(RoundEndReason) $ "/ RoundTimeLimit" $ string(wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit) $ "/ RemainingTimeWhenObjectIsSet : " $ string(RemainingTimeWhenObjectIsSet) $ "/ DefuseTimeLimit: " $ string(DefuseTimeLimit));
    }
    Log(string(self) $ "[BTSend.sfReqLogEndEachRound] StartPlayerCount=" $ string(StartPlayerCount) $ " players=" $ string(Players) $ " endType=" $ string(endType) $ " endTime=" $ string(EndTime) $ " winTeam=" $ string(winTeam) $ " winTeamAD=" $ string(winTeamAD) $ " Teams[0].Score=" $ string(Teams[0].Score) $ " Teams[1].Score=" $ string(Teams[1].Score) $ " CurrentRound=" $ string(CurrentRound));
    BTSend.sfReqLogEndEachRound(StartPlayerCount, Players, endType, fEndTime, byte(winTeam), byte(winTeamAD), int(Teams[0].Score), int(Teams[1].Score), CurrentRound);
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    super.EndRound(RoundEndReason, Instigator, Reason);
    // End:0x3d
    if(!bSentEndRound)
    {
        ServerLogEndRound(RoundEndReason, Instigator, Reason);
        bSentEndRound = true;
    }
}

function InitializeSetObjectives()
{
    local wSetObjective Set;

    // End:0x39
    foreach DynamicActors(class'wSetObjective', Set)
    {
        // End:0x38
        if(Set.Class == class'wSetObjective')
        {
            Set.SetActive(true);
        }                
    }
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSDAllyGotTheBomb, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSDAllyLostTheBomb, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSDIGotTheBomb, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSDAllyBombDefused, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSDEnemyBombDefused, class'Sound');
}

function AnnounceSwitchTeam()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xc4 [While If]
    if(C != none)
    {
        // End:0xad
        if(C.IsA('PlayerController'))
        {
            // End:0x80
            if(wMSGameReplicationInfo(GameReplicationInfo).bChangeAttackingTeam == true)
            {
                PlayerController(C).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ "." $ sndChangeAttackTeam, 1);
            }
            // End:0xad
            else
            {
                PlayerController(C).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ string(sndModeName), 1);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function AnnounceMatchInfo_SD()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xc8 [While If]
    if(C != none)
    {
        // End:0xb1
        if(C.IsA('PlayerController'))
        {
            // End:0x81
            if(C.GetTeamNum() == CurrentAttackingTeam)
            {
                PlayerController(C).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ "." $ sndModeExplain_Attack, 1);
            }
            // End:0xb1
            else
            {
                PlayerController(C).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ "." $ sndModeExplain_Defend, 1);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;
    local float numPlayersFactor;

    numPlayersFactor = float(GameReplicationInfo.MaxPlayersDuringGame) / 16.0;
    C = Level.ControllerList;
    J0x31:
    // End:0x12e [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += float(CurrentRound) * 7.0 * GetResultPointRatio_Intervention(PRI) * numPlayersFactor;
        PRI.Point += float(CurrentRound) * 7.0 * GetResultPointRatio_Intervention(PRI) * numPlayersFactor;
        // End:0x117
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += PRI.Team.Score * 8.0 * GetResultPointRatio_Intervention(PRI) * numPlayersFactor;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
}

function CalcRoundResultPoints(int ScoringTeam)
{
    local Controller C;
    local PlayerReplicationInfo PRI;
    local int PlayerCount;

    PlayerCount = 0;
    C = Level.ControllerList;
    J0x1b:
    // End:0x6a [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0x53
        if(C.bIsPlayer)
        {
            ++ PlayerCount;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
    C = Level.ControllerList;
    J0x7e:
    // End:0x10e [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0xf7
        if(PRI.Team.TeamIndex == ScoringTeam)
        {
            PRI.fExp += 30.0 * float(PlayerCount) / 16.0;
            PRI.Point += float(10);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x7e;
    }
}

function SetPRI4Intervention(PlayerReplicationInfo PRI)
{
    super(GameInfo).SetPRI4Intervention(PRI);
    PRI.RoundWhenIntervented = CurrentRound;
}

function float GetResultPointRatio_Intervention(PlayerReplicationInfo PRI)
{
    // End:0x55
    if(Class == class'wSDGameInfo')
    {
        // End:0x2c
        if(PRI.RoundWhenIntervented == 0)
        {
            return 1.0;
        }
        // End:0x52
        else
        {
            return float(CurrentRound - PRI.RoundWhenIntervented - 1) / float(CurrentRound);
        }
    }
    // End:0x61
    else
    {
        return super(GameInfo).GetResultPointRatio_Intervention(PRI);
    }
}

function AnnounceWinningTeam();
function AnnounceAlmostWinningTeam();
function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    // End:0x33
    if(bObjectivePlanted == true && Living.Team.TeamIndex != CurrentAttackingTeam)
    {
        return false;
    }
    // End:0x88
    if(Living.Team.TeamIndex == CurrentAttackingTeam)
    {
        EndRound(2, none, "MaxLive - Winner - ERER_AttackersWin");
    }
    // End:0xb8
    else
    {
        EndRound(3, none, "MaxLive - Winner - ERER_AttackersLose");
    }
    return true;
}

defaultproperties
{
    VoiceOurTeamPlantedBomb="v_sd_bomb_plant_team_R"
    VoiceEnemyPlantedBomb="v_sd_bomb_plant_enemy_R"
    sndModeExplain_Attack="v_sd_destroy_R"
    sndModeExplain_Defend="v_sd_guard_R"
    AddScore_Plant=10.0
    AddScore_Defuse=10.0
    AddExp_Plant=50.0
    AddExp_Defuse=50.0
    AddPoint_Plant=10.0
    AddPoint_Defuse=10.0
    sndModeName=.Mode_SD.v_sd_R
    sndModeExplain=None
    deleAnnounceMatchInfo=AnnounceMatchInfo_SD
    bAllowVehicles=true
    HUDType="wMission.wHUD_SD"
    GameAddExp=25.0
    GameAssistExp=8.0
    GamePenaltyExp=25.0
    GameAddPoint=10.0
    GameAssistPoint=3.0
    GamePenaltyPoint=10.0
    GameAddMultiKillExp=// Object reference not set to an instance of an object.
    
    GameAddMultiKillPoint=// Object reference not set to an instance of an object.
    
    SpawnWeaponPickupLocations=true
}