/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASGameInfo.uc
 * Package Imports:
 *	UT2k4Assault
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Enums:1
 *	Properties:27
 *	Functions:75
 *	States:5
 *
 *******************************************************************************/
class ASGameInfo extends wTeamGame
    dependson(PlayerSpawnManager)
    dependson(ASVehicle)
    dependson(ASCinematic_SceneManager)
    dependson(ASCinematic_Camera)
    dependson(GameObject_EnergyCore)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

const ASPROPNUM = 5;

enum ERER_Reason
{
    ERER_AttackersWin,
    ERER_AttackersLose
};

var() config int RoundLimit;
var int MaxRounds;
var() config int RoundTimeLimit;
var() config int PracticeTimeLimit;
var config int ReinforcementsFreq;
var int ReinforcementsValidTime;
var int ReinforcementsCount;
var int SuccessfulAssaultTimeLimit;
var localized string ASPropsDisplayText[5];
var localized string ASPropDescText[5];
var(LoadingHints) private localized array<localized string> ASHints;
var byte CurrentAttackingTeam;
var byte FirstAttackingTeam;
var byte CurrentRound;
var int RoundStartTime;
var bool bDisableReinforcements;
var string NewRoundSound;
var name AttackerWinRound[2];
var name DefenderWinRound[2];
var name DrawGameSound;
var GameObjective CurrentObjective;
var GameObjective LastDisabledObjective;
var Vehicle KeyVehicle;
var array<PlayerSpawnManager> SpawnManagers;
var SceneManager CurrentMatineeScene;
var ASCinematic_SceneManager EndCinematic;
var bool bWeakObjectives;

function Reset();
function CheckReady();
function bool DivertSpaceFighter()
{
    return FRand() < 0.40;
}

function bool AllowTransloc()
{
    return false;
}

static function bool NeverAllowTransloc()
{
    return true;
}

function TweakSkill(Bot B)
{
    // End:0x1b
    if(Level.NetMode != 0)
    {
        return;
    }
    // End:0x65
    if(B.Pawn != none && B.Pawn.IsA('ASVehicle_SpaceFighter_Skaarj'))
    {
        B.Skill = AdjustedDifficulty;
    }
    // End:0xa2
    else
    {
        // End:0xa2
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.Team != B.PlayerReplicationInfo.Team)
        {
        }
    }
    B.Skill = FMax(B.Skill, AdjustedDifficulty + 1.50);
}

function PostBeginPlay()
{
    local GameObjective Go;
    local PlayerSpawnManager PSM;

    super(TeamGame).PostBeginPlay();
    // End:0x29
    foreach AllActors(class'PlayerSpawnManager', PSM)
    {
        SpawnManagers[SpawnManagers.Length] = PSM;                
    }
    Go = Teams[0].AI.Objectives;
    J0x49:
    // End:0xab [While If]
    if(Go != none)
    {
        Go.DefenderTeamIndex = byte(1 - CurrentAttackingTeam);
        Go.NetUpdateTime = Level.TimeSeconds - float(1);
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    // End:0xc4
    foreach AllActors(class'ASCinematic_SceneManager', EndCinematic, 'OutroScene')
    {
        // End:0xc4
        break;                
    }
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController PC;
    local bool bSpectator;

    PC = super(DeathMatch).Login(Portal, Options, Error);
    // End:0xb1
    if(PC != none)
    {
        // End:0xb1
        if(Level.NetMode == 0)
        {
            bSpectator = ParseOption(Options, "SpectatorOnly") ~= "1";
            CurrentRound = 1;
            // End:0xb1
            if(!bQuickStart && !bSpectator && !PC.PlayerReplicationInfo.bOnlySpectator)
            {
                TriggerEvent('IntroScene', self, none);
            }
        }
    }
    return PC;
}

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    RoundTimeLimit = Max(0, GetIntOption(Options, "RoundTimeLimit", RoundTimeLimit));
    PracticeTimeLimit = Max(0, GetIntOption(Options, "PracticeTimeLimit", PracticeTimeLimit));
    RoundLimit = Max(0, GetIntOption(Options, "RoundLimit", RoundLimit));
    MaxRounds = RoundLimit * 2;
    FirstAttackingTeam = byte(Max(0, GetIntOption(Options, "FirstAttackingTeam", FirstAttackingTeam)));
    ResetTimeDelay = Max(0, GetIntOption(Options, "ResetTimeDelay", ResetTimeDelay));
    ReinforcementsFreq = Max(0, GetIntOption(Options, "ReinforcementsFreq", ReinforcementsFreq));
    TimeLimit = 0;
    RemainingTime = RoundTimeLimit + ResetTimeDelay + 1 * 60 * MaxRounds + 2 + PracticeTimeLimit;
    // End:0x171
    if(GameReplicationInfo != none)
    {
        GameReplicationInfo.RemainingTime = RemainingTime;
    }
}

function StartMatch()
{
    super.StartMatch();
    // End:0x37
    if(CurrentRound == 0 && Level.NetMode == 0)
    {
        StartNewRound();
    }
    // End:0x3d
    else
    {
        BeginRound();
    }
}

function InitGameReplicationInfo()
{
    super(DeathMatch).InitGameReplicationInfo();
    ASGameReplicationInfo(GameReplicationInfo).MaxRounds = RoundLimit * 2;
}

function Logout(Controller Exiting)
{
    // End:0x3a
    if(Exiting.PlayerReplicationInfo.HasFlag != none)
    {
        GameObjectDropped(Exiting.PlayerReplicationInfo.HasFlag);
    }
    super(DeathMatch).Logout(Exiting);
}

function DiscardInventory(Pawn Other)
{
    // End:0x0d
    if(Other == none)
    {
        return;
    }
    // End:0x5d
    if(Other.PlayerReplicationInfo != none && Other.PlayerReplicationInfo.HasFlag != none)
    {
        GameObjectDropped(Other.PlayerReplicationInfo.HasFlag);
    }
    super(GameInfo).DiscardInventory(Other);
}

function GameObjectDropped(Decoration D)
{
    // End:0x2b
    if(D.IsA('GameObject_EnergyCore'))
    {
        GameObject_EnergyCore(D).HolderDied();
    }
    // End:0x47
    else
    {
        D.Drop(vect(0.0, 0.0, 0.0));
    }
}

function BroadCast_AssaultRole_Message(PlayerController C)
{
    // End:0x39
    if(!GameReplicationInfo.bMatchHasBegun || !IsPlaying() || bGameEnded || bWaitingToStartMatch)
    {
        return;
    }
    // End:0x77
    if(IsAttackingTeam(C.GetTeamNum()))
    {
        C.ReceiveLocalizedMessage(class'Message_AssaultTeamRole', 0, C.PlayerReplicationInfo);
    }
    // End:0x9a
    else
    {
        C.ReceiveLocalizedMessage(class'Message_AssaultTeamRole', 1, C.PlayerReplicationInfo);
    }
}

