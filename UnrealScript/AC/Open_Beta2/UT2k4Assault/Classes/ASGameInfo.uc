class ASGameInfo extends wTeamGame
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const ASPROPNUM = 5;

enum ERER_Reason
{
    ERER_AttackersWin,              // 0
    ERER_AttackersLose              // 1
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

function Reset()
{
    //return;    
}

function CheckReady()
{
    //return;    
}

function bool DivertSpaceFighter()
{
    return FRand() < 0.4000000;
    //return;    
}

function bool AllowTransloc()
{
    return false;
    //return;    
}

static function bool NeverAllowTransloc()
{
    return true;
    //return;    
}

function TweakSkill(Bot B)
{
    // End:0x1B
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        return;
    }
    // End:0x65
    if((B.Pawn != none) && B.Pawn.IsA('ASVehicle_SpaceFighter_Skaarj'))
    {
        B.Skill = AdjustedDifficulty;        
    }
    else
    {
        // End:0xA2
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.Team != B.PlayerReplicationInfo.Team)
        {
        }
    }
    B.Skill = FMax(B.Skill, AdjustedDifficulty + 1.5000000);
    //return;    
}

function PostBeginPlay()
{
    local GameObjective Go;
    local PlayerSpawnManager PSM;

    super(TeamGame).PostBeginPlay();
    // End:0x29
    foreach AllActors(Class'UT2k4Assault_Decompressed.PlayerSpawnManager', PSM)
    {
        SpawnManagers[SpawnManagers.Length] = PSM;        
    }    
    Go = Teams[0].AI.Objectives;
    J0x49:

    // End:0xAB [Loop If]
    if(Go != none)
    {
        Go.DefenderTeamIndex = byte(int(1) - int(CurrentAttackingTeam));
        Go.NetUpdateTime = Level.TimeSeconds - float(1);
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x49;
    }
    // End:0xC4
    foreach AllActors(Class'UT2k4Assault_Decompressed.ASCinematic_SceneManager', EndCinematic, 'OutroScene')
    {
        // End:0xC4
        break;        
    }    
    //return;    
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController PC;
    local bool bSpectator;

    PC = super(DeathMatch).Login(Portal, Options, Error);
    // End:0xB1
    if(PC != none)
    {
        // End:0xB1
        if(int(Level.NetMode) == int(NM_Standalone))
        {
            bSpectator = (ParseOption(Options, "SpectatorOnly")) ~= "1";
            CurrentRound = 1;
            // End:0xB1
            if((!bQuickStart && !bSpectator) && !PC.PlayerReplicationInfo.bOnlySpectator)
            {
                TriggerEvent('IntroScene', self, none);
            }
        }
    }
    return PC;
    //return;    
}

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    RoundTimeLimit = Max(0, GetIntOption(Options, "RoundTimeLimit", RoundTimeLimit));
    PracticeTimeLimit = Max(0, GetIntOption(Options, "PracticeTimeLimit", PracticeTimeLimit));
    RoundLimit = Max(0, GetIntOption(Options, "RoundLimit", RoundLimit));
    MaxRounds = RoundLimit * 2;
    FirstAttackingTeam = byte(Max(0, GetIntOption(Options, "FirstAttackingTeam", int(FirstAttackingTeam))));
    ResetTimeDelay = Max(0, GetIntOption(Options, "ResetTimeDelay", ResetTimeDelay));
    ReinforcementsFreq = Max(0, GetIntOption(Options, "ReinforcementsFreq", ReinforcementsFreq));
    TimeLimit = 0;
    RemainingTime = ((((RoundTimeLimit + ResetTimeDelay) + 1) * 60) * (MaxRounds + 2)) + PracticeTimeLimit;
    // End:0x171
    if(GameReplicationInfo != none)
    {
        GameReplicationInfo.RemainingTime = RemainingTime;
    }
    //return;    
}

function StartMatch()
{
    super.StartMatch();
    // End:0x37
    if((int(CurrentRound) == 0) && int(Level.NetMode) == int(NM_Standalone))
    {
        StartNewRound();        
    }
    else
    {
        BeginRound();
    }
    //return;    
}

function InitGameReplicationInfo()
{
    super(DeathMatch).InitGameReplicationInfo();
    ASGameReplicationInfo(GameReplicationInfo).MaxRounds = RoundLimit * 2;
    //return;    
}

function Logout(Controller Exiting)
{
    // End:0x3A
    if(Exiting.PlayerReplicationInfo.HasFlag != none)
    {
        GameObjectDropped(Exiting.PlayerReplicationInfo.HasFlag);
    }
    super(DeathMatch).Logout(Exiting);
    //return;    
}

function DiscardInventory(Pawn Other)
{
    // End:0x0D
    if(Other == none)
    {
        return;
    }
    // End:0x5D
    if((Other.PlayerReplicationInfo != none) && Other.PlayerReplicationInfo.HasFlag != none)
    {
        GameObjectDropped(Other.PlayerReplicationInfo.HasFlag);
    }
    super(GameInfo).DiscardInventory(Other);
    //return;    
}

function GameObjectDropped(Decoration D)
{
    // End:0x2B
    if(D.IsA('GameObject_EnergyCore'))
    {
        GameObject_EnergyCore(D).HolderDied();        
    }
    else
    {
        D.Drop(vect(0.0000000, 0.0000000, 0.0000000));
    }
    //return;    
}

function BroadCast_AssaultRole_Message(PlayerController C)
{
    // End:0x39
    if(((!GameReplicationInfo.bMatchHasBegun || !IsPlaying()) || bGameEnded) || bWaitingToStartMatch)
    {
        return;
    }
    // End:0x77
    if(IsAttackingTeam(C.GetTeamNum()))
    {
        C.ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_AssaultTeamRole', 0, C.PlayerReplicationInfo);        
    }
    else
    {
        C.ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_AssaultTeamRole', 1, C.PlayerReplicationInfo);
    }
    //return;    
}

event SceneStarted(SceneManager SM, Actor Other)
{
    // End:0x39
    if((Other != none) && Other.IsA('ASCinematic_SceneManager'))
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
    //return;    
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local PlayerController PC;
    local Controller C;

    // End:0x3E
    if(Teams[1].Score > Teams[0].Score)
    {
        GameReplicationInfo.Winner = Teams[1];        
    }
    else
    {
        // End:0x7C
        if(Teams[1].Score < Teams[0].Score)
        {
            GameReplicationInfo.Winner = Teams[0];            
        }
        else
        {
            GameReplicationInfo.Winner = none;
        }
    }
    C = Level.ControllerList;
    J0xA0:

    // End:0x11F [Loop If]
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
        // [Loop Continue]
        goto J0xA0;
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    return true;
    //return;    
}

