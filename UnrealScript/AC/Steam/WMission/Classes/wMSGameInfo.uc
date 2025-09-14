/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wMSGameInfo.uc
 * Package Imports:
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:38
 *	Functions:102
 *	States:5
 *
 *******************************************************************************/
class wMSGameInfo extends wTeamGame
    dependson(wMSCinematic_SceneManager)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

enum ERER_Reason
{
    ERER_AttackersWin,
    ERER_AttackersLose,
    ERER_AttackersWin_DefendersDied,
    ERER_AttackersLose_AttackersDied,
    ERER_DrawGame,
    ERER_Team0,
    ERER_Team1
};

var() config int RoundLimit;
var int MaxRounds;
var() config int RoundTimeLimit;
var() config int PracticeTimeLimit;
var int DefuseTimeLimit;
var config int ReinforcementsFreq;
var int ReinforcementsValidTime;
var int ReinforcementsCount;
var() int ScoreLimit;
var() int ChangeAttackTeamRound;
var int RespawnRestrictionTimeRound1;
var float EnqueueRespawningControllersLastTIme;
var int RemainingTimeWhenObjectIsSet;
var bool bRoundOverProcessed;
var float RespawnElapsedTime;
var float LastRespawnTime;
var bool bCheckPrecacheInProcessRespawn;
var array<Controller> RespawningControllers;
var byte CurrentAttackingTeam;
var byte FirstAttackingTeam;
var byte CurrentRound;
var int RoundStartTime;
var bool bDisableReinforcements;
var string NewRoundSound;
var name AttackerWinRound[2];
var name DefenderWinRound[2];
var name DrawGameSound;
var Vehicle KeyVehicle;
var SceneManager CurrentMatineeScene;
var wMSCinematic_SceneManager EndCinematic;
var bool bObjectivePlanted;
var name nPlantedObjectiveName;
var string sndChangeAttackTeam;
var string sndLastMan;
var string sndRoundWin;
var string sndRoundLose;
var localized string BombPlantedMessage;
var bool bMultiBomb;

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

