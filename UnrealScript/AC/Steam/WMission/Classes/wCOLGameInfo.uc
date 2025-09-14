/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wCOLGameInfo.uc
 * Package Imports:
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:31
 *	States:2
 *
 *******************************************************************************/
class wCOLGameInfo extends wMSGameInfo
    dependson(wMSCinematic_SceneManager)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

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
    // End:0x5e
    if(npcActions.GotoFlag)
    {
        Actions[Actions.Length] = wAction_GotoFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(class'wAction_GotoFlag')).Init(CurrentFlag);
    }
    // End:0xbc
    if(npcActions.CaptureFlag)
    {
        Actions[Actions.Length] = wAction_CaptureFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(class'wAction_CaptureFlag')).Init(CurrentFlag);
    }
}

function Actor GetNearFlag(Actor A)
{
    // End:0x40
    if(VSize(CurrentFlag.Location - A.Location) < class'wCOLFlagObjective'.default.CollisionRadius * 0.750)
    {
        return CurrentFlag;
    }
    return none;
}

function ChangeHostExtraWork()
{
    local wCOLFlagObjective f;

    // End:0x20
    foreach DynamicActors(class'wCOLFlagObjective', f)
    {
        f.RecoverCapturing();                
    }
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    InitFlagSpawnPoints();
}

function InitFlagSpawnPoints()
{
    local COLFlagSpawnPoint f;
    local NavigationPoint N;
    local float Angle;

    Log("[wCOLGameInfo::InitFlagSpawnPoints]");
    FlagSpawnPoints.Length = 0;
    // End:0x52
    foreach DynamicActors(class'COLFlagSpawnPoint', f)
    {
        FlagSpawnPoints[FlagSpawnPoints.Length] = f;                
    }
    // End:0x142
    if(FlagSpawnPoints.Length < 2)
    {
        Angle = -0.90;
        J0x6b:
        // End:0x142 [While If]
        if(Angle <= float(0))
        {
            FlagSpawnPoints.Length = 0;
            // End:0xd5
            foreach DynamicActors(class'NavigationPoint', N)
            {
                // End:0xd4
                if(!N.IsA('FlyingPathNode') && N.MaxCoverAngle[1] < Angle)
                {
                    FlagSpawnPoints[FlagSpawnPoints.Length] = N;
                }                                
            }
            Log("[wCOLGameInfo::InitFlagSpawnPoints] angle=" $ string(Angle) $ " length=" $ string(FlagSpawnPoints.Length));
            // End:0x133
            if(FlagSpawnPoints.Length > 4)
            {
            }
            // End:0x142
            else
            {
                Angle += 0.10;
                // This is an implied JumpToken; Continue!
                goto J0x6b;
            }
        }
    }
}

function CheckEndGameAfterRoundTimeOver()
{
    // End:0x3c
    if(Teams[0].Score > Teams[1].Score)
    {
        EndCOLGame(0, none, "0 Team Win");
    }
    // End:0x75
    else
    {
        // End:0x75
        if(Teams[1].Score > Teams[0].Score)
        {
            EndCOLGame(1, none, "1 Team Win");
        }
    }
}

function AddTeamScore(int iTeamIndex)
{
    Teams[iTeamIndex].Score += float(FlagScore);
    Teams[iTeamIndex].NetUpdateTime = Level.TimeSeconds - float(1);
    FlagState_UpdateDomScore(int(Teams[0].Score), int(Teams[1].Score));
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    // End:0x3f
    if(Teams[0].Score == Teams[1].Score)
    {
        EndCOLGame(-1, none, "Draw Game");
    }
    // End:0xb4
    else
    {
        // End:0x7b
        if(Teams[0].Score > Teams[1].Score)
        {
            EndCOLGame(0, none, "0 Team Win");
        }
        // End:0xb4
        else
        {
            // End:0xb4
            if(Teams[0].Score < Teams[1].Score)
            {
                EndCOLGame(1, none, "1 Team Win");
            }
        }
    }
}

