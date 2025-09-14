/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DeathMatch.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Structs:1
 *	Properties:91
 *	Functions:108
 *	States:4
 *
 *******************************************************************************/
class DeathMatch extends UnrealMPGameInfo
    dependson(LevelGameRules)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    hidedropdown;

const DMPROPNUM = 14;

struct AddBotInfo
{
    var class<Controller> BotClass;
    var int Team;
    var int Grade;
    var int NPCID;
    var int RegenLoc;
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
var class<SquadAI> DMSquadClass;
var class<LevelGameRules> LevelRulesClass;
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
var delegate<deleAnnounceMatchInfo> __deleAnnounceMatchInfo__Delegate;

function SendBgmMessageBeginMatch()
{
    local Controller P;
    local PlayerController PC;

    P = Level.ControllerList;
    J0x14:
    // End:0x73 [While If]
    if(P != none)
    {
        PC = PlayerController(P);
        // End:0x5c
        if(PC != none)
        {
            PC.ReceiveLocalizedMessage(class'wMessage_BGM', class'wMessage_BGM'.default.Code_Combat);
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function int GetTimeSecondsLeft()
{
    return RemainingTime;
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
    // End:0xa2
    if(bPlayersVsBots || CurrentGameProfile != none)
    {
        GameReplicationInfo.bNoTeamChanges = true;
    }
    // End:0xd9
    if(!bForceNoPlayerLights && bTeamGame || bColoredDMSkins)
    {
        GameReplicationInfo.bAllowPlayerLights = default.bAllowPlayerLights;
    }
    InitTeamSymbols();
    GetBotTeam(InitialBots);
    // End:0x114
    if(CurrentGameProfile == none || bCustomBots && GetBotTeam() != none)
    {
        OverrideInitialBots();
    }
    // End:0x133
    if(bPlayersVsBots)
    {
        GameReplicationInfo.BotDifficulty = int(GameDifficulty);
    }
}

function OverrideInitialBots()
{
    InitialBots = GetBotTeam().OverrideInitialBots(InitialBots, none);
}

function Reset()
{
    super(GameInfo).Reset();
    ElapsedTime = GetNetWait() - 3;
    bWaitForNetPlayers = Level.NetMode != 0;
    bStartedCountDown = false;
    bFinalStartup = false;
    CountDown = default.CountDown;
    RemainingTime = 60 * TimeLimit;
    GotoState('PendingMatch');
}

function bool JustStarted(float t)
{
    // End:0x20
    if(TimeLimit > 0)
    {
        return RemainingTime > 60 * TimeLimit - 20;
    }
    return Level.TimeSeconds < t;
}

function CheckReady()
{
    // End:0x2f
    if(GoalScore == 0 && TimeLimit == 0)
    {
        TimeLimit = 20;
        RemainingTime = 60 * TimeLimit;
    }
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local bool bEnemyKill;
    local int Score;
    local string KillInfo;

    bEnemyKill = !bTeamGame || Killer != none && Killer != Killed && Killed != none && Killer.PlayerReplicationInfo != none && Killed.PlayerReplicationInfo != none && Killer.PlayerReplicationInfo.Team != Killed.PlayerReplicationInfo.Team;
    // End:0xe8
    if(KilledPawn != none && KilledPawn.GetSpree() > 4)
    {
        // End:0xe8
        if(bEnemyKill && Killer != none)
        {
            Killer.AwardAdrenaline(ADR_MajorKill);
        }
    }
    // End:0x283
    if(Killer != none && Killer.bIsPlayer && Killed != none && Killed.bIsPlayer)
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
        // End:0x1f4
        if(!bFirstBlood && Killer != Killed && bEnemyKill)
        {
            Killer.AwardAdrenaline(ADR_MajorKill);
            bFirstBlood = true;
            // End:0x1f4
            if(TeamPlayerReplicationInfo(Killer.PlayerReplicationInfo) != none)
            {
                TeamPlayerReplicationInfo(Killer.PlayerReplicationInfo).bFirstBlood = true;
            }
        }
        // End:0x21a
        if(Killer == Killed)
        {
            Killer.AwardAdrenaline(ADR_MinorError);
        }
        // End:0x283
        else
        {
            // End:0x26f
            if(bTeamGame && Killed.PlayerReplicationInfo.Team == Killer.PlayerReplicationInfo.Team)
            {
                Killer.AwardAdrenaline(ADR_KillTeamMate);
            }
            // End:0x283
            else
            {
                Killer.AwardAdrenaline(ADR_Kill);
            }
        }
    }
    // End:0x400
    if(Killer != none && Killer.bIsPlayer && Killer.PlayerReplicationInfo != none && Vehicle(KilledPawn) != none && Killed != none || Vehicle(KilledPawn).bEjectDriver && Vehicle(KilledPawn).IndependentVehicle())
    {
        Score = VehicleScoreKill(Killer, Killed, Vehicle(KilledPawn), KillInfo);
        // End:0x400
        if(Score > 0)
        {
            // End:0x38a
            if(Killed != none)
            {
                // End:0x38a
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
    super(GameInfo).Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType, bWallShot);
}

function int VehicleScoreKill(Controller Killer, Controller Killed, Vehicle DestroyedVehicle, out string KillInfo)
{
    // End:0x60
    if(Killed == none && PlayerController(Killer) != none)
    {
        PlayerController(Killer).TeamMessage(Killer.PlayerReplicationInfo, YouDestroyed @ DestroyedVehicle.VehicleNameString @ YouDestroyedTrailer, 'CriticalEvent');
    }
    // End:0xb2
    if(KillInfo == "")
    {
        // End:0xb2
        if(DestroyedVehicle.bKeyVehicle || DestroyedVehicle.bHighScoreKill)
        {
            KillInfo = "destroyed_key_vehicle";
            return 5;
        }
    }
    return 0;
}

function InitLogging()
{
    super(GameInfo).InitLogging();
}

static function bool NeverAllowTransloc()
{
    return false;
}

function bool AllowTransloc()
{
    return bAllowTrans || bOverrideTranslocator;
}

function AddGameSpecificInventory(Pawn P)
{
    // End:0x30
    if(AllowTransloc())
    {
        P.CreateInventory("XWeapons.TransLauncher");
    }
    super(GameInfo).AddGameSpecificInventory(P);
}

event InitGame(string Options, out string Error)
{
    local string InOpt;
    local int LevelMinPlayers;

    super(GameInfo).InitGame(Options, Error);
    // End:0x24
    foreach AllActors(class'LevelGameRules', LevelRules)
    {
        // End:0x24
        break;                
    }
    // End:0x40
    if(LevelRules != none)
    {
        LevelRules.UpdateGame(self);
    }
    // End:0xbe
    if(CurrentGameProfile == none && Left(string(Level), 3) ~= "TUT")
    {
        // End:0x7c
        if(GoalScore != 0)
        {
            GoalScore = Max(GoalScore, 3);
        }
        // End:0x9d
        if(TimeLimit != 0 && TimeLimit < 10)
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
    // End:0x120
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
    // End:0x17a
    if(DefaultMaxLives > 0)
    {
        TimeLimit = 0;
    }
    InOpt = ParseOption(Options, "Translocator");
    // End:0x1d1
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
    // End:0x2ae
    if(bTeamGame && Level.NetMode != 0)
    {
        InOpt = ParseOption(Options, "VsBots");
        // End:0x29d
        if(InOpt != "")
        {
            Log("bPlayersVsBots: " $ string(bool(InOpt)));
            bPlayersVsBots = bool(InOpt);
        }
        // End:0x2ae
        if(bPlayersVsBots)
        {
            bAutoNumBots = false;
        }
    }
    InOpt = ParseOption(Options, "AutoAdjust");
    // End:0x30d
    if(InOpt != "")
    {
        bAdjustSkill = !bTeamGame && bool(InOpt);
        Log("Adjust skill " $ string(bAdjustSkill));
    }
    InOpt = ParseOption(Options, "PlayersMustBeReady");
    // End:0x36e
    if(InOpt != "")
    {
        Log("PlayerMustBeReady: " $ string(bool(InOpt)));
        bPlayersMustBeReady = bool(InOpt);
    }
    EnemyRosterName = ParseOption(Options, "DMTeam");
    // End:0x39b
    if(EnemyRosterName != "")
    {
        bCustomBots = true;
    }
    // End:0x3c2
    if(CurrentGameProfile != none)
    {
        MaxLives = 0;
        bAllowTrans = default.bDefaultTranslocator;
        bAdjustSkill = false;
    }
    // End:0x3e1
    if(HasOption(Options, "NumBots"))
    {
        bAutoNumBots = false;
    }
    // End:0x47c
    if(bAutoNumBots && Level.NetMode == 0)
    {
        LevelMinPlayers = GetMinPlayers();
        // End:0x454
        if(bTeamGame && bMustHaveMultiplePlayers)
        {
            // End:0x43c
            if(LevelMinPlayers < 4)
            {
                LevelMinPlayers = 4;
            }
            // End:0x451
            else
            {
                // End:0x451
                if(LevelMinPlayers & 1 == 1)
                {
                    ++ LevelMinPlayers;
                }
            }
        }
        // End:0x468
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
    // End:0x4d8
    else
    {
        MinPlayers = Clamp(GetIntOption(Options, "MinPlayers", MinPlayers), 0, 32);
        InitialBots = Clamp(GetIntOption(Options, "NumBots", InitialBots), 0, 32);
        // End:0x4d8
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
        bTournament = GetIntOption(Options, "Tournament", 1) > 0;
    }
    // End:0x589
    else
    {
        bTournament = GetIntOption(Options, "Tournament", 0) > 0;
    }
    // End:0x598
    if(bTournament)
    {
        CheckReady();
    }
    bWaitForNetPlayers = Level.NetMode != 0;
    InOpt = ParseOption(Options, "QuickStart");
    // End:0x5e6
    if(InOpt != "")
    {
        bQuickStart = true;
    }
    AdjustedDifficulty = GameDifficulty;
    StartPlayerNum = GetIntOption(Options, "playernum", 0);
}

function TweakSkill(Bot B)
{
    // End:0x38
    if(!bTeamGame || Level.NetMode != 0 || CurrentGameProfile == none)
    {
        return;
    }
    // End:0x75
    else
    {
        // End:0x75
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.Team != B.PlayerReplicationInfo.Team)
        {
        }
    }
    B.Skill = FMax(B.Skill, AdjustedDifficulty + 0.20);
}

function int GetMinPlayers()
{
    // End:0x32
    if(CurrentGameProfile == none)
    {
        return Min(12, Level.IdealPlayerCountMax + Level.IdealPlayerCountMin / 2);
    }
    return Level.SinglePlayerTeamSize * 2;
}

function AcceptInventory(Pawn PlayerPawn)
{
    // End:0x2c [While If]
    if(PlayerPawn.Inventory != none)
    {
        J0x00:
        PlayerPawn.Inventory.Destroy();
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    PlayerPawn.Weapon = none;
    PlayerPawn.SelectedItem = none;
    AddDefaultInventory(PlayerPawn);
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
        Log("DeathMatch::CheckEndGameCondition() RemainingTime[" $ string(RemainingTime) $ "] <= 0");
        EndGame(Level.GetLocalPlayerController().PlayerReplicationInfo, "TimeLimit");
        return true;
    }
    // End:0x19a
    else
    {
        i = 0;
        J0x10f:
        // End:0x19a [While If]
        if(i < GameReplicationInfo.PRIArray.Length)
        {
            // End:0x15c
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
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10f;
        }
    }
    return false;
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local Controller P, nextController;
    local PlayerController Player;
    local bool bLastMan;

    // End:0xa4
    if(bOverTime)
    {
        // End:0x1d
        if(NumBots + NumPlayers == 0)
        {
            return true;
        }
        bLastMan = true;
        P = Level.ControllerList;
        J0x39:
        // End:0x99 [While If]
        if(P != none)
        {
            // End:0x82
            if(P.PlayerReplicationInfo != none && !P.PlayerReplicationInfo.bOutOfLives)
            {
                bLastMan = false;
            }
            // End:0x99
            else
            {
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x39;
            }
        }
        // End:0xa4
        if(bLastMan)
        {
            return true;
        }
    }
    bLastMan = Reason ~= "LastMan";
    // End:0xf5
    if(!bLastMan && GameRulesModifiers != none && !GameRulesModifiers.CheckEndGame(Winner, Reason))
    {
        return false;
    }
    // End:0x1b4
    if(Winner == none)
    {
        P = Level.ControllerList;
        J0x114:
        // End:0x1b4 [While If]
        if(P != none)
        {
            // End:0x19d
            if(P.bIsPlayer && !P.PlayerReplicationInfo.bOutOfLives && Winner == none || P.PlayerReplicationInfo.Score >= Winner.Score)
            {
                Winner = P.PlayerReplicationInfo;
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x114;
        }
    }
    // End:0x287
    if(!bLastMan)
    {
        P = Level.ControllerList;
        J0x1d3:
        // End:0x287 [While If]
        if(P != none)
        {
            // End:0x270
            if(P.bIsPlayer && Winner != P.PlayerReplicationInfo && P.PlayerReplicationInfo.Score == Winner.Score && !P.PlayerReplicationInfo.bOutOfLives)
            {
                // End:0x26e
                if(!bOverTimeBroadcast)
                {
                    TieOnTimeOver();
                    bOverTimeBroadcast = true;
                }
                return false;
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x1d3;
        }
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    GameReplicationInfo.Winner = Winner;
    // End:0x2e7
    if(CurrentGameProfile != none)
    {
        CurrentGameProfile.bWonMatch = PlayerController(Winner.Owner) != none;
    }
    // End:0x30d
    if(bLastMan)
    {
        GameReplicationInfo.Winner = Winner.Team;
    }
    P = Level.ControllerList;
    J0x321:
    // End:0x364 [While If]
    if(P != none)
    {
        Player = PlayerController(P);
        // End:0x356
        if(Player != none)
        {
            Player.ClientFadeToBlackWhite();
        }
        P = nextController;
        // This is an implied JumpToken; Continue!
        goto J0x321;
    }
    return true;
}

function PlayWinMessage(PlayerController Player, bool bWinner)
{
    // End:0x2a
    if(UnrealPlayer(Player) != none)
    {
        UnrealPlayer(Player).PlayWinMessage(bWinner);
    }
}

function bool AtCapacity(bool bSpectator)
{
    local Controller C;
    local bool bForcedSpectator;

    // End:0x1b
    if(Level.NetMode == 0)
    {
        return false;
    }
    // End:0x33
    if(bPlayersVsBots)
    {
        MaxPlayers = Min(MaxPlayers, 16);
    }
    // End:0x4b
    if(MaxLives <= 0)
    {
        return super(GameInfo).AtCapacity(bSpectator);
    }
    C = Level.ControllerList;
    J0x5f:
    // End:0xc3 [While If]
    if(C != none)
    {
        // End:0xac
        if(C.PlayerReplicationInfo != none && C.PlayerReplicationInfo.NumLives > LateEntryLives)
        {
            bForcedSpectator = true;
        }
        // End:0xc3
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x5f;
        }
    }
    // End:0xdb
    if(!bForcedSpectator)
    {
        return super(GameInfo).AtCapacity(bSpectator);
    }
    return NumPlayers + NumSpectators >= MaxPlayers + MaxSpectators;
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController NewPlayer;
    local Controller C;

    // End:0x9a
    if(MaxLives > 0)
    {
        C = Level.ControllerList;
        J0x1f:
        // End:0x9a [While If]
        if(C != none)
        {
            // End:0x83
            if(C.PlayerReplicationInfo != none && C.PlayerReplicationInfo.NumLives > LateEntryLives)
            {
                Options = "?SpectatorOnly=1" $ Options;
            }
            // End:0x9a
            else
            {
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x1f;
            }
        }
    }
    NewPlayer = super.Login(Portal, Options, Error);
    // End:0xe8
    if(bMustJoinBeforeStart && GameReplicationInfo.bMatchHasBegun)
    {
        UnrealPlayer(NewPlayer).bLatecomer = true;
    }
    // End:0x169
    if(Level.NetMode == 0)
    {
        // End:0x15e
        if(NewPlayer.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0x15b
            if(!bCustomBots && bAutoNumBots || bTeamGame && float(InitialBots) % float(2) == float(1))
            {
                ++ InitialBots;
            }
        }
        // End:0x169
        else
        {
            StandalonePlayer = NewPlayer;
        }
    }
    return NewPlayer;
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
}

function ChangeLoadOut(PlayerController P, string LoadoutName);
function RestartPlayer(Controller aPlayer)
{
    Log("[DeathMatch::RestartPlayer] name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    // End:0xcb
    if(bMustJoinBeforeStart && UnrealPlayer(aPlayer) != none && UnrealPlayer(aPlayer).bLatecomer)
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
}

function bool TooManyBots(Controller botToRemove)
{
    // End:0x40
    if(Level.NetMode != 0 && bPlayersVsBots)
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
}

function ForceAddBot()
{
    // End:0x38
    if(Level.NetMode != 0)
    {
        MinPlayers = Max(MinPlayers + 1, NumPlayers + NumBots + 1);
    }
    AddBot();
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
    NewBot.PlayerReplicationInfo.PlayerID = ++ CurrentID;
    ++ NumBots;
    // End:0x9d
    if(Level.NetMode == 0)
    {
        RestartPlayer(NewBot);
    }
    // End:0xb2
    else
    {
        NewBot.GotoState('Dead', 'MPStart');
    }
    return true;
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
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
    // End:0x0d
    if(ViewTarget == none)
    {
        return false;
    }
    // End:0x58
    if(Controller(ViewTarget) != none)
    {
        return Controller(ViewTarget).PlayerReplicationInfo != none && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
    }
    return Level.NetMode == 0 || bOnlySpectator;
}

function bool ShouldRespawn(Pickup Other)
{
    return Other.RespawnTime != 0.0;
}

function ChangeName(Controller Other, string S, bool bNameChange)
{
    local Controller aPlayer, C, P;

    // End:0x0e
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
    // End:0x10a
    if(bEpicNames && Bot(Other) != none)
    {
        // End:0xc6
        if(TotalEpic < 21)
        {
            S = EpicNames[int(float(EpicOffset) % float(21))];
            ++ EpicOffset;
            ++ TotalEpic;
        }
        // End:0x10a
        else
        {
            S = NamePrefixes[int(float(NameNumber) % float(10))] $ "CliffyB" $ NameSuffixes[int(float(NameNumber) % float(10))];
            ++ NameNumber;
        }
    }
    aPlayer = Level.ControllerList;
    J0x11e:
    // End:0x2ff [While If]
    if(aPlayer != none)
    {
        // End:0x2e8
        if(aPlayer.bIsPlayer && aPlayer.PlayerReplicationInfo.PlayerName ~= S)
        {
            // End:0x192
            if(Other.IsA('PlayerController'))
            {
                PlayerController(Other).ReceiveLocalizedMessage(GameMessageClass, 8);
                return;
            }
            // End:0x2a5
            else
            {
                // End:0x1d2
                if(Other.PlayerReplicationInfo.bIsFemale)
                {
                    S = FemaleBackupNames[int(float(FemaleBackupNameOffset) % float(32))];
                    ++ FemaleBackupNameOffset;
                }
                // End:0x1f4
                else
                {
                    S = MaleBackupNames[int(float(MaleBackupNameOffset) % float(32))];
                    ++ MaleBackupNameOffset;
                }
                P = Level.ControllerList;
                J0x208:
                // End:0x2a2 [While If]
                if(P != none)
                {
                    // End:0x28b
                    if(P.bIsPlayer && P.PlayerReplicationInfo.PlayerName ~= S)
                    {
                        S = NamePrefixes[int(float(NameNumber) % float(10))] $ S $ NameSuffixes[int(float(NameNumber) % float(10))];
                        ++ NameNumber;
                    }
                    // End:0x2a2
                    else
                    {
                        P = P.nextController;
                        // This is an implied JumpToken; Continue!
                        goto J0x208;
                    }
                }
                // This is an implied JumpToken;
                goto J0x2ff;
            }
            S = NamePrefixes[int(float(NameNumber) % float(10))] $ S $ NameSuffixes[int(float(NameNumber) % float(10))];
            ++ NameNumber;
        }
        // End:0x2ff
        else
        {
            aPlayer = aPlayer.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x11e;
        }
    }
    // End:0x32d
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
    // End:0x3fd
    if(bNameChange)
    {
        C = Level.ControllerList;
        J0x382:
        // End:0x3fd [While If]
        if(C != none)
        {
            // End:0x3e6
            if(PlayerController(C) != none && Viewport(PlayerController(C).Player) != none)
            {
                PlayerController(C).ReceiveLocalizedMessage(class'GameMessage', 2, Other.PlayerReplicationInfo);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x382;
        }
    }
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
        ++ RemainingBots;
    }
    // End:0x41
    if(!NeedPlayers() || AddBot())
    {
        -- RemainingBots;
    }
    return true;
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
    // End:0x49
    if(super(GameInfo).AllowBecomeActivePlayer(P))
    {
        // End:0x47
        if(Level.NetMode == 0 && NumBots > InitialBots)
        {
            -- RemainingBots;
            bPlayerBecameActive = true;
        }
        return true;
    }
    return false;
}

function Logout(Controller Exiting)
{
    super(GameInfo).Logout(Exiting);
    // End:0x26
    if(Exiting.IsA('Bot'))
    {
        -- NumBots;
    }
    // End:0x38
    if(!bKillBots)
    {
        ++ RemainingBots;
    }
    // End:0x55
    if(!NeedPlayers() || AddBot())
    {
        -- RemainingBots;
    }
    // End:0x67
    if(MaxLives > 0)
    {
        CheckMaxLives(none);
    }
}

function bool NeedPlayers()
{
    // End:0x22
    if(Level.NetMode == 0)
    {
        return RemainingBots > 0;
    }
    // End:0x2d
    if(bMustJoinBeforeStart)
    {
        return false;
    }
    // End:0x52
    if(bPlayersVsBots)
    {
        return NumBots < Min(16, int(BotRatio * float(NumPlayers)));
    }
    return NumPlayers + NumBots < MinPlayers;
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    super.GetServerDetails(ServerState);
    AddServerDetail(ServerState, "GoalScore", string(GoalScore));
    AddServerDetail(ServerState, "TimeLimit", string(TimeLimit));
    AddServerDetail(ServerState, "Translocator", string(bAllowTrans));
    AddServerDetail(ServerState, "WeaponStay", string(bWeaponStay));
    AddServerDetail(ServerState, "ForceRespawn", string(bForceRespawn));
}

function InitGameReplicationInfo()
{
    super(GameInfo).InitGameReplicationInfo();
    GameReplicationInfo.GoalScore = GoalScore;
    GameReplicationInfo.TimeLimit = TimeLimit;
    GameReplicationInfo.MinNetPlayers = MinNetPlayers;
}

function InitTeamSymbols();
function UnrealTeamInfo GetBotTeam(optional int TeamBots)
{
    local class<UnrealTeamInfo> RosterClass;

    Log("DeathMatch::GetBotTeam");
    // End:0x2b
    if(EnemyRoster != none)
    {
        return EnemyRoster;
    }
    // End:0x122
    if(CurrentGameProfile != none)
    {
        // End:0xe3
        if(CurrentGameProfile.EnemyTeam != "")
        {
            RosterClass = class<UnrealTeamInfo>(DynamicLoadObject(CurrentGameProfile.EnemyTeam, class'Class'));
            // End:0xd2
            if(RosterClass == none)
            {
                Warn("Invalid EnemyTeam class:" @ CurrentGameProfile.EnemyTeam @ " Expecting subclass of UnrealTeamInfo");
            }
            // End:0xe0
            else
            {
                EnemyRoster = Spawn(RosterClass);
            }
        }
        // End:0x11f
        else
        {
            Log("No EnemyTeam set in CurrentGameProfile, is this correct?");
        }
    }
    // End:0x162
    else
    {
        // End:0x162
        if(EnemyRosterName != "")
        {
            RosterClass = class<UnrealTeamInfo>(DynamicLoadObject(EnemyRosterName, class'Class'));
            // End:0x162
            if(RosterClass != none)
            {
                EnemyRoster = Spawn(RosterClass);
            }
        }
    }
    // End:0x1a1
    if(EnemyRoster == none)
    {
        RosterClass = class<UnrealTeamInfo>(DynamicLoadObject(DefaultEnemyRosterClass, class'Class'));
        // End:0x1a1
        if(RosterClass != none)
        {
            EnemyRoster = Spawn(RosterClass);
        }
    }
    EnemyRoster.Initialize(TeamBots);
    return EnemyRoster;
}

function UnrealTeamInfo GetBotTeam2(bool forceTeam, int Team)
{
    return GetBotTeam();
}

function PreLoadNamedBot(string botname)
{
    EnemyRoster.AddNamedBot(botname);
}

function PreLoadBot()
{
    EnemyRoster.AddRandomPlayer();
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
    // End:0x6e
    if(FullName == "wTeamRoster1")
    {
        Chosen = BotTeam.ChooseBotClass("B-Camo");
    }
    // End:0xc7
    else
    {
        // End:0xa8
        if(FullName == "wTeamRoster0")
        {
            Chosen = BotTeam.ChooseBotClass("B-normal");
        }
        // End:0xc7
        else
        {
            Chosen = BotTeam.ChooseBotClass("B-normal");
        }
    }
    // End:0xea
    if(Chosen.PawnClass == none)
    {
        Chosen.Init();
    }
    NewBot = Bot(Spawn(Chosen.PawnClass.default.ControllerClass));
    // End:0x12f
    if(NewBot != none)
    {
        InitializeBot(NewBot, BotTeam, Chosen);
    }
    return NewBot;
}

function InitializeBot(Bot NewBot, UnrealTeamInfo BotTeam, RosterEntry Chosen)
{
    NewBot.InitializeSkill(AdjustedDifficulty);
    Chosen.InitBot(NewBot);
    BotTeam.AddToTeam(NewBot);
    // End:0x6e
    if(Chosen.ModifiedPlayerName != "")
    {
        ChangeName(NewBot, Chosen.ModifiedPlayerName, false);
    }
    // End:0x88
    else
    {
        ChangeName(NewBot, Chosen.PlayerName, false);
    }
    // End:0x111
    if(bEpicNames && NewBot.PlayerReplicationInfo.PlayerName ~= "The_Reaper")
    {
        NewBot.Accuracy = 1.0;
        NewBot.StrafingAbility = 1.0;
        NewBot.Tactics = 1.0;
        NewBot.InitializeSkill(AdjustedDifficulty + float(2));
    }
    BotTeam.SetBotOrders(NewBot, Chosen);
}

function InitPlacedBot(Controller C, RosterEntry R)
{
    local UnrealTeamInfo BotTeam;

    Log("Init placed bot " $ string(C));
    BotTeam = FindTeamFor(C);
    // End:0x7b
    if(Bot(C) != none)
    {
        Bot(C).InitializeSkill(AdjustedDifficulty);
        // End:0x7b
        if(R != none)
        {
            R.InitBot(Bot(C));
        }
    }
    BotTeam.AddToTeam(C);
    // End:0xb4
    if(R != none)
    {
        ChangeName(C, R.PlayerName, false);
    }
}

function UnrealTeamInfo FindTeamFor(Controller C)
{
    return GetBotTeam();
}

function StartMatch()
{
    local bool bTemp;
    local int Num;

    crlog("[DeathMatch::StartMatch]");
    GotoState('MatchInProgress');
    GameReplicationInfo.bStartedMatch = true;
    // End:0x5f
    if(Level.NetMode == 0)
    {
        RemainingBots = InitialBots;
    }
    // End:0x66
    else
    {
        RemainingBots = 0;
    }
    // End:0x9a
    if(bChangedHost)
    {
        RemainingTime = GameReplicationInfo.RemainingTime;
        ElapsedTime = GameReplicationInfo.ElapsedTime;
    }
    // End:0xae
    else
    {
        GameReplicationInfo.RemainingMinute = RemainingTime;
    }
    super(GameInfo).StartMatch();
    bTemp = bMustJoinBeforeStart;
    bMustJoinBeforeStart = false;
    J0xc9:
    // End:0xfa [While If]
    if(NeedPlayers() && Num < 16)
    {
        // End:0xf0
        if(AddBot())
        {
            -- RemainingBots;
        }
        ++ Num;
        // This is an implied JumpToken; Continue!
        goto J0xc9;
    }
    bMustJoinBeforeStart = bTemp;
    Log("START MATCH");
    // End:0x14d
    if(!IsA('wSDGameInfo') && !Level.GetMatchMaker().BotTutorial)
    {
        deleAnnounceMatchInfo();
    }
    BalanceBots();
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
        J0x3b:
        // End:0xc7 [While If]
        if(C != none)
        {
            // End:0xb0
            if(C.bIsPlayer && !C.PlayerReplicationInfo.bAdminSpecator)
            {
                // End:0xa9
                if(bTeamGame)
                {
                    // End:0x9f
                    if(C.GetTeamNum() == 0)
                    {
                        ++ AF;
                    }
                    // End:0xa6
                    else
                    {
                        ++ rsa;
                    }
                }
                // End:0xb0
                else
                {
                    ++ AF;
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x3b;
        }
        lp1 = 0;
        J0xce:
        // End:0x10f [While If]
        if(lp1 < AddBotQueue.Length)
        {
            // End:0xfe
            if(AddBotQueue[lp1].Team == 0)
            {
                ++ AF;
            }
            // End:0x105
            else
            {
                ++ rsa;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0xce;
        }
        afAdd = MM.BotNum0 - AF;
        // End:0x163
        if(afAdd > 0)
        {
            AddwAIBot(string(afAdd), "0", "WGame.wAIBot", string(MM.BotDifficulty));
        }
        rsaAdd = MM.BotNum1 - rsa;
        // End:0x1b7
        if(rsaAdd > 0)
        {
            AddwAIBot(string(rsaAdd), "1", "WGame.wAIBot", string(MM.BotDifficulty));
        }
        // End:0x219
        if(bTeamGame)
        {
            // End:0x1eb
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
        // End:0x238
        else
        {
            Level.AILevel.KillBots(-afAdd);
        }
    }
}

delegate deleAnnounceMatchInfo();
function AnnounceMatchInfo()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xa4 [While If]
    if(C != none)
    {
        // End:0x8d
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ string(sndModeName), 1);
            PlayerController(C).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ string(sndModeExplain), 1);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function EndGame(PlayerReplicationInfo Winner, string Reason)
{
    // End:0xcb
    if(Reason ~= "triggered" || Reason ~= "LastMan" || Reason ~= "TimeLimit" || Reason ~= "FragLimit" || Reason ~= "TeamScoreLimit")
    {
        crlog("[DeathMatch::EndGame] Reason=" $ Reason);
        super(GameInfo).EndGame(Winner, Reason);
        // End:0xcb
        if(bGameEnded)
        {
            SetGameEndType(Reason);
            GotoState('MatchOver');
        }
    }
}

function SetGameEndType(string Reason)
{
    // End:0x7a
    if(Reason ~= "TeamScoreLimit" || Reason ~= "FragLimit" || Reason ~= "roundlimit")
    {
        Level.GetMatchMaker().GameEndType = Level.GetMatchMaker().6;
    }
    // End:0x132
    else
    {
        // End:0xc0
        if(Reason ~= "TimeLimit")
        {
            Level.GetMatchMaker().GameEndType = Level.GetMatchMaker().1;
        }
        // End:0x132
        else
        {
            // End:0x104
            if(Reason ~= "LastMan")
            {
                Level.GetMatchMaker().GameEndType = Level.GetMatchMaker().11;
            }
            // End:0x132
            else
            {
                Level.GetMatchMaker().GameEndType = Level.GetMatchMaker().10;
            }
        }
    }
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint Best;

    // End:0x35
    if(Player != none && Player.StartSpot != none)
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
}

function NavigationPoint FindPlayerStart_TU(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;
    local int lp1;
    local PlayerStart_Defence S;
    local NavigationPoint respawnPoint;
    local array<PlayerStart_Defence> candidates;

    // End:0x77
    if(Player != none && Player.PlayerReplicationInfo != none)
    {
        // End:0x69
        if(Player.PlayerReplicationInfo.Team != none)
        {
            Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);
        }
        // End:0x74
        else
        {
            Team = inTeam;
        }
    }
    // End:0x82
    else
    {
        Team = inTeam;
    }
    lp1 = 0;
    J0x89:
    // End:0xe8 [While If]
    if(lp1 < EveryDFPlayerStarts.Length)
    {
        S = EveryDFPlayerStarts[lp1];
        // End:0xde
        if(!IsRespawnPointFailedRecently(S) && !IsAnyPawnWithinRadius(S))
        {
            candidates[candidates.Length] = S;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x89;
    }
    Log("length=" $ string(candidates.Length));
    // End:0x128
    if(candidates.Length != 0)
    {
        S = candidates[Rand(candidates.Length)];
        respawnPoint = S;
    }
    return respawnPoint;
}

function PlayEndOfMatchMessage();
function PlayStartupMessage()
{
    local Controller P;

    P = Level.ControllerList;
    J0x14:
    // End:0x5f [While If]
    if(P != none)
    {
        // End:0x48
        if(UnrealPlayer(P) != none)
        {
            UnrealPlayer(P).PlayStartupMessage(StartupStage);
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function int GetNetWait()
{
    // End:0x25
    if(Level.GetMatchMaker().kClanMatch_InChannel)
    {
        return NetWaitClan;
    }
    // End:0x2b
    else
    {
        return NetWait;
    }
}

function AnnounceTimesUp()
{
    local Controller P;

    P = Level.ControllerList;
    J0x14:
    // End:0x96 [While If]
    if(P != none)
    {
        // End:0x7f
        if(P.IsA('PlayerController') && !P.PlayerReplicationInfo.bOnlySpectator)
        {
            PlayerController(P).QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ string(VoiceTimesUp), 1);
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function GameAddDefaultInventory(Pawn P)
{
    Log("[DeathMatch::GameAddDefaultInventory]");
    InventoryList[InventoryList.Length] = P;
    InventoryListLastTime = Level.TimeSeconds;
}

function ProcessDefaultInv()
{
    local Pawn P;

    // End:0x4e
    if(Level.TimeSeconds - InventoryListLastTime > 0.10)
    {
        J0x1f:
        // End:0x4e [While If]
        if(InventoryList.Length > 0)
        {
            P = InventoryList[0];
            InventoryList.Remove(0, 1);
            AddDefaultInventory(P);
            // This is an implied JumpToken; Continue!
            goto J0x1f;
        }
    }
}

function UpdateVehicles()
{
    local Vehicle V;

    Log("[DeathMatch::UpdateVehicles]");
    Vehicles.Remove(0, Vehicles.Length);
    // End:0x50
    foreach DynamicActors(class'Vehicle', V)
    {
        Vehicles[Vehicles.Length] = V;                
    }
}

event ForcedStartMatch()
{
    GotoState('ChangeHost');
}

function CalcItemUsedTimeAll()
{
    local Pawn P;

    Log("[DeathMatch::CalcItemUsedTimeAll]");
    // End:0x93
    foreach DynamicActors(class'Pawn', P)
    {
        P.CalcItemUsedTimeSelf();
        // End:0x92
        if(P.PlayerReplicationInfo != none)
        {
            Level.GetMatchMaker().GetUserInfoByUserName(P.PlayerReplicationInfo.PlayerName).LogUsedStatus();
        }                
    }
}

function OnKillingDropOut(Pawn P);
function RecoverHelicopter(Pawn P)
{
    local Controller C;
    local bool bDestroyed;

    Log("[RecoverHelicopter]");
    bDestroyed = false;
    // End:0xa6
    foreach DynamicActors(class'Controller', C)
    {
        // End:0xa5
        if(C.PlayerReplicationInfo.PlayerName == P.OwnerName)
        {
            Log("[RecoverHelicopter] found controller");
            PlayerController(C).ServerCallHelicopter(P);
            bDestroyed = true;
        }
        // End:0xa6
        else
        {
            continue;
        }        
    }
    // End:0xd5
    if(!bDestroyed)
    {
        P.Died(none, class'wDamageChangedHost', P.Location);
    }
}

function ContinueMatch()
{
    local Pawn P;
    local Actor A;

    Log("DathMatch::ContinueMatch()");
    StartMatch();
    AllReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_ContinueFromChangeHost);
    // End:0x5d
    foreach DynamicActors(class'Actor', A)
    {
        A.RecoverFromHostChange();                
    }
    // End:0x12b
    foreach DynamicActors(class'Pawn', P)
    {
        // End:0x12a
        if(P.Controller == none)
        {
            // End:0xa4
            if(P.IsA('wHelicopter'))
            {
                RecoverHelicopter(P);
            }
            // End:0x12a
            else
            {
                // End:0x12a
                if(P.IsA('wPawn'))
                {
                    OnKillingDropOut(P);
                    Log("DeathMatch::ContinueMatch() Pawn died because Controller is none");
                    P.Died(none, class'wDamageChangedHost', P.Location);
                }
            }
        }                
    }
    GetUserBackToVehicle();
    bChangedHost = false;
}

function GetUserBackToVehicle()
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:
    // End:0x73 [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x5c
        if(PC != none)
        {
            class'wGameStateStorageGetter'.static.GetUserVehicle(PC.GSSS, PC);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function ChangeHostExtraWork();
function bool CheckLives(PlayerReplicationInfo Scorer)
{
    local Controller C;
    local PlayerReplicationInfo Living;
    local bool bNoneLeft, bCheck;

    bCheck = true;
    // End:0x2d
    if(IsA('wDeathMatch'))
    {
        // End:0x2d
        if(NumPlayers + NumBots > 1)
        {
            bCheck = false;
        }
    }
    // End:0x23b
    if(bCheck)
    {
        // End:0x62
        if(Scorer != none && !Scorer.bOutOfLives)
        {
            Living = Scorer;
        }
        bNoneLeft = true;
        C = Level.ControllerList;
        J0x7e:
        // End:0x1d5 [While If]
        if(C != none)
        {
            // End:0x1be
            if(C.PlayerReplicationInfo != none && C.bIsPlayer && !C.PlayerReplicationInfo.bOnlySpectator && !C.PlayerReplicationInfo.bAdminSpecator)
            {
                // End:0x111
                if(Living == none)
                {
                    Living = C.PlayerReplicationInfo;
                }
                // End:0x1be
                else
                {
                    // End:0x1be
                    if(C.PlayerReplicationInfo != Living)
                    {
                        // End:0x142
                        if(IsA('wDeathMatch'))
                        {
                            bNoneLeft = false;
                            // This is an implied JumpToken;
                            goto J0x1d5;
                        }
                        // End:0x1be
                        else
                        {
                            // End:0x1be
                            if(C.PlayerReplicationInfo.Team != none && Living.Team != none && C.PlayerReplicationInfo.Team.TeamIndex != Living.Team.TeamIndex)
                            {
                                bNoneLeft = false;
                            }
                            // End:0x1d5
                            else
                            {
                            }
                        }
                    }
                }
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x7e;
            }
        }
        // End:0x1e9
        if(AddBotQueue.Length > 0)
        {
            bNoneLeft = false;
        }
        // End:0x23b
        if(bNoneLeft)
        {
            GameReplicationInfo.RoundState = 3;
            // End:0x225
            if(Living != none)
            {
                EndGame(Living, "LastMan");
            }
            // End:0x239
            else
            {
                EndGame(Scorer, "LastMan");
            }
            return true;
        }
    }
    return false;
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart P;
    local float Score, NextDist;
    local Controller OtherPlayer;
    local float fTemp;

    // End:0x1f
    if(Player.IsA('wPlayer'))
    {
        fTemp = 1.0;
    }
    P = PlayerStart(N);
    // End:0x73
    if(P == none || !P.bEnabled || P.PhysicsVolume.bWaterVolume)
    {
        return -10000000.0;
    }
    // End:0x11e
    if(Level.bUseSDRespawnInTeamGame && Level.GRI.GameClass ~= "WGame.wTeamGame")
    {
        // End:0xd3
        if(!P.IsA('PlayerStart_SD'))
        {
            return -10000000.0;
        }
        // End:0x11b
        else
        {
            // End:0xff
            if(Team == 0)
            {
                // End:0xfc
                if(!P.IsA('PlayerStart_SD_ATTACKER'))
                {
                    return -10000000.0;
                }
            }
            // End:0x11b
            else
            {
                // End:0x11b
                if(!P.IsA('PlayerStart_SD_PROTECTOR'))
                {
                    return -10000000.0;
                }
            }
        }
    }
    // End:0x14e
    else
    {
        // End:0x14e
        if(P.IsA('PlayerStart_DOM') || P.IsA('PlayerStart_SD'))
        {
            return -10000000.0;
        }
    }
    Score = 1000000.0;
    Score += FMax(float(NumPlayers + NumBots) * 0.40, 2.0) * VSize(P.Location - Player.Location);
    OtherPlayer = Level.ControllerList;
    J0x1b2:
    // End:0x326 [While If]
    if(OtherPlayer != none)
    {
        // End:0x30f
        if(OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none)
        {
            NextDist = VSize(OtherPlayer.Pawn.Location - P.Location);
            // End:0x254
            if(NextDist < OtherPlayer.Pawn.CollisionRadius + OtherPlayer.Pawn.CollisionHeight)
            {
                return -1000000.0;
            }
            // End:0x2b3
            if(OtherPlayer.GetTeamNum() == Team && Locs(Level.GRI.GameClass) != Locs("WGame.wDeathMatch"))
            {
                Score -= NextDist;
            }
            // End:0x30f
            else
            {
                // End:0x2ef
                if(FastTrace(P.Location, OtherPlayer.Pawn.Location))
                {
                    Score -= float(200000);
                }
                // End:0x30f
                else
                {
                    Score -= FMax(30000.0 - float(10) * NextDist, 0.0);
                }
            }
        }
        OtherPlayer = OtherPlayer.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x1b2;
    }
    Score -= float(Rand(10000 * NumPlayers + NumBots / 16));
    return FMax(Score, 5.0);
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
        if(Scorer != none && !Scorer.bOutOfLives)
        {
            Living = Scorer;
        }
        bNoneLeft = true;
        C = Level.ControllerList;
        J0x53:
        // End:0x120 [While If]
        if(C != none)
        {
            // End:0x109
            if(C.PlayerReplicationInfo != none && C.bIsPlayer && !C.PlayerReplicationInfo.bOutOfLives && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                // End:0xe6
                if(Living == none)
                {
                    Living = C.PlayerReplicationInfo;
                }
                // End:0x109
                else
                {
                    // End:0x109
                    if(C.PlayerReplicationInfo != Living)
                    {
                        bNoneLeft = false;
                    }
                    // End:0x120
                    else
                    {
                    }
                }
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x53;
            }
        }
        // End:0x161
        if(bNoneLeft)
        {
            // End:0x14b
            if(Living != none)
            {
                EndGame(Living, "LastMan");
            }
            // End:0x15f
            else
            {
                EndGame(Scorer, "LastMan");
            }
            return true;
        }
    }
    return false;
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
    if(GameRulesModifiers != none && GameRulesModifiers.CheckScore(Scorer))
    {
        return;
    }
    // End:0x132
    if(Scorer != none)
    {
        // End:0x81
        if(GoalScore > 0 && Scorer.Score >= float(GoalScore))
        {
            EndGame(Scorer, "fraglimit");
        }
        // End:0x132
        else
        {
            // End:0x132
            if(bOverTime)
            {
                C = Level.ControllerList;
                J0x9e:
                // End:0x11c [While If]
                if(C != none)
                {
                    // End:0x105
                    if(C.PlayerReplicationInfo != none && C.PlayerReplicationInfo != Scorer && C.PlayerReplicationInfo.Score >= Scorer.Score)
                    {
                        return;
                    }
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x9e;
                }
                EndGame(Scorer, "fraglimit");
            }
        }
    }
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
}

function ScoreKill(Controller Killer, Controller Other)
{
    local PlayerReplicationInfo OtherPRI;

    OtherPRI = Other.PlayerReplicationInfo;
    // End:0x55
    if(OtherPRI != none)
    {
        // End:0x55
        if(MaxLives > 0 && OtherPRI.NumLives >= MaxLives)
        {
            OtherPRI.bOutOfLives = true;
        }
    }
    super(GameInfo).ScoreKill(Killer, Other);
    // End:0x7f
    if(Killer == none || Other == none)
    {
        return;
    }
    // End:0x112
    if(bAdjustSkill && Killer.IsA('PlayerController') || Other.IsA('PlayerController'))
    {
        // End:0xe3
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
}

function AdjustSkill(AIController B, PlayerController P, bool bWinner)
{
    // End:0x7d
    if(bWinner)
    {
        PlayerKills += 1;
        AdjustedDifficulty = FMax(0.0, AdjustedDifficulty - 2.0 / FMin(float(PlayerKills), 10.0));
        // End:0x7a
        if(B.Skill > AdjustedDifficulty)
        {
            B.Skill = AdjustedDifficulty;
            Bot(B).ResetSkill();
        }
    }
    // End:0xda
    else
    {
        PlayerDeaths += 1;
        AdjustedDifficulty = FMin(7.0, AdjustedDifficulty + 2.0 / FMin(float(PlayerDeaths), 10.0));
        // End:0xda
        if(B.Skill < AdjustedDifficulty)
        {
            B.Skill = AdjustedDifficulty;
        }
    }
    // End:0xfe
    if(Abs(AdjustedDifficulty - GameDifficulty) >= float(1))
    {
        GameDifficulty = AdjustedDifficulty;
        SaveConfig();
    }
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, optional int iWeaponType)
{
    // End:0x6c
    if(instigatedBy != none && instigatedBy != injured && Level.TimeSeconds - injured.SpawnTime < SpawnProtectionTime && class<WeaponDamageType>(DamageType) != none || class<VehicleDamageType>(DamageType) != none)
    {
        return 0;
    }
    Damage = super(GameInfo).ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
    // End:0xac
    if(instigatedBy == none)
    {
        return Damage;
    }
    return int(float(Damage) * instigatedBy.DamageScaling);
}

exec function setFakeUID()
{
    GiveBotsFakeUID = !GiveBotsFakeUID;
    clog("GiveBotsFakeUID=" $ string(GiveBotsFakeUID));
}

exec function dobalancebots()
{
    BalanceBots();
}

exec function AddNamedBot(string botname)
{
    // End:0x38
    if(Level.NetMode != 0)
    {
        MinPlayers = Max(MinPlayers + 1, NumPlayers + NumBots + 1);
    }
    AddBot(botname);
}

exec function AddBots(int Num)
{
    Num = Clamp(Num, 0, 32 - NumPlayers + NumBots);
    J0x1e:
    // End:0x6c [While If]
    if(-- Num >= 0)
    {
        // End:0x63
        if(Level.NetMode != 0)
        {
            MinPlayers = Max(MinPlayers + 1, NumPlayers + NumBots + 1);
        }
        AddBot();
        // This is an implied JumpToken; Continue!
        goto J0x1e;
    }
}

exec function KillBots(int Num)
{
    local Controller C, NextC;

    bPlayersVsBots = false;
    // End:0x1e
    if(Num == 0)
    {
        Num = NumBots;
    }
    C = Level.ControllerList;
    // End:0x52
    if(Level.NetMode != 0)
    {
        MinPlayers = 0;
    }
    bKillBots = true;
    J0x5a:
    // End:0xba [While If]
    if(C != none && Num > 0)
    {
        NextC = C.nextController;
        // End:0xac
        if(C.IsA('Bot'))
        {
            Kill(C);
            -- Num;
        }
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    bKillBots = false;
}

function Kill(Controller C)
{
    local array<int> BotID;

    // End:0x38
    if(Level.NetMode != 0)
    {
        MinPlayers = Max(MinPlayers - 1, NumPlayers + NumBots - 1);
    }
    // End:0xba
    if(Vehicle(C.Pawn) != none && Vehicle(C.Pawn).Driver != none)
    {
        Vehicle(C.Pawn).Driver.KilledBy(Vehicle(C.Pawn).Driver);
    }
    // End:0xf4
    else
    {
        // End:0xf4
        if(C.Pawn != none)
        {
            C.Pawn.KilledBy(C.Pawn);
        }
    }
    // End:0x1ba
    if(C != none)
    {
        // End:0x19e
        if(C.PlayerReplicationInfo.bBot && C.PlayerReplicationInfo.UID != -1 && GiveBotsFakeUID == false)
        {
            BotID[0] = C.PlayerReplicationInfo.UID;
            BTSend.sfReqReturnBotID(BotID);
            Log("sfReqReturnBotID " $ string(BotID[0]));
        }
        C.GotoState('Dead');
        C.Destroy();
    }
}

exec function Killaibots(optional int Num)
{
    // End:0x16
    if(Num == 0)
    {
        Num = 999;
    }
    Level.GetAILevel().KillBots(Num);
}

function EnqueueAddBot(class<Controller> BotClass, int Team, int Grade, int NPCID, optional int RegenLoc)
{
    local AddBotInfo i;

    i.BotClass = BotClass;
    i.Team = Team;
    i.Grade = Grade;
    i.NPCID = NPCID;
    i.RegenLoc = RegenLoc;
    AddBotQueue[AddBotQueue.Length] = i;
}

function HandleGetBotID(int Team, array<int> BotID)
{
    local int lp1;
    local AddBotInfo cur;
    local Controller Bot;
    local UnrealTeamInfo BotTeam;

    dblog("[DeathMatch::HandleGetBotID] AddBotQueue=" $ string(AddBotQueue.Length) $ " BotID=" $ string(BotID.Length));
    lp1 = AddBotQueue.Length - 1;
    J0x5f:
    // End:0x1b8 [While If]
    if(lp1 >= 0 && BotID.Length > 0)
    {
        cur = AddBotQueue[lp1];
        // End:0x1ae
        if(Team == cur.Team)
        {
            Bot = Spawn(cur.BotClass);
            // End:0x1ae
            if(Bot != none)
            {
                ++ NumBots;
                Bot.PlayerReplicationInfo.PlayerID = ++ CurrentID;
                Bot.PlayerReplicationInfo.NPCID = cur.NPCID;
                Bot.PlayerReplicationInfo.UID = BotID[BotID.Length - 1];
                Bot.RegenLoc = cur.RegenLoc;
                BotID.Remove(BotID.Length - 1, 1);
                AddBotQueue.Remove(lp1, 1);
                BotTeam = GetBotTeam2(true, Team);
                BotTeam.AddToTeam(Bot);
                Bot.InitBot(cur.Grade);
                Bot.GotoState('Dead');
            }
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    dblog("[DeathMatch::rfAckGetBotID] Result=" $ string(Result) $ " RequestedAFCount=" $ string(RequestedAFCount) $ " RequestedRSACount=" $ string(RequestedRSACount) $ " AFBotID=" $ string(AFBotID.Length) $ " RSABotID=" $ string(RSABotID.Length));
    HandleGetBotID(0, AFBotID);
    HandleGetBotID(1, RSABotID);
    return true;
}

function AddwAIBot(string strNum, string strTeam, string aiClass, optional string strGrade, optional string strNPCID, optional string strRegenLoc)
{
    local class<Controller> BotClass;
    local int lp1, Num, Team, NPCID, Grade, RegenLoc;

    local bool forceTeam;
    local array<int> BotID;

    // End:0x16
    if(strNum == "")
    {
        Num = 1;
    }
    // End:0x28
    else
    {
        Num = Clamp(int(strNum), 0, 16);
    }
    // End:0x3f
    if(strTeam == "")
    {
        forceTeam = false;
    }
    // End:0x54
    else
    {
        forceTeam = true;
        Team = int(strTeam);
    }
    // End:0x6a
    if(strGrade == "")
    {
        Grade = 1;
    }
    // End:0x77
    else
    {
        Grade = int(strGrade);
    }
    NPCID = int(strNPCID);
    RegenLoc = int(strRegenLoc);
    dblog("[DeathMatch::AddwAIBot] num=" $ string(Num) $ " forceTeam=" $ string(forceTeam) $ " team=" $ string(Team) $ " aiClass=" $ aiClass $ " grade=" $ string(Grade) $ " npcID=" $ string(NPCID));
    BotClass = class<Controller>(DynamicLoadObject(aiClass, class'Class'));
    lp1 = 0;
    J0x148:
    // End:0x1a6 [While If]
    if(lp1 < Num)
    {
        EnqueueAddBot(BotClass, Team, Grade, NPCID, RegenLoc);
        // End:0x19c
        if(GiveBotsFakeUID)
        {
            BotID[0] = NPCID;
            HandleGetBotID(Team, BotID);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x148;
    }
    // End:0x225
    if(!GiveBotsFakeUID)
    {
        dblog("sfReqGetBotID num=" $ string(Num) $ " team=" $ string(Team));
        // End:0x20d
        if(Team == 0)
        {
            BTSend.sfReqGetBotID(byte(Num), 0);
        }
        // End:0x225
        else
        {
            BTSend.sfReqGetBotID(0, byte(Num));
        }
    }
}

exec function addaibot(string Num, string Team, string Grade, string NPCID)
{
    AddwAIBot(Num, Team, "WGame.wAIBot", Grade, NPCID);
}

exec function addai(string Num, string Team)
{
    AddwAIBot(Num, Team, "WGame.wAIBotDummy");
}

exec function addaifire(string Num, string Team)
{
    AddwAIBot(Num, Team, "WGame.wAIBotDummyFire");
}

exec function addaistrike(int Num)
{
    local int lp1;
    local Vector V;
    local Actor A;

    Num = Clamp(Num, 1, 8);
    lp1 = 0;
    J0x17:
    // End:0xd7 [While If]
    if(lp1 < Num)
    {
        V = EverySDPlayerStarts[int(float(lp1) % float(EverySDPlayerStarts.Length))].Location;
        V.Z += float(3000);
        A = Spawn(class<wProjectile>(DynamicLoadObject("WWeapons.wAirStrikeProjInfinite", class'Class')),,, V);
        clog("" $ string(lp1) $ " at " $ string(A.Location));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

function ReviewJumpSpots(name TestLabel)
{
    local NavigationPoint StartSpot;
    local Controller C;
    local Pawn P;
    local Bot B;
    local class<Pawn> PawnClass;

    bReviewingJumpSpots = true;
    B = Spawn(class'Bot');
    B.Squad = Spawn(class'DMSquad');
    StartSpot = FindPlayerStart(B, 0);
    PawnClass = class<Pawn>(DynamicLoadObject(DefaultPlayerClassName, class'Class'));
    P = Spawn(PawnClass,,, StartSpot.Location, StartSpot.Rotation);
    // End:0xbf
    if(P == none)
    {
        Log("Failed to spawn pawn to reviewjumpspots");
        return;
    }
    B.Possess(P);
    B.GoalString = "TRANSLOCATING";
    C = Level.ControllerList;
    J0x105:
    // End:0x17d [While If]
    if(C != none)
    {
        // End:0x166
        if(PlayerController(C) != none)
        {
            PlayerController(C).bBehindView = true;
            PlayerController(C).SetViewTarget(P);
            UnrealPlayer(C).ShowAI();
        }
        // End:0x17d
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x105;
        }
    }
    P.GiveWeapon("XWeapons.TransLauncher");
    // End:0x1c1
    if(TestLabel == 'None')
    {
        TestLabel = 'Begin';
    }
    // End:0x1d2
    else
    {
        B.bSingleTestSection = true;
    }
    B.GotoState('Testing', TestLabel);
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x30
    if(default.MaxLives <= 0 && InStr(PropertyName, "LateEntryLives") != -1)
    {
        return false;
    }
    // End:0x7c
    if(!default.bColoredDMSkins && !default.bTeamGame || default.bForceNoPlayerLights && InStr(PropertyName, "bAllowPlayerLights") != -1)
    {
        return false;
    }
    return super(GameInfo).AcceptPlayInfoProperty(PropertyName);
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
    class'MasterServerUplink'.static.FillPlayInfo(PlayInfo);
    PlayInfo.PopClass();
}

static function string GetDisplayText(string PropName)
{
    switch(PropName)
    {
        // End:0x1b
        case "NetWait":
            return default.DMPropsDisplayText[0];
        // End:0x35
        case "MinNetPlayers":
            return default.DMPropsDisplayText[1];
        // End:0x4e
        case "RestartWait":
            return default.DMPropsDisplayText[2];
        // End:0x67
        case "bTournament":
            return default.DMPropsDisplayText[3];
        // End:0x88
        case "bPlayersMustBeReady":
            return default.DMPropsDisplayText[4];
        // End:0xa3
        case "bForceRespawn":
            return default.DMPropsDisplayText[5];
        // End:0xbd
        case "bAdjustSkill":
            return default.DMPropsDisplayText[6];
        // End:0xd7
        case "bAllowTaunts":
            return default.DMPropsDisplayText[7];
        // End:0xf8
        case "SpawnProtectionTime":
            return default.DMPropsDisplayText[8];
        // End:0x111
        case "bAllowTrans":
            return default.DMPropsDisplayText[9];
        // End:0x12e
        case "bColoredDMSkins":
            return default.DMPropsDisplayText[10];
        // End:0x14a
        case "LateEntryLives":
            return default.DMPropsDisplayText[12];
        // End:0x16a
        case "bAllowPlayerLights":
            return default.DMPropsDisplayText[13];
        // End:0xffff
        default:
            return super(GameInfo).GetDisplayText(PropName);
    }
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1b
        case "NetWait":
            return default.DMPropDescText[0];
        // End:0x35
        case "MinNetPlayers":
            return default.DMPropDescText[1];
        // End:0x4e
        case "RestartWait":
            return default.DMPropDescText[2];
        // End:0x67
        case "bTournament":
            return default.DMPropDescText[3];
        // End:0x88
        case "bPlayersMustBeReady":
            return default.DMPropDescText[4];
        // End:0xa3
        case "bForceRespawn":
            return default.DMPropDescText[5];
        // End:0xbd
        case "bAdjustSkill":
            return default.DMPropDescText[6];
        // End:0xd7
        case "bAllowTaunts":
            return default.DMPropDescText[7];
        // End:0xf8
        case "SpawnProtectionTime":
            return default.DMPropDescText[8];
        // End:0x111
        case "bAllowTrans":
            return default.DMPropDescText[9];
        // End:0x12e
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
        // End:0xffff
        default:
            return super.GetDescriptionText(PropName);
    }
}

function NotifySpree(Controller Other, int Num)
{
    local Controller C;

    // End:0x16
    if(Num == 5)
    {
        Num = 0;
    }
    // End:0x8a
    else
    {
        // End:0x2c
        if(Num == 10)
        {
            Num = 1;
        }
        // End:0x8a
        else
        {
            // End:0x43
            if(Num == 15)
            {
                Num = 2;
            }
            // End:0x8a
            else
            {
                // End:0x5a
                if(Num == 20)
                {
                    Num = 3;
                }
                // End:0x8a
                else
                {
                    // End:0x71
                    if(Num == 25)
                    {
                        Num = 4;
                    }
                    // End:0x8a
                    else
                    {
                        // End:0x88
                        if(Num == 30)
                        {
                            Num = 5;
                        }
                        // End:0x8a
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
    J0x14f:
    // End:0x1ad [While If]
    if(C != none)
    {
        // End:0x196
        if(PlayerController(C) != none)
        {
            PlayerController(C).ReceiveLocalizedMessage(class'KillingSpreeMessage', Num, Other.PlayerReplicationInfo);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14f;
    }
}

function EndSpree(Controller Killer, Controller Other)
{
    local Controller C;

    // End:0x23
    if(Other == none || !Other.bIsPlayer)
    {
        return;
    }
    C = Level.ControllerList;
    J0x37:
    // End:0xfd [While If]
    if(C != none)
    {
        // End:0xe6
        if(PlayerController(C) != none)
        {
            // End:0xb0
            if(Killer == Other || Killer == none || !Killer.bIsPlayer)
            {
                PlayerController(C).ReceiveLocalizedMessage(class'KillingSpreeMessage', 1, none, Other.PlayerReplicationInfo);
            }
            // End:0xe6
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(class'KillingSpreeMessage', 0, Other.PlayerReplicationInfo, Killer.PlayerReplicationInfo);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
}

function bool WantsPickups(Bot B)
{
    return true;
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super(GameInfo).PrecacheGameAnnouncements(V, bRewardSounds);
}

event SetGrammar();
static function string GetNextLoadHint(string MapName)
{
    local array<string> Hints;

    // End:0x1b
    if(Rand(100) < 75)
    {
        Hints = GetAllLoadHints(true);
    }
    // End:0x27
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
    J0x2c:
    // End:0x5e [While If]
    if(i < default.DMHints.Length)
    {
        Hints[Hints.Length] = default.DMHints[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    return Hints;
}

function AnnounceArtillery(Controller Caller)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xd2 [While If]
    if(C != none)
    {
        // End:0x31
        if(C == Caller)
        {
        }
        // End:0xbb
        else
        {
            // End:0x94
            if(C.IsA('PlayerController') && C.GetTeamNum() == Caller.GetTeamNum())
            {
                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_AllyArtillery);
            }
            // End:0xbb
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_EnemyArtillery);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function AnnounceHelicopter(Controller Caller)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xd2 [While If]
    if(C != none)
    {
        // End:0x31
        if(C == Caller)
        {
        }
        // End:0xbb
        else
        {
            // End:0x94
            if(C.IsA('PlayerController') && C.GetTeamNum() == Caller.GetTeamNum())
            {
                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_AllyHelicopter);
            }
            // End:0xbb
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_EnemyHelicopter);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function AnnounceUAV(Controller Caller)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xd2 [While If]
    if(C != none)
    {
        // End:0x31
        if(C == Caller)
        {
        }
        // End:0xbb
        else
        {
            // End:0x94
            if(C.IsA('PlayerController') && C.GetTeamNum() == Caller.GetTeamNum())
            {
                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_AllyUAV);
            }
            // End:0xbb
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_EnemyUAV);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function PermitWeaponChangeInSpecialMode();

auto state PendingMatch
{
    function SendCountDown(int CountDown)
    {
        local Controller P;
        local PlayerController PC;

        P = Level.ControllerList;
        J0x14:
        // End:0x79 [While If]
        if(P != none)
        {
            PC = PlayerController(P);
            // End:0x62
            if(PC != none)
            {
                PC.ClientMessage("Match Count - " $ string(CountDown));
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }

    function RestartPlayer(Controller aPlayer)
    {
        // End:0x16
        if(CountDown <= 0)
        {
            super(GameInfo).RestartPlayer(aPlayer);
        }
    }

    function bool AddBot(optional string botname)
    {
        // End:0x20
        if(Level.NetMode == 0)
        {
            ++ InitialBots;
        }
        // End:0x3a
        if(botname != "")
        {
            PreLoadNamedBot(botname);
        }
        // End:0x40
        else
        {
            PreLoadBot();
        }
        return true;
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
        // End:0x3a8
        if(bWaitForNetPlayers && Level.NetMode != 0)
        {
            StartupStage = byte(GetNetWait() - ElapsedTime + 10);
            // End:0x6f
            if(NumPlayers >= MinNetPlayers)
            {
                ++ ElapsedTime;
            }
            // End:0x76
            else
            {
                ElapsedTime = 0;
            }
            bEveryonePrecached = true;
            Log("[DeathMatch::PendingMatch::Timer] check bEveryonePrecached");
            P = Level.ControllerList;
            J0xd0:
            // End:0x19b [While If]
            if(P != none)
            {
                // End:0x184
                if(P.IsA('PlayerController') && P.PlayerReplicationInfo != none && P.bIsPlayer && PlayerController(P).bPlayFromStart)
                {
                    // End:0x184
                    if(!P.PlayerReplicationInfo.bPrecached)
                    {
                        bEveryonePrecached = false;
                        Log("not precached" @ P.PlayerReplicationInfo.PlayerName);
                    }
                    // End:0x19b
                    else
                    {
                    }
                    P = P.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0xd0;
                }
            }
            // End:0x3a8
            if(ElapsedTime > GetNetWait() || NumPlayersFromStart >= StartPlayerNum && bEveryonePrecached)
            {
                Log("[DeathMatch::PendingMatch.Timer] #FromStart=" $ string(NumPlayersFromStart) $ " Start#=" $ string(StartPlayerNum) $ " bEveryonePrecached=" $ string(bEveryonePrecached) $ " NumPlayers=" $ string(NumPlayers) $ " MaxPlayers=" $ string(MaxPlayers) $ " ElapsedTime=" $ string(ElapsedTime) $ " NetWait=" $ string(GetNetWait()));
                P = Level.ControllerList;
                J0x2ae:
                // End:0x395 [While If]
                if(P != none)
                {
                    // End:0x37e
                    if(P.IsA('PlayerController') && P.PlayerReplicationInfo != none && P.bIsPlayer && PlayerController(P).bPlayFromStart)
                    {
                        Log("[DeathMatch::PendingMatch.Timer] name=" $ P.PlayerReplicationInfo.PlayerName $ " precached=" $ string(P.PlayerReplicationInfo.bPrecached));
                    }
                    P = P.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x2ae;
                }
                bWaitForNetPlayers = false;
                CountDown = default.CountDown;
            }
        }
        // End:0x3f0
        if(Level.NetMode != 0 && bWaitForNetPlayers || bTournament && NumPlayers < MaxPlayers)
        {
            PlayStartupMessage();
            return;
        }
        bReady = true;
        StartupStage = 1;
        // End:0x4f4
        if(!bStartedCountDown && bTournament || bPlayersMustBeReady || Level.NetMode == 0)
        {
            P = Level.ControllerList;
            J0x450:
            // End:0x4f4 [While If]
            if(P != none)
            {
                // End:0x4dd
                if(P.IsA('PlayerController') && P.PlayerReplicationInfo != none && P.bIsPlayer && P.PlayerReplicationInfo.bWaitingPlayer && !P.PlayerReplicationInfo.bReadyToPlay)
                {
                    bReady = false;
                }
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x450;
            }
        }
        // End:0x6b2
        if(bReady && !bReviewingJumpSpots && !bChangedHost)
        {
            Log("Start!!!" @ "NumPlayersFromStart=" $ string(NumPlayersFromStart) @ "StartPlayerNum=" $ string(StartPlayerNum) @ "ElapsedTime=" $ string(ElapsedTime) @ "NetWait=" $ string(GetNetWait()));
            P = Level.ControllerList;
            J0x5a3:
            // End:0x651 [While If]
            if(P != none)
            {
                // End:0x63a
                if(P.IsA('PlayerController') && P.PlayerReplicationInfo != none && P.bIsPlayer && PlayerController(P).bPlayFromStart)
                {
                    Log(P.PlayerReplicationInfo.PlayerName @ string(P.PlayerReplicationInfo.bPrecached));
                }
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x5a3;
            }
            // End:0x6a4
            if(kMM.isGMRoom)
            {
                bStartedCountDown = true;
                -- CountDown;
                // End:0x68e
                if(CountDown <= 0)
                {
                    StartupStage = 5;
                    StartMatch();
                }
                // End:0x6a1
                else
                {
                    StartupStage = byte(10 + CountDown);
                }
            }
            // End:0x6b2
            else
            {
                StartupStage = 5;
                StartMatch();
            }
        }
        PlayStartupMessage();
    }

    function BeginState()
    {
        bWaitingToStartMatch = true;
        StartupStage = 0;
        // End:0x2a
        if(IsA('xLastManStandingGame'))
        {
            NetWait = Max(NetWait, 10);
        }
        // End:0x44
        if(kMM.isGMRoom)
        {
            NetWait = 60;
        }
    }

    function EndState()
    {
        NetWait = default.NetWait;
    }

Begin:
    // End:0x0f
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
    }

    function Timer()
    {
        local Controller P;

        global.Timer();
        // End:0x1f
        if(!bFinalStartup)
        {
            bFinalStartup = true;
            PlayStartupMessage();
        }
        // End:0xe3
        if(bForceRespawn)
        {
            P = Level.ControllerList;
            J0x3c:
            // End:0xe3 [While If]
            if(P != none)
            {
                // End:0xcc
                if(P.Pawn == none && P.IsA('PlayerController') && !P.PlayerReplicationInfo.bOnlySpectator)
                {
                    // End:0xb8
                    if(!AllowBecomeActivePlayer(PlayerController(P)))
                    {
                        P.GotoState('Spectating');
                    }
                    // End:0xcc
                    else
                    {
                        PlayerController(P).ServerReStartPlayer();
                    }
                }
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x3c;
            }
        }
        // End:0x10b
        if(NeedPlayers() && AddBot() && RemainingBots > 0)
        {
            -- RemainingBots;
        }
        // End:0x129
        if(bOverTime)
        {
            EndGame(none, "TimeLimit");
        }
        // End:0x203
        else
        {
            // End:0x1dd
            if(TimeLimit > 0)
            {
                // End:0x1da
                if(!GameReplicationInfo.WaitingForStart && !Level.GetMatchMaker().BotTutorial)
                {
                    GameReplicationInfo.bStopCountDown = false;
                    -- RemainingTime;
                    GameReplicationInfo.RemainingTime = RemainingTime;
                    // End:0x1bd
                    if(float(RemainingTime) % float(60) == float(0))
                    {
                        GameReplicationInfo.RemainingMinute = RemainingTime;
                    }
                    // End:0x1da
                    if(RemainingTime <= 0)
                    {
                        EndGame(none, "TimeLimit");
                    }
                }
            }
            // End:0x203
            else
            {
                // End:0x203
                if(MaxLives > 0 && NumPlayers + NumBots != 1)
                {
                    CheckMaxLives(none);
                }
            }
        }
        // End:0x232
        if(!GameReplicationInfo.WaitingForStart)
        {
            ++ ElapsedTime;
            GameReplicationInfo.ElapsedTime = ElapsedTime;
        }
        // End:0x266
        if(ElapsedTime != 0 && float(ElapsedTime) % float(class'wMessage_BGM'.default.BGMInterval) == float(0))
        {
            SendBgmMessageBeginMatch();
        }
        // End:0x2c2
        if(!GameReplicationInfo.bObjectivePlanted)
        {
            // End:0x2c2
            if(!GameReplicationInfo.bStopCountDown)
            {
                // End:0x2c2
                if(GameReplicationInfo.GetRemainingTime() == 60 || GameReplicationInfo.GetRemainingTime() == 30)
                {
                    AnnounceTimesUp();
                }
            }
        }
        // End:0x2e6
        if(float(RemainingTime) % float(5) == float(0))
        {
            GameReplicationInfo.SyncRemainingTime();
        }
        // End:0x322
        if(GameReplicationInfo.WaitingForStart)
        {
            -- GameReplicationInfo.WaitingForStartCountDown;
            // End:0x322
            if(GameReplicationInfo.WaitingForStartCountDown <= 0)
            {
                EndWaitingForStart();
            }
        }
        // End:0x385
        if(!IsA('wMSGameInfo') && Level.GetMatchMaker() != none && Level.GetMatchMaker().IsDisconnectedUser())
        {
            CheckLives(none);
            Level.GetMatchMaker().SetDisconnectedUser(false);
        }
        // End:0x3a9
        if(!Level.GetMatchMaker().BotTutorial)
        {
            BalanceBots();
        }
    }

    function BeginState()
    {
        local PlayerReplicationInfo PRI;

        // End:0x21
        foreach DynamicActors(class'PlayerReplicationInfo', PRI)
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
    }

}

state MatchOver
{
    function RestartPlayer(Controller aPlayer);
    function ScoreKill(Controller Killer, Controller Other);
    function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, optional int iWeaponType)
    {
        return 0;
    }

    function bool ChangeTeam(Controller Other, int Num, bool bNewTeam)
    {
        return false;
    }

    function Timer()
    {
        global.Timer();
        // End:0x21
        if(SendMatchOverState)
        {
            SendMatchOverProcess();
            SetTimer(5.0, false);
        }
        // End:0x30
        else
        {
            // End:0x30
            if(SendMatchOverEndState)
            {
                SendMatchOverEndProcess();
            }
        }
    }

    function bool NeedPlayers()
    {
        return false;
    }

    function PlayMatchOverMessages()
    {
        local Controller C;

        // End:0x7b
        if(EndGameFocus != none)
        {
            EndGameFocus.bAlwaysRelevant = true;
            C = Level.ControllerList;
            J0x30:
            // End:0x7b [While If]
            if(C != none)
            {
                // End:0x64
                if(PlayerController(C) != none)
                {
                    PlayerController(C).ClientSetViewTarget_F(EndGameFocus);
                }
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x30;
            }
        }
        PlayEndOfMatchMessage();
    }

    function SendMatchOverEndProcess()
    {
        local Controller C;
        local PlayerController P;

        Log("[END] sendmatchoverendprocess");
        // End:0x55
        if(!bGameRestarted && Level.TimeSeconds > EndTime + float(RestartWait))
        {
            RestartGame();
        }
        // End:0xd0
        if(EndGameFocus != none)
        {
            EndGameFocus.bAlwaysRelevant = true;
            C = Level.ControllerList;
            J0x85:
            // End:0xd0 [While If]
            if(C != none)
            {
                // End:0xb9
                if(PlayerController(C) != none)
                {
                    PlayerController(C).ClientSetViewTarget_E(EndGameFocus);
                }
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x85;
            }
        }
        ++ EndMessageCounter;
        // End:0xec
        if(EndMessageCounter == EndMessageWait)
        {
            PlayEndOfMatchMessage();
        }
        // End:0x18c
        if(Level.TimeSeconds > EndTime + float(RestartWait / 2) && CurrentGameProfile != none)
        {
            C = Level.ControllerList;
            J0x132:
            // End:0x172 [While If]
            if(C != none)
            {
                P = PlayerController(C);
                // End:0x15b
                if(P != none)
                {
                }
                // End:0x172
                else
                {
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x132;
                }
            }
            P.myHUD.bShowLocalStats = true;
        }
        SendMatchOverEnd();
        SendMatchOverEndState = false;
    }

    function SendMatchOverProcess()
    {
        local wMatchMaker rMM;

        Log("[END] sendmatchoverprocess");
        rMM = Level.GetMatchMaker();
        // End:0x4b
        if(rMM.bServerConnected)
        {
            SendMatchOver();
        }
        SendMatchOverState = false;
        SendMatchOverEndState = true;
    }

    function BeginState()
    {
        local Controller C;
        local PlayerController P;
        local PlayerReplicationInfo PRI;

        Log("[END] begin state");
        slog("[DeathMatch.MatchOver.BeginState]");
        GameReplicationInfo.SyncRemainingTime();
        // End:0x8b
        foreach DynamicActors(class'PlayerReplicationInfo', PRI)
        {
            PRI.TimePlayed = GameReplicationInfo.ElapsedTime - PRI.ElapsedTimeWhenIntervented;                        
        }
        CalcItemUsedTimeAll();
        GameReplicationInfo.bStopCountDown = true;
        GameReplicationInfo.bMatchOver = true;
        GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(10);
        // End:0x19f
        if(CurrentGameProfile != none)
        {
            EndTime = Level.TimeSeconds + float(SinglePlayerWait);
            C = Level.ControllerList;
            J0x113:
            // End:0x153 [While If]
            if(C != none)
            {
                P = PlayerController(C);
                // End:0x13c
                if(P != none)
                {
                }
                // End:0x153
                else
                {
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x113;
                }
            }
            P.myHUD.bShowScoreBoard = true;
            CurrentGameProfile.RegisterGame(self, P.PlayerReplicationInfo);
            SavePackage(CurrentGameProfile.PackageName);
        }
        PlayMatchOverMessages();
        SendMatchOverState = true;
        SendMatchOverEndState = false;
        SetTimer(2.0, false);
    }

}

state ChangeHost extends PendingMatch
{
    function bool CanPawnTakeDamage()
    {
        return false;
    }

    function BroadcastStartupMessage(int MsgIdx)
    {
        local Controller P;

        P = Level.ControllerList;
        J0x14:
        // End:0x61 [While If]
        if(P != none)
        {
            // End:0x4a
            if(UnrealPlayer(P) != none)
            {
                UnrealPlayer(P).PlayStartupMessage(byte(MsgIdx));
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }

    function PlayStartupMessage()
    {
        local int MsgIdx;

        MsgIdx = 30 - ElapsedTimeInChangeHost + 41;
        // End:0x2a
        if(MsgIdx > 71)
        {
            MsgIdx = 71;
        }
        // End:0x3e
        else
        {
            // End:0x3e
            if(MsgIdx < 41)
            {
                MsgIdx = 41;
            }
        }
        BroadcastStartupMessage(MsgIdx);
    }

    function ClientsFadeToColor()
    {
        local Controller P;

        P = Level.ControllerList;
        J0x14:
        // End:0x5a [While If]
        if(P != none)
        {
            // End:0x43
            if(PlayerController(P) != none)
            {
                PlayerController(P).ClientFadeToColor();
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }

    function Timer()
    {
        super.Timer();
        // End:0x61
        if(ChangedHostCompleteCountDown > 0)
        {
            -- ChangedHostCompleteCountDown;
            // End:0x33
            if(ChangedHostCompleteCountDown == 1)
            {
                ChangedHostCompleteCountDown = 0;
                ContinueMatch();
            }
            // End:0x5e
            else
            {
                // End:0x4b
                if(ChangedHostCompleteCountDown == 3)
                {
                    ClientsFadeToColor();
                    ChangeHostExtraWork();
                }
                BroadcastStartupMessage(72 + ChangedHostCompleteCountDown - 2);
            }
        }
        // End:0xcf
        else
        {
            // End:0xc8
            if(ElapsedTimeInChangeHost >= 10)
            {
                Log("[CYH] DeathMatch::ChangeHost state::Timer() elapsedTime >= 30");
                // End:0xc5
                if(CheckEndGameCondition() == false)
                {
                    ChangedHostCompleteCountDown = ChangedHostCompleteCountDown_Initial;
                }
            }
            // End:0xcf
            else
            {
                ++ ElapsedTimeInChangeHost;
            }
        }
    }

    function ForceBeginActors()
    {
        local Actor A;

        // End:0xe4
        foreach AllActors(class'Actor', A)
        {
            // End:0x3e
            if(A.IsA('wWeaponPickup') == true)
            {
                wWeaponPickup(A).ForceBegin();
            }
            // End:0xe3
            else
            {
                // End:0x6c
                if(A.IsA('GameObject') == true)
                {
                    GameObject(A).ForceBegin();
                }
                // End:0xe3
                else
                {
                    // End:0x9a
                    if(A.IsA('GameObjective') == true)
                    {
                        GameObjective(A).ForceBegin();
                    }
                    // End:0xe3
                    else
                    {
                        // End:0xc0
                        if(A.IsA('wAirStrikeProj'))
                        {
                            A.ForceBegin();
                        }
                        // End:0xe3
                        else
                        {
                            // End:0xe3
                            if(A.IsA('NavigationPoint'))
                            {
                                A.ForceBegin();
                            }
                        }
                    }
                }
            }                        
        }
    }

    function EndState()
    {
        local Controller C;
        local PlayerController PC;
        local wGameStateStorageGetter GSSG;

        super.EndState();
        slog("[DeathMatch.ChangeHost.EndState]");
        BalanceBots();
        ForceBeginActors();
        ElapsedTimeInChangeHost = 0;
        GSSG = new class'wGameStateStorageGetter';
        C = Level.ControllerList;
        J0x64:
        // End:0x197 [While If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0x180
            if(PC != none)
            {
                // End:0x112
                if(GameReplicationInfo.RoundState == 1)
                {
                    Log("[CYH] DeathMatch.ChangeHost state::EndState() GRI.RoundState == EROUND_END");
                    PC.ClientRoundEnded();
                    PC.RoundHasEnded();
                }
                // End:0x180
                else
                {
                    Log("[CYH] DeathMatch.ChangeHost state::EndState() called GSSG.GetUserState()");
                    GSSG.GetUserState(PC.GSSS, PC);
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x64;
        }
        Log("[CYH] Destroy new Host GSSS. new Host needs no GSSS.");
        PC = Level.GetLocalPlayerController();
        PC.GSSS.GRI = none;
        PC.DestroyGameStateStorageSender();
        EndChangeHost();
        CheckLives(none);
    }

    function EndChangeHost()
    {
        local Controller C;

        Level.GetLocalPlayerController().EndChangeHost();
        C = Level.ControllerList;
        J0x2d:
        // End:0x77 [While If]
        if(C != none)
        {
            // End:0x60
            if(C.IsA('PlayerController'))
            {
                PlayerController(C).ClientEndChangeHost();
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x2d;
        }
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
        if(Level.GetMatchMaker().ReconnectClientNum == 0 && !Level.GetMatchMaker().PlayWithBots)
        {
            CheckEndGameCondition();
        }
        // End:0xc9
        foreach DynamicActors(class'Pawn', P)
        {
            P.Acceleration = zeroVec;
            P.Velocity = zeroVec;                        
        }
        // End:0x176
        foreach AllActors(class'Vehicle', V)
        {
            // End:0x175
            if(V.Driver != none)
            {
                Log("  Vehicle name=" $ string(V.Name) $ " Driver=" $ V.Driver.OwnerName);
                V.KDriverLeave(true);
                Log("      -> Driver=" $ V.Driver.OwnerName);
            }                        
        }
        // End:0x1ce
        foreach DynamicActors(class'wAILevelBase', AILevel)
        {
            Log("  old AILevel found");
            Level.AILevel = AILevel;
            Level.AILevel.Initialize();
            // End:0x1ce
            break;                        
        }
        // End:0x20f
        foreach AllActors(class'PlayerReplicationInfo', PRI)
        {
            PRI.IsConnected = false;
            // End:0x20e
            if(PRI.bBot)
            {
                PRI.Destroy();
            }                        
        }
        // End:0x22d
        foreach AllActors(class'Vehicle', V)
        {
            V.Destroy();                        
        }
        // End:0x24e
        foreach AllActors(class'wArrangeTurret', AT)
        {
            AT.ForceSpawnVehicle();                        
        }
    }

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
    SpawnProtectionTime=2.0
    LateEntryLives=1
    CountDown=15
    DMSquadClass=class'DMSquad'
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
    ADR_Kill=5.0
    ADR_MajorKill=10.0
    ADR_MinorError=-2.0
    ADR_MinorBonus=5.0
    ADR_KillTeamMate=-5.0
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
    DMHints=// Object reference not set to an instance of an object.
    
    VoiceTimesUp=.Mode_ETC.v_etc_timesup_R
    sndModeName=.Mode_FFA.v_ffa_R
    sndModeExplain=.Mode_TDM.v_tdm_all_R
    deleAnnounceMatchInfo=AnnounceMatchInfo
    bRestartLevel=true
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