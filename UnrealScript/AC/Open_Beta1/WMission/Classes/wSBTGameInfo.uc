class wSBTGameInfo extends wSDGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int PrimaryTeam;

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    bMultiBomb = false;
    //return;    
}

function InitializeGameInfo(bool bNoReset, bool bChangeTeam)
{
    super(wMSGameInfo).InitializeGameInfo(bNoReset, bChangeTeam);
    // End:0x34
    if(bNoReset)
    {
        PrimaryTeam = wMSGameReplicationInfo(GameReplicationInfo).PrimaryTeam;
    }
    //return;    
}

function bool IsNewPlayerGotoSpectating()
{
    // End:0x1D
    if(IsInState('MatchInProgress') && MaxLives == 1)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceSBTAllyGotTheBomb, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceSBTEnemyGotTheBomb, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceSBTIGotTheBomb, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceSBTAllyLostTheBomb, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceSBTAllyBombDefused, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceSBTEnemyBombDefused, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundSBTAllyBombDefused, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundSBTAllyGotTheBomb, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundSBTAllyPlantedBomb, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundSBTEnemyBombDefused, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundSBTEnemyGotTheBomb, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundSBTEnemyPlantedBomb, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundSBTIGotTheBomb, Class'Engine.Sound');
    //return;    
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:

    // End:0x107 [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += ((float(GameReplicationInfo.ElapsedTime) / 15.0000000) * (GetResultPointRatio_Intervention(PRI)));
        PRI.Point += ((float(GameReplicationInfo.ElapsedTime) / 11.0000000) * (GetResultPointRatio_Intervention(PRI)));
        // End:0xF0
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += ((float(GameReplicationInfo.ElapsedTime) / 20.0000000) * (GetResultPointRatio_Intervention(PRI)));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function CalcRoundResultPoints(int ScoringTeam)
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:

    // End:0x95 [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0x7E
        if(PRI.Team.TeamIndex == ScoringTeam)
        {
            PRI.fExp += 30.0000000;
            PRI.Point += 10.0000000;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
    // End:0x0D
    if(MaxLives == 1)
    {
        return false;
    }
    return super(wMSGameInfo).AllowBecomeActivePlayer(P);
    //return;    
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    // End:0x33
    if((bObjectivePlanted == true) && Living.Team.TeamIndex != int(CurrentAttackingTeam))
    {
        return false;
    }
    // End:0x72
    if(Living.Team.TeamIndex == 0)
    {
        EndRound(5, none, "MaxLive - Team0 Wins");        
    }
    else
    {
        EndRound(6, none, "MaxLive - Team0 Wins");
    }
    return true;
    //return;    
}

function CheckLastMan(int TeamIndex)
{
    // End:0x16
    if(MaxLives == 1)
    {
        super(wMSGameInfo).CheckLastMan(TeamIndex);
    }
    //return;    
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
        else
        {
            super(GameInfo).StartHumanPlayers();
        }        
    }
    else
    {
        super(GameInfo).StartHumanPlayers();
    }
    //return;    
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController PC;

    PC = super(wMSGameInfo).Login(Portal, Options, Error);
    // End:0x3D
    if(IsNewPlayerGotoSpectating())
    {
        PC.PlayerReplicationInfo.NumLives = 1;
    }
    clog((("[wSBTGameInfo::Login] name=" $ PC.PlayerReplicationInfo.PlayerName) $ " Numlives=") $ string(PC.PlayerReplicationInfo.NumLives));
    return PC;
    //return;    
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
    else
    {
        MaxLives = 0;
        wMSGameReplicationInfo(GameReplicationInfo).MaxLives = 0;
        GameReplicationInfo.MaxLives = 0;
    }
    clog("MaxLives After" $ string(MaxLives));
    super.BeginRound(bNoReset);
    //return;    
}

function AnnounceBeginRound()
{
    // End:0x45
    if((int(CurrentRound) == 1) || (int(CurrentRound) != 1) && (float(int(CurrentRound) - 1) % float(ChangeAttackTeamRound)) != float(0))
    {
        deleAnnounceMatchInfo();
    }
    //return;    
}

