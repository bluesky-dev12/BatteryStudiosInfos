/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\GameInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Structs:3
 *	Properties:159
 *	Functions:273
 *
 *******************************************************************************/
class GameInfo extends Info
    dependson(Info)
    dependson(wGameManager)
    dependson(wMatchUserInfo)
    dependson(wMessage_Quest)
    dependson(GameReplicationInfo)
    dependson(Vehicle)
    dependson(Mutator)
    dependson(PlayInfo)
    dependson(VoiceChatReplicationInfo)
    dependson(BroadcastHandler)
    dependson(VotingHandler)
    dependson(wMessage_Score)
    dependson(wSpecialKillMessage)
    dependson(GameInfoScriptPart)
    dependson(GameRules)
    dependson(GameStats)
    dependson(PlayerStart)
    dependson(Teleporter)
    dependson(TeamInfo)
    dependson(NavigationPoint)
    dependson(PlayerStart_SD)
    dependson(HUD)
    dependson(MaplistManagerBase)
    dependson(MapList)
    dependson(Inventory)
    dependson(Pickup)
    dependson(PhysicsVolume)
    dependson(Armor)
    dependson(AccessControl)
    dependson(DamageType)
    dependson(wWeaponAcce)
    dependson(PlayerChatManager)
    dependson(Player)
    dependson(Satellite)
    dependson(wMessage_BGM)
    dependson(wGameStateStorageSender)
    dependson(GameMessage)
    dependson(WaitView)
    dependson(GameProfile)
    dependson(ZoneInfo)
    dependson(AnnouncerVoice)
    dependson(wWeaponManager)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    notplaceable
    hidedropdown;

const GIPROPNUM = 15;

struct native export KeyValuePair
{
    var() string key;
    var() string Value;
};

struct native export PlayerResponseLine
{
    var() int PlayerNum;
    var() string PlayerName;
    var() int Ping;
    var() int Score;
    var() int StatsID;
};

struct native export ServerResponseLine
{
    var() int ServerID;
    var() string IP;
    var() int Port;
    var() int QueryPort;
    var() string ServerName;
    var() string MapName;
    var() string GameType;
    var() int CurrentPlayers;
    var() int MaxPlayers;
    var() int Ping;
    var() int Flags;
    var() string SkillLevel;
    var() array<KeyValuePair> ServerInfo;
    var() array<PlayerResponseLine> PlayerInfo;
};

var int SimpleLoginedClientNum;
var float fSendPingTime;
var float fCurrentPingTime;
var bool bManuallyBeginWaitingForStart;
var bool bRestartLevel;
var bool bPauseable;
var bool bWeaponStay;
var bool bCanChangeSkin;
var noimport bool bTeamGame;
var bool bGameEnded;
var bool bOverTime;
var localized bool bAlternateMode;
var bool bCanViewOthers;
var bool bDelayedStart;
var bool bWaitingToStartMatch;
var bool bChangeLevels;
var bool bAlreadyChanged;
var bool bLoggingGame;
var bool bEnableStatLogging;
var bool bAllowWeaponThrowing;
var bool bAllowBehindView;
var bool bAdminCanPause;
var bool bGameRestarted;
var bool bWeaponShouldViewShake;
var bool bModViewShake;
var bool bForceClassicView;
var bool bLowGore;
var bool bWelcomePending;
var bool bAttractCam;
var bool bMustJoinBeforeStart;
var bool bTestMode;
var bool bAllowVehicles;
var bool bAllowMPGameSpeed;
var bool bIsSaveGame;
var bool bLiberalVehiclePaths;
var bool bLargeGameVOIP;
var int GoreLevel;
var float GameDifficulty;
var float AutoAim;
var float GameSpeed;
var float StartTime;
var string DefaultPlayerClassName;
var bool bSendBot;
var string ScoreBoardType;
var string ResultScoreBoardType;
var string ResultScoreBoardBootyType;
var string BotMenuType;
var noimport string RulesMenuType;
var string SettingsMenuType;
var string GameUMenuType;
var string MultiplayerUMenuType;
var string GameOptionsMenuType;
var noimport string HUDSettingsMenu;
var string HUDType;
var noimport string MapListType;
var noimport string MapPrefix;
var string BeaconName;
var localized string GoreLevelText[3];
var() int ResetCountDown;
var() int ResetTimeDelay;
var int MaxSpectators;
var int NumSpectators;
var int MaxPlayers;
var int NumPlayers;
var int NumPlayersFromStart;
var int NumBots;
var int CurrentID;
var localized string DefaultPlayerName;
var float FearCostFallOff;
var int GoalScore;
var int MaxLives;
var int TimeLimit;
var class<LocalMessage> DeathMessageClass;
var class<GameMessage> GameMessageClass;
var name OtherMesgGroup;
var string MutatorClass;
var Mutator BaseMutator;
var() string AccessControlClass;
var AccessControl AccessControl;
var GameRules GameRulesModifiers;
var() string BroadcastHandlerClass;
var() class<BroadcastHandler> BroadcastClass;
var BroadcastHandler BroadcastHandler;
var class<PlayerController> PlayerControllerClass;
var string PlayerControllerClassName;
var() class<GameReplicationInfo> GameReplicationInfoClass;
var GameReplicationInfo GameReplicationInfo;
var() class<VoiceChatReplicationInfo> VoiceReplicationInfoClass;
var VoiceChatReplicationInfo VoiceReplicationInfo;
var string MaplistHandlerType;
var class<MaplistManagerBase> MaplistHandlerClass;
var transient MaplistManagerBase MaplistHandler;
var GameStats GameStats;
var string GameStatsClass;
var transient string DemoCommand;
var float RespawnTime;
var string SecurityClass;
var() noimport localized string GameName;
var() noimport localized string Description;
var() noimport string ScreenShotName;
var() noimport string DecoTextName;
var() noimport string Acronym;
var string VotingHandlerType;
var class<VotingHandler> VotingHandlerClass;
var transient VotingHandler VotingHandler;
var() transient GameProfile CurrentGameProfile;
var() private const transient Manifest SaveGameManifest;
var localized string GIPropsDisplayText[15];
var localized string GIPropDescText[15];
var localized string GIPropsExtras[2];
var Vehicle VehicleList;
var string CallSigns[15];
var string ServerSkillLevel;
var float MaxIdleTime;
var localized string NoBindString;
var Color BindColor;
var BTTcpLink_Channel BTSend;
var wMatchMaker kMM;
var float GameAddScore;
var float GameAddScore_KillHeli;
var float GameAssistScore;
var float GameDecScore;
var float GameAddExp;
var float GameAssistExp;
var float GameDecExp;
var float GamePenaltyExp;
var float GameAddPoint;
var float GameAssistPoint;
var float GameDecPoint;
var float GamePenaltyPoint;
var float GameAddHeliExp;
var float GameAddHeliPoint;
var array<float> GameAddMultiKillExp;
var array<float> GameAddMultiKillPoint;
var bool SpawnWeaponPickupLocations;
var bool bChangedHost;
var int ElapsedTimeInChangeHost;
var int UAVDuration;
var int UAVScanInterval;
var bool bLeaveRespawnLogInChat;
var bool bLeaveRespawnLogInChatReal;
var array<PlayerStart> EveryPlayerStarts;
var array<PlayerStart_SD> EverySDPlayerStarts;
var array<PlayerStart_Defence> EveryDFPlayerStarts;
var float SDRespawnTime;
var noexport array<NavigationPoint> recentlySpawnedPoints;
var noexport array<NavigationPoint> recentlySpawnedPointsTeamAF;
var noexport array<NavigationPoint> recentlySpawnedPointsTeamRSA;
var byte TeamQueue;
var int ChangedHostCompleteCountDown;
var int ChangedHostCompleteCountDown_Initial;
var int SupplyRandIndex;
var bool bHasRespawnRestriction;
var int RespawnRestrictionTime;
var array<WaitView> WaitViews;
var GameInfoScriptPart SC;
var wMatchMaker myTeamMM;
var array<Vector> DeathPos;
var int nCurIndex;

// Export UGameInfo::execGetSavedGames(FFrame&, void* const)
native final function Manifest GetSavedGames();
// Export UGameInfo::execCreateDataObject(FFrame&, void* const)
native final function Object CreateDataObject(Class objClass, string objName, string PackageName);
// Export UGameInfo::execDeleteDataObject(FFrame&, void* const)
native final function bool DeleteDataObject(Class objClass, string objName, string PackageName);
// Export UGameInfo::execLoadDataObject(FFrame&, void* const)
native final function Object LoadDataObject(Class objClass, string objName, string PackageName);
// Export UGameInfo::execAllDataObjects(FFrame&, void* const)
native final iterator function AllDataObjects(Class objClass, out Object obj, string PackageName);
// Export UGameInfo::execSavePackage(FFrame&, void* const)
native final function bool SavePackage(string PackageName);
// Export UGameInfo::execDeletePackage(FFrame&, void* const)
native final function bool DeletePackage(string PackageName);
// Export UGameInfo::execLoadMapList(FFrame&, void* const)
native static final function LoadMapList(string MapPrefix, out array<string> Maps);
// Export UGameInfo::execNativeSettingAfterChangedHost(FFrame&, void* const)
native final function NativeSettingAfterChangedHost();
function AnnounceArtillery(Controller Caller);
function AnnounceHelicopter(Controller Caller);
function AnnounceUAV(Controller Caller);
function PreBeginPlay()
{
    local bool bExist;
    local wMatchMaker MM;

    StartTime = 0.0;
    GameReplicationInfo = Spawn(GameReplicationInfoClass);
    Level.GRI = GameReplicationInfo;
    InitGameReplicationInfo();
    InitVoiceReplicationInfo();
    InitLogging();
    SC = new class'GameInfoScriptPart';
    InitializeEveryPlayerStarts();
    Level.GameMgr.bUseGore = bool(ConsoleCommand("GETCONFIG_BOOL Graphics UseGore"));
    Level.GameMgr.bUseRagdoll = bool(ConsoleCommand("GETCONFIG_BOOL Graphics UseRagdoll"));
    Level.GameMgr.bUseMouseRevision = bool(ConsoleCommand("GETCONFIG_BOOL Controll UseMouseRevision"));
    Level.GameMgr.bUseStanceToggle = bool(ConsoleCommand("GETCONFIG_BOOL Controll UseStanceToggle"));
    MM = Level.GetMatchMaker();
    MM.bExistUseAdvCamShake = bool(ConsoleCommand("GETCONFIG_EXIST Controll UseAdvCamShake"));
    // End:0x224
    if(MM.bExistUseAdvCamShake)
    {
        Level.GameMgr.bUseAdvCamShake = bool(ConsoleCommand("GETCONFIG_BOOL Controll UseAdvCamShake"));
    }
    // End:0x23e
    else
    {
        Level.GameMgr.bUseAdvCamShake = false;
    }
    bExist = bool(ConsoleCommand("GETCONFIG_EXIST Misc MinimapMode"));
    // End:0x2a6
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_INT Misc MinimapMode 0");
    }
    // End:0x2e7
    else
    {
        Level.GetMatchMaker().MinimapMode = int(ConsoleCommand("GETCONFIG_INT Misc MinimapMode"));
    }
    bExist = bool(ConsoleCommand("GETCONFIG_EXIST Controll 32"));
    // End:0x347
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_STRING Controll 32 F11");
    }
    bExist = bool(ConsoleCommand("GETCONFIG_EXIST Misc RecordResoultion"));
    // End:0x3b6
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_INT Misc RecordResoultion 1");
    }
    bExist = bool(ConsoleCommand("GETCONFIG_EXIST Misc RecordQuality"));
    // End:0x41f
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_INT Misc RecordQuality 1");
    }
    bExist = bool(ConsoleCommand("GETCONFIG_EXIST Misc EnableRecord"));
    // End:0x48b
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_BOOL Misc EnableRecord False");
    }
    CurrentID = Rand(10000);
}

event ForcePreBeginPlay()
{
    PreBeginPlay();
}

event ForceBeginPlay()
{
    BeginPlay();
}

event ForcePostBeginPlay()
{
    PostBeginPlay();
}

event ForcePostNetBeginPlay()
{
    PostNetBeginPlay();
}

event ForceSetInitialState()
{
    SetInitialState();
}

event ForceSetGRIInitialState()
{
    SetGRIInitialState();
}

function int GetBootySeedValue()
{
    return 0;
}

event SetOldTeamInfo(GameReplicationInfo OldGRI);
function Destroyed()
{
    CurrentGameProfile = none;
    super(Actor).Destroyed();
}

function UpdatePrecacheMaterials()
{
    PrecacheGameTextures(Level);
}

function UpdatePrecacheStaticMeshes()
{
    PrecacheGameStaticMeshes(Level);
}

function UpdatePrecacheSkeletalMeshes()
{
    PrecacheGameSkeletalMeshes(Level);
}

static function Precache(LevelInfo Level)
{
    Level.WeaponMgr.PrecacheClasses();
    Level.GameMgr.PrecacheItemResources(Level);
    PrecacheGore();
}

static function PrecacheGameTextures(LevelInfo myLevel);
static function PrecacheGameStaticMeshes(LevelInfo myLevel);
static function PrecacheGameSkeletalMeshes(LevelInfo myLevel);
static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    V.Level.WeaponMgr.PrecacheSound();
}

static function PrecacheGore()
{
    local string strTemp;
    local array<string> gores;
    local int lp1;

    gores[0] = "AF_01_";
    gores[1] = "RSA_01_";
    lp1 = 0;
    J0x28:
    // End:0x201 [While If]
    if(lp1 < gores.Length)
    {
        strTemp = gores[lp1];
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "Body", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "GoreLArm", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "LArm", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "GoreRArm", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "RArm", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "GoreLLeg", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "LLeg", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "GoreRLeg", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "RLeg", class'Mesh');
        DynamicLoadObject("Char_01_Gore." $ strTemp $ "GoreHead", class'Mesh');
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
}

function string FindPlayerByID(int PlayerID)
{
    local PlayerReplicationInfo PRI;

    PRI = GameReplicationInfo.FindPlayerByID(PlayerID);
    // End:0x34
    if(PRI != none)
    {
        return PRI.PlayerName;
    }
    return "";
}