function ForceObjectiveDefenderTeamIndex()
{
    local GameObjective Go;

    Go = Teams[0].AI.Objectives;
    J0x1f:
    // End:0x81 [While If]
    if(Go != none)
    {
        Go.DefenderTeamIndex = byte(1 - CurrentAttackingTeam);
        Go.NetUpdateTime = Level.TimeSeconds - float(1);
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
}

function PostBeginPlay()
{
    super(TeamGame).PostBeginPlay();
    ForceObjectiveDefenderTeamIndex();
    bObjectivePlanted = false;
    nPlantedObjectiveName = 'None';
    // End:0x38
    foreach AllActors(class'wMSCinematic_SceneManager', EndCinematic, 'OutroScene')
    {
        // End:0x38
        break;                
    }
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController PC;
    local bool bSpectator;

    PC = super(DeathMatch).Login(Portal, Options, Error);
    // End:0xe7
    if(PC != none)
    {
        Log("[PlayerController::Login]" $ PC.PlayerReplicationInfo.PlayerName);
        // End:0xe7
        if(Level.NetMode == 0)
        {
            bSpectator = ParseOption(Options, "SpectatorOnly") ~= "1";
            CurrentRound = 1;
            // End:0xe7
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
    ScoreLimit = kMM.iGoalRound;
    RoundTimeLimit = Max(0, GetIntOption(Options, "RoundTimeLimit", kMM.iTimeLimit));
    PracticeTimeLimit = Max(0, GetIntOption(Options, "PracticeTimeLimit", PracticeTimeLimit));
    RoundLimit = ScoreLimit * 2;
    MaxRounds = RoundLimit * 2;
    FirstAttackingTeam = byte(Max(-1, GetIntOption(Options, "FirstAttackingTeam", FirstAttackingTeam)));
    ResetTimeDelay = Max(0, GetIntOption(Options, "ResetTimeDelay", ResetTimeDelay));
    ReinforcementsFreq = Max(0, GetIntOption(Options, "ReinforcementsFreq", ReinforcementsFreq));
    TimeLimit = 0;
    RemainingTime = RoundTimeLimit + ResetTimeDelay + 1 * 60 * MaxRounds + 2 + PracticeTimeLimit;
    // End:0x17c
    if(GameReplicationInfo != none)
    {
        GameReplicationInfo.RemainingTime = RemainingTime;
    }
}

function StartMatchChangedHost()
{
    local wGameObject_Bomb Bomb;
    local Pawn P;

    bMultiBomb = GameReplicationInfo.bMultiBomb;
    // End:0x73
    if(GameReplicationInfo.bMultiBomb)
    {
        // End:0x70
        if(!GameReplicationInfo.bObjectivePlanted)
        {
            // End:0x6f
            foreach DynamicActors(class'wGameObject_Bomb', Bomb)
            {
                Bomb.bHidden = true;
                Bomb.bDisabled = true;                                
            }
        }
    }
    // End:0x17a
    else
    {
        // End:0x179
        foreach DynamicActors(class'wGameObject_Bomb', Bomb)
        {
            // End:0x178
            if(Bomb.bHeld)
            {
                // End:0x177
                foreach DynamicActors(class'Pawn', P)
                {
                    // End:0x176
                    if(Bomb.strPlayerName == P.OwnerName)
                    {
                        // End:0x159
                        if(P.Controller == none)
                        {
                            // End:0x12d
                            if(P.PlayerReplicationInfo != none)
                            {
                                P.PlayerReplicationInfo.HasFlag = Bomb;
                                Bomb.HolderPRI = TeamPlayerReplicationInfo(P.PlayerReplicationInfo);
                            }
                            Bomb.Holder = UnrealPawn(P);
                            Bomb.GotoState('Held');
                        }
                        // End:0x176
                        else
                        {
                            Bomb.SetHolder(P.Controller);
                        }
                    }                                        
                }
            }                        
        }
    }
}

function StartMatch()
{
    super.StartMatch();
    Log("wMsGameInfo::StartMatch() bChangedHost=" $ string(bChangedHost));
    // End:0xa0
    if(CurrentRound == 0 && Level.NetMode == 0)
    {
        Log("wMsGameInfo::StartMatch() called StartNewRound()");
        StartNewRound();
    }
    // End:0x125
    else
    {
        Log("wMsGameInfo::StartMatch() called BeginRoundRound()");
        BeginRound(bChangedHost);
        // End:0x125
        if(bChangedHost == true)
        {
            switch(GameReplicationInfo.RoundState)
            {
                // End:0x10c
                case 1:
                    StartNewRound();
                    // End:0x125
                    break;
                // End:0x11a
                case 2:
                    StartMatchChangedHost();
                    // End:0x125
                    break;
                // End:0x122
                case 3:
                    // End:0x125
                    break;
                // End:0xffff
                default:
                }
            }
}

function InitGameReplicationInfo()
{
    super(DeathMatch).InitGameReplicationInfo();
    wMSGameReplicationInfo(GameReplicationInfo).MaxRounds = RoundLimit * 2;
    wMSGameReplicationInfo(GameReplicationInfo).ScoreLimit = ScoreLimit;
    wMSGameReplicationInfo(GameReplicationInfo).bMultiBomb = bMultiBomb;
    wMSGameReplicationInfo(GameReplicationInfo).DefuseTimeLimit = DefuseTimeLimit;
}

function Logout(Controller Exiting)
{
    // End:0x3a
    if(Exiting.PlayerReplicationInfo.HasFlag != none)
    {
        GameObjectDropped(Exiting.PlayerReplicationInfo.HasFlag);
    }
    // End:0x4c
    if(MaxLives > 0)
    {
        CheckMaxLives(none);
    }
    super(DeathMatch).Logout(Exiting);
}

function OnKillingDropOut(Pawn P);
function DiscardInventory(Pawn Other)
{
    local wGameObject_Bomb Bomb;
    local name stateName;

    // End:0x0d
    if(Other == none)
    {
        return;
    }
    // End:0x60
    if(Other.PlayerReplicationInfo != none && Other.PlayerReplicationInfo.HasFlag != none)
    {
        GameObjectDropped(Other.PlayerReplicationInfo.HasFlag);
    }
    // End:0xb9
    else
    {
        // End:0xb9
        if(bChangedHost)
        {
            // End:0xb8
            foreach DynamicActors(class'wGameObject_Bomb', Bomb)
            {
                // End:0xb7
                if(Bomb.strPlayerName == Other.OwnerName)
                {
                    stateName = Bomb.GetStateName();
                    GameObjectDropped(Bomb);
                }                                
            }
        }
    }
    super(GameInfo).DiscardInventory(Other);
}

function GameObjectDropped(Decoration D)
{
    // End:0x2b
    if(D.IsA('wGameObject_Bomb'))
    {
        wGameObject_Bomb(D).HolderDied();
    }
    // End:0x47
    else
    {
        D.Drop(vect(0.0, 0.0, 0.0));
    }
}

function BroadCast_AssaultRole_Message(PlayerController C);
function OnRoundTimeOverWithoutObjectPlanted()
{
    EndRound(1, none, "Round Time Over");
}

exec function fEndRound(byte Team)
{
    // End:0x30
    if(Team == CurrentAttackingTeam)
    {
        EndRound(0, none, "Force End Round");
    }
    // End:0x4a
    else
    {
        EndRound(1, none, "Force End Round");
    }
}

function CheckEndGameAfterRoundTimeOver();
function int GetTimeSecondsLeft()
{
    return GameReplicationInfo.GetRemainingTime();
}

function ProcessEndRound();
function ExplodeBomb()
{
    local wGameObject_Bomb Bomb;
    local Actor A;

    // End:0x68
    if(GameReplicationInfo.bObjectivePlanted)
    {
        // End:0x67
        foreach DynamicActors(class'wGameObject_Bomb', Bomb)
        {
            // End:0x66
            if(true)
            {
                Bomb.bHidden = true;
                Bomb.bDisabled = true;
                A = Spawn(class'wC4Explosive',,, Bomb.Location);
            }                        
        }
    }
}

function ProcessRespawn()
{
    local Controller C;
    local string before, after;
    local int lp1;

    C = Level.ControllerList;
    J0x14:
    // End:0x2ad [While If]
    if(C != none)
    {
        Log("[wMSGameInfo::PRocessRespawn] " $ C.PlayerReplicationInfo.PlayerName $ " NumLives=0");
        C.PlayerReplicationInfo.NumLives = 0;
        C.PlayerReplicationInfo.bOutOfLives = false;
        C.PlayerReplicationInfo.bOnlySpectator = false;
        C.PlayerReplicationInfo.KillSuccession = 0;
        // End:0x296
        if(C.IsA('PlayerController') || C.IsA('wBot') && C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0x14c
            if(C.PlayerReplicationInfo.bAdminSpecator)
            {
            }
            // End:0x296
            else
            {
                // End:0x1dc
                if(bCheckPrecacheInProcessRespawn && C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bPrecached)
                {
                    Log("[wMSGameInfo::ProcessRespawn] bPrecached == false " $ C.PlayerReplicationInfo.PlayerName);
                }
                // End:0x296
                else
                {
                    before = string(C.GetStateName());
                    RestartPlayer(C);
                    PlayerController(C).ClientFadeToColor();
                    after = string(C.GetStateName());
                    Log("[wMSGameInfo::ProcessRespawn] name=" $ C.PlayerReplicationInfo.PlayerName $ "state=" $ before $ " -> " $ after);
                    RespawningControllers.Remove(lp1, 1);
                    -- lp1;
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

event SceneStarted(SceneManager SM, Actor Other)
{
    // End:0x39
    if(Other != none && Other.IsA('wMSCinematic_SceneManager'))
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
    local bool bLastMan;

    bLastMan = Reason ~= "LastMan";
    // End:0x40
    if(bLastMan)
    {
        GameReplicationInfo.Winner = Winner.Team;
    }
    // End:0xcc
    else
    {
        // End:0x7e
        if(Teams[1].Score > Teams[0].Score)
        {
            GameReplicationInfo.Winner = Teams[1];
        }
        // End:0xcc
        else
        {
            // End:0xbc
            if(Teams[1].Score < Teams[0].Score)
            {
                GameReplicationInfo.Winner = Teams[0];
            }
            // End:0xcc
            else
            {
                GameReplicationInfo.Winner = none;
            }
        }
    }
    C = Level.ControllerList;
    J0xe0:
    // End:0x15f [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x148
        if(PC != none)
        {
            // End:0x148
            if(CurrentGameProfile != none)
            {
                CurrentGameProfile.bWonMatch = PC.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0xe0;
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    return true;
}

function PlayEndOfMatchMessage()
{
    local Controller C;
    local int oppTeam, myTeam;
    local PlayerController PC;

    Log("[wMSGameInfo::PlayEndOfMatchMessage]");
    // End:0x1db
    if(true)
    {
        C = Level.ControllerList;
        J0x40:
        // End:0x1db [While If]
        if(C != none)
        {
            // End:0x1c4
            if(C.IsA('PlayerController'))
            {
                PC = PlayerController(C);
                myTeam = PC.PlayerReplicationInfo.Team.TeamIndex;
                oppTeam = 1 - myTeam;
                Log("  " $ " Name=" $ PC.PlayerReplicationInfo.PlayerName $ " Team=" $ string(myTeam) $ " OppTeam=" $ string(oppTeam) $ " TeamScore=" $ string(Teams[myTeam].Score) $ " OppTeamScore=" $ string(Teams[oppTeam].Score));
                // End:0x19d
                if(Teams[myTeam].Score > Teams[oppTeam].Score)
                {
                    PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_Win);
                }
                // End:0x1c4
                else
                {
                    PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_Lose);
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x40;
        }
    }
}

function ProcessEndGame()
{
    local Controller C, NextC;

    C = Level.ControllerList;
    J0x14:
    // End:0x117 [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xf1
        if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            C.ClientRoundEnded();
            C.RoundHasEnded();
            C.PlayerReplicationInfo.IsSendRoundStartTime = false;
            C.PlayerReplicationInfo.KillSuccession = 0;
            C.PlayerReplicationInfo.UAVScanBeginTime = 0.0;
            C.PlayerReplicationInfo.UAVScanEndTime = 0.0;
        }
        C.SkillBase.ForceResetSkillUpdateCall();
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function CalcRoundResultPoints(int ScoringTeam);
function NotifyBeginRound()
{
    local Actor A;

    Log("[wMSGameInfo::NotifyBeginRound]");
    // End:0x43
    foreach AllActors(class'Actor', A)
    {
        A.OnBeginRound();                
    }
}

function NotifyEndRound()
{
    local Actor A;

    Log("[wMSGameInfo::NotifyEndRound]");
    // End:0x41
    foreach AllActors(class'Actor', A)
    {
        A.OnEndRound();                
    }
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int ScoringTeam;
    local PlayerReplicationInfo PRI;
    local bool bSuccessfulAttack;

    // End:0x1a
    if(!IsPlaying() || ResetCountDown > 0)
    {
        return;
    }
    crlog("[wMSGameInfo::EndRound] - Reason:" @ Reason @ " RoundEndReason=" $ string(RoundEndReason));
    GameReplicationInfo.SyncRemainingTime();
    NotifyEndRound();
    // End:0xf7
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundState = 0;
        wMSGameReplicationInfo(GameReplicationInfo).RoundWinner = 1;
        wMSGameReplicationInfo(GameReplicationInfo).RoundOverTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime + RemainingTime;
    }
    // End:0x2e5
    else
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundState = 1;
        GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
        // End:0x1e5
        if(RoundEndReason == 0 || RoundEndReason == 2)
        {
            // End:0x1a5
            if(PRI != none && PRI.IsA('wMSPlayerReplicationInfo'))
            {
                ++ wMSPlayerReplicationInfo(PRI).DisabledFinalObjective;
                GameEvent("EndRound_Trophy", "", PRI);
            }
            ScoringTeam = CurrentAttackingTeam;
            bSuccessfulAttack = true;
            GameEvent("AS_attackers_win", "" $ string(ScoringTeam), PRI);
        }
        // End:0x273
        else
        {
            // End:0x242
            if(RoundEndReason == 1 || RoundEndReason == 3)
            {
                ScoringTeam = 1 - CurrentAttackingTeam;
                GameEvent("AS_defenders_win", "" $ string(ScoringTeam), PRI);
            }
            // End:0x273
            else
            {
                // End:0x25c
                if(RoundEndReason == 5)
                {
                    ScoringTeam = 0;
                }
                // End:0x273
                else
                {
                    // End:0x273
                    if(RoundEndReason == 6)
                    {
                        ScoringTeam = 1;
                    }
                }
            }
        }
        SetRoundWinner(ScoringTeam);
        // End:0x28a
        if(IsRoundLimitReached())
        {
        }
        // End:0x295
        else
        {
            AnnounceScore(ScoringTeam);
        }
        wMSGameReplicationInfo(GameReplicationInfo).ScoringTeam = ScoringTeam;
        wMSGameReplicationInfo(GameReplicationInfo).fEndRoundTime = float(RemainingTime);
        GameReplicationInfo.bStopCountDown = true;
        CalcRoundResultPoints(ScoringTeam);
    }
    TriggerEvent('EndRound', self, Instigator);
    // End:0x31f
    if(bSuccessfulAttack && EndCinematic != none)
    {
        EndCinematic.Trigger(self, none);
        return;
    }
    ProcessEndGame();
    // End:0x398
    if(IsRoundLimitReached())
    {
        Log("EndRound->EndGame - roundlimit");
        EndGame(none, "roundlimit");
        // End:0x385
        if(bGameEnded)
        {
            SetGameEndType("roundlimit");
            GotoState('MatchOver');
        }
        GameReplicationInfo.RoundState = 3;
        return;
    }
    QueueAnnouncerSound(NewRoundSound, 1, byte(255));
    ResetCountDown = ResetTimeDelay + 1;
    bObjectivePlanted = false;
    nPlantedObjectiveName = 'None';
    wMSGameReplicationInfo(GameReplicationInfo).bObjectivePlanted = false;
}

function bool IsRoundLimitReached()
{
    return Teams[0].Score >= float(ScoreLimit) || Teams[1].Score >= float(ScoreLimit);
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
            if(wMSPlayerReplicationInfo(C.PlayerReplicationInfo) != none)
            {
                wMSPlayerReplicationInfo(C.PlayerReplicationInfo).DisabledObjectivesCount = 0;
                wMSPlayerReplicationInfo(C.PlayerReplicationInfo).DisabledFinalObjective = 0;
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

function SetRoundWinner(int WinningTeam)
{
    // End:0x80
    if(WinningTeam < 2)
    {
        Teams[WinningTeam].Score = Teams[WinningTeam].Score + float(1);
        Teams[WinningTeam].NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(WinningTeam, 1.0, "Round Winner");
    }
}

function AnnounceScore(int ScoringTeam)
{
    local byte byTempTeam;

    // End:0x16
    if(ScoringTeam == 0)
    {
        byTempTeam = 1;
    }
    // End:0x1e
    else
    {
        byTempTeam = 0;
    }
    QueueAnnouncerSound(class'wGameManager'.default.VoicePackageName $ sndRoundWin, 1, byte(ScoringTeam));
    QueueAnnouncerSound(class'wGameManager'.default.VoicePackageName $ sndRoundLose, 1, byTempTeam);
    wMSGameReplicationInfo(GameReplicationInfo).RoundOverTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime + RemainingTime;
}

exec function NewRound()
{
    StartNewRound();
}

function StartNewRound()
{
    Log("## wMSGameInfo::StartNewRound ##");
    ++ CurrentRound;
    BeginRound();
}

function ResetLevel(optional bool hiddenAll)
{
    local Controller C, NextC;
    local Actor A;

    Log("[wMSGameInfo::ResetLevel]");
    bTeamScoreRounds = true;
    // End:0x50
    if(!bDisableReinforcements)
    {
        wMSGameReplicationInfo(GameReplicationInfo).ReinforcementCountDown = 0;
        ReinforcementsCount = ReinforcementsFreq;
    }
    C = Level.ControllerList;
    J0x64:
    // End:0x1a8 [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0x19a
        if(C.PlayerReplicationInfo == none || !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0x108
            if(hiddenAll && C.Pawn != none)
            {
                PlayerController(C).Pawn.bHidden = true;
                PlayerController(C).ClientSetHidden();
            }
            // End:0x12c
            if(PlayerController(C) != none)
            {
                PlayerController(C).ClientReset();
            }
            C.Reset();
            Log("[wMSGameInfo::ResetLevel] " $ C.PlayerReplicationInfo.PlayerName $ " NumLives=0");
            C.PlayerReplicationInfo.NumLives = 0;
        }
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
    // End:0x1f6
    foreach AllActors(class'Actor', A)
    {
        // End:0x1f5
        if(!A.IsA('Controller') && !A.IsA('LevelInfo'))
        {
            A.Reset();
        }                
    }
}

function NewRoundSwitchTeam()
{
    local int iChangeAttack;

    iChangeAttack = int(float(CurrentRound - 1 / ChangeAttackTeamRound) % float(2));
    // End:0x4b
    if(IsPracticeRound() || iChangeAttack != 1)
    {
        CurrentAttackingTeam = FirstAttackingTeam;
        BeginNewPairOfRounds();
    }
    // End:0x60
    else
    {
        CurrentAttackingTeam = byte(1 - FirstAttackingTeam);
    }
}

function AnnounceSwitchTeam();
function InitializeGameInfo(bool bNoReset, bool bChangeTeam)
{
    // End:0xa9
    if(bNoReset)
    {
        ResetCountDown = 0;
        CurrentRound = byte(wMSGameReplicationInfo(GameReplicationInfo).CurrentRound);
        CurrentAttackingTeam = byte(wMSGameReplicationInfo(GameReplicationInfo).CurrentAttackingTeam);
        RoundStartTime = wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime;
        RemainingTime = GameReplicationInfo.RemainingTime;
        bObjectivePlanted = GameReplicationInfo.bObjectivePlanted;
        RoundTimeLimit = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit / 60;
    }
    // End:0x1b0
    else
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundState = 2;
        wMSGameReplicationInfo(GameReplicationInfo).RoundWinner = 0;
        wMSGameReplicationInfo(GameReplicationInfo).bChangeAttackingTeam = bChangeTeam;
        wMSGameReplicationInfo(GameReplicationInfo).CurrentRound = CurrentRound;
        wMSGameReplicationInfo(GameReplicationInfo).CurrentAttackingTeam = CurrentAttackingTeam;
        wMSGameReplicationInfo(GameReplicationInfo).ObjectiveProgress = 0;
        RoundStartTime = RemainingTime;
        wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime = RemainingTime;
        GameReplicationInfo.RemainingTime = RemainingTime;
        GameReplicationInfo.RemainingMinute = RemainingTime;
        GameReplicationInfo.bObjectivePlanted = false;
        SetRoundTimeLimit();
        GameReplicationInfo.bStopCountDown = false;
    }
}

function SetRoundTimeLimit()
{
    // End:0x25
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = PracticeTimeLimit;
    }
    // End:0x42
    else
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = RoundTimeLimit * 60;
    }
}

function bool ProcessSwitchTeam(bool bNoReset)
{
    local byte bupAttackingTeam;

    // End:0x31
    if(!bNoReset)
    {
        bupAttackingTeam = CurrentAttackingTeam;
        NewRoundSwitchTeam();
        // End:0x31
        if(bupAttackingTeam != CurrentAttackingTeam)
        {
            return true;
        }
    }
    return false;
}

function DestoryPawns()
{
    local wPawn P;

    Log("[wMSGameInfo::DestroyPawns]");
    // End:0x74
    foreach DynamicActors(class'wPawn', P)
    {
        // End:0x73
        if(P.IsA('wHelicopter'))
        {
            wHelicopter(P).ClientStopAllHeliSound();
            P.Controller.GotoState('Dying');
        }
        // End:0x73
        else
        {
        }                
    }
}

function BeginRound(optional bool bNoReset)
{
    local Controller C;
    local bool bChangeTeam;
    local array<int> aPlayerIDs;
    local int PlayerID;

    crlog("[wMSGameInfo::BeginRound]");
    // End:0x59
    if(IsPracticeRound() && PracticeTimeLimit == 0 && Level.NetMode != 0)
    {
        ++ CurrentRound;
    }
    // End:0x68
    if(IsPracticeRound())
    {
        PracticeRoundEnded();
    }
    bChangeTeam = ProcessSwitchTeam(bNoReset);
    crlog("=== CurrentRound : " $ string(CurrentRound) $ " / CurrentAttackingTeam : " $ string(CurrentAttackingTeam) $ " / Calc : " $ string(float(CurrentRound - 1 / ChangeAttackTeamRound) % float(2)));
    InitializeGameInfo(bNoReset, bChangeTeam);
    GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x150
    if(!bDisableReinforcements)
    {
        wMSGameReplicationInfo(GameReplicationInfo).ReinforcementCountDown = 0;
        ReinforcementsCount = ReinforcementsFreq;
    }
    NotifyBeginRound();
    // End:0x165
    if(bNoReset == true)
    {
    }
    // End:0x16b
    else
    {
        ResetLevel();
    }
    ForceObjectiveDefenderTeamIndex();
    // End:0x180
    if(bNoReset == true)
    {
    }
    // End:0x192
    else
    {
        DestoryPawns();
        ProcessRespawn();
        BeginWaitingForStart();
    }
    TriggerEvent('StartRound', self, none);
    // End:0x1cb
    if(!IsPracticeRound())
    {
        GameEvent("AS_BeginRound", "" $ string(CurrentRound), none);
    }
    bRoundOverProcessed = false;
    EndGameFocus = none;
    SetGameSpeed(GameSpeed);
    C = Level.ControllerList;
    J0x1f9:
    // End:0x2f7 [While If]
    if(C != none)
    {
        // End:0x21b
        if(C.PlayerReplicationInfo == none)
        {
        }
        // End:0x2e0
        else
        {
            // End:0x239
            if(C.PlayerReplicationInfo.IsSendRoundStartTime)
            {
            }
            // End:0x2e0
            else
            {
                PlayerID = C.PlayerReplicationInfo.GetUID();
                // End:0x292
                if(PlayerID != -1)
                {
                    aPlayerIDs[aPlayerIDs.Length] = PlayerID;
                    C.PlayerReplicationInfo.IsSendRoundStartTime = true;
                }
                Log("[BeginRound] aplayerIDs:" $ string(PlayerID) $ "/PlayerName:" $ C.PlayerReplicationInfo.PlayerName);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x1f9;
    }
    Log("[BeginRound::sfReqGamePlay_SetRoundStartTime]");
    // End:0x347
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_SetRoundStartTime(aPlayerIDs);
    }
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

function bool IsPlayingIntro()
{
    return false;
}

function bool IsPracticeRound()
{
    return wMSGameReplicationInfo(GameReplicationInfo).IsPracticeRound();
}

function bool IsPlaying()
{
    return false;
}

function bool NeedToRespawnSD()
{
    return true;
}

function bool CanDisableObjective(GameObjective Go)
{
    local wMSGameReplicationInfo ASGRI;

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
    ASGRI = wMSGameReplicationInfo(GameReplicationInfo);
    // End:0x58
    if(Go.ObjectivePriority <= ASGRI.ObjectiveProgress)
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
                        if(C.Pawn != none && wMSPlayerReplicationInfo(C.PlayerReplicationInfo) != none)
                        {
                            wMSPlayerReplicationInfo(C.PlayerReplicationInfo).bTeleportToSpawnArea = true;
                            // End:0x191
                            if(AIController(C) != none)
                            {
                                wMSPlayerReplicationInfo(C.PlayerReplicationInfo).TeleportTime = int(Level.TimeSeconds);
                            }
                            // End:0x1dd
                            else
                            {
                                wMSPlayerReplicationInfo(C.PlayerReplicationInfo).TeleportTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime + RemainingTime;
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
    local wMSGameReplicationInfo ASGRI;
    local wMSPlayerReplicationInfo ASPRI;

    // End:0x28
    if(PC == none || wMSPlayerReplicationInfo(PC.PlayerReplicationInfo) == none)
    {
        return;
    }
    ASPRI = wMSPlayerReplicationInfo(PC.PlayerReplicationInfo);
    // End:0x58
    if(ASPRI.bTeleportToSpawnArea == false)
    {
        return;
    }
    ASGRI = wMSGameReplicationInfo(GameReplicationInfo);
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
    wMSPlayerReplicationInfo(C.PlayerReplicationInfo).bTeleportToSpawnArea = false;
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
    if(Killed != none && wMSPlayerReplicationInfo(Killed.PlayerReplicationInfo) != none)
    {
        wMSPlayerReplicationInfo(Killed.PlayerReplicationInfo).bTeleportToSpawnArea = false;
    }
    super(DeathMatch).Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    CheckLastMan(Killed.PlayerReplicationInfo.Team.TeamIndex);
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
        if(wMSPlayerReplicationInfo(Killer.PlayerReplicationInfo) != none)
        {
            GameEvent("VehicleDestroyed_Trophy", DestroyedVehicle.VehicleNameString, Killer.PlayerReplicationInfo);
            ++ wMSPlayerReplicationInfo(Killer.PlayerReplicationInfo).DestroyedVehicles;
            // End:0x138
            if(PlayerController(Killer) != none && wMSPlayerReplicationInfo(Killer.PlayerReplicationInfo).DestroyedVehicles > 2)
            {
                PlayerController(Killer).ReceiveLocalizedMessage(class'wMessage_MSKillMessages', 1);
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
        if(!Go.IsActive() || !Go.IsCritical() || wMSGameReplicationInfo(GameReplicationInfo).ObjectiveProgress < Go.ObjectivePriority)
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

function ForceRestartPlayer(Controller aPlayer)
{
    local string PawnOverrideClass;

    // End:0x7e
    if(aPlayer != none && aPlayer.PlayerReplicationInfo != none)
    {
        PawnOverrideClass = wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass;
        // End:0x7e
        if(PawnOverrideClass != "")
        {
            SpawnAndPossessPawn(aPlayer, PawnOverrideClass);
            wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass = "";
        }
    }
    // End:0x9e
    if(PlayerController(aPlayer) != none)
    {
        BroadCast_AssaultRole_Message(PlayerController(aPlayer));
    }
    RestartPlayer(aPlayer);
}

function RestartPlayer(Controller aPlayer)
{
    local string PawnOverrideClass;
    local wMSGameReplicationInfo MSGRI;
    local array<int> aPlayerIDs;
    local int iPlayerID, iCurrentRound;

    MSGRI = wMSGameReplicationInfo(GameReplicationInfo);
    Log("[wMSGameInfo::RestartPlayer] name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    // End:0x24c
    if(!AllowBecomeActivePlayer(PlayerController(aPlayer)))
    {
        Log("[wMSGameInfo::RestartPlayer] not AllowBecomeActivePlayer");
        Log("    MaxLives=" $ string(MaxLives) $ " aPlayer.PlayerReplicationInfo.NumLives=" $ string(aPlayer.PlayerReplicationInfo.NumLives));
        Log("    state=" $ string(aPlayer.GetStateName()) $ " GameReplicationInfo.bMatchHasBegun=" $ string(GameReplicationInfo.bMatchHasBegun) $ " bMustJoinBeforeStart=" $ string(bMustJoinBeforeStart));
        Log("    RoundTimeLimit=" $ string(RoundTimeLimit));
        Log("    RoundState=" $ string(GetEnum(enum'EROUND_STATE', GameReplicationInfo.RoundState)));
        Log("    elapsed=" $ string(MSGRI.RoundStartTime - MSGRI.RemainingTime) $ " RoundStartTime=" $ string(MSGRI.RoundStartTime) $ " RemainTime=" $ string(MSGRI.RemainingTime));
        return;
    }
    // End:0x2fc
    if(aPlayer != none && aPlayer.PlayerReplicationInfo != none)
    {
        PawnOverrideClass = wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass;
        // End:0x2fc
        if(PawnOverrideClass != "")
        {
            Log("[wMSGameInfo::RestartPlayer] PawnOverrideClass");
            SpawnAndPossessPawn(aPlayer, PawnOverrideClass);
            wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass = "";
        }
    }
    // End:0x31c
    if(PlayerController(aPlayer) != none)
    {
        BroadCast_AssaultRole_Message(PlayerController(aPlayer));
    }
    iCurrentRound = CurrentRound;
    super(TeamGame).RestartPlayer(aPlayer);
    iPlayerID = aPlayer.PlayerReplicationInfo.GetUID();
    aPlayerIDs[0] = iPlayerID;
    // End:0x54a
    if(1 == aPlayer.PlayerReplicationInfo.NumLives && !IsA('wDOMGameInfo'))
    {
        // End:0x46a
        if(!aPlayer.PlayerReplicationInfo.IsSendGameStartTime && aPlayer.PlayerReplicationInfo.bBot == false)
        {
            Log(string(self) $ "[RestartPlayer>sfReqGamePlay_SetGameStartTime] PlayerName:" $ aPlayer.PlayerReplicationInfo.PlayerName $ "/iPlayerID:" $ string(iPlayerID));
            BTSend.sfReqGamePlay_SetGameStartTime(aPlayerIDs);
            aPlayer.PlayerReplicationInfo.IsSendGameStartTime = true;
        }
        // End:0x54a
        if(!aPlayer.PlayerReplicationInfo.IsSendRoundStartTime && aPlayer.PlayerReplicationInfo.bBot == false)
        {
            Log(string(self) $ "[RestartPlayer>sfReqGamePlay_SetRoundStartTime] PlayerName:" $ aPlayer.PlayerReplicationInfo.PlayerName $ "/iPlayerID:" $ string(iPlayerID));
            BTSend.sfReqGamePlay_SetRoundStartTime(aPlayerIDs);
            aPlayer.PlayerReplicationInfo.IsSendRoundStartTime = true;
        }
    }
}

function RespawnPlayer(Controller C, optional bool bClearSpecials)
{
    local string PawnOverrideClass;
    local Vehicle DrivenVehicle;

    // End:0x17
    if(!AllowBecomeActivePlayer(PlayerController(C)))
    {
        return;
    }
    // End:0x5f
    if(C.Pawn != none)
    {
        DrivenVehicle = Vehicle(C.Pawn);
        // End:0x5f
        if(DrivenVehicle != none)
        {
            DrivenVehicle.KDriverLeave(true);
        }
    }
    C.StartSpot = FindPlayerStart(C, byte(C.PlayerReplicationInfo.Team.TeamIndex));
    PawnOverrideClass = wMSPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass;
    // End:0xf8
    if(PawnOverrideClass != "")
    {
        SpawnAndPossessPawn(C, PawnOverrideClass);
        wMSPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass = "";
    }
    // End:0x152
    if(C.StartSpot != none)
    {
        C.SetLocation(C.StartSpot.Location);
        C.SetRotation(C.StartSpot.Rotation);
    }
    // End:0x273
    if(C.Pawn != none)
    {
        // End:0x183
        if(C.Pawn.Weapon == none)
        {
        }
        SetPlayerDefaults(C.Pawn);
        C.Pawn.SetLocation(C.StartSpot.Location);
        C.Pawn.SetRotation(C.StartSpot.Rotation);
        C.Pawn.Velocity = vect(0.0, 0.0, 0.0);
        C.Pawn.PlayTeleportEffect(false, true);
        // End:0x273
        if(Bot(C) != none && PawnOverrideClass == "")
        {
            Bot(C).Squad.Retask(Bot(C));
        }
    }
    // End:0x2c4
    if(C.StartSpot != none)
    {
        C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
    }
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    // End:0x5f
    if(wMSPlayerReplicationInfo(PlayerPawn.Controller.PlayerReplicationInfo).PawnOverrideClass == "")
    {
        // End:0x5f
        if(UnrealPawn(PlayerPawn) != none)
        {
            UnrealPawn(PlayerPawn).AddDefaultInventory();
            PlayerPawn.AddDefaultSkills();
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
    // End:0x77
    if(PawnClass == none)
    {
        Log("wMSGameInfo::SpawnAndPossessPawn - PawnClass == None. PawnClassName:" @ PawnClassName);
        return false;
    }
    // End:0xd7
    if(C.Pawn == none)
    {
        Log("wMSGameInfo::SpawnAndPossessPawn - Pawn == None. PawnClassName:" @ PawnClassName);
        return false;
    }
    P = Spawn(PawnClass, C,, C.Pawn.LastStartSpot.Location, C.Pawn.LastStartSpot.Rotation);
    // End:0x1e4
    if(P == none)
    {
        P = Spawn(PawnClass, C,, C.Location, C.Rotation);
        // End:0x1e4
        if(P == none)
        {
            P = Spawn(PawnClass, C);
            // End:0x1e4
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
}

function int GetPlayerStartTeam(NavigationPoint N, int Team)
{
    // End:0x29
    if(PlayerStart(N) != none)
    {
        return PlayerStart(N).TeamNumber;
    }
    // End:0x2f
    else
    {
        return Team;
    }
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;
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
    Team = byte(float(byte(Team + CurrentAttackingTeam)) % float(2));
    return FindPlayerStart_SD(Team);
}

function SetRemainingTime(int remain)
{
    RemainingTime = RoundStartTime - wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit + remain;
    // End:0x7d
    if(GameReplicationInfo != none)
    {
        GameReplicationInfo.RemainingTime = RemainingTime;
        GameReplicationInfo.PostRemaiingTime = RemainingTime;
        GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(2);
    }
}

function int GetRemainingTime()
{
    return GameReplicationInfo.RemainingTime - RoundStartTime + wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit;
}

function SetObjectiveSetted(Pawn TP, name ObjectTag, Vector FlagLocation)
{
    bObjectivePlanted = true;
    nPlantedObjectiveName = ObjectTag;
    RemainingTimeWhenObjectIsSet = GetRemainingTime();
    SetRemainingTime(DefuseTimeLimit);
    wMSGameReplicationInfo(GameReplicationInfo).bObjectivePlanted = true;
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

function QueueAnnouncerSound(string ASound, byte AnnouncementLevel, byte Team, optional Core.Object.EAPriority Priority, optional byte Switch)
{
    local Controller C;

    Log("[wMSGameInfo::QueueAnnouncerSound]" $ " ASound=" $ ASound $ " AnnouncementLevel=" $ string(AnnouncementLevel) $ " Team=" $ string(Team));
    // End:0x125
    if(!IsPlayingIntro() && Len(ASound) != 0)
    {
        C = Level.ControllerList;
        J0x9a:
        // End:0x125 [While If]
        if(C != none)
        {
            // End:0x10e
            if(C.IsA('PlayerController') && Team == 255 || C.GetTeamNum() == Team)
            {
                PlayerController(C).QueueAnnouncement(ASound, AnnouncementLevel, Priority, Switch);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x9a;
        }
    }
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super(TeamGame).PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject(class'wMessage_Game'.default.SoundOurTeamPlantedBomb, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundEnemyPlantedBomb, class'Sound');
    class'wWeaponRes_DemoPack'.static.PrecacheSound();
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
    super(TeamGame).FillPlayInfo(PlayInfo);
}

static event string GetDescriptionText(string PropName)
{
    return super(TeamGame).GetDescriptionText(PropName);
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

simulated function bool IsRespawnRestrictionTime()
{
    local int elapsed;

    elapsed = RoundStartTime - RemainingTime;
    // End:0x48
    if(bHasRespawnRestriction)
    {
        // End:0x38
        if(CurrentRound <= 1)
        {
            return elapsed > RespawnRestrictionTimeRound1;
        }
        // End:0x45
        else
        {
            return elapsed > RespawnRestrictionTime;
        }
    }
    // End:0x4a
    else
    {
        return false;
    }
}

function bool IsRightTimeForRespawn(Controller C)
{
    local int elapsed;
    local wMSGameReplicationInfo MSGRI;

    // End:0x12
    if(!super(GameInfo).IsRightTimeForRespawn(C))
    {
        return false;
    }
    MSGRI = wMSGameReplicationInfo(GameReplicationInfo);
    // End:0x1b1
    if(bHasRespawnRestriction)
    {
        // End:0x38
        if(RoundTimeLimit <= 0)
        {
            return false;
        }
        // End:0x53
        if(GameReplicationInfo.RoundState == 1)
        {
            return false;
        }
        elapsed = RoundStartTime - RemainingTime;
        // End:0x9a
        if(IsRespawnRestrictionTime())
        {
            C.PlayerReplicationInfo.bOutOfLives = true;
            C.GotoState('Spectating');
            return false;
        }
        Log("[wMSGameInfo::IsRightTimeForRespawn] " $ C.PlayerReplicationInfo.PlayerName);
        Log("  RoundTimeLimit=" $ string(RoundTimeLimit));
        Log("  RoundState=" $ string(GetEnum(enum'EROUND_STATE', GameReplicationInfo.RoundState)));
        Log("  elapsed=" $ string(elapsed) $ " RoundStartTime=" $ string(MSGRI.RoundStartTime) $ " RemainTime=" $ string(MSGRI.RemainingTime));
        Log("[wMSGameInfo::IsRightTimeForRespawn]");
    }
    return true;
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
    // End:0x0d
    if(P == none)
    {
        return true;
    }
    // End:0x3d
    if(MaxLives != 0 && P.PlayerReplicationInfo.NumLives >= MaxLives)
    {
        return false;
    }
    // End:0x62
    if(super(DeathMatch).AllowBecomeActivePlayer(P))
    {
        // End:0x5d
        if(!IsRightTimeForRespawn(P))
        {
            return false;
        }
        return true;
    }
    // End:0x64
    else
    {
        return false;
    }
}

function FindLiving(out PlayerReplicationInfo Living, out byte bOtherTeamNoneLeft)
{
    local Controller C;

    bOtherTeamNoneLeft = 1;
    C = Level.ControllerList;
    J0x1c:
    // End:0x118 [While If]
    if(C != none)
    {
        // End:0x101
        if(C.PlayerReplicationInfo != none && C.bIsPlayer && IsPawnAlive(C) && !C.PlayerReplicationInfo.bAdminSpecator)
        {
            // End:0xa0
            if(Living == none)
            {
                Living = C.PlayerReplicationInfo;
            }
            // End:0x101
            else
            {
                // End:0x101
                if(C.PlayerReplicationInfo != Living && C.PlayerReplicationInfo.Team.TeamIndex != Living.Team.TeamIndex)
                {
                    bOtherTeamNoneLeft = 0;
                }
                // End:0x118
                else
                {
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x1c;
        }
    }
}

exec function lll()
{
    local Controller C;

    Log("[lll]");
    dblog("  CurrentAttackingTeam:" $ string(CurrentAttackingTeam) $ "  State:" $ string(GetStateName()));
    C = Level.ControllerList;
    J0x58:
    // End:0x245 [While If]
    if(C != none)
    {
        // End:0x22e
        if(C != none && C.PlayerReplicationInfo != none)
        {
            dblog(" PLAYER: " $ C.PlayerReplicationInfo.PlayerName);
            dblog("    bIsDead=" $ string(C.PlayerReplicationInfo.IsDead) $ " TeamIndex=" $ string(C.PlayerReplicationInfo.Team.TeamIndex) $ " NumLives=" $ string(C.PlayerReplicationInfo.NumLives));
            dblog("    bIsPlayer=" $ string(C.bIsPlayer) $ " bOutOfLives=" $ string(C.PlayerReplicationInfo.bOutOfLives) $ " bOnlySpectator=" $ string(C.PlayerReplicationInfo.bOnlySpectator) $ " state=" $ string(C.GetStateName()));
            dblog("    isPawnAlive=" $ string(IsPawnAlive(C)) $ " bPrecached=" $ string(C.PlayerReplicationInfo.bPrecached));
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x58;
    }
    dblog("[LeaveLogOtherTeamNoneLeft::END]");
}

function LeaveLogOtherTeamNoneLeft(PlayerReplicationInfo Living)
{
    local Controller C;

    Log("[LeaveLogOtherTeamNoneLeft::BEGIN]");
    // End:0x4e
    if(Living != none)
    {
        Log("  living:" $ Living.PlayerName);
    }
    Log("  CurrentAttackingTeam:" $ string(CurrentAttackingTeam) $ "  State:" $ string(GetStateName()));
    C = Level.ControllerList;
    J0x99:
    // End:0x225 [While If]
    if(C != none)
    {
        // End:0x20e
        if(C != none && C.PlayerReplicationInfo != none)
        {
            Log("  PLAYER: " $ C.PlayerReplicationInfo.PlayerName);
            Log("    bIsDead=" $ string(C.PlayerReplicationInfo.IsDead) $ " TeamIndex=" $ string(C.PlayerReplicationInfo.Team.TeamIndex) $ " NumLives=" $ string(C.PlayerReplicationInfo.NumLives) $ " bIsPlayer=" $ string(C.bIsPlayer) $ " bOutOfLives=" $ string(C.PlayerReplicationInfo.bOutOfLives) $ " bOnlySpectator=" $ string(C.PlayerReplicationInfo.bOnlySpectator) $ " state=" $ string(C.GetStateName()));
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x99;
    }
    Log("[LeaveLogOtherTeamNoneLeft::END]");
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living);
function bool CheckMaxLives(PlayerReplicationInfo Scorer)
{
    local PlayerReplicationInfo Living;
    local byte bOtherTeamNoneLeft;

    // End:0x75
    if(MaxLives > 0 && wMSGameReplicationInfo(GameReplicationInfo).RoundState != 1)
    {
        FindLiving(Living, bOtherTeamNoneLeft);
        // End:0x75
        if(bOtherTeamNoneLeft == 1)
        {
            LeaveLogOtherTeamNoneLeft(Living);
            // End:0x69
            if(Living == none)
            {
                Living = Scorer;
            }
            return EndGameByTeamNoneLeft(Living);
        }
    }
    return false;
}

function CheckLastMan(int TeamIndex)
{
    local Controller C, survivorC;
    local int survivorCount;

    Log("[wMSGameInfo::CheckLastMan]" $ " TeamIndex=" $ string(TeamIndex));
    survivorCount = 0;
    C = Level.ControllerList;
    J0x52:
    // End:0x16f [While If]
    if(C != none)
    {
        // End:0x158
        if(C.PlayerReplicationInfo != none && C.bIsPlayer && !C.PlayerReplicationInfo.bOutOfLives && !C.PlayerReplicationInfo.bOnlySpectator && !C.PlayerReplicationInfo.IsDead && C.PlayerReplicationInfo.Team.TeamIndex == TeamIndex)
        {
            Log("  Survivor: " $ C.PlayerReplicationInfo.PlayerName);
            ++ survivorCount;
            survivorC = C;
            // End:0x158
            if(survivorCount == 2)
            {
            }
            // End:0x16f
            else
            {
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x52;
        }
    }
    // End:0x1a5
    if(survivorCount == 1)
    {
        PlayerController(survivorC).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ sndLastMan, 1);
    }
}

function CheckScore(PlayerReplicationInfo Scorer)
{
    // End:0x10
    if(CheckMaxLives(Scorer))
    {
        return;
    }
    // End:0x36
    if(GameRulesModifiers != none && GameRulesModifiers.CheckScore(Scorer))
    {
        return;
    }
    // End:0x50
    if(!bOverTime && GoalScore == 0)
    {
        return;
    }
    // End:0x7c
    if(Scorer != none && bOverTime)
    {
        EndGame(Scorer, "timelimit");
    }
}

function int GetBootySeedValue()
{
    return int(Teams[0].Score + Teams[1].Score);
}

function int GetTotalPlayedTime()
{
    return CurrentRound;
}

function bool DoProcessKillMessage(class<DamageType> DamageType)
{
    return super(GameInfo).DoProcessKillMessage(DamageType) && DamageType != class'wWeaponRes_DemoPack';
}

function AddGameSpecificActions(out array<wAction> Actions);

state MatchInProgress
{
    function BeginState();
    function EndState();
    function Timer()
    {
        super.Timer();
        // End:0x2c
        if(TimeLimit < 1)
        {
            // End:0x2c
            if(!GameReplicationInfo.bStopCountDown)
            {
                -- RemainingTime;
            }
        }
        GameReplicationInfo.RemainingTime = RemainingTime;
        // End:0x69
        if(float(RemainingTime) % float(60) == float(0))
        {
            GameReplicationInfo.RemainingMinute = RemainingTime;
        }
        // End:0x7d
        if(ResetCountDown > 0)
        {
            ProcessResetCountDown();
        }
        // End:0x83
        else
        {
            ProcessEndRound();
        }
        // End:0xd7
        if(Level.GetMatchMaker() != none && Level.GetMatchMaker().IsDisconnectedUser())
        {
            CheckLives(none);
            Level.GetMatchMaker().SetDisconnectedUser(false);
        }
    }

    function ProcessEndRound()
    {
        // End:0xb9
        if(wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit > 0 && RoundStartTime - RemainingTime >= wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit)
        {
            // End:0x67
            if(IsPracticeRound())
            {
                EndRound(1, none, "practicetimelimit");
            }
            // End:0xb9
            else
            {
                // End:0x95
                if(bObjectivePlanted == false)
                {
                    // End:0x8c
                    if(!bRoundOverProcessed)
                    {
                        bRoundOverProcessed = true;
                        OnRoundTimeOverWithoutObjectPlanted();
                    }
                    CheckEndGameAfterRoundTimeOver();
                }
                // End:0xb9
                else
                {
                    ExplodeBomb();
                    EndRound(0, none, "Distroy Success !!!");
                }
            }
        }
    }

    function ProcessResetCountDown()
    {
        local GameObjective Go;

        clog("[SS] ResetCountDown=" $ string(ResetCountDown));
        -- ResetCountDown;
        // End:0xf9
        if(ResetCountDown > 0 && ResetCountDown < 10)
        {
            // End:0xf6
            if(ResetCountDown == 3)
            {
                wMSGameReplicationInfo(GameReplicationInfo).ObjectiveProgress = 0;
                GameReplicationInfo.NetUpdateTime = Level.TimeSeconds;
                Go = Teams[0].AI.Objectives;
                J0xa3:
                // End:0xf6 [While If]
                if(Go != none)
                {
                    Go.Reset();
                    Go.NetUpdateTime = Level.TimeSeconds - float(1);
                    Go = Go.NextObjective;
                    // This is an implied JumpToken; Continue!
                    goto J0xa3;
                }
            }
        }
        // End:0x10a
        else
        {
            // End:0x10a
            if(ResetCountDown == 0)
            {
                StartNewRound();
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
        // End:0x12
        if(!AllowBecomeActivePlayer(aPlayer))
        {
            return false;
        }
        // End:0x76
        if(GameReplicationInfo.bMatchHasBegun && ResetCountDown == 0 && !bDisableReinforcements)
        {
            // End:0x71
            if(ReinforcementsCount < ReinforcementsFreq)
            {
                wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).bAutoRespawn = true;
                return false;
            }
            // End:0x73
            else
            {
                return true;
            }
        }
        // End:0x78
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
        return wMSGameReplicationInfo(GameReplicationInfo).RoundWinner == 0 && ResetCountDown == 0;
    }

}

state MatchOver
{
    function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason);
    function BeginState()
    {
        local PlayerReplicationInfo PRI;

        // End:0x67
        foreach DynamicActors(class'PlayerReplicationInfo', PRI)
        {
            // End:0x3d
            if(PRI.RoundWhenIntervented == 0)
            {
                PRI.RoundPlayed = CurrentRound;
            }
            // End:0x66
            else
            {
                PRI.RoundPlayed = CurrentRound - PRI.RoundWhenIntervented + 1;
            }                        
        }
        super.BeginState();
    }

}

state SPIntroCinematic
{
    function BeginState()
    {
        Log("wMSGameInfo::SPIntroCinematic state::BeginState()");
        Level.GetLocalPlayerController().bHideVehicleNoEntryIndicator = true;
        CurrentRound = 0;
        TriggerEvent('StartRound', self, none);
    }

    event SceneStarted(SceneManager SM, Actor Other)
    {
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
    // End:0x54
    if(bQuickStart)
    {
        Log("wMSGameInfo::PendingMatch state bQuickStart == ture. StartMatch()");
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

        Log("wMSGameInfo::MPOutroCinematic state::BeginState()");
        C = Level.ControllerList;
        J0x49:
        // End:0xe2 [While If]
        if(C != none)
        {
            NextC = C.nextController;
            // End:0xd4
            if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                PC = PlayerController(C);
                // End:0xc5
                if(PC != none)
                {
                    PC.ClientRoundEnded();
                }
                C.RoundHasEnded();
            }
            C = NextC;
            // This is an implied JumpToken; Continue!
            goto J0x49;
        }
    }

    function bool PlayerCanRestartGame(PlayerController aPlayer)
    {
        return false;
    }

    function EndState()
    {
        // End:0x89
        if(Teams[0].Score >= float(ScoreLimit) || Teams[1].Score >= float(ScoreLimit))
        {
            Log("MPOutroCinematic::EndGame - roundlimit");
            EndGame(none, "roundlimit");
            // End:0x87
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
    RoundLimit=10
    RoundTimeLimit=3
    DefuseTimeLimit=45
    ReinforcementsFreq=3
    ReinforcementsValidTime=3
    ScoreLimit=4
    ChangeAttackTeamRound=3
    RespawnRestrictionTimeRound1=60
    bCheckPrecacheInProcessRespawn=true
    NewRoundSound="New_assault_in"
    AttackerWinRound[0]=Red_team_attacked
    AttackerWinRound[1]=Blue_team_attacked
    DefenderWinRound[0]=Red_team_defended
    DefenderWinRound[1]=Blue_team_defended
    DrawGameSound=Draw_Game
    sndChangeAttackTeam="v_sd_change_R"
    sndLastMan=".Mode_SD.v_sd_lastman_R"
    sndRoundWin=".v_sd_round_encourage_win_team_R"
    sndRoundLose=".Mode_SD.v_sd_round_encourage_lose_team_R"
    BombPlantedMessage="The bomb has been planted."
    bScoreTeamKills=true
    bSpawnInTeamArea=true
    TeammateBoost=0.250
    bSkipPlaySound=true
    SpawnProtectionTime=3.0
    DefaultMaxLives=1
    DefaultEnemyRosterClass="WGame.wTeamRoster"
    ADR_Kill=2.0
    bTeamScoreRounds=true
    bManuallyBeginWaitingForStart=true
    DefaultPlayerClassName="wGame.wPawn"
    HUDSettingsMenu="GUI2K4.CustomHUDMenuAssault"
    HUDType="wMission.wHUD_Mission"
    MapListType=""
    MapPrefix="MS"
    BeaconName="MS"
    ResetTimeDelay=8
    GoalScore=0
    MutatorClass="wMission.wMSMutator"
    GameReplicationInfoClass=class'wMSGameReplicationInfo'
    GameName="Mission"
    Description="In each round, one team takes the role of the attacker, while the other team defends, in recreations of famous (or infamous) scenarios. After a pair of rounds, the most successful attacking team scores a point."
    ScreenShotName="UT2004Thumbnails.AssaultShots"
    DecoTextName="WGame.TeamGame"
    Acronym="MS"
    GameDecPoint=2.0
    bHasRespawnRestriction=true
    RespawnRestrictionTime=30
}