function GotoDefusePhase(name ObjectTag)
{
    local wSBTSetObjective Set;
    local wSBTDiffuseObjective dif;

    // End:0x21
    foreach DynamicActors(Class'WMission_Decompressed.wSBTSetObjective', Set)
    {
        Set.SetActive(false);        
    }    
    // End:0x5E
    foreach DynamicActors(Class'WMission_Decompressed.wSBTDiffuseObjective', dif)
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
    TeamQueueAnnouncement(CurrentAttackingTeam, Class'Engine.wGameManager'.default.VoicePackageName $ VoiceOurTeamPlantedBomb, 1);
    TeamReceiveLocalizedMessage(byte(int(1) - int(CurrentAttackingTeam)), Class'Engine.wMessage_BGM', Class'Engine.wMessage_BGM'.default.Code_AlmostOverFallBehind);
    TeamReceiveLocalizedMessage(byte(int(1) - int(CurrentAttackingTeam)), Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDEnemyBombPlanted, TP.PlayerReplicationInfo);
    TeamQueueAnnouncement(byte(int(1) - int(CurrentAttackingTeam)), VoiceEnemyPlantedBomb, 1);
    //return;    
}

function SetObjectiveSetted(Pawn TP, name ObjectTag, Vector FlagLocation)
{
    super.SetObjectiveSetted(TP, ObjectTag, FlagLocation);
    Log("[wSBTGameInfo::SetObjectiveSetted]");
    GameReplicationInfo.bStopCountDown = false;
    //return;    
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    local Controller C, NextC;

    TieOnTimeOver();
    MaxLives = 1;
    wMSGameReplicationInfo(GameReplicationInfo).MaxLives = 1;
    C = Level.ControllerList;
    J0x36:

    // End:0xDA [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xCC
        if(C.PlayerReplicationInfo != none)
        {
            C.PlayerReplicationInfo.NumLives = 1;
            // End:0xCC
            if(C.IsInState('Dead'))
            {
                // End:0xBC
                if(PlayerController(C) != none)
                {
                    PlayerController(C).DoServerViewNextPlayer = true;
                }
                C.GotoState('Spectating');
            }
        }
        C = NextC;
        // [Loop Continue]
        goto J0x36;
    }
    //return;    
}

function ForceObjectiveDefenderTeamIndex()
{
    //return;    
}

function int GetPlayerStartTeam(NavigationPoint N, int Team)
{
    return Team;
    //return;    
}

function AnnounceSwitchTeam()
{
    QueueAnnouncerSound(Class'Engine.wGameManager'.default.VoicePackageName $ sndChangeAttackTeam, 1, byte(255));
    QueueAnnouncerSound(Class'Engine.wGameManager'.default.VoicePackageName $ string(sndModeExplain), 1, byte(255));
    //return;    
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    local PlayerStart_SBT S;

    S = PlayerStart_SBT(N);
    // End:0x41
    if(S != none)
    {
        // End:0x3C
        if(int(S.TeamNumber) != int(Team))
        {
            return false;            
        }
        else
        {
            return true;
        }        
    }
    else
    {
        return false;
    }
    //return;    
}

