class wCOLGameInfo extends wMSGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<int> Codes_AllyCapturing;
var array<int> Codes_EnemyCapturing;
var array<int> Codes_AllyCaptured;
var array<int> Codes_EnemyCaptured;
var int FlagScore;
var array<NavigationPoint> FlagSpawnPoints;
var wCOLFlagObjective CurrentFlag;
var array<float> afTakerXCoord;
var array<float> afTakerYCoord;
var array<float> afTakerZCoord;
var array<int> aiTakerPos;
var array<int> aiTakerWeapon;
var array<int> aiTakerWeaponPart;
var array<int> aiTakerRange;

function GetGameSpecificActions(Controller C, wNPCActions npcActions, out array<Object> Actions)
{
    // End:0x5E
    if(npcActions.GotoFlag)
    {
        Actions[Actions.Length] = wAction_GotoFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(Class'WGame.wAction_GotoFlag')).Init(CurrentFlag);
    }
    // End:0xBC
    if(npcActions.CaptureFlag)
    {
        Actions[Actions.Length] = wAction_CaptureFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(Class'WGame.wAction_CaptureFlag')).Init(CurrentFlag);
    }
    //return;    
}

function Actor GetNearFlag(Actor A)
{
    // End:0x40
    if(VSize(CurrentFlag.Location - A.Location) < (Class'WMission_Decompressed.wCOLFlagObjective'.default.CollisionRadius * 0.7500000))
    {
        return CurrentFlag;
    }
    return none;
    //return;    
}

function ChangeHostExtraWork()
{
    local wCOLFlagObjective f;

    // End:0x20
    foreach DynamicActors(Class'WMission_Decompressed.wCOLFlagObjective', f)
    {
        f.RecoverCapturing();        
    }    
    //return;    
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    InitFlagSpawnPoints();
    //return;    
}

function InitFlagSpawnPoints()
{
    local COLFlagSpawnPoint f;
    local NavigationPoint N;
    local float Angle;

    Log("[wCOLGameInfo::InitFlagSpawnPoints]");
    FlagSpawnPoints.Length = 0;
    // End:0x52
    foreach DynamicActors(Class'Engine.COLFlagSpawnPoint', f)
    {
        FlagSpawnPoints[FlagSpawnPoints.Length] = f;        
    }    
    // End:0x142
    if(FlagSpawnPoints.Length < 2)
    {
        Angle = -0.9000000;
        J0x6B:

        // End:0x142 [Loop If]
        if(Angle <= float(0))
        {
            FlagSpawnPoints.Length = 0;
            // End:0xD5
            foreach DynamicActors(Class'Engine.NavigationPoint', N)
            {
                // End:0xD4
                if(!N.IsA('FlyingPathNode') && N.MaxCoverAngle[1] < Angle)
                {
                    FlagSpawnPoints[FlagSpawnPoints.Length] = N;
                }                
            }            
            Log((("[wCOLGameInfo::InitFlagSpawnPoints] angle=" $ string(Angle)) $ " length=") $ string(FlagSpawnPoints.Length));
            // End:0x133
            if(FlagSpawnPoints.Length > 4)
            {
                // [Explicit Break]
                goto J0x142;
            }
            Angle += 0.1000000;
            // [Loop Continue]
            goto J0x6B;
        }
    }
    J0x142:

    //return;    
}

function CheckEndGameAfterRoundTimeOver()
{
    // End:0x3C
    if(Teams[0].Score > Teams[1].Score)
    {
        EndCOLGame(0, none, "0 Team Win");        
    }
    else
    {
        // End:0x75
        if(Teams[1].Score > Teams[0].Score)
        {
            EndCOLGame(1, none, "1 Team Win");
        }
    }
    //return;    
}

function AddTeamScore(int iTeamIndex)
{
    Teams[iTeamIndex].Score += float(FlagScore);
    Teams[iTeamIndex].NetUpdateTime = Level.TimeSeconds - float(1);
    FlagState_UpdateDomScore(int(Teams[0].Score), int(Teams[1].Score));
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    // End:0x3F
    if(Teams[0].Score == Teams[1].Score)
    {
        EndCOLGame(-1, none, "Draw Game");        
    }
    else
    {
        // End:0x7B
        if(Teams[0].Score > Teams[1].Score)
        {
            EndCOLGame(0, none, "0 Team Win");            
        }
        else
        {
            // End:0xB4
            if(Teams[0].Score < Teams[1].Score)
            {
                EndCOLGame(1, none, "1 Team Win");
            }
        }
    }
    //return;    
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    //return;    
}