function EndRound(ASGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int ScoringTeam;
    local PlayerReplicationInfo PRI;
    local PlayerController PC;
    local Controller C, NextC;
    local GameObjective ObjectiveFocus;
    local bool bObjectiveHasEndCam, bSuccessfulAttack;

    // End:0x1A
    if(!IsPlaying() || ResetCountDown > 0)
    {
        return;
    }
    Log("ASGameInfo::EndRound - Reason:" @ Reason);
    // End:0x8D
    if(((int(RoundEndReason) == int(0)) && LastDisabledObjective != none) && LastDisabledObjective.DisabledBy != none)
    {
        PRI = LastDisabledObjective.DisabledBy;        
    }
    else
    {
        // End:0xAC
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
        ASGameReplicationInfo(GameReplicationInfo).RoundOverTime = (ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - ASGameReplicationInfo(GameReplicationInfo).RoundStartTime) + RemainingTime;        
    }
    else
    {
        // End:0x1EF
        if(int(RoundEndReason) == int(0))
        {
            // End:0x188
            if((PRI != none) && PRI.IsA('ASPlayerReplicationInfo'))
            {
                ASPlayerReplicationInfo(PRI).DisabledFinalObjective++;
                GameEvent("EndRound_Trophy", "", PRI);
            }
            // End:0x1AF
            if((float(CurrentRound) % float(2)) == float(1))
            {
                SuccessfulAssaultTimeLimit = RoundStartTime - RemainingTime;
            }
            ScoringTeam = int(CurrentAttackingTeam);
            bSuccessfulAttack = true;
            GameEvent("AS_attackers_win", "" $ string(ScoringTeam), PRI);            
        }
        else
        {
            // End:0x249
            if(ObjectiveFocus != none)
            {
                ObjectiveFocus.SavedObjectiveProgress = ObjectiveFocus.GetObjectiveProgress();
                Teams[1 - int(ObjectiveFocus.DefenderTeamIndex)].CurrentObjectiveProgress = ObjectiveFocus.SavedObjectiveProgress;
            }
            ScoringTeam = 1 - int(CurrentAttackingTeam);
            GameEvent("AS_defenders_win", "" $ string(ScoringTeam), PRI);
        }
        AnnounceScore(ScoringTeam);
        // End:0x2A7
        if((float(CurrentRound) % float(2)) == float(0))
        {
            SetPairOfRoundWinner();
        }
    }
    TriggerEvent('EndRound', self, Instigator);
    // End:0x2E1
    if(bSuccessfulAttack && EndCinematic != none)
    {
        EndCinematic.Trigger(self, none);
        return;
    }
    // End:0x304
    if((ObjectiveFocus == none) && LastDisabledObjective != none)
    {
        ObjectiveFocus = LastDisabledObjective;
    }
    // End:0x462
    if(ObjectiveFocus != none)
    {
        ObjectiveFocus.bAlwaysRelevant = true;
        // End:0x357
        if((ObjectiveFocus.EndCamera != none) && ASCinematic_Camera(ObjectiveFocus.EndCamera) != none)
        {
            bObjectiveHasEndCam = true;
        }
        C = Level.ControllerList;
        J0x36B:

        // End:0x45F [Loop If]
        if(C != none)
        {
            NextC = C.nextController;
            // End:0x451
            if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                PC = PlayerController(C);
                // End:0x442
                if(PC != none)
                {
                    // End:0x40B
                    if(bObjectiveHasEndCam)
                    {
                        ASCinematic_Camera(ObjectiveFocus.EndCamera).ViewFixedObjective(PC, ObjectiveFocus);                        
                    }
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
            // [Loop Continue]
            goto J0x36B;
        }        
    }
    else
    {
        Log("ASGameInfo::EndRound ObjectiveFocus == None !!!!!!!!!");
    }
    // End:0x4D1
    if(int(CurrentRound) >= MaxRounds)
    {
        EndGame(none, "roundlimit");
        // End:0x4CF
        if(bGameEnded)
        {
            GotoState('MatchOver');
        }
        return;
    }
    QueueAnnouncerSound(NewRoundSound, 1, byte(255));
    ResetCountDown = ResetTimeDelay + 1;
    //return;    
}

function PracticeRoundEnded()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x12B [Loop If]
    if(C != none)
    {
        // End:0x114
        if(C.PlayerReplicationInfo != none)
        {
            C.PlayerReplicationInfo.Kills = 0;
            C.PlayerReplicationInfo.Score = 0.0000000;
            C.PlayerReplicationInfo.Deaths = 0.0000000;
            // End:0xBD
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
        // [Loop Continue]
        goto J0x14;
    }
    bFirstBlood = false;
    Teams[0].Score = 0.0000000;
    Teams[1].Score = 0.0000000;
    Teams[0].NetUpdateTime = Level.TimeSeconds - float(1);
    Teams[1].NetUpdateTime = Level.TimeSeconds - float(1);
    //return;    
}

function SetPairOfRoundWinner()
{
    local byte WinningTeam;

    WinningTeam = GetPairOfRoundWinner();
    // End:0x89
    if(int(WinningTeam) < 2)
    {
        Teams[int(WinningTeam)].Score += 1.0000000;
        Teams[int(WinningTeam)].NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(int(WinningTeam), 1.0000000, "pair_of_round_winner");
    }
    //return;    
}

function byte GetPairOfRoundWinner()
{
    // End:0x3E
    if(Teams[0].ObjectivesDisabledCount > Teams[1].ObjectivesDisabledCount)
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 6;
        return 0;
    }
    // End:0x7C
    if(Teams[0].ObjectivesDisabledCount < Teams[1].ObjectivesDisabledCount)
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 7;
        return 1;
    }
    // End:0x130
    if(((Teams[0].CurrentObjectiveProgress != Teams[1].CurrentObjectiveProgress) && Teams[0].CurrentObjectiveProgress > 0.0000000) && Teams[0].CurrentObjectiveProgress < 1.0000000)
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
    // End:0x16E
    if(Teams[0].LastObjectiveTime > Teams[1].LastObjectiveTime)
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 11;
        return 1;
    }
    // End:0x1AC
    if(Teams[0].LastObjectiveTime < Teams[1].LastObjectiveTime)
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 10;
        return 0;
    }
    ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 12;
    return byte(255);
    //return;    
}