function OnRoundTimeOverWithoutObjectPlanted();
function EndCOLGame(int iWinningTeam, Pawn Instigator, string Reason)
{
    local PlayerReplicationInfo PRI;

    // End:0x1a
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
    // End:0xcd
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundWinner = 1;
        wMSGameReplicationInfo(GameReplicationInfo).RoundOverTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime + RemainingTime;
    }
    // End:0xe7
    else
    {
        // End:0xe7
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
    // End:0x15d
    if(bGameEnded)
    {
        GotoState('MatchOver');
    }
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
    // End:0xe1
    if(PawnOverrideClass != "")
    {
        SpawnAndPossessPawn(C, PawnOverrideClass);
        wMSPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass = "";
    }
    // End:0x13b
    if(C.StartSpot != none)
    {
        C.SetLocation(C.StartSpot.Location);
        C.SetRotation(C.StartSpot.Rotation);
    }
    // End:0x23f
    if(C.Pawn != none)
    {
        SetPlayerDefaults(C.Pawn);
        C.Pawn.SetLocation(C.StartSpot.Location);
        C.Pawn.SetRotation(C.StartSpot.Rotation);
        C.Pawn.Velocity = vect(0.0, 0.0, 0.0);
        C.Pawn.PlayTeleportEffect(false, true);
        // End:0x23f
        if(Bot(C) != none && PawnOverrideClass == "")
        {
            Bot(C).Squad.Retask(Bot(C));
        }
    }
    // End:0x290
    if(C.StartSpot != none)
    {
        C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
    }
}

function array<Actor> GetEveryEnemyList(byte myTeam)
{
    local array<Actor> enemies;

    enemies = super(GameInfo).GetEveryEnemyList(myTeam);
    enemies[enemies.Length] = CurrentFlag;
    return enemies;
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;
    local NavigationPoint respawnPoint;
    local Pawn pickedAlly;

    // End:0x6b
    if(Player != none && Player.PlayerReplicationInfo != none && Player.PlayerReplicationInfo.Team != none)
    {
        Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);
    }
    // End:0x76
    else
    {
        Team = inTeam;
    }
    // End:0x8e
    if(IsSDRespawnTime())
    {
        return FindPlayerStart_SD(Team);
    }
    // End:0x1ab
    else
    {
        // End:0xb0
        if(IsRespawnSpecialCase())
        {
            respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
        }
        // End:0x151
        else
        {
            // End:0x13b
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
            // End:0x151
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
            foreach AllActors(class'NavigationPoint', respawnPoint)
            {
                // End:0x194
                break;                                
            }
        }
        LogFinalRespawnPoint(respawnPoint, Team);
        return respawnPoint;
    }
}

function InitializeCodes()
{
    // End:0x118
    if(Codes_AllyCapturing.Length == 0)
    {
        Codes_AllyCapturing[0] = class'wMessage_Game'.default.Code_DOMAllyCapturingA;
        Codes_AllyCapturing[1] = class'wMessage_Game'.default.Code_DOMAllyCapturingB;
        Codes_AllyCapturing[2] = class'wMessage_Game'.default.Code_DOMAllyCapturingC;
        Codes_AllyCaptured[0] = class'wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedA;
        Codes_AllyCaptured[1] = class'wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedB;
        Codes_AllyCaptured[2] = class'wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedC;
        Codes_EnemyCapturing[0] = class'wMessage_Game'.default.Code_DOMEnemyCapturingA;
        Codes_EnemyCapturing[1] = class'wMessage_Game'.default.Code_DOMEnemyCapturingB;
        Codes_EnemyCapturing[2] = class'wMessage_Game'.default.Code_DOMEnemyCapturingC;
        Codes_EnemyCaptured[0] = class'wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedA;
        Codes_EnemyCaptured[1] = class'wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedB;
        Codes_EnemyCaptured[2] = class'wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedC;
    }
}

function AnnounceFlagCapture(byte byState, byte byTeam, byte byFlagIndex)
{
    InitializeCodes();
    // End:0x33
    if(byState == 0)
    {
        TeamReceiveLocalizedMessage(byTeam, class'wMessage_Game', Codes_AllyCapturing[byFlagIndex]);
    }
    // End:0x84
    else
    {
        // End:0x84
        if(byState == 1)
        {
            TeamReceiveLocalizedMessage(byTeam, class'wMessage_Game_ImpSystem', Codes_AllyCaptured[byFlagIndex]);
            TeamReceiveLocalizedMessage(byte(1 - byTeam), class'wMessage_Game_ImpSystem', Codes_EnemyCaptured[byFlagIndex]);
        }
    }
}