event SceneStarted(SceneManager SM, Actor Other)
{
    // End:0x39
    if(Other != none && Other.IsA('ASCinematic_SceneManager'))
    {
        // End:0x37
        if(Other == EndCinematic)
        {
            GotoState('MPOutroCinematic');
        }
        return;
    }
    CurrentMatineeScene = SM;
    // End:0x63
    if(SM.Tag == 'IntroScene')
    {
        GotoState('SPIntroCinematic');
    }
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local PlayerController PC;
    local Controller C;

    // End:0x3e
    if(Teams[1].Score > Teams[0].Score)
    {
        GameReplicationInfo.Winner = Teams[1];
    }
    // End:0x8c
    else
    {
        // End:0x7c
        if(Teams[1].Score < Teams[0].Score)
        {
            GameReplicationInfo.Winner = Teams[0];
        }
        // End:0x8c
        else
        {
            GameReplicationInfo.Winner = none;
        }
    }
    C = Level.ControllerList;
    J0xa0:
    // End:0x11f [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x108
        if(PC != none)
        {
            // End:0x108
            if(CurrentGameProfile != none)
            {
                CurrentGameProfile.bWonMatch = PC.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0xa0;
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    return true;
}

function EndRound(ASGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int ScoringTeam;
    local PlayerReplicationInfo PRI;
    local PlayerController PC;
    local Controller C, NextC;
    local GameObjective ObjectiveFocus;
    local bool bObjectiveHasEndCam, bSuccessfulAttack;

    // End:0x1a
    if(!IsPlaying() || ResetCountDown > 0)
    {
        return;
    }
    Log("ASGameInfo::EndRound - Reason:" @ Reason);
    // End:0x8d
    if(RoundEndReason == 0 && LastDisabledObjective != none && LastDisabledObjective.DisabledBy != none)
    {
        PRI = LastDisabledObjective.DisabledBy;
    }
    // End:0xac
    else
    {
        // End:0xac
        if(Instigator != none)
        {
            PRI = Instigator.PlayerReplicationInfo;
        }
    }
    ObjectiveFocus = GetCurrentObjective();
    SuccessfulAssaultTimeLimit = 0;
    // End:0x124
    if(IsPracticeRound())
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 1;
        ASGameReplicationInfo(GameReplicationInfo).RoundOverTime = ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - ASGameReplicationInfo(GameReplicationInfo).RoundStartTime + RemainingTime;
    }
    // End:0x2a7
    else
    {
        // End:0x1ef
        if(RoundEndReason == 0)
        {
            // End:0x188
            if(PRI != none && PRI.IsA('ASPlayerReplicationInfo'))
            {
                ++ ASPlayerReplicationInfo(PRI).DisabledFinalObjective;
                GameEvent("EndRound_Trophy", "", PRI);
            }
            // End:0x1af
            if(float(CurrentRound) % float(2) == float(1))
            {
                SuccessfulAssaultTimeLimit = RoundStartTime - RemainingTime;
            }
            ScoringTeam = CurrentAttackingTeam;
            bSuccessfulAttack = true;
            GameEvent("AS_attackers_win", "" $ string(ScoringTeam), PRI);
        }
        // End:0x281
        else
        {
            // End:0x249
            if(ObjectiveFocus != none)
            {
                ObjectiveFocus.SavedObjectiveProgress = ObjectiveFocus.GetObjectiveProgress();
                Teams[1 - ObjectiveFocus.DefenderTeamIndex].CurrentObjectiveProgress = ObjectiveFocus.SavedObjectiveProgress;
            }
            ScoringTeam = 1 - CurrentAttackingTeam;
            GameEvent("AS_defenders_win", "" $ string(ScoringTeam), PRI);
        }
        AnnounceScore(ScoringTeam);
        // End:0x2a7
        if(float(CurrentRound) % float(2) == float(0))
        {
            SetPairOfRoundWinner();
        }
    }
    TriggerEvent('EndRound', self, Instigator);
    // End:0x2e1
    if(bSuccessfulAttack && EndCinematic != none)
    {
        EndCinematic.Trigger(self, none);
        return;
    }
    // End:0x304
    if(ObjectiveFocus == none && LastDisabledObjective != none)
    {
        ObjectiveFocus = LastDisabledObjective;
    }
    // End:0x462
    if(ObjectiveFocus != none)
    {
        ObjectiveFocus.bAlwaysRelevant = true;
        // End:0x357
        if(ObjectiveFocus.EndCamera != none && ASCinematic_Camera(ObjectiveFocus.EndCamera) != none)
        {
            bObjectiveHasEndCam = true;
        }
        C = Level.ControllerList;
        J0x36b:
        // End:0x45f [While If]
        if(C != none)
        {
            NextC = C.nextController;
            // End:0x451
            if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                PC = PlayerController(C);
                // End:0x442
                if(PC != none)
                {
                    // End:0x40b
                    if(bObjectiveHasEndCam)
                    {
                        ASCinematic_Camera(ObjectiveFocus.EndCamera).ViewFixedObjective(PC, ObjectiveFocus);
                    }
                    // End:0x433
                    else
                    {
                        PC.ClientSetViewTarget_O(ObjectiveFocus);
                        PC.SetViewTarget(ObjectiveFocus);
                    }
                    PC.ClientRoundEnded();
                }
                C.RoundHasEnded();
            }
            C = NextC;
            // This is an implied JumpToken; Continue!
            goto J0x36b;
        }
    }
    // End:0x49b
    else
    {
        Log("ASGameInfo::EndRound ObjectiveFocus == None !!!!!!!!!");
    }
    // End:0x4d1
    if(CurrentRound >= MaxRounds)
    {
        EndGame(none, "roundlimit");
        // End:0x4cf
        if(bGameEnded)
        {
            GotoState('MatchOver');
        }
        return;
    }
    QueueAnnouncerSound(NewRoundSound, 1, byte(255));
    ResetCountDown = ResetTimeDelay + 1;
}

function PracticeRoundEnded()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x12b [While If]
    if(C != none)
    {
        // End:0x114
        if(C.PlayerReplicationInfo != none)
        {
            C.PlayerReplicationInfo.Kills = 0;
            C.PlayerReplicationInfo.Score = 0.0;
            C.PlayerReplicationInfo.Deaths = 0.0;
            // End:0xbd
            if(TeamPlayerReplicationInfo(C.PlayerReplicationInfo) != none)
            {
                TeamPlayerReplicationInfo(C.PlayerReplicationInfo).Suicides = 0;
            }
            // End:0x114
            if(ASPlayerReplicationInfo(C.PlayerReplicationInfo) != none)
            {
                ASPlayerReplicationInfo(C.PlayerReplicationInfo).DisabledObjectivesCount = 0;
                ASPlayerReplicationInfo(C.PlayerReplicationInfo).DisabledFinalObjective = 0;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    bFirstBlood = false;
    Teams[0].Score = 0.0;
    Teams[1].Score = 0.0;
    Teams[0].NetUpdateTime = Level.TimeSeconds - float(1);
    Teams[1].NetUpdateTime = Level.TimeSeconds - float(1);
}

function SetPairOfRoundWinner()
{
    local byte WinningTeam;

    WinningTeam = GetPairOfRoundWinner();
    // End:0x89
    if(WinningTeam < 2)
    {
        Teams[WinningTeam].Score += 1.0;
        Teams[WinningTeam].NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(WinningTeam, 1.0, "pair_of_round_winner");
    }
}

function byte GetPairOfRoundWinner()
{
    // End:0x3e
    if(Teams[0].ObjectivesDisabledCount > Teams[1].ObjectivesDisabledCount)
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 6;
        return 0;
    }
    // End:0x7c
    if(Teams[0].ObjectivesDisabledCount < Teams[1].ObjectivesDisabledCount)
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 7;
        return 1;
    }
    // End:0x130
    if(Teams[0].CurrentObjectiveProgress != Teams[1].CurrentObjectiveProgress && Teams[0].CurrentObjectiveProgress > 0.0 && Teams[0].CurrentObjectiveProgress < 1.0)
    {
        // End:0x117
        if(Teams[0].CurrentObjectiveProgress < Teams[1].CurrentObjectiveProgress)
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 8;
            return 0;
        }
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 9;
        return 1;
    }
    // End:0x16e
    if(Teams[0].LastObjectiveTime > Teams[1].LastObjectiveTime)
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 11;
        return 1;
    }
    // End:0x1ac
    if(Teams[0].LastObjectiveTime < Teams[1].LastObjectiveTime)
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 10;
        return 0;
    }
    ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 12;
    return byte(255);
}

function AnnounceScore(int ScoringTeam)
{
    local string ScoreSound;

    // End:0x5e
    if(IsAttackingTeam(ScoringTeam))
    {
        // End:0x32
        if(ScoringTeam == 1)
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 3;
        }
        // End:0x48
        else
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 2;
        }
        ScoreSound = string(AttackerWinRound[ScoringTeam]);
    }
    // End:0xab
    else
    {
        // End:0x82
        if(ScoringTeam == 1)
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 5;
        }
        // End:0x98
        else
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 4;
        }
        ScoreSound = string(DefenderWinRound[ScoringTeam]);
    }
    ASGameReplicationInfo(GameReplicationInfo).RoundOverTime = ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - ASGameReplicationInfo(GameReplicationInfo).RoundStartTime + RemainingTime;
    QueueAnnouncerSound(ScoreSound, 1, byte(255));
}