function AnnounceScore(int ScoringTeam)
{
    local string ScoreSound;

    // End:0x5E
    if(IsAttackingTeam(ScoringTeam))
    {
        // End:0x32
        if(ScoringTeam == 1)
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 3;            
        }
        else
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 2;
        }
        ScoreSound = string(AttackerWinRound[ScoringTeam]);        
    }
    else
    {
        // End:0x82
        if(ScoringTeam == 1)
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 5;            
        }
        else
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 4;
        }
        ScoreSound = string(DefenderWinRound[ScoringTeam]);
    }
    ASGameReplicationInfo(GameReplicationInfo).RoundOverTime = (ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - ASGameReplicationInfo(GameReplicationInfo).RoundStartTime) + RemainingTime;
    QueueAnnouncerSound(ScoreSound, 1, byte(255));
    //return;    
}

exec function NewRound()
{
    StartNewRound();
    //return;    
}

function StartNewRound()
{
    Log("## ASGameInfo::StartNewRound ##");
    CurrentRound++;
    BeginRound();
    //return;    
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

    // End:0xE8 [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xDA
        if((C.PlayerReplicationInfo == none) || !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0xCB
            if(PlayerController(C) != none)
            {
                PlayerController(C).ClientReset();
            }
            C.Reset();
        }
        C = NextC;
        // [Loop Continue]
        goto J0x55;
    }
    // End:0x11E
    foreach AllActors(Class'Engine.Actor', A)
    {
        // End:0x11D
        if(!A.IsA('Controller'))
        {
            A.Reset();
        }        
    }    
    //return;    
}

