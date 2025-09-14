class DeathMatch extends UnrealMPGameInfo
    config
    hidedropdown
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const DMPROPNUM = 14;

struct AddBotInfo
{
    var Class<Controller> BotClass;
    var int Team;
    var int Grade;
    var int NPCID;
};

var array<AddBotInfo> AddBotQueue;
var config int NetWait;
var config int NetWaitClan;
var int MinNetPlayers;
var int RestartWait;
var bool bTournament;
var bool bAutoNumBots;
var bool bColoredDMSkins;
var bool bPlayersMustBeReady;
var bool bForceRespawn;
var bool bAdjustSkill;
var bool bAllowTaunts;
var bool bAllowTrans;
var bool bDefaultTranslocator;
var bool bOverrideTranslocator;
var bool bWaitForNetPlayers;
var bool bFirstBlood;
var bool bQuickStart;
var bool bSkipPlaySound;
var bool bStartedCountDown;
var bool bFinalStartup;
var bool bOverTimeBroadcast;
var bool bEpicNames;
var bool bKillBots;
var bool bCustomBots;
var bool bReviewingJumpSpots;
var bool bAllowPlayerLights;
var bool bForceNoPlayerLights;
var(Menu) bool bAlwaysShowLoginMenu;
var bool GiveBotsFakeUID;
var array<Vehicle> Vehicles;
var bool bForceDefaultCharacter;
var bool bPlayerBecameActive;
var bool bMustHaveMultiplePlayers;
var byte StartupStage;
var int NumRounds;
var float SpawnProtectionTime;
var int DefaultMaxLives;
var int LateEntryLives;
var int RemainingTime;
var int ElapsedTime;
var int CountDown;
var float AdjustedDifficulty;
var int PlayerKills;
var int PlayerDeaths;
var Class<SquadAI> DMSquadClass;
var Class<LevelGameRules> LevelRulesClass;
var LevelGameRules LevelRules;
var UnrealTeamInfo EnemyRoster;
var string EnemyRosterName;
var string DefaultEnemyRosterClass;
var int RemainingBots;
var int InitialBots;
var NavigationPoint LastPlayerStartSpot;
var NavigationPoint LastStartSpot;
var int NameNumber;
var int EndMessageWait;
var transient int EndMessageCounter;
var name AltEndGameSoundName[2];
var int SinglePlayerWait;
var string NamePrefixes[10];
var string NameSuffixes[10];
var Actor EndGameFocus;
var PlayerController StandalonePlayer;
var localized string DMPropsDisplayText[14];
var localized string DMPropDescText[14];
var localized string YouDestroyed;
var localized string YouDestroyedTrailer;
var() float ADR_Kill;
var() float ADR_MajorKill;
var() float ADR_MinorError;
var() float ADR_MinorBonus;
var() float ADR_KillTeamMate;
var string EpicNames[21];
var string MaleBackupNames[32];
var string FemaleBackupNames[32];
var int EpicOffset;
var int TotalEpic;
var int MaleBackupNameOffset;
var int FemaleBackupNameOffset;
var(Menu) config string LoginMenuClass;
var(LoadingHints) private localized array<localized string> DMHints;
var float InventoryListLastTime;
var int StartPlayerNum;
var name VoiceTimesUp;
var name sndModeName;
var name sndModeExplain;
var array<Pawn> InventoryList;
var bool SendMatchOverEndState;
var bool SendMatchOverState;
//var delegate<deleAnnounceMatchInfo> __deleAnnounceMatchInfo__Delegate;