function EndCOLGame(int iWinningTeam, Pawn Instigator, string Reason)
{
    local PlayerReplicationInfo PRI;

    // End:0x1A
    if(!IsPlaying() || ResetCountDown > 0)
    {
        return;
    }
    Log("wDOMGameInfo::EndCOLGame - Reason : " @ Reason);
    // End:0x68
    if(Instigator != none)
    {
        PRI = Instigator.PlayerReplicationInfo;
    }
    // End:0xCD
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundWinner = 1;
        wMSGameReplicationInfo(GameReplicationInfo).RoundOverTime = (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime) + RemainingTime;        
    }
    else
    {
        // End:0xE7
        if(iWinningTeam != -1)
        {
            AnnounceScore(iWinningTeam);
        }
    }
    TriggerEvent('EndCOLGame', self, Instigator);
    // End:0x116
    if(EndCinematic != none)
    {
        EndCinematic.Trigger(self, none);
        return;
    }
    Log("EndCOLGame->EndGame - roundlimit");
    EndGame(none, "roundlimit");
    // End:0x15D
    if(bGameEnded)
    {
        GotoState('MatchOver');
    }
    //return;    
}

function RespawnPlayer(Controller C, optional bool bClearSpecials)
{
    local string PawnOverrideClass;
    local Vehicle DrivenVehicle;

    // End:0x48
    if(C.Pawn != none)
    {
        DrivenVehicle = Vehicle(C.Pawn);
        // End:0x48
        if(DrivenVehicle != none)
        {
            DrivenVehicle.KDriverLeave(true);
        }
    }
    C.StartSpot = FindPlayerStart(C, byte(C.PlayerReplicationInfo.Team.TeamIndex));
    PawnOverrideClass = wMSPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass;
    // End:0xE1
    if(PawnOverrideClass != "")
    {
        SpawnAndPossessPawn(C, PawnOverrideClass);
        wMSPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass = "";
    }
    // End:0x13B
    if(C.StartSpot != none)
    {
        C.SetLocation(C.StartSpot.Location);
        C.SetRotation(C.StartSpot.Rotation);
    }
    // End:0x23F
    if(C.Pawn != none)
    {
        SetPlayerDefaults(C.Pawn);
        C.Pawn.SetLocation(C.StartSpot.Location);
        C.Pawn.SetRotation(C.StartSpot.Rotation);
        C.Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        C.Pawn.PlayTeleportEffect(false, true);
        // End:0x23F
        if((Bot(C) != none) && PawnOverrideClass == "")
        {
            Bot(C).Squad.Retask(Bot(C));
        }
    }
    // End:0x290
    if(C.StartSpot != none)
    {
        C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
    }
    //return;    
}

function array<Actor> GetEveryEnemyList(byte myTeam)
{
    local array<Actor> enemies;

    enemies = super(GameInfo).GetEveryEnemyList(myTeam);
    enemies[enemies.Length] = CurrentFlag;
    return enemies;
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;
    local NavigationPoint respawnPoint;
    local Pawn pickedAlly;

    // End:0x6B
    if(((Player != none) && Player.PlayerReplicationInfo != none) && Player.PlayerReplicationInfo.Team != none)
    {
        Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);        
    }
    else
    {
        Team = inTeam;
    }
    // End:0x8E
    if(IsSDRespawnTime())
    {
        return FindPlayerStart_SD(Team);        
    }
    else
    {
        // End:0xB0
        if(IsRespawnSpecialCase())
        {
            respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);            
        }
        else
        {
            // End:0x13B
            if(IsAnyAllyAlive(Team))
            {
                pickedAlly = PickAlly(Team);
                respawnPoint = GetRespawnPointRatingEnemy(true, GetRespawnPointsSortedByClosenessTo(pickedAlly, Team, 5), Team);
                // End:0x138
                if(respawnPoint == none)
                {
                    Log("  RNAF: respawn near ally failed");
                    respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
                }                
            }
            else
            {
                respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
            }
        }
        // End:0x195
        if(respawnPoint == none)
        {
            Log("!!!ACHTUNG!!!! NO RESPAWN POINT!");
            // End:0x194
            foreach AllActors(Class'Engine.NavigationPoint', respawnPoint)
            {
                // End:0x194
                break;                
            }            
        }
        LogFinalRespawnPoint(respawnPoint, Team);
        return respawnPoint;
    }
    //return;    
}