function AllReceiveLocalizedMessage(class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local Controller C;

    Log("[GameInfo::AllReceiveLocalizedMessage] Message=" $ string(Message) @ "Switch=" $ string(Switch));
    C = Level.ControllerList;
    J0x64:
    // End:0xc7 [While If]
    if(C != none)
    {
        // End:0xb0
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
}

function TeamReceiveLocalizedMessage(byte Team, class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local Controller C;

    Log("[GameInfo::TeamReceiveLocalizedMessage] Team=" $ string(Team) @ "Message=" $ string(Message) @ "Switch=" $ string(Switch));
    C = Level.ControllerList;
    J0x77:
    // End:0xf7 [While If]
    if(C != none)
    {
        // End:0xe0
        if(C.IsA('PlayerController') && C.GetTeamNum() == Team)
        {
            PlayerController(C).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x77;
    }
}

function TeamReceiveLocalizedMessageEx(byte Team, class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional Vector vLocation, optional float fMaxDist, optional bool bExceptOwner)
{
    local Controller C;
    local float fDist;

    Log("[GameInfo::TeamReceiveLocalizedMessageEx] Team=" $ string(Team) @ "Message=" $ string(Message) @ "Switch=" $ string(Switch));
    C = Level.ControllerList;
    J0x79:
    // End:0x18e [While If]
    if(C != none)
    {
        // End:0x177
        if(C.IsA('PlayerController'))
        {
            // End:0xc3
            if(bExceptOwner && RelatedPRI_1 == PlayerController(C).PlayerReplicationInfo)
            {
            }
            // End:0x177
            else
            {
                // End:0xdf
                if(PlayerController(C).Pawn == none)
                {
                }
                // End:0x177
                else
                {
                    fDist = VSize(vLocation - PlayerController(C).Pawn.Location);
                    // End:0x177
                    if(fDist < fMaxDist)
                    {
                        // End:0x177
                        if(C.IsA('PlayerController') && C.GetTeamNum() == Team)
                        {
                            PlayerController(C).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
                        }
                    }
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x79;
    }
}

function TeamQueueAnnouncement(byte Team, string ASoundName, byte AnnouncementLevel, optional Core.Object.EAPriority Priority, optional byte Switch)
{
    local Controller C;

    Log("[GameInfo::TeamQueueAnnouncement] ASoundName=" $ ASoundName);
    C = Level.ControllerList;
    J0x4c:
    // End:0xc7 [While If]
    if(C != none)
    {
        // End:0xb0
        if(C.IsA('PlayerController') && C.GetTeamNum() == Team)
        {
            PlayerController(C).QueueAnnouncement(ASoundName, AnnouncementLevel, Priority, Switch);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
}

function ChangeMap(int ContextID)
{
    local MapList MyList;
    local class<MapList> ML;
    local string MapString;

    ML = class<MapList>(DynamicLoadObject(MapListType, class'Class'));
    MyList = Spawn(ML);
    MapString = MyList.GetMap(ContextID);
    MyList.Destroy();
    // End:0x5d
    if(MapString == "")
    {
        return;
    }
    Level.ServerTravel(MapString, false);
}

static function bool UseLowGore()
{
    return default.bAlternateMode || default.bLowGore || default.GoreLevel < 2;
}

static function bool NoBlood()
{
    return default.GoreLevel == 0;
}

function PostBeginPlay()
{
    // End:0x1f
    if(MaxIdleTime > float(0))
    {
        MaxIdleTime = FMax(MaxIdleTime, 30.0);
    }
    // End:0x48
    if(GameStats != none)
    {
        GameStats.NewGame();
        GameStats.ServerInfo();
    }
    // End:0x6c
    if(DemoCommand != "")
    {
        ConsoleCommand("demorec" @ DemoCommand, true);
    }
}

function InitializeEveryPlayerStarts()
{
    local PlayerStart N;
    local PlayerStart_SD S;
    local PlayerStart_Defence f;

    Log("[GameInfo::InitializeEveryPlayerStarts]");
    EveryPlayerStarts.Length = 0;
    // End:0x78
    foreach AllActors(class'PlayerStart', N)
    {
        // End:0x77
        if(IsAppropriateRespawnPoint(N, 0) || IsAppropriateRespawnPoint(N, 1))
        {
            EveryPlayerStarts[EveryPlayerStarts.Length] = N;
        }                
    }
    EverySDPlayerStarts.Length = 0;
    // End:0xa4
    foreach AllActors(class'PlayerStart_SD', S)
    {
        EverySDPlayerStarts[EverySDPlayerStarts.Length] = S;                
    }
    // End:0xed
    if(Level.GetMatchMaker().BotTutorial)
    {
        EveryDFPlayerStarts.Length = 0;
        // End:0xec
        foreach AllActors(class'PlayerStart_Defence', f)
        {
            EveryDFPlayerStarts[EveryDFPlayerStarts.Length] = f;                        
        }
    }
}

function LogRespawnStatistics()
{
    local int lp1, lp2;
    local PlayerStart minN;
    local float totalDist, totalMinDist, dist, minDist;

    Log("[GameInfo::LogRespawnStatistics]");
    // End:0x33
    if(EveryPlayerStarts.Length < 2)
    {
        return;
    }
    totalDist = 0.0;
    lp1 = 0;
    J0x45:
    // End:0x112 [While If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        lp2 = lp1 + 1;
        J0x63:
        // End:0x108 [While If]
        if(lp2 < EveryPlayerStarts.Length)
        {
            dist = VSize(EveryPlayerStarts[lp1].Location - EveryPlayerStarts[lp2].Location);
            totalDist += dist;
            Log("  " $ string(EveryPlayerStarts[lp1].Name) $ " - " $ string(EveryPlayerStarts[lp2].Name) $ " = " $ string(dist));
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0x63;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    lp1 = 0;
    J0x119:
    // End:0x22c [While If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        minDist = 9999.0;
        lp2 = 0;
        J0x13b:
        // End:0x1c1 [While If]
        if(lp2 < EveryPlayerStarts.Length)
        {
            // End:0x1b7
            if(lp1 != lp2)
            {
                dist = VSize(EveryPlayerStarts[lp1].Location - EveryPlayerStarts[lp2].Location);
                // End:0x1b7
                if(minDist > dist)
                {
                    minDist = dist;
                    minN = EveryPlayerStarts[lp2];
                }
            }
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0x13b;
        }
        Log("  Closest to " $ string(EveryPlayerStarts[lp1].Name) $ " = " $ string(minN.Name) $ " dist=" $ string(minDist));
        totalMinDist += minDist;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x119;
    }
    Log("");
    Log("  Average Distance Between Spawn Points = " $ string(totalDist / float(EveryPlayerStarts.Length * EveryPlayerStarts.Length / 2)));
    Log("  Average Min Dist = " $ string(totalMinDist / float(EveryPlayerStarts.Length)));
}

function Reset()
{
    super(Actor).Reset();
    bGameEnded = false;
    bOverTime = false;
    bWaitingToStartMatch = true;
    InitGameReplicationInfo();
    InitVoiceReplicationInfo();
}

function InitLogging()
{
    local class<GameStats> MyGameStatsClass;

    // End:0x50
    if(!bEnableStatLogging || !bLoggingGame || Level.NetMode == 0 || Level.NetMode == 2)
    {
        return;
    }
    MyGameStatsClass = class<GameStats>(DynamicLoadObject(GameStatsClass, class'Class'));
    // End:0xb2
    if(MyGameStatsClass != none)
    {
        GameStats = Spawn(MyGameStatsClass);
        // End:0xaf
        if(GameStats == none)
        {
            Log("Could to create Stats Object");
        }
    }
    // End:0xdb
    else
    {
        Log("Error loading GameStats [" $ GameStatsClass $ "]");
    }
}

function Timer()
{
    local NavigationPoint N;
    local int i;

    // End:0x160
    if(bWelcomePending)
    {
        bWelcomePending = false;
        // End:0x160
        if(Level.NetMode != 0)
        {
            i = 0;
            J0x31:
            // End:0x160 [While If]
            if(i < GameReplicationInfo.PRIArray.Length)
            {
                // End:0x156
                if(GameReplicationInfo.PRIArray[i] != none && !GameReplicationInfo.PRIArray[i].bWelcomed)
                {
                    GameReplicationInfo.PRIArray[i].bWelcomed = true;
                    // End:0x112
                    if(!GameReplicationInfo.PRIArray[i].bOnlySpectator)
                    {
                        // End:0x10f
                        if(!GameReplicationInfo.PRIArray[i].bAdminSpecator)
                        {
                            BroadcastLocalizedMessage(GameMessageClass, 1, GameReplicationInfo.PRIArray[i]);
                        }
                    }
                    // End:0x156
                    else
                    {
                        // End:0x156
                        if(!GameReplicationInfo.PRIArray[i].bAdminSpecator)
                        {
                            BroadcastLocalizedMessage(GameMessageClass, 16, GameReplicationInfo.PRIArray[i]);
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x31;
            }
        }
    }
    BroadcastHandler.UpdateSentText();
    N = Level.NavigationPointList;
    J0x183:
    // End:0x1ba [While If]
    if(N != none)
    {
        N.FearCost *= FearCostFallOff;
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x183;
    }
}

event GameEnding()
{
    EndLogging("serverquit");
}

event KickIdler(PlayerController PC)
{
    Log("Kicking idle player " $ PC.PlayerReplicationInfo.PlayerName);
    AccessControl.DefaultKickReason = AccessControl.IdleKickReason;
    AccessControl.KickPlayer(PC);
    AccessControl.DefaultKickReason = AccessControl.default.DefaultKickReason;
}

function InitGameReplicationInfo()
{
    GameReplicationInfo.bTeamGame = bTeamGame;
    GameReplicationInfo.GameName = GameName;
    GameReplicationInfo.GameClass = string(Class);
    GameReplicationInfo.SetMaxLives(MaxLives);
    GameReplicationInfo.RespawnTime = RespawnTime;
}

function InitVoiceReplicationInfo()
{
    Log(string(Name) @ "VoiceReplicationInfo created:" @ string(VoiceReplicationInfo), 'VoiceChat');
}

function InitMaplistHandler();
// Export UGameInfo::execGetNetworkNumber(FFrame&, void* const)
native function string GetNetworkNumber();
function GetServerInfo(out ServerResponseLine ServerState)
{
    local int RealSkillLevel;

    ServerState.ServerName = StripColor(GameReplicationInfo.ServerName);
    ServerState.MapName = Left(string(Level), InStr(string(Level), "."));
    ServerState.GameType = Mid(string(Class), InStr(string(Class), ".") + 1);
    ServerState.CurrentPlayers = GetNumPlayers();
    ServerState.MaxPlayers = MaxPlayers;
    ServerState.IP = "";
    ServerState.Port = GetServerPort();
    RealSkillLevel = Clamp(int(ServerSkillLevel), 0, 2);
    ServerState.SkillLevel = string(RealSkillLevel);
    ServerState.ServerInfo.Length = 0;
    ServerState.PlayerInfo.Length = 0;
}

function int GetNumPlayers()
{
    return NumPlayers;
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    local Mutator M;
    local GameRules G;
    local int i, Len, NumMutators;
    local string MutatorName;
    local bool bFound;

    AddServerDetail(ServerState, "ServerMode", Eval(Level.NetMode == 2, "non-dedicated", "dedicated"));
    AddServerDetail(ServerState, "AdminName", GameReplicationInfo.AdminName);
    AddServerDetail(ServerState, "AdminEmail", GameReplicationInfo.AdminEmail);
    AddServerDetail(ServerState, "ServerVersion", Level.EngineVersion);
    // End:0xf8
    if(AccessControl != none && AccessControl.RequiresPassword())
    {
        AddServerDetail(ServerState, "GamePassword", "True");
    }
    AddServerDetail(ServerState, "GameStats", string(GameStats != none));
    // End:0x160
    if(AllowGameSpeedChange() && GameSpeed != 1.0)
    {
        AddServerDetail(ServerState, "GameSpeed", string(float(int(GameSpeed * float(100))) / 100.0));
    }
    AddServerDetail(ServerState, "MaxSpectators", string(MaxSpectators));
    // End:0x1a0
    if(VotingHandler != none)
    {
        VotingHandler.GetServerDetails(ServerState);
    }
    M = BaseMutator;
    J0x1ab:
    // End:0x1e8 [While If]
    if(M != none)
    {
        M.GetServerDetails(ServerState);
        ++ NumMutators;
        M = M.NextMutator;
        // This is an implied JumpToken; Continue!
        goto J0x1ab;
    }
    G = GameRulesModifiers;
    J0x1f3:
    // End:0x229 [While If]
    if(G != none)
    {
        G.GetServerDetails(ServerState);
        G = G.NextGameRules;
        // This is an implied JumpToken; Continue!
        goto J0x1f3;
    }
    i = 0;
    J0x230:
    // End:0x279 [While If]
    if(i < ServerState.ServerInfo.Length)
    {
        // End:0x26f
        if(ServerState.ServerInfo[i].key ~= "Mutator")
        {
            -- NumMutators;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x230;
    }
    // End:0x3ae
    if(NumMutators > 1)
    {
        M = BaseMutator.NextMutator;
        J0x298:
        // End:0x3ae [While If]
        if(M != none)
        {
            MutatorName = M.GetHumanReadableName();
            i = 0;
            J0x2bf:
            // End:0x32d [While If]
            if(i < ServerState.ServerInfo.Length)
            {
                // End:0x323
                if(ServerState.ServerInfo[i].Value ~= MutatorName && ServerState.ServerInfo[i].key ~= "Mutator")
                {
                    bFound = true;
                }
                // End:0x32d
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x2bf;
                }
            }
            // End:0x397
            if(!bFound)
            {
                Len = ServerState.ServerInfo.Length;
                ServerState.ServerInfo.Length = Len + 1;
                ServerState.ServerInfo[i].key = "Mutator";
                ServerState.ServerInfo[i].Value = MutatorName;
            }
            M = M.NextMutator;
            // This is an implied JumpToken; Continue!
            goto J0x298;
        }
    }
}

function GetServerPlayers(out ServerResponseLine ServerState)
{
    local Mutator M;
    local Controller C;
    local PlayerReplicationInfo PRI;
    local int i, TeamFlag;

    i = ServerState.PlayerInfo.Length;
    TeamFlag[0] = 1 << 29;
    TeamFlag[1] = TeamFlag[0] << 1;
    C = Level.ControllerList;
    J0x44:
    // End:0x1c7 [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0x1b0
        if(PRI != none && !PRI.bBot && MessagingSpectator(C) == none)
        {
            ServerState.PlayerInfo.Length = i + 1;
            ServerState.PlayerInfo[i].PlayerNum = C.PlayerNum;
            ServerState.PlayerInfo[i].PlayerName = PRI.PlayerName;
            ServerState.PlayerInfo[i].Score = int(PRI.Score);
            ServerState.PlayerInfo[i].Ping = 4 * PRI.Ping;
            // End:0x1a9
            if(bTeamGame && PRI.Team != none)
            {
                ServerState.PlayerInfo[i].StatsID = ServerState.PlayerInfo[i].StatsID | TeamFlag[PRI.Team.TeamIndex];
            }
            ++ i;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    M = BaseMutator.NextMutator;
    J0x1db:
    // End:0x211 [While If]
    if(M != none)
    {
        M.GetServerPlayers(ServerState);
        M = M.NextMutator;
        // This is an implied JumpToken; Continue!
        goto J0x1db;
    }
}

function int GetServerPort()
{
    local string S;
    local int i;

    S = Level.GetAddressURL();
    i = InStr(S, ":");
    assert(i >= 0);
    return int(Mid(S, i + 1));
}

function bool SetPause(bool bPause, PlayerController P)
{
    // End:0xa0
    if(bPauseable || bAdminCanPause && P.IsA('Admin') || P.PlayerReplicationInfo.bAdmin || Level.NetMode == 0)
    {
        // End:0x8b
        if(bPause)
        {
            Level.Pauser = P.PlayerReplicationInfo;
        }
        // End:0x9b
        else
        {
            Level.Pauser = none;
        }
        return true;
    }
    // End:0xa2
    else
    {
        return false;
    }
}

function bool AllowGameSpeedChange()
{
    // End:0x1e
    if(Level.NetMode == 0)
    {
        return true;
    }
    // End:0x25
    else
    {
        return bAllowMPGameSpeed;
    }
}

function SetGameSpeed(float t)
{
    // End:0x38
    if(!AllowGameSpeedChange())
    {
        Level.TimeDilation = 1.10;
        GameSpeed = 1.0;
        default.GameSpeed = GameSpeed;
    }
    // End:0x43
    else
    {
        SetSpeed(t);
    }
    SetTimer(Level.TimeDilation, true);
}

function SetSpeed(float t)
{
    local float OldSpeed;

    OldSpeed = GameSpeed;
    GameSpeed = FMax(t, 0.010);
    Level.TimeDilation = 1.10 * GameSpeed;
    // End:0x61
    if(GameSpeed != OldSpeed)
    {
        default.GameSpeed = GameSpeed;
        class'GameInfo'.static.StaticSaveConfig();
    }
    SetTimer(Level.TimeDilation, true);
}

exec function showrespawn()
{
    bLeaveRespawnLogInChatReal = !bLeaveRespawnLogInChatReal;
    clog("bLeaveRespawnLogInChatReal=" $ string(bLeaveRespawnLogInChatReal));
}

exec function gamesetspeed(float t)
{
    clog("gamesetspeed " $ string(t));
    SetSpeed(t);
}

exec function gamestop()
{
    SetSpeed(0.0);
}

exec function gamego()
{
    SetSpeed(1.0);
}

exec function SetRPPTime(float limit)
{
    local Pawn P;

    Log("[GameInfo::SetRPPTime] limit=" $ string(limit) $ ", fps=" $ string(1.0 / limit));
    // End:0x69
    foreach AllActors(class'Pawn', P)
    {
        P.RepPawnPositionTime = limit;                
    }
}

exec function SetRPPFPS(float fps)
{
    local Pawn P;

    Log("[GameInfo::SetRPPFPS] fps=" $ string(fps) $ ", time=" $ string(1.0 / fps));
    // End:0x6e
    foreach AllActors(class'Pawn', P)
    {
        P.RepPawnPositionTime = 1.0 / fps;                
    }
}

event DetailChange()
{
    local Actor A;
    local ZoneInfo Z;

    // End:0x76
    if(Level.DetailMode == 0)
    {
        // End:0x72
        foreach DynamicActors(class'Actor', A)
        {
            // End:0x71
            if(A.bHighDetail || A.bSuperHighDetail && !A.bGameRelevant)
            {
                A.Destroy();
            }                        
        }
    }
    // End:0xd5
    else
    {
        // End:0xd5
        if(Level.DetailMode == 1)
        {
            // End:0xd4
            foreach DynamicActors(class'Actor', A)
            {
                // End:0xd3
                if(A.bSuperHighDetail && !A.bGameRelevant)
                {
                    A.Destroy();
                }                                
            }
        }
    }
    // End:0xf5
    foreach AllActors(class'ZoneInfo', Z)
    {
        Z.LinkToSkybox();                
    }
}

static function bool GrabOption(out string Options, out string Result)
{
    // End:0x8a
    if(Left(Options, 1) == "?")
    {
        Result = Mid(Options, 1);
        // End:0x45
        if(InStr(Result, "?") >= 0)
        {
            Result = Left(Result, InStr(Result, "?"));
        }
        Options = Mid(Options, 1);
        // End:0x7d
        if(InStr(Options, "?") >= 0)
        {
            Options = Mid(Options, InStr(Options, "?"));
        }
        // End:0x85
        else
        {
            Options = "";
        }
        return true;
    }
    // End:0x8c
    else
    {
        return false;
    }
}

static function GetKeyValue(string Pair, out string key, out string Value)
{
    // End:0x44
    if(InStr(Pair, "=") >= 0)
    {
        key = Left(Pair, InStr(Pair, "="));
        Value = Mid(Pair, InStr(Pair, "=") + 1);
    }
    // End:0x57
    else
    {
        key = Pair;
        Value = "";
    }
}

static function string ParseOption(string Options, string InKey)
{
    local string Pair, key, Value;

    // End:0x40 [While If]
    if(GrabOption(Options, Pair))
    {
        J0x00:
        GetKeyValue(Pair, key, Value);
        // End:0x3d
        if(key ~= InKey)
        {
            return Value;
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    return "";
}

static function bool HasOption(string Options, string InKey)
{
    local string Pair, key, Value;

    // End:0x3c [While If]
    if(GrabOption(Options, Pair))
    {
        J0x00:
        GetKeyValue(Pair, key, Value);
        // End:0x39
        if(key ~= InKey)
        {
            return true;
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    return false;
}

event InitGame(string Options, out string Error)
{
    local string InOpt, LeftOpt;
    local int pos;
    local class<AccessControl> ACClass;
    local class<GameRules> GRClass;
    local bool bIsTutorial;

    kMM = Level.GetMatchMaker();
    BTSend = kMM.kTcpChannel;
    TimeLimit = GetIntOption(Options, "TimeLimit", kMM.iTimeLimit);
    InOpt = ParseOption(Options, "SaveGame");
    // End:0x12d
    if(InOpt != "" && CurrentGameProfile == none)
    {
        CurrentGameProfile = LoadDataObject(class'GameProfile', "GameProfile", InOpt);
        // End:0xcd
        if(CurrentGameProfile != none)
        {
            CurrentGameProfile.Initialize(self, InOpt);
        }
        // End:0x112
        else
        {
            Log("SINGLEPLAYER GameInfo::InitGame failed to find GameProfile" @ InOpt);
        }
        // End:0x12d
        if(!CurrentGameProfile.bInLadderGame)
        {
            CurrentGameProfile = none;
        }
    }
    // End:0x157
    if(CurrentGameProfile == none && Left(string(Level), 3) ~= "TUT")
    {
        bIsTutorial = true;
    }
    MaxPlayers = Clamp(GetIntOption(Options, "MaxPlayers", MaxPlayers), 0, 32);
    MaxSpectators = Clamp(GetIntOption(Options, "MaxSpectators", MaxSpectators), 0, 32);
    GameDifficulty = FMax(0.0, float(GetIntOption(Options, "Difficulty", int(GameDifficulty))));
    // End:0x215
    if(CurrentGameProfile != none || bIsTutorial)
    {
        // End:0x20a
        if(CurrentGameProfile != none)
        {
            GameDifficulty = CurrentGameProfile.Difficulty;
        }
        SetGameSpeed(1.0);
    }
    AddMutator(MutatorClass);
    BroadcastClass = class<BroadcastHandler>(DynamicLoadObject(BroadcastHandlerClass, class'Class'));
    default.BroadcastClass = BroadcastClass;
    BroadcastHandler = Spawn(BroadcastClass);
    InOpt = ParseOption(Options, "AccessControl");
    // End:0x29b
    if(InOpt != "")
    {
        ACClass = class<AccessControl>(DynamicLoadObject(InOpt, class'Class'));
    }
    // End:0x2d7
    if(ACClass == none)
    {
        ACClass = class<AccessControl>(DynamicLoadObject(AccessControlClass, class'Class'));
        // End:0x2d7
        if(ACClass == none)
        {
            ACClass = class'AccessControl';
        }
    }
    LeftOpt = ParseOption(Options, "AdminName");
    InOpt = ParseOption(Options, "AdminPassword");
    // End:0x33e
    if(LeftOpt != "" && InOpt != "")
    {
        ACClass.default.bDontAddDefaultAdmin = true;
    }
    // End:0x3c0
    if(Level.NetMode == 2 || Level.NetMode == 1)
    {
        AccessControl = Spawn(ACClass);
        // End:0x3c0
        if(AccessControl != none && LeftOpt != "" && InOpt != "")
        {
            AccessControl.SetAdminFromURL(LeftOpt, InOpt);
        }
    }
    SetGameSpeed(1.0);
    InOpt = ParseOption(Options, "GameRules");
    // End:0x4eb
    if(InOpt != "")
    {
        Log("Game Rules" @ InOpt);
        J0x408:
        // End:0x4eb [While If]
        if(InOpt != "")
        {
            pos = InStr(InOpt, ",");
            // End:0x462
            if(pos > 0)
            {
                LeftOpt = Left(InOpt, pos);
                InOpt = Right(InOpt, Len(InOpt) - pos - 1);
            }
            // End:0x475
            else
            {
                LeftOpt = InOpt;
                InOpt = "";
            }
            Log("Add game rules " $ LeftOpt);
            GRClass = class<GameRules>(DynamicLoadObject(LeftOpt, class'Class'));
            // End:0x4e8
            if(GRClass != none)
            {
                // End:0x4d1
                if(GameRulesModifiers == none)
                {
                    GameRulesModifiers = Spawn(GRClass);
                }
                // End:0x4e8
                else
                {
                    GameRulesModifiers.AddGameRules(Spawn(GRClass));
                }
            }
            // This is an implied JumpToken; Continue!
            goto J0x408;
        }
    }
    InOpt = ParseOption(Options, "Mutator");
    // End:0x5a0
    if(InOpt != "")
    {
        Log("Mutators" @ InOpt);
        J0x524:
        // End:0x5a0 [While If]
        if(InOpt != "")
        {
            pos = InStr(InOpt, ",");
            // End:0x57e
            if(pos > 0)
            {
                LeftOpt = Left(InOpt, pos);
                InOpt = Right(InOpt, Len(InOpt) - pos - 1);
            }
            // End:0x591
            else
            {
                LeftOpt = InOpt;
                InOpt = "";
            }
            AddMutator(LeftOpt, true);
            // This is an implied JumpToken; Continue!
            goto J0x524;
        }
    }
    // End:0x601
    if(CurrentGameProfile == none && !bIsTutorial)
    {
        InOpt = ParseOption(Options, "GameSpeed");
        // End:0x601
        if(InOpt != "")
        {
            Log("GameSpeed" @ InOpt);
            SetGameSpeed(float(InOpt));
        }
    }
    InOpt = ParseOption(Options, "GamePassword");
    // End:0x664
    if(InOpt != "" && AccessControl != none)
    {
        AccessControl.SetGamePassword(InOpt);
        Log("GamePassword" @ InOpt);
    }
    InOpt = ParseOption(Options, "AllowThrowing");
    // End:0x69e
    if(InOpt != "")
    {
        bAllowWeaponThrowing = bool(InOpt);
    }
    InOpt = ParseOption(Options, "AllowBehindview");
    // End:0x6da
    if(InOpt != "")
    {
        bAllowBehindView = bool(InOpt);
    }
    InOpt = ParseOption(Options, "GameStats");
    // End:0x710
    if(InOpt != "")
    {
        bEnableStatLogging = bool(InOpt);
    }
    Log("GameInfo::InitGame : bEnableStatLogging" @ string(bEnableStatLogging));
    // End:0x776
    if(HasOption(Options, "DemoRec"))
    {
        DemoCommand = ParseOption(Options, "DemoRec");
    }
    // End:0x798
    if(HasOption(Options, "AttractCam"))
    {
        bAttractCam = true;
    }
    bTestMode = HasOption(Options, "CheckErrors");
}

function AddMutator(string mutname, optional bool bUserAdded)
{
    local class<Mutator> mutClass;
    local Mutator mut;

    // End:0x12
    if(!AllowMutator(mutname))
    {
        return;
    }
    mutClass = class<Mutator>(DynamicLoadObject(mutname, class'Class'));
    // End:0x3a
    if(mutClass == none)
    {
        return;
    }
    // End:0x105
    if(mutClass.default.GroupName != "" && BaseMutator != none)
    {
        mut = BaseMutator;
        J0x67:
        // End:0x105 [While If]
        if(mut != none)
        {
            // End:0xee
            if(mut.GroupName == mutClass.default.GroupName)
            {
                Log("Not adding " $ string(mutClass) $ " because already have a mutator in the same group - " $ string(mut));
                return;
            }
            mut = mut.NextMutator;
            // This is an implied JumpToken; Continue!
            goto J0x67;
        }
    }
    mut = BaseMutator;
    J0x110:
    // End:0x19a [While If]
    if(mut != none)
    {
        // End:0x183
        if(mut.Class == mutClass)
        {
            Log("Not adding " $ string(mutClass) $ " because this mutator is already added - " $ string(mut));
            return;
        }
        mut = mut.NextMutator;
        // This is an implied JumpToken; Continue!
        goto J0x110;
    }
    mut = Spawn(mutClass);
    // End:0x1b5
    if(mut == none)
    {
        return;
    }
    mut.bUserAdded = bUserAdded;
    // End:0x1e4
    if(BaseMutator == none)
    {
        BaseMutator = mut;
    }
    // End:0x1f8
    else
    {
        BaseMutator.AddMutator(mut);
    }
}

function AddGameModifier(GameRules NewRule)
{
    // End:0x0d
    if(NewRule == none)
    {
        return;
    }
    // End:0x2f
    if(GameRulesModifiers != none)
    {
        GameRulesModifiers.AddGameRules(NewRule);
    }
    // End:0x3a
    else
    {
        GameRulesModifiers = NewRule;
    }
}

event string GetBeaconText()
{
    return Level.ComputerName $ " " $ Left(Level.Title, 24) $ "\\t" $ BeaconName $ "\\t" $ string(GetNumPlayers()) $ "/" $ string(MaxPlayers);
}

function ProcessServerTravel(string URL, bool bItems)
{
    local PlayerController P, LocalPlayer;

    BaseMutator.ServerTraveling(URL, bItems);
    EndLogging("mapchange");
    Log("ProcessServerTravel:" @ URL);
    // End:0xcd
    foreach DynamicActors(class'PlayerController', P)
    {
        // End:0xb2
        if(NetConnection(P.Player) != none)
        {
            P.ClientTravel(Eval(InStr(URL, "?") > 0, Left(URL, InStr(URL, "?")), URL), 2, bItems);
        }
        // End:0xcc
        else
        {
            LocalPlayer = P;
            P.PreClientTravel();
        }                
    }
    // End:0x116
    if(Level.NetMode != 1 && Level.NetMode != 2)
    {
        Level.NextSwitchCountdown = 0.0;
    }
}

event PreLogin(string Options, string Address, string PlayerID, out string Error, out string FailCode)
{
    local bool bSpectator;

    bSpectator = ParseOption(Options, "SpectatorOnly") ~= "1";
    // End:0x5f
    if(AccessControl != none)
    {
        AccessControl.PreLogin(Options, Address, PlayerID, Error, FailCode, bSpectator);
    }
}

function int GetIntOption(string Options, string ParseString, int CurrentValue)
{
    local string InOpt;

    InOpt = ParseOption(Options, ParseString);
    // End:0x2a
    if(InOpt != "")
    {
        return int(InOpt);
    }
    return CurrentValue;
}

function bool BecomeSpectator(PlayerController P)
{
    // End:0x7f
    if(P.PlayerReplicationInfo == none || !GameReplicationInfo.bMatchHasBegun || NumSpectators >= MaxSpectators || P.IsInState('GameEnded') || P.IsInState('RoundEnded'))
    {
        P.ReceiveLocalizedMessage(GameMessageClass, 12);
        return false;
    }
    // End:0xa7
    if(GameStats != none)
    {
        GameStats.DisconnectEvent(P.PlayerReplicationInfo);
    }
    P.PlayerReplicationInfo.bOnlySpectator = true;
    ++ NumSpectators;
    -- NumPlayers;
    return true;
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
    // End:0x0d
    if(P == none)
    {
        return true;
    }
    // End:0x23
    if(P.IsInState('RoundEnded'))
    {
        return false;
    }
    // End:0xa0
    if(P.PlayerReplicationInfo == none || !GameReplicationInfo.bMatchHasBegun || bMustJoinBeforeStart || MaxLives > 0 && P.PlayerReplicationInfo.NumLives >= MaxLives || P.IsInState('GameEnded'))
    {
        return false;
    }
    return true;
}

function bool AtCapacity(bool bSpectator)
{
    // End:0x1b
    if(Level.NetMode == 0)
    {
        return false;
    }
    // End:0x5c
    if(bSpectator)
    {
        return NumSpectators >= MaxSpectators && Level.NetMode != 2 || NumPlayers > 0;
    }
    // End:0x76
    else
    {
        return MaxPlayers > 0 && NumPlayers >= MaxPlayers;
    }
}

function InitSavedLevel()
{
    // End:0x28
    if(Level.GRI == none)
    {
        Level.GRI = GameReplicationInfo;
    }
    // End:0x58
    if(Level.ObjectPool == none)
    {
        Level.ObjectPool = new (XLevel) class'ObjectPool';
    }
}

function Pawn GetPawn4ChangeHost(string nn)
{
    local Pawn P;

    // End:0x1e
    if(!bChangedHost || nn == "")
    {
        return none;
    }
    // End:0x65
    else
    {
        // End:0x64
        foreach DynamicActors(class'Pawn', P)
        {
            // End:0x63
            if(P.LoginName == nn && P.Health > 0)
            {
                break;
                return P;
            }                        
        }
    }
    return none;
}

function byte PopNextTeam()
{
    return ++ TeamQueue;
}

function bool CheckOverlapUserName(string LoginedUserName, out string ErrMsg)
{
    local Controller C;
    local PlayerController PC_ForCheckName;

    // End:0x0e
    if(LoginedUserName == "")
    {
        return true;
    }
    C = Level.ControllerList;
    J0x22:
    // End:0xf4 [While If]
    if(C != none)
    {
        PC_ForCheckName = PlayerController(C);
        // End:0xdd
        if(PC_ForCheckName != none)
        {
            // End:0xdd
            if(PC_ForCheckName.LoginName ~= LoginedUserName)
            {
                Log("GameInfo::Login() PC_ForCheckName.LoginName:" $ PC_ForCheckName.LoginName $ " ~= LoginedUserName:" $ LoginedUserName $ " same!!");
                ErrMsg = GetErrMsg(5110);
                return false;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
    return true;
}

function class<WaitView> GetWaitViewClass(byte Team)
{
    return class'WaitViewNoTeam';
}

function WaitView GetWaitView(class<WaitView> classWaitView)
{
    local int lp1;
    local WaitView wv;
    local array<WaitView> candidates;

    // End:0x30
    if(WaitViews.Length == 0)
    {
        // End:0x2f
        foreach AllActors(class'WaitView', wv)
        {
            WaitViews[WaitViews.Length] = wv;                        
        }
    }
    lp1 = 0;
    J0x37:
    // End:0x8c [While If]
    if(lp1 < WaitViews.Length)
    {
        wv = WaitViews[lp1];
        // End:0x82
        if(wv.Class == classWaitView)
        {
            candidates[candidates.Length] = wv;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    // End:0x9d
    if(candidates.Length == 0)
    {
        return none;
    }
    // End:0xac
    else
    {
        return candidates[Rand(candidates.Length)];
    }
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local NavigationPoint StartSpot;
    local PlayerController NewPlayer, TestPlayer;
    local string InName, InAdminName, InPassword, InChecksum, InCharacter, InSex,
	    InIntervention;

    local byte inTeam, iSellectTeam;
    local bool bSpectator, bAdmin;
    local class<Security> MySecurityClass;
    local Pawn TestPawn, OldPawn;
    local WaitView startWaitView;
    local bool bAdminSpectator;

    Log("[GameInfo::Login] Options=" $ Options);
    clog("[GameInfo::Login] Options=" $ Options);
    Options = StripColor(Options);
    BaseMutator.ModifyLogin(Portal, Options);
    InName = Left(ParseOption(Options, "Name"), 20);
    Log("[GameInfo::Login] InName=" $ InName);
    // End:0xde
    if(bTeamGame)
    {
        inTeam = byte(GetIntOption(Options, "Team", 255));
    }
    // End:0xea
    else
    {
        inTeam = PopNextTeam();
    }
    iSellectTeam = byte(GetIntOption(Options, "Team", 255));
    InAdminName = ParseOption(Options, "AdminName");
    InPassword = ParseOption(Options, "Password");
    InChecksum = ParseOption(Options, "Checksum");
    InIntervention = ParseOption(Options, "Intervention");
    bAdminSpectator = bool(GetIntOption(Options, "AdminSpectator", 0));
    Log("@@@@@@@@@@@@ Name=" $ string(Name));
    // End:0x22b
    if(CheckOverlapUserName(InName, Error) == false)
    {
        Log("GameInfo::CheckOverlapUserName(InName:" $ InName $ ", Error:" $ Error $ " ) return false!!");
        return none;
    }
    // End:0x316
    if(HasOption(Options, "Load"))
    {
        Log("Loading Savegame");
        InitSavedLevel();
        bIsSaveGame = true;
        // End:0x315
        foreach DynamicActors(class'PlayerController', TestPlayer)
        {
            // End:0x314
            if(TestPlayer.Player == none && TestPlayer.PlayerOwnerName ~= InName)
            {
                TestPawn = TestPlayer.Pawn;
                // End:0x2e1
                if(TestPawn != none)
                {
                    TestPawn.SetRotation(TestPawn.Controller.Rotation);
                }
                Log("FOUND " $ string(TestPlayer) @ TestPlayer.PlayerReplicationInfo.PlayerName);
                break;
                return TestPlayer;
            }                        
        }
    }
    bSpectator = false;
    // End:0x344
    if(AccessControl != none)
    {
        bAdmin = AccessControl.CheckOptionsAdmin(Options);
    }
    // End:0x376
    if(!bAdmin && AtCapacity(bSpectator))
    {
        Error = GameMessageClass.default.MaxedOutMessage;
        return none;
    }
    // End:0x393
    if(bAdmin && AtCapacity(false))
    {
        bSpectator = true;
    }
    inTeam = PickTeam(inTeam, none);
    StartSpot = FindPlayerStart(none, inTeam, Portal);
    // End:0x3dd
    if(StartSpot == none)
    {
        Error = GameMessageClass.default.FailedPlaceMessage;
        return none;
    }
    Log("[GameInfo::Login] PlayerController");
    // End:0x429
    if(PlayerControllerClass == none)
    {
        PlayerControllerClass = class<PlayerController>(DynamicLoadObject(PlayerControllerClassName, class'Class'));
    }
    Log("[GameInfo::Login] Spawn");
    OldPawn = GetPawn4ChangeHost(InName);
    // End:0x4e0
    if(OldPawn == none)
    {
        startWaitView = GetWaitView(GetWaitViewClass(inTeam));
        // End:0x4b1
        if(startWaitView == none)
        {
            NewPlayer = Spawn(PlayerControllerClass,,, StartSpot.Location, StartSpot.Rotation);
        }
        // End:0x4dd
        else
        {
            NewPlayer = Spawn(PlayerControllerClass,,, startWaitView.Location, startWaitView.Rotation);
        }
    }
    // End:0x50c
    else
    {
        NewPlayer = Spawn(PlayerControllerClass,,, OldPawn.Location, OldPawn.Rotation);
    }
    // End:0x576
    if(NewPlayer == none)
    {
        Log("[GameInfo::Login] Couldn't spawn player controller of class " $ string(PlayerControllerClass));
        Error = GameMessageClass.default.FailedSpawnMessage;
        return none;
    }
    // End:0x5ca
    if(Level.GetMatchMaker().BotTutorial || Level.GetMatchMaker().BeginnerMode)
    {
        NewPlayer.PlayerReplicationInfo.bCanSeeEnemiesOnMinimap = true;
    }
    RefreshMaxPlayersDuringGame();
    NewPlayer.bFreeView = Level.GetMatchMaker().bFreeView;
    NewPlayer.StartSpot = StartSpot;
    NewPlayer.GameReplicationInfo = GameReplicationInfo;
    Log("[GameInfo::Login] Security");
    MySecurityClass = class<Security>(DynamicLoadObject(SecurityClass, class'Class'));
    // End:0x6ce
    if(MySecurityClass != none)
    {
        NewPlayer.PlayerSecurity = Spawn(MySecurityClass, NewPlayer);
        // End:0x6cb
        if(NewPlayer.PlayerSecurity == none)
        {
            Log("Could not spawn security for player " $ string(NewPlayer), 'Security');
        }
    }
    // End:0x76f
    else
    {
        // End:0x729
        if(SecurityClass == "")
        {
            Log("No value for Engine.GameInfo.SecurityClass -- System is not secure.", 'Security');
        }
        // End:0x76f
        else
        {
            Log("Unknown security class [" $ SecurityClass $ "] -- System is not secure.", 'Security');
        }
    }
    // End:0x78b
    if(bAttractCam)
    {
        NewPlayer.GotoState('AttractMode');
    }
    // End:0x7d3
    else
    {
        // End:0x7c3
        if(Level.GetMatchMaker().GMLevelFlag & 2 == 2)
        {
            NewPlayer.GotoState('SpectatingGM');
        }
        // End:0x7d3
        else
        {
            NewPlayer.GotoState('Spectating');
        }
    }
    // End:0x823
    if(InName == "")
    {
        InName = DefaultPlayerName;
        Log("[GameInfo::Login] init player's name - InName=" $ InName);
    }
    // End:0x870
    if(Level.NetMode != 0 || NewPlayer.PlayerReplicationInfo.PlayerName == DefaultPlayerName)
    {
        ChangeName(NewPlayer, InName, false);
    }
    NewPlayer.PlayerReplicationInfo.bAdminSpecator = bAdminSpectator;
    NewPlayer.PlayerReplicationInfo.LoadLevelMark();
    InCharacter = ParseOption(Options, "Character");
    NewPlayer.SetPawnClass(DefaultPlayerClassName, InCharacter);
    InSex = ParseOption(Options, "Sex");
    NewPlayer.PlayerReplicationInfo.PlayerID = ++ CurrentID;
    NewPlayer.PlayerReplicationInfo.SideID = PickTeam(iSellectTeam, none);
    // End:0x9c4
    if(Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        Log("Make GM - " $ InName $ "  " $ string(NewPlayer.PlayerReplicationInfo.bAdminSpecator));
        NewPlayer.DoServerViewNextPlayer = true;
        NewPlayer.GotoState('SpectatingGM');
        ++ NumSpectators;
        return NewPlayer;
    }
    // End:0xa5f
    else
    {
        // End:0xa5f
        if(bSpectator || NewPlayer.PlayerReplicationInfo.bOnlySpectator || !ChangeTeam(NewPlayer, inTeam, false))
        {
            NewPlayer.PlayerReplicationInfo.bOnlySpectator = true;
            NewPlayer.PlayerReplicationInfo.bIsSpectator = true;
            NewPlayer.PlayerReplicationInfo.bOutOfLives = true;
            ++ NumSpectators;
            return NewPlayer;
        }
    }
    myTeamMM = Level.GetMatchMaker();
    // End:0xac2
    if(Level.NetMode == 2)
    {
        // End:0xabf
        if(Level.GetLocalPlayerController() == none)
        {
            NewPlayer.SpawnInLogin(myTeamMM.My_iTeam);
        }
    }
    // End:0xb13
    else
    {
        // End:0xb13
        if(Level.NetMode == 3 || Level.NetMode == 0)
        {
            NewPlayer.SpawnInLogin(myTeamMM.My_iTeam);
        }
    }
    NewPlayer.StartSpot = StartSpot;
    // End:0xb6e
    if(AccessControl != none && AccessControl.AdminLogin(NewPlayer, InAdminName, InPassword))
    {
        AccessControl.AdminEntered(NewPlayer, InAdminName);
    }
    ++ NumPlayers;
    // End:0xb9d
    if(InIntervention == "0")
    {
        ++ NumPlayersFromStart;
        NewPlayer.bPlayFromStart = true;
    }
    // End:0xbbe
    else
    {
        // End:0xbbe
        if(InIntervention == "1")
        {
            SetPRI4Intervention(NewPlayer.PlayerReplicationInfo);
        }
    }
    // End:0xbd2
    if(NumPlayers > 20)
    {
        bLargeGameVOIP = true;
    }
    bWelcomePending = true;
    // End:0xbe9
    if(bTestMode)
    {
        TestLevel();
    }
    // End:0xc35
    if(bDelayedStart)
    {
        // End:0xc1f
        if(IsNewPlayerGotoSpectating())
        {
            NewPlayer.DoServerViewNextPlayer = true;
            NewPlayer.GotoState('Spectating');
        }
        // End:0xc2f
        else
        {
            NewPlayer.GotoState('PlayerWaiting');
        }
        return NewPlayer;
    }
    return NewPlayer;
}

function bool IsNewPlayerGotoSpectating()
{
    return false;
}

function SetPRI4Intervention(PlayerReplicationInfo PRI)
{
    PRI.IsIntervented = true;
    PRI.ElapsedTimeWhenIntervented = GameReplicationInfo.ElapsedTime;
}

event ForcedStartMatch();
event bool SetPlayerID(PlayerController P)
{
    P.PlayerReplicationInfo.PlayerID = ++ CurrentID;
    return true;
}

event bool SimpleLogin(PlayerController NewPlayer, Pawn NewPawn)
{
    local wGameStateStorageSender GSSS;
    local Vector OldLocation;
    local Rotator OldRotation;
    local int OldHealth;
    local PlayerReplicationInfo PRI;
    local bool bFoundOldPRI;
    local byte oldUseKey;
    local array<NavigationPoint> navs;
    local array<float> dists;
    local int lp1;
    local NavigationPoint nav;

    Log("[CYH] GameInfo::SimpleLogin()-" $ NewPlayer.LoginName);
    // End:0x72
    if(NewPlayer == none)
    {
        Log("[CYH] GameInfo::SimpleLogin() NewPlayer is none");
        return false;
    }
    // End:0xdf
    if(NewPlayer.RemoteRole == 3)
    {
        Log("[CYH] GameInfo::SimpleLogin() SimpleLoginedClientNum[" $ string(SimpleLoginedClientNum) $ "]");
        ++ SimpleLoginedClientNum;
        GotoNextGameState();
    }
    // End:0x131
    if(NewPlayer.RemoteRole == 3)
    {
        NewPlayer.ClientSetGRITimes(GameReplicationInfo.RemainingTime, GameReplicationInfo.ElapsedTime, GameReplicationInfo.RemainingMinute);
    }
    bFoundOldPRI = false;
    // End:0x29d
    foreach DynamicActors(class'PlayerReplicationInfo', PRI)
    {
        Log("GameInfo::SimpleLogin() search PRI[" $ PRI.PlayerName $ "] RemoteRole=" $ string(PRI.RemoteRole) $ " nOldActor=" $ string(PRI.nOldActor));
        // End:0x29c
        if(PRI.PlayerName == NewPlayer.LoginName && PRI.nOldActor > 0)
        {
            Log("Find PRI[" $ PRI.PlayerName $ "]");
            NewPlayer.DestroyPlayerReplicationInfo();
            NewPlayer.PlayerReplicationInfo = PRI;
            NewPlayer.PlayerReplicationInfo.ForceBegin();
            NewPlayer.InitPlayerReplicationInfo();
            NewPlayer.PlayerReplicationInfo.SetOwner(NewPlayer);
            bFoundOldPRI = true;
            -- PRI.nOldActor;
        }
        // End:0x29d
        else
        {
            continue;
        }        
    }
    // End:0x372
    if(bFoundOldPRI == false && NewPlayer.PlayerReplicationInfo == none)
    {
        Log("GameInfo::SimpleLogin() Not Found Old PRI" $ NewPlayer.LoginName);
        // End:0x323
        if(NewPawn != none)
        {
            NewPawn.UnPossessed();
            NewPawn.Destroy();
        }
        NewPlayer.PlayerReplicationInfo = Spawn(NewPlayer.PlayerReplicationInfoClass, NewPlayer,, vect(0.0, 0.0, 0.0), rot(0, 0, 0));
        NewPlayer.InitPlayerReplicationInfo();
    }
    // End:0x489
    foreach DynamicActors(class'wGameStateStorageSender', GSSS)
    {
        Log("[CYH] GameInfo::SimpleLogin() search GSSS.UserID=" $ string(GSSS.UserID));
        // End:0x488
        if(GSSS.UserID == NewPlayer.IDNum)
        {
            Log("[CYH] GameInfo::SimpleLogin() Find GSSS[" $ string(GSSS.UserID) $ "]");
            NewPlayer.GSSS = GSSS;
            // End:0x485
            if(NewPlayer.RemoteRole == 3)
            {
                NewPlayer.GSSS.Initialize(NewPlayer.IDNum, NewPlayer);
            }
        }
        // End:0x489
        else
        {
            continue;
        }        
    }
    // End:0x586
    if(NewPlayer.GSSS == none)
    {
        Log("GameInfo::SimpleLogin() not find GSSS");
        Log("NewPlayer.IDNum=" $ string(NewPlayer.IDNum));
        // End:0x54e
        foreach DynamicActors(class'wGameStateStorageSender', GSSS)
        {
            Log("  GSSS.UserID=" $ string(GSSS.UserID));
            Log("    LoginName=" $ GSSS.GetPlayerController().LoginName);                        
        }
        NewPlayer.CreateGameStateStorageSender();
        // End:0x584
        if(NewPawn != none)
        {
            NewPawn.UnPossessed();
            NewPawn.Destroy();
        }
        return false;
    }
    // End:0x5bd
    if(NewPawn == none)
    {
        Log("NewPawn == none" $ NewPlayer.PlayerReplicationInfo.PlayerName);
    }
    // End:0xb1d
    if(NewPawn != none)
    {
        Log("[CYH] GameInfo::SimpleLogin() Exist NewPawn" $ NewPlayer.PlayerReplicationInfo.PlayerName);
        OldHealth = NewPawn.Health;
        OldLocation = NewPawn.Location;
        OldRotation = NewPawn.Rotation;
        oldUseKey = NewPawn.byUseKey;
        NewPawn.UnPossessed();
        NewPawn.Destroy();
        // End:0x70f
        if(NewPlayer.Pawn != none)
        {
            Log("[CYH] GameInfo::SimpleLogin() NewPlayer.Pawn is not none. why??");
            NewPlayer.Pawn.UnPossessed();
            NewPlayer.Pawn.Destroy();
            NewPlayer.Pawn = none;
        }
        Log("[CYH] GameInfo::SimpleLogin() OldHeadlth[" $ string(OldHealth) $ "]");
        // End:0xac3
        if(NewPlayer.PawnClass != none && OldHealth > 0)
        {
            NewPlayer.Pawn = Spawn(NewPlayer.PawnClass,,, OldLocation, OldRotation);
            // End:0x8c8
            if(NewPlayer.Pawn == none)
            {
                Log("[GameInfo::SimpleLogin] looking for nav alternatives");
                SortNavigationPoints2(OldLocation, navs, dists);
                lp1 = 0;
                J0x7ff:
                // End:0x8c8 [While If]
                if(lp1 < navs.Length)
                {
                    Log("[GameInfo::SimpleLogin] trying " $ string(nav));
                    nav = navs[lp1];
                    NewPlayer.Pawn = Spawn(NewPlayer.PawnClass,,, nav.Location, OldRotation);
                    // End:0x8be
                    if(NewPlayer.Pawn != none)
                    {
                        Log("[GameInfo::SimpleLogin] successful");
                    }
                    // End:0x8c8
                    else
                    {
                        ++ lp1;
                        // This is an implied JumpToken; Continue!
                        goto J0x7ff;
                    }
                }
            }
            NewPlayer.Pawn.byUseKey = oldUseKey;
            // End:0x93e
            if(NewPlayer.Pawn == none)
            {
                Log("[GameInfo::SimpleLogin] spawn failed " $ NewPlayer.PlayerReplicationInfo.PlayerName);
            }
            // End:0xac0
            else
            {
                NewPlayer.PlayerReplicationInfo.bCannotChangeQS = true;
                Log("bCannotChangeQS=true for " $ NewPlayer.PlayerReplicationInfo.PlayerName);
                NewPlayer.TimeMargin = -0.10;
                NewPlayer.Pawn.LastStartTime = Level.TimeSeconds;
                NewPlayer.PreviousPawnClass = NewPlayer.Pawn.Class;
                NewPlayer.Possess(NewPlayer.Pawn);
                NewPlayer.PawnClass = NewPlayer.Pawn.Class;
                NewPlayer.ClientSetRotation(NewPlayer.Pawn.Rotation);
                NewPlayer.Pawn.LoginName = NewPlayer.LoginName;
                NewPlayer.Pawn.IDNum = NewPlayer.IDNum;
                NewPlayer.Pawn.Health = OldHealth;
            }
        }
        // End:0xb1d
        else
        {
            Log("GameInfo::SimpleLogin() NewPlayer.PawnClass is none. error!! " $ NewPlayer.PlayerReplicationInfo.PlayerName);
        }
    }
    NewPlayer.GotoState('ChangedHost');
    return true;
}

function GotoNextGameState()
{
    // End:0x5c
    if(Level.GetMatchMaker().ReconnectClientNum > 0 && Level.GetMatchMaker().ReconnectClientNum == SimpleLoginedClientNum)
    {
        // End:0x59
        if(CheckEndGameCondition() == false)
        {
            ChangedHostCompleteCountDown = ChangedHostCompleteCountDown_Initial;
        }
    }
    // End:0xda
    else
    {
        // End:0xda
        if(Level.GetMatchMaker().ReconnectClientNum < SimpleLoginedClientNum)
        {
            Log("[CYH] GameInfo::GotoNextGameState() ReconnectClientNum < SimpleLoginedClientNum. error!!");
        }
    }
    Log("[CYH] GameInfo::GotoNextGameState() Simple Logined Client Num:" $ string(SimpleLoginedClientNum) $ " ReConnectClient:" $ string(Level.GetMatchMaker().ReconnectClientNum));
}

function ContinueMatch();
function TestLevel()
{
    local Actor A, Found;
    local bool bFoundErrors;

    // End:0x53
    foreach AllActors(class'Actor', A)
    {
        bFoundErrors = bFoundErrors || A.CheckForErrors();
        // End:0x52
        if(bFoundErrors && Found == none)
        {
            Found = A;
        }                
    }
    // End:0x6c
    if(bFoundErrors)
    {
        Found.Crash();
    }
}

function StartMatch()
{
    local Actor A;

    Log("[GameInfo::StartMatch]");
    SupplyRandIndex = -1;
    // End:0x3f
    if(GameStats != none)
    {
        GameStats.StartGame();
    }
    // End:0x5f
    foreach AllActors(class'Actor', A)
    {
        A.MatchStarting();                
    }
    StartHumanPlayers();
    StartAIPlayers();
    // End:0x7d
    if(!bManuallyBeginWaitingForStart)
    {
        BeginWaitingForStart();
    }
    bWaitingToStartMatch = false;
    GameReplicationInfo.bMatchHasBegun = true;
}

function StartHumanPlayers()
{
    local Controller P;
    local array<int> aPlayerIDs;
    local int i, PlayerID;

    P = Level.ControllerList;
    J0x14:
    // End:0x25e [While If]
    if(P != none)
    {
        // End:0x247
        if(P.IsA('PlayerController') && P.Pawn == none)
        {
            // End:0x77
            if(P.PlayerReplicationInfo.bAdminSpecator)
            {
                P.GotoState('SpectatingGM');
            }
            // End:0x247
            else
            {
                // End:0x85
                if(bGameEnded)
                {
                    return;
                }
                // End:0x131
                else
                {
                    // End:0x131
                    if(PlayerController(P).CanRestartPlayer())
                    {
                        clog("[StartHumanPlayers] name=" $ P.PlayerReplicationInfo.PlayerName $ " max" $ string(Level.Game.GameReplicationInfo.MaxLives) $ " num=" $ string(P.PlayerReplicationInfo.NumLives));
                        RestartPlayer(P);
                    }
                }
                PlayerController(P).ReceiveLocalizedMessage(class'wMessage_BGM', class'wMessage_BGM'.default.Code_Start);
                // End:0x247
                if(BTSend != none && P.PlayerReplicationInfo != none && !P.PlayerReplicationInfo.IsSendGameStartTime)
                {
                    PlayerID = P.PlayerReplicationInfo.GetUID();
                    // End:0x247
                    if(PlayerID != -1)
                    {
                        aPlayerIDs[aPlayerIDs.Length] = PlayerID;
                        P.PlayerReplicationInfo.IsSendGameStartTime = true;
                        Log("[StartHumanPlayers::aPlayerIDs :" $ string(PlayerID) $ "/playerNmae:" $ P.PlayerReplicationInfo.PlayerName);
                    }
                }
            }
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    // End:0x367
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_SetGameStartTime(aPlayerIDs);
        Log("[StartHumanPlayers::BTSend.sfReqGamePlay_SetGameStartTime] aPlayerIDs Count:" $ string(aPlayerIDs.Length));
        i = 0;
        J0x2de:
        // End:0x367 [While If]
        if(i < aPlayerIDs.Length)
        {
            Log("[StartHumanPlayers::BTSend.sfReqGamePlay_SetGameStartTime] Count:" $ string(i + 1) $ "aPlayerIDs:" $ string(aPlayerIDs[i]));
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2de;
        }
    }
}

function StartAIPlayers()
{
    local Controller P;

    P = Level.ControllerList;
    J0x14:
    // End:0x9c [While If]
    if(P != none)
    {
        // End:0x85
        if(P.bIsPlayer && !P.IsA('PlayerController'))
        {
            // End:0x70
            if(Level.NetMode == 0)
            {
                RestartPlayer(P);
            }
            // End:0x85
            else
            {
                P.GotoState('Dead', 'MPStart');
            }
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function bool PlayerCanRestart(PlayerController aPlayer)
{
    return true;
}

function bool PlayerCanRestartGame(PlayerController aPlayer)
{
    return true;
}

function GameAddDefaultInventory(Pawn P)
{
    Log("[GameInfo::GameAddDefaultInventory]");
    AddDefaultInventory(P);
}

exec function logrep()
{
    local Actor A;

    Log("[GameInfo::logrep]");
    // End:0xcb
    foreach AllActors(class'Actor', A)
    {
        Log("    rep_func_cnt:" $ string(A.FunctionReplicateCount) $ " rep_var_cnt:" $ string(A.VariableReplicateCount) $ "  class=" $ string(A.Class) $ " name=" $ string(A.Name));
        A.FunctionReplicateCount = 0;
        A.VariableReplicateCount = 0;                
    }
}

function RefreshMaxPlayersDuringGame()
{
    local PlayerController PC;

    GameReplicationInfo.MaxPlayersDuringGame = 0;
    // End:0x31
    foreach DynamicActors(class'PlayerController', PC)
    {
        ++ GameReplicationInfo.MaxPlayersDuringGame;                
    }
    Log("[GameInfo::RefreshMaxPlayersDuringGame]" @ string(GameReplicationInfo.MaxPlayersDuringGame));
}

function RestartPlayer(Controller aPlayer)
{
    local NavigationPoint StartSpot;
    local int TeamNum;
    local Vehicle V, Best;
    local Vector ViewDir;
    local float BestDist, dist;
    local PlayerController PC;
    local PlayerStart ps;
    local int lp1, tries, iPlayerID;
    local array<int> aPlayerIDs;

    Log("[GameInfo::RestartPlayer] name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    // End:0xd7
    if(bRestartLevel && Level.NetMode != 1 && Level.NetMode != 2)
    {
        Log("[GameInfo::RestartPlayer] RestartLevel=" $ string(bRestartLevel) $ " Level.NetMode=" $ string(Level.NetMode));
        return;
    }
    // End:0x11f
    if(aPlayer.Pawn != none)
    {
        Log("[GameInfo::RestartPlayer] already have a pawn!");
        return;
    }
    // End:0x176
    if(aPlayer.PlayerReplicationInfo.bAdminSpecator)
    {
        Log("[GameInfo::RestartPlayer] admin spectator cannot start");
        return;
    }
    // End:0x1b4
    if(aPlayer.PlayerReplicationInfo == none || aPlayer.PlayerReplicationInfo.Team == none)
    {
        TeamNum = 255;
    }
    // End:0x1da
    else
    {
        TeamNum = aPlayer.PlayerReplicationInfo.Team.TeamIndex;
    }
    Log("[CYH] GameInfo::RestartPlayer() aPlayer.PawnClass:" $ string(aPlayer.PawnClass) $ " name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    tries = 0;
    J0x24c:
    // End:0x53a [While If]
    if(true)
    {
        Log("tries:" @ string(tries));
        StartSpot = FindPlayerStart(aPlayer, byte(TeamNum));
        // End:0x2a6
        if(StartSpot == none)
        {
            Log(" Player start not found!!!");
            return;
        }
        // End:0x2f1
        if(aPlayer.PreviousPawnClass != none && aPlayer.PawnClass != aPlayer.PreviousPawnClass)
        {
            BaseMutator.PlayerChangedClass(aPlayer);
        }
        // End:0x343
        if(aPlayer.PawnClass != none)
        {
            aPlayer.Pawn = Spawn(aPlayer.PawnClass,,, StartSpot.Location, StartSpot.Rotation);
        }
        // End:0x4ba
        if(aPlayer.Pawn == none)
        {
            Log("Spawn Failed in initial attempts");
            ps = PlayerStart(StartSpot);
            // End:0x4b7
            if(ps != none)
            {
                Log("trying satellites");
                lp1 = 0;
                J0x3b2:
                // End:0x466 [While If]
                if(lp1 < ps.Satellites.Length)
                {
                    Log("  " $ string(ps.Satellites[lp1]));
                    aPlayer.Pawn = Spawn(aPlayer.PawnClass,,, ps.Satellites[lp1].Location, ps.Satellites[lp1].Rotation);
                    // End:0x45c
                    if(aPlayer.Pawn != none)
                    {
                    }
                    // End:0x466
                    else
                    {
                        ++ lp1;
                        // This is an implied JumpToken; Continue!
                        goto J0x3b2;
                    }
                }
                // End:0x4b7
                if(aPlayer.Pawn == none)
                {
                    Log("  ASF: all satellites failed");
                    ps.LastSpawnFailTime = Level.TimeSeconds;
                }
            }
        }
        // End:0x50b
        else
        {
            aPlayer.PlayerReplicationInfo.bCannotChangeQS = false;
            Log("bCannotChangeQS=false for " $ aPlayer.PlayerReplicationInfo.PlayerName);
        }
        ++ tries;
        // End:0x537
        if(aPlayer.Pawn != none || tries > 5)
        {
        }
        // End:0x53a
        else
        {
            // This is an implied JumpToken; Continue!
            goto J0x24c;
        }
    }
    aPlayer.Pawn.PrevLocation = aPlayer.Pawn.Location;
    aPlayer.Pawn.PrevInterpoLocation = aPlayer.Pawn.Location;
    aPlayer.Pawn.PrevMoveDir = MakeVector(0.0, 0.0, 0.0);
    // End:0x63f
    if(float(aPlayer.Pawn.PrevTime) == 0.0 && aPlayer.PlayerReplicationInfo.bBot == false)
    {
        aPlayer.Pawn.PrevTime = PlayerController(aPlayer).GameReplicationInfo.RemainingTime;
    }
    // End:0x679
    else
    {
        aPlayer.Pawn.PrevTime = Level.GetLocalPlayerController().myHUD.GetCurGameTime();
    }
    CombatLog("[RESPAWN_EVENT] UserName=" $ aPlayer.PlayerReplicationInfo.PlayerName $ " TeamIndex=" $ string(aPlayer.PlayerReplicationInfo.SideID) $ " PosX=" $ string(aPlayer.Pawn.Location.X) $ " PosY=" $ string(aPlayer.Pawn.Location.Y) $ " PosZ=" $ string(aPlayer.Pawn.Location.Z));
    // End:0x837
    if(aPlayer.Pawn == none)
    {
        Log("MRF: multiple respawn failed" $ " name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
        Log("Couldn't spawn player of type " $ string(aPlayer.PawnClass) $ " at " $ string(StartSpot));
        aPlayer.GotoState('Dead');
        // End:0x835
        if(PlayerController(aPlayer) != none)
        {
            PlayerController(aPlayer).ClientGotoState('Dead', 'Begin');
        }
        return;
    }
    Log("respawn successful name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    recentlySpawnedPoints[recentlySpawnedPoints.Length] = StartSpot;
    // End:0x893
    if(recentlySpawnedPoints.Length > 3)
    {
        recentlySpawnedPoints.Remove(0, 1);
    }
    // End:0x928
    if(aPlayer.PlayerReplicationInfo.bNoTeam == false)
    {
        // End:0x901
        if(aPlayer.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            recentlySpawnedPointsTeamAF[recentlySpawnedPointsTeamAF.Length] = StartSpot;
            // End:0x8fe
            if(recentlySpawnedPointsTeamAF.Length > 3)
            {
                recentlySpawnedPointsTeamAF.Remove(0, 1);
            }
        }
        // End:0x928
        else
        {
            recentlySpawnedPointsTeamRSA[recentlySpawnedPointsTeamRSA.Length] = StartSpot;
            // End:0x928
            if(recentlySpawnedPointsTeamRSA.Length > 3)
            {
                recentlySpawnedPointsTeamRSA.Remove(0, 1);
            }
        }
    }
    // End:0x951
    if(PlayerController(aPlayer) != none)
    {
        PlayerController(aPlayer).TimeMargin = -0.10;
    }
    aPlayer.Pawn.Anchor = StartSpot;
    aPlayer.Pawn.LastStartSpot = PlayerStart(StartSpot);
    aPlayer.Pawn.LastStartTime = Level.TimeSeconds;
    aPlayer.PreviousPawnClass = aPlayer.Pawn.Class;
    aPlayer.Possess(aPlayer.Pawn);
    aPlayer.PawnClass = aPlayer.Pawn.Class;
    Log("[GameInfo::RestartPlayer] " $ aPlayer.PlayerReplicationInfo.PlayerName $ " NumLives++ at " $ string(aPlayer.PlayerReplicationInfo.NumLives));
    ++ aPlayer.PlayerReplicationInfo.NumLives;
    aPlayer.ClientSetRotation(aPlayer.Pawn.Rotation);
    GameAddDefaultInventory(aPlayer.Pawn);
    TriggerEvent(StartSpot.Event, StartSpot, aPlayer.Pawn);
    // End:0xc86
    if(bAllowVehicles && Level.NetMode == 0 && PlayerController(aPlayer) != none)
    {
        BestDist = 2000.0;
        ViewDir = vector(aPlayer.Pawn.Rotation);
        V = VehicleList;
        J0xb69:
        // End:0xc58 [While If]
        if(V != none)
        {
            // End:0xc41
            if(V.bTeamLocked && aPlayer.GetTeamNum() == V.Team)
            {
                dist = VSize(V.Location - aPlayer.Pawn.Location);
                // End:0xc1c
                if(ViewDir Dot V.Location - aPlayer.Pawn.Location < float(0))
                {
                    dist *= float(2);
                }
                // End:0xc41
                if(dist < BestDist)
                {
                    Best = V;
                    BestDist = dist;
                }
            }
            V = V.NextVehicle;
            // This is an implied JumpToken; Continue!
            goto J0xb69;
        }
        // End:0xc86
        if(Best != none)
        {
            Best.PlayerStartTime = Level.TimeSeconds + float(8);
        }
    }
    // End:0xcb7
    if(GameReplicationInfo.WaitingForStart)
    {
        aPlayer.GotoState('PlayerWaiting');
        aPlayer.ClientOnBeginWaitingForStart();
    }
    PC = PlayerController(aPlayer);
    // End:0xd1e
    if(PC != none)
    {
        PC.Pawn.LoginName = PC.LoginName;
        PC.Pawn.IDNum = PC.IDNum;
    }
    // End:0xe7b
    if(aPlayer != none && aPlayer.PlayerReplicationInfo != none && !aPlayer.PlayerReplicationInfo.IsSendGameStartTime && aPlayer.PlayerReplicationInfo.NumLives == 1)
    {
        // End:0xe7b
        if(BTSend != none && !IsA('wMSGameInfo') || IsA('wDOMGameInfo'))
        {
            iPlayerID = aPlayer.PlayerReplicationInfo.GetUID();
            // End:0xe7b
            if(-1 != iPlayerID)
            {
                aPlayerIDs[0] = iPlayerID;
                Log("[RestartPlayer>sfReqGamePlay_SetGameStartTime] PlayerName:" $ aPlayer.PlayerReplicationInfo.PlayerName $ "/iPlayerID:" $ string(iPlayerID));
                BTSend.sfReqGamePlay_SetGameStartTime(aPlayerIDs);
                aPlayer.PlayerReplicationInfo.IsSendGameStartTime = true;
            }
        }
    }
}

function BeginWaitingForStart()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x89 [While If]
    if(C != none)
    {
        // End:0x63
        if(C.Pawn != none && C.PlayerReplicationInfo.bAdminSpecator == false)
        {
            C.GotoState('WaitingForStart');
        }
        C.ClientOnBeginWaitingForStart();
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    GameReplicationInfo.WaitingForStart = true;
    GameReplicationInfo.WaitingForStartCountDown = int(3.50);
}

function EndWaitingForStart()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x69 [While If]
    if(C != none)
    {
        // End:0x43
        if(C.Pawn != none)
        {
            C.GotoState('PlayerWalking');
        }
        C.ClientOnEndWaitingForStart();
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    GameReplicationInfo.WaitingForStart = false;
    GameReplicationInfo.WaitingForStartCountDown = -1;
}

function class<Pawn> GetDefaultPlayerClass(Controller C)
{
    local PlayerController PC;
    local string PawnClassName;
    local class<Pawn> PawnClass;

    PC = PlayerController(C);
    // End:0x63
    if(PC != none)
    {
        PawnClassName = PC.GetDefaultURL("Class");
        PawnClass = class<Pawn>(DynamicLoadObject(PawnClassName, class'Class'));
        // End:0x63
        if(PawnClass != none)
        {
            return PawnClass;
        }
    }
    return class<Pawn>(DynamicLoadObject(DefaultPlayerClassName, class'Class'));
}

event PostLogin(PlayerController NewPlayer)
{
    local class<HUD> HudClass;
    local class<ScoreBoard> ScoreboardClass, ResultScoreboardClass, ResultScoreboardBootyClass;

    // End:0xb0
    if(!bIsSaveGame)
    {
        // End:0x73
        if(GameStats != none)
        {
            GameStats.ConnectEvent(NewPlayer.PlayerReplicationInfo);
            GameStats.GameEvent("NameChange", NewPlayer.PlayerReplicationInfo.PlayerName, NewPlayer.PlayerReplicationInfo);
        }
        // End:0xb0
        if(!bDelayedStart)
        {
            bRestartLevel = false;
            // End:0x98
            if(bWaitingToStartMatch)
            {
                StartMatch();
            }
            // End:0xa3
            else
            {
                RestartPlayer(NewPlayer);
            }
            bRestartLevel = default.bRestartLevel;
        }
    }
    // End:0xe8
    if(HUDType == "")
    {
        Log("No HUDType specified in GameInfo", 'Log');
    }
    // End:0x133
    else
    {
        HudClass = class<HUD>(DynamicLoadObject(HUDType, class'Class'));
        // End:0x133
        if(HudClass == none)
        {
            Log("Can't find HUD class " $ HUDType, 'Error');
        }
    }
    // End:0x1e6
    if(ScoreBoardType != "")
    {
        // End:0x194
        if(Level.GetMatchMaker().BotTutorial)
        {
            ScoreboardClass = class<ScoreBoard>(DynamicLoadObject("XInterface.xScoreBoardTutorial", class'Class'));
        }
        // End:0x1af
        else
        {
            ScoreboardClass = class<ScoreBoard>(DynamicLoadObject(ScoreBoardType, class'Class'));
        }
        // End:0x1e6
        if(ScoreboardClass == none)
        {
            Log("Can't find ScoreBoard class " $ ScoreBoardType, 'Error');
        }
    }
    // End:0x20d
    if(ResultScoreBoardType != "")
    {
        ResultScoreboardClass = class<ScoreBoard>(DynamicLoadObject(ResultScoreBoardType, class'Class'));
    }
    // End:0x234
    if(ResultScoreBoardBootyType != "")
    {
        ResultScoreboardBootyClass = class<ScoreBoard>(DynamicLoadObject(ResultScoreBoardBootyType, class'Class'));
    }
    NewPlayer.ClientSetHUD(HudClass, ScoreboardClass, ResultScoreboardClass, ResultScoreboardBootyClass);
    SetWeaponViewShake(NewPlayer);
    // End:0x26d
    if(bIsSaveGame)
    {
        return;
    }
    // End:0x2b0
    if(NewPlayer.Pawn != none)
    {
        NewPlayer.Pawn.ClientSetRotation(NewPlayer.Pawn.Rotation);
    }
    // End:0x2cf
    if(VotingHandler != none)
    {
        VotingHandler.PlayerJoin(NewPlayer);
    }
    // End:0x2f7
    if(AccessControl != none)
    {
        NewPlayer.LoginDelay = AccessControl.LoginDelaySeconds;
    }
    NewPlayer.ClientCapBandwidth(NewPlayer.Player.CurrentNetSpeed);
    NotifyLogin(NewPlayer.PlayerReplicationInfo.PlayerID);
    Log("New Player" @ NewPlayer.PlayerReplicationInfo.PlayerName @ "id=" $ NewPlayer.GetPlayerIDHash());
}

function SetWeaponViewShake(PlayerController P)
{
    P.ClientSetWeaponViewShake(bWeaponShouldViewShake && bModViewShake);
}

function Logout(Controller Exiting)
{
    local bool bMessage;

    bMessage = true;
    // End:0x96
    if(PlayerController(Exiting) != none)
    {
        // End:0x5a
        if(AccessControl != none && AccessControl.AdminLogout(PlayerController(Exiting)))
        {
            AccessControl.AdminExited(PlayerController(Exiting));
        }
        // End:0x8c
        if(PlayerController(Exiting).PlayerReplicationInfo.bOnlySpectator)
        {
            bMessage = false;
            -- NumSpectators;
        }
        // End:0x93
        else
        {
            -- NumPlayers;
        }
    }
    // End:0x9e
    else
    {
        bMessage = false;
    }
    // End:0x122
    if(bMessage && Level.NetMode == 1 || Level.NetMode == 2)
    {
        // End:0x122
        if(!Exiting.PlayerReplicationInfo.bAdminSpecator && !bGameEnded)
        {
            BroadcastLocalizedMessage(GameMessageClass, 4, Exiting.PlayerReplicationInfo);
        }
    }
    // End:0x141
    if(VotingHandler != none)
    {
        VotingHandler.PlayerExit(Exiting);
    }
    // End:0x169
    if(GameStats != none)
    {
        GameStats.DisconnectEvent(Exiting.PlayerReplicationInfo);
    }
    NotifyLogout(Exiting);
}

function NotifyLogin(int NewPlayerID)
{
    local int i;
    local array<PlayerController> PCArray;

    GetPlayerControllerList(PCArray);
    i = 0;
    J0x12:
    // End:0x46 [While If]
    if(i < PCArray.Length)
    {
        PCArray[i].ServerRequestBanInfo(NewPlayerID);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
}

function NotifyLogout(Controller Exiting)
{
    local Controller C;
    local PlayerController PC;

    BaseMutator.NotifyLogout(Exiting);
    // End:0xd0
    if(PlayerController(Exiting) != none && Exiting.PlayerReplicationInfo != none)
    {
        C = Level.ControllerList;
        J0x4e:
        // End:0xd0 [While If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0xb9
            if(PC != none && PC.ChatManager != none)
            {
                PC.ChatManager.UnTrackPlayer(Exiting.PlayerReplicationInfo.PlayerID);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x4e;
        }
    }
}

event AcceptInventory(Pawn PlayerPawn);
function AddGameSpecificInventory(Pawn P)
{
    local wWeapon newWeapon;
    local class<wWeapon> WeapClass;

    WeapClass = BaseMutator.GetDefaultWeapon();
    // End:0x8a
    if(WeapClass != none && P.FindInventoryType(WeapClass) == none)
    {
        newWeapon = Spawn(WeapClass,,, P.Location);
        // End:0x8a
        if(newWeapon != none)
        {
            newWeapon.GiveTo(P);
            newWeapon.bCanThrow = false;
        }
    }
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    local wWeapon newWeapon;
    local class<wWeapon> WeapClass;

    WeapClass = BaseMutator.GetDefaultWeapon();
    // End:0x8a
    if(WeapClass != none && PlayerPawn.FindInventoryType(WeapClass) == none)
    {
        newWeapon = Spawn(WeapClass,,, PlayerPawn.Location);
        // End:0x8a
        if(newWeapon != none)
        {
            newWeapon.GiveTo(PlayerPawn);
            newWeapon.bCanThrow = false;
        }
    }
    SetPlayerDefaults(PlayerPawn);
}

function SetPlayerDefaults(Pawn PlayerPawn)
{
    PlayerPawn.AirControl = PlayerPawn.default.AirControl;
    PlayerPawn.GroundSpeed = PlayerPawn.default.GroundSpeed;
    PlayerPawn.WaterSpeed = PlayerPawn.default.WaterSpeed;
    PlayerPawn.AirSpeed = PlayerPawn.default.AirSpeed;
    PlayerPawn.Acceleration = PlayerPawn.default.Acceleration;
    PlayerPawn.JumpZ = PlayerPawn.default.JumpZ;
    BaseMutator.ModifyPlayer(PlayerPawn);
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x54 [While If]
    if(C != none)
    {
        C.NotifyKilled(Killer, Killed, KilledPawn);
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, class<DamageType> Damage)
{
    // End:0x2e
    if(GameStats != none)
    {
        GameStats.KillEvent(KillType, Killer, Victim, Damage);
    }
}

function ProcessKillMessage(Controller Killer, Controller Killed, optional int CollisionPart, optional int WeaponType, optional out int iConKillorHeadShot, optional bool bWallShot)
{
    local Controller C;
    local PlayerController PC;
    local float fDist;
    local byte byKillSuccession;
    local int iArray;
    local Actor.CollisionPartsType MyCollisionPart;
    local Actor.eWeaponType MyWeaponType;
    local int iCode_Message, iSoundCase;

    Log(string(self) $ "ProcessKillMessage() ");
    // End:0x41
    if(Killer.PlayerReplicationInfo == Killed.PlayerReplicationInfo)
    {
        return;
    }
    ++ Killer.PlayerReplicationInfo.KillSuccession;
    byKillSuccession = byte(Min(Killer.PlayerReplicationInfo.KillSuccession, 255));
    C = Level.ControllerList;
    J0x91:
    // End:0x37d [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x366
        if(PC != none && !bGameEnded && !IsInState('MatchOver') && kMM.InGamePlaying)
        {
            // End:0x22b
            if(C.GetTeamNum() == Killer.GetTeamNum() && C.PlayerReplicationInfo != Killer.PlayerReplicationInfo)
            {
                fDist = VSize(C.Pawn.Location - Killer.Pawn.Location);
                // End:0x228
                if(fDist < class'wMessage_Game'.default.MessageRange)
                {
                    Log(string(self) $ "ProcessKillMessage() iCode_Message [ class'wMessage_Game'.default.Code_AllyKillEnemy] ");
                    iCode_Message = class'wMessage_Game'.default.Code_AllyKillEnemy;
                    PC.ReceiveLocalizedMessage(class'wMessage_Game', iCode_Message, Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo);
                }
                // End:0x37d
                else
                {
                    // This is an implied JumpToken;
                    goto J0x366;
                }
                // End:0x366
                if(C.GetTeamNum() == Killed.GetTeamNum() && C.PlayerReplicationInfo != Killed.PlayerReplicationInfo)
                {
                    fDist = VSize(C.Pawn.Location - Killed.Pawn.Location);
                    // End:0x366
                    if(fDist < class'wMessage_Game'.default.MessageRange)
                    {
                        Log(string(self) $ "ProcessKillMessage() iCode_Message [ class'wMessage_Game'.default.Code_AllyDie] ");
                        iCode_Message = class'wMessage_Game'.default.Code_AllyDie;
                        PC.ReceiveLocalizedMessage(class'wMessage_Game', iCode_Message, Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo);
                    }
                    // End:0x37d
                    else
                    {
                    }
                }
                J0x366:
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x91;
            }
        }
    }
    iSoundCase = -1;
    C = Level.ControllerList;
    J0x39c:
    // End:0x905 [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x8ee
        if(PC != none && !bGameEnded && !IsInState('MatchOver') && kMM.InGamePlaying)
        {
            iArray = SendMessageKillSuccssion(Killer, PC, byKillSuccession);
            // End:0x82b
            if(Killer.PlayerReplicationInfo == C.PlayerReplicationInfo || Killer.Pawn == Pawn(PC.ViewTarget))
            {
                // End:0x487
                if(Killer.PlayerReplicationInfo == C.PlayerReplicationInfo)
                {
                    SendQuest_KillSuccession(Killer, byKillSuccession);
                }
                MyCollisionPart = byte(CollisionPart);
                MyWeaponType = byte(WeaponType);
                // End:0x4da
                if(-1 != iArray)
                {
                    PC.ReceiveLocalizedMessage(class'wMultiKillMessage', iArray);
                    iConKillorHeadShot = iConKillorHeadShot | 1;
                }
                // End:0x5dd
                else
                {
                    iCode_Message = class'wMessage_Game'.default.Code_AllyKillEnemy;
                    PC.ReceiveLocalizedMessage(class'wMessage_Game', iCode_Message, Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo);
                    // End:0x5dd
                    if(Killer != none && Killer.PlayerReplicationInfo != none && PC.ViewTarget != none && Killer.PlayerReplicationInfo != PC.PlayerReplicationInfo && Killer.Pawn == Pawn(PC.ViewTarget) && iConKillorHeadShot & 1 == 1)
                    {
                        SendMessageAddScore(PC, Killer, Killed, SC.KDLog.KillWeapon);
                    }
                }
                // End:0x66d
                if(MyCollisionPart == 1 && MyWeaponType != 13)
                {
                    // End:0x631
                    if(PC.Pawn.bIsAiming)
                    {
                        iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_Headshot_Aim;
                    }
                    // End:0x645
                    else
                    {
                        iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_Headshot;
                    }
                    PC.ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    iConKillorHeadShot = iConKillorHeadShot | 2;
                }
                // End:0x6b5
                if(bWallShot)
                {
                    iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_WallShot;
                    PC.ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    iConKillorHeadShot = iConKillorHeadShot | 1024;
                }
                // End:0x75d
                if(MyCollisionPart == 1 && MyWeaponType != 13)
                {
                    iCode_Message = class'wMessage_Quest'.default.Code_Quest_HeadShotKill;
                    // End:0x75d
                    if(PlayerController(Killer) != none && Killer.PlayerReplicationInfo == C.PlayerReplicationInfo)
                    {
                        PlayerController(Killer).ReceiveMessage_QuestType1(class'wMessage_Quest', iCode_Message, SC.KillWeaponType, SC.KDLog.KillWeapon);
                    }
                }
                // End:0x828
                if(Level.GetMatchMaker() != none && Level.GetMatchMaker().BotTutorial && MyWeaponType == 5)
                {
                    iCode_Message = class'wMessage_Quest'.default.Code_Quest_KillGrenade;
                    // End:0x828
                    if(PlayerController(Killer) != none && Killer.PlayerReplicationInfo == C.PlayerReplicationInfo)
                    {
                        PlayerController(Killer).ReceiveMessage_QuestType1(class'wMessage_Quest', iCode_Message, SC.KillWeaponType, SC.KDLog.KillWeapon);
                    }
                }
            }
            // End:0x8ee
            else
            {
                // End:0x8ee
                if(Killed.PlayerReplicationInfo == C.PlayerReplicationInfo)
                {
                    iCode_Message = class'wMessage_Game'.default.Code_AllyDie;
                    PC.ReceiveLocalizedMessage(class'wMessage_Game', iCode_Message, Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo);
                    iCode_Message = class'wMessage_Quest'.default.Code_Quest_Death;
                    // End:0x8ee
                    if(PC != none)
                    {
                        PC.ReceiveMessage_QuestType1(class'wMessage_Quest', iCode_Message, SC.KillWeaponType, SC.KDLog.KillWeapon);
                    }
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x39c;
    }
}

function int SendMessageKillSuccssion(Controller Killer, PlayerController PC, byte byKillSuccession)
{
    local int iArray;

    iArray = -1;
    // End:0x2e
    if(byKillSuccession >= 2)
    {
        iArray = Min(byKillSuccession, 16) - 2;
    }
    return iArray;
}

function SendQuest_KillSuccession(Controller Killer, byte byKillSuccession)
{
    local int iCode_Message;

    // End:0x1c
    if(Killer == none || byKillSuccession < 1)
    {
        return;
    }
    Log(string(self) $ "SendQuest_KillSuccession() : " $ Killer.PlayerReplicationInfo.PlayerName $ " / byKillSuccession: " $ string(byKillSuccession));
    switch(byKillSuccession)
    {
        // End:0xa0
        case 2:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_2Kill;
            // End:0x1ad
            break;
        // End:0xbc
        case 3:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_3Kill;
            // End:0x1ad
            break;
        // End:0xd8
        case 4:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_4Kill;
            // End:0x1ad
            break;
        // End:0xf4
        case 5:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_5Kill;
            // End:0x1ad
            break;
        // End:0x110
        case 6:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_6Kill;
            // End:0x1ad
            break;
        // End:0x12c
        case 7:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_7Kill;
            // End:0x1ad
            break;
        // End:0x148
        case 8:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_8Kill;
            // End:0x1ad
            break;
        // End:0x164
        case 9:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_9Kill;
            // End:0x1ad
            break;
        // End:0x180
        case 10:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_10Kill;
            // End:0x1ad
            break;
        // End:0x19c
        case 15:
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_15Kill;
            // End:0x1ad
            break;
        // End:0xffff
        default:
            iCode_Message = -1;
            // End:0x1ad Break;
            break;
    }
    // End:0x1f7
    if(iCode_Message > 0)
    {
        PlayerController(Killer).ReceiveMessage_QuestType1(class'wMessage_Quest', iCode_Message, SC.KillWeaponType, SC.KDLog.KillWeapon);
    }
}

function bool DoProcessKillMessage(class<DamageType> DamageType)
{
    return DamageType != class'Suicided';
}

function KDLOG_Initialize()
{
    local KillDeathLog empty;

    Log("KDLOG_Initialize");
    SC.KDLog = empty;
    SC.KDLogSaved = false;
    SC.AssistUIDs.Length = 0;
    SC.AssistType.Length = 0;
}

function KDLOG_Finalize()
{
    local int i, iPlayerID, iAssi;
    local wMatchUserInfo Killer, Killed;

    Log("KDLOG_Finalize");
    // End:0x3fe
    if(SC.KDLogSaved && SC.KDLog.CharKillUID != -1 && SC.KDLog.CharDeathUID != -1 && Level.GetMatchMaker().bHasChannelTCP)
    {
        Log("[KDLOG_Finalize>BTSend.sfReqLogGetScore]");
        BTSend.sfReqLogGetScore(SC.KDLog, SC.AssistUIDs, SC.AssistType);
        i = 0;
        J0xec:
        // End:0x1ee [While If]
        if(i < SC.AssistUIDs.Length)
        {
            iPlayerID = SC.AssistUIDs[i];
            Killer = kMM.GetUserInfoByUID(iPlayerID);
            iAssi = SC.AssistType[i];
            Log("[GameInfo::KDLOG_Finalize::AssistList]: count:" $ string(i + 1) $ "/AssistUIDs:" $ string(iPlayerID) $ "/PlayerName:" $ Killer.UserName $ "/AssistType" $ string(iAssi));
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xec;
        }
        Killer = kMM.GetUserInfoByUID(SC.KDLog.CharKillUID);
        Killed = kMM.GetUserInfoByUID(SC.KDLog.CharDeathUID);
        // End:0x3fe
        if(Killer != none && Killed != none)
        {
            CombatLog("[KILL_EVENT] KillerName=" $ Killer.UserName $ " KillerTeam=" $ string(Killer.TeamNum) $ " KillXCoord=" $ string(SC.KDLog.KillXCoord) $ " KillYCoord=" $ string(SC.KDLog.KillYCoord) $ " KillZCoord=" $ string(SC.KDLog.KillZCoord) $ " KillWeapon=" $ string(SC.KDLog.KillWeapon) $ " KilledName=" $ Killed.UserName $ " KilledTeam=" $ string(Killed.TeamNum) $ " DeathXCoord=" $ string(SC.KDLog.DeathXCoord) $ " DeathYCoord=" $ string(SC.KDLog.DeathYCoord) $ " DeathZCoord=" $ string(SC.KDLog.DeathZCoord));
        }
    }
    SC.KDLogSaved = false;
}

function KDLOG_Finalize_HeliCopter(int KillerUID, Controller Killer, Controller HeliCopter)
{
    local int i, iPlayerID;
    local wMatchUserInfo UserInfo;
    local float fKillXCoord, fKillYCoord, fKillZCoord;
    local int iKillPos, iKillWeapon, iKillWeaponPart, iKillRange, iKillDamage, iChopperCallerID;

    local string strChopperCallerName;
    local float fDeathXCoord, fDeathYCoord, fDeathZCoord;

    Log("KDLOG_Finalize_HeliCopter");
    // End:0x3b3
    if(SC.KDLogSaved && KillerUID != -1 && Level.GetMatchMaker().bHasChannelTCP)
    {
        UserInfo = kMM.GetUserInfoByUID(KillerUID);
        Log("[KDLOG_Finalize_HeliCopter>BTSend.sfReqGamePlay_GetChopper] KillerUID:" $ string(KillerUID) $ "/PlayerName:" $ UserInfo.UserName $ "/Assist Count:" $ string(SC.AssistUIDs.Length));
        fKillXCoord = SC.KDLog.KillXCoord;
        fKillYCoord = SC.KDLog.KillYCoord;
        fKillZCoord = SC.KDLog.KillZCoord;
        iKillPos = SC.KDLog.KillPos;
        iKillWeapon = SC.KDLog.KillWeapon;
        iKillWeaponPart = SC.KDLog.KillWeaponPart;
        iKillRange = SC.KDLog.KillRange;
        iKillDamage = SC.KDLog.KillDamage;
        iChopperCallerID = HeliCopter.Caller.PlayerReplicationInfo.GetUID();
        strChopperCallerName = HeliCopter.Caller.PlayerReplicationInfo.PlayerName;
        fDeathXCoord = SC.KDLog.DeathXCoord;
        fDeathYCoord = SC.KDLog.DeathYCoord;
        fDeathZCoord = SC.KDLog.DeathZCoord;
        BTSend.sfReqGamePlay_GetChopper(KillerUID, SC.AssistUIDs, fKillXCoord, fKillYCoord, fKillZCoord, iKillPos, iKillWeapon, iKillWeaponPart, iKillRange, iKillDamage, iChopperCallerID, strChopperCallerName, fDeathXCoord, fDeathYCoord, fDeathZCoord);
        i = 0;
        J0x2da:
        // End:0x3b3 [While If]
        if(i < SC.AssistUIDs.Length)
        {
            iPlayerID = SC.AssistUIDs[i];
            UserInfo = kMM.GetUserInfoByUID(iPlayerID);
            Log("[GameInfo::KDLOG_Finalize_HeliCopter::AssistList]: count:" $ string(i + 1) $ "/AssistUIDs:" $ string(iPlayerID) $ "/PlayerName:" $ UserInfo.UserName);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2da;
        }
    }
    SC.KDLogSaved = false;
}

function int ExceptionKillWeapon(int iKillWeaponID, optional class<DamageType> DamageType, optional int WeaponType)
{
    local int iResult;
    local string sDamageType;

    iResult = iKillWeaponID;
    switch(DamageType)
    {
        // End:0x1d
        case class'wDamageAirStrike':
            // End:0x23
            break;
        // End:0xffff
        default:
            // End:0x23 Break;
            break;
    }
    sDamageType = string(DamageType);
    switch(sDamageType)
    {
        // End:0xffff
        default:
            // End:0x3d Break;
            break;
    }
    return iResult;
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local Vehicle V;
    local string strDamageType;
    local int iUID, supplyID;
    local bool updateScore;
    local int iConKillorHeadShot;

    updateScore = false;
    iConKillorHeadShot = 0;
    strDamageType = string(DamageType);
    Killed.PlayerReplicationInfo.KillSuccession = 0;
    // End:0xb2c
    if(Killer != none && Killer.PlayerReplicationInfo != none && Killed != none && Killed.PlayerReplicationInfo != none && !DamageType.default.SkipDeathIncrement)
    {
        updateScore = true;
        Log("[GameInfo::Killed] Killer=" $ Killer.PlayerReplicationInfo.PlayerName $ " Victim=" $ Killed.PlayerReplicationInfo.PlayerName $ " damageType=" $ strDamageType);
        SC.KDLogSaved = true;
        SC.KDLog.CharKillUID = Killer.PlayerReplicationInfo.GetUID();
        SC.KDLog.KillXCoord = Killer.Pawn.Location.X;
        SC.KDLog.KillYCoord = Killer.Pawn.Location.Y;
        SC.KDLog.KillZCoord = Killer.Pawn.Location.Z;
        SC.KDLog.KillPos = Killer.Pawn.GetPostureIndex();
        SC.KillWeaponType = WeaponType;
        SC.IsWeaponAiming = Killer.Pawn.bIsAiming;
        // End:0x317
        if(DamageType == class'wDamageAirStrike' || strDamageType ~= "WWeapons_Res.wWeaponRes_Artillery" || strDamageType ~= "WWeapons_Res.wWeaponRes_PinpointBomb")
        {
            // End:0x2fb
            if(strDamageType ~= "WWeapons_Res.wWeaponRes_PinpointBomb")
            {
                SC.KDLog.KillWeapon = 50006;
            }
            // End:0x314
            else
            {
                SC.KDLog.KillWeapon = 50000;
            }
        }
        // End:0x8f4
        else
        {
            // End:0x36b
            if(DamageType == class'wDamageFlameThrower' || strDamageType ~= "WWeapons_Res.wWeaponRes_M2B")
            {
                SC.KDLog.KillWeapon = 5003;
            }
            // End:0x8f4
            else
            {
                // End:0x64d
                if(DamageType == class'wDamageGR' || strDamageType ~= "WWeapons_Res.wWeaponRes_FragGrenade" || strDamageType ~= "WWeapons_Res.wWeaponRes_StunGrenade" || strDamageType ~= "WWeapons_Res.wWeaponRes_IncGrenade" || strDamageType ~= "WWeapons_Res.wWeaponRes_SplitGrenade" || strDamageType ~= "WWeapons_Res.wWeaponRes_IncGrenadeFlame" || strDamageType ~= "WWeapons_Res.wWeaponRes_SplitGrenadeFragment")
                {
                    // End:0x4f8
                    if(strDamageType ~= "WWeapons_Res.wWeaponRes_StunGrenade")
                    {
                        SC.KDLog.KillWeapon = 6002;
                    }
                    // End:0x64a
                    else
                    {
                        // End:0x542
                        if(strDamageType ~= "WWeapons_Res.wWeaponRes_IncGrenade")
                        {
                            SC.KDLog.KillWeapon = 6005;
                        }
                        // End:0x64a
                        else
                        {
                            // End:0x591
                            if(strDamageType ~= "WWeapons_Res.wWeaponRes_IncGrenadeFlame")
                            {
                                SC.KDLog.KillWeapon = 50007;
                            }
                            // End:0x64a
                            else
                            {
                                // End:0x5e5
                                if(strDamageType ~= "WWeapons_Res.wWeaponRes_SplitGrenadeFragment")
                                {
                                    SC.KDLog.KillWeapon = 50008;
                                }
                                // End:0x64a
                                else
                                {
                                    // End:0x631
                                    if(strDamageType ~= "WWeapons_Res.wWeaponRes_SplitGrenade")
                                    {
                                        SC.KDLog.KillWeapon = 7003;
                                    }
                                    // End:0x64a
                                    else
                                    {
                                        SC.KDLog.KillWeapon = 6000;
                                    }
                                }
                            }
                        }
                    }
                }
                // End:0x8f4
                else
                {
                    // End:0x678
                    if(DamageType == class'wDamageHelicopter')
                    {
                        SC.KDLog.KillWeapon = 5009;
                    }
                    // End:0x8f4
                    else
                    {
                        // End:0x6bf
                        if(strDamageType ~= "WWeapons_Res.wWeaponRes_HeliGun")
                        {
                            SC.KDLog.KillWeapon = 50001;
                        }
                        // End:0x8f4
                        else
                        {
                            // End:0x707
                            if(strDamageType ~= "WWeapons_Res.wWeaponRes_HeliRPG7")
                            {
                                SC.KDLog.KillWeapon = 50002;
                            }
                            // End:0x8f4
                            else
                            {
                                // End:0x7c9
                                if(DamageType == class'wDamageRPG' || strDamageType ~= "WWeapons_Res.wWeaponRes_RPG7" || strDamageType ~= "WWeapons_Res.wWeaponRes_ATR")
                                {
                                    // End:0x7ad
                                    if(strDamageType ~= "WWeapons_Res.wWeaponRes_RPG7")
                                    {
                                        SC.KDLog.KillWeapon = 5011;
                                    }
                                    // End:0x7c6
                                    else
                                    {
                                        SC.KDLog.KillWeapon = 5001;
                                    }
                                }
                                // End:0x8f4
                                else
                                {
                                    // End:0x816
                                    if(strDamageType ~= "WWeapons_Res.wWeaponRes_SatchelCharge")
                                    {
                                        SC.KDLog.KillWeapon = 7001;
                                    }
                                    // End:0x8f4
                                    else
                                    {
                                        // End:0x841
                                        if(DamageType == class'wDamageMelee')
                                        {
                                            SC.KDLog.KillWeapon = 99999;
                                        }
                                        // End:0x8f4
                                        else
                                        {
                                            // End:0x86c
                                            if(DamageType == class'wDamageStepOn')
                                            {
                                                SC.KDLog.KillWeapon = 99998;
                                            }
                                            // End:0x8f4
                                            else
                                            {
                                                // End:0x8df
                                                if(Killer.Pawn != none && Killer.Pawn.Weapon != none)
                                                {
                                                    SC.KDLog.KillWeapon = Killer.Pawn.Weapon.BaseParams.iWeaponID;
                                                }
                                                // End:0x8f4
                                                else
                                                {
                                                    SC.KDLog.KillWeapon = 0;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        // End:0x969
        if(Killer.Pawn != none && Killer.Pawn.Weapon != none)
        {
            SC.KDLog.KillWeaponPart = Killer.Pawn.Weapon.Parts[0].PartsGroupID;
        }
        // End:0x97e
        else
        {
            SC.KDLog.KillWeaponPart = 0;
        }
        SC.KDLog.KillRange = int(VSize(Killer.Pawn.Location - Killed.Pawn.Location));
        SC.KDLog.KillBodyPart = byte(CollisionPart);
        // End:0xa2e
        if(Level.GRI.Teams[Killer.GetTeamNum()].IsUAVOn())
        {
            SC.KDLog.IsUAV = 1;
        }
        // End:0xa44
        else
        {
            SC.KDLog.IsUAV = 0;
        }
        SC.KDLog.CharDeathUID = Killed.PlayerReplicationInfo.GetUID();
        SC.KDLog.DeathXCoord = Killed.Pawn.Location.X;
        SC.KDLog.DeathYCoord = Killed.Pawn.Location.Y;
        SC.KDLog.DeathZCoord = Killed.Pawn.Location.Z;
        SC.KDLog.DeathPos = Killed.Pawn.GetPostureIndex();
    }
    // End:0xd06
    if(Killed != none && Killed.bIsPlayer && !DamageType.default.SkipDeathIncrement)
    {
        Killed.PlayerReplicationInfo.Deaths += float(1);
        Killed.PlayerReplicationInfo.NetUpdateTime = FMin(Killed.PlayerReplicationInfo.NetUpdateTime, Level.TimeSeconds + 0.30 * FRand());
        BroadcastDeathMessage(Killer, Killed, DamageType, CollisionPart, WeaponType);
        // End:0xc5a
        if(Killer == Killed || Killer == none)
        {
            // End:0xc2d
            if(Killer == none)
            {
                KillEvent("K", none, Killed.PlayerReplicationInfo, DamageType);
            }
            // End:0xc57
            else
            {
                KillEvent("K", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
            }
        }
        // End:0xd06
        else
        {
            // End:0xcdc
            if(bTeamGame && Killer.PlayerReplicationInfo != none && Killer.PlayerReplicationInfo.Team == Killed.PlayerReplicationInfo.Team)
            {
                KillEvent("TK", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
            }
            // End:0xd06
            else
            {
                KillEvent("K", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
            }
        }
    }
    // End:0x10ce
    if(Killed.IsA('wHelicopterController'))
    {
        // End:0x10ce
        if(Killer != none && kMM != none)
        {
            SC.KDLogSaved = true;
            SC.KDLog.CharKillUID = Killer.PlayerReplicationInfo.GetUID();
            SC.KDLog.KillXCoord = Killer.Pawn.Location.X;
            SC.KDLog.KillYCoord = Killer.Pawn.Location.Y;
            SC.KDLog.KillZCoord = Killer.Pawn.Location.Z;
            SC.KDLog.KillPos = Killer.Pawn.GetPostureIndex();
            SC.KDLog.KillWeapon = Killer.Pawn.Weapon.BaseParams.iWeaponID;
            SC.KDLog.KillWeaponPart = Killer.Pawn.Weapon.Parts[0].PartsGroupID;
            SC.KDLog.KillRange = int(VSize(Killer.Pawn.Location - Killed.Pawn.Location));
            SC.KDLog.KillBodyPart = byte(CollisionPart);
            SC.KDLog.DeathXCoord = Killed.Pawn.Location.X;
            SC.KDLog.DeathYCoord = Killed.Pawn.Location.Y;
            SC.KDLog.DeathZCoord = Killed.Pawn.Location.Z;
            iUID = Killer.PlayerReplicationInfo.GetUID();
            Log("[GameInfo::Killed::wHelicopterController] Killer Id=" $ Killer.PlayerReplicationInfo.PlayerName $ "/UID:" $ string(iUID));
            // End:0x106c
            if(Killed.IsA('wFlyingDefenceBotController'))
            {
                AllReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_KilledFlyingDefeceBot, Killer.PlayerReplicationInfo, Killer.PlayerReplicationInfo, DamageType);
            }
            // End:0x10a6
            else
            {
                AllReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_KilledHelicopter, Killer.PlayerReplicationInfo, Killer.PlayerReplicationInfo, DamageType);
            }
            // End:0x10ce
            if(iUID != -1)
            {
                SC.KDLogSaved = true;
                updateScore = true;
            }
        }
    }
    // End:0x11be
    if(Killer == none)
    {
        // End:0x114c
        if(DamageType == class'wDamageAirStrike' || strDamageType ~= "WWeapons_Res.wWeaponRes_Artillery" || strDamageType ~= "WWeapons_Res.wWeaponRes_PinpointBomb")
        {
        }
        // End:0x11b6
        else
        {
            // End:0x11b6
            if(DamageType == class'wDamageHelicopter' || strDamageType ~= "WWeapons_Res.wWeaponRes_HeliGun" || strDamageType ~= "WWeapons_Res.wWeaponRes_HeliRPG7")
            {
            }
        }
        updateScore = true;
    }
    // End:0x11f1
    if(DoProcessKillMessage(DamageType))
    {
        ProcessKillMessage(Killer, Killed, CollisionPart, WeaponType, iConKillorHeadShot, bWallShot);
    }
    // End:0x129f
    if(Killed.Pawn != none && DamageType != class'wDamageChangedHost')
    {
        Killed.Pawn.SpawnMedals();
        supplyID = Killed.Pawn.SpawnSupplyItem();
        // End:0x1270
        if(supplyID == 0)
        {
            SC.KDLog.IsDropItem = 0;
        }
        // End:0x129f
        else
        {
            SC.KDLog.IsDropItem = 1;
            SC.KDLog.DropItemID = supplyID;
        }
    }
    // End:0x1366
    if(updateScore)
    {
        ScoreKill(Killer, Killed);
        SendMessageAddScore(Killer, Killer, Killed, SC.KDLog.KillWeapon, iConKillorHeadShot);
        // End:0x1352
        if(Level.GetMatchMaker().kGame_GameMode == Level.GetMatchMaker().0)
        {
            // End:0x134f
            if(myTeamMM.My_iTeam != Killer.GetTeamNum())
            {
                PushDeathPos(Killer.Location);
            }
        }
        // End:0x1366
        else
        {
            PushDeathPos(Killer.Location);
        }
    }
    DiscardInventory(KilledPawn);
    NotifyKilled(Killer, Killed, KilledPawn);
    // End:0x1421
    if(bAllowVehicles && Level.NetMode == 0 && PlayerController(Killed) != none)
    {
        V = VehicleList;
        J0x13c7:
        // End:0x1421 [While If]
        if(V != none)
        {
            // End:0x140a
            if(Killed.GetTeamNum() == V.Team)
            {
                V.PlayerStartTime = 0.0;
            }
            V = V.NextVehicle;
            // This is an implied JumpToken; Continue!
            goto J0x13c7;
        }
    }
}

function bool PreventDeath(Pawn Killed, Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    // End:0x0d
    if(GameRulesModifiers == none)
    {
        return false;
    }
    return GameRulesModifiers.PreventDeath(Killed, Killer, DamageType, HitLocation);
}

function bool PreventSever(Pawn Killed, name BoneName, int Damage, class<DamageType> DamageType)
{
    // End:0x0d
    if(GameRulesModifiers == none)
    {
        return false;
    }
    return GameRulesModifiers.PreventSever(Killed, BoneName, Damage, DamageType);
}

function class<DamageType> GetWDamageType(class<DamageType> DamageType, int CollisionPart, int WeaponType, out int IsHeadShot, out int IsEnableAim)
{
    local Actor.CollisionPartsType MyCollisionPart;
    local Actor.eWeaponType MyWeaponType;

    MyCollisionPart = byte(CollisionPart);
    MyWeaponType = byte(WeaponType);
    // End:0x43
    if(MyCollisionPart == 1 && MyWeaponType != 13)
    {
        IsHeadShot = 1;
    }
    switch(MyWeaponType)
    {
        // End:0x4f
        case 1:
        // End:0x54
        case 2:
        // End:0x59
        case 3:
        // End:0x5e
        case 4:
        // End:0x63
        case 6:
        // End:0x68
        case 7:
        // End:0x77
        case 9:
            IsEnableAim = 1;
            // End:0x7a
            break;
        // End:0xffff
        default:
            switch(MyWeaponType)
            {
                // End:0x8c
                case 11:
                    return class'wDamageAirStrike';
                // End:0x97
                case 13:
                    return class'wDamageHelicopter';
                // End:0xffff
                default:
                    return DamageType;
            }
}

function BroadcastDeathMessage(Controller Killer, Controller Other, class<DamageType> DamageType, int CollisionPart, int WeaponType)
{
    local int TempSwitch, IsHeadShot, IsEnableAim, IsAimShot, IsPinPointKill;

    local class<DamageType> TempDamageType;

    TempDamageType = GetWDamageType(DamageType, CollisionPart, WeaponType, IsHeadShot, IsEnableAim);
    // End:0x5d
    if(Killer.PlayerReplicationInfo != none)
    {
        TempSwitch = Min(Killer.PlayerReplicationInfo.KillSuccession + 1, 16);
    }
    TempSwitch = TempSwitch << 1;
    IsAimShot = int(Killer.Pawn.bIsAiming);
    // End:0xa8
    if(IsEnableAim > 0)
    {
        TempSwitch = TempSwitch | IsAimShot;
    }
    TempSwitch = TempSwitch << 1;
    TempSwitch = TempSwitch | IsHeadShot;
    // End:0x101
    if(string(DamageType) ~= "WWeapons_Res.wWeaponRes_PinpointBomb")
    {
        IsPinPointKill = 1;
    }
    TempSwitch = TempSwitch | IsPinPointKill << 11;
    // End:0x160
    if(Killer.PlayerReplicationInfo != none)
    {
        BroadcastLocalized(self, DeathMessageClass, TempSwitch, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo, TempDamageType);
    }
    // End:0x193
    else
    {
        BroadcastLocalized(self, DeathMessageClass, TempSwitch, Killer.GetPRI(), Other.PlayerReplicationInfo, TempDamageType);
    }
}

// Export UGameInfo::execParseKillMessage(FFrame&, void* const)
native static function string ParseKillMessage(string KillerName, string VictimName, string DeathMessage);
function Kick(string S)
{
    // End:0x1f
    if(AccessControl != none)
    {
        AccessControl.Kick(S);
    }
}

function SessionKickBan(string S)
{
    // End:0x1f
    if(AccessControl != none)
    {
        AccessControl.SessionKickBan(S);
    }
}

function KickBan(string S)
{
    // End:0x1f
    if(AccessControl != none)
    {
        AccessControl.KickBan(S);
    }
}

function bool SameTeam(Controller A, Controller B);
function bool IsOnTeam(Controller Other, int TeamNum)
{
    local int OtherTeam;

    // End:0x46
    if(bTeamGame && Other != none)
    {
        OtherTeam = Other.GetTeamNum();
        // End:0x39
        if(OtherTeam == 255)
        {
            return false;
        }
        return OtherTeam == TeamNum;
    }
    return false;
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
    return true;
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, optional int iWeaponType)
{
    local int OriginalDamage;
    local Armor FirstArmor, NextArmor;

    OriginalDamage = Damage;
    // End:0x30
    if(injured.PhysicsVolume.bNeutralZone)
    {
        Damage = 0;
    }
    // End:0xf3
    else
    {
        // End:0x47
        if(injured.InGodMode())
        {
            return 0;
        }
        // End:0xf3
        else
        {
            // End:0xf3
            if(injured.Inventory != none && Damage > 0)
            {
                FirstArmor = injured.Inventory.PrioritizeArmor(Damage, DamageType, HitLocation);
                J0x95:
                // End:0xf3 [While If]
                if(FirstArmor != none && Damage > 0)
                {
                    NextArmor = FirstArmor.NextArmor;
                    Damage = FirstArmor.ArmorAbsorbDamage(Damage, DamageType, HitLocation);
                    FirstArmor = NextArmor;
                    // This is an implied JumpToken; Continue!
                    goto J0x95;
                }
            }
        }
    }
    // End:0x131
    if(GameRulesModifiers != none)
    {
        return GameRulesModifiers.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    return Damage;
}

function bool ShouldRespawn(Pickup Other)
{
    // End:0x1b
    if(Level.NetMode == 0)
    {
        return false;
    }
    return Other.RespawnTime != 0.0;
}

function bool PickupQuery(Pawn Other, Pickup Item)
{
    local byte bAllowPickup;

    // End:0x39
    if(GameRulesModifiers != none && GameRulesModifiers.OverridePickupQuery(Other, Item, bAllowPickup))
    {
        return bAllowPickup == 1;
    }
    // End:0x52
    if(Other.Inventory == none)
    {
        return true;
    }
    // End:0x72
    else
    {
        return !Other.Inventory.HandlePickupQuery(Item);
    }
}

function DiscardInventory(Pawn Other)
{
    Other.Weapon = none;
    Other.SelectedItem = none;
    J0x20:
    // End:0x4c [While If]
    if(Other.Inventory != none)
    {
        Other.Inventory.Destroy();
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
}

function ChangeName(Controller Other, coerce string S, bool bNameChange)
{
    local Controller C;

    Log("[GameInfo::ChangeName]");
    // End:0x53
    if(S == "")
    {
        Log("[GameInfo::ChangeName] no name, returns");
        return;
    }
    S = StripColor(S);
    Other.PlayerReplicationInfo.SetPlayerName(S);
    // End:0x119
    if(bNameChange)
    {
        C = Level.ControllerList;
        J0x9e:
        // End:0x119 [While If]
        if(C != none)
        {
            // End:0x102
            if(PlayerController(C) != none && Viewport(PlayerController(C).Player) != none)
            {
                PlayerController(C).ReceiveLocalizedMessage(class'GameMessage', 2, Other.PlayerReplicationInfo);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x9e;
        }
    }
}

event bool ForcedChangeTeam(Controller Other, int N, bool bNewTeam)
{
    return ChangeTeam(Other, N, bNewTeam);
}

function bool ChangeTeam(Controller Other, int N, bool bNewTeam)
{
    return true;
}

function byte PickTeam(byte Current, Controller C)
{
    return Current;
}

function SendPlayer(PlayerController aPlayer, string URL)
{
    aPlayer.ClientTravel(URL, 2, true);
}

function RestartGame()
{
    local string NextMap;
    local MapList MyList;

    // End:0x21
    if(GameRulesModifiers != none && GameRulesModifiers.HandleRestartGame())
    {
        return;
    }
    // End:0x2c
    if(bGameRestarted)
    {
        return;
    }
    bGameRestarted = true;
    // End:0x57
    if(VotingHandler != none && !VotingHandler.HandleRestartGame())
    {
        return;
    }
    // End:0x103
    if(bChangeLevels && !bAlreadyChanged && MapListType != "")
    {
        bAlreadyChanged = true;
        MyList = GetMapList(MapListType);
        // End:0xc0
        if(MyList != none)
        {
            NextMap = MyList.GetNextMap();
            MyList.Destroy();
        }
        // End:0xe0
        if(NextMap == "")
        {
            NextMap = GetMapName(MapPrefix, NextMap, 1);
        }
        // End:0x103
        if(NextMap != "")
        {
            Level.ServerTravel(NextMap, false);
            return;
        }
    }
    Level.ServerTravel("?Restart", false);
}

function array<string> GetMapRotation()
{
    // End:0x1b
    if(MaplistHandler != none)
    {
        return MaplistHandler.GetCurrentMapRotation();
    }
}

function MapList GetMapList(string MapListClassType)
{
    local class<MapList> MapListClass;

    // End:0x3b
    if(MapListClassType != "")
    {
        MapListClass = class<MapList>(DynamicLoadObject(MapListClassType, class'Class'));
        // End:0x3b
        if(MapListClass != none)
        {
            return Spawn(MapListClass);
        }
    }
    return none;
}

function ChangeVoiceChannel(PlayerReplicationInfo PRI, int NewChannelIndex, int OldChannelIndex);
event Broadcast(Actor Sender, coerce string Msg, optional name Type)
{
    BroadcastHandler.Broadcast(Sender, Msg, Type);
}

function BroadcastTeam(Controller Sender, coerce string Msg, optional name Type)
{
    BroadcastHandler.BroadcastTeam(Sender, Msg, Type);
}

event BroadcastLocalized(Actor Sender, class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    BroadcastHandler.AllowBroadcastLocalized(Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local Controller P;

    // End:0x2d
    if(GameRulesModifiers != none && !GameRulesModifiers.CheckEndGame(Winner, Reason))
    {
        return false;
    }
    P = Level.ControllerList;
    J0x41:
    // End:0x81 [While If]
    if(P != none)
    {
        P.ClientGameEnded();
        P.GameHasEnded();
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    return true;
}

event bool CheckEndGameCondition();
function EndGame(PlayerReplicationInfo Winner, string Reason)
{
    // End:0x1f
    if(!CheckEndGame(Winner, Reason))
    {
        bOverTime = true;
        return;
    }
    bGameEnded = true;
    TriggerEvent('EndGame', self, none);
    EndLogging(Reason);
}

function TieOnTimeOver()
{
    BroadcastLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_SuddenDeath);
    GameReplicationInfo.bStopCountDown = true;
}

function EndLogging(string Reason)
{
    // End:0x0d
    if(GameStats == none)
    {
        return;
    }
    GameStats.EndGame(Reason);
    GameStats.Destroy();
    GameStats = none;
}

function bool IsRespawnSpecialCase()
{
    return false;
}

function bool IsAnyPawnWithinRadius(NavigationPoint N)
{
    local int lp1;
    local float dist, PAWN_RADIUS;
    local Pawn P;

    PAWN_RADIUS = class'Pawn'.default.CollisionRadius;
    lp1 = 0;
    J0x1b:
    // End:0x8f [While If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        dist = VSize(P.Location - N.Location);
        // End:0x85
        if(dist < PAWN_RADIUS)
        {
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
    return false;
}

function bool IsRespawnPointFailedRecently(NavigationPoint S)
{
    // End:0x15
    if(PlayerStart(S) == none)
    {
        return false;
    }
    // End:0x49
    else
    {
        return Level.TimeSeconds - PlayerStart(S).LastSpawnFailTime < SC.default.RespawnFailDuration;
    }
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x1d
    if(N.Class == class'PlayerStart')
    {
        return true;
    }
    // End:0x1f
    else
    {
        return false;
    }
}

function NavigationPoint GetSafetestRespawnPoint(byte Team, array<NavigationPoint> starts, optional bool skipAppropriateCheck)
{
    local NavigationPoint S;
    local array<Actor> enemies;
    local array<NavigationPoint> candidates, candidates2;
    local array<float> candidateMinDists, candidateMinDists2;
    local NavigationPoint tempPoint;
    local int lp1, lp2, A, B;
    local float dist, minDist;
    local int MAX_TRY, SHUFFLE_COUNT, pickRandom;

    Log("[GameInfo::GetSafetestRespawnPoint]");
    // End:0x88
    if(bLeaveRespawnLogInChat)
    {
        Level.GetLocalPlayerController().myHUD.AddTextMessage("GetSafetestRespawnPoint", class'GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
    }
    MAX_TRY = 3;
    SHUFFLE_COUNT = 25;
    enemies = GetEveryEnemyList(Team);
    Log("  Num Enemies = " $ string(enemies.Length));
    lp1 = 0;
    J0xce:
    // End:0x192 [While If]
    if(lp1 < enemies.Length)
    {
        Log("    " $ Pawn(enemies[lp1]).OwnerName $ "(" $ string(enemies[lp1]) $ ")" $ " x=" $ string(enemies[lp1].Location.X) $ ", y=" $ string(enemies[lp1].Location.Y) $ ", z=" $ string(enemies[lp1].Location.Z));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xce;
    }
    lp1 = 0;
    J0x199:
    // End:0x2ac [While If]
    if(lp1 < starts.Length)
    {
        S = starts[lp1];
        // End:0x2a2
        if(skipAppropriateCheck || IsAppropriateRespawnPoint(S, Team))
        {
            minDist = 999999.0;
            lp2 = 0;
            J0x1ea:
            // End:0x24a [While If]
            if(lp2 < enemies.Length)
            {
                dist = VSize(enemies[lp2].Location - S.Location);
                // End:0x240
                if(minDist > dist)
                {
                    minDist = dist;
                }
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x1ea;
            }
            // End:0x27e
            if(!IsRespawnPointFailedRecently(S))
            {
                candidates[candidates.Length] = S;
                candidateMinDists[candidateMinDists.Length] = minDist;
            }
            candidates2[candidates2.Length] = S;
            candidateMinDists2[candidateMinDists2.Length] = minDist;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x199;
    }
    // End:0x312
    if(candidates.Length == 0)
    {
        Log("zero candidates! fall back to 2nd, candidates2.Length=" $ string(candidates2.Length));
        candidates = candidates2;
        candidateMinDists = candidateMinDists2;
    }
    Log("  Num Candidates = " $ string(candidates.Length));
    lp1 = 0;
    J0x33a:
    // End:0x413 [While If]
    if(lp1 < candidates.Length)
    {
        Log("    " $ string(lp1) $ ". name=" $ string(candidates[lp1].Name) $ " min dist=" $ string(candidateMinDists[lp1]) $ " x=" $ string(candidates[lp1].Location.X) $ ", y=" $ string(candidates[lp1].Location.Y) $ ", z=" $ string(candidates[lp1].Location.Z));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x33a;
    }
    Log("  Shuffle Candidates");
    lp1 = 0;
    J0x432:
    // End:0x4e8 [While If]
    if(lp1 < SHUFFLE_COUNT)
    {
        A = Rand(candidates.Length);
        B = Rand(candidates.Length);
        // End:0x4de
        if(A != B)
        {
            tempPoint = candidates[A];
            dist = candidateMinDists[A];
            candidates[A] = candidates[B];
            candidateMinDists[A] = candidateMinDists[B];
            candidates[B] = tempPoint;
            candidateMinDists[B] = dist;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x432;
    }
    lp1 = 0;
    J0x4ef:
    // End:0x5c8 [While If]
    if(lp1 < candidates.Length)
    {
        Log("    " $ string(lp1) $ ". name=" $ string(candidates[lp1].Name) $ " min dist=" $ string(candidateMinDists[lp1]) $ " x=" $ string(candidates[lp1].Location.X) $ ", y=" $ string(candidates[lp1].Location.Y) $ ", z=" $ string(candidates[lp1].Location.Z));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x4ef;
    }
    lp1 = 1;
    J0x5cf:
    // End:0x6a5 [While If]
    if(lp1 < candidates.Length)
    {
        tempPoint = candidates[lp1];
        dist = candidateMinDists[lp1];
        lp2 = lp1 - 1;
        J0x60f:
        // End:0x673 [While If]
        if(lp2 >= 0)
        {
            // End:0x666
            if(candidateMinDists[lp2] < dist)
            {
                candidateMinDists[lp2 + 1] = candidateMinDists[lp2];
                candidates[lp2 + 1] = candidates[lp2];
            }
            // End:0x669
            else
            {
                // This is an implied JumpToken;
                goto J0x673;
            }
            -- lp2;
            // This is an implied JumpToken; Continue!
            goto J0x60f;
        }
        J0x673:
        candidateMinDists[lp2 + 1] = dist;
        candidates[lp2 + 1] = tempPoint;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x5cf;
    }
    Log("  Sorted Candidates");
    lp1 = 0;
    J0x6c3:
    // End:0x79c [While If]
    if(lp1 < candidates.Length)
    {
        Log("    " $ string(lp1) $ ". name=" $ string(candidates[lp1].Name) $ " min-dist=" $ string(candidateMinDists[lp1]) $ " x=" $ string(candidates[lp1].Location.X) $ ", y=" $ string(candidates[lp1].Location.Y) $ ", z=" $ string(candidates[lp1].Location.Z));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x6c3;
    }
    lp1 = 0;
    J0x7a3:
    // End:0x803 [While If]
    if(lp1 < Min(candidates.Length, MAX_TRY))
    {
        // End:0x7e2
        if(IsSafeFromEnemySight(candidates[lp1], Team))
        {
            return candidates[lp1];
        }
        // End:0x7f9
        else
        {
            Log("  Skipped " $ string(lp1));
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7a3;
    }
    Log("  safety failed");
    pickRandom = Rand(Min(candidates.Length, MAX_TRY));
    Log("  Picked " $ string(pickRandom) $ " randomly");
    return candidates[pickRandom];
}

function array<Pawn> GetRecentlySpawnedAllyList()
{
    local array<Pawn> allies;

    return allies;
}

function array<Pawn> GetSafeAllyList(byte Team)
{
    local int lp1, lpEnemy;
    local Pawn ally;
    local array<Pawn> allies, safeAllies;
    local array<Actor> enemies;
    local float dist;
    local bool hasCloseEnemy;

    Log("[GameInfo::GetSafeAllyList] team=" $ string(Team));
    allies = GetEveryAllyList(Team);
    enemies = GetEveryEnemyList(Team);
    lp1 = 0;
    J0x57:
    // End:0x2ae [While If]
    if(lp1 < allies.Length)
    {
        ally = allies[lp1];
        Log("  " $ ally.OwnerName $ " LastDamageDealtTime=" $ string(ally.LastDamageDealtTime) $ " LastDamageReceiveTime=" $ string(ally.LastDamageReceiveTime));
        // End:0x292
        if(Level.TimeSeconds - ally.LastDamageDealtTime > SC.default.SafeSpawn_DAMAGE_DEAL_TIME && Level.TimeSeconds - ally.LastDamageReceiveTime > SC.default.SafeSpawn_DAMAGE_RECEIVE_TIME)
        {
            hasCloseEnemy = false;
            lpEnemy = 0;
            J0x159:
            // End:0x251 [While If]
            if(lpEnemy < enemies.Length)
            {
                dist = VSize(ally.Location - enemies[lpEnemy].Location);
                // End:0x247
                if(dist < SC.default.SafeSpawn_DISABLE_DISTANCE)
                {
                    // End:0x209
                    if(enemies[lpEnemy].IsA('Pawn'))
                    {
                        Log("  " $ Pawn(enemies[lpEnemy]).OwnerName @ "is to close dist=" $ string(dist));
                    }
                    // End:0x23c
                    else
                    {
                        Log("  " $ string(enemies[lpEnemy]) @ "is to close dist=" $ string(dist));
                    }
                    hasCloseEnemy = true;
                }
                // End:0x251
                else
                {
                    ++ lpEnemy;
                    // This is an implied JumpToken; Continue!
                    goto J0x159;
                }
            }
            // End:0x26f
            if(hasCloseEnemy)
            {
                Log("    not picked");
            }
            // End:0x28f
            else
            {
                safeAllies[safeAllies.Length] = ally;
                Log("    picked");
            }
        }
        // End:0x2a4
        else
        {
            Log("    not picked");
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    return safeAllies;
}

function bool IsAnyAllyAlive(byte Team)
{
    local Controller C;

    Log("[GameInfo::IsAnyAllyAlive] team=" $ string(Team));
    C = Level.ControllerList;
    J0x41:
    // End:0x109 [While If]
    if(C != none)
    {
        // End:0xf2
        if(C.Pawn != none && !C.Pawn.IsInState('Dying') && C.Pawn.PlayerReplicationInfo != none)
        {
            // End:0xf2
            if(C.Pawn.GetTeamNum() == Team)
            {
                Log("  " $ C.Pawn.OwnerName $ " is alive");
                return true;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    Log("  no ally is alive");
    return false;
}

function array<Pawn> GetEveryAllyList(byte Team)
{
    local int lp1;
    local Pawn P;
    local array<Pawn> allies;

    lp1 = 0;
    J0x07:
    // End:0xaa [While If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0xa0
        if(P != none && !P.IsInState('Dying') && P.PlayerReplicationInfo != none)
        {
            // End:0xa0
            if(P.GetTeamNum() == Team)
            {
                allies[allies.Length] = P;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return allies;
}

function UpdatePositionLog()
{
    local int lp1;
    local Pawn P;
    local Vector vMoveDir;

    lp1 = 0;
    J0x07:
    // End:0x7b8 [While If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0x7ae
        if(P != none && !P.IsInState('Dying') && P.PlayerReplicationInfo != none)
        {
            vMoveDir = P.Location - P.PrevLocation;
            vMoveDir.Z = 0.0;
            vMoveDir = Normal(vMoveDir);
            // End:0x55b
            if(vMoveDir == P.PrevMoveDir)
            {
                // End:0x558
                if(VSize(P.Acceleration) == 0.0)
                {
                    // End:0x312
                    if(P.PrevLocation != P.Location)
                    {
                        CombatLog("[MOVING_EVENT] CurTime=" $ string(Level.GetLocalPlayerController().myHUD.GetCurGameTime()) $ " UserName=" $ P.PlayerReplicationInfo.PlayerName $ " TeamIndex=" $ string(P.PlayerReplicationInfo.SideID) $ " WeaponID=" $ string(P.Weapon.BaseParams.iWeaponID) $ " PosX=" $ string(P.Location.X) $ " PosY=" $ string(P.Location.Y) $ " PosZ=" $ string(P.Location.Z) $ " PrevTime=" $ string(P.PrevTime) $ " PrevPosX=" $ string(P.PrevInterpoLocation.X) $ " PrevPosY=" $ string(P.PrevInterpoLocation.Y) $ " PrevPosZ=" $ string(P.PrevInterpoLocation.Z));
                        P.PrevInterpoLocation = P.Location;
                        P.PrevTime = Level.GetLocalPlayerController().myHUD.GetCurGameTime();
                    }
                    // End:0x558
                    else
                    {
                        // End:0x558
                        if(float(P.PrevTime - Level.GetLocalPlayerController().myHUD.GetCurGameTime()) > 10.0)
                        {
                            CombatLog("[MOVING_EVENT] CurTime=" $ string(Level.GetLocalPlayerController().myHUD.GetCurGameTime()) $ " UserName=" $ P.PlayerReplicationInfo.PlayerName $ " TeamIndex=" $ string(P.PlayerReplicationInfo.SideID) $ " WeaponID=" $ string(P.Weapon.BaseParams.iWeaponID) $ " PosX=" $ string(P.Location.X) $ " PosY=" $ string(P.Location.Y) $ " PosZ=" $ string(P.Location.Z) $ " PrevTime=" $ string(P.PrevTime) $ " PrevPosX=" $ string(P.PrevInterpoLocation.X) $ " PrevPosY=" $ string(P.PrevInterpoLocation.Y) $ " PrevPosZ=" $ string(P.PrevInterpoLocation.Z));
                            P.PrevInterpoLocation = P.Location;
                            P.PrevTime = Level.GetLocalPlayerController().myHUD.GetCurGameTime();
                        }
                    }
                }
            }
            // End:0x77d
            else
            {
                // End:0x77d
                if(VSize(P.Acceleration) > 0.0)
                {
                    CombatLog("[MOVING_EVENT] CurTime=" $ string(Level.GetLocalPlayerController().myHUD.GetCurGameTime()) $ " UserName=" $ P.PlayerReplicationInfo.PlayerName $ " TeamIndex=" $ string(P.PlayerReplicationInfo.SideID) $ " WeaponID=" $ string(P.Weapon.BaseParams.iWeaponID) $ " PosX=" $ string(P.Location.X) $ " PosY=" $ string(P.Location.Y) $ " PosZ=" $ string(P.Location.Z) $ " PrevTime=" $ string(P.PrevTime) $ " PrevPosX=" $ string(P.PrevInterpoLocation.X) $ " PrevPosY=" $ string(P.PrevInterpoLocation.Y) $ " PrevPosZ=" $ string(P.PrevInterpoLocation.Z));
                    P.PrevInterpoLocation = P.Location;
                    P.PrevTime = Level.GetLocalPlayerController().myHUD.GetCurGameTime();
                }
            }
            P.PrevLocation = P.Location;
            P.PrevMoveDir = vMoveDir;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function array<Actor> GetEveryEnemyList(byte myTeam)
{
    local int lp1;
    local Pawn P;
    local array<Actor> enemies;

    lp1 = 0;
    J0x07:
    // End:0xaa [While If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0xa0
        if(P != none && !P.IsInState('Dying') && P.PlayerReplicationInfo != none)
        {
            // End:0xa0
            if(P.GetTeamNum() != myTeam)
            {
                enemies[enemies.Length] = P;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return enemies;
}

function array<Actor> GetEveryEnemyList2(byte myTeam)
{
    local int lp1, lp2;
    local Pawn P;
    local array<Actor> enemies;
    local Actor tmp;

    lp1 = 0;
    J0x07:
    // End:0xd3 [While If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0xc9
        if(P != none && P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.IsDead != true)
        {
            // End:0x9c
            if(P.PlayerReplicationInfo.IsInvulnerable == true)
            {
            }
            // End:0xc9
            else
            {
                // End:0xc9
                if(P.GetTeamNum() != myTeam)
                {
                    enemies[enemies.Length] = P;
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    lp1 = 0;
    J0xda:
    // End:0x1a1 [While If]
    if(lp1 < enemies.Length - 1)
    {
        lp2 = lp1 + 1;
        J0xfb:
        // End:0x197 [While If]
        if(lp2 < enemies.Length)
        {
            // End:0x18d
            if(Pawn(enemies[lp1]).PlayerReplicationInfo.KillSuccession < Pawn(enemies[lp2]).PlayerReplicationInfo.KillSuccession)
            {
                tmp = enemies[lp1];
                enemies[lp1] = enemies[lp2];
                enemies[lp2] = tmp;
            }
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0xfb;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xda;
    }
    return enemies;
}

function array<Actor> GetPersonalEnemyList(Pawn myPawn)
{
    local int lp1;
    local Pawn P;
    local array<Actor> enemies;

    lp1 = 0;
    J0x07:
    // End:0xca [While If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0xc0
        if(P != none && P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.IsDead != true)
        {
            // End:0xc0
            if(P.PlayerReplicationInfo.PlayerID != myPawn.PlayerReplicationInfo.PlayerID)
            {
                enemies[enemies.Length] = P;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return enemies;
}

function Pawn PickAlly(byte Team)
{
    local array<Pawn> recentlySpawnedAllyList, safeAllyList, allyList;
    local Pawn pickedAlly;

    Log("[GameInfo::PickAlly] team=" $ string(Team));
    recentlySpawnedAllyList = GetRecentlySpawnedAllyList();
    // End:0x56
    if(recentlySpawnedAllyList.Length > 0)
    {
        pickedAlly = recentlySpawnedAllyList[Rand(recentlySpawnedAllyList.Length)];
    }
    // End:0x13e
    else
    {
        Log("  do not have recenlty spawned ally");
        safeAllyList = GetSafeAllyList(Team);
        // End:0xd8
        if(safeAllyList.Length > 0)
        {
            Log("  picking randomly from safe allies");
            pickedAlly = safeAllyList[Rand(safeAllyList.Length)];
        }
        // End:0x13e
        else
        {
            Log("  NSA: no safe allies");
            Log("  picking randomly from enemy allies");
            allyList = GetEveryAllyList(Team);
            pickedAlly = allyList[Rand(allyList.Length)];
        }
    }
    Log("  picked " $ pickedAlly.OwnerName);
    // End:0x1c1
    if(bLeaveRespawnLogInChat)
    {
        Level.GetLocalPlayerController().myHUD.AddTextMessage("Picked Ally=" $ pickedAlly.OwnerName, class'GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
    }
    return pickedAlly;
}

function bool IsSafeFromEnemySight(NavigationPoint N, byte Team)
{
    local int lp1;
    local array<Actor> enemies;
    local Vector Foot, crouch, stand, enemyFoot, enemyCrouch, enemyStand;

    Log("[GameInfo::IsSafeFromEnemySight] team=" $ string(Team));
    Log("  PointName=" $ string(N.Name) $ " x=" $ string(N.Location.X) $ " y=" $ string(N.Location.Y) $ " z=" $ string(N.Location.Z));
    enemies = GetEveryEnemyList(Team);
    Foot = N.Location;
    crouch = Foot;
    crouch.Z += class'Pawn'.default.CrouchHeight;
    stand = Foot;
    stand.Z += class'Pawn'.default.EyeHeight;
    lp1 = 0;
    J0x125:
    // End:0x26d [While If]
    if(lp1 < enemies.Length)
    {
        enemyFoot = enemies[lp1].Location;
        // End:0x1d2
        if(enemies[lp1].IsA('Pawn'))
        {
            Log("  Enemy " $ Pawn(enemies[lp1]).OwnerName $ " at x=" $ string(enemyFoot.X) $ " y=" $ string(enemyFoot.Y) $ " z=" $ string(enemyFoot.Z));
        }
        enemyCrouch = enemyFoot;
        enemyCrouch.Z += class'Pawn'.default.CrouchHeight;
        enemyStand = enemyFoot;
        enemyStand.Z += class'Pawn'.default.EyeHeight;
        // End:0x259
        if(FastTrace(stand, enemyStand) && FastTrace(crouch, enemyCrouch))
        {
            Log("    i can see it!!");
            return false;
        }
        // End:0x263
        else
        {
            Log("    ok");
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x125;
    }
    return true;
}

function SortNavigationPoints(Actor center, out array<NavigationPoint> candidates, out array<float> candidateDists)
{
    SortNavigationPoints2(center.Location, candidates, candidateDists);
}

function SortNavigationPoints2(Vector centerLoc, out array<NavigationPoint> candidates, out array<float> candidateDists)
{
    local int lp1, lp2;
    local float dist;
    local NavigationPoint N;

    Log("[GameInfo::SortNavigationPoints]");
    candidateDists.Length = 0;
    lp1 = 0;
    J0x33:
    // End:0x82 [While If]
    if(lp1 < candidates.Length)
    {
        dist = VSize(centerLoc - candidates[lp1].Location);
        candidateDists[candidateDists.Length] = dist;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x33;
    }
    lp1 = 1;
    J0x89:
    // End:0x15f [While If]
    if(lp1 < candidates.Length)
    {
        N = candidates[lp1];
        dist = candidateDists[lp1];
        lp2 = lp1 - 1;
        J0xc9:
        // End:0x12d [While If]
        if(lp2 >= 0)
        {
            // End:0x120
            if(candidateDists[lp2] > dist)
            {
                candidateDists[lp2 + 1] = candidateDists[lp2];
                candidates[lp2 + 1] = candidates[lp2];
            }
            // End:0x123
            else
            {
                // This is an implied JumpToken;
                goto J0x12d;
            }
            -- lp2;
            // This is an implied JumpToken; Continue!
            goto J0xc9;
        }
        J0x12d:
        candidates[lp2 + 1] = N;
        candidateDists[lp2 + 1] = dist;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x89;
    }
    Log("  sorted candidates");
    lp1 = 0;
    J0x17d:
    // End:0x1d5 [While If]
    if(lp1 < candidates.Length)
    {
        Log("    name=" $ string(candidates[lp1].Name) $ " dist=" $ string(candidateDists[lp1]));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x17d;
    }
}

function array<NavigationPoint> GetRespawnPointsSortedByClosenessTo(Actor A, byte Team, int Count)
{
    local array<NavigationPoint> candidates, returnList;
    local array<float> candidateDists;
    local PlayerStart S;
    local Pawn P;
    local int lp1;

    Log("[GameInfo::GetRespawnPointsSortedByClosenessTo]");
    P = Pawn(A);
    // End:0xc8
    if(P != none)
    {
        Log("  Ally Name=" $ P.OwnerName $ " x=" $ string(P.Location.X) $ " y=" $ string(P.Location.Y) $ " z=" $ string(P.Location.Z));
    }
    Log("  creating candidates");
    lp1 = 0;
    J0xe8:
    // End:0x14a [While If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        S = EveryPlayerStarts[lp1];
        // End:0x140
        if(IsAppropriateRespawnPoint(S, Team) && !IsRespawnPointFailedRecently(S))
        {
            candidates[candidates.Length] = S;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xe8;
    }
    SortNavigationPoints(A, candidates, candidateDists);
    Log("  returning");
    lp1 = 0;
    J0x175:
    // End:0x1ec [While If]
    if(lp1 < Min(candidates.Length, Count))
    {
        returnList[returnList.Length] = candidates[lp1];
        Log("    name=" $ string(candidates[lp1].Name) $ " dist=" $ string(candidateDists[lp1]));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x175;
    }
    return returnList;
}

function NavigationPoint GetRespawnPointRatingEnemy(bool giveNearnessScore, array<NavigationPoint> respawnCandidates, byte Team)
{
    local float DISABLE_DISTANCE;
    local int MAX_SAFE_CHECK, lpCandidate, lpEnemy, lp1, lp2;

    local float Distance, closestDistance;
    local int checkLeft;
    local NavigationPoint tempPoint;
    local float tempScore;
    local byte tempEnable;
    local int SHUFFLE_COUNT, A, B;
    local array<float> respawnCandidateScores;
    local array<byte> respawnCandidateEnabled;
    local array<Actor> enemyList;

    DISABLE_DISTANCE = 2000.0;
    MAX_SAFE_CHECK = 3;
    Log("[GameInfo::GetRespawnPointRatingEnemy]");
    // End:0x109
    if(giveNearnessScore)
    {
        Log("  giving scores by closeness to the ally/flag");
        lp1 = 0;
        J0x7e:
        // End:0x106 [While If]
        if(lp1 < respawnCandidates.Length)
        {
            respawnCandidateScores[lp1] = float(int(Round(float(lp1) / float(2)))) / float(10);
            respawnCandidateEnabled[lp1] = 1;
            Log("    " $ string(respawnCandidates[lp1].Name) $ " score=" $ string(respawnCandidateScores[lp1]));
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x7e;
        }
    }
    // End:0x149
    else
    {
        lp1 = 0;
        J0x110:
        // End:0x149 [While If]
        if(lp1 < respawnCandidates.Length)
        {
            respawnCandidateScores[lp1] = 0.0;
            respawnCandidateEnabled[lp1] = 1;
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x110;
        }
    }
    enemyList = GetEveryEnemyList(Team);
    Log("  giving scores by distance to closest enemy");
    lpCandidate = 0;
    J0x191:
    // End:0x335 [While If]
    if(lpCandidate < respawnCandidates.Length)
    {
        closestDistance = 99999.0;
        lpEnemy = 0;
        J0x1b3:
        // End:0x22b [While If]
        if(lpEnemy < enemyList.Length)
        {
            Distance = VSize(respawnCandidates[lpCandidate].Location - enemyList[lpEnemy].Location);
            // End:0x20f
            if(closestDistance > Distance)
            {
                closestDistance = Distance;
            }
            // End:0x221
            if(Distance < DISABLE_DISTANCE)
            {
            }
            // End:0x22b
            else
            {
                ++ lpEnemy;
                // This is an implied JumpToken; Continue!
                goto J0x1b3;
            }
        }
        Log("    name=" $ string(respawnCandidates[lpCandidate].Name) $ " closest enemy at " $ string(closestDistance));
        // End:0x2a1
        if(closestDistance < DISABLE_DISTANCE)
        {
            respawnCandidateEnabled[lpCandidate] = 0;
            Log("      disabled");
        }
        // End:0x30c
        else
        {
            // End:0x2c6
            if(closestDistance < float(1700))
            {
                respawnCandidateScores[lpCandidate] += float(3);
            }
            // End:0x30c
            else
            {
                // End:0x2eb
                if(closestDistance < float(2600))
                {
                    respawnCandidateScores[lpCandidate] += float(2);
                }
                // End:0x30c
                else
                {
                    // End:0x30c
                    if(closestDistance < float(3500))
                    {
                        respawnCandidateScores[lpCandidate] += float(1);
                    }
                }
            }
        }
        Log("      score=" $ string(respawnCandidateScores[lpCandidate]));
        ++ lpCandidate;
        // This is an implied JumpToken; Continue!
        goto J0x191;
    }
    SHUFFLE_COUNT = 25;
    lp1 = 0;
    J0x344:
    // End:0x433 [While If]
    if(lp1 < SHUFFLE_COUNT)
    {
        A = Rand(respawnCandidateScores.Length);
        B = Rand(respawnCandidateScores.Length);
        // End:0x429
        if(A != B)
        {
            tempScore = respawnCandidateScores[A];
            tempPoint = respawnCandidates[A];
            tempEnable = respawnCandidateEnabled[A];
            respawnCandidateScores[A] = respawnCandidateScores[B];
            respawnCandidates[A] = respawnCandidates[B];
            respawnCandidateEnabled[A] = respawnCandidateEnabled[B];
            respawnCandidateScores[B] = tempScore;
            respawnCandidates[B] = tempPoint;
            respawnCandidateEnabled[B] = tempEnable;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x344;
    }
    Log("  shuffled");
    lp1 = 0;
    J0x448:
    // End:0x4cc [While If]
    if(lp1 < respawnCandidates.Length)
    {
        Log("    " $ string(lp1) $ " - name=" $ string(respawnCandidates[lp1].Name) $ " score=" $ string(respawnCandidateScores[lp1]) $ " enable=" $ string(respawnCandidateEnabled[lp1]));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x448;
    }
    lp1 = 1;
    J0x4d3:
    // End:0x5e8 [While If]
    if(lp1 < respawnCandidateScores.Length)
    {
        tempScore = respawnCandidateScores[lp1];
        tempPoint = respawnCandidates[lp1];
        tempEnable = respawnCandidateEnabled[lp1];
        lp2 = lp1 - 1;
        J0x524:
        // End:0x5a2 [While If]
        if(lp2 >= 0)
        {
            // End:0x595
            if(tempScore < respawnCandidateScores[lp2])
            {
                respawnCandidateScores[lp2 + 1] = respawnCandidateScores[lp2];
                respawnCandidates[lp2 + 1] = respawnCandidates[lp2];
                respawnCandidateEnabled[lp2 + 1] = respawnCandidateEnabled[lp2];
            }
            // End:0x598
            else
            {
                // This is an implied JumpToken;
                goto J0x5a2;
            }
            -- lp2;
            // This is an implied JumpToken; Continue!
            goto J0x524;
        }
        J0x5a2:
        respawnCandidateScores[lp2 + 1] = tempScore;
        respawnCandidates[lp2 + 1] = tempPoint;
        respawnCandidateEnabled[lp2 + 1] = tempEnable;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x4d3;
    }
    Log("  sorted");
    lp1 = 0;
    J0x5fb:
    // End:0x67f [While If]
    if(lp1 < respawnCandidates.Length)
    {
        Log("    " $ string(lp1) $ " - name=" $ string(respawnCandidates[lp1].Name) $ " score=" $ string(respawnCandidateScores[lp1]) $ " enable=" $ string(respawnCandidateEnabled[lp1]));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x5fb;
    }
    Log("  checking safety");
    checkLeft = MAX_SAFE_CHECK;
    lpCandidate = 0;
    J0x6a6:
    // End:0x7c9 [While If]
    if(lpCandidate < respawnCandidates.Length)
    {
        Log("    " $ string(lpCandidate) $ " name=" $ string(respawnCandidates[lpCandidate].Name));
        // End:0x7b1
        if(respawnCandidateEnabled[lpCandidate] == 1)
        {
            // End:0x798
            if(IsSafeFromEnemySight(respawnCandidates[lpCandidate], Team))
            {
                Log("      return this");
                // End:0x789
                if(bLeaveRespawnLogInChat)
                {
                    Level.GetLocalPlayerController().myHUD.AddTextMessage("Score=" $ string(respawnCandidateScores[lpCandidate]), class'GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
                }
                return respawnCandidates[lpCandidate];
            }
            // End:0x7b1
            else
            {
                Log("      not safe");
                -- checkLeft;
            }
        }
        // End:0x7bf
        if(checkLeft == 0)
        {
        }
        // End:0x7c9
        else
        {
            ++ lpCandidate;
            // This is an implied JumpToken; Continue!
            goto J0x6a6;
        }
    }
    return none;
}

function LogFinalRespawnPoint(NavigationPoint respawnPoint, byte Team)
{
    local array<Actor> enemies;
    local int lp1;
    local float minDist, dist;
    local Pawn Pawn;

    enemies = GetEveryEnemyList(Team);
    Log("  distance to enemies");
    minDist = 99999.0;
    lp1 = 0;
    J0x3c:
    // End:0x209 [While If]
    if(lp1 < enemies.Length)
    {
        dist = VSize(respawnPoint.Location - enemies[lp1].Location);
        // End:0xa8
        if(minDist > dist)
        {
            minDist = dist;
            Pawn = Pawn(enemies[lp1]);
        }
        // End:0x168
        if(enemies[lp1].IsA('Pawn'))
        {
            Log("    name=" $ Pawn(enemies[lp1]).OwnerName @ "dist=" $ string(dist) @ "x=" $ string(enemies[lp1].Location.X) @ "y=" $ string(enemies[lp1].Location.Y) @ "z=" $ string(enemies[lp1].Location.Z));
        }
        // End:0x1ff
        else
        {
            Log("    name=" $ string(enemies[lp1]) @ "dist=" $ string(dist) @ "x=" $ string(enemies[lp1].Location.X) @ "y=" $ string(enemies[lp1].Location.Y) @ "z=" $ string(enemies[lp1].Location.Z));
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    // End:0x287
    if(bLeaveRespawnLogInChat)
    {
        Level.GetLocalPlayerController().myHUD.AddTextMessage("Closeset Enemy=" $ Pawn.OwnerName @ "at dist=" $ string(minDist), class'GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
    }
    Log("  @@@final decision - name=" $ string(respawnPoint.Name) $ " at x=" $ string(respawnPoint.Location.X) $ " y=" $ string(respawnPoint.Location.Y) $ " z=" $ string(respawnPoint.Location.Z));
    Log("@-------------------");
}

function NavigationPoint FindPlayerStart_SD(byte Team)
{
    local PlayerStart_SD S;
    local int Len, lp1;
    local NavigationPoint N, respawn;
    local byte Type;
    local array<PlayerStart_SD> candidates;

    Log("[GameInfo::FindPlayerStart_SD] Team=" $ string(Team));
    Len = EverySDPlayerStarts.Length;
    // End:0xcc
    if(EverySDPlayerStarts.Length == 0)
    {
        Log("EverySDPlayerStarts.length == 0");
        // End:0xbc
        if(EveryPlayerStarts.Length == 0)
        {
            Log("EveryPlayerStarts.length == 0");
            // End:0xb8
            foreach AllActors(class'NavigationPoint', N)
            {
                respawn = N;
                // End:0xb8
                break;                                
            }
        }
        // End:0xc9
        else
        {
            respawn = EveryPlayerStarts[0];
        }
    }
    // End:0x254
    else
    {
        lp1 = 0;
        J0xd3:
        // End:0x15b [While If]
        if(lp1 < EverySDPlayerStarts.Length)
        {
            S = EverySDPlayerStarts[lp1];
            Type = S.eTeamType;
            // End:0x151
            if(Type == Team && !IsRespawnPointFailedRecently(S) && !IsAnyPawnWithinRadius(S))
            {
                candidates[candidates.Length] = S;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0xd3;
        }
        Log("length=" $ string(candidates.Length));
        // End:0x17f
        if(candidates.Length == 0)
        {
        }
        // End:0x1e2
        else
        {
            S = candidates[Rand(candidates.Length)];
            Log("trying" @ string(S.Name) @ "type=" $ string(GetEnum(enum'ESpawnTeam', S.eTeamType)));
            respawn = S;
        }
        // End:0x254
        if(respawn == none)
        {
            lp1 = 0;
            J0x1f4:
            // End:0x254 [While If]
            if(lp1 < EverySDPlayerStarts.Length)
            {
                S = EverySDPlayerStarts[lp1];
                Type = S.eTeamType;
                // End:0x24a
                if(Type == Team)
                {
                    respawn = S;
                }
                // End:0x254
                else
                {
                    ++ lp1;
                    // This is an implied JumpToken; Continue!
                    goto J0x1f4;
                }
            }
        }
    }
    LogFinalRespawnPoint(respawn, Team);
    return respawn;
}

function LogNavigationPoints(array<NavigationPoint> ns)
{
    local int lp1;
    local PlayerStart S;

    Log("[LogNavigationPoints] at " $ string(Level.TimeSeconds));
    lp1 = 0;
    J0x36:
    // End:0xaf [While If]
    if(lp1 < ns.Length)
    {
        S = PlayerStart(ns[lp1]);
        Log("    class=" $ string(S.Class) $ " lastSpawnFailTime=" $ string(S.LastSpawnFailTime));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
}

event bool IsSDRespawnTime()
{
    return float(GameReplicationInfo.ElapsedTime) < SDRespawnTime || Level.GetMatchMaker().BeginnerMode || Level.GetMatchMaker().IsSDRespawn();
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint N, BestStart;
    local Teleporter Tel;
    local float BestRating, NewRating;
    local byte Team;
    local Pawn pickedAlly;
    local NavigationPoint respawnPoint;

    Log("@-------------------");
    // End:0x95
    if(Player != none)
    {
        Log("[GameInfo::FindPlayerStart] at " $ string(Level.TimeSeconds) $ " for " $ Player.PlayerReplicationInfo.PlayerName @ "or" @ string(Player.Name));
    }
    // End:0xde
    else
    {
        Log("[GameInfo::FindPlayerStart] at " $ string(Level.TimeSeconds) $ " for Player=none");
    }
    // End:0x167
    if(Player != none && Player.StartSpot != none && Level.NetMode == 0 && bWaitingToStartMatch || Player.PlayerReplicationInfo != none && Player.PlayerReplicationInfo.bWaitingPlayer)
    {
        return Player.StartSpot;
    }
    // End:0x1a7
    if(GameRulesModifiers != none)
    {
        N = GameRulesModifiers.FindPlayerStart(Player, inTeam, incomingName);
        // End:0x1a7
        if(N != none)
        {
            return N;
        }
    }
    // End:0x1e6
    if(incomingName != "")
    {
        // End:0x1e5
        foreach AllActors(class'Teleporter', Tel)
        {
            // End:0x1e4
            if(string(Tel.Tag) ~= incomingName)
            {
                break;
                return Tel;
            }                        
        }
    }
    // End:0x25d
    if(Player != none && Player.PlayerReplicationInfo != none)
    {
        // End:0x24f
        if(Player.PlayerReplicationInfo.Team != none)
        {
            Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);
        }
        // End:0x25a
        else
        {
            Team = inTeam;
        }
    }
    // End:0x268
    else
    {
        Team = inTeam;
    }
    // End:0x27e
    if(Team == 255)
    {
        Team = 0;
    }
    // End:0x3fa
    if(Level.GetMatchMaker().TR_bNewRespawn)
    {
        bLeaveRespawnLogInChat = bLeaveRespawnLogInChatReal && Player == Level.GetLocalPlayerController();
        // End:0x2da
        if(IsSDRespawnTime())
        {
            return FindPlayerStart_SD(Team);
        }
        // End:0x3f7
        else
        {
            // End:0x2fc
            if(IsRespawnSpecialCase())
            {
                respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
            }
            // End:0x39d
            else
            {
                // End:0x387
                if(IsAnyAllyAlive(Team))
                {
                    pickedAlly = PickAlly(Team);
                    respawnPoint = GetRespawnPointRatingEnemy(true, GetRespawnPointsSortedByClosenessTo(pickedAlly, Team, 5), Team);
                    // End:0x384
                    if(respawnPoint == none)
                    {
                        Log("  RNAF: respawn near ally failed");
                        respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
                    }
                }
                // End:0x39d
                else
                {
                    respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
                }
            }
            // End:0x3e1
            if(respawnPoint == none)
            {
                Log("!!!ACHTUNG!!!! NO RESPAWN POINT!");
                // End:0x3e0
                foreach AllActors(class'NavigationPoint', respawnPoint)
                {
                    // End:0x3e0
                    break;                                        
                }
            }
            LogFinalRespawnPoint(respawnPoint, Team);
            return respawnPoint;
        }
    }
    // End:0x57e
    else
    {
        N = Level.NavigationPointList;
        J0x40e:
        // End:0x470 [While If]
        if(N != none)
        {
            NewRating = RatePlayerStart(N, Team, Player);
            // End:0x459
            if(NewRating > BestRating)
            {
                BestRating = NewRating;
                BestStart = N;
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x40e;
        }
        // End:0x578
        if(BestStart == none || PlayerStart(BestStart) == none && Player != none && Player.bIsPlayer)
        {
            Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
            BestRating = -100000000.0;
            // End:0x577
            foreach AllActors(class'NavigationPoint', N)
            {
                NewRating = RatePlayerStart(N, 0, Player);
                // End:0x542
                if(InventorySpot(N) != none)
                {
                    NewRating -= float(50);
                }
                NewRating += float(20) * FRand();
                // End:0x576
                if(NewRating > BestRating)
                {
                    BestRating = NewRating;
                    BestStart = N;
                }                                
            }
        }
        return BestStart;
    }
}

function NavigationPoint FindPlayerStart_TU(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint respawnPoint;

    return respawnPoint;
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart P;

    P = PlayerStart(N);
    // End:0x51
    if(P != none)
    {
        // End:0x4b
        if(P.bSinglePlayerStart)
        {
            // End:0x45
            if(P.bEnabled)
            {
                return 1000.0;
            }
            return 20.0;
        }
        return 10.0;
    }
    return 0.0;
}

function CheckScore(PlayerReplicationInfo Scorer)
{
    // End:0x26
    if(GameRulesModifiers != none && GameRulesModifiers.CheckScore(Scorer))
    {
        return;
    }
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
    // End:0x29
    if(GameStats != none)
    {
        GameStats.ScoreEvent(Who, Points, Desc);
    }
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
    // End:0x29
    if(GameStats != none)
    {
        GameStats.TeamScoreEvent(Team, Points, Desc);
    }
}

function ScoreObjective(PlayerReplicationInfo Scorer, float Score)
{
    // End:0x20
    if(Scorer != none)
    {
        Scorer.Score += Score;
    }
    // End:0x46
    if(GameRulesModifiers != none)
    {
        GameRulesModifiers.ScoreObjective(Scorer, int(Score));
    }
    CheckScore(Scorer);
}

function float GetAddScore(Controller Killer, Controller Other)
{
    // End:0x1d
    if(Other.IsA('wHelicopterController'))
    {
        return GameAddScore_KillHeli;
    }
    // End:0x23
    else
    {
        return GameAddScore;
    }
}

function ScoreKill(Controller Killer, Controller Other)
{
    local int AddExp, AddPoint;
    local float addScore;

    // End:0x146
    if(Killer == Other || Killer == none)
    {
        // End:0x143
        if(Other != none && Other.PlayerReplicationInfo != none)
        {
            Other.PlayerReplicationInfo.Score = FMax(0.0, Other.PlayerReplicationInfo.Score - GameDecScore);
            Other.PlayerReplicationInfo.fExp = FMax(0.0, Other.PlayerReplicationInfo.fExp - GameDecExp);
            Other.PlayerReplicationInfo.Point = FMax(0.0, Other.PlayerReplicationInfo.Point - GameDecPoint);
            Other.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
            ScoreEvent(Other.PlayerReplicationInfo, GameDecScore, "self_frag");
        }
    }
    // End:0x4bf
    else
    {
        // End:0x4bf
        if(Killer.PlayerReplicationInfo != none)
        {
            GetMultykillBonusPoint(Killer, AddExp, AddPoint);
            addScore = GetAddScore(Killer, Other);
            Killer.PlayerReplicationInfo.Score += addScore;
            Killer.PlayerReplicationInfo.fExp += GameAddExp + float(AddExp);
            Killer.PlayerReplicationInfo.Point += GameAddPoint + float(AddPoint);
            Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
            ++ Killer.PlayerReplicationInfo.Kills;
            ScoreEvent(Killer.PlayerReplicationInfo, addScore, "frag");
            // End:0x2a4
            if(Other.IsA('wHelicopterController'))
            {
                Killer.PlayerReplicationInfo.fExp += GameAddHeliExp;
                Killer.PlayerReplicationInfo.Point += GameAddHeliPoint;
            }
            // End:0x2c7
            if(Killer.IsA('PlayerController') && GameAddScore != float(0))
            {
            }
            Other.PlayerReplicationInfo.fExp = FMax(0.0, Other.PlayerReplicationInfo.fExp - GameDecExp);
            Other.PlayerReplicationInfo.Point = FMax(0.0, Other.PlayerReplicationInfo.Point - GameDecPoint);
            PlayerController(Killer).ReceiveMessage_QuestType1(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_Kill, SC.KillWeaponType, SC.KDLog.KillWeapon);
            // End:0x3ed
            if(Level.GetMatchMaker().PlayWithBots)
            {
                PlayerController(Killer).ReceiveMessage_QuestType3(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_KillInBotMode, SC.KillWeaponType, SC.KDLog.KillWeapon);
            }
            // End:0x455
            if(SC.KDLog.KillWeapon == 99999)
            {
                PlayerController(Killer).ReceiveMessage_QuestType1(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_MeeleAttackKill, SC.KillWeaponType, SC.KDLog.KillWeapon);
            }
            // End:0x4af
            else
            {
                // End:0x4af
                if(SC.IsWeaponAiming)
                {
                    PlayerController(Killer).ReceiveMessage_QuestType1(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_AimedKill, SC.KillWeaponType, SC.KDLog.KillWeapon);
                }
            }
            SetAssistPoint(Killer, Other);
        }
    }
    SendSeverScoreAndAssist(Killer, Other);
    // End:0x4f3
    if(GameRulesModifiers != none)
    {
        GameRulesModifiers.ScoreKill(Killer, Other);
    }
    // End:0x51f
    if(Killer != none || MaxLives > 0)
    {
        CheckScore(Killer.PlayerReplicationInfo);
    }
}

function SendSeverScoreAndAssist(Controller Killer, Controller Other)
{
    local Controller PC;
    local array<Controller> AssistList;
    local int iTemp, iPlayerID;

    // End:0x40
    if(Other.Pawn != none)
    {
        AssistList = Other.Pawn.GetAssistList(Killer.Pawn);
    }
    iTemp = 0;
    J0x47:
    // End:0x1b7 [While If]
    if(iTemp < AssistList.Length)
    {
        PC = AssistList[iTemp];
        // End:0x1ad
        if(PC != none && PC.PlayerReplicationInfo != none && PC != Killer)
        {
            iPlayerID = PC.PlayerReplicationInfo.GetUID();
            // End:0x1ad
            if(iPlayerID != -1)
            {
                SC.AssistUIDs[SC.AssistUIDs.Length] = iPlayerID;
                SC.AssistType[SC.AssistType.Length] = PC.PlayerReplicationInfo.AssistType;
                Log(string(self) $ " SendSeverScoreAndAssist : /PlayerID:" $ string(iPlayerID) $ "/PlayerName:" $ PC.PlayerReplicationInfo.PlayerName $ "/ AssistType:" $ string(PC.PlayerReplicationInfo.AssistType));
            }
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x47;
    }
    // End:0x1df
    if(!Other.Pawn.IsA('wHelicopter'))
    {
        KDLOG_Finalize();
    }
    // End:0x212
    else
    {
        iPlayerID = Killer.PlayerReplicationInfo.GetUID();
        KDLOG_Finalize_HeliCopter(iPlayerID, Killer, Other);
    }
}

function int GetAssistScore(out byte byAssistType, int iMessageCode)
{
    local float fAssistScore;

    switch(iMessageCode)
    {
        // End:0x2e
        case class'wMessage_Score'.default.Code_MessageScore_Assist:
            byAssistType = 3;
            fAssistScore = GameAssistScore;
            // End:0x82
            break;
        // End:0x55
        case class'wMessage_Score'.default.Code_MessageScore_Assist4:
            byAssistType = 4;
            fAssistScore = 4.0;
            // End:0x82
            break;
        // End:0x7c
        case class'wMessage_Score'.default.Code_MessageScore_Assist5:
            byAssistType = 5;
            fAssistScore = 5.0;
            // End:0x82
            break;
        // End:0xffff
        default:
            // End:0x82 Break;
            break;
    }
    Log(string(self) $ "/ iMessageCode : " $ string(iMessageCode) $ " / fAssistScore :" $ string(fAssistScore));
    return int(fAssistScore);
}

function SetAssistPoint(Controller Killer, Controller Other)
{
    local array<Controller> AssistList;
    local int iTemp, iMessageCode, AssisterUID;
    local float fAssistScore;
    local byte byAssistType;

    // End:0x40
    if(Other.Pawn != none)
    {
        AssistList = Other.Pawn.GetAssistList(Killer.Pawn);
    }
    // End:0x76
    if(Other.IsA('wHelicopterController'))
    {
        fAssistScore = 6.0;
        iMessageCode = class'wMessage_Score'.default.Code_MessageScore_Assist_Special;
    }
    // End:0x95
    else
    {
        fAssistScore = GameAssistScore;
        iMessageCode = class'wMessage_Score'.default.Code_MessageScore_Assist;
    }
    iTemp = 0;
    J0x9c:
    // End:0x345 [While If]
    if(iTemp < AssistList.Length)
    {
        // End:0xd7
        if(AssistList[iTemp] == none || Killer == AssistList[iTemp])
        {
        }
        // End:0x33b
        else
        {
            // End:0x198
            if(kMM.IsFixedAssistPoint && Other.Pawn != none)
            {
                AssisterUID = AssistList[iTemp].PlayerReplicationInfo.GetUID();
                Log(string(self) $ "/ AssisterUID : " $ string(AssisterUID));
                // End:0x180
                if(iMessageCode == class'wMessage_Score'.default.Code_MessageScore_Assist)
                {
                    iMessageCode = Other.Pawn.GetAssistScore(AssisterUID);
                }
                fAssistScore = float(GetAssistScore(byAssistType, iMessageCode));
            }
            AssistList[iTemp].PlayerReplicationInfo.Score += fAssistScore;
            AssistList[iTemp].PlayerReplicationInfo.fExp += GameAssistExp;
            AssistList[iTemp].PlayerReplicationInfo.Point += GameAssistPoint;
            AssistList[iTemp].PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
            ++ AssistList[iTemp].PlayerReplicationInfo.Assists;
            AssistList[iTemp].PlayerReplicationInfo.AssistType = byAssistType;
            // End:0x2b1
            if(PlayerController(AssistList[iTemp]) != none)
            {
                PlayerController(AssistList[iTemp]).ReceiveLocalizedMessage(class'wMessage_Score', iMessageCode);
            }
            AssistList[iTemp].ReceiveMessage_QuestType1(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_Assist, SC.KillWeaponType, SC.KDLog.KillWeapon);
            // End:0x33b
            if(AssistList[iTemp].PlayerReplicationInfo != none || MaxLives > 0)
            {
                CheckScore(AssistList[iTemp].PlayerReplicationInfo);
            }
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x9c;
    }
}

function SendMessageAddScore(Controller ReceiveController, Controller Killer, Controller Other, int KillWeapon, optional int iConKillorHeadShot)
{
    local int addScore, iCode_Message;

    addScore = int(GetAddScore(Killer, Other));
    // End:0x37
    if(Killer == Other || Killer == none)
    {
    }
    // End:0x36a
    else
    {
        // End:0x36a
        if(Killer.IsA('PlayerController') && addScore != 0)
        {
            // End:0xa6
            if(!Other.IsA('wHelicopterController'))
            {
                // End:0xa3
                if(iConKillorHeadShot & 1 == 0)
                {
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wMessage_Score', class'wMessage_Score'.default.Code_MessageScore_Normal);
                }
            }
            // End:0xcf
            else
            {
                PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wMessage_Score', class'wMessage_Score'.default.Code_MessageScore_Heli_Killed);
                return;
            }
            // End:0xf9
            if(iConKillorHeadShot & 2 == 2 || iConKillorHeadShot & 1024 == 1024)
            {
                return;
            }
            switch(KillWeapon)
            {
                // End:0x108
                case 5011:
                // End:0x110
                case 5001:
                // End:0x14d
                case 5003:
                    iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_SpecialETC;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    // End:0x36a
                    break;
                // End:0x155
                case 6002:
                // End:0x15d
                case 6005:
                // End:0x165
                case 50007:
                // End:0x16d
                case 50008:
                // End:0x175
                case 7003:
                // End:0x17d
                case 7001:
                // End:0x1ba
                case 6000:
                    iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_FragGrenade;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    // End:0x36a
                    break;
                // End:0x1f7
                case 99999:
                    iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_Melee;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    // End:0x36a
                    break;
                // End:0x234
                case 99998:
                    iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_StepOn;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    // End:0x36a
                    break;
                // End:0x271
                case 50000:
                    iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_Artillery;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    // End:0x36a
                    break;
                // End:0x279
                case 5009:
                // End:0x281
                case 50001:
                // End:0x2be
                case 50002:
                    iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_Heli_Killer;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    // End:0x36a
                    break;
                // End:0x2fb
                case 50006:
                    iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_SpecialETC;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    // End:0x36a
                    break;
                // End:0xffff
                default:
                    // End:0x335
                    if(PlayerController(ReceiveController).Pawn.bIsAiming)
                    {
                        iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_Normal_Aim;
                    }
                    // End:0x349
                    else
                    {
                        iCode_Message = class'wSpecialKillMessage'.default.Code_MessageScore_Normal;
                    }
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(class'wSpecialKillMessage', iCode_Message);
                    // End:0x36a Break;
                    break;
                }
            }
    }
}

function float GetMultykillBonusPoint(Controller C, out int AddExp, out int AddPoint)
{
    local int MultyKill;

    // End:0x5e
    if(C.IsA('PlayerController'))
    {
        MultyKill = Min(PlayerController(C).MultiKillLevel, GameAddMultiKillExp.Length - 1);
        AddExp = int(GameAddMultiKillExp[MultyKill]);
        AddPoint = int(GameAddMultiKillPoint[MultyKill]);
    }
    return float(AddPoint);
}

function bool TooManyBots(Controller botToRemove)
{
    return false;
}

static function Texture GetRandomTeamSymbol(int Base)
{
    return none;
}

static function string FindTeamDesignation(GameReplicationInfo GRI, Actor A)
{
    return "";
}

static function string ParseChatPercVar(Mutator BaseMutator, Controller Who, string Cmd)
{
    // End:0x2a
    if(BaseMutator != none)
    {
        Cmd = BaseMutator.ParseChatPercVar(Who, Cmd);
    }
    // End:0x4f
    if(Who != none)
    {
        Cmd = Who.ParseChatPercVar(Cmd);
    }
    return Cmd;
}

static function string ParseMessageString(Mutator BaseMutator, Controller Who, string Message)
{
    return Message;
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.BotsGroup, "GameDifficulty", GetDisplayText("GameDifficulty"), 0, 2, "Select", default.GIPropsExtras[0], "Xb");
    PlayInfo.AddSetting(default.GameGroup, "GoalScore", GetDisplayText("GoalScore"), 0, 0, "Text", "3;0:999");
    PlayInfo.AddSetting(default.GameGroup, "TimeLimit", GetDisplayText("TimeLimit"), 0, 0, "Text", "3;0:999");
    PlayInfo.AddSetting(default.GameGroup, "MaxLives", GetDisplayText("MaxLives"), 0, 0, "Text", "3;0:999");
    PlayInfo.AddSetting(default.GameGroup, "bWeaponStay", GetDisplayText("bWeaponStay"), 1, 0, "Check",,,, true);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowWeaponThrowing", GetDisplayText("bAllowWeaponThrowing"), 1, 0, "Check",,,, true);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowBehindView", GetDisplayText("bAllowBehindview"), 1, 0, "Check",,, true, true);
    PlayInfo.AddSetting(default.RulesGroup, "bWeaponShouldViewShake", GetDisplayText("bWeaponShouldViewShake"), 1, 0, "Check",,,, true);
    PlayInfo.AddSetting(default.ServerGroup, "bEnableStatLogging", GetDisplayText("bEnableStatLogging"), 0, 1, "Check",,, true);
    PlayInfo.AddSetting(default.ServerGroup, "bAdminCanPause", GetDisplayText("bAdminCanPause"), 1, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "MaxSpectators", GetDisplayText("MaxSpectators"), 1, 1, "Text", "3;0:32",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "MaxPlayers", GetDisplayText("MaxPlayers"), 0, 1, "Text", "3;0:32",, true);
    PlayInfo.AddSetting(default.ServerGroup, "MaxIdleTime", GetDisplayText("MaxIdleTime"), 0, 1, "Text", "3;0:300",, true, true);
    // End:0x3db
    if(default.GameReplicationInfoClass != none)
    {
        default.GameReplicationInfoClass.static.FillPlayInfo(PlayInfo);
        PlayInfo.PopClass();
    }
    // End:0x406
    if(default.VoiceReplicationInfoClass != none)
    {
        default.VoiceReplicationInfoClass.static.FillPlayInfo(PlayInfo);
        PlayInfo.PopClass();
    }
    // End:0x428
    if(default.BroadcastClass != none)
    {
        default.BroadcastClass.static.FillPlayInfo(PlayInfo);
    }
    // End:0x43c
    else
    {
        class'BroadcastHandler'.static.FillPlayInfo(PlayInfo);
    }
    PlayInfo.PopClass();
    // End:0x488
    if(class'GameInfo'.default.VotingHandlerClass != none)
    {
        class'GameInfo'.default.VotingHandlerClass.FillPlayInfo(PlayInfo);
        PlayInfo.PopClass();
    }
    // End:0x4db
    else
    {
        Log("GameInfo::FillPlayInfo class'Engine.GameInfo'.default.VotingHandlerClass = None");
    }
}

static function string GetDisplayText(string PropName)
{
    switch(PropName)
    {
        // End:0x22
        case "GameDifficulty":
            return default.GIPropsDisplayText[0];
        // End:0x3a
        case "bWeaponStay":
            return default.GIPropsDisplayText[1];
        // End:0x55
        case "MaxSpectators":
            return default.GIPropsDisplayText[4];
        // End:0x6d
        case "MaxPlayers":
            return default.GIPropsDisplayText[5];
        // End:0x84
        case "GoalScore":
            return default.GIPropsDisplayText[6];
        // End:0x9a
        case "MaxLives":
            return default.GIPropsDisplayText[7];
        // End:0xb1
        case "TimeLimit":
            return default.GIPropsDisplayText[8];
        // End:0xd1
        case "bEnableStatLogging":
            return default.GIPropsDisplayText[9];
        // End:0xf3
        case "bAllowWeaponThrowing":
            return default.GIPropsDisplayText[10];
        // End:0x111
        case "bAllowBehindview":
            return default.GIPropsDisplayText[11];
        // End:0x12d
        case "bAdminCanPause":
            return default.GIPropsDisplayText[12];
        // End:0x146
        case "MaxIdleTime":
            return default.GIPropsDisplayText[13];
        // End:0x16a
        case "bWeaponShouldViewShake":
            return default.GIPropsDisplayText[14];
        // End:0xffff
        default:
            return "";
    }
}

static function string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x22
        case "GameDifficulty":
            return default.GIPropDescText[0];
        // End:0x3a
        case "bWeaponStay":
            return default.GIPropDescText[1];
        // End:0x55
        case "MaxSpectators":
            return default.GIPropDescText[4];
        // End:0x6d
        case "MaxPlayers":
            return default.GIPropDescText[5];
        // End:0x84
        case "GoalScore":
            return default.GIPropDescText[6];
        // End:0x9a
        case "MaxLives":
            return default.GIPropDescText[7];
        // End:0xb1
        case "TimeLimit":
            return default.GIPropDescText[8];
        // End:0xd1
        case "bEnableStatLogging":
            return default.GIPropDescText[9];
        // End:0xf3
        case "bAllowWeaponThrowing":
            return default.GIPropDescText[10];
        // End:0x111
        case "bAllowBehindview":
            return default.GIPropDescText[11];
        // End:0x12d
        case "bAdminCanPause":
            return default.GIPropDescText[12];
        // End:0x146
        case "MaxIdleTime":
            return default.GIPropDescText[13];
        // End:0x16a
        case "bWeaponShouldViewShake":
            return default.GIPropDescText[14];
        // End:0xffff
        default:
            return super.GetDescriptionText(PropName);
    }
}

static event bool AcceptPlayInfoProperty(string PropName)
{
    // End:0x16
    if(PropName == "MaxLives")
    {
        return false;
    }
    return super.AcceptPlayInfoProperty(PropName);
}

static function int OrderToIndex(int Order)
{
    return Order;
}

function ReviewJumpSpots(name TestLabel);
function string RecommendCombo(string ComboName)
{
    return ComboName;
}

function string NewRecommendCombo(string ComboName, AIController C)
{
    local string NewComboName;

    NewComboName = RecommendCombo(ComboName);
    // End:0x26
    if(NewComboName != ComboName)
    {
        return NewComboName;
    }
    return BaseMutator.NewRecommendCombo(ComboName, C);
}

function bool CanEnterVehicle(Vehicle V, Pawn P)
{
    return BaseMutator.CanEnterVehicle(V, P);
}

function DriverEnteredVehicle(Vehicle V, Pawn P)
{
    BaseMutator.DriverEnteredVehicle(V, P);
}

function bool CanLeaveVehicle(Vehicle V, Pawn P)
{
    return BaseMutator.CanLeaveVehicle(V, P);
}

function DriverLeftVehicle(Vehicle V, Pawn P)
{
    BaseMutator.DriverLeftVehicle(V, P);
}

function TeamInfo OtherTeam(TeamInfo Requester)
{
    return none;
}

exec function KillBots(int Num);
exec function AdminSay(string Msg)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xac [While If]
    if(C != none)
    {
        // End:0x95
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).ClearProgressMessages();
            PlayerController(C).SetProgressTime(6.0);
            PlayerController(C).SetProgressMessage(0, Msg, class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function RegisterVehicle(Vehicle V)
{
    V.NextVehicle = VehicleList;
    VehicleList = V;
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
    return none;
}

function int GetDefenderNum()
{
    return 255;
}

event SetGrammar()
{
    // End:0x17
    if(BeaconName != "")
    {
        LoadSRGrammar(BeaconName);
    }
}

// Export UGameInfo::execLoadSRGrammar(FFrame&, void* const)
native function LoadSRGrammar(string Grammar);
function GetPlayerControllerList(out array<PlayerController> ControllerArray)
{
    local Controller C;
    local PlayerController PC;

    // End:0x19
    if(ControllerArray.Length > 0)
    {
        ControllerArray.Remove(0, ControllerArray.Length);
    }
    C = Level.ControllerList;
    J0x2d:
    // End:0xfa [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0xe3
        if(PC != none && PC.bIsPlayer && PC.PlayerReplicationInfo != none && !PC.PlayerReplicationInfo.bOnlySpectator && !PC.PlayerReplicationInfo.bBot && PC.Player != none)
        {
            ControllerArray[ControllerArray.Length] = PC;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x2d;
    }
}

function ParseVoiceCommand(PlayerController Sender, string RecognizedString);
static function AdjustBotInterface(bool bSinglePlayer);
event SceneStarted(SceneManager SM, Actor Other);
event SceneEnded(SceneManager SM, Actor Other);
event SceneAbort();
event NoTranslocatorKeyPressed(PlayerController PC);
static function array<string> GetAllLoadHints(optional bool bThisClassOnly);
static function string GetLoadingHint(PlayerController Ref, string MapName, Color HintColor)
{
    local string Hint;
    local int Attempt;

    // End:0x0e
    if(Ref == none)
    {
        return "";
    }
    J0x0e:
    // End:0x4e [While If]
    if(Hint == "" && ++ Attempt < 10)
    {
        Hint = ParseLoadingHint(GetNextLoadHint(MapName), Ref, HintColor);
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    return Hint;
}

static function string ParseLoadingHint(string Hint, PlayerController Ref, Color HintColor)
{
    local string CurrentHint, Cmd, Result;
    local int pos;

    pos = InStr(Hint, "%");
    // End:0x25
    if(pos == -1)
    {
        return Hint;
    }
    Cmd = "";
    Result = "";
    CurrentHint $= Left(Hint, pos);
    Hint = Mid(Hint, pos + 1);
    pos = InStr(Hint, "%");
    // End:0x81
    if(pos == -1)
    {
    }
    // End:0x133
    else
    {
        Cmd = Left(Hint, pos);
        Hint = Mid(Hint, pos + 1);
        Result = GetKeyBindName(Cmd, Ref);
        // End:0xde
        if(Result == Cmd || Result == "")
        {
        }
        // End:0x133
        else
        {
            CurrentHint $= MakeColorCode(default.BindColor) $ Result $ MakeColorCode(HintColor);
            pos = InStr(Hint, "%");
            // End:0x25
            if(Hint == "" || pos == -1)
            	goto J0x25;
        }
    }
    // End:0x15d
    if(Result != "" && Result != Cmd)
    {
        return CurrentHint $ Hint;
    }
    return "";
}

static function string GetKeyBindName(string Cmd, PlayerController Ref)
{
    local string BindStr;
    local array<string> Bindings;
    local int i, idx, BestIdx, Weight, BestWeight;

    // End:0x1f
    if(Ref == none || Cmd == "")
    {
        return Cmd;
    }
    BestIdx = -1;
    BindStr = Ref.ConsoleCommand("BINDINGTOKEY" @ "\\"" $ Cmd $ "\\"");
    // End:0x156
    if(BindStr != "")
    {
        Split(BindStr, ",", Bindings);
        // End:0x156
        if(Bindings.Length > 0)
        {
            i = 0;
            J0x8c:
            // End:0x11c [While If]
            if(i < Bindings.Length)
            {
                idx = int(Ref.ConsoleCommand("KEYNUMBER" @ Bindings[i]));
                // End:0x112
                if(idx != -1)
                {
                    Weight = GetBindWeight(byte(idx));
                    // End:0x112
                    if(Weight > BestWeight)
                    {
                        BestWeight = Weight;
                        BestIdx = idx;
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x8c;
            }
            // End:0x156
            if(BestIdx != -1)
            {
                return Ref.ConsoleCommand("LOCALIZEDKEYNAME" @ string(BestIdx));
            }
        }
    }
    return Cmd;
}

static function string GetNextLoadHint(string MapName)
{
    return "";
}

static function string MakeColorCode(Color NewColor)
{
    // End:0x1f
    if(NewColor.R == 0)
    {
        NewColor.R = 1;
    }
    // End:0x3e
    if(NewColor.G == 0)
    {
        NewColor.G = 1;
    }
    // End:0x5d
    if(NewColor.B == 0)
    {
        NewColor.B = 1;
    }
    return Chr(27) $ Chr(NewColor.R) $ Chr(NewColor.G) $ Chr(NewColor.B);
}

static function int GetBindWeight(byte KeyNumber)
{
    // End:0x20
    if(KeyNumber == 1 || KeyNumber == 2)
    {
        return 100;
    }
    // End:0x41
    if(KeyNumber >= 48 && KeyNumber <= 90)
    {
        return 75;
    }
    // End:0x72
    if(KeyNumber == 32 || KeyNumber >= 16 && KeyNumber <= 18)
    {
        return 50;
    }
    // End:0x93
    if(KeyNumber >= 37 && KeyNumber <= 40)
    {
        return 45;
    }
    // End:0xa4
    if(KeyNumber == 4)
    {
        return 40;
    }
    // End:0xc5
    if(KeyNumber == 236 || KeyNumber == 237)
    {
        return 35;
    }
    // End:0xf6
    if(KeyNumber == 8 || KeyNumber >= 33 && KeyNumber <= 40)
    {
        return 30;
    }
    // End:0x117
    if(KeyNumber >= 96 && KeyNumber <= 111)
    {
        return 25;
    }
    return 20;
}

static function bool IsVehicleMutator(string MutatorClassName)
{
    // End:0x24
    if(MutatorClassName ~= "Onslaught.MutBigWheels")
    {
        return true;
    }
    // End:0x53
    if(MutatorClassName ~= "Onslaught.MutWheeledVehicleStunts")
    {
        return true;
    }
    // End:0x81
    if(MutatorClassName ~= "Onslaught.MutLightweightVehicles")
    {
        return true;
    }
    // End:0xac
    if(MutatorClassName ~= "OnslaughtFull.MutVehicleArena")
    {
        return true;
    }
    return false;
}

static function bool AllowMutator(string MutatorClassName)
{
    // End:0x11
    if(MutatorClassName == default.MutatorClass)
    {
        return true;
    }
    // End:0x2e
    if(!default.bAllowVehicles && IsVehicleMutator(MutatorClassName))
    {
        return false;
    }
    return !class'LevelInfo'.static.IsDemoBuild();
}

static function AddServerDetail(out ServerResponseLine ServerState, string RuleName, coerce string RuleValue)
{
    local int i;

    i = ServerState.ServerInfo.Length;
    ServerState.ServerInfo.Length = i + 1;
    ServerState.ServerInfo[i].key = RuleName;
    ServerState.ServerInfo[i].Value = RuleValue;
}

function string StripColor(string S)
{
    local int P;

    P = InStr(S, Chr(27));
    J0x11:
    // End:0x54 [While If]
    if(P >= 0)
    {
        S = Left(S, P) $ Mid(S, P + 4);
        P = InStr(S, Chr(27));
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
    return S;
}

function bool JustStarted(float t)
{
    return Level.TimeSeconds < t;
}

function int MultiMinPlayers()
{
    return 0;
}

function WeakObjectives();
function DisableNextObjective();
simulated function bool IsRespawnRestrictionTime()
{
    return false;
}

function bool IsPawnAlive(Controller C)
{
    return !C.PlayerReplicationInfo.bOutOfLives && !C.PlayerReplicationInfo.bOnlySpectator && !C.IsInState('Spectating') && !C.IsInState('SpectatingGM') && !C.IsInState('PlayerWaiting') || bHasRespawnRestriction && !IsRespawnRestrictionTime();
}

function DeadUse(PlayerController PC);
function CalcResultPoints();
function float GetResultPointRatio_Intervention(PlayerReplicationInfo PRI)
{
    return FMin(1.0, FMax(0.0, float(GameReplicationInfo.ElapsedTime) - float(PRI.ElapsedTimeWhenIntervented) / float(GameReplicationInfo.ElapsedTime)));
}

function array<int> GetTeamScores()
{
    return GameReplicationInfo.GetTeamScores();
}

function SendRawMatchResult()
{
    local int lp1, UID;
    local array<int> RoundJoin, TimeJoin, UserIDs, Kills, Assists, Deaths,
	    EXPs, Points, Scores, PlayedOwnerID, PlayedTime,
	    PlayedSeconds, PlayedCount, PlayedRound;

    local array<string> Names;
    local array<BtrDouble> PlayedUniqueItemID;
    local PlayerReplicationInfo PRI;
    local array<int> TeamScores;
    local wMatchUserInfo UserInfo;
    local Controller C;
    local PlayerController P;
    local int iCode_Message;

    Log("[END] sendrawmatchresult");
    crlog("[GameInfo::SendRawMatchResult]");
    // End:0x4aa
    foreach kMM.playingLevelInfo.DynamicActors(class'PlayerReplicationInfo', PRI)
    {
        // End:0x15a
        if(!PRI.IsConnected)
        {
            Log("[SendRawMatchResult][!IsConnected] Name=" $ PRI.PlayerName $ " UID=" $ string(UID) $ " Kills=" $ string(PRI.Kills) $ " Deaths=" $ string(PRI.Deaths) $ " EXP=" $ string(PRI.fExp) $ " Point=" $ string(PRI.Point) $ " Score=" $ string(PRI.Score));
            continue;
        }
        // End:0x4aa
        else
        {
            // End:0x1b7
            if(PRI.bAdminSpecator)
            {
                Log("[SendRawMatchResult][Admin] Name=" $ PRI.PlayerName $ " UID=" $ string(UID));
                continue;
            }
            // End:0x4aa
            else
            {
                UserInfo = kMM.GetUserInfoByUserName(PRI.PlayerName);
                UID = PRI.GetUID();
                // End:0x4a9
                if(bSendBot == true || PRI.bBot == false)
                {
                    UserIDs[UserIDs.Length] = UID;
                    Kills[Kills.Length] = PRI.Kills;
                    Assists[Assists.Length] = PRI.Assists;
                    Deaths[Deaths.Length] = int(PRI.Deaths);
                    Names[Names.Length] = PRI.PlayerName;
                    // End:0x2bc
                    if(UserInfo == none)
                    {
                        EXPs[EXPs.Length] = 0;
                        Points[Points.Length] = 0;
                    }
                    // End:0x37c
                    else
                    {
                        EXPs[EXPs.Length] = int(float(Max(0, int(PRI.fExp))) * UserInfo.GetBonusExP(Level.GameMgr));
                        Points[Points.Length] = int(float(Max(0, int(PRI.Point))) * UserInfo.GetBonusPoint(Level.GameMgr));
                        UserInfo.RoundPlayed = PRI.RoundPlayed;
                        UserInfo.TimePlayed = PRI.TimePlayed;
                    }
                    Scores[Scores.Length] = int(PRI.Score);
                    Log("[GameInfo::SendRawMatchResult] Name=" $ PRI.PlayerName $ " UID=" $ string(UID) $ " Kills=" $ string(PRI.Kills) $ " Deaths=" $ string(PRI.Deaths) $ " EXP=" $ string(PRI.fExp) $ " Point=" $ string(PRI.Point) $ " Score=" $ string(PRI.Score));
                    RoundJoin[RoundJoin.Length] = PRI.RoundWhenIntervented;
                    TimeJoin[TimeJoin.Length] = PRI.ElapsedTimeWhenIntervented;
                }
                continue;
            }
        }        
    }
    C = Level.ControllerList;
    J0x4bf:
    // End:0x573 [While If]
    if(C != none)
    {
        P = PlayerController(C);
        // End:0x55c
        if(P != none)
        {
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_MatchEnd;
            P.ReceiveMessage_QuestType1(class'wMessage_Quest', iCode_Message);
            iCode_Message = class'wMessage_Quest'.default.Code_Quest_MatchEndInBotMode;
            // End:0x55c
            if(Level.GetMatchMaker().PlayWithBots)
            {
                P.ReceiveMessage_QuestType3(class'wMessage_Quest', iCode_Message,);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x4bf;
    }
    TeamScores = GetTeamScores();
    Log("[GameInfo::SendRawMatchResult] - Update Score / Game ElapsedTime : " $ string(GameReplicationInfo.ElapsedTime));
    BTSend.sfReqUpdateScore(kMM.kRoomID, UserIDs, Kills, Assists, Deaths, EXPs, Points, Scores, TeamScores, RoundJoin, TimeJoin, GameReplicationInfo.ElapsedTime, kMM.GameEndType, Names);
    kMM.GetItemDurabilityInfo(PlayedOwnerID, PlayedTime, PlayedRound, PlayedUniqueItemID, PlayedSeconds, PlayedCount);
    Log("[GameInfo::SendRawMatchResult] - before cleaning");
    lp1 = 0;
    J0x6b0:
    // End:0x746 [While If]
    if(lp1 < PlayedOwnerID.Length)
    {
        Log("OwnerID=" $ string(PlayedOwnerID[lp1]) $ " PlayedTime=" $ string(PlayedTime[lp1]) $ " PlayedSeconds=" $ string(PlayedSeconds[lp1]) $ " PlayedCount=" $ string(PlayedCount[lp1]));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x6b0;
    }
    lp1 = 0;
    J0x74d:
    // End:0x7c1 [While If]
    if(lp1 < PlayedOwnerID.Length)
    {
        // End:0x7b7
        if(UnresolvedNativeFunction_99(PlayedUniqueItemID[lp1], 0))
        {
            PlayedOwnerID.Remove(lp1, 1);
            PlayedTime.Remove(lp1, 1);
            PlayedRound.Remove(lp1, 1);
            PlayedUniqueItemID.Remove(lp1, 1);
            PlayedSeconds.Remove(lp1, 1);
            PlayedCount.Remove(lp1, 1);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x74d;
    }
    crlog("[GameInfo::SendRawMatchResult] - GetItemDurabilityInfo");
    lp1 = 0;
    J0x806:
    // End:0x8a0 [While If]
    if(lp1 < PlayedOwnerID.Length)
    {
        crlog("OwnerID=" $ string(PlayedOwnerID[lp1]) $ " PlayedTime=" $ string(PlayedTime[lp1]) $ " PlayedSeconds=" $ string(PlayedSeconds[lp1]) $ " PlayedCount=" $ string(PlayedCount[lp1]));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x806;
    }
    // End:0x902
    if(kMM.szGameClass ~= "wMission.wSDGameInfo")
    {
        BTSend.sfReqUpdateWeaponDurability(GameReplicationInfo.ElapsedTime, PlayedOwnerID, PlayedRound, PlayedUniqueItemID, PlayedSeconds, PlayedCount);
    }
    // End:0x938
    else
    {
        BTSend.sfReqUpdateWeaponDurability(GameReplicationInfo.ElapsedTime, PlayedOwnerID, PlayedTime, PlayedUniqueItemID, PlayedSeconds, PlayedCount);
    }
}

function SendMatchResult()
{
    Log("[CYH] GameInfo::SendMatchResult()");
    Log("[END] sendmatchresult");
    CalcResultPoints();
    SendRawMatchResult();
}

function int CountPlayers()
{
    local PlayerController PC;
    local int Count;

    Count = 0;
    // End:0x1f
    foreach DynamicActors(class'PlayerController', PC)
    {
        ++ Count;                
    }
    return Count;
}

function int GetTotalPlayedTime()
{
    return TimeLimit * 60;
}

function SendMatchOver()
{
    Log("[END] sendmatchover");
    Log("[CYH] GameInfo::SendMatchOver() IsOwner=" $ string(kMM.bIsOwner));
    // End:0xb9
    if(kMM.bIsOwner == true)
    {
        SendMatchResult();
        BTSend.sfReqGetBooty(kMM.kRoomID);
        BTSend.sfReqGameOver(kMM.kUID, kMM.kRoomID);
    }
}

function SendMatchOverEnd()
{
    Log("[CYH] GameInfo::SendMatchOverEnd() IsOwner=" $ string(kMM.bIsOwner));
    // End:0x66
    if(kMM.bIsOwner == true)
    {
        BTSend.sfReqGameOverEnd();
    }
}

function bool IsRightTimeForRespawn(Controller C)
{
    return IsInState('MatchInProgress');
}

function bool IsWarpPossible()
{
    return false;
}

function SendReqUpdateMyHostPriorityPoint(int Point)
{
    // End:0x1f
    if(BTSend != none)
    {
        BTSend.sfReqUpdateMyHostPriorityPoint(Point);
    }
}

function SendReqChangeWeaponSet(int PlayerID, int SlotIndex)
{
    // End:0x24
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_ChangeWeaponSet(PlayerID, SlotIndex);
    }
}

function SendGameStartTime(array<int> aPlayerIDs)
{
    // End:0x1f
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_SetGameStartTime(aPlayerIDs);
    }
}

function SendRoundStartTime(array<int> aPlayerIDs)
{
    // End:0x1f
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_SetRoundStartTime(aPlayerIDs);
    }
}

function bool CanPawnTakeDamage()
{
    return true;
}

function float GetSupplyRandom()
{
    local float fReturn;

    // End:0x2f
    if(SupplyRandIndex == -1)
    {
        SupplyRandIndex = Rand(Level.GameMgr.SupplyRandomArray.Length);
    }
    fReturn = Level.GameMgr.SupplyRandomArray[SupplyRandIndex];
    Log("GetSupplyRandom Index : " $ string(SupplyRandIndex) $ " / Random Value : " $ string(fReturn));
    ++ SupplyRandIndex;
    // End:0xc6
    if(SupplyRandIndex >= Level.GameMgr.SupplyRandomArray.Length)
    {
        SupplyRandIndex = 0;
    }
    return fReturn;
}

function GetFlagsInfo(out int outNumFlags, out int outNumCapturedFlagsByTeam1, out int outNumCapturedFlagsByTeam2)
{
    outNumFlags = 0;
    outNumCapturedFlagsByTeam1 = 0;
    outNumCapturedFlagsByTeam2 = 0;
}

function Kill(Controller C);
function PushDeathPos(Vector vPos)
{
    nCurIndex = int(float(++ nCurIndex) % float(MaxPlayers >> 1));
    DeathPos[nCurIndex] = vPos;
}

function array<Vector> GetDeathPosArray()
{
    return DeathPos;
}

function GetGameSpecificActions(Controller C, wNPCActions npcActions, out array<Object> Actions);
function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes);
event Actor GetNearFlag(Actor A)
{
    return none;
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    return true;
}

function PermitWeaponChangeInSpecialMode();

defaultproperties
{
    fSendPingTime=10.0
    bRestartLevel=true
    bPauseable=true
    bWeaponStay=true
    bCanChangeSkin=true
    bCanViewOthers=true
    bDelayedStart=true
    bAllowWeaponThrowing=true
    bWeaponShouldViewShake=true
    bModViewShake=true
    GoreLevel=2
    GameDifficulty=3.0
    AutoAim=1.0
    GameSpeed=1.0
    bSendBot=true
    HUDType="Engine.HUD"
    GoreLevelText[0]="None"
    GoreLevelText[1]="Low"
    GoreLevelText[2]="Max"
    MaxSpectators=4
    MaxPlayers=16
    CurrentID=1
    DefaultPlayerName="Player"
    FearCostFallOff=0.950
    DeathMessageClass=class'LocalMessage'
    GameMessageClass=class'GameMessage'
    MutatorClass="Engine.Mutator"
    AccessControlClass="Engine.AccessControl"
    BroadcastHandlerClass="Engine.BroadcastHandler"
    PlayerControllerClassName="Engine.PlayerController"
    GameReplicationInfoClass=class'GameReplicationInfo'
    MaplistHandlerClass=class'MaplistManager'
    GameStatsClass="IpDrv.MasterServerGameStats"
    RespawnTime=3.50
    SecurityClass="UnrealGame.UnrealSecurity"
    GameName="Game"
    Acronym="???"
    VotingHandlerType="xVoting.xVotingHandler"
    GIPropsDisplayText[0]="AI Level"
    GIPropsDisplayText[1]="Weapons Stay"
    GIPropsDisplayText[2]="Gore Level"
    GIPropsDisplayText[3]="Game Speed"
    GIPropsDisplayText[4]="Max Spectators"
    GIPropsDisplayText[5]="Max Players"
    GIPropsDisplayText[6]="Goal Score"
    GIPropsDisplayText[7]="Max Lives"
    GIPropsDisplayText[8]="Time Limit"
    GIPropsDisplayText[9]="World Stats Login"
    GIPropsDisplayText[10]="Allow Weapon Drop"
    GIPropsDisplayText[11]="3rd-person PoV"
    GIPropsDisplayText[12]="Allow game pause by admins"
    GIPropsDisplayText[13]="Idle Timeout"
    GIPropsDisplayText[14]="Weapon Shake"
    GIPropDescText[0]="Set the AI level of computer players."
    GIPropDescText[1]="Weapons remain on the ground after swapping."
    GIPropDescText[2]="Set the blood and gore display level."
    GIPropDescText[3]="Set the speed of the game."
    GIPropDescText[4]="Set the number of spectators allowed in the game."
    GIPropDescText[5]="Set the maximum number of players allowed on the server."
    GIPropDescText[6]="Once a player reaches this score, the game ends."
    GIPropDescText[7]="Set the number of respawns each player is allowed."
    GIPropDescText[8]="Set the time limit for each round."
    GIPropDescText[9]="Send game stats to the UT2004 World Stats server."
    GIPropDescText[10]="Allow players to drop weapons currently held."
    GIPropDescText[11]="Players can change to a 3rd-person point of view."
    GIPropDescText[12]="Server admins may pause the game."
    GIPropDescText[13]="A player that does not move for this set duration is automatically kicked."
    GIPropDescText[14]="Screen shakes when certain weapons fire."
    GIPropsExtras="0.000000;Beginner;1.000000;Normal;2.000000;Experienced;3.000000;Proficient;4.000000;Expert;5.000000;Master;6.000000;Inhuman;7.000000;God-like"
    CallSigns[0]="ALPHA"
    CallSigns[1]="BRAVO"
    CallSigns[2]="CHARLIE"
    CallSigns[3]="DELTA"
    CallSigns[4]="ECHO"
    CallSigns[5]="FOXTROT"
    CallSigns[6]="GOLF"
    CallSigns[7]="HOTEL"
    CallSigns[8]="INDIA"
    CallSigns[9]="JULIET"
    CallSigns[10]="KILO"
    CallSigns[11]="LIMA"
    CallSigns[12]="MIKE"
    CallSigns[13]="NOVEMBER"
    CallSigns[14]="OSCAR"
    NoBindString="[None]"=""
    BindColor=(R=128,G=128,B=0,A=255)
    GameAddScore=10.0
    GameAddScore_KillHeli=20.0
    GameAssistScore=3.0
    GameDecScore=10.0
    GameAddExp=15.0
    GameAssistExp=5.0
    GameDecExp=2.0
    GamePenaltyExp=15.0
    GameAddPoint=5.0
    GameAssistPoint=2.0
    GamePenaltyPoint=5.0
    GameAddHeliExp=15.0
    GameAddHeliPoint=5.0
    GameAddMultiKillExp=// Object reference not set to an instance of an object.
    
    GameAddMultiKillPoint=// Object reference not set to an instance of an object.
    
    SpawnWeaponPickupLocations=true
    UAVDuration=24
    UAVScanInterval=4
    SDRespawnTime=27.0
    ChangedHostCompleteCountDown_Initial=11
    RespawnRestrictionTime=-1
    nCurIndex=-1
}