function SendBgmMessageBeginMatch()
{
    local Controller P;
    local PlayerController PC;

    P = Level.ControllerList;
    J0x14:

    // End:0x73 [Loop If]
    if(P != none)
    {
        PC = PlayerController(P);
        // End:0x5C
        if(PC != none)
        {
            PC.ReceiveLocalizedMessage(Class'Engine.wMessage_BGM', Class'Engine.wMessage_BGM'.default.Code_Combat);
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function int GetTimeSecondsLeft()
{
    return RemainingTime;
    //return;    
}

function PostBeginPlay()
{
    NameNumber = Rand(10);
    EpicOffset = Rand(10);
    MaleBackupNameOffset = Rand(32);
    FemaleBackupNameOffset = Rand(32);
    super(GameInfo).PostBeginPlay();
    GameReplicationInfo.RemainingTime = RemainingTime;
    GameReplicationInfo.bForceTeamSkins = !bTeamGame && bColoredDMSkins;
    GameReplicationInfo.bForceNoPlayerLights = bForceNoPlayerLights;
    // End:0xA2
    if(bPlayersVsBots || CurrentGameProfile != none)
    {
        GameReplicationInfo.bNoTeamChanges = true;
    }
    // End:0xD9
    if(!bForceNoPlayerLights && bTeamGame || bColoredDMSkins)
    {
        GameReplicationInfo.bAllowPlayerLights = default.bAllowPlayerLights;
    }
    InitTeamSymbols();
    GetBotTeam(InitialBots);
    // End:0x114
    if((CurrentGameProfile == none) || bCustomBots && (GetBotTeam()) != none)
    {
        OverrideInitialBots();
    }
    // End:0x133
    if(bPlayersVsBots)
    {
        GameReplicationInfo.BotDifficulty = int(GameDifficulty);
    }
    //return;    
}

function OverrideInitialBots()
{
    InitialBots = GetBotTeam().OverrideInitialBots(InitialBots, none);
    //return;    
}

function Reset()
{
    super(GameInfo).Reset();
    ElapsedTime = (GetNetWait()) - 3;
    bWaitForNetPlayers = int(Level.NetMode) != int(NM_Standalone);
    bStartedCountDown = false;
    bFinalStartup = false;
    CountDown = default.CountDown;
    RemainingTime = 60 * TimeLimit;
    GotoState('PendingMatch');
    //return;    
}

function bool JustStarted(float t)
{
    // End:0x20
    if(TimeLimit > 0)
    {
        return RemainingTime > ((60 * TimeLimit) - 20);
    }
    return Level.TimeSeconds < t;
    //return;    
}

function CheckReady()
{
    // End:0x2F
    if((GoalScore == 0) && TimeLimit == 0)
    {
        TimeLimit = 20;
        RemainingTime = 60 * TimeLimit;
    }
    //return;    
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    local bool bEnemyKill;
    local int Score;
    local string KillInfo;

    bEnemyKill = !bTeamGame || (((((Killer != none) && Killer != Killed) && Killed != none) && Killer.PlayerReplicationInfo != none) && Killed.PlayerReplicationInfo != none) && Killer.PlayerReplicationInfo.Team != Killed.PlayerReplicationInfo.Team;
    // End:0xE8
    if((KilledPawn != none) && KilledPawn.GetSpree() > 4)
    {
        // End:0xE8
        if(bEnemyKill && Killer != none)
        {
            Killer.AwardAdrenaline(ADR_MajorKill);
        }
    }
    // End:0x283
    if((((Killer != none) && Killer.bIsPlayer) && Killed != none) && Killed.bIsPlayer)
    {
        // End:0x157
        if(UnrealPlayer(Killer) != none)
        {
            UnrealPlayer(Killer).LogMultiKills(ADR_MajorKill, bEnemyKill);
        }
        // End:0x179
        if(bEnemyKill)
        {
            DamageType.static.ScoreKill(Killer, Killed);
        }
        // End:0x1F4
        if((!bFirstBlood && Killer != Killed) && bEnemyKill)
        {
            Killer.AwardAdrenaline(ADR_MajorKill);
            bFirstBlood = true;
            // End:0x1F4
            if(TeamPlayerReplicationInfo(Killer.PlayerReplicationInfo) != none)
            {
                TeamPlayerReplicationInfo(Killer.PlayerReplicationInfo).bFirstBlood = true;
            }
        }
        // End:0x21A
        if(Killer == Killed)
        {
            Killer.AwardAdrenaline(ADR_MinorError);            
        }
        else
        {
            // End:0x26F
            if(bTeamGame && Killed.PlayerReplicationInfo.Team == Killer.PlayerReplicationInfo.Team)
            {
                Killer.AwardAdrenaline(ADR_KillTeamMate);                
            }
            else
            {
                Killer.AwardAdrenaline(ADR_Kill);
            }
        }
    }
    // End:0x400
    if((((((Killer != none) && Killer.bIsPlayer) && Killer.PlayerReplicationInfo != none) && Vehicle(KilledPawn) != none) && (Killed != none) || Vehicle(KilledPawn).bEjectDriver) && Vehicle(KilledPawn).IndependentVehicle())
    {
        Score = VehicleScoreKill(Killer, Killed, Vehicle(KilledPawn), KillInfo);
        // End:0x400
        if(Score > 0)
        {
            // End:0x38A
            if(Killed != none)
            {
                // End:0x38A
                if(!bEnemyKill && Killed.PlayerReplicationInfo != none)
                {
                    Score = -Score;
                    KillInfo = "TeamKill_" $ KillInfo;
                }
            }
            // End:0x400
            if(Score != 0)
            {
                Killer.PlayerReplicationInfo.Score += float(Score);
                Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
                ScoreEvent(Killer.PlayerReplicationInfo, float(Score), KillInfo);
            }
        }
    }
    super(GameInfo).Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    //return;    
}

function int VehicleScoreKill(Controller Killer, Controller Killed, Vehicle DestroyedVehicle, out string KillInfo)
{
    // End:0x60
    if((Killed == none) && PlayerController(Killer) != none)
    {
        PlayerController(Killer).TeamMessage(Killer.PlayerReplicationInfo, (YouDestroyed @ DestroyedVehicle.VehicleNameString) @ YouDestroyedTrailer, 'CriticalEvent');
    }
    // End:0xB2
    if(KillInfo == "")
    {
        // End:0xB2
        if(DestroyedVehicle.bKeyVehicle || DestroyedVehicle.bHighScoreKill)
        {
            KillInfo = "destroyed_key_vehicle";
            return 5;
        }
    }
    return 0;
    //return;    
}

function InitLogging()
{
    super(GameInfo).InitLogging();
    //return;    
}

static function bool NeverAllowTransloc()
{
    return false;
    //return;    
}

function bool AllowTransloc()
{
    return bAllowTrans || bOverrideTranslocator;
    //return;    
}

function AddGameSpecificInventory(Pawn P)
{
    // End:0x30
    if(AllowTransloc())
    {
        P.CreateInventory("XWeapons.TransLauncher");
    }
    super(GameInfo).AddGameSpecificInventory(P);
    //return;    
}

event InitGame(string Options, out string Error)
{
    local string InOpt;
    local int LevelMinPlayers;

    super(GameInfo).InitGame(Options, Error);
    // End:0x24
    foreach AllActors(Class'UnrealGame_Decompressed.LevelGameRules', LevelRules)
    {
        // End:0x24
        break;        
    }    
    // End:0x40
    if(LevelRules != none)
    {
        LevelRules.UpdateGame(self);
    }
    // End:0xBE
    if((CurrentGameProfile == none) && Left(string(Level), 3) ~= "TUT")
    {
        // End:0x7C
        if(GoalScore != 0)
        {
            GoalScore = Max(GoalScore, 3);
        }
        // End:0x9D
        if((TimeLimit != 0) && TimeLimit < 10)
        {
            TimeLimit = 10;
        }
        RemainingTime = 60 * TimeLimit;
        bTournament = false;
        bQuickStart = true;
        return;
    }
    SetGameSpeed(GameSpeed);
    MaxLives = Max(0, GetIntOption(Options, "MaxLives", MaxLives));
    // End:0x102
    if(MaxLives > 0)
    {
        bForceRespawn = true;        
    }
    else
    {
        // End:0x120
        if(DefaultMaxLives > 0)
        {
            bForceRespawn = true;
            MaxLives = DefaultMaxLives;
        }
    }
    GoalScore = Max(0, GetIntOption(Options, "GoalScore", GoalScore));
    TimeLimit = Max(0, GetIntOption(Options, "TimeLimit", TimeLimit));
    // End:0x17A
    if(DefaultMaxLives > 0)
    {
        TimeLimit = 0;
    }
    InOpt = ParseOption(Options, "Translocator");
    // End:0x1D1
    if(InOpt != "")
    {
        Log("Translocators: " $ string(bool(InOpt)));
        bAllowTrans = bool(InOpt);
    }
    InOpt = ParseOption(Options, "bAutoNumBots");
    // End:0x227
    if(InOpt != "")
    {
        Log("bAutoNumBots: " $ string(bool(InOpt)));
        bAutoNumBots = bool(InOpt);
    }
    // End:0x2AE
    if(bTeamGame && int(Level.NetMode) != int(NM_Standalone))
    {
        InOpt = ParseOption(Options, "VsBots");
        // End:0x29D
        if(InOpt != "")
        {
            Log("bPlayersVsBots: " $ string(bool(InOpt)));
            bPlayersVsBots = bool(InOpt);
        }
        // End:0x2AE
        if(bPlayersVsBots)
        {
            bAutoNumBots = false;
        }
    }
    InOpt = ParseOption(Options, "AutoAdjust");
    // End:0x30D
    if(InOpt != "")
    {
        bAdjustSkill = !bTeamGame && bool(InOpt);
        Log("Adjust skill " $ string(bAdjustSkill));
    }
    InOpt = ParseOption(Options, "PlayersMustBeReady");
    // End:0x36E
    if(InOpt != "")
    {
        Log("PlayerMustBeReady: " $ string(bool(InOpt)));
        bPlayersMustBeReady = bool(InOpt);
    }
    EnemyRosterName = ParseOption(Options, "DMTeam");
    // End:0x39B
    if(EnemyRosterName != "")
    {
        bCustomBots = true;
    }
    // End:0x3C2
    if(CurrentGameProfile != none)
    {
        MaxLives = 0;
        bAllowTrans = default.bDefaultTranslocator;
        bAdjustSkill = false;
    }
    // End:0x3E1
    if(HasOption(Options, "NumBots"))
    {
        bAutoNumBots = false;
    }
    // End:0x47C
    if(bAutoNumBots && int(Level.NetMode) == int(NM_Standalone))
    {
        LevelMinPlayers = GetMinPlayers();
        // End:0x454
        if(bTeamGame && bMustHaveMultiplePlayers)
        {
            // End:0x43C
            if(LevelMinPlayers < 4)
            {
                LevelMinPlayers = 4;                
            }
            else
            {
                // End:0x451
                if((LevelMinPlayers & 1) == 1)
                {
                    LevelMinPlayers++;
                }
            }            
        }
        else
        {
            // End:0x468
            if(LevelMinPlayers < 2)
            {
                LevelMinPlayers = 2;
            }
        }
        InitialBots = Max(0, LevelMinPlayers - 1);        
    }
    else
    {
        MinPlayers = Clamp(GetIntOption(Options, "MinPlayers", MinPlayers), 0, 32);
        InitialBots = Clamp(GetIntOption(Options, "NumBots", InitialBots), 0, 32);
        // End:0x4D8
        if(bPlayersVsBots)
        {
            MinPlayers = 2;
        }
    }
    RemainingTime = 60 * TimeLimit;
    InOpt = ParseOption(Options, "WeaponStay");
    // End:0x539
    if(InOpt != "")
    {
        Log("WeaponStay: " $ string(bool(InOpt)));
        bWeaponStay = bool(InOpt);
    }
    // End:0x567
    if(bTournament)
    {
        bTournament = (GetIntOption(Options, "Tournament", 1)) > 0;        
    }
    else
    {
        bTournament = (GetIntOption(Options, "Tournament", 0)) > 0;
    }
    // End:0x598
    if(bTournament)
    {
        CheckReady();
    }
    bWaitForNetPlayers = int(Level.NetMode) != int(NM_Standalone);
    InOpt = ParseOption(Options, "QuickStart");
    // End:0x5E6
    if(InOpt != "")
    {
        bQuickStart = true;
    }
    AdjustedDifficulty = GameDifficulty;
    StartPlayerNum = GetIntOption(Options, "playernum", 0);
    //return;    
}

function TweakSkill(Bot B)
{
    // End:0x38
    if((!bTeamGame || int(Level.NetMode) != int(NM_Standalone)) || CurrentGameProfile == none)
    {
        return;        
    }
    else
    {
        // End:0x75
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.Team != B.PlayerReplicationInfo.Team)
        {
        }
    }
    B.Skill = FMax(B.Skill, AdjustedDifficulty + 0.2000000);
    //return;    
}

function int GetMinPlayers()
{
    // End:0x32
    if(CurrentGameProfile == none)
    {
        return Min(12, (Level.IdealPlayerCountMax + Level.IdealPlayerCountMin) / 2);
    }
    return Level.SinglePlayerTeamSize * 2;
    //return;    
}

function AcceptInventory(Pawn PlayerPawn)
{
    J0x00:
    // End:0x2C [Loop If]
    if(PlayerPawn.Inventory != none)
    {
        PlayerPawn.Inventory.Destroy();
        // [Loop Continue]
        goto J0x00;
    }
    PlayerPawn.Weapon = none;
    PlayerPawn.SelectedItem = none;
    AddDefaultInventory(PlayerPawn);
    //return;    
}

event bool CheckEndGameCondition()
{
    local int i;

    // End:0x34
    if(IsInState('MatchOver') == true)
    {
        Log("[CYH] Already in MatchOver state");
        return true;
    }
    // End:0x86
    if(Level.GetMatchMaker().bForceGameOver == true)
    {
        Level.GetMatchMaker().ForceGameOver(Level.GetLocalPlayerController().PlayerReplicationInfo);
        return true;
    }
    // End:0x108
    if(RemainingTime <= 0)
    {
        Log(("DeathMatch::CheckEndGameCondition() RemainingTime[" $ string(RemainingTime)) $ "] <= 0");
        EndGame(Level.GetLocalPlayerController().PlayerReplicationInfo, "TimeLimit");
        return true;        
    }
    else
    {
        i = 0;
        J0x10F:

        // End:0x19A [Loop If]
        if(i < GameReplicationInfo.PRIArray.Length)
        {
            // End:0x15C
            if(GameReplicationInfo.PRIArray[i] != none)
            {
                CheckScore(GameReplicationInfo.PRIArray[i]);
            }
            // End:0x190
            if(IsInState('MatchOver') == true)
            {
                Log("[CYH] Already in MatchOver state");
                return true;
            }
            i++;
            // [Loop Continue]
            goto J0x10F;
        }
    }
    return false;
    //return;    
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local Controller P, nextController;
    local PlayerController Player;
    local bool bLastMan;

    // End:0xA4
    if(bOverTime)
    {
        // End:0x1D
        if((NumBots + NumPlayers) == 0)
        {
            return true;
        }
        bLastMan = true;
        P = Level.ControllerList;
        J0x39:

        // End:0x99 [Loop If]
        if(P != none)
        {
            // End:0x82
            if((P.PlayerReplicationInfo != none) && !P.PlayerReplicationInfo.bOutOfLives)
            {
                bLastMan = false;
                // [Explicit Break]
                goto J0x99;
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x39;
        }
        J0x99:

        // End:0xA4
        if(bLastMan)
        {
            return true;
        }
    }
    bLastMan = Reason ~= "LastMan";
    // End:0xF5
    if((!bLastMan && GameRulesModifiers != none) && !GameRulesModifiers.CheckEndGame(Winner, Reason))
    {
        return false;
    }
    // End:0x1B4
    if(Winner == none)
    {
        P = Level.ControllerList;
        J0x114:

        // End:0x1B4 [Loop If]
        if(P != none)
        {
            // End:0x19D
            if((P.bIsPlayer && !P.PlayerReplicationInfo.bOutOfLives) && (Winner == none) || P.PlayerReplicationInfo.Score >= Winner.Score)
            {
                Winner = P.PlayerReplicationInfo;
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x114;
        }
    }
    // End:0x287
    if(!bLastMan)
    {
        P = Level.ControllerList;
        J0x1D3:

        // End:0x287 [Loop If]
        if(P != none)
        {
            // End:0x270
            if(((P.bIsPlayer && Winner != P.PlayerReplicationInfo) && P.PlayerReplicationInfo.Score == Winner.Score) && !P.PlayerReplicationInfo.bOutOfLives)
            {
                // End:0x26E
                if(!bOverTimeBroadcast)
                {
                    TieOnTimeOver();
                    bOverTimeBroadcast = true;
                }
                return false;
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x1D3;
        }
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    GameReplicationInfo.Winner = Winner;
    // End:0x2E7
    if(CurrentGameProfile != none)
    {
        CurrentGameProfile.bWonMatch = PlayerController(Winner.Owner) != none;
    }
    // End:0x30D
    if(bLastMan)
    {
        GameReplicationInfo.Winner = Winner.Team;
    }
    P = Level.ControllerList;
    J0x321:

    // End:0x364 [Loop If]
    if(P != none)
    {
        Player = PlayerController(P);
        // End:0x356
        if(Player != none)
        {
            Player.ClientFadeToBlackWhite();
        }
        P = nextController;
        // [Loop Continue]
        goto J0x321;
    }
    return true;
    //return;    
}

function PlayWinMessage(PlayerController Player, bool bWinner)
{
    // End:0x2A
    if(UnrealPlayer(Player) != none)
    {
        UnrealPlayer(Player).PlayWinMessage(bWinner);
    }
    //return;    
}

function bool AtCapacity(bool bSpectator)
{
    local Controller C;
    local bool bForcedSpectator;

    // End:0x1B
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return false;
    }
    // End:0x33
    if(bPlayersVsBots)
    {
        MaxPlayers = Min(MaxPlayers, 16);
    }
    // End:0x4B
    if(MaxLives <= 0)
    {
        return super(GameInfo).AtCapacity(bSpectator);
    }
    C = Level.ControllerList;
    J0x5F:

    // End:0xC3 [Loop If]
    if(C != none)
    {
        // End:0xAC
        if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.NumLives > LateEntryLives)
        {
            bForcedSpectator = true;
            // [Explicit Break]
            goto J0xC3;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x5F;
    }
    J0xC3:

    // End:0xDB
    if(!bForcedSpectator)
    {
        return super(GameInfo).AtCapacity(bSpectator);
    }
    return (NumPlayers + NumSpectators) >= (MaxPlayers + MaxSpectators);
    //return;    
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController NewPlayer;
    local Controller C;

    // End:0x9A
    if(MaxLives > 0)
    {
        C = Level.ControllerList;
        J0x1F:

        // End:0x9A [Loop If]
        if(C != none)
        {
            // End:0x83
            if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.NumLives > LateEntryLives)
            {
                Options = "?SpectatorOnly=1" $ Options;
                // [Explicit Break]
                goto J0x9A;
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x1F;
        }
    }
    J0x9A:

    NewPlayer = super.Login(Portal, Options, Error);
    // End:0xE8
    if(bMustJoinBeforeStart && GameReplicationInfo.bMatchHasBegun)
    {
        UnrealPlayer(NewPlayer).bLatecomer = true;
    }
    // End:0x169
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        // End:0x15E
        if(NewPlayer.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0x15B
            if(!bCustomBots && bAutoNumBots || bTeamGame && (float(InitialBots) % float(2)) == float(1))
            {
                InitialBots++;
            }            
        }
        else
        {
            StandalonePlayer = NewPlayer;
        }
    }
    return NewPlayer;
    //return;    
}

event PostLogin(PlayerController NewPlayer)
{
    super(GameInfo).PostLogin(NewPlayer);
    // End:0x53
    if(UnrealPlayer(NewPlayer) != none)
    {
        UnrealPlayer(NewPlayer).ClientReceiveLoginMenu(LoginMenuClass, bAlwaysShowLoginMenu);
        UnrealPlayer(NewPlayer).PlayStartupMessage(StartupStage);
    }
    //return;    
}

function ChangeLoadOut(PlayerController P, string LoadoutName)
{
    //return;    
}

function RestartPlayer(Controller aPlayer)
{
    Log("[DeathMatch::RestartPlayer] name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    // End:0xCB
    if((bMustJoinBeforeStart && UnrealPlayer(aPlayer) != none) && UnrealPlayer(aPlayer).bLatecomer)
    {
        Log("[DeathMatch::RestartPlayer] bMustJoinBeforeStart lateComer=" $ string(UnrealPlayer(aPlayer).bLatecomer));
        return;
    }
    // End:0x112
    if(aPlayer.PlayerReplicationInfo.bOutOfLives)
    {
        Log("[DeathMatch::RestartPlayer] outloflies");
        return;
    }
    // End:0x171
    if(aPlayer.IsA('Bot') && TooManyBots(aPlayer))
    {
        Log("[DeathMatch::RestartPlayer] too many bots");
        aPlayer.Destroy();
        return;
    }
    super(GameInfo).RestartPlayer(aPlayer);
    //return;    
}

function bool TooManyBots(Controller botToRemove)
{
    // End:0x40
    if((int(Level.NetMode) != int(NM_Standalone)) && bPlayersVsBots)
    {
        return NumBots > Min(16, int(BotRatio * float(NumPlayers)));
    }
    // End:0x53
    if(bPlayerBecameActive)
    {
        bPlayerBecameActive = false;
        return true;
    }
    return super.TooManyBots(botToRemove);
    //return;    
}

function ForceAddBot()
{
    // End:0x38
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        MinPlayers = Max(MinPlayers + 1, (NumPlayers + NumBots) + 1);
    }
    AddBot();
    //return;    
}

function bool AddBot(optional string botname)
{
    local Bot NewBot;

    NewBot = SpawnBot(botname);
    // End:0x36
    if(NewBot == none)
    {
        Warn("Failed to spawn bot.");
        return false;
    }
    BroadcastLocalizedMessage(GameMessageClass, 1, NewBot.PlayerReplicationInfo);
    NewBot.PlayerReplicationInfo.PlayerID = CurrentID++;
    NumBots++;
    // End:0x9D
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        RestartPlayer(NewBot);        
    }
    else
    {
        NewBot.GotoState('Dead', 'MPStart');
    }
    return true;
    //return;    
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    // End:0x33
    if(UnrealPawn(PlayerPawn) != none)
    {
        UnrealPawn(PlayerPawn).AddDefaultInventory();
        PlayerPawn.AddDefaultSkills();
    }
    SetPlayerDefaults(PlayerPawn);
    //return;    
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
    // End:0x0D
    if(ViewTarget == none)
    {
        return false;
    }
    // End:0x58
    if(Controller(ViewTarget) != none)
    {
        return (Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
    }
    return (int(Level.NetMode) == int(NM_Standalone)) || bOnlySpectator;
    //return;    
}

function bool ShouldRespawn(Pickup Other)
{
    return Other.RespawnTime != 0.0000000;
    //return;    
}

function ChangeName(Controller Other, string S, bool bNameChange)
{
    local Controller aPlayer, C, P;

    // End:0x0E
    if(S == "")
    {
        return;
    }
    S = StripColor(S);
    // End:0x42
    if(Other.PlayerReplicationInfo.PlayerName ~= S)
    {
        return;
    }
    S = Left(S, 20);
    ReplaceText(S, " ", "_");
    ReplaceText(S, "|", "I");
    // End:0x10A
    if(bEpicNames && Bot(Other) != none)
    {
        // End:0xC6
        if(TotalEpic < 21)
        {
            S = EpicNames[int(float(EpicOffset) % float(21))];
            EpicOffset++;
            TotalEpic++;            
        }
        else
        {
            S = (NamePrefixes[int(float(NameNumber) % float(10))] $ "CliffyB") $ NameSuffixes[int(float(NameNumber) % float(10))];
            NameNumber++;
        }
    }
    aPlayer = Level.ControllerList;
    J0x11E:

    // End:0x2FF [Loop If]
    if(aPlayer != none)
    {
        // End:0x2E8
        if(aPlayer.bIsPlayer && aPlayer.PlayerReplicationInfo.PlayerName ~= S)
        {
            // End:0x192
            if(Other.IsA('PlayerController'))
            {
                PlayerController(Other).ReceiveLocalizedMessage(GameMessageClass, 8);
                return;                
            }
            else
            {
                // End:0x1D2
                if(Other.PlayerReplicationInfo.bIsFemale)
                {
                    S = FemaleBackupNames[int(float(FemaleBackupNameOffset) % float(32))];
                    FemaleBackupNameOffset++;                    
                }
                else
                {
                    S = MaleBackupNames[int(float(MaleBackupNameOffset) % float(32))];
                    MaleBackupNameOffset++;
                }
                P = Level.ControllerList;
                J0x208:

                // End:0x2A2 [Loop If]
                if(P != none)
                {
                    // End:0x28B
                    if(P.bIsPlayer && P.PlayerReplicationInfo.PlayerName ~= S)
                    {
                        S = (NamePrefixes[int(float(NameNumber) % float(10))] $ S) $ NameSuffixes[int(float(NameNumber) % float(10))];
                        NameNumber++;
                        // [Explicit Break]
                        goto J0x2A2;
                    }
                    P = P.nextController;
                    // [Loop Continue]
                    goto J0x208;
                }
                J0x2A2:

                // [Explicit Break]
                goto J0x2FF;
            }
            S = (NamePrefixes[int(float(NameNumber) % float(10))] $ S) $ NameSuffixes[int(float(NameNumber) % float(10))];
            NameNumber++;
            // [Explicit Break]
            goto J0x2FF;
        }
        aPlayer = aPlayer.nextController;
        // [Loop Continue]
        goto J0x11E;
    }
    J0x2FF:

    // End:0x32D
    if(bNameChange)
    {
        GameEvent("NameChange", S, Other.PlayerReplicationInfo);
    }
    // End:0x348
    if(S ~= "CliffyB")
    {
        bEpicNames = true;
    }
    Other.PlayerReplicationInfo.SetPlayerName(S);
    // End:0x3FD
    if(bNameChange)
    {
        C = Level.ControllerList;
        J0x382:

        // End:0x3FD [Loop If]
        if(C != none)
        {
            // End:0x3E6
            if((PlayerController(C) != none) && Viewport(PlayerController(C).Player) != none)
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.GameMessage', 2, Other.PlayerReplicationInfo);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x382;
        }
    }
    //return;    
}

function bool BecomeSpectator(PlayerController P)
{
    // End:0x12
    if(!super(GameInfo).BecomeSpectator(P))
    {
        return false;
    }
    // End:0x24
    if(!bKillBots)
    {
        RemainingBots++;
    }
    // End:0x41
    if(!NeedPlayers() || AddBot())
    {
        RemainingBots--;
    }
    return true;
    //return;    
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
    // End:0x49
    if(super(GameInfo).AllowBecomeActivePlayer(P))
    {
        // End:0x47
        if((int(Level.NetMode) == int(NM_Standalone)) && NumBots > InitialBots)
        {
            RemainingBots--;
            bPlayerBecameActive = true;
        }
        return true;
    }
    return false;
    //return;    
}

function Logout(Controller Exiting)
{
    super(GameInfo).Logout(Exiting);
    // End:0x26
    if(Exiting.IsA('Bot'))
    {
        NumBots--;
    }
    // End:0x38
    if(!bKillBots)
    {
        RemainingBots++;
    }
    // End:0x55
    if(!NeedPlayers() || AddBot())
    {
        RemainingBots--;
    }
    // End:0x67
    if(MaxLives > 0)
    {
        CheckMaxLives(none);
    }
    //return;    
}

function bool NeedPlayers()
{
    // End:0x22
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return RemainingBots > 0;
    }
    // End:0x2D
    if(bMustJoinBeforeStart)
    {
        return false;
    }
    // End:0x52
    if(bPlayersVsBots)
    {
        return NumBots < Min(16, int(BotRatio * float(NumPlayers)));
    }
    return (NumPlayers + NumBots) < MinPlayers;
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    super.GetServerDetails(ServerState);
    AddServerDetail(ServerState, "GoalScore", string(GoalScore));
    AddServerDetail(ServerState, "TimeLimit", string(TimeLimit));
    AddServerDetail(ServerState, "Translocator", string(bAllowTrans));
    AddServerDetail(ServerState, "WeaponStay", string(bWeaponStay));
    AddServerDetail(ServerState, "ForceRespawn", string(bForceRespawn));
    //return;    
}

function InitGameReplicationInfo()
{
    super(GameInfo).InitGameReplicationInfo();
    GameReplicationInfo.GoalScore = GoalScore;
    GameReplicationInfo.TimeLimit = TimeLimit;
    GameReplicationInfo.MinNetPlayers = MinNetPlayers;
    //return;    
}

function InitTeamSymbols()
{
    //return;    
}

function UnrealTeamInfo GetBotTeam(optional int TeamBots)
{
    local Class<UnrealTeamInfo> RosterClass;

    Log("DeathMatch::GetBotTeam");
    // End:0x2B
    if(EnemyRoster != none)
    {
        return EnemyRoster;
    }
    // End:0x122
    if(CurrentGameProfile != none)
    {
        // End:0xE3
        if(CurrentGameProfile.EnemyTeam != "")
        {
            RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(CurrentGameProfile.EnemyTeam, Class'Core.Class'));
            // End:0xD2
            if(RosterClass == none)
            {
                Warn(("Invalid EnemyTeam class:" @ CurrentGameProfile.EnemyTeam) @ " Expecting subclass of UnrealTeamInfo");                
            }
            else
            {
                EnemyRoster = Spawn(RosterClass);
            }            
        }
        else
        {
            Log("No EnemyTeam set in CurrentGameProfile, is this correct?");
        }        
    }
    else
    {
        // End:0x162
        if(EnemyRosterName != "")
        {
            RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(EnemyRosterName, Class'Core.Class'));
            // End:0x162
            if(RosterClass != none)
            {
                EnemyRoster = Spawn(RosterClass);
            }
        }
    }
    // End:0x1A1
    if(EnemyRoster == none)
    {
        RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(DefaultEnemyRosterClass, Class'Core.Class'));
        // End:0x1A1
        if(RosterClass != none)
        {
            EnemyRoster = Spawn(RosterClass);
        }
    }
    EnemyRoster.Initialize(TeamBots);
    return EnemyRoster;
    //return;    
}