function InitializeCodes()
{
    // End:0x118
    if(Codes_AllyCapturing.Length == 0)
    {
        Codes_AllyCapturing[0] = Class'Engine.wMessage_Game'.default.Code_DOMAllyCapturingA;
        Codes_AllyCapturing[1] = Class'Engine.wMessage_Game'.default.Code_DOMAllyCapturingB;
        Codes_AllyCapturing[2] = Class'Engine.wMessage_Game'.default.Code_DOMAllyCapturingC;
        Codes_AllyCaptured[0] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedA;
        Codes_AllyCaptured[1] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedB;
        Codes_AllyCaptured[2] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedC;
        Codes_EnemyCapturing[0] = Class'Engine.wMessage_Game'.default.Code_DOMEnemyCapturingA;
        Codes_EnemyCapturing[1] = Class'Engine.wMessage_Game'.default.Code_DOMEnemyCapturingB;
        Codes_EnemyCapturing[2] = Class'Engine.wMessage_Game'.default.Code_DOMEnemyCapturingC;
        Codes_EnemyCaptured[0] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedA;
        Codes_EnemyCaptured[1] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedB;
        Codes_EnemyCaptured[2] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedC;
    }
    //return;    
}

function AnnounceFlagCapture(byte byState, byte byTeam, byte byFlagIndex)
{
    InitializeCodes();
    // End:0x33
    if(int(byState) == 0)
    {
        TeamReceiveLocalizedMessage(byTeam, Class'Engine.wMessage_Game', Codes_AllyCapturing[int(byFlagIndex)]);        
    }
    else
    {
        // End:0x84
        if(int(byState) == 1)
        {
            TeamReceiveLocalizedMessage(byTeam, Class'Engine.wMessage_Game_ImpSystem', Codes_AllyCaptured[int(byFlagIndex)]);
            TeamReceiveLocalizedMessage(byte(int(1) - int(byTeam)), Class'Engine.wMessage_Game_ImpSystem', Codes_EnemyCaptured[int(byFlagIndex)]);
        }
    }
    //return;    
}

function AnnounceFlagState(byte byState, byte byTeam, name FlagTag)
{
    local byte byFlagIndex;

    byFlagIndex = byte(Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndexByTag(FlagTag));
    AnnounceFlagCapture(byState, byTeam, byFlagIndex);
    //return;    
}

function FlagState_TakePoint(array<int> TakerUID, name FlagTag)
{
    local byte byFlagIndex;

    byFlagIndex = byte(Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndexByTag(FlagTag));
    // End:0x63
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_TakeAPoint(TakerUID, byFlagIndex, afTakerXCoord, afTakerYCoord, afTakerZCoord, aiTakerPos, aiTakerWeapon, aiTakerWeaponPart, aiTakerRange);
    }
    ClearTakerInfo();
    //return;    
}

function FlagState_UpdateDomScore(int AFScore, int RSAScore)
{
    Log((("[wSDGameInfo::sfReqGamePlay_UpdateDomScore]  AF Score:" $ string(AFScore)) $ "/ RSA Score:") $ string(RSAScore));
    // End:0x80
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_UpdateDomScore(AFScore, RSAScore);
    }
    //return;    
}

function TakerInfo(Pawn TakerPawn, Vector FlagLocation)
{
    afTakerXCoord[afTakerXCoord.Length] = TakerPawn.Location.X;
    afTakerYCoord[afTakerYCoord.Length] = TakerPawn.Location.Y;
    afTakerZCoord[afTakerZCoord.Length] = TakerPawn.Location.Z;
    aiTakerPos[aiTakerPos.Length] = TakerPawn.GetPostureIndex();
    aiTakerWeapon[aiTakerWeapon.Length] = TakerPawn.Weapon.BaseParams.iWeaponID;
    aiTakerWeaponPart[aiTakerWeaponPart.Length] = TakerPawn.Weapon.Parts[0].PartsGroupID;
    aiTakerRange[aiTakerRange.Length] = int(VSize(TakerPawn.Location - FlagLocation));
    //return;    
}

