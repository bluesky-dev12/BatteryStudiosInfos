/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wSBTGameInfo.uc
 * Package Imports:
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:29
 *
 *******************************************************************************/
class wSBTGameInfo extends wSDGameInfo
    dependson(wSDGameInfo)
    dependson(wSBTSetObjective)
    dependson(wSBTDiffuseObjective)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var int PrimaryTeam;

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    bMultiBomb = false;
}

function InitializeGameInfo(bool bNoReset, bool bChangeTeam)
{
    super(wMSGameInfo).InitializeGameInfo(bNoReset, bChangeTeam);
    // End:0x34
    if(bNoReset)
    {
        PrimaryTeam = wMSGameReplicationInfo(GameReplicationInfo).PrimaryTeam;
    }
}

function bool IsNewPlayerGotoSpectating()
{
    // End:0x1d
    if(IsInState('MatchInProgress') && MaxLives == 1)
    {
        return true;
    }
    // End:0x1f
    else
    {
        return false;
    }
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSBTAllyGotTheBomb, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSBTEnemyGotTheBomb, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSBTIGotTheBomb, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSBTAllyLostTheBomb, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSBTAllyBombDefused, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceSBTEnemyBombDefused, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundSBTAllyBombDefused, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundSBTAllyGotTheBomb, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundSBTAllyPlantedBomb, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundSBTEnemyBombDefused, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundSBTEnemyGotTheBomb, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundSBTEnemyPlantedBomb, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundSBTIGotTheBomb, class'Sound');
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:
    // End:0x107 [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += float(GameReplicationInfo.ElapsedTime) / 15.0 * GetResultPointRatio_Intervention(PRI);
        PRI.Point += float(GameReplicationInfo.ElapsedTime) / 11.0 * GetResultPointRatio_Intervention(PRI);
        // End:0xf0
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += float(GameReplicationInfo.ElapsedTime) / 20.0 * GetResultPointRatio_Intervention(PRI);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function CalcRoundResultPoints(int ScoringTeam)
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:
    // End:0x95 [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0x7e
        if(PRI.Team.TeamIndex == ScoringTeam)
        {
            PRI.fExp += 30.0;
            PRI.Point += 10.0;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
    // End:0x0d
    if(MaxLives == 1)
    {
        return false;
    }
    return super(wMSGameInfo).AllowBecomeActivePlayer(P);
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    // End:0x33
    if(bObjectivePlanted == true && Living.Team.TeamIndex != CurrentAttackingTeam)
    {
        return false;
    }
    // End:0x72
    if(Living.Team.TeamIndex == 0)
    {
        EndRound(5, none, "MaxLive - Team0 Wins");
    }
    // End:0x91
    else
    {
        EndRound(6, none, "MaxLive - Team0 Wins");
    }
    return true;
}

function CheckLastMan(int TeamIndex)
{
    // End:0x16
    if(MaxLives == 1)
    {
        super(wMSGameInfo).CheckLastMan(TeamIndex);
    }
}

function StartHumanPlayers()
{
    clog("[StartHumanPlayers] MaxLives" $ string(wMSGameReplicationInfo(GameReplicationInfo).MaxLives));
    // End:0x69
    if(bChangedHost)
    {
        // End:0x60
        if(wMSGameReplicationInfo(GameReplicationInfo).MaxLives == 1)
        {
        }
        // End:0x66
        else
        {
            super(GameInfo).StartHumanPlayers();
        }
    }
    // End:0x6f
    else
    {
        super(GameInfo).StartHumanPlayers();
    }
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController PC;

    PC = super(wMSGameInfo).Login(Portal, Options, Error);
    // End:0x3d
    if(IsNewPlayerGotoSpectating())
    {
        PC.PlayerReplicationInfo.NumLives = 1;
    }
    clog("[wSBTGameInfo::Login] name=" $ PC.PlayerReplicationInfo.PlayerName $ " Numlives=" $ string(PC.PlayerReplicationInfo.NumLives));
    return PC;
}

function BeginRound(optional bool bNoReset)
{
    clog("[wSBTGameInfo::BeginRound] bNoReset=" $ string(bNoReset));
    clog("MaxLives" $ string(wMSGameReplicationInfo(GameReplicationInfo).MaxLives));
    // End:0x82
    if(bNoReset)
    {
        MaxLives = wMSGameReplicationInfo(GameReplicationInfo).MaxLives;
    }
    // End:0xae
    else
    {
        MaxLives = 0;
        wMSGameReplicationInfo(GameReplicationInfo).MaxLives = 0;
        GameReplicationInfo.MaxLives = 0;
    }
    clog("MaxLives After" $ string(MaxLives));
    super.BeginRound(bNoReset);
}