function array<NavigationPoint> GetRespawnCandidatesByTeam(byte Team, bool checkFail)
{
    local int lp1;
    local array<NavigationPoint> candidates;

    lp1 = 0;
    J0x07:

    // End:0x77 [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        // End:0x6D
        if((IsAppropriateRespawnPoint(EveryPlayerStarts[lp1], Team)) && !checkFail || !IsRespawnPointFailedRecently(EveryPlayerStarts[lp1]))
        {
            candidates[candidates.Length] = EveryPlayerStarts[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return candidates;
    //return;    
}

function array<NavigationPoint> GetRespawnCandidatesByTeamGG(byte Team)
{
    local int lp1;
    local array<NavigationPoint> candidates;

    lp1 = 0;
    J0x07:

    // End:0x52 [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        // End:0x48
        if(IsAppropriateRespawnPoint(EveryPlayerStarts[lp1], Team))
        {
            candidates[candidates.Length] = EveryPlayerStarts[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return candidates;
    //return;    
}

function bool IsSDRespawnTime()
{
    local wMSGameReplicationInfo MSGRI;

    MSGRI = wMSGameReplicationInfo(GameReplicationInfo);
    return (float(MSGRI.RoundStartTime - MSGRI.RemainingTime) < SDRespawnTime) || Level.GetMatchMaker().IsSDRespawn();
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team, RespawnTeam;
    local NavigationPoint respawnPoint;
    local wMSGameReplicationInfo MSGRI;

    MSGRI = wMSGameReplicationInfo(GameReplicationInfo);
    // End:0x87
    if((Player != none) && Player.PlayerReplicationInfo != none)
    {
        // End:0x79
        if(Player.PlayerReplicationInfo.Team != none)
        {
            Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);            
        }
        else
        {
            Team = inTeam;
        }        
    }
    else
    {
        Team = inTeam;
    }
    RespawnTeam = byte(float(byte(int(Team) + PrimaryTeam)) % float(2));
    // End:0x1E0
    if(Level.GetMatchMaker().TR_bNewRespawn)
    {
        Log((((("FindPlayerStart_SD name=" $ Player.PlayerReplicationInfo.PlayerName) $ " team=") $ string(RespawnTeam)) $ " at ") $ string(MSGRI.RoundStartTime - MSGRI.RemainingTime));
        // End:0x158
        if(IsSDRespawnTime())
        {
            return FindPlayerStart_SD(RespawnTeam);            
        }
        else
        {
            bLeaveRespawnLogInChat = bLeaveRespawnLogInChatReal && Player == Level.GetLocalPlayerController();
            respawnPoint = GetRespawnPointRatingEnemy(false, GetRespawnCandidatesByTeam(RespawnTeam, true), Team);
            // End:0x1C7
            if(respawnPoint == none)
            {
                respawnPoint = GetSafetestRespawnPoint(Team, GetRespawnCandidatesByTeam(RespawnTeam, false), true);
            }
            LogFinalRespawnPoint(respawnPoint, RespawnTeam);
            return respawnPoint;
        }        
    }
    else
    {
        return super(wMSGameInfo).FindPlayerStart(Player, inTeam, incomingName);
    }
    //return;    
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart_SBT P;
    local float Score, NextDist;
    local Controller OtherPlayer;

    P = PlayerStart_SBT(N);
    // End:0x37
    if((P == none) || !P.bEnabled)
    {
        return -10000000.0000000;
    }
    // End:0x63
    if(int(Team) == 0)
    {
        // End:0x60
        if(!P.IsA('PlayerStart_SBT_AF'))
        {
            return -10000000.0000000;
        }        
    }
    else
    {
        // End:0x7F
        if(!P.IsA('PlayerStart_SBT_RSA'))
        {
            return -10000000.0000000;
        }
    }
    Score = 1000000.0000000;
    OtherPlayer = Level.ControllerList;
    J0x9E:

    // End:0x1D1 [Loop If]
    if(OtherPlayer != none)
    {
        // End:0x1BA
        if(OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none)
        {
            NextDist = VSize(OtherPlayer.Pawn.Location - P.Location);
            // End:0x140
            if(NextDist < (OtherPlayer.Pawn.CollisionRadius + OtherPlayer.Pawn.CollisionHeight))
            {
                return -1000000.0000000;
            }
            // End:0x15E
            if(OtherPlayer.GetTeamNum() == int(Team))
            {                
            }
            else
            {
                // End:0x19A
                if(FastTrace(P.Location, OtherPlayer.Pawn.Location))
                {
                    Score -= float(200000);                    
                }
                else
                {
                    Score -= FMax(30000.0000000 - (float(10) * NextDist), 0.0000000);
                }
            }
        }
        OtherPlayer = OtherPlayer.nextController;
        // [Loop Continue]
        goto J0x9E;
    }
    Score -= float(Rand(10000 * ((NumPlayers + NumBots) / 16)));
    return FMax(Score, 5.0000000);
    //return;    
}

function bool ProcessSwitchTeam(bool bNoReset)
{
    CurrentAttackingTeam = byte(-1);
    // End:0x73
    if(!bNoReset)
    {
        // End:0x73
        if((int(CurrentRound) != 1) && (float(int(CurrentRound) - 1) % float(ChangeAttackTeamRound)) == float(0))
        {
            PrimaryTeam = 1 - PrimaryTeam;
            wMSGameReplicationInfo(GameReplicationInfo).PrimaryTeam = PrimaryTeam;
            AnnounceSwitchTeam();
            return true;
        }
    }
    return false;
    //return;    
}

function int GetWinTeamAD(int winTeam)
{
    // End:0x14
    if(winTeam == PrimaryTeam)
    {
        return 1;        
    }
    else
    {
        return 2;
    }
    //return;    
}

function AnnounceAlmostWinningTeam()
{
    //return;    
}

defaultproperties
{
    AddExp_Plant=13.0000000
    AddExp_Defuse=13.0000000
    AddPoint_Plant=4.0000000
    AddPoint_Defuse=4.0000000
    DefuseTimeLimit=40
    ChangeAttackTeamRound=1
    DefaultMaxLives=0
    sndModeName=".Mode_Sab.v_sabotage_R"
    sndModeExplain=".Mode_Sab.v_sabotage_bomb_R"
    deleAnnounceMatchInfo=wSBTGameInfo.AnnounceMatchInfo
    HUDType="wMission.wHUD_Sabotage"
    RespawnTime=7.5000000
    GameAddExp=13.0000000
    GameAssistExp=4.0000000
    GamePenaltyExp=13.0000000
    GameAddPoint=4.0000000
    GameAssistPoint=1.0000000
    GamePenaltyPoint=4.0000000
    GameAddMultiKillExp=/* Array type was not detected. */
    GameAddMultiKillPoint=/* Array type was not detected. */
    bHasRespawnRestriction=false
}