function ClearTakerInfo()
{
    afTakerXCoord.Length = 0;
    afTakerYCoord.Length = 0;
    afTakerZCoord.Length = 0;
    aiTakerPos.Length = 0;
    aiTakerWeapon.Length = 0;
    aiTakerWeaponPart.Length = 0;
    aiTakerRange.Length = 0;
    //return;    
}

function PlayEndOfMatchMessage()
{
    super(TeamGame).PlayEndOfMatchMessage();
    //return;    
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:

    // End:0x136 [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.Exp += ((TeamInfo(GameReplicationInfo.Winner).Score / 3.5000000) * (GetResultPointRatio_Intervention(PRI)));
        PRI.Point += ((TeamInfo(GameReplicationInfo.Winner).Score / 3.3000000) * (GetResultPointRatio_Intervention(PRI)));
        // End:0x11F
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.Exp += ((float(Min(ScoreLimit, int(TeamInfo(GameReplicationInfo.Winner).Score))) / 5.0000000) * (GetResultPointRatio_Intervention(PRI)));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function int GetTotalPlayedTime()
{
    return RoundTimeLimit * 60;
    //return;    
}

function int GetBootySeedValue()
{
    return int(Teams[0].Score + Teams[1].Score) / 2;
    //return;    
}

function CheckLastMan(int TeamIndex)
{
    //return;    
}

function StartMatch()
{
    local Pawn P;
    local wCOLFlagObjective f;

    Log("[wDOMGameInfo::StartMatch] bChangedHost=" $ string(Level.Game.bChangedHost));
    super.StartMatch();
    // End:0xAD
    if(Level.Game.bChangedHost)
    {
        // End:0xA9
        foreach DynamicActors(Class'WMission_Decompressed.wCOLFlagObjective', f)
        {
            // End:0xA7
            foreach f.TouchingActors(Class'Engine.Pawn', P)
            {
                f.Touch(P);                
            }                        
        }                
    }
    else
    {
        SpawnFlag();
    }
    //return;    
}

function SpawnFlag()
{
    local NavigationPoint S;

    S = GetBestFlagSpawnPoint();
    CurrentFlag = Spawn(Class'WMission_Decompressed.wCOLFlagObjective',,, S.Location,, true);
    Log("[SpawnFlag] CurrentFlag=" $ string(CurrentFlag));
    //return;    
}

function NavigationPoint GetBestFlagSpawnPoint()
{
    local int lp1;
    local NavigationPoint S, bestSpawnPoint;
    local Pawn P;
    local int Team;
    local float dist, teamDists, teamMinDists;
    local int teamCount[2];
    local float Score, bestScore, scoreAvg, scoreMin, scoreRemote;

    // End:0x12
    if(FlagSpawnPoints.Length == 0)
    {
        InitFlagSpawnPoints();
    }
    bestScore = -1.0000000;
    lp1 = 0;
    J0x24:

    // End:0x3F5 [Loop If]
    if(lp1 < FlagSpawnPoints.Length)
    {
        S = FlagSpawnPoints[lp1];
        clog((("[wCOLGameInfo::GetBestFlagSpawnPoint] " $ string(S)) $ " at ") $ string(S.Location));
        teamDists[0] = 0.0000000;
        teamDists[1] = 0.0000000;
        teamCount[0] = 0;
        teamCount[1] = 0;
        teamMinDists[0] = 99999.0000000;
        teamMinDists[1] = 99999.0000000;
        // End:0x197
        foreach DynamicActors(Class'Engine.Pawn', P)
        {
            // End:0x196
            if((P.Health > 0) && P.Controller != none)
            {
                dist = VSize(P.Location - S.Location);
                Team = P.GetTeamNum();
                teamDists[Team] += dist;
                teamCount[Team]++;
                // End:0x196
                if(dist < teamMinDists[Team])
                {
                    teamMinDists[Team] = dist;
                }
            }            
        }        
        teamDists[0] /= FMax(float(teamCount[0]), 1.0000000);
        teamDists[1] /= FMax(float(teamCount[1]), 1.0000000);
        scoreAvg = FMin(teamDists[0], teamDists[1]) / FMax(FMax(teamDists[0], teamDists[1]), 1.0000000);
        scoreMin = FMin(teamMinDists[0], teamMinDists[1]) / FMax(FMax(teamMinDists[0], teamMinDists[1]), 1.0000000);
        scoreRemote = 0.0000000;
        // End:0x267
        if((teamMinDists[0] > float(1700)) && teamMinDists[1] > float(1700))
        {
            scoreRemote += 0.3000000;
        }
        // End:0x29B
        if((teamMinDists[0] > float(2600)) && teamMinDists[1] > float(2600))
        {
            scoreRemote += 0.3000000;
        }
        // End:0x2CF
        if((teamMinDists[0] > float(3500)) && teamMinDists[1] > float(3500))
        {
            scoreRemote += 0.3000000;
        }
        clog((((("[wCOLGameInfo::GetBestFlagSpawnPoint] scoreAvg=" $ string(scoreAvg)) $ " scoreMin=") $ string(scoreMin)) $ " scoreRemote=") $ string(scoreRemote));
        Log((((("[wCOLGameInfo::GetBestFlagSpawnPoint] scoreAvg=" $ string(scoreAvg)) $ " scoreMin=") $ string(scoreMin)) $ " scoreRemote=") $ string(scoreRemote));
        Score = (scoreAvg + scoreMin) + scoreRemote;
        // End:0x3EB
        if(Score > bestScore)
        {
            bestScore = Score;
            bestSpawnPoint = S;
        }
        lp1++;
        // [Loop Continue]
        goto J0x24;
    }
    Log("[wCOLGameInfo::GetBestFlagSpawnPoint] returning " $ string(bestSpawnPoint));
    return bestSpawnPoint;
    //return;    
}

function OnFlagCaptured(wCOLFlagObjective flag)
{
    AddTeamScore(flag.iActiveTeam);
    AnnounceWinningTeam();
    SpawnFlag();
    flag.Destroy();
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundDOMAllyCaptured, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundDOMEnemyCaptured, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturedAll, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturedAll, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturingA, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturingB, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturingC, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturingA, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturingB, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturingC, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturedA, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturedB, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturedC, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturedA, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturedB, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturedC, Class'Engine.Sound');
    //return;    
}