function BeginRound()
{
    local Controller C, NextC;
    local GameObjective Go;

    Log("ASGameInfo::BeginRound");
    // End:0x52
    if(((IsPracticeRound()) && PracticeTimeLimit == 0) && int(Level.NetMode) != int(NM_Standalone))
    {
        CurrentRound++;
    }
    // End:0x61
    if(IsPracticeRound())
    {
        PracticeRoundEnded();
    }
    // End:0x95
    if((IsPracticeRound()) || (float(CurrentRound) % float(2)) == float(1))
    {
        CurrentAttackingTeam = FirstAttackingTeam;
        BeginNewPairOfRounds();        
    }
    else
    {
        CurrentAttackingTeam = byte(int(1) - int(FirstAttackingTeam));
    }
    LastDisabledObjective = none;
    CurrentObjective = none;
    ASGameReplicationInfo(GameReplicationInfo).bTeamZeroIsAttacking = int(CurrentAttackingTeam) == 0;
    ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress = 0;
    ASGameReplicationInfo(GameReplicationInfo).CurrentRound = int(CurrentRound);
    ASGameReplicationInfo(GameReplicationInfo).RoundWinner = 0;
    RoundStartTime = RemainingTime;
    ASGameReplicationInfo(GameReplicationInfo).RoundStartTime = RemainingTime;
    GameReplicationInfo.RemainingTime = RemainingTime;
    GameReplicationInfo.RemainingMinute = RemainingTime;
    GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x1B1
    if(IsPracticeRound())
    {
        ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = PracticeTimeLimit;        
    }
    else
    {
        // End:0x1EF
        if(((float(CurrentRound) % float(2)) == float(0)) && SuccessfulAssaultTimeLimit != 0)
        {
            ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = SuccessfulAssaultTimeLimit;            
        }
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
    J0x25C:

    // End:0x2BE [Loop If]
    if(Go != none)
    {
        Go.DefenderTeamIndex = byte(int(1) - int(CurrentAttackingTeam));
        Go.NetUpdateTime = Level.TimeSeconds - float(1);
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x25C;
    }
    // End:0x2CD
    if(bWeakObjectives)
    {
        WeakObjectives();
    }
    HighlightCurrentPhysicalObjectives();
    C = Level.ControllerList;
    J0x2E7:

    // End:0x368 [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0x35A
        if((C.IsA('PlayerController') && C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            RestartPlayer(C);
        }
        C = NextC;
        // [Loop Continue]
        goto J0x2E7;
    }
    TriggerEvent('StartRound', self, none);
    // End:0x3A1
    if(!IsPracticeRound())
    {
        GameEvent("AS_BeginRound", "" $ string(CurrentRound), none);
    }
    SetGameSpeed(GameSpeed);
    //return;    
}

function BeginNewPairOfRounds()
{
    local GameObjective Go;

    Teams[0].LastObjectiveTime = 0;
    Teams[0].ObjectivesDisabledCount = 0;
    Teams[0].CurrentObjectiveProgress = 0.0000000;
    Teams[1].LastObjectiveTime = 0;
    Teams[1].ObjectivesDisabledCount = 0;
    Teams[1].CurrentObjectiveProgress = 0.0000000;
    Go = Teams[0].AI.Objectives;
    J0x93:

    // End:0xD9 [Loop If]
    if(Go != none)
    {
        Go.ObjectiveDisabledTime = 0;
        Go.SavedObjectiveProgress = 0.0000000;
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x93;
    }
    //return;    
}

function bool IsAttackingTeam(int TeamNumber)
{
    return TeamNumber == int(CurrentAttackingTeam);
    //return;    
}

function int GetAttackingTeam()
{
    return int(CurrentAttackingTeam);
    //return;    
}

function int GetDefenderNum()
{
    return 1 - int(CurrentAttackingTeam);
    //return;    
}

function GameObjective GetCurrentObjective()
{
    local GameObjective Go;

    // End:0xB8
    if(CurrentObjective == none)
    {
        Go = Teams[0].AI.Objectives;
        J0x2A:

        // End:0xB8 [Loop If]
        if(Go != none)
        {
            // End:0xA1
            if(((int(ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress) == int(Go.ObjectivePriority)) && Go.IsActive()) && !Go.bOptionalObjective || CurrentObjective == none)
            {
                CurrentObjective = Go;
            }
            Go = Go.NextObjective;
            // [Loop Continue]
            goto J0x2A;
        }
    }
    return CurrentObjective;
    //return;    
}

function bool IsPlayingIntro()
{
    return false;
    //return;    
}

function bool IsPracticeRound()
{
    return ASGameReplicationInfo(GameReplicationInfo).IsPracticeRound();
    //return;    
}

function bool IsPlaying()
{
    return false;
    //return;    
}

function ScoreObjective(PlayerReplicationInfo Scorer, float Score)
{
    // End:0x26
    if(GameRulesModifiers != none)
    {
        GameRulesModifiers.ScoreObjective(Scorer, int(Score));
    }
    //return;    
}

function bool CanDisableObjective(GameObjective Go)
{
    local ASGameReplicationInfo ASGRI;

    // End:0x0D
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
    if(int(Go.ObjectivePriority) <= int(ASGRI.ObjectiveProgress))
    {
        return true;
    }
    return false;
    //return;    
}

function ObjectiveDisabled(GameObjective DisabledObjective)
{
    local int ForcedScore, ObjectiveDisabledTime;
    local Controller C;

    ObjectiveDisabledTime = RoundStartTime - RemainingTime;
    DisabledObjective.ObjectiveDisabledTime = ObjectiveDisabledTime;
    // End:0x1D3
    if((IsPlaying()) && DisabledObjective.DisabledBy != none)
    {
        // End:0x62
        if(DisabledObjective.bOptionalObjective)
        {
            ForcedScore = 5;            
        }
        else
        {
            ForcedScore = 10;
        }
        DisabledObjective.AwardAssaultScore(ForcedScore);
        GameEvent("ObjectiveCompleted_Trophy", (string(DisabledObjective.ObjectivePriority) @ string(ObjectiveDisabledTime)) @ DisabledObjective.Objective_Info_Attacker, DisabledObjective.DisabledBy);
        ASPlayerReplicationInfo(DisabledObjective.DisabledBy).DisabledObjectivesCount++;
        // End:0x1D3
        if(PlayerController(DisabledObjective.DisabledBy.Owner) != none)
        {
            PlayerController(DisabledObjective.DisabledBy.Owner).ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_Awards', 0);
            C = Level.ControllerList;
            J0x156:

            // End:0x1D3 [Loop If]
            if(C != none)
            {
                // End:0x1BC
                if((PlayerController(C) != none) && C != DisabledObjective.DisabledBy.Owner)
                {
                    PlayerController(C).ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_Awards', 1, DisabledObjective.DisabledBy);
                }
                C = C.nextController;
                // [Loop Continue]
                goto J0x156;
            }
        }
    }
    // End:0x233
    if(!DisabledObjective.bOptionalObjective)
    {
        Teams[1 - int(DisabledObjective.DefenderTeamIndex)].ObjectivesDisabledCount++;
        Teams[1 - int(DisabledObjective.DefenderTeamIndex)].LastObjectiveTime = ObjectiveDisabledTime;
    }
    LastDisabledObjective = DisabledObjective;
    super(UnrealMPGameInfo).ObjectiveDisabled(DisabledObjective);
    //return;    
}

function FindNewObjectives(GameObjective DisabledObjective)
{
    // End:0x23
    if(!bGameEnded && ResetCountDown < 1)
    {
        UpdateObjectiveProgression(DisabledObjective);
    }
    super(TeamGame).FindNewObjectives(DisabledObjective);
    //return;    
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
    J0x4B:

    // End:0xC4 [Loop If]
    if(Go != none)
    {
        // End:0xAD
        if((int(CurrentProgressIndex) == int(Go.ObjectivePriority)) && !Go.bOptionalObjective)
        {
            bObjPriority = true;
            // End:0xAD
            if(Go.IsActive())
            {
                bIncPriority = false;
                // [Explicit Break]
                goto J0xC4;
            }
        }
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x4B;
    }
    J0xC4:

    // End:0xDF
    if(bObjPriority && bIncPriority)
    {
        CurrentProgressIndex++;
    }
    // End:0x107
    if(int(CurrentProgressIndex) != int(BackupProgressIndex))
    {
        ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress++;
    }
    HighlightCurrentPhysicalObjectives();
    //return;    
}

function HighlightCurrentPhysicalObjectives()
{
    local GameObjective Go;

    Go = Teams[0].AI.Objectives;
    J0x1F:

    // End:0xA2 [Loop If]
    if(Go != none)
    {
        // End:0x7B
        if((int(ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress) >= int(Go.ObjectivePriority)) && Go.IsActive())
        {
            Go.HighlightPhysicalObjective(true);            
        }
        else
        {
            Go.HighlightPhysicalObjective(false);
        }
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

function AnnounceNextObjective(GameObjective NewObjective)
{
    // End:0x0D
    if(!IsPlaying())
    {
        return;
    }
    //return;    
}

function ShowPathTo(PlayerController P, int TeamNum)
{
    local GameObjective G, Best;
    local Class<WillowWhisp> WWclass;
    local ASGameReplicationInfo ASGRI;

    ASGRI = ASGameReplicationInfo(GameReplicationInfo);
    Best = GetCurrentObjective();
    // End:0xB0
    if((Best == none) || !Best.IsActive())
    {
        G = Teams[0].AI.Objectives;
        J0x5C:

        // End:0xB0 [Loop If]
        if(G != none)
        {
            // End:0x99
            if(!G.bOptionalObjective && CheckObjectivePriority(G))
            {
                Best = G;
                // [Explicit Break]
                goto J0xB0;
            }
            G = G.NextObjective;
            // [Loop Continue]
            goto J0x5C;
        }
    }
    J0xB0:

    // End:0x124
    if(Best != none)
    {
        // End:0x124
        if(P.FindPathToward(Best, false) != none)
        {
            WWclass = Class<WillowWhisp>(DynamicLoadObject(PathWhisps[int(Best.DefenderTeamIndex)], Class'Core.Class'));
            Spawn(WWclass, P,, P.Pawn.Location);
        }
    }
    //return;    
}

function bool CheckObjectivePriority(GameObjective Go)
{
    local ASGameReplicationInfo ASGRI;

    ASGRI = ASGameReplicationInfo(GameReplicationInfo);
    // End:0x47
    if(((ASGRI == none) || !Go.IsActive()) || Go.bDisabled)
    {
        return false;
    }
    // End:0x6E
    if(int(ASGRI.ObjectiveProgress) >= int(Go.ObjectivePriority))
    {
        return true;
    }
    return false;
    //return;    
}

event NewSpawnAreaEnabled(bool bDefenders)
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:

    // End:0x1F4 [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x57
        if(bDefenders && C.GetTeamNum() != (GetDefenderNum()))
        {            
        }
        else
        {
            // End:0x81
            if(!bDefenders && C.GetTeamNum() == (GetDefenderNum()))
            {                
            }
            else
            {
                // End:0xCD
                if((C.IsInState('Dead') || C.Pawn == none) || C.Pawn.Health < 1)
                {                    
                }
                else
                {
                    // End:0x103
                    if((PC != none) && PC.IsDead() || PC.IsSpectating())
                    {                        
                    }
                    else
                    {
                        // End:0x1DD
                        if((C.Pawn != none) && ASPlayerReplicationInfo(C.PlayerReplicationInfo) != none)
                        {
                            ASPlayerReplicationInfo(C.PlayerReplicationInfo).bTeleportToSpawnArea = true;
                            // End:0x191
                            if(AIController(C) != none)
                            {
                                ASPlayerReplicationInfo(C.PlayerReplicationInfo).TeleportTime = int(Level.TimeSeconds);                                
                            }
                            else
                            {
                                ASPlayerReplicationInfo(C.PlayerReplicationInfo).TeleportTime = (ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - ASGameReplicationInfo(GameReplicationInfo).RoundStartTime) + RemainingTime;
                            }
                        }
                    }
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

event NoTranslocatorKeyPressed(PlayerController PC)
{
    local ASGameReplicationInfo ASGRI;
    local ASPlayerReplicationInfo ASPRI;

    // End:0x28
    if((PC == none) || ASPlayerReplicationInfo(PC.PlayerReplicationInfo) == none)
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
    // End:0xB2
    if((((ASGRI.RoundTimeLimit - ASGRI.RoundStartTime) + RemainingTime) + ASGRI.MaxTeleportTime) < ASPRI.TeleportTime)
    {
        return;
    }
    TeleportPlayerToSpawn(PC);
    //return;    
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
    //return;    
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x45
    if((Killed != none) && ASPlayerReplicationInfo(Killed.PlayerReplicationInfo) != none)
    {
        ASPlayerReplicationInfo(Killed.PlayerReplicationInfo).bTeleportToSpawnArea = false;
    }
    super(DeathMatch).Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    //return;    
}

function int VehicleScoreKill(Controller Killer, Controller Killed, Vehicle DestroyedVehicle, out string KillInfo)
{
    // End:0x138
    if(DestroyedVehicle.bKeyVehicle || DestroyedVehicle.bHighScoreKill)
    {
        // End:0x75
        if((Killer == Killed) || Killer.GetTeamNum() == DestroyedVehicle.GetTeamNum())
        {
            return super(DeathMatch).VehicleScoreKill(Killer, Killed, DestroyedVehicle, KillInfo);
        }
        // End:0x138
        if(ASPlayerReplicationInfo(Killer.PlayerReplicationInfo) != none)
        {
            GameEvent("VehicleDestroyed_Trophy", DestroyedVehicle.VehicleNameString, Killer.PlayerReplicationInfo);
            ASPlayerReplicationInfo(Killer.PlayerReplicationInfo).DestroyedVehicles++;
            // End:0x138
            if((PlayerController(Killer) != none) && int(ASPlayerReplicationInfo(Killer.PlayerReplicationInfo).DestroyedVehicles) > 2)
            {
                PlayerController(Killer).ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_ASKillMessages', 1);
            }
        }
    }
    return super(DeathMatch).VehicleScoreKill(Killer, Killed, DestroyedVehicle, KillInfo);
    //return;    
}

function bool CriticalPlayer(Controller Other)
{
    local GameObjective Go;

    // End:0x52
    if(((Other.Pawn == none) || Other.PlayerReplicationInfo == none) || !IsAttackingTeam(Other.GetTeamNum()))
    {
        return super(TeamGame).CriticalPlayer(Other);
    }
    Go = Teams[0].AI.Objectives;
    J0x71:

    // End:0x12D [Loop If]
    if(Go != none)
    {
        // End:0xD5
        if((!Go.IsActive() || !Go.IsCritical()) || int(ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress) < int(Go.ObjectivePriority))
        {            
        }
        else
        {
            // End:0x116
            if((Go.MyBaseVolume != none) && Go.MyBaseVolume.Encompasses(Other.Pawn))
            {
                return true;
            }
        }
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x71;
    }
    return super(TeamGame).CriticalPlayer(Other);
    //return;    
}

function SpecialEvent(PlayerReplicationInfo Who, string Desc)
{
    // End:0x1B
    if(!IsPracticeRound())
    {
        super(UnrealMPGameInfo).SpecialEvent(Who, Desc);
    }
    //return;    
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, Class<DamageType> Damage)
{
    // End:0x25
    if(!IsPracticeRound())
    {
        super(UnrealMPGameInfo).KillEvent(KillType, Killer, Victim, Damage);
    }
    //return;    
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
    // End:0x20
    if(!IsPracticeRound())
    {
        super(UnrealMPGameInfo).ScoreEvent(Who, Points, Desc);
    }
    //return;    
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
    // End:0x20
    if(!IsPracticeRound())
    {
        super(UnrealMPGameInfo).TeamScoreEvent(Team, Points, Desc);
    }
    //return;    
}

function RestartPlayer(Controller aPlayer)
{
    local string PawnOverrideClass;

    super(TeamGame).RestartPlayer(aPlayer);
    // End:0x89
    if((aPlayer != none) && aPlayer.PlayerReplicationInfo != none)
    {
        PawnOverrideClass = ASPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass;
        // End:0x89
        if(PawnOverrideClass != "")
        {
            SpawnAndPossessPawn(aPlayer, PawnOverrideClass);
            ASPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass = "";
        }
    }
    // End:0xA9
    if(PlayerController(aPlayer) != none)
    {
        BroadCast_AssaultRole_Message(PlayerController(aPlayer));
    }
    //return;    
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
    //return;    
}

function Class<Pawn> GetDefaultPlayerClass(Controller C)
{
    local string PawnClassName;
    local Class<Pawn> PawnClass;

    // End:0x4D
    if(C != none)
    {
        PawnClassName = string(C.default.PawnClass);
        PawnClass = Class<Pawn>(DynamicLoadObject(PawnClassName, Class'Core.Class'));
        // End:0x4D
        if(PawnClass != none)
        {
            return PawnClass;
        }
    }
    return Class<Pawn>(DynamicLoadObject(DefaultPlayerClassName, Class'Core.Class'));
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint N, BestStart;
    local int i;
    local string PawnOverrideClass;
    local byte Team, t;
    local float BestRating, NewRating;
    local Teleporter Tel;

    // End:0x6B
    if(((Player != none) && Player.PlayerReplicationInfo != none) && Player.PlayerReplicationInfo.Team != none)
    {
        Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);        
    }
    else
    {
        Team = inTeam;
    }
    // End:0x91
    if(Player != none)
    {
        Player.StartSpot = none;
    }
    // End:0xD1
    if(GameRulesModifiers != none)
    {
        N = GameRulesModifiers.FindPlayerStart(Player, inTeam, incomingName);
        // End:0xD1
        if(N != none)
        {
            return N;
        }
    }
    // End:0x110
    if(incomingName != "")
    {
        // End:0x10F
        foreach AllActors(Class'Engine.Teleporter', Tel)
        {
            // End:0x10E
            if(string(Tel.Tag) ~= incomingName)
            {                
                return Tel;
            }            
        }        
    }
    N = Level.NavigationPointList;
    J0x124:

    // End:0x186 [Loop If]
    if(N != none)
    {
        NewRating = RatePlayerStart(N, Team, Player);
        // End:0x16F
        if(NewRating > BestRating)
        {
            BestRating = NewRating;
            BestStart = N;
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x124;
    }
    // End:0x2F2
    if(PlayerStart(BestStart) == none)
    {
        Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
        Log(((((" Player:" @ Player.GetHumanReadableName()) @ "Team:") @ string(Team)) @ "Player.Event:") @ string(Player.Event));
        DebugShowSpawnAreas();
        BestRating = -100000000.0000000;
        // End:0x2F1
        foreach AllActors(Class'Engine.NavigationPoint', N)
        {
            // End:0x27B
            if(PlayerStart(N) != none)
            {
                t = PlayerStart(N).TeamNumber;                
            }
            else
            {
                t = Team;
            }
            NewRating = RatePlayerStart(N, t, Player);
            // End:0x2BC
            if(InventorySpot(N) != none)
            {
                NewRating -= float(50);
            }
            NewRating += (float(20) * FRand());
            // End:0x2F0
            if(NewRating > BestRating)
            {
                BestRating = NewRating;
                BestStart = N;
            }            
        }        
    }
    // End:0x37F
    if(SpawnManagers.Length > 0)
    {
        i = 0;
        J0x305:

        // End:0x37F [Loop If]
        if(i < SpawnManagers.Length)
        {
            PawnOverrideClass = SpawnManagers[i].PawnClassOverride(Player, PlayerStart(BestStart), Team);
            // End:0x375
            if(PawnOverrideClass != "")
            {
                ASPlayerReplicationInfo(Player.PlayerReplicationInfo).PawnOverrideClass = PawnOverrideClass;
                // [Explicit Break]
                goto J0x37F;
            }
            i++;
            // [Loop Continue]
            goto J0x305;
        }
    }
    J0x37F:

    // End:0x39E
    if(Player != none)
    {
        Player.Event = 'None';
    }
    return BestStart;
    //return;    
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart P;
    local int i;

    P = PlayerStart(N);
    // End:0x21
    if(P == none)
    {
        return -10000000.0000000;
    }
    // End:0x8B
    if(SpawnManagers.Length > 0)
    {
        i = 0;
        J0x34:

        // End:0x8B [Loop If]
        if(i < SpawnManagers.Length)
        {
            // End:0x81
            if(SpawnManagers[i].ApprovePlayerStart(P, Team, Player))
            {
                return super(DeathMatch).RatePlayerStart(N, Team, Player);
            }
            i++;
            // [Loop Continue]
            goto J0x34;
        }
    }
    return -9000000.0000000;
    //return;    
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

        // End:0x184 [Loop If]
        if(i < SpawnManagers.Length)
        {
            PSM = SpawnManagers[i];
            Log((((("PlayerSpawnManager:" @ string(PSM)) @ "bEnabled:") @ string(PSM.bEnabled)) @ "Tag:") @ string(PSM.Tag));
            // End:0x17A
            if(PSM.bEnabled)
            {
                N = Level.NavigationPointList;
                J0xEA:

                // End:0x17A [Loop If]
                if(N != none)
                {
                    ps = PlayerStart(N);
                    // End:0x113
                    if(ps == none)
                    {                        
                    }
                    else
                    {
                        // End:0x163
                        if(int(ps.TeamNumber) == PSM.PlayerStartTeam)
                        {
                            Log(((" " @ string(ps)) @ "Enabled:") @ string(ps.bEnabled));
                        }
                    }
                    N = N.nextNavigationPoint;
                    // [Loop Continue]
                    goto J0xEA;
                }
            }
            i++;
            // [Loop Continue]
            goto J0x49;
        }
    }
    Log("==============");
    Log("End...........");
    Log("==============");
    //return;    
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType, optional int iWeaponType)
{
    // End:0x2D
    if((instigatedBy == injured) && Class<WeaponDamageType>(DamageType) != none)
    {
        Momentum *= 0.3000000;
    }
    return super(TeamGame).ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
    //return;    
}

function int AdjustDestroyObjectiveDamage(int Damage, Controller instigatedBy, GameObjective Go)
{
    local PlayerController LocalPlayer;

    // End:0x2C
    if((AIController(instigatedBy) == none) || instigatedBy.PlayerReplicationInfo == none)
    {
        return Damage;
    }
    LocalPlayer = Level.GetLocalPlayerController();
    // End:0xB1
    if(((int(Level.NetMode) == int(NM_Standalone)) || bPlayersVsBots) && (LocalPlayer == none) || LocalPlayer.GetTeamNum() != instigatedBy.GetTeamNum())
    {
        return int(float(Damage) * Go.BotDamageScaling);
    }
    return Damage;
    //return;    
}

function WeakObjectives()
{
    super(TeamGame).WeakObjectives();
    bWeakObjectives = true;
    //return;    
}

function DisableNextObjective()
{
    local GameObjective Go;

    Go = Teams[0].AI.Objectives;
    J0x1F:

    // End:0x62 [Loop If]
    if(Go != none)
    {
        // End:0x4B
        if(CheckObjectivePriority(Go))
        {
            Go.CompleteObjective(none);
            // [Explicit Break]
            goto J0x62;
        }
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x1F;
    }
    J0x62:

    //return;    
}

function QueueAnnouncerSound(string ASound, byte AnnouncementLevel, byte Team, optional Object.EAPriority Priority, optional byte Switch)
{
    local Controller C;

    // End:0xB8
    if(!IsPlayingIntro() && ASound != "")
    {
        C = Level.ControllerList;
        J0x2D:

        // End:0xB8 [Loop If]
        if(C != none)
        {
            // End:0xA1
            if(C.IsA('PlayerController') && (int(Team) == 255) || C.GetTeamNum() == int(Team))
            {
                PlayerController(C).QueueAnnouncement(ASound, AnnouncementLevel, Priority, Switch);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x2D;
        }
    }
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super(TeamGame).PrecacheGameAnnouncements(V, bRewardSounds);
    //return;    
}

simulated function UpdateAnnouncements()
{
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    super(TeamGame).GetServerDetails(ServerState);
    AddServerDetail(ServerState, "RoundLimit", string(RoundLimit));
    AddServerDetail(ServerState, "RoundTimeLimit", string(RoundTimeLimit));
    AddServerDetail(ServerState, "ResetTimeDelay", string(ResetTimeDelay));
    AddServerDetail(ServerState, "ReinforcementsFreq", string(ReinforcementsFreq));
    AddServerDetail(ServerState, "PracticeTimeLimit", string(PracticeTimeLimit));
    //return;    
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
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super(TeamGame).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.GameGroup, "RoundLimit", default.ASPropsDisplayText[i++], 0, 1, "Text", "3;1:999");
    PlayInfo.AddSetting(default.GameGroup, "RoundTimeLimit", default.ASPropsDisplayText[i++], 0, 1, "Text", "3;0:999");
    PlayInfo.AddSetting(default.GameGroup, "ResetTimeDelay", default.ASPropsDisplayText[i++], 0, 1, "Text", "3;0:999",,, true);
    PlayInfo.AddSetting(default.GameGroup, "ReinforcementsFreq", default.ASPropsDisplayText[i++], 0, 1, "Text", "3;0:999",,, true);
    PlayInfo.AddSetting(default.GameGroup, "PracticeTimeLimit", default.ASPropsDisplayText[i++], 0, 1, "Text", "3;0:999",,, true);
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1E
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
        // End:0xFFFF
        default:
            return super(TeamGame).GetDescriptionText(PropName);
            break;
    }
    //return;    
}

static function bool AllowMutator(string MutatorClassName)
{
    // End:0x0E
    if(MutatorClassName == "")
    {
        return false;
    }
    // End:0x1E
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
    // End:0x7F
    if(MutatorClassName ~= "wGame.MutInstagib")
    {
        return false;
    }
    // End:0xA2
    if(MutatorClassName ~= "wGame.MutZoomInstagib")
    {
        return false;
    }
    return super(GameInfo).AllowMutator(MutatorClassName);
    //return;    
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
    J0x2C:

    // End:0x5E [Loop If]
    if(i < default.ASHints.Length)
    {
        Hints[Hints.Length] = default.ASHints[i];
        i++;
        // [Loop Continue]
        goto J0x2C;
    }
    return Hints;
    //return;    
}

state MatchInProgress
{
    function BeginState()
    {
        local int iTemp;

        iTemp = 0;
        //return;        
    }

    function EndState()
    {
        local int iTemp;

        iTemp = 1;
        //return;        
    }

    function Timer()
    {
        local Controller C;
        local PlayerController PC;
        local GameObjective Go;

        super.Timer();
        // End:0x140
        if((!bDisableReinforcements && ResetCountDown == 0) && ReinforcementsFreq > 0)
        {
            ReinforcementsCount++;
            // End:0x6B
            if(ReinforcementsCount > (ReinforcementsFreq + ReinforcementsValidTime))
            {
                ReinforcementsCount = 0;
                ASGameReplicationInfo(GameReplicationInfo).ReinforcementCountDown = ReinforcementsFreq;                
            }
            else
            {
                // End:0x140
                if(ReinforcementsCount >= ReinforcementsFreq)
                {
                    ASGameReplicationInfo(GameReplicationInfo).ReinforcementCountDown = 0;
                    C = Level.ControllerList;
                    J0xA3:

                    // End:0x140 [Loop If]
                    if(C != none)
                    {
                        PC = PlayerController(C);
                        // End:0x129
                        if(((PC != none) && PC.IsDead()) && ASPlayerReplicationInfo(PC.PlayerReplicationInfo).bAutoRespawn)
                        {
                            RestartPlayer(PC);
                            ASPlayerReplicationInfo(PC.PlayerReplicationInfo).bAutoRespawn = false;
                        }
                        C = C.nextController;
                        // [Loop Continue]
                        goto J0xA3;
                    }
                }
            }
        }
        // End:0x163
        if(TimeLimit < 1)
        {
            GameReplicationInfo.bStopCountDown = false;
            RemainingTime--;
        }
        GameReplicationInfo.RemainingTime = RemainingTime;
        // End:0x1A0
        if((float(RemainingTime) % float(60)) == float(0))
        {
            GameReplicationInfo.RemainingMinute = RemainingTime;
        }
        // End:0x334
        if(ResetCountDown > 0)
        {
            ResetCountDown--;
            // End:0x244
            if(ResetCountDown < 3)
            {
                C = Level.ControllerList;
                J0x1D2:

                // End:0x244 [Loop If]
                if(C != none)
                {
                    // End:0x22D
                    if((C.Pawn != none) && C.Pawn.IsA('RedeemerWarhead'))
                    {
                        C.Pawn.Fire(1.0000000);
                    }
                    C = C.nextController;
                    // [Loop Continue]
                    goto J0x1D2;
                }
            }
            // End:0x320
            if((ResetCountDown > 0) && ResetCountDown < 10)
            {
                BroadcastLocalizedMessage(Class'UnrealGame.TimerMessage', ResetCountDown);
                // End:0x31D
                if(ResetCountDown == 1)
                {
                    ASGameReplicationInfo(GameReplicationInfo).ObjectiveProgress = 0;
                    GameReplicationInfo.NetUpdateTime = Level.TimeSeconds;
                    Go = Teams[0].AI.Objectives;
                    J0x2CA:

                    // End:0x31D [Loop If]
                    if(Go != none)
                    {
                        Go.Reset();
                        Go.NetUpdateTime = Level.TimeSeconds - float(1);
                        Go = Go.NextObjective;
                        // [Loop Continue]
                        goto J0x2CA;
                    }
                }                
            }
            else
            {
                // End:0x331
                if(ResetCountDown == 0)
                {
                    StartNewRound();
                }
            }            
        }
        else
        {
            // End:0x3B4
            if((ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit > 0) && (RoundStartTime - RemainingTime) >= ASGameReplicationInfo(GameReplicationInfo).RoundTimeLimit)
            {
                // End:0x39B
                if(IsPracticeRound())
                {
                    EndRound(1, none, "practicetimelimit");                    
                }
                else
                {
                    EndRound(1, none, "roundtimelimit");
                }
            }
        }
        //return;        
    }

    function float SpawnWait(AIController B)
    {
        // End:0x8D
        if(((B.IsA('wBot') && GameReplicationInfo.bMatchHasBegun) && ResetCountDown == 0) && !bDisableReinforcements)
        {
            // End:0x6E
            if(ReinforcementsCount >= ReinforcementsFreq)
            {
                return float(ReinforcementsValidTime - (ReinforcementsCount - ReinforcementsFreq)) * FRand();                
            }
            else
            {
                return float(ReinforcementsFreq - ReinforcementsCount) + (float(ReinforcementsValidTime) * FRand());
            }            
        }
        else
        {
            return super(UnrealMPGameInfo).SpawnWait(B);
        }
        //return;        
    }

    function bool PlayerCanRestart(PlayerController aPlayer)
    {
        // End:0x64
        if((GameReplicationInfo.bMatchHasBegun && ResetCountDown == 0) && !bDisableReinforcements)
        {
            // End:0x5F
            if(ReinforcementsCount < ReinforcementsFreq)
            {
                ASPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).bAutoRespawn = true;
                return false;                
            }
            else
            {
                return true;
            }            
        }
        else
        {
            return true;
        }
        //return;        
    }

    function bool PlayerCanRestartGame(PlayerController aPlayer)
    {
        return false;
        //return;        
    }

    function bool IsPlaying()
    {
        return (int(ASGameReplicationInfo(GameReplicationInfo).RoundWinner) == int(0)) && ResetCountDown == 0;
        //return;        
    }
    stop;    
}

state MatchOver
{
    function EndRound(ASGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
    {
        //return;        
    }
    stop;    
}

state SPIntroCinematic
{
    function BeginState()
    {
        Level.GetLocalPlayerController().bHideVehicleNoEntryIndicator = true;
        CurrentRound = 0;
        TriggerEvent('StartRound', self, none);
        //return;        
    }

    event SceneStarted(SceneManager SM, Actor Other)
    {
        HighlightCurrentPhysicalObjectives();
        CurrentMatineeScene = SM;
        //return;        
    }

    function bool IsPlayingIntro()
    {
        return true;
        //return;        
    }

    function bool CanDisableObjective(GameObjective Go)
    {
        return true;
        //return;        
    }

    event SceneEnded(SceneManager SM, Actor Other)
    {
        // End:0x4D
        if(((SM.NextSceneTag == 'None') || SM.NextSceneTag == 'None') || SM.bAbortCinematic)
        {
            GotoState('MatchInProgress');
        }
        //return;        
    }

    event SceneAbort()
    {
        local PlayerController PC;

        PC = Level.GetLocalPlayerController();
        // End:0x3C
        if(PC != none)
        {
            PC.ConsoleCommand("stopsounds");
        }
        CurrentMatineeScene.AbortScene();
        //return;        
    }

    function EndState()
    {
        local PlayerController PC;

        PC = Level.GetLocalPlayerController();
        PC.bHideVehicleNoEntryIndicator = false;
        // End:0x57
        if((PC != none) && PC.PlayerReplicationInfo != none)
        {
            PC.GotoState('PlayerWaiting');
        }
        GotoState('PendingMatch');
        //return;        
    }
    stop;    
}

auto state PendingMatch
{Begin:

    // End:0x0F
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
        //return;        
    }

    function BeginState()
    {
        local Controller C, NextC;
        local PlayerController PC;

        C = Level.ControllerList;
        J0x14:

        // End:0xAD [Loop If]
        if(C != none)
        {
            NextC = C.nextController;
            // End:0x9F
            if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
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
            // [Loop Continue]
            goto J0x14;
        }
        //return;        
    }

    function bool PlayerCanRestartGame(PlayerController aPlayer)
    {
        return false;
        //return;        
    }

    function EndState()
    {
        // End:0x36
        if(int(CurrentRound) >= MaxRounds)
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
        //return;        
    }
    stop;    
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
    ASHints[0]="HUD ???? ?? ???? ??? ?????."
    ASHints[1]="?? ???? ??? ?? ??? ???? ????? ????? ??????."
    ASHints[2]="??? ????? ??????, %SWITCHWEAPON 10%? ???? ? ???? ???? ? ? ????."
    ASHints[3]="%BASEPATH 0% ?? %BASEPATH 1%? ??? ? ?? ???? ????? ???, ???? ?? ??? ???, ????? ???? ? ? ????."
    ASHints[4]="???? ?? ?? ????? ?? ?????? ?? ????."
    ASHints[5]="?? ???? ??? ?????? ?? ???? ?? ??? ?? ??????."
    ASHints[6]="???? ?? ??? ??? ??? ?? ? ????."
    ASHints[7]="??? ????? ?? ??? ?? ? ????."
    ASHints[8]="????? ???, ?? ??? ???? ??? ???? ???? ????."
    ASHints[9]="?? ?? ?? ???? ???, ??? ???? ???? ??? ?????."
    ASHints[10]="?? ??? %MOVEFORWARD%? ??? ??? ?? ? ??? %MOVEBACKWARD%? ??? ?? ???."
    ASHints[11]="?? ??? ???? ?? ??? ??? ????."
    ASHints[12]="?? ??? ?? ???? ??? ???? ?? ??? ?? ?? ??? ?????."
    ASHints[13]="%NEXTWEAPON% ? %PREVWEAPON%? ??? ??? ??? ??? ??? ? ????."
    ASHints[14]="???? ????, %NEXTWEAPON% ? %PREVWEAPON%? ???? ???? ?? ? ? ????.."
    ASHints[15]="???? ?? ??? ????? ?? ???? ????? ?? ???? ??? ??? ????? ???? ?? ? ????."
    ASHints[16]="???? ?? ???? ???? ?????? ??? ???, ???? ??? ??? ?? ?????? ?????."
    ASHints[17]="%TOGGLEBEHINDVIEW%? ???? ??? 1?? ?? 3?? ???? ??? ? ????."
    NewRoundSound="New_assault_in"
    AttackerWinRound[0]="Red_team_attacked"
    AttackerWinRound[1]="Blue_team_attacked"
    DefenderWinRound[0]="Red_team_defended"
    DefenderWinRound[1]="Blue_team_defended"
    DrawGameSound="Draw_Game"
    bScoreTeamKills=false
    bSpawnInTeamArea=true
    TeammateBoost=0.2500000
    TeamAIType[0]=Class'UT2k4Assault_Decompressed.ASTeamAI'
    TeamAIType[1]=Class'UT2k4Assault_Decompressed.ASTeamAI'
    NetWait=15
    bSkipPlaySound=true
    SpawnProtectionTime=3.0000000
    DefaultEnemyRosterClass="WGame.wTeamRoster"
    ADR_Kill=2.0000000
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
    GameReplicationInfoClass=Class'UT2k4Assault_Decompressed.ASGameReplicationInfo'
    GameName="???"
    Description="???: ?? ???? ?? ??? ????? ???? ? ????? ? ?? ???, ?? ?? ??? ?? ???. ? ????? ??? ?? ??? ?? ???."
    ScreenShotName="UT2004Thumbnails.AssaultShots"
    DecoTextName="WGame.TeamGame"
    Acronym="AS"
}