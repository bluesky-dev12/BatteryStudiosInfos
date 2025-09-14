/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wMedalGameInfo.uc
 * Package Imports:
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:23
 *	States:2
 *
 *******************************************************************************/
class wMedalGameInfo extends wMSGameInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

function ChangeHostExtraWork();
function PostBeginPlay()
{
    super.PostBeginPlay();
}

function CheckEndGameAfterRoundTimeOver()
{
    clog("[wMedalGameInfo::CheckEndGameAfterRoundTimeOver]");
    TeamWithGreaterScoreWinsRound();
}

function SetRoundTimeLimit()
{
    // End:0x25
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = PracticeTimeLimit;
    }
    // End:0x3b
    else
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = 90;
    }
}

function AddTeamScore(int iTeamIndex)
{
    Teams[iTeamIndex].Score += float(1);
    Teams[iTeamIndex].NetUpdateTime = Level.TimeSeconds - float(1);
}

function BeginWaitingForStart()
{
    super(GameInfo).BeginWaitingForStart();
    DestroyMedals();
    SpawnNeutralMedal();
    GiveMedals();
}

function SpawnNeutralMedal()
{
    local wSBTBombObjective obj;
    local Actor A;

    // End:0x34
    foreach DynamicActors(class'wSBTBombObjective', obj)
    {
        A = Spawn(class'wMedalPack',,, obj.Location,, true);
        // End:0x34
        break;                
    }
}

function DestroyMedals()
{
    local int lp1;
    local Actor medal;

    lp1 = 0;
    J0x07:
    // End:0x50 [While If]
    if(lp1 < Level.Medals.Length)
    {
        medal = Level.Medals[lp1];
        medal.Destroy();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function GiveMedals()
{
    local int numMedalsAF, numMedalsRSA;
    local Controller C;
    local int numAF, numRSA;

    numMedalsAF = 8;
    numMedalsRSA = 8;
    numAF = 0;
    numRSA = 0;
    Teams[0].Score2 = 0.0;
    Teams[1].Score2 = 0.0;
    C = Level.ControllerList;
    J0x5e:
    // End:0x99 [While If]
    if(C != none)
    {
        C.PlayerReplicationInfo.NumMedals = 0;
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
    C = Level.ControllerList;
    J0xad:
    // End:0x128 [While If]
    if(C != none)
    {
        // End:0x111
        if(!C.PlayerReplicationInfo.bBot && C.IsInState('WaitingForStart'))
        {
            // End:0x10a
            if(C.GetTeamNum() == 0)
            {
                ++ numAF;
            }
            // End:0x111
            else
            {
                ++ numRSA;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    C = Level.ControllerList;
    J0x13c:
    // End:0x242 [While If]
    if(C != none)
    {
        // End:0x22b
        if(!C.PlayerReplicationInfo.bBot && C.IsInState('WaitingForStart'))
        {
            // End:0x1d4
            if(C.GetTeamNum() == 0 && numMedalsAF > 0)
            {
                ++ C.PlayerReplicationInfo.NumMedals;
                -- numMedalsAF;
                Teams[0].Score2 += float(1);
            }
            // End:0x22b
            else
            {
                // End:0x22b
                if(C.GetTeamNum() == 1 && numMedalsRSA > 0)
                {
                    ++ C.PlayerReplicationInfo.NumMedals;
                    -- numMedalsRSA;
                    Teams[1].Score2 += float(1);
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x13c;
    }
    // End:0x128
    if(numMedalsAF == 0 || numAF == 0 && numMedalsRSA == 0 || numRSA == 0)
    	goto J0x128;
    C = Level.ControllerList;
    J0x288:
    // End:0x304 [While If]
    if(C != none)
    {
        dblog("[GiveMedals] name=" $ C.PlayerReplicationInfo.PlayerName $ " medals=" $ string(C.PlayerReplicationInfo.NumMedals));
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x288;
    }
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    super.EndRound(RoundEndReason, Instigator, Reason);
}

function TeamWithGreaterScoreWinsRound()
{
    clog("[wMedalGameInfo::TeamWithGreaterScoreWinsRound]");
    // End:0x7e
    if(Teams[0].Score2 > Teams[1].Score2)
    {
        EndRound(5, none, "MaxLive - Team0 Wins");
    }
    // End:0xc2
    else
    {
        // End:0xc2
        if(Teams[0].Score2 < Teams[1].Score2)
        {
            EndRound(6, none, "MaxLive - Team0 Wins");
        }
    }
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    clog("[wMedalGameInfo::OnRoundTimeOverWithoutObjectPlanted]");
    TeamWithGreaterScoreWinsRound();
}

function AssacinateTeam(int Team)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xb8 [While If]
    if(C != none)
    {
        // End:0xa1
        if(C.Pawn != none && C.GetTeamNum() == Team)
        {
            C.Pawn.TakeDamage(C.Pawn.Health * 10, none, vect(0.0, 0.0, 0.0), vect(0.0, 0.0, 0.0), class'wDamageUnknown');
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;

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
    return FindPlayerStart_SD(Team);
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
    super.StartMatch();
    // End:0x24
    if(Level.Game.bChangedHost)
    {
    }
    // End:0x24
    else
    {
    }
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    super.Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    CheckMaxLives(none);
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    clog("[wMedalGameInfo::EndGameByTeamNoneLeft]");
    // End:0xa0
    if(GameReplicationInfo.Teams[Living.Team.TeamIndex].Score2 > GameReplicationInfo.Teams[1 - Living.Team.TeamIndex].Score2)
    {
        TeamWithGreaterScoreWinsRound();
        return true;
    }
    // End:0xa2
    else
    {
        return false;
    }
}

state MatchInProgress
{
    function Timer()
    {
        super.Timer();
    }

}

state MatchOver
{
    function EndMedalGame(int iWinningTeam, Pawn Instigator, string Reason);

}

defaultproperties
{
    sndChangeAttackTeam=""
    sndLastMan=""
    sndRoundWin=""
    sndRoundLose=""
    sndModeName=.Mode_Dom.v_dom_R
    sndModeExplain=.Mode_Dom.v_dom_all_01_R
    HUDType="wMission.wHUD_Medal"
    GameName="Medal"
    GameAddExp=13.0
    GameAssistExp=4.0
    GamePenaltyExp=13.0
    GameAddPoint=4.0
    GameAssistPoint=1.0
    GamePenaltyPoint=4.0
    GameAddMultiKillExp=// Object reference not set to an instance of an object.
    
    bHasRespawnRestriction=true
}