function GetFlagsInfo(out int outNumFlags, out int outNumCapturedFlagsByTeam1, out int outNumCapturedFlagsByTeam2)
{
    outNumFlags = 1;
    // End:0x2C
    if(CurrentFlag.iActiveTeam == 1)
    {
        outNumCapturedFlagsByTeam1 = 1;
        outNumCapturedFlagsByTeam2 = 0;        
    }
    else
    {
        // End:0x52
        if(CurrentFlag.iActiveTeam == 2)
        {
            outNumCapturedFlagsByTeam1 = 0;
            outNumCapturedFlagsByTeam2 = 1;            
        }
        else
        {
            outNumCapturedFlagsByTeam1 = 0;
            outNumCapturedFlagsByTeam2 = 0;
        }
    }
    //return;    
}

state MatchInProgress
{
    function Timer()
    {
        // End:0x3D
        if((Teams[0].Score == float(ScoreLimit)) && Teams[1].Score == float(ScoreLimit))
        {            
        }
        else
        {
            // End:0x70
            if(Teams[0].Score >= float(ScoreLimit))
            {
                EndCOLGame(0, none, "0 Team Win");                
            }
            else
            {
                // End:0xA0
                if(Teams[1].Score >= float(ScoreLimit))
                {
                    EndCOLGame(1, none, "1 Team Win");
                }
            }
        }
        // End:0xB1
        if(CurrentFlag == none)
        {
            SpawnFlag();
        }
        super.Timer();
        //return;        
    }
    stop;    
}

state MatchOver
{
    function EndCOLGame(int iWinningTeam, Pawn Instigator, string Reason)
    {
        //return;        
    }
    stop;    
}

defaultproperties
{
    FlagScore=1
    RoundTimeLimit=15
    ScoreLimit=200
    sndChangeAttackTeam=""
    sndLastMan=""
    sndRoundWin=""
    sndRoundLose=""
    DefaultMaxLives=0
    sndModeName=".Mode_Dom.v_dom_R"
    sndModeExplain=".Mode_Dom.v_dom_all_01_R"
    HUDType="wMission.wHUD_Collection"
    GameName="Collection"
    GameAddExp=13.0000000
    GameAssistExp=4.0000000
    GamePenaltyExp=13.0000000
    GameAddPoint=4.0000000
    GameAssistPoint=1.0000000
    GamePenaltyPoint=4.0000000
    GameAddMultiKillExp=/* Array type was not detected. */
    bHasRespawnRestriction=false
}