function AnnounceBeginRound()
{
    // End:0x45
    if(CurrentRound == 1 || CurrentRound != 1 && float(CurrentRound - 1) % float(ChangeAttackTeamRound) != float(0))
    {
        deleAnnounceMatchInfo();
    }
}

function GotoDefusePhase(name ObjectTag)
{
    local wSBTSetObjective Set;
    local wSBTDiffuseObjective dif;

    // End:0x21
    foreach DynamicActors(class'wSBTSetObjective', Set)
    {
        Set.SetActive(false);                
    }
    // End:0x5e
    foreach DynamicActors(class'wSBTDiffuseObjective', dif)
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
    TeamQueueAnnouncement(CurrentAttackingTeam, class'wGameManager'.default.VoicePackageName $ VoiceOurTeamPlantedBomb, 1);
    TeamReceiveLocalizedMessage(byte(1 - CurrentAttackingTeam), class'wMessage_BGM', class'wMessage_BGM'.default.Code_AlmostOverFallBehind);
    TeamReceiveLocalizedMessage(byte(1 - CurrentAttackingTeam), class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDEnemyBombPlanted, TP.PlayerReplicationInfo);
    TeamQueueAnnouncement(byte(1 - CurrentAttackingTeam), VoiceEnemyPlantedBomb, 1);
}

function SetObjectiveSetted(Pawn TP, name ObjectTag, Vector FlagLocation)
{
    super.SetObjectiveSetted(TP, ObjectTag, FlagLocation);
    Log("[wSBTGameInfo::SetObjectiveSetted]");
    GameReplicationInfo.bStopCountDown = false;
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    local Controller C, NextC;

    TieOnTimeOver();
    MaxLives = 1;
    wMSGameReplicationInfo(GameReplicationInfo).MaxLives = 1;
    C = Level.ControllerList;
    J0x36:
    // End:0xda [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xcc
        if(C.PlayerReplicationInfo != none)
        {
            C.PlayerReplicationInfo.NumLives = 1;
            // End:0xcc
            if(C.IsInState('Dead'))
            {
                // End:0xbc
                if(PlayerController(C) != none)
                {
                    PlayerController(C).DoServerViewNextPlayer = true;
                }
                C.GotoState('Spectating');
            }
        }
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
}

function ForceObjectiveDefenderTeamIndex();
function int GetPlayerStartTeam(NavigationPoint N, int Team)
{
    return Team;
}

function AnnounceSwitchTeam()
{
    QueueAnnouncerSound(class'wGameManager'.default.VoicePackageName $ sndChangeAttackTeam, 1, byte(255));
    QueueAnnouncerSound(class'wGameManager'.default.VoicePackageName $ string(sndModeExplain), 1, byte(255));
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    local PlayerStart_SBT S;

    S = PlayerStart_SBT(N);
    // End:0x41
    if(S != none)
    {
        // End:0x3c
        if(S.TeamNumber != Team)
        {
            return false;
        }
        // End:0x3e
        else
        {
            return true;
        }
    }
    // End:0x43
    else
    {
        return false;
    }
}

