class wMedalGameInfo extends wMSGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ChangeHostExtraWork()
{
    //return;    
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

function CheckEndGameAfterRoundTimeOver()
{
    clog("[wMedalGameInfo::CheckEndGameAfterRoundTimeOver]");
    TeamWithGreaterScoreWinsRound();
    //return;    
}

function SetRoundTimeLimit()
{
    // End:0x25
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = PracticeTimeLimit;        
    }
    else
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = 90;
    }
    //return;    
}

function AddTeamScore(int iTeamIndex)
{
    Teams[iTeamIndex].Score += float(1);
    Teams[iTeamIndex].NetUpdateTime = Level.TimeSeconds - float(1);
    //return;    
}

function BeginWaitingForStart()
{
    super(GameInfo).BeginWaitingForStart();
    DestroyMedals();
    SpawnNeutralMedal();
    GiveMedals();
    //return;    
}

function SpawnNeutralMedal()
{
    local wSBTBombObjective obj;
    local Actor A;

    // End:0x34
    foreach DynamicActors(Class'WMission_Decompressed.wSBTBombObjective', obj)
    {
        A = Spawn(Class'WGame.wMedalPack',,, obj.Location,, true);
        // End:0x34
        break;        
    }    
    //return;    
}

function DestroyMedals()
{
    local int lp1;
    local Actor medal;

    lp1 = 0;
    J0x07:

    // End:0x50 [Loop If]
    if(lp1 < Level.Medals.Length)
    {
        medal = Level.Medals[lp1];
        medal.Destroy();
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    Teams[0].Score2 = 0.0000000;
    Teams[1].Score2 = 0.0000000;
    C = Level.ControllerList;
    J0x5E:

    // End:0x99 [Loop If]
    if(C != none)
    {
        C.PlayerReplicationInfo.NumMedals = 0;
        C = C.nextController;
        // [Loop Continue]
        goto J0x5E;
    }
    C = Level.ControllerList;
    J0xAD:

    // End:0x128 [Loop If]
    if(C != none)
    {
        // End:0x111
        if(!C.PlayerReplicationInfo.bBot && C.IsInState('WaitingForStart'))
        {
            // End:0x10A
            if(C.GetTeamNum() == 0)
            {
                numAF++;                
            }
            else
            {
                numRSA++;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0xAD;
    }
    J0x128:

    C = Level.ControllerList;
    J0x13C:

    // End:0x242 [Loop If]
    if(C != none)
    {
        // End:0x22B
        if(!C.PlayerReplicationInfo.bBot && C.IsInState('WaitingForStart'))
        {
            // End:0x1D4
            if((C.GetTeamNum() == 0) && numMedalsAF > 0)
            {
                C.PlayerReplicationInfo.NumMedals++;
                numMedalsAF--;
                Teams[0].Score2 += float(1);                
            }
            else
            {
                // End:0x22B
                if((C.GetTeamNum() == 1) && numMedalsRSA > 0)
                {
                    C.PlayerReplicationInfo.NumMedals++;
                    numMedalsRSA--;
                    Teams[1].Score2 += float(1);
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x13C;
    }
    // End:0x128
    if(!(((numMedalsAF == 0) || numAF == 0) && (numMedalsRSA == 0) || numRSA == 0))
        goto J0x128;
    C = Level.ControllerList;
    J0x288:

    // End:0x304 [Loop If]
    if(C != none)
    {
        dblog((("[GiveMedals] name=" $ C.PlayerReplicationInfo.PlayerName) $ " medals=") $ string(C.PlayerReplicationInfo.NumMedals));
        C = C.nextController;
        // [Loop Continue]
        goto J0x288;
    }
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    super.EndRound(RoundEndReason, Instigator, Reason);
    //return;    
}

function TeamWithGreaterScoreWinsRound()
{
    clog("[wMedalGameInfo::TeamWithGreaterScoreWinsRound]");
    // End:0x7E
    if(Teams[0].Score2 > Teams[1].Score2)
    {
        EndRound(5, none, "MaxLive - Team0 Wins");        
    }
    else
    {
        // End:0xC2
        if(Teams[0].Score2 < Teams[1].Score2)
        {
            EndRound(6, none, "MaxLive - Team0 Wins");
        }
    }
    //return;    
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    clog("[wMedalGameInfo::OnRoundTimeOverWithoutObjectPlanted]");
    TeamWithGreaterScoreWinsRound();
    //return;    
}

function AssacinateTeam(int Team)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0xB8 [Loop If]
    if(C != none)
    {
        // End:0xA1
        if((C.Pawn != none) && C.GetTeamNum() == Team)
        {
            C.Pawn.TakeDamage(C.Pawn.Health * 10, none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.wDamageUnknown');
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;

    // End:0x6B
    if(((Player != none) && Player.PlayerReplicationInfo != none) && Player.PlayerReplicationInfo.Team != none)
    {
        Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);        
    }
    else
    {
        Team = inTeam;
    }
    return FindPlayerStart_SD(Team);
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
        PRI.fExp += ((TeamInfo(GameReplicationInfo.Winner).Score / 3.5000000) * (GetResultPointRatio_Intervention(PRI)));
        PRI.Point += ((TeamInfo(GameReplicationInfo.Winner).Score / 3.3000000) * (GetResultPointRatio_Intervention(PRI)));
        // End:0x11F
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += ((float(Min(ScoreLimit, int(TeamInfo(GameReplicationInfo.Winner).Score))) / 5.0000000) * (GetResultPointRatio_Intervention(PRI)));
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
    super.StartMatch();
    // End:0x24
    if(Level.Game.bChangedHost)
    {        
    }
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    //return;    
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    super.Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    CheckMaxLives(none);
    //return;    
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    clog("[wMedalGameInfo::EndGameByTeamNoneLeft]");
    // End:0xA0
    if(GameReplicationInfo.Teams[Living.Team.TeamIndex].Score2 > GameReplicationInfo.Teams[1 - Living.Team.TeamIndex].Score2)
    {
        TeamWithGreaterScoreWinsRound();
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

state MatchInProgress
{
    function Timer()
    {
        super.Timer();
        //return;        
    }
    stop;    
}

state MatchOver
{
    function EndMedalGame(int iWinningTeam, Pawn Instigator, string Reason)
    {
        //return;        
    }
    stop;    
}

defaultproperties
{
    sndChangeAttackTeam=""
    sndLastMan=""
    sndRoundWin=""
    sndRoundLose=""
    sndModeName=".Mode_Dom.v_dom_R"
    sndModeExplain=".Mode_Dom.v_dom_all_01_R"
    HUDType="wMission.wHUD_Medal"
    GameName="Medal"
    GameAddExp=13.0000000
    GameAssistExp=4.0000000
    GamePenaltyExp=13.0000000
    GameAddPoint=4.0000000
    GameAssistPoint=1.0000000
    GamePenaltyPoint=4.0000000
    GameAddMultiKillExp=/* Array type was not detected. */
    bHasRespawnRestriction=false
}