function UnrealTeamInfo GetBotTeam2(bool forceTeam, int Team)
{
    return GetBotTeam();
    //return;    
}

function PreLoadNamedBot(string botname)
{
    EnemyRoster.AddNamedBot(botname);
    //return;    
}

function PreLoadBot()
{
    EnemyRoster.AddRandomPlayer();
    //return;    
}

function Bot SpawnBot(optional string botname)
{
    local Bot NewBot;
    local RosterEntry Chosen;
    local UnrealTeamInfo BotTeam;
    local string FullName;

    BotTeam = GetBotTeam();
    FullName = string(BotTeam.Name);
    Log("fullname:" $ FullName);
    // End:0x6E
    if(FullName == "wTeamRoster1")
    {
        Chosen = BotTeam.ChooseBotClass("B-Camo");        
    }
    else
    {
        // End:0xA8
        if(FullName == "wTeamRoster0")
        {
            Chosen = BotTeam.ChooseBotClass("B-normal");            
        }
        else
        {
            Chosen = BotTeam.ChooseBotClass("B-normal");
        }
    }
    // End:0xEA
    if(Chosen.PawnClass == none)
    {
        Chosen.Init();
    }
    NewBot = Bot(Spawn(Chosen.PawnClass.default.ControllerClass));
    // End:0x12F
    if(NewBot != none)
    {
        InitializeBot(NewBot, BotTeam, Chosen);
    }
    return NewBot;
    //return;    
}

function InitializeBot(Bot NewBot, UnrealTeamInfo BotTeam, RosterEntry Chosen)
{
    NewBot.InitializeSkill(AdjustedDifficulty);
    Chosen.InitBot(NewBot);
    BotTeam.AddToTeam(NewBot);
    // End:0x6E
    if(Chosen.ModifiedPlayerName != "")
    {
        ChangeName(NewBot, Chosen.ModifiedPlayerName, false);        
    }
    else
    {
        ChangeName(NewBot, Chosen.PlayerName, false);
    }
    // End:0x111
    if(bEpicNames && NewBot.PlayerReplicationInfo.PlayerName ~= "The_Reaper")
    {
        NewBot.Accuracy = 1.0000000;
        NewBot.StrafingAbility = 1.0000000;
        NewBot.Tactics = 1.0000000;
        NewBot.InitializeSkill(AdjustedDifficulty + float(2));
    }
    BotTeam.SetBotOrders(NewBot, Chosen);
    //return;    
}

function InitPlacedBot(Controller C, RosterEntry R)
{
    local UnrealTeamInfo BotTeam;

    Log("Init placed bot " $ string(C));
    BotTeam = FindTeamFor(C);
    // End:0x7B
    if(Bot(C) != none)
    {
        Bot(C).InitializeSkill(AdjustedDifficulty);
        // End:0x7B
        if(R != none)
        {
            R.InitBot(Bot(C));
        }
    }
    BotTeam.AddToTeam(C);
    // End:0xB4
    if(R != none)
    {
        ChangeName(C, R.PlayerName, false);
    }
    //return;    
}

function UnrealTeamInfo FindTeamFor(Controller C)
{
    return GetBotTeam();
    //return;    
}

function StartMatch()
{
    local bool bTemp;
    local int Num;

    crlog("[DeathMatch::StartMatch]");
    GotoState('MatchInProgress');
    GameReplicationInfo.bStartedMatch = true;
    // End:0x5F
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        RemainingBots = InitialBots;        
    }
    else
    {
        RemainingBots = 0;
    }
    // End:0x9A
    if(bChangedHost)
    {
        RemainingTime = GameReplicationInfo.RemainingTime;
        ElapsedTime = GameReplicationInfo.ElapsedTime;        
    }
    else
    {
        GameReplicationInfo.RemainingMinute = RemainingTime;
    }
    super(GameInfo).StartMatch();
    bTemp = bMustJoinBeforeStart;
    bMustJoinBeforeStart = false;
    J0xC9:

    // End:0xFA [Loop If]
    if((NeedPlayers()) && Num < 16)
    {
        // End:0xF0
        if(AddBot())
        {
            RemainingBots--;
        }
        Num++;
        // [Loop Continue]
        goto J0xC9;
    }
    bMustJoinBeforeStart = bTemp;
    Log("START MATCH");
    // End:0x12D
    if(!IsA('wSDGameInfo'))
    {
        deleAnnounceMatchInfo();
    }
    BalanceBots();
    //return;    
}