exec function NewRound()
{
    StartNewRound();
}

function StartNewRound()
{
    Log("## ASGameInfo::StartNewRound ##");
    ++ CurrentRound;
    BeginRound();
}

function ResetLevel()
{
    local Controller C, NextC;
    local Actor A;

    Log("ResetLevel");
    bTeamScoreRounds = true;
    // End:0x41
    if(!bDisableReinforcements)
    {
        ASGameReplicationInfo(GameReplicationInfo).ReinforcementCountDown = 0;
        ReinforcementsCount = ReinforcementsFreq;
    }
    C = Level.ControllerList;
    J0x55:
    // End:0xe8 [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xda
        if(C.PlayerReplicationInfo == none || !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0xcb
            if(PlayerController(C) != none)
            {
                PlayerController(C).ClientReset();
            }
            C.Reset();
        }
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x55;
    }
    // End:0x11e
    foreach AllActors(class'Actor', A)
    {
        // End:0x11d
        if(!A.IsA('Controller'))
        {
            A.Reset();
        }                
    }
}

function BeginRound()
{
    local Controller C, NextC;
    local GameObjective Go;

    Log("ASGameInfo::BeginRound");
    // End:0x52
    if(IsPracticeRound() && PracticeTimeLimit == 0 && Level.NetMode != 0)
    {
        ++ CurrentRound;
    }
    // End:0x61
    if(IsPracticeRound())
    {
        PracticeRoundEnded();
    }
    // End:0x95
    if(IsPracticeRound() || float(CurrentRound) % float(2) == float(1))
    {
        CurrentAttackingTeam = FirstAttackingTeam;
        BeginNewPairOfRounds();
    }
    // End:0xaa
    else
    {
        CurrentAttackingTeam = byte(1 - FirstAttackingTeam);
    }
    LastDisabledObjective = none;
    CurrentObjective = none;
    ASGameReplicationInfo(GameReplicationInfo).bTeamZeroIsAttacking = CurrentAttackingTeam == 0;
    ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress = 0;
    ASGameReplicationInfo(GameReplicationInfo).CurrentRound = CurrentRound;
    ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 0;
    RoundStartTime = RemainingTime;
    ASGameReplicationInfo(GameReplicationInfo).RoundStartTime = RemainingTime;
    GameReplicationInfo.RemainingTime = RemainingTime;
    GameReplicationInfo.RemainingMinute = RemainingTime;
    GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x1b1
    if(IsPracticeRound())
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = PracticeTimeLimit;
    }
    // End:0x20c
    else
    {
        // End:0x1ef
        if(float(CurrentRound) % float(2) == float(0) && SuccessfulAssaultTimeLimit != 0)
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = SuccessfulAssaultTimeLimit;
        }
        // End:0x20c
        else
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = RoundTimeLimit * 60;
        }
    }
    // End:0x237
    if(!bDisableReinforcements)
    {
        ASGameReplicationInfo(GameReplicationInfo).ReinforcementCountDown = 0;
        ReinforcementsCount = ReinforcementsFreq;
    }
    ResetLevel();
    Go = Teams[0].AI.Objectives;
    J0x25c:
    // End:0x2be [While If]
    if(Go != none)
    {
        Go.DefenderTeamIndex = byte(1 - CurrentAttackingTeam);
        Go.NetUpdateTime = Level.TimeSeconds - float(1);
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x25c;
    }
    // End:0x2cd
    if(bWeakObjectives)
    {
        WeakObjectives();
    }
    HighlightCurrentPhysicalObjectives();
    C = Level.ControllerList;
    J0x2e7:
    // End:0x368 [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0x35a
        if(C.IsA('PlayerController') && C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            RestartPlayer(C);
        }
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x2e7;
    }
    TriggerEvent('StartRound', self, none);
    // End:0x3a1
    if(!IsPracticeRound())
    {
        GameEvent("AS_BeginRound", "" $ string(CurrentRound), none);
    }
    SetGameSpeed(GameSpeed);
}

function BeginNewPairOfRounds()
{
    local GameObjective Go;

    Teams[0].LastObjectiveTime = 0;
    Teams[0].ObjectivesDisabledCount = 0;
    Teams[0].CurrentObjectiveProgress = 0.0;
    Teams[1].LastObjectiveTime = 0;
    Teams[1].ObjectivesDisabledCount = 0;
    Teams[1].CurrentObjectiveProgress = 0.0;
    Go = Teams[0].AI.Objectives;
    J0x93:
    // End:0xd9 [While If]
    if(Go != none)
    {
        Go.ObjectiveDisabledTime = 0;
        Go.SavedObjectiveProgress = 0.0;
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x93;
    }
}

function bool IsAttackingTeam(int TeamNumber)
{
    return TeamNumber == CurrentAttackingTeam;
}

function int GetAttackingTeam()
{
    return CurrentAttackingTeam;
}

function int GetDefenderNum()
{
    return 1 - CurrentAttackingTeam;
}

function GameObjective GetCurrentObjective()
{
    local GameObjective Go;

    // End:0xb8
    if(CurrentObjective == none)
    {
        Go = Teams[0].AI.Objectives;
        J0x2a:
        // End:0xb8 [While If]
        if(Go != none)
        {
            // End:0xa1
            if(ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress == Go.ObjectivePriority && Go.IsActive() && !Go.bOptionalObjective || CurrentObjective == none)
            {
                CurrentObjective = Go;
            }
            Go = Go.NextObjective;
            // This is an implied JumpToken; Continue!
            goto J0x2a;
        }
    }
    return CurrentObjective;
}

function bool IsPlayingIntro()
{
    return false;
}

function bool IsPracticeRound()
{
    return ASGameReplicationInfo(GameReplicationInfo).IsPracticeRound();
}

function bool IsPlaying()
{
    return false;
}

function ScoreObjective(PlayerReplicationInfo Scorer, float Score)
{
    // End:0x26
    if(GameRulesModifiers != none)
    {
        GameRulesModifiers.ScoreObjective(Scorer, int(Score));
    }
}

function bool CanDisableObjective(GameObjective Go)
{
    local ASGameReplicationInfo ASGRI;

    // End:0x0d
    if(!IsPlaying())
    {
        return false;
    }
    // End:0x21
    if(Go.bBotOnlyObjective)
    {
        return true;
    }
    ASGRI = ASGameReplicationInfo(GameReplicationInfo);
    // End:0x58
    if(Go.ObjectivePriority <= ASGRI.ObjectiveProgress)
    {
        return true;
    }
    return false;
}

