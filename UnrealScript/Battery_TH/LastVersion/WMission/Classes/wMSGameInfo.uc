class wMSGameInfo extends wTeamGame
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum ERER_Reason
{
    ERER_AttackersWin,              // 0
    ERER_AttackersLose,             // 1
    ERER_AttackersWin_DefendersDied,// 2
    ERER_AttackersLose_AttackersDied,// 3
    ERER_DrawGame,                  // 4
    ERER_Team0,                     // 5
    ERER_Team1,                     // 6
    ERER_AlienMode_AlienWin,        // 7
    ERER_AlienMode_HumanWin         // 8
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
var string sndBeginRound;
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
var bool bSentEndRound;

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

function ForceObjectiveDefenderTeamIndex()
{
    local GameObjective Go;

    Go = Teams[0].AI.Objectives;
    J0x1F:

    // End:0x81 [Loop If]
    if(Go != none)
    {
        Go.DefenderTeamIndex = byte(int(1) - int(CurrentAttackingTeam));
        Go.NetUpdateTime = Level.TimeSeconds - float(1);
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

function PostBeginPlay()
{
    super(TeamGame).PostBeginPlay();
    ForceObjectiveDefenderTeamIndex();
    bObjectivePlanted = false;
    nPlantedObjectiveName = 'None';
    // End:0x38
    foreach AllActors(Class'WMission_Decompressed.wMSCinematic_SceneManager', EndCinematic, 'OutroScene')
    {
        // End:0x38
        break;        
    }    
    //return;    
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController PC;
    local bool bSpectator;

    PC = super(DeathMatch).Login(Portal, Options, Error);
    // End:0xE7
    if(PC != none)
    {
        Log("[PlayerController::Login]" $ PC.PlayerReplicationInfo.PlayerName);
        // End:0xE7
        if(int(Level.NetMode) == int(NM_Standalone))
        {
            bSpectator = (ParseOption(Options, "SpectatorOnly")) ~= "1";
            CurrentRound = 1;
            // End:0xE7
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
    self.InitGameOption(Options, Error);
    //return;    
}

function InitGameOption(string Options, out string Error)
{
    ScoreLimit = kMM.iGoalRound;
    RoundTimeLimit = Max(0, GetIntOption(Options, "RoundTimeLimit", kMM.iTimeLimit));
    PracticeTimeLimit = Max(0, GetIntOption(Options, "PracticeTimeLimit", PracticeTimeLimit));
    RoundLimit = ScoreLimit * 2;
    MaxRounds = RoundLimit * 2;
    FirstAttackingTeam = byte(Max(-1, GetIntOption(Options, "FirstAttackingTeam", int(FirstAttackingTeam))));
    ResetTimeDelay = Max(0, GetIntOption(Options, "ResetTimeDelay", ResetTimeDelay));
    ReinforcementsFreq = Max(0, GetIntOption(Options, "ReinforcementsFreq", ReinforcementsFreq));
    TimeLimit = 0;
    RemainingTime = ((((RoundTimeLimit + ResetTimeDelay) + 1) * 60) * (MaxRounds + 2)) + PracticeTimeLimit;
    // End:0x16C
    if(GameReplicationInfo != none)
    {
        GameReplicationInfo.RemainingTime = RemainingTime;
    }
    //return;    
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
            // End:0x6F
            foreach DynamicActors(Class'WMission_Decompressed.wGameObject_Bomb', Bomb)
            {
                Bomb.bHidden = true;
                Bomb.bDisabled = true;                
            }            
        }        
    }
    else
    {
        // End:0x179
        foreach DynamicActors(Class'WMission_Decompressed.wGameObject_Bomb', Bomb)
        {
            // End:0x178
            if(Bomb.bHeld)
            {
                // End:0x177
                foreach DynamicActors(Class'Engine.Pawn', P)
                {
                    // End:0x176
                    if(Bomb.strPlayerName == P.OwnerName)
                    {
                        // End:0x159
                        if(P.Controller == none)
                        {
                            // End:0x12D
                            if(P.PlayerReplicationInfo != none)
                            {
                                P.PlayerReplicationInfo.HasFlag = Bomb;
                                Bomb.HolderPRI = TeamPlayerReplicationInfo(P.PlayerReplicationInfo);
                            }
                            Bomb.Holder = UnrealPawn(P);
                            Bomb.GotoState('Held');
                            // End:0x176
                            continue;
                        }
                        Bomb.SetHolder(P.Controller);
                    }                    
                }                
            }            
        }        
    }
    //return;    
}

function StartMatch()
{
    super.StartMatch();
    Log("wMsGameInfo::StartMatch() bChangedHost=" $ string(bChangedHost));
    // End:0xA0
    if((int(CurrentRound) == 0) && int(Level.NetMode) == int(NM_Standalone))
    {
        Log("wMsGameInfo::StartMatch() called StartNewRound()");
        StartNewRound();        
    }
    else
    {
        Log("wMsGameInfo::StartMatch() called BeginRoundRound()");
        BeginRound(bChangedHost);
        // End:0x125
        if(bChangedHost == true)
        {
            switch(GameReplicationInfo.RoundState)
            {
                // End:0x10C
                case 1:
                    StartNewRound();
                    // End:0x125
                    break;
                // End:0x11A
                case 2:
                    StartMatchChangedHost();
                    // End:0x125
                    break;
                // End:0x122
                case 3:
                    // End:0x125
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
        }
        //return;        
    }
}

function InitGameReplicationInfo()
{
    super(DeathMatch).InitGameReplicationInfo();
    wMSGameReplicationInfo(GameReplicationInfo).MaxRounds = RoundLimit * 2;
    wMSGameReplicationInfo(GameReplicationInfo).ScoreLimit = ScoreLimit;
    wMSGameReplicationInfo(GameReplicationInfo).bMultiBomb = bMultiBomb;
    wMSGameReplicationInfo(GameReplicationInfo).DefuseTimeLimit = DefuseTimeLimit;
    //return;    
}

function Logout(Controller Exiting)
{
    // End:0x3A
    if(Exiting.PlayerReplicationInfo.HasFlag != none)
    {
        GameObjectDropped(Exiting.PlayerReplicationInfo.HasFlag);
    }
    // End:0x4C
    if(MaxLives > 0)
    {
        CheckMaxLives(none);
    }
    super(DeathMatch).Logout(Exiting);
    //return;    
}

function OnKillingDropOut(Pawn P)
{
    //return;    
}

function DiscardInventory(Pawn Other)
{
    local wGameObject_Bomb Bomb;
    local name stateName;

    // End:0x0D
    if(Other == none)
    {
        return;
    }
    // End:0x60
    if((Other.PlayerReplicationInfo != none) && Other.PlayerReplicationInfo.HasFlag != none)
    {
        GameObjectDropped(Other.PlayerReplicationInfo.HasFlag);        
    }
    else
    {
        // End:0xB9
        if(bChangedHost)
        {
            // End:0xB8
            foreach DynamicActors(Class'WMission_Decompressed.wGameObject_Bomb', Bomb)
            {
                // End:0xB7
                if(Bomb.strPlayerName == Other.OwnerName)
                {
                    stateName = Bomb.GetStateName();
                    GameObjectDropped(Bomb);
                }                
            }            
        }
    }
    super(GameInfo).DiscardInventory(Other);
    //return;    
}

function GameObjectDropped(Decoration D)
{
    // End:0x2B
    if(D.IsA('wGameObject_Bomb'))
    {
        wGameObject_Bomb(D).HolderDied();        
    }
    else
    {
        D.Drop(vect(0.0000000, 0.0000000, 0.0000000));
    }
    //return;    
}

function BroadCast_AssaultRole_Message(PlayerController C)
{
    //return;    
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    EndRound(1, none, "Round Time Over");
    //return;    
}

exec function fEndRound(byte Team)
{
    // End:0x30
    if(int(Team) == int(CurrentAttackingTeam))
    {
        EndRound(0, none, "Force End Round");        
    }
    else
    {
        EndRound(1, none, "Force End Round");
    }
    //return;    
}

function CheckEndGameAfterRoundTimeOver()
{
    //return;    
}

function int GetTimeSecondsLeft()
{
    return GameReplicationInfo.GetRemainingTime();
    //return;    
}

function ProcessEndRound()
{
    //return;    
}

function ExplodeBomb()
{
    local wGameObject_Bomb Bomb;
    local Actor A;

    // End:0x68
    if(GameReplicationInfo.bObjectivePlanted)
    {
        // End:0x67
        foreach DynamicActors(Class'WMission_Decompressed.wGameObject_Bomb', Bomb)
        {
            // End:0x66
            if(true)
            {
                Bomb.bHidden = true;
                Bomb.bDisabled = true;
                A = Spawn(Class'Engine.wC4Explosive',,, Bomb.Location);
            }            
        }        
    }
    //return;    
}

function ProcessRespawn()
{
    local Controller C;
    local string before, after;
    local int lp1;

    C = Level.ControllerList;
    J0x14:

    // End:0x2AD [Loop If]
    if(C != none)
    {
        Log(("[wMSGameInfo::PRocessRespawn] " $ C.PlayerReplicationInfo.PlayerName) $ " NumLives=0");
        C.PlayerReplicationInfo.NumLives = 0;
        C.PlayerReplicationInfo.bOutOfLives = false;
        C.PlayerReplicationInfo.bOnlySpectator = false;
        C.PlayerReplicationInfo.KillSuccession = 0;
        // End:0x296
        if(((C.IsA('PlayerController') || C.IsA('wBot')) && C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0x14C
            if(C.PlayerReplicationInfo.bAdminSpecator)
            {                
            }
            else
            {
                // End:0x1DC
                if((bCheckPrecacheInProcessRespawn && C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bPrecached)
                {
                    Log("[wMSGameInfo::ProcessRespawn] bPrecached == false " $ C.PlayerReplicationInfo.PlayerName);                    
                }
                else
                {
                    before = string(C.GetStateName());
                    RestartPlayer(C);
                    PlayerController(C).ClientFadeToColor();
                    after = string(C.GetStateName());
                    Log((((("[wMSGameInfo::ProcessRespawn] name=" $ C.PlayerReplicationInfo.PlayerName) $ "state=") $ before) $ " -> ") $ after);
                    RespawningControllers.Remove(lp1, 1);
                    lp1--;
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

event SceneStarted(SceneManager SM, Actor Other)
{
    // End:0x39
    if((Other != none) && Other.IsA('wMSCinematic_SceneManager'))
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
    local bool bLastMan;

    bLastMan = Reason ~= "LastMan";
    // End:0x40
    if(bLastMan)
    {
        GameReplicationInfo.Winner = Winner.Team;        
    }
    else
    {
        // End:0x7E
        if(Teams[1].Score > Teams[0].Score)
        {
            GameReplicationInfo.Winner = Teams[1];            
        }
        else
        {
            // End:0xBC
            if(Teams[1].Score < Teams[0].Score)
            {
                GameReplicationInfo.Winner = Teams[0];                
            }
            else
            {
                GameReplicationInfo.Winner = none;
            }
        }
    }
    C = Level.ControllerList;
    J0xE0:

    // End:0x15F [Loop If]
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
        // [Loop Continue]
        goto J0xE0;
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    return true;
    //return;    
}

function PlayEndOfMatchMessage()
{
    local Controller C;
    local int oppTeam, myTeam;
    local PlayerController PC;

    Log("[wMSGameInfo::PlayEndOfMatchMessage]");
    // End:0x1DB
    if(true)
    {
        C = Level.ControllerList;
        J0x40:

        // End:0x1DB [Loop If]
        if(C != none)
        {
            // End:0x1C4
            if(C.IsA('PlayerController'))
            {
                PC = PlayerController(C);
                myTeam = PC.PlayerReplicationInfo.Team.TeamIndex;
                oppTeam = 1 - myTeam;
                Log(((((((((("  " $ " Name=") $ PC.PlayerReplicationInfo.PlayerName) $ " Team=") $ string(myTeam)) $ " OppTeam=") $ string(oppTeam)) $ " TeamScore=") $ string(Teams[myTeam].Score)) $ " OppTeamScore=") $ string(Teams[oppTeam].Score));
                // End:0x19D
                if(Teams[myTeam].Score > Teams[oppTeam].Score)
                {
                    PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_Win);                    
                }
                else
                {
                    PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_Lose);
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x40;
        }
    }
    //return;    
}

function ProcessEndGame()
{
    local Controller C, NextC;

    C = Level.ControllerList;
    J0x14:

    // End:0x117 [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xF1
        if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            C.ClientRoundEnded();
            C.RoundHasEnded();
            C.PlayerReplicationInfo.IsSendRoundStartTime = false;
            C.PlayerReplicationInfo.KillSuccession = 0;
            C.PlayerReplicationInfo.UAVScanBeginTime = 0.0000000;
            C.PlayerReplicationInfo.UAVScanEndTime = 0.0000000;
        }
        C.SkillBase.ForceResetSkillUpdateCall();
        C = NextC;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function CalcRoundResultPoints(int ScoringTeam)
{
    //return;    
}

function NotifyBeginRound()
{
    local Actor A;

    Log("[wMSGameInfo::NotifyBeginRound]");
    // End:0x43
    foreach AllActors(Class'Engine.Actor', A)
    {
        A.OnBeginRound();        
    }    
    //return;    
}

function NotifyEndRound()
{
    local Actor A;

    Log("[wMSGameInfo::NotifyEndRound]");
    // End:0x41
    foreach AllActors(Class'Engine.Actor', A)
    {
        A.OnEndRound();        
    }    
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int ScoringTeam;
    local PlayerReplicationInfo PRI;
    local bool bSuccessfulAttack;

    // End:0x1A
    if(!IsPlaying() || ResetCountDown > 0)
    {
        return;
    }
    crlog((("[wMSGameInfo::EndRound] - Reason:" @ Reason) @ " RoundEndReason=") $ string(RoundEndReason));
    GameReplicationInfo.SyncRemainingTime();
    NotifyEndRound();
    // End:0xF7
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundState = 0;
        wMSGameReplicationInfo(GameReplicationInfo).RoundWinner = 1;
        wMSGameReplicationInfo(GameReplicationInfo).RoundOverTime = (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime) + RemainingTime;        
    }
    else
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundState = 1;
        GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
        // End:0x1E5
        if((int(RoundEndReason) == int(0)) || int(RoundEndReason) == int(2))
        {
            // End:0x1A5
            if((PRI != none) && PRI.IsA('wMSPlayerReplicationInfo'))
            {
                wMSPlayerReplicationInfo(PRI).DisabledFinalObjective++;
                GameEvent("EndRound_Trophy", "", PRI);
            }
            ScoringTeam = int(CurrentAttackingTeam);
            bSuccessfulAttack = true;
            GameEvent("AS_attackers_win", "" $ string(ScoringTeam), PRI);            
        }
        else
        {
            // End:0x242
            if((int(RoundEndReason) == int(1)) || int(RoundEndReason) == int(3))
            {
                ScoringTeam = 1 - int(CurrentAttackingTeam);
                GameEvent("AS_defenders_win", "" $ string(ScoringTeam), PRI);                
            }
            else
            {
                // End:0x25C
                if(int(RoundEndReason) == int(5))
                {
                    ScoringTeam = 0;                    
                }
                else
                {
                    // End:0x273
                    if(int(RoundEndReason) == int(6))
                    {
                        ScoringTeam = 1;
                    }
                }
            }
        }
        SetRoundWinner(ScoringTeam);
        // End:0x28A
        if(IsRoundLimitReached())
        {            
        }
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
    // End:0x31F
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
    //return;    
}

function bool IsRoundLimitReached()
{
    return (Teams[0].Score >= float(ScoreLimit)) || Teams[1].Score >= float(ScoreLimit);
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
            if(wMSPlayerReplicationInfo(C.PlayerReplicationInfo) != none)
            {
                wMSPlayerReplicationInfo(C.PlayerReplicationInfo).DisabledObjectivesCount = 0;
                wMSPlayerReplicationInfo(C.PlayerReplicationInfo).DisabledFinalObjective = 0;
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

function SetRoundWinner(int WinningTeam)
{
    // End:0x80
    if(WinningTeam < 2)
    {
        Teams[WinningTeam].Score = Teams[WinningTeam].Score + float(1);
        Teams[WinningTeam].NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(WinningTeam, 1.0000000, "Round Winner");
    }
    //return;    
}

function AnnounceScore(int ScoringTeam)
{
    local byte byTempTeam;

    // End:0x16
    if(ScoringTeam == 0)
    {
        byTempTeam = 1;        
    }
    else
    {
        byTempTeam = 0;
    }
    QueueAnnouncerSound(sndRoundWin, 1, byte(ScoringTeam));
    QueueAnnouncerSound(sndRoundLose, 1, byTempTeam);
    wMSGameReplicationInfo(GameReplicationInfo).RoundOverTime = (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime) + RemainingTime;
    //return;    
}

exec function NewRound()
{
    StartNewRound();
    //return;    
}

function StartNewRound()
{
    Log("## wMSGameInfo::StartNewRound ##");
    CurrentRound++;
    BeginRound();
    //return;    
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

    // End:0x1A8 [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0x19A
        if((C.PlayerReplicationInfo == none) || !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0x108
            if(hiddenAll && C.Pawn != none)
            {
                PlayerController(C).Pawn.bHidden = true;
                PlayerController(C).ClientSetHidden();
            }
            // End:0x12C
            if(PlayerController(C) != none)
            {
                PlayerController(C).ClientReset();
            }
            C.Reset();
            Log(("[wMSGameInfo::ResetLevel] " $ C.PlayerReplicationInfo.PlayerName) $ " NumLives=0");
            C.PlayerReplicationInfo.NumLives = 0;
        }
        C = NextC;
        // [Loop Continue]
        goto J0x64;
    }
    // End:0x1F6
    foreach AllActors(Class'Engine.Actor', A)
    {
        // End:0x1F5
        if(!A.IsA('Controller') && !A.IsA('LevelInfo'))
        {
            A.Reset();
        }        
    }    
    //return;    
}

function NewRoundSwitchTeam()
{
    local int iChangeAttack;

    iChangeAttack = int(float((int(CurrentRound) - 1) / ChangeAttackTeamRound) % float(2));
    // End:0x4B
    if((IsPracticeRound()) || iChangeAttack != 1)
    {
        CurrentAttackingTeam = FirstAttackingTeam;
        BeginNewPairOfRounds();        
    }
    else
    {
        CurrentAttackingTeam = byte(int(1) - int(FirstAttackingTeam));
    }
    //return;    
}

function AnnounceSwitchTeam()
{
    //return;    
}

function InitializeGameInfo(bool bNoReset, bool bChangeTeam)
{
    // End:0xA9
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
    else
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundState = 2;
        wMSGameReplicationInfo(GameReplicationInfo).RoundWinner = 0;
        wMSGameReplicationInfo(GameReplicationInfo).bChangeAttackingTeam = bChangeTeam;
        wMSGameReplicationInfo(GameReplicationInfo).CurrentRound = int(CurrentRound);
        wMSGameReplicationInfo(GameReplicationInfo).CurrentAttackingTeam = int(CurrentAttackingTeam);
        wMSGameReplicationInfo(GameReplicationInfo).ObjectiveProgress = 0;
        RoundStartTime = RemainingTime;
        wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime = RemainingTime;
        GameReplicationInfo.RemainingTime = RemainingTime;
        GameReplicationInfo.RemainingMinute = RemainingTime;
        GameReplicationInfo.bObjectivePlanted = false;
        SetRoundTimeLimit();
        GameReplicationInfo.bStopCountDown = false;
    }
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
        wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit = RoundTimeLimit * 60;
    }
    //return;    
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
        if(int(bupAttackingTeam) != int(CurrentAttackingTeam))
        {
            return true;
        }
    }
    return false;
    //return;    
}

function DestoryPawns()
{
    local wPawn P;

    Log("[wMSGameInfo::DestroyPawns]");
    // End:0x74
    foreach DynamicActors(Class'WGame.wPawn', P)
    {
        // End:0x73
        if(P.IsA('wHelicopter'))
        {
            wHelicopter(P).ClientStopAllHeliSound();
            P.Controller.GotoState('Dying');
            // End:0x73
            continue;
        }        
    }    
    //return;    
}

function BeginRound(optional bool bNoReset)
{
    local Controller C;
    local bool bChangeTeam;
    local array<int> aPlayerIDs;
    local int PlayerID;

    crlog("[wMSGameInfo::BeginRound]");
    // End:0x59
    if(((IsPracticeRound()) && PracticeTimeLimit == 0) && int(Level.NetMode) != int(NM_Standalone))
    {
        CurrentRound++;
    }
    // End:0x68
    if(IsPracticeRound())
    {
        PracticeRoundEnded();
    }
    bChangeTeam = ProcessSwitchTeam(bNoReset);
    crlog((((("=== CurrentRound : " $ string(CurrentRound)) $ " / CurrentAttackingTeam : ") $ string(CurrentAttackingTeam)) $ " / Calc : ") $ string(float((int(CurrentRound) - 1) / ChangeAttackTeamRound) % float(2)));
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
    else
    {
        ResetLevel();
    }
    ForceObjectiveDefenderTeamIndex();
    // End:0x180
    if(bNoReset == true)
    {        
    }
    else
    {
        DestoryPawns();
        ProcessRespawn();
        BeginWaitingForStart();
    }
    TriggerEvent('StartRound', self, none);
    // End:0x1CB
    if(!IsPracticeRound())
    {
        GameEvent("AS_BeginRound", "" $ string(CurrentRound), none);
    }
    bRoundOverProcessed = false;
    EndGameFocus = none;
    SetGameSpeed(GameSpeed);
    C = Level.ControllerList;
    J0x1F9:

    // End:0x2F7 [Loop If]
    if(C != none)
    {
        // End:0x21B
        if(C.PlayerReplicationInfo == none)
        {            
        }
        else
        {
            // End:0x239
            if(C.PlayerReplicationInfo.IsSendRoundStartTime)
            {                
            }
            else
            {
                PlayerID = C.PlayerReplicationInfo.GetUID();
                // End:0x292
                if(PlayerID != -1)
                {
                    aPlayerIDs[aPlayerIDs.Length] = PlayerID;
                    C.PlayerReplicationInfo.IsSendRoundStartTime = true;
                }
                Log((("[BeginRound] aplayerIDs:" $ string(PlayerID)) $ "/PlayerName:") $ C.PlayerReplicationInfo.PlayerName);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1F9;
    }
    Log("[BeginRound::sfReqGamePlay_SetRoundStartTime]");
    // End:0x347
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_SetRoundStartTime(aPlayerIDs);
    }
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

function bool IsPlayingIntro()
{
    return false;
    //return;    
}

function bool IsPracticeRound()
{
    return wMSGameReplicationInfo(GameReplicationInfo).IsPracticeRound();
    //return;    
}

function bool IsPlaying()
{
    return false;
    //return;    
}

function bool NeedToRespawnSD()
{
    return true;
    //return;    
}

function bool CanDisableObjective(GameObjective Go)
{
    local wMSGameReplicationInfo ASGRI;

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
    ASGRI = wMSGameReplicationInfo(GameReplicationInfo);
    // End:0x58
    if(int(Go.ObjectivePriority) <= int(ASGRI.ObjectiveProgress))
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
                        if((C.Pawn != none) && wMSPlayerReplicationInfo(C.PlayerReplicationInfo) != none)
                        {
                            wMSPlayerReplicationInfo(C.PlayerReplicationInfo).bTeleportToSpawnArea = true;
                            // End:0x191
                            if(AIController(C) != none)
                            {
                                wMSPlayerReplicationInfo(C.PlayerReplicationInfo).TeleportTime = int(Level.TimeSeconds);                                
                            }
                            else
                            {
                                wMSPlayerReplicationInfo(C.PlayerReplicationInfo).TeleportTime = (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime) + RemainingTime;
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
    local wMSGameReplicationInfo ASGRI;
    local wMSPlayerReplicationInfo ASPRI;

    // End:0x28
    if((PC == none) || wMSPlayerReplicationInfo(PC.PlayerReplicationInfo) == none)
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
    wMSPlayerReplicationInfo(C.PlayerReplicationInfo).bTeleportToSpawnArea = false;
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
    if((Killed != none) && wMSPlayerReplicationInfo(Killed.PlayerReplicationInfo) != none)
    {
        wMSPlayerReplicationInfo(Killed.PlayerReplicationInfo).bTeleportToSpawnArea = false;
    }
    super(DeathMatch).Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    CheckLastMan(Killed.PlayerReplicationInfo.Team.TeamIndex);
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
        if(wMSPlayerReplicationInfo(Killer.PlayerReplicationInfo) != none)
        {
            GameEvent("VehicleDestroyed_Trophy", DestroyedVehicle.VehicleNameString, Killer.PlayerReplicationInfo);
            wMSPlayerReplicationInfo(Killer.PlayerReplicationInfo).DestroyedVehicles++;
            // End:0x138
            if((PlayerController(Killer) != none) && int(wMSPlayerReplicationInfo(Killer.PlayerReplicationInfo).DestroyedVehicles) > 2)
            {
                PlayerController(Killer).ReceiveLocalizedMessage(Class'WMission_Decompressed.wMessage_MSKillMessages', 1);
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
        if((!Go.IsActive() || !Go.IsCritical()) || int(wMSGameReplicationInfo(GameReplicationInfo).ObjectiveProgress) < int(Go.ObjectivePriority))
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

function ForceRestartPlayer(Controller aPlayer)
{
    local string PawnOverrideClass;

    // End:0x7E
    if((aPlayer != none) && aPlayer.PlayerReplicationInfo != none)
    {
        PawnOverrideClass = wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass;
        // End:0x7E
        if(PawnOverrideClass != "")
        {
            SpawnAndPossessPawn(aPlayer, PawnOverrideClass);
            wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass = "";
        }
    }
    // End:0x9E
    if(PlayerController(aPlayer) != none)
    {
        BroadCast_AssaultRole_Message(PlayerController(aPlayer));
    }
    RestartPlayer(aPlayer);
    //return;    
}

function RestartPlayer(Controller aPlayer)
{
    local string PawnOverrideClass;
    local wMSGameReplicationInfo MSGRI;
    local array<int> aPlayerIDs;
    local int iPlayerID, iCurrentRound;

    MSGRI = wMSGameReplicationInfo(GameReplicationInfo);
    Log("[wMSGameInfo::RestartPlayer] name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    // End:0x24C
    if(!AllowBecomeActivePlayer(PlayerController(aPlayer)))
    {
        Log("[wMSGameInfo::RestartPlayer] not AllowBecomeActivePlayer");
        Log((("    MaxLives=" $ string(MaxLives)) $ " aPlayer.PlayerReplicationInfo.NumLives=") $ string(aPlayer.PlayerReplicationInfo.NumLives));
        Log((((("    state=" $ string(aPlayer.GetStateName())) $ " GameReplicationInfo.bMatchHasBegun=") $ string(GameReplicationInfo.bMatchHasBegun)) $ " bMustJoinBeforeStart=") $ string(bMustJoinBeforeStart));
        Log("    RoundTimeLimit=" $ string(RoundTimeLimit));
        Log("    RoundState=" $ string(GetEnum(Enum'Engine.GameReplicationInfo.EROUND_STATE', int(GameReplicationInfo.RoundState))));
        Log((((("    elapsed=" $ string(MSGRI.RoundStartTime - MSGRI.RemainingTime)) $ " RoundStartTime=") $ string(MSGRI.RoundStartTime)) $ " RemainTime=") $ string(MSGRI.RemainingTime));
        return;
    }
    // End:0x2FC
    if((aPlayer != none) && aPlayer.PlayerReplicationInfo != none)
    {
        PawnOverrideClass = wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass;
        // End:0x2FC
        if(PawnOverrideClass != "")
        {
            Log("[wMSGameInfo::RestartPlayer] PawnOverrideClass");
            SpawnAndPossessPawn(aPlayer, PawnOverrideClass);
            wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).PawnOverrideClass = "";
        }
    }
    // End:0x31C
    if(PlayerController(aPlayer) != none)
    {
        BroadCast_AssaultRole_Message(PlayerController(aPlayer));
    }
    iCurrentRound = int(CurrentRound);
    super(TeamGame).RestartPlayer(aPlayer);
    iPlayerID = aPlayer.PlayerReplicationInfo.GetUID();
    aPlayerIDs[0] = iPlayerID;
    // End:0x54A
    if((1 == aPlayer.PlayerReplicationInfo.NumLives) && !IsA('wDOMGameInfo'))
    {
        // End:0x46A
        if(!aPlayer.PlayerReplicationInfo.IsSendGameStartTime && aPlayer.PlayerReplicationInfo.bBot == false)
        {
            Log((((string(self) $ "[RestartPlayer>sfReqGamePlay_SetGameStartTime] PlayerName:") $ aPlayer.PlayerReplicationInfo.PlayerName) $ "/iPlayerID:") $ string(iPlayerID));
            BTSend.sfReqGamePlay_SetGameStartTime(aPlayerIDs);
            aPlayer.PlayerReplicationInfo.IsSendGameStartTime = true;
        }
        // End:0x54A
        if(!aPlayer.PlayerReplicationInfo.IsSendRoundStartTime && aPlayer.PlayerReplicationInfo.bBot == false)
        {
            Log((((string(self) $ "[RestartPlayer>sfReqGamePlay_SetRoundStartTime] PlayerName:") $ aPlayer.PlayerReplicationInfo.PlayerName) $ "/iPlayerID:") $ string(iPlayerID));
            BTSend.sfReqGamePlay_SetRoundStartTime(aPlayerIDs);
            aPlayer.PlayerReplicationInfo.IsSendRoundStartTime = true;
        }
    }
    //return;    
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    // End:0x5F
    if(wMSPlayerReplicationInfo(PlayerPawn.Controller.PlayerReplicationInfo).PawnOverrideClass == "")
    {
        // End:0x5F
        if(UnrealPawn(PlayerPawn) != none)
        {
            UnrealPawn(PlayerPawn).AddDefaultInventory();
            PlayerPawn.AddDefaultSkills();
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

function int GetPlayerStartTeam(NavigationPoint N, int Team)
{
    // End:0x29
    if(PlayerStart(N) != none)
    {
        return int(PlayerStart(N).TeamNumber);        
    }
    else
    {
        return Team;
    }
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;
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
    Team = byte(float(byte(int(Team) + int(CurrentAttackingTeam))) % float(2));
    return FindPlayerStart_SD(Team);
    //return;    
}

function SetRemainingTime(int remain)
{
    RemainingTime = (RoundStartTime - wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit) + remain;
    // End:0x7D
    if(GameReplicationInfo != none)
    {
        GameReplicationInfo.RemainingTime = RemainingTime;
        GameReplicationInfo.PostRemaiingTime = RemainingTime;
        GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(2);
    }
    //return;    
}

function int GetRemainingTime()
{
    return (GameReplicationInfo.RemainingTime - RoundStartTime) + wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit;
    //return;    
}

function SetObjectiveSetted(Pawn TP, name ObjectTag, Vector FlagLocation)
{
    bObjectivePlanted = true;
    nPlantedObjectiveName = ObjectTag;
    RemainingTimeWhenObjectIsSet = GetRemainingTime();
    SetRemainingTime(DefuseTimeLimit);
    wMSGameReplicationInfo(GameReplicationInfo).bObjectivePlanted = true;
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

function QueueAnnouncerSound(string ASound, byte AnnouncementLevel, byte Team, optional Object.EAPriority Priority, optional byte Switch)
{
    local Controller C;

    Log(((((("[wMSGameInfo::QueueAnnouncerSound]" $ " ASound=") $ ASound) $ " AnnouncementLevel=") $ string(AnnouncementLevel)) $ " Team=") $ string(Team));
    // End:0x125
    if(!IsPlayingIntro() && Len(ASound) != 0)
    {
        C = Level.ControllerList;
        J0x9A:

        // End:0x125 [Loop If]
        if(C != none)
        {
            // End:0x10E
            if(C.IsA('PlayerController') && (int(Team) == 255) || C.GetTeamNum() == int(Team))
            {
                PlayerController(C).QueueAnnouncement(ASound, AnnouncementLevel, Priority, Switch);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x9A;
        }
    }
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super(TeamGame).PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundOurTeamPlantedBomb, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundEnemyPlantedBomb, Class'Engine.Sound');
    Class'WWeapons_Res.wWeaponRes_DemoPack'.static.PrecacheSound();
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
    super(TeamGame).FillPlayInfo(PlayInfo);
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    return super(TeamGame).GetDescriptionText(PropName);
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

simulated function bool IsRespawnRestrictionTime()
{
    local int elapsed;

    elapsed = RoundStartTime - RemainingTime;
    // End:0x48
    if(bHasRespawnRestriction)
    {
        // End:0x38
        if(int(CurrentRound) <= 1)
        {
            return elapsed > RespawnRestrictionTimeRound1;            
        }
        else
        {
            return elapsed > RespawnRestrictionTime;
        }        
    }
    else
    {
        return false;
    }
    //return;    
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
    // End:0x1B1
    if(bHasRespawnRestriction)
    {
        // End:0x38
        if(RoundTimeLimit <= 0)
        {
            return false;
        }
        // End:0x53
        if(int(GameReplicationInfo.RoundState) == int(1))
        {
            return false;
        }
        elapsed = RoundStartTime - RemainingTime;
        // End:0x9A
        if(IsRespawnRestrictionTime())
        {
            C.PlayerReplicationInfo.bOutOfLives = true;
            C.GotoState('Spectating');
            return false;
        }
        Log("[wMSGameInfo::IsRightTimeForRespawn] " $ C.PlayerReplicationInfo.PlayerName);
        Log("  RoundTimeLimit=" $ string(RoundTimeLimit));
        Log("  RoundState=" $ string(GetEnum(Enum'Engine.GameReplicationInfo.EROUND_STATE', int(GameReplicationInfo.RoundState))));
        Log((((("  elapsed=" $ string(elapsed)) $ " RoundStartTime=") $ string(MSGRI.RoundStartTime)) $ " RemainTime=") $ string(MSGRI.RemainingTime));
        Log("[wMSGameInfo::IsRightTimeForRespawn]");
    }
    return true;
    //return;    
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
    // End:0x0D
    if(P == none)
    {
        return true;
    }
    // End:0x3D
    if((MaxLives != 0) && P.PlayerReplicationInfo.NumLives >= MaxLives)
    {
        return false;
    }
    // End:0x62
    if(super(DeathMatch).AllowBecomeActivePlayer(P))
    {
        // End:0x5D
        if(!IsRightTimeForRespawn(P))
        {
            return false;
        }
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function FindLiving(out PlayerReplicationInfo Living, out byte bOtherTeamNoneLeft)
{
    local Controller C;

    bOtherTeamNoneLeft = 1;
    C = Level.ControllerList;
    J0x1C:

    // End:0x118 [Loop If]
    if(C != none)
    {
        // End:0x101
        if((((C.PlayerReplicationInfo != none) && C.bIsPlayer) && IsPawnAlive(C)) && !C.PlayerReplicationInfo.bAdminSpecator)
        {
            // End:0xA0
            if(Living == none)
            {
                Living = C.PlayerReplicationInfo;                
            }
            else
            {
                // End:0x101
                if((C.PlayerReplicationInfo != Living) && C.PlayerReplicationInfo.Team.TeamIndex != Living.Team.TeamIndex)
                {
                    bOtherTeamNoneLeft = 0;
                    // [Explicit Break]
                    goto J0x118;
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1C;
    }
    J0x118:

    //return;    
}

exec function lll()
{
    local Controller C;

    Log("[lll]");
    dblog((("  CurrentAttackingTeam:" $ string(CurrentAttackingTeam)) $ "  State:") $ string(GetStateName()));
    C = Level.ControllerList;
    J0x58:

    // End:0x245 [Loop If]
    if(C != none)
    {
        // End:0x22E
        if((C != none) && C.PlayerReplicationInfo != none)
        {
            dblog(" PLAYER: " $ C.PlayerReplicationInfo.PlayerName);
            dblog((((("    bIsDead=" $ string(C.PlayerReplicationInfo.IsDead)) $ " TeamIndex=") $ string(C.PlayerReplicationInfo.Team.TeamIndex)) $ " NumLives=") $ string(C.PlayerReplicationInfo.NumLives));
            dblog((((((("    bIsPlayer=" $ string(C.bIsPlayer)) $ " bOutOfLives=") $ string(C.PlayerReplicationInfo.bOutOfLives)) $ " bOnlySpectator=") $ string(C.PlayerReplicationInfo.bOnlySpectator)) $ " state=") $ string(C.GetStateName()));
            dblog((("    isPawnAlive=" $ string(IsPawnAlive(C))) $ " bPrecached=") $ string(C.PlayerReplicationInfo.bPrecached));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x58;
    }
    dblog("[LeaveLogOtherTeamNoneLeft::END]");
    //return;    
}

function LeaveLogOtherTeamNoneLeft(PlayerReplicationInfo Living)
{
    local Controller C;

    Log("[LeaveLogOtherTeamNoneLeft::BEGIN]");
    // End:0x4E
    if(Living != none)
    {
        Log("  living:" $ Living.PlayerName);
    }
    Log((("  CurrentAttackingTeam:" $ string(CurrentAttackingTeam)) $ "  State:") $ string(GetStateName()));
    C = Level.ControllerList;
    J0x99:

    // End:0x225 [Loop If]
    if(C != none)
    {
        // End:0x20E
        if((C != none) && C.PlayerReplicationInfo != none)
        {
            Log("  PLAYER: " $ C.PlayerReplicationInfo.PlayerName);
            Log((((((((((((("    bIsDead=" $ string(C.PlayerReplicationInfo.IsDead)) $ " TeamIndex=") $ string(C.PlayerReplicationInfo.Team.TeamIndex)) $ " NumLives=") $ string(C.PlayerReplicationInfo.NumLives)) $ " bIsPlayer=") $ string(C.bIsPlayer)) $ " bOutOfLives=") $ string(C.PlayerReplicationInfo.bOutOfLives)) $ " bOnlySpectator=") $ string(C.PlayerReplicationInfo.bOnlySpectator)) $ " state=") $ string(C.GetStateName()));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x99;
    }
    Log("[LeaveLogOtherTeamNoneLeft::END]");
    //return;    
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    //return;    
}

function bool CheckMaxLives(PlayerReplicationInfo Scorer)
{
    local PlayerReplicationInfo Living;
    local byte bOtherTeamNoneLeft;

    // End:0x75
    if((MaxLives > 0) && int(wMSGameReplicationInfo(GameReplicationInfo).RoundState) != int(1))
    {
        FindLiving(Living, bOtherTeamNoneLeft);
        // End:0x75
        if(int(bOtherTeamNoneLeft) == 1)
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
    //return;    
}

function CheckLastMan(int TeamIndex)
{
    local Controller C, survivorC;
    local int survivorCount;

    Log(("[wMSGameInfo::CheckLastMan]" $ " TeamIndex=") $ string(TeamIndex));
    survivorCount = 0;
    C = Level.ControllerList;
    J0x52:

    // End:0x16F [Loop If]
    if(C != none)
    {
        // End:0x158
        if((((((C.PlayerReplicationInfo != none) && C.bIsPlayer) && !C.PlayerReplicationInfo.bOutOfLives) && !C.PlayerReplicationInfo.bOnlySpectator) && !C.PlayerReplicationInfo.IsDead) && C.PlayerReplicationInfo.Team.TeamIndex == TeamIndex)
        {
            Log("  Survivor: " $ C.PlayerReplicationInfo.PlayerName);
            survivorCount++;
            survivorC = C;
            // End:0x158
            if(survivorCount == 2)
            {
                // [Explicit Break]
                goto J0x16F;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x52;
    }
    J0x16F:

    // End:0x195
    if(survivorCount == 1)
    {
        PlayerController(survivorC).QueueAnnouncement(sndLastMan, 1);
    }
    //return;    
}

function CheckScore(PlayerReplicationInfo Scorer)
{
    // End:0x10
    if(CheckMaxLives(Scorer))
    {
        return;
    }
    // End:0x36
    if((GameRulesModifiers != none) && GameRulesModifiers.CheckScore(Scorer))
    {
        return;
    }
    // End:0x50
    if(!bOverTime && GoalScore == 0)
    {
        return;
    }
    // End:0x7C
    if((Scorer != none) && bOverTime)
    {
        EndGame(Scorer, "timelimit");
    }
    //return;    
}

function int GetBootySeedValue()
{
    return int(Teams[0].Score + Teams[1].Score);
    //return;    
}

function int GetTotalPlayedTime()
{
    return int(CurrentRound);
    //return;    
}

function bool DoProcessKillMessage(Class<DamageType> DamageType)
{
    return super(GameInfo).DoProcessKillMessage(DamageType) && DamageType != Class'WWeapons_Res.wWeaponRes_DemoPack';
    //return;    
}

function AddGameSpecificActions(out array<wAction> Actions)
{
    //return;    
}

state MatchInProgress
{
    function BeginState()
    {
        //return;        
    }

    function EndState()
    {
        //return;        
    }

    function Timer()
    {
        super.Timer();
        // End:0x2C
        if(TimeLimit < 1)
        {
            // End:0x2C
            if(!GameReplicationInfo.bStopCountDown)
            {
                RemainingTime--;
            }
        }
        GameReplicationInfo.RemainingTime = RemainingTime;
        // End:0x69
        if((float(RemainingTime) % float(60)) == float(0))
        {
            GameReplicationInfo.RemainingMinute = RemainingTime;
        }
        // End:0x7D
        if(ResetCountDown > 0)
        {
            ProcessResetCountDown();            
        }
        else
        {
            ProcessEndRound();
        }
        // End:0xD7
        if((Level.GetMatchMaker() != none) && Level.GetMatchMaker().IsDisconnectedUser())
        {
            CheckLives(none);
            Level.GetMatchMaker().SetDisconnectedUser(false);
        }
        //return;        
    }

    function ProcessEndRound()
    {
        // End:0xB9
        if((wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit > 0) && (RoundStartTime - RemainingTime) >= wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit)
        {
            // End:0x67
            if(IsPracticeRound())
            {
                EndRound(1, none, "practicetimelimit");                
            }
            else
            {
                // End:0x95
                if(bObjectivePlanted == false)
                {
                    // End:0x8C
                    if(!bRoundOverProcessed)
                    {
                        bRoundOverProcessed = true;
                        OnRoundTimeOverWithoutObjectPlanted();
                    }
                    CheckEndGameAfterRoundTimeOver();                    
                }
                else
                {
                    ExplodeBomb();
                    EndRound(0, none, "Distroy Success !!!");
                }
            }
        }
        //return;        
    }

    function ProcessResetCountDown()
    {
        local GameObjective Go;

        clog("[SS] ResetCountDown=" $ string(ResetCountDown));
        ResetCountDown--;
        // End:0xF9
        if((ResetCountDown > 0) && ResetCountDown < 10)
        {
            // End:0xF6
            if(ResetCountDown == 3)
            {
                wMSGameReplicationInfo(GameReplicationInfo).ObjectiveProgress = 0;
                GameReplicationInfo.NetUpdateTime = Level.TimeSeconds;
                Go = Teams[0].AI.Objectives;
                J0xA3:

                // End:0xF6 [Loop If]
                if(Go != none)
                {
                    Go.Reset();
                    Go.NetUpdateTime = Level.TimeSeconds - float(1);
                    Go = Go.NextObjective;
                    // [Loop Continue]
                    goto J0xA3;
                }
            }            
        }
        else
        {
            // End:0x10A
            if(ResetCountDown == 0)
            {
                StartNewRound();
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
        // End:0x12
        if(!AllowBecomeActivePlayer(aPlayer))
        {
            return false;
        }
        // End:0x76
        if((GameReplicationInfo.bMatchHasBegun && ResetCountDown == 0) && !bDisableReinforcements)
        {
            // End:0x71
            if(ReinforcementsCount < ReinforcementsFreq)
            {
                wMSPlayerReplicationInfo(aPlayer.PlayerReplicationInfo).bAutoRespawn = true;
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
        return (int(wMSGameReplicationInfo(GameReplicationInfo).RoundWinner) == int(0)) && ResetCountDown == 0;
        //return;        
    }
    stop;    
}

state MatchOver
{
    function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
    {
        //return;        
    }

    function BeginState()
    {
        local PlayerReplicationInfo PRI;

        // End:0x67
        foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
        {
            // End:0x3D
            if(PRI.RoundWhenIntervented == 0)
            {
                PRI.RoundPlayed = int(CurrentRound);
                // End:0x66
                continue;
            }
            PRI.RoundPlayed = (int(CurrentRound) - PRI.RoundWhenIntervented) + 1;            
        }        
        super.BeginState();
        //return;        
    }
    stop;    
}

state SPIntroCinematic
{
    function BeginState()
    {
        Log("wMSGameInfo::SPIntroCinematic state::BeginState()");
        Level.GetLocalPlayerController().bHideVehicleNoEntryIndicator = true;
        CurrentRound = 0;
        TriggerEvent('StartRound', self, none);
        //return;        
    }

    event SceneStarted(SceneManager SM, Actor Other)
    {
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
        //return;        
    }

    function BeginState()
    {
        local Controller C, NextC;
        local PlayerController PC;

        Log("wMSGameInfo::MPOutroCinematic state::BeginState()");
        C = Level.ControllerList;
        J0x49:

        // End:0xE2 [Loop If]
        if(C != none)
        {
            NextC = C.nextController;
            // End:0xD4
            if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                PC = PlayerController(C);
                // End:0xC5
                if(PC != none)
                {
                    PC.ClientRoundEnded();
                }
                C.RoundHasEnded();
            }
            C = NextC;
            // [Loop Continue]
            goto J0x49;
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
        // End:0x89
        if((Teams[0].Score >= float(ScoreLimit)) || Teams[1].Score >= float(ScoreLimit))
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
        //return;        
    }
    stop;    
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
    AttackerWinRound[0]="Red_team_attacked"
    AttackerWinRound[1]="Blue_team_attacked"
    DefenderWinRound[0]="Red_team_defended"
    DefenderWinRound[1]="Blue_team_defended"
    DrawGameSound="Draw_Game"
    sndChangeAttackTeam="/Mode_SD/v_sd_change_R"
    sndLastMan="/Mode_SD/v_sd_lastman_R"
    sndRoundWin="/Mode_SD/v_sd_round_encourage_win_team_R"
    sndRoundLose="/Mode_SD/v_sd_round_encourage_lose_team_R"
    BombPlantedMessage="?????????????????"
    bScoreTeamKills=false
    bSpawnInTeamArea=true
    TeammateBoost=0.2500000
    bSkipPlaySound=true
    SpawnProtectionTime=3.0000000
    DefaultMaxLives=1
    DefaultEnemyRosterClass="WGame.wTeamRoster"
    ADR_Kill=2.0000000
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
    GameReplicationInfoClass=Class'WMission_Decompressed.wMSGameReplicationInfo'
    GameName="Mission"
    Description="In each round, one team takes the role of the attacker, while the other team defends, in recreations of famous (or infamous) scenarios. After a pair of rounds, the most successful attacking team scores a point."
    ScreenShotName="UT2004Thumbnails.AssaultShots"
    DecoTextName="WGame.TeamGame"
    Acronym="MS"
    GameDecPoint=2.0000000
    bHasRespawnRestriction=true
    RespawnRestrictionTime=30
}