function BalanceBots()
{
    local int AF, rsa, afAdd, rsaAdd, lp1;

    local Controller C;
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    // End:0x238
    if(MM.PlayWithBots)
    {
        C = Level.ControllerList;
        J0x3B:

        // End:0xC7 [Loop If]
        if(C != none)
        {
            // End:0xB0
            if(C.bIsPlayer && !C.PlayerReplicationInfo.bAdminSpecator)
            {
                // End:0xA9
                if(bTeamGame)
                {
                    // End:0x9F
                    if(C.GetTeamNum() == 0)
                    {
                        AF++;                        
                    }
                    else
                    {
                        rsa++;
                    }                    
                }
                else
                {
                    AF++;
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x3B;
        }
        lp1 = 0;
        J0xCE:

        // End:0x10F [Loop If]
        if(lp1 < AddBotQueue.Length)
        {
            // End:0xFE
            if(AddBotQueue[lp1].Team == 0)
            {
                AF++;
                // [Explicit Continue]
                goto J0x105;
            }
            rsa++;
            J0x105:

            lp1++;
            // [Loop Continue]
            goto J0xCE;
        }
        afAdd = MM.BotNum0 - AF;
        // End:0x163
        if(afAdd > 0)
        {
            AddwAIBot(string(afAdd), "0", "WGame.wAIBot", string(MM.BotDifficulty));
        }
        rsaAdd = MM.BotNum1 - rsa;
        // End:0x1B7
        if(rsaAdd > 0)
        {
            AddwAIBot(string(rsaAdd), "1", "WGame.wAIBot", string(MM.BotDifficulty));
        }
        // End:0x219
        if(bTeamGame)
        {
            // End:0x1EB
            if(afAdd < 0)
            {
                Level.AILevel.KillBotsTeam(-afAdd, 0);
            }
            // End:0x216
            if(rsaAdd < 0)
            {
                Level.AILevel.KillBotsTeam(-rsaAdd, 1);
            }            
        }
        else
        {
            Level.AILevel.KillBots(-afAdd);
        }
    }
    //return;    
}

delegate deleAnnounceMatchInfo()
{
    //return;    
}

function AnnounceMatchInfo()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0xA4 [Loop If]
    if(C != none)
    {
        // End:0x8D
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).QueueAnnouncement(Class'Engine.wGameManager'.default.VoicePackageName $ string(sndModeName), 1);
            PlayerController(C).QueueAnnouncement(Class'Engine.wGameManager'.default.VoicePackageName $ string(sndModeExplain), 1);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function EndGame(PlayerReplicationInfo Winner, string Reason)
{
    // End:0xCB
    if(((((Reason ~= "triggered") || Reason ~= "LastMan") || Reason ~= "TimeLimit") || Reason ~= "FragLimit") || Reason ~= "TeamScoreLimit")
    {
        crlog("[DeathMatch::EndGame] Reason=" $ Reason);
        super(GameInfo).EndGame(Winner, Reason);
        // End:0xCB
        if(bGameEnded)
        {
            SetGameEndType(Reason);
            GotoState('MatchOver');
        }
    }
    //return;    
}

function SetGameEndType(string Reason)
{
    // End:0x7A
    if(((Reason ~= "TeamScoreLimit") || Reason ~= "FragLimit") || Reason ~= "roundlimit")
    {
        Level.GetMatchMaker().GameEndType = Level.GetMatchMaker().6;        
    }
    else
    {
        // End:0xC0
        if(Reason ~= "TimeLimit")
        {
            Level.GetMatchMaker().GameEndType = Level.GetMatchMaker().1;            
        }
        else
        {
            // End:0x104
            if(Reason ~= "LastMan")
            {
                Level.GetMatchMaker().GameEndType = Level.GetMatchMaker().11;                
            }
            else
            {
                Level.GetMatchMaker().GameEndType = Level.GetMatchMaker().10;
            }
        }
    }
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint Best;

    // End:0x35
    if((Player != none) && Player.StartSpot != none)
    {
        LastPlayerStartSpot = Player.StartSpot;
    }
    Best = super(GameInfo).FindPlayerStart(Player, inTeam, incomingName);
    // End:0x66
    if(Best != none)
    {
        LastStartSpot = Best;
    }
    return Best;
    //return;    
}

function PlayEndOfMatchMessage()
{
    //return;    
}

function PlayStartupMessage()
{
    local Controller P;

    P = Level.ControllerList;
    J0x14:

    // End:0x5F [Loop If]
    if(P != none)
    {
        // End:0x48
        if(UnrealPlayer(P) != none)
        {
            UnrealPlayer(P).PlayStartupMessage(StartupStage);
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function int GetNetWait()
{
    // End:0x25
    if(Level.GetMatchMaker().kClanMatch_InChannel)
    {
        return NetWaitClan;        
    }
    else
    {
        return NetWait;
    }
    //return;    
}

function AnnounceTimesUp()
{
    local Controller P;

    P = Level.ControllerList;
    J0x14:

    // End:0x96 [Loop If]
    if(P != none)
    {
        // End:0x7F
        if(P.IsA('PlayerController') && !P.PlayerReplicationInfo.bOnlySpectator)
        {
            PlayerController(P).QueueAnnouncement(Class'Engine.wGameManager'.default.VoicePackageName $ string(VoiceTimesUp), 1);
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function GameAddDefaultInventory(Pawn P)
{
    Log("[DeathMatch::GameAddDefaultInventory]");
    InventoryList[InventoryList.Length] = P;
    InventoryListLastTime = Level.TimeSeconds;
    //return;    
}

function ProcessDefaultInv()
{
    local Pawn P;

    // End:0x4E
    if((Level.TimeSeconds - InventoryListLastTime) > 0.1000000)
    {
        J0x1F:

        // End:0x4E [Loop If]
        if(InventoryList.Length > 0)
        {
            P = InventoryList[0];
            InventoryList.Remove(0, 1);
            AddDefaultInventory(P);
            // [Loop Continue]
            goto J0x1F;
        }
    }
    //return;    
}

function UpdateVehicles()
{
    local Vehicle V;

    Log("[DeathMatch::UpdateVehicles]");
    Vehicles.Remove(0, Vehicles.Length);
    // End:0x50
    foreach DynamicActors(Class'Engine.Vehicle', V)
    {
        Vehicles[Vehicles.Length] = V;        
    }    
    //return;    
}

event ForcedStartMatch()
{
    GotoState('ChangeHost');
    //return;    
}

function CalcItemUsedTimeAll()
{
    local Pawn P;

    Log("[DeathMatch::CalcItemUsedTimeAll]");
    // End:0x93
    foreach DynamicActors(Class'Engine.Pawn', P)
    {
        P.CalcItemUsedTimeSelf();
        // End:0x92
        if(P.PlayerReplicationInfo != none)
        {
            Level.GetMatchMaker().GetUserInfoByUserName(P.PlayerReplicationInfo.PlayerName).LogUsedStatus();
        }        
    }    
    //return;    
}

function OnKillingDropOut(Pawn P)
{
    //return;    
}

function RecoverHelicopter(Pawn P)
{
    local Controller C;
    local bool bDestroyed;

    Log("[RecoverHelicopter]");
    bDestroyed = false;
    // End:0xA6
    foreach DynamicActors(Class'Engine.Controller', C)
    {
        // End:0xA5
        if(C.PlayerReplicationInfo.PlayerName == P.OwnerName)
        {
            Log("[RecoverHelicopter] found controller");
            PlayerController(C).ServerCallHelicopter(P);
            bDestroyed = true;
            // End:0xA6
            break;
        }        
    }    
    // End:0xD5
    if(!bDestroyed)
    {
        P.Died(none, Class'Engine.wDamageChangedHost', P.Location);
    }
    //return;    
}

function ContinueMatch()
{
    local Pawn P;
    local Actor A;

    Log("DathMatch::ContinueMatch()");
    StartMatch();
    AllReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_ContinueFromChangeHost);
    // End:0x5D
    foreach DynamicActors(Class'Engine.Actor', A)
    {
        A.RecoverFromHostChange();        
    }    
    // End:0x12B
    foreach DynamicActors(Class'Engine.Pawn', P)
    {
        // End:0x12A
        if(P.Controller == none)
        {
            // End:0xA4
            if(P.IsA('wHelicopter'))
            {
                RecoverHelicopter(P);
                // End:0x12A
                continue;
            }
            // End:0x12A
            if(P.IsA('wPawn'))
            {
                OnKillingDropOut(P);
                Log("DeathMatch::ContinueMatch() Pawn died because Controller is none");
                P.Died(none, Class'Engine.wDamageChangedHost', P.Location);
            }
        }        
    }    
    GetUserBackToVehicle();
    bChangedHost = false;
    //return;    
}

function GetUserBackToVehicle()
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:

    // End:0x73 [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x5C
        if(PC != none)
        {
            Class'Engine.wGameStateStorageGetter'.static.GetUserVehicle(PC.GSSS, PC);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function ChangeHostExtraWork()
{
    //return;    
}

function bool CheckLives(PlayerReplicationInfo Scorer)
{
    local Controller C;
    local PlayerReplicationInfo Living;
    local bool bNoneLeft, bCheck;

    bCheck = true;
    // End:0x2D
    if(IsA('wDeathMatch'))
    {
        // End:0x2D
        if((NumPlayers + NumBots) > 1)
        {
            bCheck = false;
        }
    }
    // End:0x23B
    if(bCheck)
    {
        // End:0x62
        if((Scorer != none) && !Scorer.bOutOfLives)
        {
            Living = Scorer;
        }
        bNoneLeft = true;
        C = Level.ControllerList;
        J0x7E:

        // End:0x1D5 [Loop If]
        if(C != none)
        {
            // End:0x1BE
            if((((C.PlayerReplicationInfo != none) && C.bIsPlayer) && !C.PlayerReplicationInfo.bOnlySpectator) && !C.PlayerReplicationInfo.bAdminSpecator)
            {
                // End:0x111
                if(Living == none)
                {
                    Living = C.PlayerReplicationInfo;                    
                }
                else
                {
                    // End:0x1BE
                    if(C.PlayerReplicationInfo != Living)
                    {
                        // End:0x142
                        if(IsA('wDeathMatch'))
                        {
                            bNoneLeft = false;
                            // [Explicit Break]
                            goto J0x1D5;                            
                        }
                        else
                        {
                            // End:0x1BE
                            if(((C.PlayerReplicationInfo.Team != none) && Living.Team != none) && C.PlayerReplicationInfo.Team.TeamIndex != Living.Team.TeamIndex)
                            {
                                bNoneLeft = false;
                                // [Explicit Break]
                                goto J0x1D5;
                            }
                        }
                    }
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x7E;
        }
        J0x1D5:

        // End:0x1E9
        if(AddBotQueue.Length > 0)
        {
            bNoneLeft = false;
        }
        // End:0x23B
        if(bNoneLeft)
        {
            GameReplicationInfo.RoundState = 3;
            // End:0x225
            if(Living != none)
            {
                EndGame(Living, "LastMan");                
            }
            else
            {
                EndGame(Scorer, "LastMan");
            }
            return true;
        }
    }
    return false;
    //return;    
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart P;
    local float Score, NextDist;
    local Controller OtherPlayer;
    local float fTemp;

    // End:0x1F
    if(Player.IsA('wPlayer'))
    {
        fTemp = 1.0000000;
    }
    P = PlayerStart(N);
    // End:0x73
    if(((P == none) || !P.bEnabled) || P.PhysicsVolume.bWaterVolume)
    {
        return -10000000.0000000;
    }
    // End:0x11E
    if(Level.bUseSDRespawnInTeamGame && Level.GRI.GameClass ~= "WGame.wTeamGame")
    {
        // End:0xD3
        if(!P.IsA('PlayerStart_SD'))
        {
            return -10000000.0000000;            
        }
        else
        {
            // End:0xFF
            if(int(Team) == 0)
            {
                // End:0xFC
                if(!P.IsA('PlayerStart_SD_ATTACKER'))
                {
                    return -10000000.0000000;
                }                
            }
            else
            {
                // End:0x11B
                if(!P.IsA('PlayerStart_SD_PROTECTOR'))
                {
                    return -10000000.0000000;
                }
            }
        }        
    }
    else
    {
        // End:0x14E
        if(P.IsA('PlayerStart_DOM') || P.IsA('PlayerStart_SD'))
        {
            return -10000000.0000000;
        }
    }
    Score = 1000000.0000000;
    Score += (FMax(float(NumPlayers + NumBots) * 0.4000000, 2.0000000) * VSize(P.Location - Player.Location));
    OtherPlayer = Level.ControllerList;
    J0x1B2:

    // End:0x326 [Loop If]
    if(OtherPlayer != none)
    {
        // End:0x30F
        if(OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none)
        {
            NextDist = VSize(OtherPlayer.Pawn.Location - P.Location);
            // End:0x254
            if(NextDist < (OtherPlayer.Pawn.CollisionRadius + OtherPlayer.Pawn.CollisionHeight))
            {
                return -1000000.0000000;
            }
            // End:0x2B3
            if((OtherPlayer.GetTeamNum() == int(Team)) && Locs(Level.GRI.GameClass) != Locs("WGame.wDeathMatch"))
            {
                Score -= NextDist;                
            }
            else
            {
                // End:0x2EF
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
        goto J0x1B2;
    }
    Score -= float(Rand(10000 * ((NumPlayers + NumBots) / 16)));
    return FMax(Score, 5.0000000);
    //return;    
}

function bool CheckMaxLives(PlayerReplicationInfo Scorer)
{
    local Controller C;
    local PlayerReplicationInfo Living;
    local bool bNoneLeft;

    // End:0x161
    if(MaxLives > 0)
    {
        // End:0x37
        if((Scorer != none) && !Scorer.bOutOfLives)
        {
            Living = Scorer;
        }
        bNoneLeft = true;
        C = Level.ControllerList;
        J0x53:

        // End:0x120 [Loop If]
        if(C != none)
        {
            // End:0x109
            if((((C.PlayerReplicationInfo != none) && C.bIsPlayer) && !C.PlayerReplicationInfo.bOutOfLives) && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                // End:0xE6
                if(Living == none)
                {
                    Living = C.PlayerReplicationInfo;                    
                }
                else
                {
                    // End:0x109
                    if(C.PlayerReplicationInfo != Living)
                    {
                        bNoneLeft = false;
                        // [Explicit Break]
                        goto J0x120;
                    }
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x53;
        }
        J0x120:

        // End:0x161
        if(bNoneLeft)
        {
            // End:0x14B
            if(Living != none)
            {
                EndGame(Living, "LastMan");                
            }
            else
            {
                EndGame(Scorer, "LastMan");
            }
            return true;
        }
    }
    return false;
    //return;    
}

function CheckScore(PlayerReplicationInfo Scorer)
{
    local Controller C;

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
    // End:0x132
    if(Scorer != none)
    {
        // End:0x81
        if((GoalScore > 0) && Scorer.Score >= float(GoalScore))
        {
            EndGame(Scorer, "fraglimit");            
        }
        else
        {
            // End:0x132
            if(bOverTime)
            {
                C = Level.ControllerList;
                J0x9E:

                // End:0x11C [Loop If]
                if(C != none)
                {
                    // End:0x105
                    if(((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo != Scorer) && C.PlayerReplicationInfo.Score >= Scorer.Score)
                    {
                        return;
                    }
                    C = C.nextController;
                    // [Loop Continue]
                    goto J0x9E;
                }
                EndGame(Scorer, "fraglimit");
            }
        }
    }
    //return;    
}

function ScoreObjective(PlayerReplicationInfo Scorer, float Score)
{
    // End:0x40
    if(Scorer != none)
    {
        Scorer.Score += Score;
        ScoreEvent(Scorer, Score, "ObjectiveScore");
    }
    // End:0x66
    if(GameRulesModifiers != none)
    {
        GameRulesModifiers.ScoreObjective(Scorer, int(Score));
    }
    CheckScore(Scorer);
    //return;    
}

function ScoreKill(Controller Killer, Controller Other)
{
    local PlayerReplicationInfo OtherPRI;

    OtherPRI = Other.PlayerReplicationInfo;
    // End:0x55
    if(OtherPRI != none)
    {
        // End:0x55
        if((MaxLives > 0) && OtherPRI.NumLives >= MaxLives)
        {
            OtherPRI.bOutOfLives = true;
        }
    }
    super(GameInfo).ScoreKill(Killer, Other);
    // End:0x7F
    if((Killer == none) || Other == none)
    {
        return;
    }
    // End:0x112
    if(bAdjustSkill && Killer.IsA('PlayerController') || Other.IsA('PlayerController'))
    {
        // End:0xE3
        if(Killer.IsA('AIController'))
        {
            AdjustSkill(AIController(Killer), PlayerController(Other), true);
        }
        // End:0x112
        if(Other.IsA('AIController'))
        {
            AdjustSkill(AIController(Other), PlayerController(Killer), false);
        }
    }
    //return;    
}

function AdjustSkill(AIController B, PlayerController P, bool bWinner)
{
    // End:0x7D
    if(bWinner)
    {
        PlayerKills += 1;
        AdjustedDifficulty = FMax(0.0000000, AdjustedDifficulty - (2.0000000 / FMin(float(PlayerKills), 10.0000000)));
        // End:0x7A
        if(B.Skill > AdjustedDifficulty)
        {
            B.Skill = AdjustedDifficulty;
            Bot(B).ResetSkill();
        }        
    }
    else
    {
        PlayerDeaths += 1;
        AdjustedDifficulty = FMin(7.0000000, AdjustedDifficulty + (2.0000000 / FMin(float(PlayerDeaths), 10.0000000)));
        // End:0xDA
        if(B.Skill < AdjustedDifficulty)
        {
            B.Skill = AdjustedDifficulty;
        }
    }
    // End:0xFE
    if(Abs(AdjustedDifficulty - GameDifficulty) >= float(1))
    {
        GameDifficulty = AdjustedDifficulty;
        SaveConfig();
    }
    //return;    
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
    // End:0x6C
    if((((instigatedBy != none) && instigatedBy != injured) && (Level.TimeSeconds - injured.SpawnTime) < SpawnProtectionTime) && (Class<WeaponDamageType>(DamageType) != none) || Class<VehicleDamageType>(DamageType) != none)
    {
        return 0;
    }
    Damage = super(GameInfo).ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    // End:0xA7
    if(instigatedBy == none)
    {
        return Damage;
    }
    return int(float(Damage) * instigatedBy.DamageScaling);
    //return;    
}

exec function setFakeUID()
{
    GiveBotsFakeUID = !GiveBotsFakeUID;
    clog("GiveBotsFakeUID=" $ string(GiveBotsFakeUID));
    //return;    
}

exec function dobalancebots()
{
    BalanceBots();
    //return;    
}

exec function AddNamedBot(string botname)
{
    // End:0x38
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        MinPlayers = Max(MinPlayers + 1, (NumPlayers + NumBots) + 1);
    }
    AddBot(botname);
    //return;    
}

exec function AddBots(int Num)
{
    Num = Clamp(Num, 0, 32 - (NumPlayers + NumBots));
    J0x1E:

    // End:0x6C [Loop If]
    if(--Num >= 0)
    {
        // End:0x63
        if(int(Level.NetMode) != int(NM_Standalone))
        {
            MinPlayers = Max(MinPlayers + 1, (NumPlayers + NumBots) + 1);
        }
        AddBot();
        // [Loop Continue]
        goto J0x1E;
    }
    //return;    
}

exec function KillBots(int Num)
{
    local Controller C, NextC;

    bPlayersVsBots = false;
    // End:0x1E
    if(Num == 0)
    {
        Num = NumBots;
    }
    C = Level.ControllerList;
    // End:0x52
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        MinPlayers = 0;
    }
    bKillBots = true;
    J0x5A:

    // End:0xBA [Loop If]
    if((C != none) && Num > 0)
    {
        NextC = C.nextController;
        // End:0xAC
        if(C.IsA('Bot'))
        {
            Kill(C);
            --Num;
        }
        C = NextC;
        // [Loop Continue]
        goto J0x5A;
    }
    bKillBots = false;
    //return;    
}

function Kill(Controller C)
{
    local array<int> BotID;

    // End:0x38
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        MinPlayers = Max(MinPlayers - 1, (NumPlayers + NumBots) - 1);
    }
    // End:0xBA
    if((Vehicle(C.Pawn) != none) && Vehicle(C.Pawn).Driver != none)
    {
        Vehicle(C.Pawn).Driver.KilledBy(Vehicle(C.Pawn).Driver);        
    }
    else
    {
        // End:0xF4
        if(C.Pawn != none)
        {
            C.Pawn.KilledBy(C.Pawn);
        }
    }
    // End:0x1AC
    if(C != none)
    {
        // End:0x190
        if(C.PlayerReplicationInfo.bBot && C.PlayerReplicationInfo.UID != -1)
        {
            BotID[0] = C.PlayerReplicationInfo.UID;
            BTSend.sfReqReturnBotID(BotID);
            Log("sfReqReturnBotID " $ string(BotID[0]));
        }
        C.GotoState('Dead');
        C.Destroy();
    }
    //return;    
}

exec function Killaibots(optional int Num)
{
    // End:0x16
    if(Num == 0)
    {
        Num = 999;
    }
    Level.GetAILevel().KillBots(999);
    //return;    
}

function EnqueueAddBot(Class<Controller> BotClass, int Team, int Grade, int NPCID)
{
    local AddBotInfo i;

    i.BotClass = BotClass;
    i.Team = Team;
    i.Grade = Grade;
    i.NPCID = NPCID;
    AddBotQueue[AddBotQueue.Length] = i;
    //return;    
}

function HandleGetBotID(int Team, array<int> BotID)
{
    local int lp1;
    local AddBotInfo cur;
    local Controller Bot;
    local UnrealTeamInfo BotTeam;

    dblog((("[DeathMatch::HandleGetBotID] AddBotQueue=" $ string(AddBotQueue.Length)) $ " BotID=") $ string(BotID.Length));
    lp1 = AddBotQueue.Length - 1;
    J0x5F:

    // End:0x19F [Loop If]
    if((lp1 >= 0) && BotID.Length > 0)
    {
        cur = AddBotQueue[lp1];
        // End:0x195
        if(Team == cur.Team)
        {
            Bot = Spawn(cur.BotClass);
            // End:0x195
            if(Bot != none)
            {
                NumBots++;
                Bot.PlayerReplicationInfo.PlayerID = CurrentID++;
                Bot.PlayerReplicationInfo.NPCID = cur.NPCID;
                Bot.PlayerReplicationInfo.UID = BotID[BotID.Length - 1];
                BotID.Remove(BotID.Length - 1, 1);
                AddBotQueue.Remove(lp1, 1);
                BotTeam = GetBotTeam2(true, Team);
                BotTeam.AddToTeam(Bot);
                Bot.InitBot(cur.Grade);
                Bot.GotoState('Dead');
            }
        }
        lp1--;
        // [Loop Continue]
        goto J0x5F;
    }
    //return;    
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    dblog((((((((("[DeathMatch::rfAckGetBotID] Result=" $ string(Result)) $ " RequestedAFCount=") $ string(RequestedAFCount)) $ " RequestedRSACount=") $ string(RequestedRSACount)) $ " AFBotID=") $ string(AFBotID.Length)) $ " RSABotID=") $ string(RSABotID.Length));
    HandleGetBotID(0, AFBotID);
    HandleGetBotID(1, RSABotID);
    return true;
    //return;    
}

function AddwAIBot(string strNum, string strTeam, string aiClass, optional string strGrade, optional string strNPCID)
{
    local Class<Controller> BotClass;
    local int lp1, Num, Team, NPCID, Grade;

    local bool forceTeam;
    local array<int> BotID;

    // End:0x16
    if(strNum == "")
    {
        Num = 1;        
    }
    else
    {
        Num = Clamp(int(strNum), 0, 16);
    }
    // End:0x3F
    if(strTeam == "")
    {
        forceTeam = false;        
    }
    else
    {
        forceTeam = true;
        Team = int(strTeam);
    }
    // End:0x6A
    if(strGrade == "")
    {
        Grade = 1;        
    }
    else
    {
        Grade = int(strGrade);
    }
    NPCID = int(strNPCID);
    dblog((((((((((("[DeathMatch::AddwAIBot] num=" $ string(Num)) $ " forceTeam=") $ string(forceTeam)) $ " team=") $ string(Team)) $ " aiClass=") $ aiClass) $ " grade=") $ string(Grade)) $ " npcID=") $ string(NPCID));
    BotClass = Class<Controller>(DynamicLoadObject(aiClass, Class'Core.Class'));
    lp1 = 0;
    J0x13B:

    // End:0x190 [Loop If]
    if(lp1 < Num)
    {
        EnqueueAddBot(BotClass, Team, Grade, NPCID);
        // End:0x186
        if(GiveBotsFakeUID)
        {
            BotID[0] = 0;
            HandleGetBotID(Team, BotID);
        }
        lp1++;
        // [Loop Continue]
        goto J0x13B;
    }
    // End:0x20F
    if(!GiveBotsFakeUID)
    {
        dblog((("sfReqGetBotID num=" $ string(Num)) $ " team=") $ string(Team));
        // End:0x1F7
        if(Team == 0)
        {
            BTSend.sfReqGetBotID(byte(Num), 0);            
        }
        else
        {
            BTSend.sfReqGetBotID(0, byte(Num));
        }
    }
    //return;    
}

exec function addaibot(string Num, string Team, string Grade, string NPCID)
{
    AddwAIBot(Num, Team, "WGame.wAIBot", Grade, NPCID);
    //return;    
}

exec function addai(string Num, string Team)
{
    AddwAIBot(Num, Team, "WGame.wAIBotDummy");
    //return;    
}

exec function addaifire(string Num, string Team)
{
    AddwAIBot(Num, Team, "WGame.wAIBotDummyFire");
    //return;    
}

exec function addaistrike(int Num)
{
    local int lp1;
    local Vector V;
    local Actor A;

    Num = Clamp(Num, 1, 8);
    lp1 = 0;
    J0x17:

    // End:0xD7 [Loop If]
    if(lp1 < Num)
    {
        V = EverySDPlayerStarts[int(float(lp1) % float(EverySDPlayerStarts.Length))].Location;
        V.Z += float(3000);
        A = Spawn(Class<wProjectile>(DynamicLoadObject("WWeapons.wAirStrikeProjInfinite", Class'Core.Class')),,, V);
        clog((("" $ string(lp1)) $ " at ") $ string(A.Location));
        lp1++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function ReviewJumpSpots(name TestLabel)
{
    local NavigationPoint StartSpot;
    local Controller C;
    local Pawn P;
    local Bot B;
    local Class<Pawn> PawnClass;

    bReviewingJumpSpots = true;
    B = Spawn(Class'UnrealGame_Decompressed.Bot');
    B.Squad = Spawn(Class'UnrealGame_Decompressed.DMSquad');
    StartSpot = FindPlayerStart(B, 0);
    PawnClass = Class<Pawn>(DynamicLoadObject(DefaultPlayerClassName, Class'Core.Class'));
    P = Spawn(PawnClass,,, StartSpot.Location, StartSpot.Rotation);
    // End:0xBF
    if(P == none)
    {
        Log("Failed to spawn pawn to reviewjumpspots");
        return;
    }
    B.Possess(P);
    B.GoalString = "TRANSLOCATING";
    C = Level.ControllerList;
    J0x105:

    // End:0x17D [Loop If]
    if(C != none)
    {
        // End:0x166
        if(PlayerController(C) != none)
        {
            PlayerController(C).bBehindView = true;
            PlayerController(C).SetViewTarget(P);
            UnrealPlayer(C).ShowAI();
            // [Explicit Break]
            goto J0x17D;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x105;
    }
    J0x17D:

    P.GiveWeapon("XWeapons.TransLauncher");
    // End:0x1C1
    if(TestLabel == 'None')
    {
        TestLabel = 'Begin';        
    }
    else
    {
        B.bSingleTestSection = true;
    }
    B.GotoState('Testing', TestLabel);
    //return;    
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x30
    if((default.MaxLives <= 0) && InStr(PropertyName, "LateEntryLives") != -1)
    {
        return false;
    }
    // End:0x7C
    if(((!default.bColoredDMSkins && !default.bTeamGame) || default.bForceNoPlayerLights) && InStr(PropertyName, "bAllowPlayerLights") != -1)
    {
        return false;
    }
    return super(GameInfo).AcceptPlayInfoProperty(PropertyName);
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super.FillPlayInfo(PlayInfo);
    // End:0x58
    if(!default.bTeamGame)
    {
        PlayInfo.AddSetting(default.BotsGroup, "bAdjustSkill", GetDisplayText("bAdjustSkill"), 0, 2, "Check",,,, true);
    }
    PlayInfo.AddSetting(default.GameGroup, "SpawnProtectionTime", GetDisplayText("SpawnProtectionTime"), 2, 1, "Text", "8;0.0:30.0",,, true);
    PlayInfo.AddSetting(default.GameGroup, "LateEntryLives", GetDisplayText("LateEntryLives"), 50, 1, "Text", "3",, true, true);
    PlayInfo.AddSetting(default.GameGroup, "bColoredDMSkins", GetDisplayText("bColoredDMSkins"), 1, 1, "Check",,,, true);
    PlayInfo.AddSetting(default.GameGroup, "bAllowPlayerLights", GetDisplayText("bAllowPlayerLights"), 1, 1, "Check",,,, true);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowTrans", GetDisplayText("bAllowTrans"), 0, 1, "Check",,,, true);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowTaunts", GetDisplayText("bAllowTaunts"), 1, 1, "Check",,,, true);
    PlayInfo.AddSetting(default.RulesGroup, "bForceRespawn", GetDisplayText("bForceRespawn"), 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.RulesGroup, "bPlayersMustBeReady", GetDisplayText("bPlayersMustBeReady"), 1, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "MinNetPlayers", GetDisplayText("MinNetPlayers"), 100, 1, "Text", "3;0:32",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "NetWait", GetDisplayText("NetWait"), 200, 1, "Text", "3;0:60",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "RestartWait", GetDisplayText("RestartWait"), 200, 1, "Text", "3;0:60",, true, true);
    Class'IpDrv.MasterServerUplink'.static.FillPlayInfo(PlayInfo);
    PlayInfo.PopClass();
    //return;    
}

static function string GetDisplayText(string PropName)
{
    switch(PropName)
    {
        // End:0x1B
        case "NetWait":
            return default.DMPropsDisplayText[0];
        // End:0x35
        case "MinNetPlayers":
            return default.DMPropsDisplayText[1];
        // End:0x4E
        case "RestartWait":
            return default.DMPropsDisplayText[2];
        // End:0x67
        case "bTournament":
            return default.DMPropsDisplayText[3];
        // End:0x88
        case "bPlayersMustBeReady":
            return default.DMPropsDisplayText[4];
        // End:0xA3
        case "bForceRespawn":
            return default.DMPropsDisplayText[5];
        // End:0xBD
        case "bAdjustSkill":
            return default.DMPropsDisplayText[6];
        // End:0xD7
        case "bAllowTaunts":
            return default.DMPropsDisplayText[7];
        // End:0xF8
        case "SpawnProtectionTime":
            return default.DMPropsDisplayText[8];
        // End:0x111
        case "bAllowTrans":
            return default.DMPropsDisplayText[9];
        // End:0x12E
        case "bColoredDMSkins":
            return default.DMPropsDisplayText[10];
        // End:0x14A
        case "LateEntryLives":
            return default.DMPropsDisplayText[12];
        // End:0x16A
        case "bAllowPlayerLights":
            return default.DMPropsDisplayText[13];
        // End:0xFFFF
        default:
            return super(GameInfo).GetDisplayText(PropName);
            break;
    }
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1B
        case "NetWait":
            return default.DMPropDescText[0];
        // End:0x35
        case "MinNetPlayers":
            return default.DMPropDescText[1];
        // End:0x4E
        case "RestartWait":
            return default.DMPropDescText[2];
        // End:0x67
        case "bTournament":
            return default.DMPropDescText[3];
        // End:0x88
        case "bPlayersMustBeReady":
            return default.DMPropDescText[4];
        // End:0xA3
        case "bForceRespawn":
            return default.DMPropDescText[5];
        // End:0xBD
        case "bAdjustSkill":
            return default.DMPropDescText[6];
        // End:0xD7
        case "bAllowTaunts":
            return default.DMPropDescText[7];
        // End:0xF8
        case "SpawnProtectionTime":
            return default.DMPropDescText[8];
        // End:0x111
        case "bAllowTrans":
            return default.DMPropDescText[9];
        // End:0x12E
        case "bColoredDMSkins":
            return default.DMPropDescText[10];
        // End:0x148
        case "bAutoNumBots":
            return default.DMPropDescText[11];
        // End:0x164
        case "LateEntryLives":
            return default.DMPropDescText[12];
        // End:0x184
        case "bAllowPlayerLights":
            return default.DMPropDescText[13];
        // End:0xFFFF
        default:
            return super.GetDescriptionText(PropName);
            break;
    }
    //return;    
}

function NotifySpree(Controller Other, int Num)
{
    local Controller C;

    // End:0x16
    if(Num == 5)
    {
        Num = 0;        
    }
    else
    {
        // End:0x2C
        if(Num == 10)
        {
            Num = 1;            
        }
        else
        {
            // End:0x43
            if(Num == 15)
            {
                Num = 2;                
            }
            else
            {
                // End:0x5A
                if(Num == 20)
                {
                    Num = 3;                    
                }
                else
                {
                    // End:0x71
                    if(Num == 25)
                    {
                        Num = 4;                        
                    }
                    else
                    {
                        // End:0x88
                        if(Num == 30)
                        {
                            Num = 5;                            
                        }
                        else
                        {
                            return;
                        }
                    }
                }
            }
        }
    }
    SpecialEvent(Other.PlayerReplicationInfo, "spree_" $ string(Num + 1));
    // End:0x127
    if(TeamPlayerReplicationInfo(Other.PlayerReplicationInfo) != none)
    {
        TeamPlayerReplicationInfo(Other.PlayerReplicationInfo).Spree[Num] += byte(1);
        // End:0x127
        if(Num > 0)
        {
            TeamPlayerReplicationInfo(Other.PlayerReplicationInfo).Spree[Num - 1] -= byte(1);
        }
    }
    Other.AwardAdrenaline(ADR_MajorKill);
    C = Level.ControllerList;
    J0x14F:

    // End:0x1AD [Loop If]
    if(C != none)
    {
        // End:0x196
        if(PlayerController(C) != none)
        {
            PlayerController(C).ReceiveLocalizedMessage(Class'UnrealGame_Decompressed.KillingSpreeMessage', Num, Other.PlayerReplicationInfo);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14F;
    }
    //return;    
}

function EndSpree(Controller Killer, Controller Other)
{
    local Controller C;

    // End:0x23
    if((Other == none) || !Other.bIsPlayer)
    {
        return;
    }
    C = Level.ControllerList;
    J0x37:

    // End:0xFD [Loop If]
    if(C != none)
    {
        // End:0xE6
        if(PlayerController(C) != none)
        {
            // End:0xB0
            if(((Killer == Other) || Killer == none) || !Killer.bIsPlayer)
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'UnrealGame_Decompressed.KillingSpreeMessage', 1, none, Other.PlayerReplicationInfo);                
            }
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'UnrealGame_Decompressed.KillingSpreeMessage', 0, Other.PlayerReplicationInfo, Killer.PlayerReplicationInfo);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

function bool WantsPickups(Bot B)
{
    return true;
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super(GameInfo).PrecacheGameAnnouncements(V, bRewardSounds);
    //return;    
}

event SetGrammar()
{
    //return;    
}

static function string GetNextLoadHint(string MapName)
{
    local array<string> Hints;

    // End:0x1B
    if(Rand(100) < 75)
    {
        Hints = GetAllLoadHints(true);        
    }
    else
    {
        Hints = GetAllLoadHints();
    }
    // End:0x42
    if(Hints.Length > 0)
    {
        return Hints[Rand(Hints.Length)];
    }
    return "";
    //return;    
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
    local int i;
    local array<string> Hints;

    // End:0x25
    if(!bThisClassOnly || default.DMHints.Length == 0)
    {
        Hints = super(GameInfo).GetAllLoadHints();
    }
    i = 0;
    J0x2C:

    // End:0x5E [Loop If]
    if(i < default.DMHints.Length)
    {
        Hints[Hints.Length] = default.DMHints[i];
        i++;
        // [Loop Continue]
        goto J0x2C;
    }
    return Hints;
    //return;    
}

function AnnounceArtillery(Controller Caller)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x106 [Loop If]
    if(C != none)
    {
        // End:0x65
        if(C == Caller)
        {
            PlayerController(C).QueueAnnouncement(Class'Engine.wGameManager'.default.VoicePackageName $ Class'Engine.wMessage_Game'.default.AnnounceSelfArtillery, 1);            
        }
        else
        {
            // End:0xC8
            if(C.IsA('PlayerController') && C.GetTeamNum() == Caller.GetTeamNum())
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_AllyArtillery);                
            }
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_EnemyArtillery);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function AnnounceHelicopter(Controller Caller)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0xD2 [Loop If]
    if(C != none)
    {
        // End:0x31
        if(C == Caller)
        {            
        }
        else
        {
            // End:0x94
            if(C.IsA('PlayerController') && C.GetTeamNum() == Caller.GetTeamNum())
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_AllyHelicopter);                
            }
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_EnemyHelicopter);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function AnnounceUAV(Controller Caller)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0xD2 [Loop If]
    if(C != none)
    {
        // End:0x31
        if(C == Caller)
        {            
        }
        else
        {
            // End:0x94
            if(C.IsA('PlayerController') && C.GetTeamNum() == Caller.GetTeamNum())
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_AllyUAV);                
            }
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_EnemyUAV);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function PermitWeaponChangeInSpecialMode()
{
    //return;    
}

auto state PendingMatch
{
    function RestartPlayer(Controller aPlayer)
    {
        // End:0x16
        if(CountDown <= 0)
        {
            super(GameInfo).RestartPlayer(aPlayer);
        }
        //return;        
    }

    function bool AddBot(optional string botname)
    {
        // End:0x20
        if(int(Level.NetMode) == int(NM_Standalone))
        {
            InitialBots++;
        }
        // End:0x3A
        if(botname != "")
        {
            PreLoadNamedBot(botname);            
        }
        else
        {
            PreLoadBot();
        }
        return true;
        //return;        
    }

    function Timer()
    {
        local Controller P;
        local bool bReady, bEveryonePrecached;

        global.Timer();
        // End:0x19
        if(NumPlayers == 0)
        {
            bWaitForNetPlayers = true;
        }
        // End:0x3A8
        if(bWaitForNetPlayers && int(Level.NetMode) != int(NM_Standalone))
        {
            StartupStage = byte(((GetNetWait()) - ElapsedTime) + 10);
            // End:0x6F
            if(NumPlayers >= MinNetPlayers)
            {
                ElapsedTime++;                
            }
            else
            {
                ElapsedTime = 0;
            }
            bEveryonePrecached = true;
            Log("[DeathMatch::PendingMatch::Timer] check bEveryonePrecached");
            P = Level.ControllerList;
            J0xD0:

            // End:0x19B [Loop If]
            if(P != none)
            {
                // End:0x184
                if(((P.IsA('PlayerController') && P.PlayerReplicationInfo != none) && P.bIsPlayer) && PlayerController(P).bPlayFromStart)
                {
                    // End:0x184
                    if(!P.PlayerReplicationInfo.bPrecached)
                    {
                        bEveryonePrecached = false;
                        Log("not precached" @ P.PlayerReplicationInfo.PlayerName);
                        // [Explicit Break]
                        goto J0x19B;
                    }
                }
                P = P.nextController;
                // [Loop Continue]
                goto J0xD0;
            }
            J0x19B:

            // End:0x3A8
            if((ElapsedTime > (GetNetWait())) || (NumPlayersFromStart >= StartPlayerNum) && bEveryonePrecached)
            {
                Log((((((((((((("[DeathMatch::PendingMatch.Timer] #FromStart=" $ string(NumPlayersFromStart)) $ " Start#=") $ string(StartPlayerNum)) $ " bEveryonePrecached=") $ string(bEveryonePrecached)) $ " NumPlayers=") $ string(NumPlayers)) $ " MaxPlayers=") $ string(MaxPlayers)) $ " ElapsedTime=") $ string(ElapsedTime)) $ " NetWait=") $ string(GetNetWait()));
                P = Level.ControllerList;
                J0x2AE:

                // End:0x395 [Loop If]
                if(P != none)
                {
                    // End:0x37E
                    if(((P.IsA('PlayerController') && P.PlayerReplicationInfo != none) && P.bIsPlayer) && PlayerController(P).bPlayFromStart)
                    {
                        Log((("[DeathMatch::PendingMatch.Timer] name=" $ P.PlayerReplicationInfo.PlayerName) $ " precached=") $ string(P.PlayerReplicationInfo.bPrecached));
                    }
                    P = P.nextController;
                    // [Loop Continue]
                    goto J0x2AE;
                }
                bWaitForNetPlayers = false;
                CountDown = default.CountDown;
            }
        }
        // End:0x3F0
        if((int(Level.NetMode) != int(NM_Standalone)) && bWaitForNetPlayers || bTournament && NumPlayers < MaxPlayers)
        {
            PlayStartupMessage();
            return;
        }
        bReady = true;
        StartupStage = 1;
        // End:0x4F4
        if(!bStartedCountDown && (bTournament || bPlayersMustBeReady) || int(Level.NetMode) == int(NM_Standalone))
        {
            P = Level.ControllerList;
            J0x450:

            // End:0x4F4 [Loop If]
            if(P != none)
            {
                // End:0x4DD
                if((((P.IsA('PlayerController') && P.PlayerReplicationInfo != none) && P.bIsPlayer) && P.PlayerReplicationInfo.bWaitingPlayer) && !P.PlayerReplicationInfo.bReadyToPlay)
                {
                    bReady = false;
                }
                P = P.nextController;
                // [Loop Continue]
                goto J0x450;
            }
        }
        // End:0x65F
        if((bReady && !bReviewingJumpSpots) && !bChangedHost)
        {
            Log(((((((("Start!!!" @ "NumPlayersFromStart=") $ string(NumPlayersFromStart)) @ "StartPlayerNum=") $ string(StartPlayerNum)) @ "ElapsedTime=") $ string(ElapsedTime)) @ "NetWait=") $ string(GetNetWait()));
            P = Level.ControllerList;
            J0x5A3:

            // End:0x651 [Loop If]
            if(P != none)
            {
                // End:0x63A
                if(((P.IsA('PlayerController') && P.PlayerReplicationInfo != none) && P.bIsPlayer) && PlayerController(P).bPlayFromStart)
                {
                    Log(P.PlayerReplicationInfo.PlayerName @ string(P.PlayerReplicationInfo.bPrecached));
                }
                P = P.nextController;
                // [Loop Continue]
                goto J0x5A3;
            }
            StartupStage = 5;
            StartMatch();
        }
        PlayStartupMessage();
        //return;        
    }

    function BeginState()
    {
        bWaitingToStartMatch = true;
        StartupStage = 0;
        // End:0x2A
        if(IsA('xLastManStandingGame'))
        {
            NetWait = Max(NetWait, 10);
        }
        //return;        
    }
Begin:

    // End:0x0F
    if(bQuickStart)
    {
        StartMatch();
    }
    stop;                    
}

state MatchInProgress
{
    function Tick(float dt)
    {
        ProcessDefaultInv();
        //return;        
    }

    function Timer()
    {
        local Controller P;

        global.Timer();
        // End:0x1F
        if(!bFinalStartup)
        {
            bFinalStartup = true;
            PlayStartupMessage();
        }
        // End:0xE3
        if(bForceRespawn)
        {
            P = Level.ControllerList;
            J0x3C:

            // End:0xE3 [Loop If]
            if(P != none)
            {
                // End:0xCC
                if(((P.Pawn == none) && P.IsA('PlayerController')) && !P.PlayerReplicationInfo.bOnlySpectator)
                {
                    // End:0xB8
                    if(!AllowBecomeActivePlayer(PlayerController(P)))
                    {
                        P.GotoState('Spectating');                        
                    }
                    else
                    {
                        PlayerController(P).ServerReStartPlayer();
                    }
                }
                P = P.nextController;
                // [Loop Continue]
                goto J0x3C;
            }
        }
        // End:0x10B
        if(((NeedPlayers()) && AddBot()) && RemainingBots > 0)
        {
            RemainingBots--;
        }
        // End:0x129
        if(bOverTime)
        {
            EndGame(none, "TimeLimit");            
        }
        else
        {
            // End:0x1BD
            if(TimeLimit > 0)
            {
                // End:0x1BA
                if(!GameReplicationInfo.WaitingForStart)
                {
                    GameReplicationInfo.bStopCountDown = false;
                    RemainingTime--;
                    GameReplicationInfo.RemainingTime = RemainingTime;
                    // End:0x19D
                    if((float(RemainingTime) % float(60)) == float(0))
                    {
                        GameReplicationInfo.RemainingMinute = RemainingTime;
                    }
                    // End:0x1BA
                    if(RemainingTime <= 0)
                    {
                        EndGame(none, "TimeLimit");
                    }
                }                
            }
            else
            {
                // End:0x1E3
                if((MaxLives > 0) && (NumPlayers + NumBots) != 1)
                {
                    CheckMaxLives(none);
                }
            }
        }
        // End:0x212
        if(!GameReplicationInfo.WaitingForStart)
        {
            ElapsedTime++;
            GameReplicationInfo.ElapsedTime = ElapsedTime;
        }
        // End:0x246
        if((ElapsedTime != 0) && (float(ElapsedTime) % float(Class'Engine.wMessage_BGM'.default.BGMInterval)) == float(0))
        {
            SendBgmMessageBeginMatch();
        }
        // End:0x2A2
        if(!GameReplicationInfo.bObjectivePlanted)
        {
            // End:0x2A2
            if(!GameReplicationInfo.bStopCountDown)
            {
                // End:0x2A2
                if((GameReplicationInfo.GetRemainingTime() == 60) || GameReplicationInfo.GetRemainingTime() == 30)
                {
                    AnnounceTimesUp();
                }
            }
        }
        // End:0x2C6
        if((float(RemainingTime) % float(5)) == float(0))
        {
            GameReplicationInfo.SyncRemainingTime();
        }
        // End:0x302
        if(GameReplicationInfo.WaitingForStart)
        {
            GameReplicationInfo.WaitingForStartCountDown--;
            // End:0x302
            if(GameReplicationInfo.WaitingForStartCountDown <= 0)
            {
                EndWaitingForStart();
            }
        }
        // End:0x365
        if((!IsA('wMSGameInfo') && Level.GetMatchMaker() != none) && Level.GetMatchMaker().IsDisconnectedUser())
        {
            CheckLives(none);
            Level.GetMatchMaker().SetDisconnectedUser(false);
        }
        BalanceBots();
        //return;        
    }

    function BeginState()
    {
        local PlayerReplicationInfo PRI;

        // End:0x21
        foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
        {
            PRI.StartTime = 0;            
        }        
        // End:0x35
        if(bChangedHost == false)
        {
            ElapsedTime = 0;
        }
        bWaitingToStartMatch = false;
        StartupStage = 5;
        PlayStartupMessage();
        StartupStage = 6;
        //return;        
    }
    stop;    
}

state MatchOver
{
    function RestartPlayer(Controller aPlayer)
    {
        //return;        
    }

    function ScoreKill(Controller Killer, Controller Other)
    {
        //return;        
    }

    function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
    {
        return 0;
        //return;        
    }

    function bool ChangeTeam(Controller Other, int Num, bool bNewTeam)
    {
        return false;
        //return;        
    }

    function Timer()
    {
        global.Timer();
        // End:0x21
        if(SendMatchOverState)
        {
            SendMatchOverProcess();
            SetTimer(5.0000000, false);            
        }
        else
        {
            // End:0x30
            if(SendMatchOverEndState)
            {
                SendMatchOverEndProcess();
            }
        }
        //return;        
    }

    function bool NeedPlayers()
    {
        return false;
        //return;        
    }

    function PlayMatchOverMessages()
    {
        local Controller C;

        // End:0x7B
        if(EndGameFocus != none)
        {
            EndGameFocus.bAlwaysRelevant = true;
            C = Level.ControllerList;
            J0x30:

            // End:0x7B [Loop If]
            if(C != none)
            {
                // End:0x64
                if(PlayerController(C) != none)
                {
                    PlayerController(C).ClientSetViewTarget_F(EndGameFocus);
                }
                C = C.nextController;
                // [Loop Continue]
                goto J0x30;
            }
        }
        PlayEndOfMatchMessage();
        //return;        
    }

    function SendMatchOverEndProcess()
    {
        local Controller C;
        local PlayerController P;

        Log("[END] sendmatchoverendprocess");
        // End:0x55
        if(!bGameRestarted && Level.TimeSeconds > (EndTime + float(RestartWait)))
        {
            RestartGame();
        }
        // End:0xD0
        if(EndGameFocus != none)
        {
            EndGameFocus.bAlwaysRelevant = true;
            C = Level.ControllerList;
            J0x85:

            // End:0xD0 [Loop If]
            if(C != none)
            {
                // End:0xB9
                if(PlayerController(C) != none)
                {
                    PlayerController(C).ClientSetViewTarget_E(EndGameFocus);
                }
                C = C.nextController;
                // [Loop Continue]
                goto J0x85;
            }
        }
        EndMessageCounter++;
        // End:0xEC
        if(EndMessageCounter == EndMessageWait)
        {
            PlayEndOfMatchMessage();
        }
        // End:0x18C
        if((Level.TimeSeconds > (EndTime + float(RestartWait / 2))) && CurrentGameProfile != none)
        {
            C = Level.ControllerList;
            J0x132:

            // End:0x172 [Loop If]
            if(C != none)
            {
                P = PlayerController(C);
                // End:0x15B
                if(P != none)
                {
                    // [Explicit Break]
                    goto J0x172;
                }
                C = C.nextController;
                // [Loop Continue]
                goto J0x132;
            }
            J0x172:

            P.myHUD.bShowLocalStats = true;
        }
        SendMatchOverEnd();
        SendMatchOverEndState = false;
        //return;        
    }

    function SendMatchOverProcess()
    {
        local wMatchMaker rMM;

        Log("[END] sendmatchoverprocess");
        rMM = Level.GetMatchMaker();
        // End:0x4B
        if(rMM.bServerConnected)
        {
            SendMatchOver();
        }
        SendMatchOverState = false;
        SendMatchOverEndState = true;
        //return;        
    }

    function BeginState()
    {
        local Controller C;
        local PlayerController P;
        local PlayerReplicationInfo PRI;

        Log("[END] begin state");
        slog("[DeathMatch.MatchOver.BeginState]");
        GameReplicationInfo.SyncRemainingTime();
        // End:0x8B
        foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
        {
            PRI.TimePlayed = GameReplicationInfo.ElapsedTime - PRI.ElapsedTimeWhenIntervented;            
        }        
        CalcItemUsedTimeAll();
        GameReplicationInfo.bStopCountDown = true;
        GameReplicationInfo.bMatchOver = true;
        GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(10);
        // End:0x19F
        if(CurrentGameProfile != none)
        {
            EndTime = Level.TimeSeconds + float(SinglePlayerWait);
            C = Level.ControllerList;
            J0x113:

            // End:0x153 [Loop If]
            if(C != none)
            {
                P = PlayerController(C);
                // End:0x13C
                if(P != none)
                {
                    // [Explicit Break]
                    goto J0x153;
                }
                C = C.nextController;
                // [Loop Continue]
                goto J0x113;
            }
            J0x153:

            P.myHUD.bShowScoreBoard = true;
            CurrentGameProfile.RegisterGame(self, P.PlayerReplicationInfo);
            SavePackage(CurrentGameProfile.PackageName);
        }
        PlayMatchOverMessages();
        SendMatchOverState = true;
        SendMatchOverEndState = false;
        SetTimer(2.0000000, false);
        //return;        
    }
    stop;    
}

state ChangeHost extends PendingMatch
{
    function bool CanPawnTakeDamage()
    {
        return false;
        //return;        
    }

    function BroadcastStartupMessage(int MsgIdx)
    {
        local Controller P;

        P = Level.ControllerList;
        J0x14:

        // End:0x61 [Loop If]
        if(P != none)
        {
            // End:0x4A
            if(UnrealPlayer(P) != none)
            {
                UnrealPlayer(P).PlayStartupMessage(byte(MsgIdx));
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x14;
        }
        //return;        
    }

    function PlayStartupMessage()
    {
        local int MsgIdx;

        MsgIdx = (30 - ElapsedTimeInChangeHost) + 41;
        // End:0x2A
        if(MsgIdx > 71)
        {
            MsgIdx = 71;            
        }
        else
        {
            // End:0x3E
            if(MsgIdx < 41)
            {
                MsgIdx = 41;
            }
        }
        BroadcastStartupMessage(MsgIdx);
        //return;        
    }

    function ClientsFadeToColor()
    {
        local Controller P;

        P = Level.ControllerList;
        J0x14:

        // End:0x5A [Loop If]
        if(P != none)
        {
            // End:0x43
            if(PlayerController(P) != none)
            {
                PlayerController(P).ClientFadeToColor();
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x14;
        }
        //return;        
    }

    function Timer()
    {
        super.Timer();
        // End:0x61
        if(ChangedHostCompleteCountDown > 0)
        {
            ChangedHostCompleteCountDown--;
            // End:0x33
            if(ChangedHostCompleteCountDown == 1)
            {
                ChangedHostCompleteCountDown = 0;
                ContinueMatch();                
            }
            else
            {
                // End:0x4B
                if(ChangedHostCompleteCountDown == 3)
                {
                    ClientsFadeToColor();
                    ChangeHostExtraWork();
                }
                BroadcastStartupMessage((72 + ChangedHostCompleteCountDown) - 2);
            }            
        }
        else
        {
            // End:0xC8
            if(ElapsedTimeInChangeHost >= 10)
            {
                Log("[CYH] DeathMatch::ChangeHost state::Timer() elapsedTime >= 30");
                // End:0xC5
                if((CheckEndGameCondition()) == false)
                {
                    ChangedHostCompleteCountDown = ChangedHostCompleteCountDown_Initial;
                }                
            }
            else
            {
                ElapsedTimeInChangeHost++;
            }
        }
        //return;        
    }

    function ForceBeginActors()
    {
        local Actor A;

        // End:0xE4
        foreach AllActors(Class'Engine.Actor', A)
        {
            // End:0x3E
            if(A.IsA('wWeaponPickup') == true)
            {
                wWeaponPickup(A).ForceBegin();
                // End:0xE3
                continue;
            }
            // End:0x6C
            if(A.IsA('GameObject') == true)
            {
                GameObject(A).ForceBegin();
                // End:0xE3
                continue;
            }
            // End:0x9A
            if(A.IsA('GameObjective') == true)
            {
                GameObjective(A).ForceBegin();
                // End:0xE3
                continue;
            }
            // End:0xC0
            if(A.IsA('wAirStrikeProj'))
            {
                A.ForceBegin();
                // End:0xE3
                continue;
            }
            // End:0xE3
            if(A.IsA('NavigationPoint'))
            {
                A.ForceBegin();
            }            
        }        
        //return;        
    }

    function EndState()
    {
        local Controller C;
        local PlayerController PC;
        local wGameStateStorageGetter GSSG;

        super(Object).EndState();
        slog("[DeathMatch.ChangeHost.EndState]");
        BalanceBots();
        ForceBeginActors();
        ElapsedTimeInChangeHost = 0;
        GSSG = new Class'Engine.wGameStateStorageGetter';
        C = Level.ControllerList;
        J0x64:

        // End:0x197 [Loop If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0x180
            if(PC != none)
            {
                // End:0x112
                if(int(GameReplicationInfo.RoundState) == int(1))
                {
                    Log("[CYH] DeathMatch.ChangeHost state::EndState() GRI.RoundState == EROUND_END");
                    PC.ClientRoundEnded();
                    PC.RoundHasEnded();                    
                }
                else
                {
                    Log("[CYH] DeathMatch.ChangeHost state::EndState() called GSSG.GetUserState()");
                    GSSG.GetUserState(PC.GSSS, PC);
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x64;
        }
        Log("[CYH] Destroy new Host GSSS. new Host needs no GSSS.");
        PC = Level.GetLocalPlayerController();
        PC.GSSS.GRI = none;
        PC.DestroyGameStateStorageSender();
        EndChangeHost();
        CheckLives(none);
        //return;        
    }

    function EndChangeHost()
    {
        local Controller C;

        Level.GetLocalPlayerController().EndChangeHost();
        C = Level.ControllerList;
        J0x2D:

        // End:0x77 [Loop If]
        if(C != none)
        {
            // End:0x60
            if(C.IsA('PlayerController'))
            {
                PlayerController(C).ClientEndChangeHost();
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x2D;
        }
        //return;        
    }

    function BeginState()
    {
        local wArrangeTurret AT;
        local Vehicle V;
        local PlayerReplicationInfo PRI;
        local Pawn P;
        local wAILevelBase AILevel;
        local Vector zeroVec;

        super.BeginState();
        slog("[DeathMatch.ChangeHost.BeginState]");
        GoalScore = GameReplicationInfo.GoalScore;
        bChangedHost = true;
        // End:0x90
        if((Level.GetMatchMaker().ReconnectClientNum == 0) && !Level.GetMatchMaker().PlayWithBots)
        {
            CheckEndGameCondition();
        }
        // End:0xC9
        foreach DynamicActors(Class'Engine.Pawn', P)
        {
            P.Acceleration = zeroVec;
            P.Velocity = zeroVec;            
        }        
        // End:0x176
        foreach AllActors(Class'Engine.Vehicle', V)
        {
            // End:0x175
            if(V.Driver != none)
            {
                Log((("  Vehicle name=" $ string(V.Name)) $ " Driver=") $ V.Driver.OwnerName);
                V.KDriverLeave(true);
                Log("      -> Driver=" $ V.Driver.OwnerName);
            }            
        }        
        // End:0x1CE
        foreach DynamicActors(Class'Engine.wAILevelBase', AILevel)
        {
            Log("  old AILevel found");
            Level.AILevel = AILevel;
            Level.AILevel.Initialize();
            // End:0x1CE
            break;            
        }        
        // End:0x20F
        foreach AllActors(Class'Engine.PlayerReplicationInfo', PRI)
        {
            PRI.IsConnected = false;
            // End:0x20E
            if(PRI.bBot)
            {
                PRI.Destroy();
            }            
        }        
        // End:0x22D
        foreach AllActors(Class'Engine.Vehicle', V)
        {
            V.Destroy();            
        }        
        // End:0x24E
        foreach AllActors(Class'Engine.wArrangeTurret', AT)
        {
            AT.ForceSpawnVehicle();            
        }        
        //return;        
    }
    stop;    
}

defaultproperties
{
    NetWait=20
    NetWaitClan=40
    MinNetPlayers=1
    RestartWait=30
    bAutoNumBots=true
    bAllowTaunts=true
    NumRounds=1
    SpawnProtectionTime=2.0000000
    LateEntryLives=1
    CountDown=4
    DMSquadClass=Class'UnrealGame_Decompressed.DMSquad'
    EndMessageWait=2
    NamePrefixes[0]="Mr_"
    NamePrefixes[2]="The_Real_"
    NamePrefixes[3]="Evil_"
    NamePrefixes[5]="Owns_"
    NamePrefixes[7]="Evil_"
    NameSuffixes[1]="_is_lame"
    NameSuffixes[4]="_sucks"
    NameSuffixes[6]="_OwnsYou"
    NameSuffixes[8]="_jr"
    NameSuffixes[9]="'s_clone"
    DMPropsDisplayText[0]="?? ?? ??"
    DMPropsDisplayText[1]="?? ???? ?"
    DMPropsDisplayText[2]="??? ?? ??"
    DMPropsDisplayText[3]="???? ??"
    DMPropsDisplayText[4]="???? ?? ??"
    DMPropsDisplayText[5]="?? ???"
    DMPropsDisplayText[6]="?? ?? ? ??"
    DMPropsDisplayText[7]="?? ??"
    DMPropsDisplayText[8]="?? ?? ??"
    DMPropsDisplayText[9]="??????? ??"
    DMPropsDisplayText[10]="? ?? ??"
    DMPropsDisplayText[11]="? ??? ??"
    DMPropsDisplayText[12]="?? ?? ?? ??"
    DMPropsDisplayText[13]="???? ?? ?? ??"
    DMPropDescText[0]="?? ?????? ??? ? ??? ?? ??? ??????"
    DMPropDescText[1]="? ?? ?? ? ??? ?? ???? ?? ?????"
    DMPropDescText[2]="?? ?? ? ?? ? ?? ???? ?? ??"
    DMPropDescText[3]="???? ??"
    DMPropDescText[4]="????? ?? ?? ? ??? ???? ???"
    DMPropDescText[5]="?? ?? ????? ??? ??? ???"
    DMPropDescText[6]="?? ??? ?? ??? ?? ???? ?????"
    DMPropDescText[7]="?? ??? ??? ????? ??? ? ?? ???"
    DMPropDescText[8]="????? ??? ?, ?? ??? ?????.(?? ?? ? ?? ??)"
    DMPropDescText[9]="???????? ??? ? ????"
    DMPropDescText[10]="?????, ?????? ? ? ?? ???"
    DMPropDescText[11]="??? ?? ??? ?? ? ??? ?????"
    DMPropDescText[12]="????? ?? ?? ???? ??? ??? ??, ?? ??? ?????"
    DMPropDescText[13]="? ??? ???? ???? ??? ?????"
    YouDestroyed="???"
    ADR_Kill=5.0000000
    ADR_MajorKill=10.0000000
    ADR_MinorError=-2.0000000
    ADR_MinorBonus=5.0000000
    ADR_KillTeamMate=-5.0000000
    EpicNames[0]="Eepers"
    EpicNames[1]="Bellheimer"
    EpicNames[2]="Shanesta"
    EpicNames[3]="EpicBoy"
    EpicNames[4]="Turtle"
    EpicNames[5]="Talisman"
    EpicNames[6]="BigSquid"
    EpicNames[7]="Ced"
    EpicNames[8]="Andrew"
    EpicNames[9]="DrSin"
    EpicNames[10]="The_Reaper"
    EpicNames[11]="ProfessorDeath"
    EpicNames[12]="DarkByte"
    EpicNames[13]="Jack"
    EpicNames[14]="Lankii"
    EpicNames[15]="MarkRein"
    EpicNames[16]="Perninator"
    EpicNames[17]="SteveG"
    EpicNames[18]="Cpt.Pinhead"
    EpicNames[19]="Christoph"
    EpicNames[20]="Tim"
    MaleBackupNames[0]="Btr_00"
    MaleBackupNames[1]="Btr_01"
    MaleBackupNames[2]="Btr_02"
    MaleBackupNames[3]="Btr_03"
    MaleBackupNames[4]="Btr_04"
    MaleBackupNames[5]="Btr_05"
    MaleBackupNames[6]="Btr_06"
    MaleBackupNames[7]="Btr_07"
    MaleBackupNames[8]="Btr_08"
    MaleBackupNames[9]="Btr_09"
    MaleBackupNames[10]="Btr_10"
    MaleBackupNames[11]="Btr_11"
    MaleBackupNames[12]="Btr_12"
    MaleBackupNames[13]="Btr_13"
    MaleBackupNames[14]="Btr_14"
    MaleBackupNames[15]="Btr_15"
    MaleBackupNames[16]="Btr_16"
    MaleBackupNames[17]="Btr_17"
    MaleBackupNames[18]="Btr_18"
    MaleBackupNames[19]="Btr_19"
    MaleBackupNames[20]="Btr_20"
    MaleBackupNames[21]="Btr_21"
    MaleBackupNames[22]="Btr_22"
    MaleBackupNames[23]="Btr_23"
    MaleBackupNames[24]="Btr_24"
    MaleBackupNames[25]="Btr_25"
    MaleBackupNames[26]="Btr_26"
    MaleBackupNames[27]="Btr_27"
    MaleBackupNames[28]="Btr_28"
    MaleBackupNames[29]="Btr_29"
    MaleBackupNames[30]="Btr_30"
    MaleBackupNames[31]="Btr_31"
    FemaleBackupNames[0]="F_Btr_00"
    FemaleBackupNames[1]="F_Btr_01"
    FemaleBackupNames[2]="F_Btr_02"
    FemaleBackupNames[3]="F_Btr_03"
    FemaleBackupNames[4]="F_Btr_04"
    FemaleBackupNames[5]="F_Btr_05"
    FemaleBackupNames[6]="F_Btr_06"
    FemaleBackupNames[7]="F_Btr_07"
    FemaleBackupNames[8]="F_Btr_08"
    FemaleBackupNames[9]="F_Btr_09"
    FemaleBackupNames[10]="F_Btr_10"
    FemaleBackupNames[11]="F_Btr_11"
    FemaleBackupNames[12]="F_Btr_12"
    FemaleBackupNames[13]="F_Btr_13"
    FemaleBackupNames[14]="F_Btr_14"
    FemaleBackupNames[15]="F_Btr_15"
    FemaleBackupNames[16]="F_Btr_16"
    FemaleBackupNames[17]="F_Btr_17"
    FemaleBackupNames[18]="F_Btr_18"
    FemaleBackupNames[19]="F_Btr_19"
    FemaleBackupNames[20]="F_Btr_20"
    FemaleBackupNames[21]="F_Btr_21"
    FemaleBackupNames[22]="F_Btr_22"
    FemaleBackupNames[23]="F_Btr_23"
    FemaleBackupNames[24]="F_Btr_24"
    FemaleBackupNames[25]="F_Btr_25"
    FemaleBackupNames[26]="F_Btr_26"
    FemaleBackupNames[27]="F_Btr_27"
    FemaleBackupNames[28]="F_Btr_28"
    FemaleBackupNames[29]="F_Btr_29"
    FemaleBackupNames[30]="F_Btr_30"
    FemaleBackupNames[31]="F_Btr_31"
    DMHints[0]="?? ??? ???? ????? ????. %FIRE%? ??? ??????? ??, %ALTFIRE%? ??? ??????? ?????."
    DMHints[1]="????? ??? ??? ??? ???? ?? ?? ??????."
    DMHints[2]="????? ???? ??? ?? ???? ? ???? ???? ?? ??? ???."
    DMHints[3]="???? ?? ??? ???? ??? ?????."
    DMHints[4]="?? ?? ?? ?? ?? ??? ?? ? ????. ?? %NEXTWEAPON% ?? %PREVWEAPON%? ???? ??? ?? ? ????."
    DMHints[5]="?? ??? ?????(?? ???? ????) ?? ??(?? ???? ????) ????? ???. ???? ???? ???? ?? ??? ???? ?????."
    DMHints[6]="????? ????? ???? ??? ???? ?, ??????? ?????? ??? ??? ??? ????? ???? ?????."
    DMHints[7]="%SHOWSCORES%? ??? ???? ??(ON/OFF) ? ? ????."
    DMHints[8]="????? ??? ????? ??? ?? ????? ?????? ?? ? ????. ?????? 100????? ???, ??? ? ??? ???? ????? ???? ?? ??? ??? ? ????."
    DMHints[9]="%SHOWSTATS%? ??? ?? ??? ??? ? ? ????."
    DMHints[10]="??? ??? ??? ???? ???? ?????? ???? ??? ? ????."
    DMHints[11]="%TALK%? ??? ???? ???? ?? ??????? ???? ?? ? ????."
    DMHints[12]="%SPEECHMENUTOGGLE%???? ????? ??? ?????? ???? ????? ??? ? ????."
    DMHints[13]="?? (%DUCK%) ???? ?????? ???? ????."
    VoiceTimesUp=".Mode_ETC.v_etc_timesup_R"
    sndModeName=".Mode_FFA.v_ffa_R"
    sndModeExplain=".Mode_TDM.v_tdm_all_R"
    deleAnnounceMatchInfo=DeathMatch.AnnounceMatchInfo
    bRestartLevel=false
    bPauseable=false
    bLoggingGame=true
    DefaultPlayerClassName="WGame.wPawn"
    ScoreBoardType="XInterface.ScoreBoardDeathMatch"
    HUDType="XInterface.HudCDeathMatch"
    MapListType="XInterface.MapListDeathMatch"
    MapPrefix="DM"
    BeaconName="DM"
    MaxPlayers=32
    GoalScore=25
    TimeLimit=20
    MutatorClass="UnrealGame.DMMutator"
    PlayerControllerClassName="WGame.wPlayer"
    Description="?? ??: ??? ??? ?? ????? ????. ???? ???? ??? ??? ???. ?? ?? ??? ?? ????? ?????."
}