function ObjectiveDisabled(GameObjective DisabledObjective)
{
    local int ForcedScore, ObjectiveDisabledTime;
    local Controller C;

    ObjectiveDisabledTime = RoundStartTime - RemainingTime;
    DisabledObjective.ObjectiveDisabledTime = ObjectiveDisabledTime;
    // End:0x1d3
    if(IsPlaying() && DisabledObjective.DisabledBy != none)
    {
        // End:0x62
        if(DisabledObjective.bOptionalObjective)
        {
            ForcedScore = 5;
        }
        // End:0x6a
        else
        {
            ForcedScore = 10;
        }
        DisabledObjective.AwardAssaultScore(ForcedScore);
        GameEvent("ObjectiveCompleted_Trophy", string(DisabledObjective.ObjectivePriority) @ string(ObjectiveDisabledTime) @ DisabledObjective.Objective_Info_Attacker, DisabledObjective.DisabledBy);
        ++ ASPlayerReplicationInfo(DisabledObjective.DisabledBy).DisabledObjectivesCount;
        // End:0x1d3
        if(PlayerController(DisabledObjective.DisabledBy.Owner) != none)
        {
            PlayerController(DisabledObjective.DisabledBy.Owner).ReceiveLocalizedMessage(class'Message_Awards', 0);
            C = Level.ControllerList;
            J0x156:
            // End:0x1d3 [While If]
            if(C != none)
            {
                // End:0x1bc
                if(PlayerController(C) != none && C != DisabledObjective.DisabledBy.Owner)
                {
                    PlayerController(C).ReceiveLocalizedMessage(class'Message_Awards', 1, DisabledObjective.DisabledBy);
                }
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x156;
            }
        }
    }
    // End:0x233
    if(!DisabledObjective.bOptionalObjective)
    {
        ++ Teams[1 - DisabledObjective.DefenderTeamIndex].ObjectivesDisabledCount;
        Teams[1 - DisabledObjective.DefenderTeamIndex].LastObjectiveTime = ObjectiveDisabledTime;
    }
    // End:0x292
    if(IsPlaying() && DisabledObjective.DisabledBy != none)
    {
        // End:0x278
        if(DisabledObjective.Announcer_DisabledObjective == "")
        {
            QueueAnnouncerSound("", 1, byte(255));
        }
        // End:0x292
        else
        {
            QueueAnnouncerSound(DisabledObjective.Announcer_DisabledObjective, 1, byte(255));
        }
    }
    LastDisabledObjective = DisabledObjective;
    super(UnrealMPGameInfo).ObjectiveDisabled(DisabledObjective);
}

function FindNewObjectives(GameObjective DisabledObjective)
{
    // End:0x23
    if(!bGameEnded && ResetCountDown < 1)
    {
        UpdateObjectiveProgression(DisabledObjective);
    }
    super(TeamGame).FindNewObjectives(DisabledObjective);
}

function UpdateObjectiveProgression(GameObjective DisabledObjective)
{
    local GameObjective Go;
    local bool bIncPriority, bObjPriority;
    local byte CurrentProgressIndex, BackupProgressIndex;

    CurrentProgressIndex = ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress;
    BackupProgressIndex = CurrentProgressIndex;
    bIncPriority = true;
    Go = Teams[0].AI.Objectives;
    J0x4b:
    // End:0xc4 [While If]
    if(Go != none)
    {
        // End:0xad
        if(CurrentProgressIndex == Go.ObjectivePriority && !Go.bOptionalObjective)
        {
            bObjPriority = true;
            // End:0xad
            if(Go.IsActive())
            {
                bIncPriority = false;
            }
            // End:0xc4
            else
            {
            }
            Go = Go.NextObjective;
            // This is an implied JumpToken; Continue!
            goto J0x4b;
        }
    }
    // End:0xdf
    if(bObjPriority && bIncPriority)
    {
        ++ CurrentProgressIndex;
    }
    // End:0x107
    if(CurrentProgressIndex != BackupProgressIndex)
    {
        ++ ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress;
    }
    HighlightCurrentPhysicalObjectives();
    Go = Teams[0].AI.Objectives;
    J0x12c:
    // End:0x22a [While If]
    if(Go != none)
    {
        // End:0x213
        if(ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress == Go.ObjectivePriority && !Go.bDisabled && !Go.bOptionalObjective)
        {
            CurrentObjective = Go;
            // End:0x1fd
            if(!DisabledObjective.bAnnounceNextObjective || CurrentProgressIndex == BackupProgressIndex && Go.Announcer_ObjectiveInfo == DisabledObjective.Announcer_ObjectiveInfo && !DisabledObjective.bOptionalObjective)
            {
            }
            // End:0x22a
            else
            {
                // End:0x211
                if(IsPlaying())
                {
                    AnnounceNextObjective(Go);
                }
                return;
            }
            Go = Go.NextObjective;
            // This is an implied JumpToken; Continue!
            goto J0x12c;
        }
    }
    // End:0x251
    if(CurrentObjective != none && IsPlaying())
    {
        QueueAnnouncerSound("", 1, byte(255),, 200);
    }
}