function array<NavigationPoint> GetRespawnCandidatesByTeam(byte Team, bool checkFail)
{
    local int lp1;
    local array<NavigationPoint> candidates;

    lp1 = 0;
    J0x07:
    // End:0x77 [While If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        // End:0x6d
        if(IsAppropriateRespawnPoint(EveryPlayerStarts[lp1], Team) && !checkFail || !IsRespawnPointFailedRecently(EveryPlayerStarts[lp1]))
        {
            candidates[candidates.Length] = EveryPlayerStarts[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return candidates;
}

function array<NavigationPoint> GetRespawnCandidatesByTeamGG(byte Team)
{
    local int lp1;
    local array<NavigationPoint> candidates;

    lp1 = 0;
    J0x07:
    // End:0x52 [While If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        // End:0x48
        if(IsAppropriateRespawnPoint(EveryPlayerStarts[lp1], Team))
        {
            candidates[candidates.Length] = EveryPlayerStarts[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return candidates;
}

function bool IsSDRespawnTime()
{
    local wMSGameReplicationInfo MSGRI;

    MSGRI = wMSGameReplicationInfo(GameReplicationInfo);
    return float(MSGRI.RoundStartTime - MSGRI.RemainingTime) < SDRespawnTime || Level.GetMatchMaker().IsSDRespawn();
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team, RespawnTeam;
    local NavigationPoint respawnPoint;
    local wMSGameReplicationInfo MSGRI;

    MSGRI = wMSGameReplicationInfo(GameReplicationInfo);
    // End:0x87
    if(Player != none && Player.PlayerReplicationInfo != none)
    {
        // End:0x79
        if(Player.PlayerReplicationInfo.Team != none)
        {
            Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);
        }
        // End:0x84
        else
        {
            Team = inTeam;
        }
    }
    // End:0x92
    else
    {
        Team = inTeam;
    }
    RespawnTeam = byte(float(byte(Team + PrimaryTeam)) % float(2));
    // End:0x1e0
    if(Level.GetMatchMaker().TR_bNewRespawn)
    {
        Log("FindPlayerStart_SD name=" $ Player.PlayerReplicationInfo.PlayerName $ " team=" $ string(RespawnTeam) $ " at " $ string(MSGRI.RoundStartTime - MSGRI.RemainingTime));
        // End:0x158
        if(IsSDRespawnTime())
        {
            return FindPlayerStart_SD(RespawnTeam);
        }
        // End:0x1dd
        else
        {
            bLeaveRespawnLogInChat = bLeaveRespawnLogInChatReal && Player == Level.GetLocalPlayerController();
            respawnPoint = GetRespawnPointRatingEnemy(false, GetRespawnCandidatesByTeam(RespawnTeam, true), Team);
            // End:0x1c7
            if(respawnPoint == none)
            {
                respawnPoint = GetSafetestRespawnPoint(Team, GetRespawnCandidatesByTeam(RespawnTeam, false), true);
            }
            LogFinalRespawnPoint(respawnPoint, RespawnTeam);
            return respawnPoint;
        }
    }
    // End:0x1f6
    else
    {
        return super(wMSGameInfo).FindPlayerStart(Player, inTeam, incomingName);
    }
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart_SBT P;
    local float Score, NextDist;
    local Controller OtherPlayer;

    P = PlayerStart_SBT(N);
    // End:0x37
    if(P == none || !P.bEnabled)
    {
        return -10000000.0;
    }
    // End:0x63
    if(Team == 0)
    {
        // End:0x60
        if(!P.IsA('PlayerStart_SBT_AF'))
        {
            return -10000000.0;
        }
    }
    // End:0x7f
    else
    {
        // End:0x7f
        if(!P.IsA('PlayerStart_SBT_RSA'))
        {
            return -10000000.0;
        }
    }
    Score = 1000000.0;
    OtherPlayer = Level.ControllerList;
    J0x9e:
    // End:0x1d1 [While If]
    if(OtherPlayer != none)
    {
        // End:0x1ba
        if(OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none)
        {
            NextDist = VSize(OtherPlayer.Pawn.Location - P.Location);
            // End:0x140
            if(NextDist < OtherPlayer.Pawn.CollisionRadius + OtherPlayer.Pawn.CollisionHeight)
            {
                return -1000000.0;
            }
            // End:0x15e
            if(OtherPlayer.GetTeamNum() == Team)
            {
            }
            // End:0x1ba
            else
            {
                // End:0x19a
                if(FastTrace(P.Location, OtherPlayer.Pawn.Location))
                {
                    Score -= float(200000);
                }
                // End:0x1ba
                else
                {
                    Score -= FMax(30000.0 - float(10) * NextDist, 0.0);
                }
            }
        }
        OtherPlayer = OtherPlayer.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x9e;
    }
    Score -= float(Rand(10000 * NumPlayers + NumBots / 16));
    return FMax(Score, 5.0);
}

function bool ProcessSwitchTeam(bool bNoReset)
{
    CurrentAttackingTeam = byte(-1);
    // End:0x73
    if(!bNoReset)
    {
        // End:0x73
        if(CurrentRound != 1 && float(CurrentRound - 1) % float(ChangeAttackTeamRound) == float(0))
        {
            PrimaryTeam = 1 - PrimaryTeam;
            wMSGameReplicationInfo(GameReplicationInfo).PrimaryTeam = PrimaryTeam;
            AnnounceSwitchTeam();
            return true;
        }
    }
    return false;
}

function int GetWinTeamAD(int winTeam)
{
    // End:0x14
    if(winTeam == PrimaryTeam)
    {
        return 1;
    }
    // End:0x17
    else
    {
        return 2;
    }
}

function AnnounceAlmostWinningTeam();

defaultproperties
{
    AddExp_Plant=13.0
    AddExp_Defuse=13.0
    AddPoint_Plant=4.0
    AddPoint_Defuse=4.0
    DefuseTimeLimit=40
    ChangeAttackTeamRound=1
    DefaultMaxLives=0
    sndModeName=.Mode_Sab.v_sabotage_R
    sndModeExplain=.Mode_Sab.v_sabotage_bomb_R
    deleAnnounceMatchInfo=AnnounceMatchInfo
    HUDType="wMission.wHUD_Sabotage"
    RespawnTime=7.50
    GameAddExp=13.0
    GameAssistExp=4.0
    GamePenaltyExp=13.0
    GameAddPoint=4.0
    GameAssistPoint=1.0
    GamePenaltyPoint=4.0
    GameAddMultiKillExp=// Object reference not set to an instance of an object.
    
    GameAddMultiKillPoint=// Object reference not set to an instance of an object.
    
    bHasRespawnRestriction=true
}