function AnnounceFlagState(byte byState, byte byTeam, name FlagTag)
{
    local byte byFlagIndex;

    byFlagIndex = byte(class'wHUD_Mission'.static.GetGameObjectIndexByTag(FlagTag));
    AnnounceFlagCapture(byState, byTeam, byFlagIndex);
}

function FlagState_TakePoint(array<int> TakerUID, name FlagTag)
{
    local byte byFlagIndex;

    byFlagIndex = byte(class'wHUD_Mission'.static.GetGameObjectIndexByTag(FlagTag));
    // End:0x63
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_TakeAPoint(TakerUID, byFlagIndex, afTakerXCoord, afTakerYCoord, afTakerZCoord, aiTakerPos, aiTakerWeapon, aiTakerWeaponPart, aiTakerRange);
    }
    ClearTakerInfo();
}

function FlagState_UpdateDomScore(int AFScore, int RSAScore)
{
    Log("[wSDGameInfo::sfReqGamePlay_UpdateDomScore]  AF Score:" $ string(AFScore) $ "/ RSA Score:" $ string(RSAScore));
    // End:0x80
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_UpdateDomScore(AFScore, RSAScore);
    }
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
}

function PlayEndOfMatchMessage()
{
    super(TeamGame).PlayEndOfMatchMessage();
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:
    // End:0x136 [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += TeamInfo(GameReplicationInfo.Winner).Score / 3.50 * GetResultPointRatio_Intervention(PRI);
        PRI.Point += TeamInfo(GameReplicationInfo.Winner).Score / 3.30 * GetResultPointRatio_Intervention(PRI);
        // End:0x11f
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += float(Min(ScoreLimit, int(TeamInfo(GameReplicationInfo.Winner).Score))) / 5.0 * GetResultPointRatio_Intervention(PRI);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function int GetTotalPlayedTime()
{
    return RoundTimeLimit * 60;
}

function int GetBootySeedValue()
{
    return int(Teams[0].Score + Teams[1].Score) / 2;
}

function CheckLastMan(int TeamIndex);
function StartMatch()
{
    local Pawn P;
    local wCOLFlagObjective f;

    Log("[wDOMGameInfo::StartMatch] bChangedHost=" $ string(Level.Game.bChangedHost));
    super.StartMatch();
    // End:0xad
    if(Level.Game.bChangedHost)
    {
        // End:0xa9
        foreach DynamicActors(class'wCOLFlagObjective', f)
        {
            // End:0xa7
            foreach f.TouchingActors(class'Pawn', P)
            {
                f.Touch(P);                                
            }                        
        }
    }
    // End:0xb3
    else
    {
        SpawnFlag();
    }
}

function SpawnFlag()
{
    local NavigationPoint S;

    S = GetBestFlagSpawnPoint();
    CurrentFlag = Spawn(class'wCOLFlagObjective',,, S.Location,, true);
    Log("[SpawnFlag] CurrentFlag=" $ string(CurrentFlag));
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
    bestScore = -1.0;
    lp1 = 0;
    J0x24:
    // End:0x3f5 [While If]
    if(lp1 < FlagSpawnPoints.Length)
    {
        S = FlagSpawnPoints[lp1];
        clog("[wCOLGameInfo::GetBestFlagSpawnPoint] " $ string(S) $ " at " $ string(S.Location));
        teamDists[0] = 0.0;
        teamDists[1] = 0.0;
        teamCount[0] = 0;
        teamCount[1] = 0;
        teamMinDists[0] = 99999.0;
        teamMinDists[1] = 99999.0;
        // End:0x197
        foreach DynamicActors(class'Pawn', P)
        {
            // End:0x196
            if(P.Health > 0 && P.Controller != none)
            {
                dist = VSize(P.Location - S.Location);
                Team = P.GetTeamNum();
                teamDists[Team] += dist;
                ++ teamCount[Team];
                // End:0x196
                if(dist < teamMinDists[Team])
                {
                    teamMinDists[Team] = dist;
                }
            }                        
        }
        teamDists[0] /= FMax(float(teamCount[0]), 1.0);
        teamDists[1] /= FMax(float(teamCount[1]), 1.0);
        scoreAvg = FMin(teamDists[0], teamDists[1]) / FMax(FMax(teamDists[0], teamDists[1]), 1.0);
        scoreMin = FMin(teamMinDists[0], teamMinDists[1]) / FMax(FMax(teamMinDists[0], teamMinDists[1]), 1.0);
        scoreRemote = 0.0;
        // End:0x267
        if(teamMinDists[0] > float(1700) && teamMinDists[1] > float(1700))
        {
            scoreRemote += 0.30;
        }
        // End:0x29b
        if(teamMinDists[0] > float(2600) && teamMinDists[1] > float(2600))
        {
            scoreRemote += 0.30;
        }
        // End:0x2cf
        if(teamMinDists[0] > float(3500) && teamMinDists[1] > float(3500))
        {
            scoreRemote += 0.30;
        }
        clog("[wCOLGameInfo::GetBestFlagSpawnPoint] scoreAvg=" $ string(scoreAvg) $ " scoreMin=" $ string(scoreMin) $ " scoreRemote=" $ string(scoreRemote));
        Log("[wCOLGameInfo::GetBestFlagSpawnPoint] scoreAvg=" $ string(scoreAvg) $ " scoreMin=" $ string(scoreMin) $ " scoreRemote=" $ string(scoreRemote));
        Score = scoreAvg + scoreMin + scoreRemote;
        // End:0x3eb
        if(Score > bestScore)
        {
            bestScore = Score;
            bestSpawnPoint = S;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x24;
    }
    Log("[wCOLGameInfo::GetBestFlagSpawnPoint] returning " $ string(bestSpawnPoint));
    return bestSpawnPoint;
}

function OnFlagCaptured(wCOLFlagObjective flag)
{
    AddTeamScore(flag.iActiveTeam);
    AnnounceWinningTeam();
    SpawnFlag();
    flag.Destroy();
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject(class'wMessage_Game'.default.SoundDOMAllyCaptured, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundDOMEnemyCaptured, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturedAll, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturedAll, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturingA, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturingB, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturingC, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturingA, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturingB, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturingC, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturedA, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturedB, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturedC, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturedA, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturedB, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturedC, class'Sound');
}

function GetFlagsInfo(out int outNumFlags, out int outNumCapturedFlagsByTeam1, out int outNumCapturedFlagsByTeam2)
{
    outNumFlags = 1;
    // End:0x2c
    if(CurrentFlag.iActiveTeam == 1)
    {
        outNumCapturedFlagsByTeam1 = 1;
        outNumCapturedFlagsByTeam2 = 0;
    }
    // End:0x60
    else
    {
        // End:0x52
        if(CurrentFlag.iActiveTeam == 2)
        {
            outNumCapturedFlagsByTeam1 = 0;
            outNumCapturedFlagsByTeam2 = 1;
        }
        // End:0x60
        else
        {
            outNumCapturedFlagsByTeam1 = 0;
            outNumCapturedFlagsByTeam2 = 0;
        }
    }
}

state MatchInProgress
{
    function Timer()
    {
        // End:0x3d
        if(Teams[0].Score == float(ScoreLimit) && Teams[1].Score == float(ScoreLimit))
        {
        }
        // End:0xa0
        else
        {
            // End:0x70
            if(Teams[0].Score >= float(ScoreLimit))
            {
                EndCOLGame(0, none, "0 Team Win");
            }
            // End:0xa0
            else
            {
                // End:0xa0
                if(Teams[1].Score >= float(ScoreLimit))
                {
                    EndCOLGame(1, none, "1 Team Win");
                }
            }
        }
        // End:0xb1
        if(CurrentFlag == none)
        {
            SpawnFlag();
        }
        super.Timer();
    }

}

state MatchOver
{
    function EndCOLGame(int iWinningTeam, Pawn Instigator, string Reason);

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
    sndModeName=.Mode_Dom.v_dom_R
    sndModeExplain=.Mode_Dom.v_dom_all_01_R
    HUDType="wMission.wHUD_Collection"
    GameName="Collection"
    GameAddExp=13.0
    GameAssistExp=4.0
    GamePenaltyExp=13.0
    GameAddPoint=4.0
    GameAssistPoint=1.0
    GamePenaltyPoint=4.0
    GameAddMultiKillExp=// Object reference not set to an instance of an object.
    
    bHasRespawnRestriction=true
}