function HighlightCurrentPhysicalObjectives()
{
    local GameObjective Go;

    Go = Teams[0].AI.Objectives;
    J0x1f:
    // End:0xa2 [While If]
    if(Go != none)
    {
        // End:0x7b
        if(ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress >= Go.ObjectivePriority && Go.IsActive())
        {
            Go.HighlightPhysicalObjective(true);
        }
        // End:0x8b
        else
        {
            Go.HighlightPhysicalObjective(false);
        }
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
}

function AnnounceNextObjective(GameObjective NewObjective)
{
    // End:0x0d
    if(!IsPlaying())
    {
        return;
    }
    // End:0x4b
    if(NewObjective.Announcer_ObjectiveInfo == "")
    {
        QueueAnnouncerSound("", 1, byte(1 - NewObjective.DefenderTeamIndex), 1, 200);
    }
    // End:0x7d
    else
    {
        QueueAnnouncerSound(NewObjective.Announcer_ObjectiveInfo, 1, byte(1 - NewObjective.DefenderTeamIndex), 1, 200);
    }
    // End:0xb1
    if(NewObjective.Announcer_DefendObjective == "")
    {
        QueueAnnouncerSound("", 1, NewObjective.DefenderTeamIndex, 1, 200);
    }
    // End:0xd9
    else
    {
        QueueAnnouncerSound(NewObjective.Announcer_DefendObjective, 1, NewObjective.DefenderTeamIndex, 1, 200);
    }
}

function ShowPathTo(PlayerController P, int TeamNum)
{
    local GameObjective G, Best;
    local class<WillowWhisp> WWclass;
    local ASGameReplicationInfo ASGRI;

    ASGRI = ASGameReplicationInfo(GameReplicationInfo);
    Best = GetCurrentObjective();
    // End:0xb0
    if(Best == none || !Best.IsActive())
    {
        G = Teams[0].AI.Objectives;
        J0x5c:
        // End:0xb0 [While If]
        if(G != none)
        {
            // End:0x99
            if(!G.bOptionalObjective && CheckObjectivePriority(G))
            {
                Best = G;
            }
            // End:0xb0
            else
            {
                G = G.NextObjective;
                // This is an implied JumpToken; Continue!
                goto J0x5c;
            }
        }
    }
    // End:0x247
    if(Best != none)
    {
        // End:0x124
        if(P.FindPathToward(Best, false) != none)
        {
            WWclass = class<WillowWhisp>(DynamicLoadObject(PathWhisps[Best.DefenderTeamIndex], class'Class'));
            Spawn(WWclass, P,, P.Pawn.Location);
        }
        // End:0x247
        if(TeamNum != 255 && IsPlaying())
        {
            // End:0x1b7
            if(P.GetTeamNum() == 1 - Best.DefenderTeamIndex)
            {
                // End:0x191
                if(Best.Announcer_ObjectiveInfo == "")
                {
                    P.QueueAnnouncement("", 1, 1, 201);
                }
                // End:0x1b4
                else
                {
                    P.QueueAnnouncement(Best.Announcer_ObjectiveInfo, 1, 1, 201);
                }
            }
            // End:0x247
            else
            {
                // End:0x230
                if(P.GetTeamNum() == Best.DefenderTeamIndex)
                {
                    // End:0x20a
                    if(Best.Announcer_DefendObjective == "")
                    {
                        P.QueueAnnouncement("", 1, 1, 201);
                    }
                    // End:0x22d
                    else
                    {
                        P.QueueAnnouncement(Best.Announcer_DefendObjective, 1, 1, 201);
                    }
                }
                // End:0x247
                else
                {
                    P.QueueAnnouncement("", 1, 1, 201);
                }
            }
        }
    }
}

function bool CheckObjectivePriority(GameObjective Go)
{
    local ASGameReplicationInfo ASGRI;

    ASGRI = ASGameReplicationInfo(GameReplicationInfo);
    // End:0x47
    if(ASGRI == none || !Go.IsActive() || Go.bDisabled)
    {
        return false;
    }
    // End:0x6e
    if(ASGRI.ObjectiveProgress >= Go.ObjectivePriority)
    {
        return true;
    }
    return false;
}

event NewSpawnAreaEnabled(bool bDefenders)
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:
    // End:0x1f4 [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x57
        if(bDefenders && C.GetTeamNum() != GetDefenderNum())
        {
        }
        // End:0x1dd
        else
        {
            // End:0x81
            if(!bDefenders && C.GetTeamNum() == GetDefenderNum())
            {
            }
            // End:0x1dd
            else
            {
                // End:0xcd
                if(C.IsInState('Dead') || C.Pawn == none || C.Pawn.Health < 1)
                {
                }
                // End:0x1dd
                else
                {
                    // End:0x103
                    if(PC != none && PC.IsDead() || PC.IsSpectating())
                    {
                    }
                    // End:0x1dd
                    else
                    {
                        // End:0x1dd
                        if(C.Pawn != none && ASPlayerReplicationInfo(C.PlayerReplicationInfo) != none)
                        {
                            ASPlayerReplicationInfo(C.PlayerReplicationInfo).bTeleportToSpawnArea = true;
                            // End:0x191
                            if(AIController(C) != none)
                            {
                                ASPlayerReplicationInfo(C.PlayerReplicationInfo).TeleportTime = int(Level.TimeSeconds);
                            }
                            // End:0x1dd
                            else
                            {
                                ASPlayerReplicationInfo(C.PlayerReplicationInfo).TeleportTime = ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - ASGameReplicationInfo(GameReplicationInfo).RoundStartTime + RemainingTime;
                            }
                        }
                    }
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

event NoTranslocatorKeyPressed(PlayerController PC)
{
    local ASGameReplicationInfo ASGRI;
    local ASPlayerReplicationInfo ASPRI;

    // End:0x28
    if(PC == none || ASPlayerReplicationInfo(PC.PlayerReplicationInfo) == none)
    {
        return;
    }
    ASPRI = ASPlayerReplicationInfo(PC.PlayerReplicationInfo);
    // End:0x58
    if(ASPRI.bTeleportToSpawnArea == false)
    {
        return;
    }
    ASGRI = ASGameReplicationInfo(GameReplicationInfo);
    // End:0xb2
    if(ASGRI.RoundTimeLimit - ASGRI.RoundStartTime + RemainingTime + ASGRI.MaxTeleportTime < ASPRI.TeleportTime)
    {
        return;
    }
    TeleportPlayerToSpawn(PC);
}

function TeleportPlayerToSpawn(Controller C)
{
    local Vector PrevLocation;

    PrevLocation = C.Pawn.Location;
    ASPlayerReplicationInfo(C.PlayerReplicationInfo).bTeleportToSpawnArea = false;
    RespawnPlayer(C, false);
    // End:0x87
    if(C.Pawn.IsA('wPawn'))
    {
        wPawn(C.Pawn).DoTranslocateOut(PrevLocation);
    }
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x45
    if(Killed != none && ASPlayerReplicationInfo(Killed.PlayerReplicationInfo) != none)
    {
        ASPlayerReplicationInfo(Killed.PlayerReplicationInfo).bTeleportToSpawnArea = false;
    }
    super(DeathMatch).Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
}

function int VehicleScoreKill(Controller Killer, Controller Killed, Vehicle DestroyedVehicle, out string KillInfo)
{
    // End:0x138
    if(DestroyedVehicle.bKeyVehicle || DestroyedVehicle.bHighScoreKill)
    {
        // End:0x75
        if(Killer == Killed || Killer.GetTeamNum() == DestroyedVehicle.GetTeamNum())
        {
            return super(DeathMatch).VehicleScoreKill(Killer, Killed, DestroyedVehicle, KillInfo);
        }
        // End:0x138
        if(ASPlayerReplicationInfo(Killer.PlayerReplicationInfo) != none)
        {
            GameEvent("VehicleDestroyed_Trophy", DestroyedVehicle.VehicleNameString, Killer.PlayerReplicationInfo);
            ++ ASPlayerReplicationInfo(Killer.PlayerReplicationInfo).DestroyedVehicles;
            // End:0x138
            if(PlayerController(Killer) != none && ASPlayerReplicationInfo(Killer.PlayerReplicationInfo).DestroyedVehicles > 2)
            {
                PlayerController(Killer).ReceiveLocalizedMessage(class'Message_ASKillMessages', 1);
            }
        }
    }
    return super(DeathMatch).VehicleScoreKill(Killer, Killed, DestroyedVehicle, KillInfo);
}

function bool CriticalPlayer(Controller Other)
{
    local GameObjective Go;

    // End:0x52
    if(Other.Pawn == none || Other.PlayerReplicationInfo == none || !IsAttackingTeam(Other.GetTeamNum()))
    {
        return super(TeamGame).CriticalPlayer(Other);
    }
    Go = Teams[0].AI.Objectives;
    J0x71:
    // End:0x12d [While If]
    if(Go != none)
    {
        // End:0xd5
        if(!Go.IsActive() || !Go.IsCritical() || ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress < Go.ObjectivePriority)
        {
        }
        // End:0x116
        else
        {
            // End:0x116
            if(Go.MyBaseVolume != none && Go.MyBaseVolume.Encompasses(Other.Pawn))
            {
                return true;
            }
        }
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x71;
    }
    return super(TeamGame).CriticalPlayer(Other);
}

function SpecialEvent(PlayerReplicationInfo Who, string Desc)
{
    // End:0x1b
    if(!IsPracticeRound())
    {
        super(UnrealMPGameInfo).SpecialEvent(Who, Desc);
    }
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, class<DamageType> Damage)
{
    // End:0x25
    if(!IsPracticeRound())
    {
        super(UnrealMPGameInfo).KillEvent(KillType, Killer, Victim, Damage);
    }
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
    // End:0x20
    if(!IsPracticeRound())
    {
        super(UnrealMPGameInfo).ScoreEvent(Who, Points, Desc);
    }
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
    // End:0x20
    if(!IsPracticeRound())
    {
        super(UnrealMPGameInfo).TeamScoreEvent(Team, Points, Desc);
    }
}

function RestartPlayer(Controller aPlayer)
{
    local string PawnOverrideClass;

    super(TeamGame).RestartPlayer(aPlayer);
    // End:0x89
    if(aPlayer != none && aPlayer.PlayerReplicationInfo != none)
    {
        PawnOverrideClass = ASPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass;
        // End:0x89
        if(PawnOverrideClass != "")
        {
            SpawnAndPossessPawn(aPlayer, PawnOverrideClass);
            ASPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass = "";
        }
    }
    // End:0xa9
    if(PlayerController(aPlayer) != none)
    {
        BroadCast_AssaultRole_Message(PlayerController(aPlayer));
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
    PawnOverrideClass = ASPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass;
    // End:0xe1
    if(PawnOverrideClass != "")
    {
        SpawnAndPossessPawn(C, PawnOverrideClass);
        ASPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass = "";
    }
    // End:0x13b
    if(C.StartSpot != none)
    {
        C.SetLocation(C.StartSpot.Location);
        C.SetRotation(C.StartSpot.Rotation);
    }
    // End:0x25c
    if(C.Pawn != none)
    {
        // End:0x16c
        if(C.Pawn.Weapon == none)
        {
        }
        SetPlayerDefaults(C.Pawn);
        C.Pawn.SetLocation(C.StartSpot.Location);
        C.Pawn.SetRotation(C.StartSpot.Rotation);
        C.Pawn.Velocity = vect(0.0, 0.0, 0.0);
        C.Pawn.PlayTeleportEffect(false, true);
        // End:0x25c
        if(Bot(C) != none && PawnOverrideClass == "")
        {
            Bot(C).Squad.Retask(Bot(C));
        }
    }
    // End:0x2ad
    if(C.StartSpot != none)
    {
        C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
    }
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    // End:0x77
    if(ASPlayerReplicationInfo(PlayerPawn.Controller.PlayerReplicationInfo).PawnOverrideClass == "")
    {
        // End:0x53
        if(UnrealPawn(PlayerPawn) != none)
        {
            UnrealPawn(PlayerPawn).AddDefaultInventory();
        }
        // End:0x77
        else
        {
            // End:0x77
            if(ASVehicle(PlayerPawn) != none)
            {
                ASVehicle(PlayerPawn).AddDefaultInventory();
            }
        }
    }
    SetPlayerDefaults(PlayerPawn);
}

function class<Pawn> GetDefaultPlayerClass(Controller C)
{
    local string PawnClassName;
    local class<Pawn> PawnClass;

    // End:0x4d
    if(C != none)
    {
        PawnClassName = string(C.default.PawnClass);
        PawnClass = class<Pawn>(DynamicLoadObject(PawnClassName, class'Class'));
        // End:0x4d
        if(PawnClass != none)
        {
            return PawnClass;
        }
    }
    return class<Pawn>(DynamicLoadObject(DefaultPlayerClassName, class'Class'));
}

function bool SpawnAndPossessPawn(Controller C, string PawnClassName)
{
    local class<Pawn> PawnClass;
    local Pawn P;

    PawnClass = class<Pawn>(DynamicLoadObject(PawnClassName, class'Class'));
    // End:0x76
    if(PawnClass == none)
    {
        Log("ASGameInfo::SpawnAndPossessPawn - PawnClass == None. PawnClassName:" @ PawnClassName);
        return false;
    }
    // End:0xd5
    if(C.Pawn == none)
    {
        Log("ASGameInfo::SpawnAndPossessPawn - Pawn == None. PawnClassName:" @ PawnClassName);
        return false;
    }
    P = Spawn(PawnClass, C,, C.Pawn.LastStartSpot.Location, C.Pawn.LastStartSpot.Rotation);
    // End:0x1e2
    if(P == none)
    {
        P = Spawn(PawnClass, C,, C.Location, C.Rotation);
        // End:0x1e2
        if(P == none)
        {
            P = Spawn(PawnClass, C);
            // End:0x1e2
            if(P == none)
            {
                P = C.Pawn;
                C.UnPossess();
                P.Controller = none;
                P.Destroy();
                C.PawnClass = PawnClass;
                return false;
            }
        }
    }
    P.Anchor = C.Pawn.LastStartSpot;
    P.LastStartSpot = C.Pawn.LastStartSpot;
    P.LastStartTime = Level.TimeSeconds;
    C.PreviousPawnClass = C.Pawn.Class;
    PossessPawn(C, P);
    return true;
}

function PossessPawn(Controller C, Pawn P)
{
    local Vehicle V;
    local Pawn OldPawn;
    local PlayerController PC;

    PC = PlayerController(C);
    V = Vehicle(P);
    // End:0x4a
    if(V != none)
    {
        V.TryToDrive(C.Pawn);
        return;
    }
    OldPawn = C.Pawn;
    C.UnPossess();
    OldPawn.Controller = none;
    OldPawn.Destroy();
    C.Possess(P);
    // End:0x114
    if(PC != none)
    {
        PC.ClientSetRotation(C.Pawn.Rotation);
        PC.bBehindView = PC.Pawn.PointOfView();
        PC.ClientSetBehindView(PC.bBehindView);
    }
    AddDefaultInventory(C.Pawn);
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint N, BestStart;
    local int i;
    local string PawnOverrideClass;
    local byte Team, t;
    local float BestRating, NewRating;
    local Teleporter Tel;

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
    // End:0x91
    if(Player != none)
    {
        Player.StartSpot = none;
    }
    // End:0xd1
    if(GameRulesModifiers != none)
    {
        N = GameRulesModifiers.FindPlayerStart(Player, inTeam, incomingName);
        // End:0xd1
        if(N != none)
        {
            return N;
        }
    }
    // End:0x110
    if(incomingName != "")
    {
        // End:0x10f
        foreach AllActors(class'Teleporter', Tel)
        {
            // End:0x10e
            if(string(Tel.Tag) ~= incomingName)
            {
                break;
                return Tel;
            }                        
        }
    }
    N = Level.NavigationPointList;
    J0x124:
    // End:0x186 [While If]
    if(N != none)
    {
        NewRating = RatePlayerStart(N, Team, Player);
        // End:0x16f
        if(NewRating > BestRating)
        {
            BestRating = NewRating;
            BestStart = N;
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x124;
    }
    // End:0x2f2
    if(PlayerStart(BestStart) == none)
    {
        Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
        Log(" Player:" @ Player.GetHumanReadableName() @ "Team:" @ string(Team) @ "Player.Event:" @ string(Player.Event));
        DebugShowSpawnAreas();
        BestRating = -100000000.0;
        // End:0x2f1
        foreach AllActors(class'NavigationPoint', N)
        {
            // End:0x27b
            if(PlayerStart(N) != none)
            {
                t = PlayerStart(N).TeamNumber;
            }
            // End:0x286
            else
            {
                t = Team;
            }
            NewRating = RatePlayerStart(N, t, Player);
            // End:0x2bc
            if(InventorySpot(N) != none)
            {
                NewRating -= float(50);
            }
            NewRating += float(20) * FRand();
            // End:0x2f0
            if(NewRating > BestRating)
            {
                BestRating = NewRating;
                BestStart = N;
            }                        
        }
    }
    // End:0x37f
    if(SpawnManagers.Length > 0)
    {
        i = 0;
        J0x305:
        // End:0x37f [While If]
        if(i < SpawnManagers.Length)
        {
            PawnOverrideClass = SpawnManagers[i].PawnClassOverride(Player, PlayerStart(BestStart), Team);
            // End:0x375
            if(PawnOverrideClass != "")
            {
                ASPlayerReplicationInfo(Player.PlayerReplicationInfo).PawnOverrideClass = PawnOverrideClass;
            }
            // End:0x37f
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x305;
            }
        }
    }
    // End:0x39e
    if(Player != none)
    {
        Player.Event = 'None';
    }
    return BestStart;
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart P;
    local int i;

    P = PlayerStart(N);
    // End:0x21
    if(P == none)
    {
        return -10000000.0;
    }
    // End:0x8b
    if(SpawnManagers.Length > 0)
    {
        i = 0;
        J0x34:
        // End:0x8b [While If]
        if(i < SpawnManagers.Length)
        {
            // End:0x81
            if(SpawnManagers[i].ApprovePlayerStart(P, Team, Player))
            {
                return super(DeathMatch).RatePlayerStart(N, Team, Player);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x34;
        }
    }
    return -9000000.0;
}

function DebugShowSpawnAreas()
{
    local NavigationPoint N;
    local PlayerStart ps;
    local PlayerSpawnManager PSM;
    local int i;

    Log("==============");
    Log("ShowSpawnAreas");
    Log("==============");
    // End:0x184
    if(SpawnManagers.Length > 0)
    {
        i = 0;
        J0x49:
        // End:0x184 [While If]
        if(i < SpawnManagers.Length)
        {
            PSM = SpawnManagers[i];
            Log("PlayerSpawnManager:" @ string(PSM) @ "bEnabled:" @ string(PSM.bEnabled) @ "Tag:" @ string(PSM.Tag));
            // End:0x17a
            if(PSM.bEnabled)
            {
                N = Level.NavigationPointList;
                J0xea:
                // End:0x17a [While If]
                if(N != none)
                {
                    ps = PlayerStart(N);
                    // End:0x113
                    if(ps == none)
                    {
                    }
                    // End:0x163
                    else
                    {
                        // End:0x163
                        if(ps.TeamNumber == PSM.PlayerStartTeam)
                        {
                            Log(" " @ string(ps) @ "Enabled:" @ string(ps.bEnabled));
                        }
                    }
                    N = N.nextNavigationPoint;
                    // This is an implied JumpToken; Continue!
                    goto J0xea;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x49;
        }
    }
    Log("==============");
    Log("End...........");
    Log("==============");
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, optional int iWeaponType)
{
    // End:0x2d
    if(instigatedBy == injured && class<WeaponDamageType>(DamageType) != none)
    {
        Momentum *= 0.30;
    }
    return super(TeamGame).ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
}

function int AdjustDestroyObjectiveDamage(int Damage, Controller instigatedBy, GameObjective Go)
{
    local PlayerController LocalPlayer;

    // End:0x2c
    if(AIController(instigatedBy) == none || instigatedBy.PlayerReplicationInfo == none)
    {
        return Damage;
    }
    LocalPlayer = Level.GetLocalPlayerController();
    // End:0xb1
    if(Level.NetMode == 0 || bPlayersVsBots && LocalPlayer == none || LocalPlayer.GetTeamNum() != instigatedBy.GetTeamNum())
    {
        return int(float(Damage) * Go.BotDamageScaling);
    }
    return Damage;
}

function WeakObjectives()
{
    super(TeamGame).WeakObjectives();
    bWeakObjectives = true;
}

function DisableNextObjective()
{
    local GameObjective Go;

    Go = Teams[0].AI.Objectives;
    J0x1f:
    // End:0x62 [While If]
    if(Go != none)
    {
        // End:0x4b
        if(CheckObjectivePriority(Go))
        {
            Go.CompleteObjective(none);
        }
        // End:0x62
        else
        {
            Go = Go.NextObjective;
            // This is an implied JumpToken; Continue!
            goto J0x1f;
        }
    }
}

function QueueAnnouncerSound(string ASound, byte AnnouncementLevel, byte Team, optional Core.Object.EAPriority Priority, optional byte Switch)
{
    local Controller C;

    // End:0xb8
    if(!IsPlayingIntro() && ASound != "")
    {
        C = Level.ControllerList;
        J0x2d:
        // End:0xb8 [While If]
        if(C != none)
        {
            // End:0xa1
            if(C.IsA('PlayerController') && Team == 255 || C.GetTeamNum() == Team)
            {
                PlayerController(C).QueueAnnouncement(ASound, AnnouncementLevel, Priority, Switch);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x2d;
        }
    }
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super(TeamGame).PrecacheGameAnnouncements(V, bRewardSounds);
}

simulated function UpdateAnnouncements();
function GetServerDetails(out ServerResponseLine ServerState)
{
    super(TeamGame).GetServerDetails(ServerState);
    AddServerDetail(ServerState, "RoundLimit", string(RoundLimit));
    AddServerDetail(ServerState, "RoundTimeLimit", string(RoundTimeLimit));
    AddServerDetail(ServerState, "ResetTimeDelay", string(ResetTimeDelay));
    AddServerDetail(ServerState, "ReinforcementsFreq", string(ReinforcementsFreq));
    AddServerDetail(ServerState, "PracticeTimeLimit", string(PracticeTimeLimit));
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x20
    if(InStr(PropertyName, "bAllowTrans") != -1)
    {
        return false;
    }
    // End:0x37
    if(PropertyName ~= "TimeLimit")
    {
        return false;
    }
    // End:0x55
    if(InStr(PropertyName, "GoalScore") != -1)
    {
        return false;
    }
    return super(TeamGame).AcceptPlayInfoProperty(PropertyName);
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super(TeamGame).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.GameGroup, "RoundLimit", default.ASPropsDisplayText[++ i], 0, 1, "Text", "3;1:999");
    PlayInfo.AddSetting(default.GameGroup, "RoundTimeLimit", default.ASPropsDisplayText[++ i], 0, 1, "Text", "3;0:999");
    PlayInfo.AddSetting(default.GameGroup, "ResetTimeDelay", default.ASPropsDisplayText[++ i], 0, 1, "Text", "3;0:999",,, true);
    PlayInfo.AddSetting(default.GameGroup, "ReinforcementsFreq", default.ASPropsDisplayText[++ i], 0, 1, "Text", "3;0:999",,, true);
    PlayInfo.AddSetting(default.GameGroup, "PracticeTimeLimit", default.ASPropsDisplayText[++ i], 0, 1, "Text", "3;0:999",,, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1e
        case "RoundLimit":
            return default.ASPropDescText[0];
        // End:0x39
        case "RoundTimeLimit":
            return default.ASPropDescText[1];
        // End:0x55
        case "ResetTimeDelay":
            return default.ASPropDescText[2];
        // End:0x75
        case "ReinforcementsFreq":
            return default.ASPropDescText[3];
        // End:0x94
        case "PracticeTimeLimit":
            return default.ASPropDescText[4];
        // End:0xffff
        default:
            return super(TeamGame).GetDescriptionText(PropName);
    }
}

static function bool AllowMutator(string MutatorClassName)
{
    // End:0x0e
    if(MutatorClassName == "")
    {
        return false;
    }
    // End:0x1e
    if(IsVehicleMutator(MutatorClassName))
    {
        return false;
    }
    // End:0x41
    if(MutatorClassName ~= "UnrealGame.MutLowGrav")
    {
        return false;
    }
    // End:0x60
    if(MutatorClassName ~= "wGame.MutQuadJump")
    {
        return false;
    }
    // End:0x7f
    if(MutatorClassName ~= "wGame.MutInstagib")
    {
        return false;
    }
    // End:0xa2
    if(MutatorClassName ~= "wGame.MutZoomInstagib")
    {
        return false;
    }
    return super(GameInfo).AllowMutator(MutatorClassName);
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
    local int i;
    local array<string> Hints;

    // End:0x25
    if(!bThisClassOnly || default.ASHints.Length == 0)
    {
        Hints = super(TeamGame).GetAllLoadHints();
    }
    i = 0;
    J0x2c:
    // End:0x5e [While If]
    if(i < default.ASHints.Length)
    {
        Hints[Hints.Length] = default.ASHints[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    return Hints;
}

state MatchInProgress
{
    function BeginState()
    {
        local int iTemp;

        iTemp = 0;
    }

    function EndState()
    {
        local int iTemp;

        iTemp = 1;
    }

    function Timer()
    {
        local Controller C;
        local PlayerController PC;
        local GameObjective Go;

        super.Timer();
        // End:0x140
        if(!bDisableReinforcements && ResetCountDown == 0 && ReinforcementsFreq > 0)
        {
            ++ ReinforcementsCount;
            // End:0x6b
            if(ReinforcementsCount > ReinforcementsFreq + ReinforcementsValidTime)
            {
                ReinforcementsCount = 0;
                ASGameReplicationInfo(GameReplicationInfo).ReinforcementCountDown = ReinforcementsFreq;
            }
            // End:0x140
            else
            {
                // End:0x140
                if(ReinforcementsCount >= ReinforcementsFreq)
                {
                    ASGameReplicationInfo(GameReplicationInfo).ReinforcementCountDown = 0;
                    C = Level.ControllerList;
                    J0xa3:
                    // End:0x140 [While If]
                    if(C != none)
                    {
                        PC = PlayerController(C);
                        // End:0x129
                        if(PC != none && PC.IsDead() && ASPlayerReplicationInfo(PC.PlayerReplicationInfo).bAutoRespawn)
                        {
                            RestartPlayer(PC);
                            ASPlayerReplicationInfo(PC.PlayerReplicationInfo).bAutoRespawn = false;
                        }
                        C = C.nextController;
                        // This is an implied JumpToken; Continue!
                        goto J0xa3;
                    }
                }
            }
        }
        // End:0x163
        if(TimeLimit < 1)
        {
            GameReplicationInfo.bStopCountDown = false;
            -- RemainingTime;
        }
        GameReplicationInfo.RemainingTime = RemainingTime;
        // End:0x1a0
        if(float(RemainingTime) % float(60) == float(0))
        {
            GameReplicationInfo.RemainingMinute = RemainingTime;
        }
        // End:0x334
        if(ResetCountDown > 0)
        {
            -- ResetCountDown;
            // End:0x244
            if(ResetCountDown < 3)
            {
                C = Level.ControllerList;
                J0x1d2:
                // End:0x244 [While If]
                if(C != none)
                {
                    // End:0x22d
                    if(C.Pawn != none && C.Pawn.IsA('RedeemerWarhead'))
                    {
                        C.Pawn.Fire(1.0);
                    }
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x1d2;
                }
            }
            // End:0x320
            if(ResetCountDown > 0 && ResetCountDown < 10)
            {
                BroadcastLocalizedMessage(class'TimerMessage', ResetCountDown);
                // End:0x31d
                if(ResetCountDown == 1)
                {
                    ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress = 0;
                    GameReplicationInfo.NetUpdateTime = Level.TimeSeconds;
                    Go = Teams[0].AI.Objectives;
                    J0x2ca:
                    // End:0x31d [While If]
                    if(Go != none)
                    {
                        Go.Reset();
                        Go.NetUpdateTime = Level.TimeSeconds - float(1);
                        Go = Go.NextObjective;
                        // This is an implied JumpToken; Continue!
                        goto J0x2ca;
                    }
                }
            }
            // End:0x331
            else
            {
                // End:0x331
                if(ResetCountDown == 0)
                {
                    StartNewRound();
                }
            }
        }
        // End:0x3b4
        else
        {
            // End:0x3b4
            if(ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit > 0 && RoundStartTime - RemainingTime >= ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit)
            {
                // End:0x39b
                if(IsPracticeRound())
                {
                    EndRound(1, none, "practicetimelimit");
                }
                // End:0x3b4
                else
                {
                    EndRound(1, none, "roundtimelimit");
                }
            }
        }
    }

    function float SpawnWait(AIController B)
    {
        // End:0x8d
        if(B.IsA('wBot') && GameReplicationInfo.bMatchHasBegun && ResetCountDown == 0 && !bDisableReinforcements)
        {
            // End:0x6e
            if(ReinforcementsCount >= ReinforcementsFreq)
            {
                return float(ReinforcementsValidTime - ReinforcementsCount - ReinforcementsFreq) * FRand();
            }
            // End:0x8a
            else
            {
                return float(ReinforcementsFreq - ReinforcementsCount) + float(ReinforcementsValidTime) * FRand();
            }
        }
        // End:0x99
        else
        {
            return super(UnrealMPGameInfo).SpawnWait(B);
        }
    }

    function bool PlayerCanRestart(PlayerController aPlayer)
    {
        // End:0x64
        if(GameReplicationInfo.bMatchHasBegun && ResetCountDown == 0 && !bDisableReinforcements)
        {
            // End:0x5f
            if(ReinforcementsCount < ReinforcementsFreq)
            {
                ASPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).bAutoRespawn = true;
                return false;
            }
            // End:0x61
            else
            {
                return true;
            }
        }
        // End:0x66
        else
        {
            return true;
        }
    }

    function bool PlayerCanRestartGame(PlayerController aPlayer)
    {
        return false;
    }

    function bool IsPlaying()
    {
        return ASGameReplicationInfo(GameReplicationInfo).RoundWinner == 0 && ResetCountDown == 0;
    }

}

state MatchOver
{
    function EndRound(ASGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason);

}

state SPIntroCinematic
{
    function BeginState()
    {
        Level.GetLocalPlayerController().bHideVehicleNoEntryIndicator = true;
        CurrentRound = 0;
        TriggerEvent('StartRound', self, none);
    }

    event SceneStarted(SceneManager SM, Actor Other)
    {
        HighlightCurrentPhysicalObjectives();
        CurrentMatineeScene = SM;
    }

    function bool IsPlayingIntro()
    {
        return true;
    }

    function bool CanDisableObjective(GameObjective Go)
    {
        return true;
    }

    event SceneEnded(SceneManager SM, Actor Other)
    {
        // End:0x4d
        if(SM.NextSceneTag == 'None' || SM.NextSceneTag == 'None' || SM.bAbortCinematic)
        {
            GotoState('MatchInProgress');
        }
    }

    event SceneAbort()
    {
        local PlayerController PC;

        PC = Level.GetLocalPlayerController();
        // End:0x3c
        if(PC != none)
        {
            PC.ConsoleCommand("stopsounds");
        }
        CurrentMatineeScene.AbortScene();
    }

    function EndState()
    {
        local PlayerController PC;

        PC = Level.GetLocalPlayerController();
        PC.bHideVehicleNoEntryIndicator = false;
        // End:0x57
        if(PC != none && PC.PlayerReplicationInfo != none)
        {
            PC.GotoState('PlayerWaiting');
        }
        GotoState('PendingMatch');
    }

}

auto state PendingMatch
{
Begin:
    // End:0x0f
    if(bQuickStart)
    {
        StartMatch();
    }
    stop;        
}

state MPOutroCinematic
{
    event SceneEnded(SceneManager SM, Actor Other)
    {
        GotoState('MatchInProgress');
    }

    function BeginState()
    {
        local Controller C, NextC;
        local PlayerController PC;

        C = Level.ControllerList;
        J0x14:
        // End:0xad [While If]
        if(C != none)
        {
            NextC = C.nextController;
            // End:0x9f
            if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                PC = PlayerController(C);
                // End:0x90
                if(PC != none)
                {
                    PC.ClientRoundEnded();
                }
                C.RoundHasEnded();
            }
            C = NextC;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }

    function bool PlayerCanRestartGame(PlayerController aPlayer)
    {
        return false;
    }

    function EndState()
    {
        // End:0x36
        if(CurrentRound >= MaxRounds)
        {
            EndGame(none, "roundlimit");
            // End:0x34
            if(bGameEnded)
            {
                GotoState('MatchOver');
            }
            return;
        }
        ResetCountDown = ResetTimeDelay + 1;
        QueueAnnouncerSound(NewRoundSound, 1, byte(255));
    }

}

defaultproperties
{
    RoundLimit=1
    RoundTimeLimit=10
    PracticeTimeLimit=60
    ReinforcementsFreq=7
    ReinforcementsValidTime=3
    ASPropsDisplayText[0]="??? ??"
    ASPropsDisplayText[1]="??? ????"
    ASPropsDisplayText[2]="? ?? ?????"
    ASPropsDisplayText[3]="?? ??"
    ASPropsDisplayText[4]="?? ??"
    ASPropDescText[0]="? ??? ?? ??? ?? ?????."
    ASPropDescText[1]="? ???? ????? ?????."
    ASPropDescText[2]="?? ?????? ?? ??? ?????."
    ASPropDescText[3]="?????? ??? ??? ?????."
    ASPropDescText[4]="??? ?? ???? ??? ??? ?????. (?)"
    ASHints=// Object reference not set to an instance of an object.
    
    NewRoundSound="New_assault_in"
    AttackerWinRound[0]=Red_team_attacked
    AttackerWinRound[1]=Blue_team_attacked
    DefenderWinRound[0]=Red_team_defended
    DefenderWinRound[1]=Blue_team_defended
    DrawGameSound=Draw_Game
    bScoreTeamKills=true
    bSpawnInTeamArea=true
    TeammateBoost=0.250
    TeamAIType[0]=class'ASTeamAI'
    TeamAIType[1]=class'ASTeamAI'
    NetWait=15
    bSkipPlaySound=true
    SpawnProtectionTime=3.0
    DefaultEnemyRosterClass="WGame.wTeamRoster"
    ADR_Kill=2.0
    bTeamScoreRounds=true
    DefaultPlayerClassName="wGame.wPawn"
    ScoreBoardType="UT2k4Assault.ScoreBoard_Assault"
    HUDSettingsMenu="GUI2K4.CustomHUDMenuAssault"
    HUDType="UT2k4Assault.HUD_Assault"
    MapListType="UT2k4Assault.ASMapList"
    MapPrefix="AS"
    BeaconName="AS"
    ResetTimeDelay=8
    GoalScore=0
    MutatorClass="UT2K4Assault.ASMutator"
    GameReplicationInfoClass=class'ASGameReplicationInfo'
    GameName="???"
    Description="???: ?? ???? ?? ??? ????? ???? ? ????? ? ?? ???, ?? ?? ??? ?? ???. ? ????? ??? ?? ??? ?? ???."
    ScreenShotName="UT2004Thumbnails.AssaultShots"
    DecoTextName="WGame.TeamGame"
    Acronym="AS"
}