class GameInfo extends Info
    native
    notplaceable
    hidedropdown
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const GAME_ADD_HELI_EXP = 15;
const GAME_ADD_HELI_POINT = 5;
const GAME_ADD_SENTRYGUN_EXP = 15;
const GAME_ADD_SENTRYGUN_POINT = 5;
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
var cache bool bTeamGame;
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
var cache string RulesMenuType;
var string SettingsMenuType;
var string GameUMenuType;
var string MultiplayerUMenuType;
var string GameOptionsMenuType;
var cache string HUDSettingsMenu;
var string HUDType;
var cache string MapListType;
var cache string MapPrefix;
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
var Class<LocalMessage> DeathMessageClass;
var Class<GameMessage> GameMessageClass;
var name OtherMesgGroup;
var string MutatorClass;
var Mutator BaseMutator;
var() string AccessControlClass;
var AccessControl AccessControl;
var GameRules GameRulesModifiers;
var() string BroadcastHandlerClass;
var() Class<BroadcastHandler> BroadcastClass;
var BroadcastHandler BroadcastHandler;
var Class<PlayerController> PlayerControllerClass;
var string PlayerControllerClassName;
var() Class<GameReplicationInfo> GameReplicationInfoClass;
var GameReplicationInfo GameReplicationInfo;
var() Class<VoiceChatReplicationInfo> VoiceReplicationInfoClass;
var VoiceChatReplicationInfo VoiceReplicationInfo;
var string MaplistHandlerType;
var Class<MaplistManagerBase> MaplistHandlerClass;
var transient MaplistManagerBase MaplistHandler;
var GameStats GameStats;
var string GameStatsClass;
var transient string DemoCommand;
var float RespawnTime;
var string SecurityClass;
var() localized cache string GameName;
var() localized cache string Description;
var() cache string ScreenShotName;
var() cache string DecoTextName;
var() cache string Acronym;
var string VotingHandlerType;
var Class<VotingHandler> VotingHandlerClass;
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
native final function Object CreateDataObject(Class objClass, string objName, string PackageName)
{
    //native.objClass;
    //native.objName;
    //native.PackageName;        
}

// Export UGameInfo::execDeleteDataObject(FFrame&, void* const)
native final function bool DeleteDataObject(Class objClass, string objName, string PackageName)
{
    //native.objClass;
    //native.objName;
    //native.PackageName;        
}

// Export UGameInfo::execLoadDataObject(FFrame&, void* const)
native final function Object LoadDataObject(Class objClass, string objName, string PackageName)
{
    //native.objClass;
    //native.objName;
    //native.PackageName;        
}

// Export UGameInfo::execAllDataObjects(FFrame&, void* const)
native final iterator function AllDataObjects(Class objClass, out Object obj, string PackageName)
{
    //native.objClass;
    //native.obj;
    //native.PackageName;        
}

// Export UGameInfo::execSavePackage(FFrame&, void* const)
native final function bool SavePackage(string PackageName)
{
    //native.PackageName;        
}

// Export UGameInfo::execDeletePackage(FFrame&, void* const)
native final function bool DeletePackage(string PackageName)
{
    //native.PackageName;        
}

// Export UGameInfo::execLoadMapList(FFrame&, void* const)
native static final function LoadMapList(string MapPrefix, out array<string> Maps)
{
    //native.MapPrefix;
    //native.Maps;        
}

// Export UGameInfo::execNativeSettingAfterChangedHost(FFrame&, void* const)
native final function NativeSettingAfterChangedHost();

function AnnounceArtillery(Controller Caller)
{
    //return;    
}

function AnnounceHelicopter(Controller Caller)
{
    //return;    
}

function AnnounceUAV(Controller Caller)
{
    //return;    
}

function AnnounceSentryGun_Spawn(Controller Caller)
{
    //return;    
}

function AnnounceSentryGun_Destory(int iTeamIndex)
{
    //return;    
}

function PreBeginPlay()
{
    local bool bExist;
    local wMatchMaker MM;

    StartTime = 0.0000000;
    GameReplicationInfo = Spawn(GameReplicationInfoClass);
    Level.GRI = GameReplicationInfo;
    InitGameReplicationInfo();
    InitVoiceReplicationInfo();
    InitLogging();
    SC = new Class'Engine_Decompressed.GameInfoScriptPart';
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
    else
    {
        Level.GameMgr.bUseAdvCamShake = false;
    }
    bExist = bool(ConsoleCommand("GETCONFIG_EXIST Misc MinimapMode"));
    // End:0x2A6
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_INT Misc MinimapMode 0");        
    }
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
    // End:0x3B6
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_INT Misc RecordResoultion 1");
    }
    bExist = bool(ConsoleCommand("GETCONFIG_EXIST Misc RecordQuality"));
    // End:0x41F
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_INT Misc RecordQuality 1");
    }
    bExist = bool(ConsoleCommand("GETCONFIG_EXIST Misc EnableRecord"));
    // End:0x48B
    if(!bExist)
    {
        ConsoleCommand("SETCONFIG_BOOL Misc EnableRecord False");
    }
    CurrentID = Rand(10000);
    //return;    
}

event ForcePreBeginPlay()
{
    PreBeginPlay();
    //return;    
}

event ForceBeginPlay()
{
    BeginPlay();
    //return;    
}

event ForcePostBeginPlay()
{
    PostBeginPlay();
    //return;    
}

event ForcePostNetBeginPlay()
{
    PostNetBeginPlay();
    //return;    
}

event ForceSetInitialState()
{
    SetInitialState();
    //return;    
}

event ForceSetGRIInitialState()
{
    SetGRIInitialState();
    //return;    
}

function int GetBootySeedValue()
{
    return 0;
    //return;    
}

event SetOldTeamInfo(GameReplicationInfo OldGRI)
{
    //return;    
}

function Destroyed()
{
    CurrentGameProfile = none;
    super(Actor).Destroyed();
    //return;    
}

function UpdatePrecacheMaterials()
{
    PrecacheGameTextures(Level);
    //return;    
}

function UpdatePrecacheStaticMeshes()
{
    PrecacheGameStaticMeshes(Level);
    //return;    
}

function UpdatePrecacheSkeletalMeshes()
{
    PrecacheGameSkeletalMeshes(Level);
    //return;    
}

static function Precache(LevelInfo Level)
{
    Level.WeaponMgr.PrecacheClasses();
    Level.GameMgr.PrecacheItemResources(Level);
    PrecacheGore();
    //return;    
}

static function PrecacheGameTextures(LevelInfo myLevel)
{
    //return;    
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    //return;    
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    V.Level.WeaponMgr.PrecacheSound();
    //return;    
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

    // End:0x201 [Loop If]
    if(lp1 < gores.Length)
    {
        strTemp = gores[lp1];
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "Body", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "GoreLArm", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "LArm", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "GoreRArm", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "RArm", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "GoreLLeg", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "LLeg", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "GoreRLeg", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "RLeg", Class'Engine.Mesh');
        DynamicLoadObject(("Char_01_Gore." $ strTemp) $ "GoreHead", Class'Engine.Mesh');
        lp1++;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
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
    //return;    
}

function AllReceiveLocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local Controller C;

    Log((("[GameInfo::AllReceiveLocalizedMessage] Message=" $ string(Message)) @ "Switch=") $ string(Switch));
    C = Level.ControllerList;
    J0x64:

    // End:0xC7 [Loop If]
    if(C != none)
    {
        // End:0xB0
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x64;
    }
    //return;    
}

function TeamReceiveLocalizedMessage(byte Team, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local Controller C;

    Log((((("[GameInfo::TeamReceiveLocalizedMessage] Team=" $ string(Team)) @ "Message=") $ string(Message)) @ "Switch=") $ string(Switch));
    C = Level.ControllerList;
    J0x77:

    // End:0xF7 [Loop If]
    if(C != none)
    {
        // End:0xE0
        if(C.IsA('PlayerController') && C.GetTeamNum() == int(Team))
        {
            PlayerController(C).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x77;
    }
    //return;    
}

function TeamReceiveLocalizedMessageDistance(byte Team, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional Vector vLocation, optional float fMaxDist, optional bool bExceptOwner)
{
    local Controller C;
    local float fDist;

    Log((((("[GameInfo::TeamReceiveLocalizedMessageDistance] Team=" $ string(Team)) @ "Message=") $ string(Message)) @ "Switch=") $ string(Switch));
    C = Level.ControllerList;
    J0x7F:

    // End:0x194 [Loop If]
    if(C != none)
    {
        // End:0x17D
        if(C.IsA('PlayerController'))
        {
            // End:0xC9
            if(bExceptOwner && RelatedPRI_1 == PlayerController(C).PlayerReplicationInfo)
            {                
            }
            else
            {
                // End:0xE5
                if(PlayerController(C).Pawn == none)
                {                    
                }
                else
                {
                    fDist = VSize(vLocation - PlayerController(C).Pawn.Location);
                    // End:0x17D
                    if(fDist < fMaxDist)
                    {
                        // End:0x17D
                        if(C.IsA('PlayerController') && C.GetTeamNum() == int(Team))
                        {
                            PlayerController(C).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
                        }
                    }
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x7F;
    }
    //return;    
}

function TeamQueueAnnouncement(byte Team, string ASoundName, byte AnnouncementLevel, optional Object.EAPriority Priority, optional byte Switch)
{
    local Controller C;

    Log("[GameInfo::TeamQueueAnnouncement] ASoundName=" $ ASoundName);
    C = Level.ControllerList;
    J0x4C:

    // End:0xC7 [Loop If]
    if(C != none)
    {
        // End:0xB0
        if(C.IsA('PlayerController') && C.GetTeamNum() == int(Team))
        {
            PlayerController(C).QueueAnnouncement(ASoundName, AnnouncementLevel, Priority, Switch);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x4C;
    }
    //return;    
}

function ChangeMap(int ContextID)
{
    local MapList MyList;
    local Class<MapList> ML;
    local string MapString;

    ML = Class<MapList>(DynamicLoadObject(MapListType, Class'Core.Class'));
    MyList = Spawn(ML);
    MapString = MyList.GetMap(ContextID);
    MyList.Destroy();
    // End:0x5D
    if(MapString == "")
    {
        return;
    }
    Level.ServerTravel(MapString, false);
    //return;    
}

static function bool UseLowGore()
{
    return (default.bAlternateMode || default.bLowGore) || default.GoreLevel < 2;
    //return;    
}

static function bool NoBlood()
{
    return default.GoreLevel == 0;
    //return;    
}

function PostBeginPlay()
{
    // End:0x1F
    if(MaxIdleTime > float(0))
    {
        MaxIdleTime = FMax(MaxIdleTime, 30.0000000);
    }
    // End:0x48
    if(GameStats != none)
    {
        GameStats.NewGame();
        GameStats.ServerInfo();
    }
    // End:0x6C
    if(DemoCommand != "")
    {
        ConsoleCommand("demorec" @ DemoCommand, true);
    }
    //return;    
}

function InitializeEveryPlayerStarts()
{
    local PlayerStart N;
    local PlayerStart_SD S;
    local PlayerStart_Defence f;

    Log("[GameInfo::InitializeEveryPlayerStarts]");
    EveryPlayerStarts.Length = 0;
    // End:0x78
    foreach AllActors(Class'Engine_Decompressed.PlayerStart', N)
    {
        // End:0x77
        if((IsAppropriateRespawnPoint(N, 0)) || IsAppropriateRespawnPoint(N, 1))
        {
            EveryPlayerStarts[EveryPlayerStarts.Length] = N;
        }        
    }    
    EverySDPlayerStarts.Length = 0;
    // End:0xA4
    foreach AllActors(Class'Engine_Decompressed.PlayerStart_SD', S)
    {
        EverySDPlayerStarts[EverySDPlayerStarts.Length] = S;        
    }    
    // End:0xED
    if(Level.GetMatchMaker().BotTutorial)
    {
        EveryDFPlayerStarts.Length = 0;
        // End:0xEC
        foreach AllActors(Class'Engine_Decompressed.PlayerStart_Defence', f)
        {
            EveryDFPlayerStarts[EveryDFPlayerStarts.Length] = f;            
        }        
    }
    //return;    
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
    totalDist = 0.0000000;
    lp1 = 0;
    J0x45:

    // End:0x112 [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        lp2 = lp1 + 1;
        J0x63:

        // End:0x108 [Loop If]
        if(lp2 < EveryPlayerStarts.Length)
        {
            dist = VSize(EveryPlayerStarts[lp1].Location - EveryPlayerStarts[lp2].Location);
            totalDist += dist;
            Log((((("  " $ string(EveryPlayerStarts[lp1].Name)) $ " - ") $ string(EveryPlayerStarts[lp2].Name)) $ " = ") $ string(dist));
            lp2++;
            // [Loop Continue]
            goto J0x63;
        }
        lp1++;
        // [Loop Continue]
        goto J0x45;
    }
    lp1 = 0;
    J0x119:

    // End:0x22C [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        minDist = 9999.0000000;
        lp2 = 0;
        J0x13B:

        // End:0x1C1 [Loop If]
        if(lp2 < EveryPlayerStarts.Length)
        {
            // End:0x1B7
            if(lp1 != lp2)
            {
                dist = VSize(EveryPlayerStarts[lp1].Location - EveryPlayerStarts[lp2].Location);
                // End:0x1B7
                if(minDist > dist)
                {
                    minDist = dist;
                    minN = EveryPlayerStarts[lp2];
                }
            }
            lp2++;
            // [Loop Continue]
            goto J0x13B;
        }
        Log((((("  Closest to " $ string(EveryPlayerStarts[lp1].Name)) $ " = ") $ string(minN.Name)) $ " dist=") $ string(minDist));
        totalMinDist += minDist;
        lp1++;
        // [Loop Continue]
        goto J0x119;
    }
    Log("");
    Log("  Average Distance Between Spawn Points = " $ string(totalDist / float((EveryPlayerStarts.Length * EveryPlayerStarts.Length) / 2)));
    Log("  Average Min Dist = " $ string(totalMinDist / float(EveryPlayerStarts.Length)));
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    bGameEnded = false;
    bOverTime = false;
    bWaitingToStartMatch = true;
    InitGameReplicationInfo();
    InitVoiceReplicationInfo();
    //return;    
}

function InitLogging()
{
    local Class<GameStats> MyGameStatsClass;

    // End:0x50
    if(((!bEnableStatLogging || !bLoggingGame) || int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
    {
        return;
    }
    MyGameStatsClass = Class<GameStats>(DynamicLoadObject(GameStatsClass, Class'Core.Class'));
    // End:0xB2
    if(MyGameStatsClass != none)
    {
        GameStats = Spawn(MyGameStatsClass);
        // End:0xAF
        if(GameStats == none)
        {
            Log("Could to create Stats Object");
        }        
    }
    else
    {
        Log(("Error loading GameStats [" $ GameStatsClass) $ "]");
    }
    //return;    
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
        if(int(Level.NetMode) != int(NM_Standalone))
        {
            i = 0;
            J0x31:

            // End:0x160 [Loop If]
            if(i < GameReplicationInfo.PRIArray.Length)
            {
                // End:0x156
                if((GameReplicationInfo.PRIArray[i] != none) && !GameReplicationInfo.PRIArray[i].bWelcomed)
                {
                    GameReplicationInfo.PRIArray[i].bWelcomed = true;
                    // End:0x112
                    if(!GameReplicationInfo.PRIArray[i].bOnlySpectator)
                    {
                        // End:0x10F
                        if(!GameReplicationInfo.PRIArray[i].bAdminSpecator)
                        {
                            BroadcastLocalizedMessage(GameMessageClass, 1, GameReplicationInfo.PRIArray[i]);
                        }
                        // [Explicit Continue]
                        goto J0x156;
                    }
                    // End:0x156
                    if(!GameReplicationInfo.PRIArray[i].bAdminSpecator)
                    {
                        BroadcastLocalizedMessage(GameMessageClass, 16, GameReplicationInfo.PRIArray[i]);
                    }
                }
                J0x156:

                i++;
                // [Loop Continue]
                goto J0x31;
            }
        }
    }
    BroadcastHandler.UpdateSentText();
    N = Level.NavigationPointList;
    J0x183:

    // End:0x1BA [Loop If]
    if(N != none)
    {
        N.FearCost *= FearCostFallOff;
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x183;
    }
    //return;    
}

event GameEnding()
{
    EndLogging("serverquit");
    //return;    
}

event KickIdler(PlayerController PC)
{
    Log("Kicking idle player " $ PC.PlayerReplicationInfo.PlayerName);
    AccessControl.DefaultKickReason = AccessControl.IdleKickReason;
    AccessControl.KickPlayer(PC);
    AccessControl.DefaultKickReason = AccessControl.default.DefaultKickReason;
    //return;    
}

function InitGameReplicationInfo()
{
    GameReplicationInfo.bTeamGame = bTeamGame;
    GameReplicationInfo.GameName = GameName;
    GameReplicationInfo.GameClass = string(Class);
    GameReplicationInfo.SetMaxLives(MaxLives);
    GameReplicationInfo.RespawnTime = RespawnTime;
    //return;    
}

function InitVoiceReplicationInfo()
{
    Log((string(Name) @ "VoiceReplicationInfo created:") @ string(VoiceReplicationInfo), 'VoiceChat');
    //return;    
}

function InitMaplistHandler()
{
    //return;    
}

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
    //return;    
}

function int GetNumPlayers()
{
    return NumPlayers;
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    local Mutator M;
    local GameRules G;
    local int i, Len, NumMutators;
    local string MutatorName;
    local bool bFound;

    AddServerDetail(ServerState, "ServerMode", Eval(int(Level.NetMode) == int(NM_ListenServer), "non-dedicated", "dedicated"));
    AddServerDetail(ServerState, "AdminName", GameReplicationInfo.AdminName);
    AddServerDetail(ServerState, "AdminEmail", GameReplicationInfo.AdminEmail);
    AddServerDetail(ServerState, "ServerVersion", Level.EngineVersion);
    // End:0xF8
    if((AccessControl != none) && AccessControl.RequiresPassword())
    {
        AddServerDetail(ServerState, "GamePassword", "True");
    }
    AddServerDetail(ServerState, "GameStats", string(GameStats != none));
    // End:0x160
    if((AllowGameSpeedChange()) && GameSpeed != 1.0000000)
    {
        AddServerDetail(ServerState, "GameSpeed", string(float(int(GameSpeed * float(100))) / 100.0000000));
    }
    AddServerDetail(ServerState, "MaxSpectators", string(MaxSpectators));
    // End:0x1A0
    if(VotingHandler != none)
    {
        VotingHandler.GetServerDetails(ServerState);
    }
    M = BaseMutator;
    J0x1AB:

    // End:0x1E8 [Loop If]
    if(M != none)
    {
        M.GetServerDetails(ServerState);
        NumMutators++;
        M = M.NextMutator;
        // [Loop Continue]
        goto J0x1AB;
    }
    G = GameRulesModifiers;
    J0x1F3:

    // End:0x229 [Loop If]
    if(G != none)
    {
        G.GetServerDetails(ServerState);
        G = G.NextGameRules;
        // [Loop Continue]
        goto J0x1F3;
    }
    i = 0;
    J0x230:

    // End:0x279 [Loop If]
    if(i < ServerState.ServerInfo.Length)
    {
        // End:0x26F
        if(ServerState.ServerInfo[i].key ~= "Mutator")
        {
            NumMutators--;
        }
        i++;
        // [Loop Continue]
        goto J0x230;
    }
    // End:0x3AE
    if(NumMutators > 1)
    {
        M = BaseMutator.NextMutator;
        J0x298:

        // End:0x3AE [Loop If]
        if(M != none)
        {
            MutatorName = M.GetHumanReadableName();
            i = 0;
            J0x2BF:

            // End:0x32D [Loop If]
            if(i < ServerState.ServerInfo.Length)
            {
                // End:0x323
                if((ServerState.ServerInfo[i].Value ~= MutatorName) && ServerState.ServerInfo[i].key ~= "Mutator")
                {
                    bFound = true;
                    // [Explicit Break]
                    goto J0x32D;
                }
                i++;
                // [Loop Continue]
                goto J0x2BF;
            }
            J0x32D:

            // End:0x397
            if(!bFound)
            {
                Len = ServerState.ServerInfo.Length;
                ServerState.ServerInfo.Length = Len + 1;
                ServerState.ServerInfo[i].key = "Mutator";
                ServerState.ServerInfo[i].Value = MutatorName;
            }
            M = M.NextMutator;
            // [Loop Continue]
            goto J0x298;
        }
    }
    //return;    
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

    // End:0x1C7 [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0x1B0
        if(((PRI != none) && !PRI.bBot) && MessagingSpectator(C) == none)
        {
            ServerState.PlayerInfo.Length = i + 1;
            ServerState.PlayerInfo[i].PlayerNum = C.PlayerNum;
            ServerState.PlayerInfo[i].PlayerName = PRI.PlayerName;
            ServerState.PlayerInfo[i].Score = int(PRI.Score);
            ServerState.PlayerInfo[i].Ping = 4 * PRI.Ping;
            // End:0x1A9
            if(bTeamGame && PRI.Team != none)
            {
                ServerState.PlayerInfo[i].StatsID = ServerState.PlayerInfo[i].StatsID | TeamFlag[PRI.Team.TeamIndex];
            }
            i++;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x44;
    }
    M = BaseMutator.NextMutator;
    J0x1DB:

    // End:0x211 [Loop If]
    if(M != none)
    {
        M.GetServerPlayers(ServerState);
        M = M.NextMutator;
        // [Loop Continue]
        goto J0x1DB;
    }
    //return;    
}

function int GetServerPort()
{
    local string S;
    local int i;

    S = Level.GetAddressURL();
    i = InStr(S, ":");
    assert(i >= 0);
    return int(Mid(S, i + 1));
    //return;    
}

function bool SetPause(bool bPause, PlayerController P)
{
    // End:0xA0
    if((bPauseable || bAdminCanPause && P.IsA('Admin') || P.PlayerReplicationInfo.bAdmin) || int(Level.NetMode) == int(NM_Standalone))
    {
        // End:0x8B
        if(bPause)
        {
            Level.Pauser = P.PlayerReplicationInfo;            
        }
        else
        {
            Level.Pauser = none;
        }
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool AllowGameSpeedChange()
{
    // End:0x1E
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return true;        
    }
    else
    {
        return bAllowMPGameSpeed;
    }
    //return;    
}

function SetGameSpeed(float t)
{
    // End:0x38
    if(!AllowGameSpeedChange())
    {
        Level.TimeDilation = 1.1000000;
        GameSpeed = 1.0000000;
        default.GameSpeed = GameSpeed;        
    }
    else
    {
        SetSpeed(t);
    }
    SetTimer(Level.TimeDilation, true);
    //return;    
}

function SetSpeed(float t)
{
    local float OldSpeed;

    OldSpeed = GameSpeed;
    GameSpeed = FMax(t, 0.0100000);
    Level.TimeDilation = 1.1000000 * GameSpeed;
    // End:0x61
    if(GameSpeed != OldSpeed)
    {
        default.GameSpeed = GameSpeed;
        Class'Engine_Decompressed.GameInfo'.static.StaticSaveConfig();
    }
    SetTimer(Level.TimeDilation, true);
    //return;    
}

exec function showrespawn()
{
    bLeaveRespawnLogInChatReal = !bLeaveRespawnLogInChatReal;
    clog("bLeaveRespawnLogInChatReal=" $ string(bLeaveRespawnLogInChatReal));
    //return;    
}

exec function gamesetspeed(float t)
{
    clog("gamesetspeed " $ string(t));
    SetSpeed(t);
    //return;    
}

exec function gamestop()
{
    SetSpeed(0.0000000);
    //return;    
}

exec function gamego()
{
    SetSpeed(1.0000000);
    //return;    
}

exec function SetRPPTime(float limit)
{
    local Pawn P;

    Log((("[GameInfo::SetRPPTime] limit=" $ string(limit)) $ ", fps=") $ string(1.0000000 / limit));
    // End:0x69
    foreach AllActors(Class'Engine_Decompressed.Pawn', P)
    {
        P.RepPawnPositionTime = limit;        
    }    
    //return;    
}

exec function SetRPPFPS(float fps)
{
    local Pawn P;

    Log((("[GameInfo::SetRPPFPS] fps=" $ string(fps)) $ ", time=") $ string(1.0000000 / fps));
    // End:0x6E
    foreach AllActors(Class'Engine_Decompressed.Pawn', P)
    {
        P.RepPawnPositionTime = 1.0000000 / fps;        
    }    
    //return;    
}

event DetailChange()
{
    local Actor A;
    local ZoneInfo Z;

    // End:0x76
    if(int(Level.DetailMode) == int(0))
    {
        // End:0x72
        foreach DynamicActors(Class'Engine_Decompressed.Actor', A)
        {
            // End:0x71
            if((A.bHighDetail || A.bSuperHighDetail) && !A.bGameRelevant)
            {
                A.Destroy();
            }            
        }                
    }
    else
    {
        // End:0xD5
        if(int(Level.DetailMode) == int(1))
        {
            // End:0xD4
            foreach DynamicActors(Class'Engine_Decompressed.Actor', A)
            {
                // End:0xD3
                if(A.bSuperHighDetail && !A.bGameRelevant)
                {
                    A.Destroy();
                }                
            }            
        }
    }
    // End:0xF5
    foreach AllActors(Class'Engine_Decompressed.ZoneInfo', Z)
    {
        Z.LinkToSkybox();        
    }    
    //return;    
}

static function bool GrabOption(out string Options, out string Result)
{
    // End:0x8A
    if(Left(Options, 1) == "?")
    {
        Result = Mid(Options, 1);
        // End:0x45
        if(InStr(Result, "?") >= 0)
        {
            Result = Left(Result, InStr(Result, "?"));
        }
        Options = Mid(Options, 1);
        // End:0x7D
        if(InStr(Options, "?") >= 0)
        {
            Options = Mid(Options, InStr(Options, "?"));            
        }
        else
        {
            Options = "";
        }
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

static function GetKeyValue(string Pair, out string key, out string Value)
{
    // End:0x44
    if(InStr(Pair, "=") >= 0)
    {
        key = Left(Pair, InStr(Pair, "="));
        Value = Mid(Pair, InStr(Pair, "=") + 1);        
    }
    else
    {
        key = Pair;
        Value = "";
    }
    //return;    
}

static function string ParseOption(string Options, string InKey)
{
    local string Pair, key, Value;

    J0x00:
    // End:0x40 [Loop If]
    if(GrabOption(Options, Pair))
    {
        GetKeyValue(Pair, key, Value);
        // End:0x3D
        if(key ~= InKey)
        {
            return Value;
        }
        // [Loop Continue]
        goto J0x00;
    }
    return "";
    //return;    
}

static function bool HasOption(string Options, string InKey)
{
    local string Pair, key, Value;

    J0x00:
    // End:0x3C [Loop If]
    if(GrabOption(Options, Pair))
    {
        GetKeyValue(Pair, key, Value);
        // End:0x39
        if(key ~= InKey)
        {
            return true;
        }
        // [Loop Continue]
        goto J0x00;
    }
    return false;
    //return;    
}

event InitGame(string Options, out string Error)
{
    local string InOpt, LeftOpt;
    local int pos;
    local Class<AccessControl> ACClass;
    local Class<GameRules> GRClass;
    local bool bIsTutorial;

    kMM = Level.GetMatchMaker();
    BTSend = kMM.kTcpChannel;
    TimeLimit = GetIntOption(Options, "TimeLimit", kMM.iTimeLimit);
    InOpt = ParseOption(Options, "SaveGame");
    // End:0x12D
    if((InOpt != "") && CurrentGameProfile == none)
    {
        CurrentGameProfile = LoadDataObject(Class'Engine_Decompressed.GameProfile', "GameProfile", InOpt);
        // End:0xCD
        if(CurrentGameProfile != none)
        {
            CurrentGameProfile.Initialize(self, InOpt);            
        }
        else
        {
            Log("SINGLEPLAYER GameInfo::InitGame failed to find GameProfile" @ InOpt);
        }
        // End:0x12D
        if(!CurrentGameProfile.bInLadderGame)
        {
            CurrentGameProfile = none;
        }
    }
    // End:0x157
    if((CurrentGameProfile == none) && Left(string(Level), 3) ~= "TUT")
    {
        bIsTutorial = true;
    }
    MaxPlayers = Clamp(GetIntOption(Options, "MaxPlayers", MaxPlayers), 0, 32);
    MaxSpectators = Clamp(GetIntOption(Options, "MaxSpectators", MaxSpectators), 0, 32);
    GameDifficulty = FMax(0.0000000, float(GetIntOption(Options, "Difficulty", int(GameDifficulty))));
    // End:0x215
    if((CurrentGameProfile != none) || bIsTutorial)
    {
        // End:0x20A
        if(CurrentGameProfile != none)
        {
            GameDifficulty = CurrentGameProfile.Difficulty;
        }
        SetGameSpeed(1.0000000);
    }
    AddMutator(MutatorClass);
    BroadcastClass = Class<BroadcastHandler>(DynamicLoadObject(BroadcastHandlerClass, Class'Core.Class'));
    default.BroadcastClass = BroadcastClass;
    BroadcastHandler = Spawn(BroadcastClass);
    InOpt = ParseOption(Options, "AccessControl");
    // End:0x29B
    if(InOpt != "")
    {
        ACClass = Class<AccessControl>(DynamicLoadObject(InOpt, Class'Core.Class'));
    }
    // End:0x2D7
    if(ACClass == none)
    {
        ACClass = Class<AccessControl>(DynamicLoadObject(AccessControlClass, Class'Core.Class'));
        // End:0x2D7
        if(ACClass == none)
        {
            ACClass = Class'Engine_Decompressed.AccessControl';
        }
    }
    LeftOpt = ParseOption(Options, "AdminName");
    InOpt = ParseOption(Options, "AdminPassword");
    // End:0x33E
    if((LeftOpt != "") && InOpt != "")
    {
        ACClass.default.bDontAddDefaultAdmin = true;
    }
    // End:0x3C0
    if((int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_DedicatedServer))
    {
        AccessControl = Spawn(ACClass);
        // End:0x3C0
        if(((AccessControl != none) && LeftOpt != "") && InOpt != "")
        {
            AccessControl.SetAdminFromURL(LeftOpt, InOpt);
        }
    }
    SetGameSpeed(1.0000000);
    InOpt = ParseOption(Options, "GameRules");
    // End:0x4EB
    if(InOpt != "")
    {
        Log("Game Rules" @ InOpt);
        J0x408:

        // End:0x4EB [Loop If]
        if(InOpt != "")
        {
            pos = InStr(InOpt, ",");
            // End:0x462
            if(pos > 0)
            {
                LeftOpt = Left(InOpt, pos);
                InOpt = Right(InOpt, (Len(InOpt) - pos) - 1);                
            }
            else
            {
                LeftOpt = InOpt;
                InOpt = "";
            }
            Log("Add game rules " $ LeftOpt);
            GRClass = Class<GameRules>(DynamicLoadObject(LeftOpt, Class'Core.Class'));
            // End:0x4E8
            if(GRClass != none)
            {
                // End:0x4D1
                if(GameRulesModifiers == none)
                {
                    GameRulesModifiers = Spawn(GRClass);                    
                }
                else
                {
                    GameRulesModifiers.AddGameRules(Spawn(GRClass));
                }
            }
            // [Loop Continue]
            goto J0x408;
        }
    }
    InOpt = ParseOption(Options, "Mutator");
    // End:0x5A0
    if(InOpt != "")
    {
        Log("Mutators" @ InOpt);
        J0x524:

        // End:0x5A0 [Loop If]
        if(InOpt != "")
        {
            pos = InStr(InOpt, ",");
            // End:0x57E
            if(pos > 0)
            {
                LeftOpt = Left(InOpt, pos);
                InOpt = Right(InOpt, (Len(InOpt) - pos) - 1);                
            }
            else
            {
                LeftOpt = InOpt;
                InOpt = "";
            }
            AddMutator(LeftOpt, true);
            // [Loop Continue]
            goto J0x524;
        }
    }
    // End:0x601
    if((CurrentGameProfile == none) && !bIsTutorial)
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
    if((InOpt != "") && AccessControl != none)
    {
        AccessControl.SetGamePassword(InOpt);
        Log("GamePassword" @ InOpt);
    }
    InOpt = ParseOption(Options, "AllowThrowing");
    // End:0x69E
    if(InOpt != "")
    {
        bAllowWeaponThrowing = bool(InOpt);
    }
    InOpt = ParseOption(Options, "AllowBehindview");
    // End:0x6DA
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
    //return;    
}

function AddMutator(string mutname, optional bool bUserAdded)
{
    local Class<Mutator> mutClass;
    local Mutator mut;

    // End:0x12
    if(!AllowMutator(mutname))
    {
        return;
    }
    mutClass = Class<Mutator>(DynamicLoadObject(mutname, Class'Core.Class'));
    // End:0x3A
    if(mutClass == none)
    {
        return;
    }
    // End:0x105
    if((mutClass.default.GroupName != "") && BaseMutator != none)
    {
        mut = BaseMutator;
        J0x67:

        // End:0x105 [Loop If]
        if(mut != none)
        {
            // End:0xEE
            if(mut.GroupName == mutClass.default.GroupName)
            {
                Log((("Not adding " $ string(mutClass)) $ " because already have a mutator in the same group - ") $ string(mut));
                return;
            }
            mut = mut.NextMutator;
            // [Loop Continue]
            goto J0x67;
        }
    }
    mut = BaseMutator;
    J0x110:

    // End:0x19A [Loop If]
    if(mut != none)
    {
        // End:0x183
        if(mut.Class == mutClass)
        {
            Log((("Not adding " $ string(mutClass)) $ " because this mutator is already added - ") $ string(mut));
            return;
        }
        mut = mut.NextMutator;
        // [Loop Continue]
        goto J0x110;
    }
    mut = Spawn(mutClass);
    // End:0x1B5
    if(mut == none)
    {
        return;
    }
    mut.bUserAdded = bUserAdded;
    // End:0x1E4
    if(BaseMutator == none)
    {
        BaseMutator = mut;        
    }
    else
    {
        BaseMutator.AddMutator(mut);
    }
    //return;    
}

function AddGameModifier(GameRules NewRule)
{
    // End:0x0D
    if(NewRule == none)
    {
        return;
    }
    // End:0x2F
    if(GameRulesModifiers != none)
    {
        GameRulesModifiers.AddGameRules(NewRule);        
    }
    else
    {
        GameRulesModifiers = NewRule;
    }
    //return;    
}

event string GetBeaconText()
{
    return (((((((Level.ComputerName $ " ") $ Left(Level.Title, 24)) $ "\\t") $ BeaconName) $ "\\t") $ string(GetNumPlayers())) $ "/") $ string(MaxPlayers);
    //return;    
}

function ProcessServerTravel(string URL, bool bItems)
{
    local PlayerController P, LocalPlayer;

    BaseMutator.ServerTraveling(URL, bItems);
    EndLogging("mapchange");
    Log("ProcessServerTravel:" @ URL);
    // End:0xCD
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', P)
    {
        // End:0xB2
        if(NetConnection(P.Player) != none)
        {
            P.ClientTravel(Eval(InStr(URL, "?") > 0, Left(URL, InStr(URL, "?")), URL), 2, bItems);
            // End:0xCC
            continue;
        }
        LocalPlayer = P;
        P.PreClientTravel();        
    }    
    // End:0x116
    if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.NetMode) != int(NM_ListenServer))
    {
        Level.NextSwitchCountdown = 0.0000000;
    }
    //return;    
}

event PreLogin(string Options, string Address, string PlayerID, out string Error, out string FailCode)
{
    local bool bSpectator;

    bSpectator = (ParseOption(Options, "SpectatorOnly")) ~= "1";
    // End:0x5F
    if(AccessControl != none)
    {
        AccessControl.PreLogin(Options, Address, PlayerID, Error, FailCode, bSpectator);
    }
    //return;    
}

function int GetIntOption(string Options, string ParseString, int CurrentValue)
{
    local string InOpt;

    InOpt = ParseOption(Options, ParseString);
    // End:0x2A
    if(InOpt != "")
    {
        return int(InOpt);
    }
    return CurrentValue;
    //return;    
}

function bool BecomeSpectator(PlayerController P)
{
    // End:0x7F
    if(((((P.PlayerReplicationInfo == none) || !GameReplicationInfo.bMatchHasBegun) || NumSpectators >= MaxSpectators) || P.IsInState('GameEnded')) || P.IsInState('RoundEnded'))
    {
        P.ReceiveLocalizedMessage(GameMessageClass, 12);
        return false;
    }
    // End:0xA7
    if(GameStats != none)
    {
        GameStats.DisconnectEvent(P.PlayerReplicationInfo);
    }
    P.PlayerReplicationInfo.bOnlySpectator = true;
    NumSpectators++;
    NumPlayers--;
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
    // End:0x23
    if(P.IsInState('RoundEnded'))
    {
        return false;
    }
    // End:0xA0
    if(((((P.PlayerReplicationInfo == none) || !GameReplicationInfo.bMatchHasBegun) || bMustJoinBeforeStart) || (MaxLives > 0) && P.PlayerReplicationInfo.NumLives >= MaxLives) || P.IsInState('GameEnded'))
    {
        return false;
    }
    return true;
    //return;    
}

function bool AtCapacity(bool bSpectator)
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return false;
    }
    // End:0x5C
    if(bSpectator)
    {
        return (NumSpectators >= MaxSpectators) && (int(Level.NetMode) != int(NM_ListenServer)) || NumPlayers > 0;        
    }
    else
    {
        return (MaxPlayers > 0) && NumPlayers >= MaxPlayers;
    }
    //return;    
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
        Level.ObjectPool = new (XLevel) Class'Engine_Decompressed.ObjectPool';
    }
    //return;    
}

function Pawn GetPawn4ChangeHost(string nn)
{
    local Pawn P;

    // End:0x1E
    if(!bChangedHost || nn == "")
    {
        return none;        
    }
    else
    {
        // End:0x64
        foreach DynamicActors(Class'Engine_Decompressed.Pawn', P)
        {
            // End:0x63
            if((P.LoginName == nn) && P.Health > 0)
            {                
                return P;
            }            
        }        
    }
    return none;
    //return;    
}

function byte PopNextTeam()
{
    return TeamQueue++;
    //return;    
}

function bool CheckOverlapUserName(string LoginedUserName, out string ErrMsg)
{
    local Controller C;
    local PlayerController PC_ForCheckName;

    // End:0x0E
    if(LoginedUserName == "")
    {
        return true;
    }
    C = Level.ControllerList;
    J0x22:

    // End:0xF4 [Loop If]
    if(C != none)
    {
        PC_ForCheckName = PlayerController(C);
        // End:0xDD
        if(PC_ForCheckName != none)
        {
            // End:0xDD
            if(PC_ForCheckName.LoginName ~= LoginedUserName)
            {
                Log(((("GameInfo::Login() PC_ForCheckName.LoginName:" $ PC_ForCheckName.LoginName) $ " ~= LoginedUserName:") $ LoginedUserName) $ " same!!");
                ErrMsg = GetErrMsg(5110);
                return false;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x22;
    }
    return true;
    //return;    
}

function Class<WaitView> GetWaitViewClass(byte Team)
{
    return Class'Engine_Decompressed.WaitViewNoTeam';
    //return;    
}

function WaitView GetWaitView(Class<WaitView> classWaitView)
{
    local int lp1;
    local WaitView wv;
    local array<WaitView> candidates;

    // End:0x30
    if(WaitViews.Length == 0)
    {
        // End:0x2F
        foreach AllActors(Class'Engine_Decompressed.WaitView', wv)
        {
            WaitViews[WaitViews.Length] = wv;            
        }        
    }
    lp1 = 0;
    J0x37:

    // End:0x8C [Loop If]
    if(lp1 < WaitViews.Length)
    {
        wv = WaitViews[lp1];
        // End:0x82
        if(wv.Class == classWaitView)
        {
            candidates[candidates.Length] = wv;
        }
        lp1++;
        // [Loop Continue]
        goto J0x37;
    }
    // End:0x9D
    if(candidates.Length == 0)
    {
        return none;        
    }
    else
    {
        return candidates[Rand(candidates.Length)];
    }
    //return;    
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local NavigationPoint StartSpot;
    local PlayerController NewPlayer, TestPlayer;
    local string InName, InAdminName, InPassword, InChecksum, InCharacter, InSex,
	    InIntervention;

    local byte inTeam, iSellectTeam;
    local bool bSpectator, bAdmin;
    local Class<Security> MySecurityClass;
    local Pawn TestPawn, OldPawn;
    local WaitView startWaitView;
    local bool bAdminSpectator;

    Log("[GameInfo::Login] Options=" $ Options);
    clog("[GameInfo::Login] Options=" $ Options);
    Options = StripColor(Options);
    BaseMutator.ModifyLogin(Portal, Options);
    InName = Left(ParseOption(Options, "Name"), 20);
    Log("[GameInfo::Login] InName=" $ InName);
    // End:0xDE
    if(bTeamGame)
    {
        inTeam = byte(GetIntOption(Options, "Team", 255));        
    }
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
    // End:0x22B
    if((CheckOverlapUserName(InName, Error)) == false)
    {
        Log(((("GameInfo::CheckOverlapUserName(InName:" $ InName) $ ", Error:") $ Error) $ " ) return false!!");
        return none;
    }
    // End:0x316
    if(HasOption(Options, "Load"))
    {
        Log("Loading Savegame");
        InitSavedLevel();
        bIsSaveGame = true;
        // End:0x315
        foreach DynamicActors(Class'Engine_Decompressed.PlayerController', TestPlayer)
        {
            // End:0x314
            if((TestPlayer.Player == none) && TestPlayer.PlayerOwnerName ~= InName)
            {
                TestPawn = TestPlayer.Pawn;
                // End:0x2E1
                if(TestPawn != none)
                {
                    TestPawn.SetRotation(TestPawn.Controller.Rotation);
                }
                Log(("FOUND " $ string(TestPlayer)) @ TestPlayer.PlayerReplicationInfo.PlayerName);                
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
    inTeam = byte(GetTeamID_by_Balancing(int(inTeam), none));
    StartSpot = FindPlayerStart(none, inTeam, Portal);
    // End:0x3E1
    if(StartSpot == none)
    {
        Error = GameMessageClass.default.FailedPlaceMessage;
        return none;
    }
    Log("[GameInfo::Login] PlayerController");
    // End:0x42D
    if(PlayerControllerClass == none)
    {
        PlayerControllerClass = Class<PlayerController>(DynamicLoadObject(PlayerControllerClassName, Class'Core.Class'));
    }
    Log("[GameInfo::Login] Spawn");
    OldPawn = GetPawn4ChangeHost(InName);
    // End:0x4E4
    if(OldPawn == none)
    {
        startWaitView = GetWaitView(GetWaitViewClass(inTeam));
        // End:0x4B5
        if(startWaitView == none)
        {
            NewPlayer = Spawn(PlayerControllerClass,,, StartSpot.Location, StartSpot.Rotation);            
        }
        else
        {
            NewPlayer = Spawn(PlayerControllerClass,,, startWaitView.Location, startWaitView.Rotation);
        }        
    }
    else
    {
        NewPlayer = Spawn(PlayerControllerClass,,, OldPawn.Location, OldPawn.Rotation);
    }
    // End:0x57A
    if(NewPlayer == none)
    {
        Log("[GameInfo::Login] Couldn't spawn player controller of class " $ string(PlayerControllerClass));
        Error = GameMessageClass.default.FailedSpawnMessage;
        return none;
    }
    // End:0x5CE
    if(Level.GetMatchMaker().BotTutorial || Level.GetMatchMaker().BeginnerMode)
    {
        NewPlayer.PlayerReplicationInfo.bCanSeeEnemiesOnMinimap = true;
    }
    RefreshMaxPlayersDuringGame();
    NewPlayer.bFreeView = Level.GetMatchMaker().bFreeView;
    NewPlayer.StartSpot = StartSpot;
    NewPlayer.GameReplicationInfo = GameReplicationInfo;
    Log("[GameInfo::Login] Security");
    MySecurityClass = Class<Security>(DynamicLoadObject(SecurityClass, Class'Core.Class'));
    // End:0x6D2
    if(MySecurityClass != none)
    {
        NewPlayer.PlayerSecurity = Spawn(MySecurityClass, NewPlayer);
        // End:0x6CF
        if(NewPlayer.PlayerSecurity == none)
        {
            Log("Could not spawn security for player " $ string(NewPlayer), 'Security');
        }        
    }
    else
    {
        // End:0x72D
        if(SecurityClass == "")
        {
            Log("No value for Engine.GameInfo.SecurityClass -- System is not secure.", 'Security');            
        }
        else
        {
            Log(("Unknown security class [" $ SecurityClass) $ "] -- System is not secure.", 'Security');
        }
    }
    // End:0x78F
    if(bAttractCam)
    {
        NewPlayer.GotoState('AttractMode');        
    }
    else
    {
        // End:0x7C7
        if((int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
        {
            NewPlayer.GotoState('SpectatingGM');            
        }
        else
        {
            NewPlayer.GotoState('Spectating');
        }
    }
    // End:0x827
    if(InName == "")
    {
        InName = DefaultPlayerName;
        Log("[GameInfo::Login] init player's name - InName=" $ InName);
    }
    // End:0x874
    if((int(Level.NetMode) != int(NM_Standalone)) || NewPlayer.PlayerReplicationInfo.PlayerName == DefaultPlayerName)
    {
        ChangeName(NewPlayer, InName, false);
    }
    NewPlayer.PlayerReplicationInfo.bAdminSpecator = bAdminSpectator;
    NewPlayer.PlayerReplicationInfo.LoadLevelMark();
    InCharacter = ParseOption(Options, "Character");
    NewPlayer.SetPawnClass(DefaultPlayerClassName, InCharacter);
    InSex = ParseOption(Options, "Sex");
    NewPlayer.PlayerReplicationInfo.PlayerID = CurrentID++;
    NewPlayer.PlayerReplicationInfo.SideID = GetTeamID_by_Balancing(int(iSellectTeam), none);
    // End:0x9D1
    if((int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
    {
        Log((("##GMLOG: Make GM - " $ InName) $ "  ") $ string(NewPlayer.PlayerReplicationInfo.bAdminSpecator));
        NewPlayer.DoServerViewNextPlayer = true;
        NewPlayer.GotoState('SpectatingGM');
        NumSpectators++;
        return NewPlayer;        
    }
    else
    {
        // End:0xA6C
        if((bSpectator || NewPlayer.PlayerReplicationInfo.bOnlySpectator) || !ChangeTeam(NewPlayer, int(inTeam), false))
        {
            NewPlayer.PlayerReplicationInfo.bOnlySpectator = true;
            NewPlayer.PlayerReplicationInfo.bIsSpectator = true;
            NewPlayer.PlayerReplicationInfo.bOutOfLives = true;
            NumSpectators++;
            return NewPlayer;
        }
    }
    myTeamMM = Level.GetMatchMaker();
    // End:0xACF
    if(int(Level.NetMode) == int(NM_ListenServer))
    {
        // End:0xACC
        if(Level.GetLocalPlayerController() == none)
        {
            NewPlayer.SpawnInLogin(myTeamMM.My_iTeam);
        }        
    }
    else
    {
        // End:0xB20
        if((int(Level.NetMode) == int(NM_Client)) || int(Level.NetMode) == int(NM_Standalone))
        {
            NewPlayer.SpawnInLogin(myTeamMM.My_iTeam);
        }
    }
    NewPlayer.StartSpot = StartSpot;
    // End:0xB7B
    if((AccessControl != none) && AccessControl.AdminLogin(NewPlayer, InAdminName, InPassword))
    {
        AccessControl.AdminEntered(NewPlayer, InAdminName);
    }
    NumPlayers++;
    // End:0xBAA
    if(InIntervention == "0")
    {
        NumPlayersFromStart++;
        NewPlayer.bPlayFromStart = true;        
    }
    else
    {
        // End:0xBCB
        if(InIntervention == "1")
        {
            SetPRI4Intervention(NewPlayer.PlayerReplicationInfo);
        }
    }
    // End:0xBDF
    if(NumPlayers > 20)
    {
        bLargeGameVOIP = true;
    }
    bWelcomePending = true;
    // End:0xBF6
    if(bTestMode)
    {
        TestLevel();
    }
    // End:0xC42
    if(bDelayedStart)
    {
        // End:0xC2C
        if(IsNewPlayerGotoSpectating())
        {
            NewPlayer.DoServerViewNextPlayer = true;
            NewPlayer.GotoState('Spectating');            
        }
        else
        {
            NewPlayer.GotoState('PlayerWaiting');
        }
        return NewPlayer;
    }
    return NewPlayer;
    //return;    
}

function bool IsNewPlayerGotoSpectating()
{
    return false;
    //return;    
}

function SetPRI4Intervention(PlayerReplicationInfo PRI)
{
    PRI.IsIntervented = true;
    PRI.ElapsedTimeWhenIntervented = GameReplicationInfo.ElapsedTime;
    //return;    
}

event ForcedStartMatch()
{
    //return;    
}

event bool SetPlayerID(PlayerController P)
{
    P.PlayerReplicationInfo.PlayerID = CurrentID++;
    return true;
    //return;    
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
    // End:0xDF
    if(int(NewPlayer.RemoteRole) == int(ROLE_AutonomousProxy))
    {
        Log(("[CYH] GameInfo::SimpleLogin() SimpleLoginedClientNum[" $ string(SimpleLoginedClientNum)) $ "]");
        SimpleLoginedClientNum++;
        GotoNextGameState();
    }
    // End:0x131
    if(int(NewPlayer.RemoteRole) == int(ROLE_AutonomousProxy))
    {
        NewPlayer.ClientSetGRITimes(GameReplicationInfo.RemainingTime, GameReplicationInfo.ElapsedTime, GameReplicationInfo.RemainingMinute);
    }
    bFoundOldPRI = false;
    // End:0x29D
    foreach DynamicActors(Class'Engine_Decompressed.PlayerReplicationInfo', PRI)
    {
        Log((((("GameInfo::SimpleLogin() search PRI[" $ PRI.PlayerName) $ "] RemoteRole=") $ string(PRI.RemoteRole)) $ " nOldActor=") $ string(PRI.nOldActor));
        // End:0x29C
        if((PRI.PlayerName == NewPlayer.LoginName) && PRI.nOldActor > 0)
        {
            Log(("Find PRI[" $ PRI.PlayerName) $ "]");
            NewPlayer.DestroyPlayerReplicationInfo();
            NewPlayer.PlayerReplicationInfo = PRI;
            NewPlayer.PlayerReplicationInfo.ForceBegin();
            NewPlayer.InitPlayerReplicationInfo();
            NewPlayer.PlayerReplicationInfo.SetOwner(NewPlayer);
            bFoundOldPRI = true;
            PRI.nOldActor--;
            // End:0x29D
            break;
        }        
    }    
    // End:0x372
    if((bFoundOldPRI == false) && NewPlayer.PlayerReplicationInfo == none)
    {
        Log("GameInfo::SimpleLogin() Not Found Old PRI" $ NewPlayer.LoginName);
        // End:0x323
        if(NewPawn != none)
        {
            NewPawn.UnPossessed();
            NewPawn.Destroy();
        }
        NewPlayer.PlayerReplicationInfo = Spawn(NewPlayer.PlayerReplicationInfoClass, NewPlayer,, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
        NewPlayer.InitPlayerReplicationInfo();
    }
    // End:0x489
    foreach DynamicActors(Class'Engine_Decompressed.wGameStateStorageSender', GSSS)
    {
        Log("[CYH] GameInfo::SimpleLogin() search GSSS.UserID=" $ string(GSSS.UserID));
        // End:0x488
        if(GSSS.UserID == NewPlayer.IDNum)
        {
            Log(("[CYH] GameInfo::SimpleLogin() Find GSSS[" $ string(GSSS.UserID)) $ "]");
            NewPlayer.GSSS = GSSS;
            // End:0x485
            if(int(NewPlayer.RemoteRole) == int(ROLE_AutonomousProxy))
            {
                NewPlayer.GSSS.Initialize(NewPlayer.IDNum, NewPlayer);
            }
            // End:0x489
            break;
        }        
    }    
    // End:0x586
    if(NewPlayer.GSSS == none)
    {
        Log("GameInfo::SimpleLogin() not find GSSS");
        Log("NewPlayer.IDNum=" $ string(NewPlayer.IDNum));
        // End:0x54E
        foreach DynamicActors(Class'Engine_Decompressed.wGameStateStorageSender', GSSS)
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
    // End:0x5BD
    if(NewPawn == none)
    {
        Log("NewPawn == none" $ NewPlayer.PlayerReplicationInfo.PlayerName);
    }
    // End:0xB1D
    if(NewPawn != none)
    {
        Log("[CYH] GameInfo::SimpleLogin() Exist NewPawn" $ NewPlayer.PlayerReplicationInfo.PlayerName);
        OldHealth = NewPawn.Health;
        OldLocation = NewPawn.Location;
        OldRotation = NewPawn.Rotation;
        oldUseKey = NewPawn.byUseKey;
        NewPawn.UnPossessed();
        NewPawn.Destroy();
        // End:0x70F
        if(NewPlayer.Pawn != none)
        {
            Log("[CYH] GameInfo::SimpleLogin() NewPlayer.Pawn is not none. why??");
            NewPlayer.Pawn.UnPossessed();
            NewPlayer.Pawn.Destroy();
            NewPlayer.Pawn = none;
        }
        Log(("[CYH] GameInfo::SimpleLogin() OldHeadlth[" $ string(OldHealth)) $ "]");
        // End:0xAC3
        if((NewPlayer.PawnClass != none) && OldHealth > 0)
        {
            NewPlayer.Pawn = Spawn(NewPlayer.PawnClass,,, OldLocation, OldRotation);
            // End:0x8C8
            if(NewPlayer.Pawn == none)
            {
                Log("[GameInfo::SimpleLogin] looking for nav alternatives");
                SortNavigationPoints2(OldLocation, navs, dists);
                lp1 = 0;
                J0x7FF:

                // End:0x8C8 [Loop If]
                if(lp1 < navs.Length)
                {
                    Log("[GameInfo::SimpleLogin] trying " $ string(nav));
                    nav = navs[lp1];
                    NewPlayer.Pawn = Spawn(NewPlayer.PawnClass,,, nav.Location, OldRotation);
                    // End:0x8BE
                    if(NewPlayer.Pawn != none)
                    {
                        Log("[GameInfo::SimpleLogin] successful");
                        // [Explicit Break]
                        goto J0x8C8;
                    }
                    lp1++;
                    // [Loop Continue]
                    goto J0x7FF;
                }
            }
            J0x8C8:

            NewPlayer.Pawn.byUseKey = oldUseKey;
            // End:0x93E
            if(NewPlayer.Pawn == none)
            {
                Log("[GameInfo::SimpleLogin] spawn failed " $ NewPlayer.PlayerReplicationInfo.PlayerName);                
            }
            else
            {
                NewPlayer.PlayerReplicationInfo.bCannotChangeQS = true;
                Log("bCannotChangeQS=true for " $ NewPlayer.PlayerReplicationInfo.PlayerName);
                NewPlayer.TimeMargin = -0.1000000;
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
        else
        {
            Log("GameInfo::SimpleLogin() NewPlayer.PawnClass is none. error!! " $ NewPlayer.PlayerReplicationInfo.PlayerName);
        }
    }
    NewPlayer.GotoState('ChangedHost');
    return true;
    //return;    
}

function GotoNextGameState()
{
    // End:0x5C
    if((Level.GetMatchMaker().ReconnectClientNum > 0) && Level.GetMatchMaker().ReconnectClientNum == SimpleLoginedClientNum)
    {
        // End:0x59
        if((CheckEndGameCondition()) == false)
        {
            ChangedHostCompleteCountDown = ChangedHostCompleteCountDown_Initial;
        }        
    }
    else
    {
        // End:0xDA
        if(Level.GetMatchMaker().ReconnectClientNum < SimpleLoginedClientNum)
        {
            Log("[CYH] GameInfo::GotoNextGameState() ReconnectClientNum < SimpleLoginedClientNum. error!!");
        }
    }
    Log((("[CYH] GameInfo::GotoNextGameState() Simple Logined Client Num:" $ string(SimpleLoginedClientNum)) $ " ReConnectClient:") $ string(Level.GetMatchMaker().ReconnectClientNum));
    //return;    
}

function ContinueMatch()
{
    //return;    
}

function TestLevel()
{
    local Actor A, Found;
    local bool bFoundErrors;

    // End:0x53
    foreach AllActors(Class'Engine_Decompressed.Actor', A)
    {
        bFoundErrors = bFoundErrors || A.CheckForErrors();
        // End:0x52
        if(bFoundErrors && Found == none)
        {
            Found = A;
        }        
    }    
    // End:0x6C
    if(bFoundErrors)
    {
        Found.Crash();
    }
    //return;    
}

function StartMatch()
{
    local Actor A;

    Log("[GameInfo::StartMatch]");
    SupplyRandIndex = -1;
    // End:0x3F
    if(GameStats != none)
    {
        GameStats.StartGame();
    }
    // End:0x5F
    foreach AllActors(Class'Engine_Decompressed.Actor', A)
    {
        A.MatchStarting();        
    }    
    StartHumanPlayers();
    StartAIPlayers();
    // End:0x7D
    if(!bManuallyBeginWaitingForStart)
    {
        BeginWaitingForStart();
    }
    bWaitingToStartMatch = false;
    GameReplicationInfo.bMatchHasBegun = true;
    //return;    
}

function StartHumanPlayers()
{
    local Controller P;
    local array<int> aPlayerIDs;
    local int i, PlayerID;

    P = Level.ControllerList;
    J0x14:

    // End:0x25E [Loop If]
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
            else
            {
                // End:0x85
                if(bGameEnded)
                {
                    return;                    
                }
                else
                {
                    // End:0x131
                    if(PlayerController(P).CanRestartPlayer())
                    {
                        clog((((("[StartHumanPlayers] name=" $ P.PlayerReplicationInfo.PlayerName) $ " max") $ string(Level.Game.GameReplicationInfo.MaxLives)) $ " num=") $ string(P.PlayerReplicationInfo.NumLives));
                        RestartPlayer(P);
                    }
                }
                PlayerController(P).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_BGM', Class'Engine_Decompressed.wMessage_BGM'.default.Code_Start);
                // End:0x247
                if(((BTSend != none) && P.PlayerReplicationInfo != none) && !P.PlayerReplicationInfo.IsSendGameStartTime)
                {
                    PlayerID = P.PlayerReplicationInfo.GetUID();
                    // End:0x247
                    if(PlayerID != -1)
                    {
                        aPlayerIDs[aPlayerIDs.Length] = PlayerID;
                        P.PlayerReplicationInfo.IsSendGameStartTime = true;
                        Log((("[StartHumanPlayers::aPlayerIDs :" $ string(PlayerID)) $ "/playerNmae:") $ P.PlayerReplicationInfo.PlayerName);
                    }
                }
            }
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    // End:0x367
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_SetGameStartTime(aPlayerIDs);
        Log("[StartHumanPlayers::BTSend.sfReqGamePlay_SetGameStartTime] aPlayerIDs Count:" $ string(aPlayerIDs.Length));
        i = 0;
        J0x2DE:

        // End:0x367 [Loop If]
        if(i < aPlayerIDs.Length)
        {
            Log((("[StartHumanPlayers::BTSend.sfReqGamePlay_SetGameStartTime] Count:" $ string(i + 1)) $ "aPlayerIDs:") $ string(aPlayerIDs[i]));
            i++;
            // [Loop Continue]
            goto J0x2DE;
        }
    }
    //return;    
}

function StartAIPlayers()
{
    local Controller P;

    P = Level.ControllerList;
    J0x14:

    // End:0x9C [Loop If]
    if(P != none)
    {
        // End:0x85
        if(P.bIsPlayer && !P.IsA('PlayerController'))
        {
            // End:0x70
            if(int(Level.NetMode) == int(NM_Standalone))
            {
                RestartPlayer(P);                
            }
            else
            {
                P.GotoState('Dead', 'MPStart');
            }
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function bool PlayerCanRestart(PlayerController aPlayer)
{
    return true;
    //return;    
}

function bool PlayerCanRestartGame(PlayerController aPlayer)
{
    return true;
    //return;    
}

function GameAddDefaultInventory(Pawn P)
{
    Log("[GameInfo::GameAddDefaultInventory]");
    AddDefaultInventory(P);
    //return;    
}

exec function logrep()
{
    local Actor A;

    Log("[GameInfo::logrep]");
    // End:0xCB
    foreach AllActors(Class'Engine_Decompressed.Actor', A)
    {
        Log((((((("    rep_func_cnt:" $ string(A.FunctionReplicateCount)) $ " rep_var_cnt:") $ string(A.VariableReplicateCount)) $ "  class=") $ string(A.Class)) $ " name=") $ string(A.Name));
        A.FunctionReplicateCount = 0;
        A.VariableReplicateCount = 0;        
    }    
    //return;    
}

function RefreshMaxPlayersDuringGame()
{
    local PlayerController PC;

    GameReplicationInfo.MaxPlayersDuringGame = 0;
    // End:0x31
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', PC)
    {
        GameReplicationInfo.MaxPlayersDuringGame++;        
    }    
    Log("[GameInfo::RefreshMaxPlayersDuringGame]" @ string(GameReplicationInfo.MaxPlayersDuringGame));
    //return;    
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
    // End:0xD7
    if((bRestartLevel && int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.NetMode) != int(NM_ListenServer))
    {
        Log((("[GameInfo::RestartPlayer] RestartLevel=" $ string(bRestartLevel)) $ " Level.NetMode=") $ string(Level.NetMode));
        return;
    }
    // End:0x11F
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
    // End:0x1B4
    if((aPlayer.PlayerReplicationInfo == none) || aPlayer.PlayerReplicationInfo.Team == none)
    {
        TeamNum = 255;        
    }
    else
    {
        TeamNum = aPlayer.PlayerReplicationInfo.Team.TeamIndex;
    }
    Log((("[CYH] GameInfo::RestartPlayer() aPlayer.PawnClass:" $ string(aPlayer.PawnClass)) $ " name=") $ aPlayer.PlayerReplicationInfo.PlayerName);
    tries = 0;
    J0x24C:

    // End:0x5B9 [Loop If]
    if(true)
    {
        Log("tries:" @ string(tries));
        // End:0x2BB
        if(false == aPlayer.bUseDynamicRegenLocation)
        {
            StartSpot = FindPlayerStart(aPlayer, byte(TeamNum));
            // End:0x2BB
            if(StartSpot == none)
            {
                Log(" Player start not found!!!");
                return;
            }
        }
        // End:0x306
        if((aPlayer.PreviousPawnClass != none) && aPlayer.PawnClass != aPlayer.PreviousPawnClass)
        {
            BaseMutator.PlayerChangedClass(aPlayer);
        }
        // End:0x3AB
        if(aPlayer.PawnClass != none)
        {
            // End:0x36D
            if(aPlayer.bUseDynamicRegenLocation)
            {
                aPlayer.Pawn = Spawn(aPlayer.PawnClass,,, aPlayer.Location, aPlayer.Rotation);                
            }
            else
            {
                aPlayer.Pawn = Spawn(aPlayer.PawnClass,,, StartSpot.Location, StartSpot.Rotation);
            }
        }
        // End:0x539
        if((false == aPlayer.bUseDynamicRegenLocation) && aPlayer.Pawn == none)
        {
            Log("Spawn Failed in initial attempts");
            ps = PlayerStart(StartSpot);
            // End:0x536
            if(ps != none)
            {
                Log("trying satellites");
                lp1 = 0;
                J0x431:

                // End:0x4E5 [Loop If]
                if(lp1 < ps.Satellites.Length)
                {
                    Log("  " $ string(ps.Satellites[lp1]));
                    aPlayer.Pawn = Spawn(aPlayer.PawnClass,,, ps.Satellites[lp1].Location, ps.Satellites[lp1].Rotation);
                    // End:0x4DB
                    if(aPlayer.Pawn != none)
                    {
                        // [Explicit Break]
                        goto J0x4E5;
                    }
                    lp1++;
                    // [Loop Continue]
                    goto J0x431;
                }
                J0x4E5:

                // End:0x536
                if(aPlayer.Pawn == none)
                {
                    Log("  ASF: all satellites failed");
                    ps.LastSpawnFailTime = Level.TimeSeconds;
                }
            }            
        }
        else
        {
            aPlayer.PlayerReplicationInfo.bCannotChangeQS = false;
            Log("bCannotChangeQS=false for " $ aPlayer.PlayerReplicationInfo.PlayerName);
        }
        tries++;
        // End:0x5B6
        if((aPlayer.Pawn != none) || tries > 5)
        {
            // [Explicit Break]
            goto J0x5B9;
        }
        // [Loop Continue]
        goto J0x24C;
    }
    J0x5B9:

    aPlayer.Pawn.PrevLocation = aPlayer.Pawn.Location;
    aPlayer.Pawn.PrevInterpoLocation = aPlayer.Pawn.Location;
    aPlayer.Pawn.PrevMoveDir = MakeVector(0.0000000, 0.0000000, 0.0000000);
    // End:0x6BE
    if((float(aPlayer.Pawn.PrevTime) == 0.0000000) && aPlayer.PlayerReplicationInfo.bBot == false)
    {
        aPlayer.Pawn.PrevTime = PlayerController(aPlayer).GameReplicationInfo.RemainingTime;        
    }
    else
    {
        aPlayer.Pawn.PrevTime = Level.GetLocalPlayerController().myHUD.GetCurGameTime();
    }
    // End:0x744
    if(none != aPlayer.Caller)
    {
        aPlayer.Pawn.OwnerName = aPlayer.Caller.PlayerReplicationInfo.PlayerName;
    }
    CombatLog((((((((("[RESPAWN_EVENT] UserName=" $ aPlayer.PlayerReplicationInfo.PlayerName) $ " TeamIndex=") $ string(aPlayer.PlayerReplicationInfo.SideID)) $ " PosX=") $ string(aPlayer.Pawn.Location.X)) $ " PosY=") $ string(aPlayer.Pawn.Location.Y)) $ " PosZ=") $ string(aPlayer.Pawn.Location.Z));
    // End:0x902
    if(aPlayer.Pawn == none)
    {
        Log(("MRF: multiple respawn failed" $ " name=") $ aPlayer.PlayerReplicationInfo.PlayerName);
        Log((("Couldn't spawn player of type " $ string(aPlayer.PawnClass)) $ " at ") $ string(StartSpot));
        aPlayer.GotoState('Dead');
        // End:0x900
        if(PlayerController(aPlayer) != none)
        {
            PlayerController(aPlayer).ClientGotoState('Dead', 'Begin');
        }
        return;
    }
    Log("respawn successful name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    // End:0xA08
    if(false == aPlayer.bUseDynamicRegenLocation)
    {
        recentlySpawnedPoints[recentlySpawnedPoints.Length] = StartSpot;
        // End:0x973
        if(recentlySpawnedPoints.Length > 3)
        {
            recentlySpawnedPoints.Remove(0, 1);
        }
        // End:0xA08
        if(aPlayer.PlayerReplicationInfo.bNoTeam == false)
        {
            // End:0x9E1
            if(aPlayer.PlayerReplicationInfo.Team.TeamIndex == 0)
            {
                recentlySpawnedPointsTeamAF[recentlySpawnedPointsTeamAF.Length] = StartSpot;
                // End:0x9DE
                if(recentlySpawnedPointsTeamAF.Length > 3)
                {
                    recentlySpawnedPointsTeamAF.Remove(0, 1);
                }                
            }
            else
            {
                recentlySpawnedPointsTeamRSA[recentlySpawnedPointsTeamRSA.Length] = StartSpot;
                // End:0xA08
                if(recentlySpawnedPointsTeamRSA.Length > 3)
                {
                    recentlySpawnedPointsTeamRSA.Remove(0, 1);
                }
            }
        }
    }
    // End:0xA31
    if(PlayerController(aPlayer) != none)
    {
        PlayerController(aPlayer).TimeMargin = -0.1000000;
    }
    aPlayer.Pawn.Anchor = StartSpot;
    aPlayer.Pawn.LastStartSpot = PlayerStart(StartSpot);
    aPlayer.Pawn.LastStartTime = Level.TimeSeconds;
    aPlayer.PreviousPawnClass = aPlayer.Pawn.Class;
    aPlayer.Possess(aPlayer.Pawn);
    aPlayer.PawnClass = aPlayer.Pawn.Class;
    Log((("[GameInfo::RestartPlayer] " $ aPlayer.PlayerReplicationInfo.PlayerName) $ " NumLives++ at ") $ string(aPlayer.PlayerReplicationInfo.NumLives));
    aPlayer.PlayerReplicationInfo.NumLives++;
    aPlayer.PlayerReplicationInfo.KillSuccession = 0;
    aPlayer.ClientSetRotation(aPlayer.Pawn.Rotation);
    GameAddDefaultInventory(aPlayer.Pawn);
    TriggerEvent(StartSpot.Event, StartSpot, aPlayer.Pawn);
    // End:0xD7F
    if((bAllowVehicles && int(Level.NetMode) == int(NM_Standalone)) && PlayerController(aPlayer) != none)
    {
        BestDist = 2000.0000000;
        ViewDir = Vector(aPlayer.Pawn.Rotation);
        V = VehicleList;
        J0xC62:

        // End:0xD51 [Loop If]
        if(V != none)
        {
            // End:0xD3A
            if(V.bTeamLocked && aPlayer.GetTeamNum() == int(V.Team))
            {
                dist = VSize(V.Location - aPlayer.Pawn.Location);
                // End:0xD15
                if((ViewDir Dot (V.Location - aPlayer.Pawn.Location)) < float(0))
                {
                    dist *= float(2);
                }
                // End:0xD3A
                if(dist < BestDist)
                {
                    Best = V;
                    BestDist = dist;
                }
            }
            V = V.NextVehicle;
            // [Loop Continue]
            goto J0xC62;
        }
        // End:0xD7F
        if(Best != none)
        {
            Best.PlayerStartTime = Level.TimeSeconds + float(8);
        }
    }
    // End:0xDB0
    if(GameReplicationInfo.WaitingForStart)
    {
        aPlayer.GotoState('PlayerWaiting');
        aPlayer.ClientOnBeginWaitingForStart();
    }
    PC = PlayerController(aPlayer);
    // End:0xE17
    if(PC != none)
    {
        PC.Pawn.LoginName = PC.LoginName;
        PC.Pawn.IDNum = PC.IDNum;
    }
    // End:0xF74
    if((((aPlayer != none) && aPlayer.PlayerReplicationInfo != none) && !aPlayer.PlayerReplicationInfo.IsSendGameStartTime) && aPlayer.PlayerReplicationInfo.NumLives == 1)
    {
        // End:0xF74
        if((BTSend != none) && !IsA('wMSGameInfo') || IsA('wDOMGameInfo'))
        {
            iPlayerID = aPlayer.PlayerReplicationInfo.GetUID();
            // End:0xF74
            if(-1 != iPlayerID)
            {
                aPlayerIDs[0] = iPlayerID;
                Log((("[RestartPlayer>sfReqGamePlay_SetGameStartTime] PlayerName:" $ aPlayer.PlayerReplicationInfo.PlayerName) $ "/iPlayerID:") $ string(iPlayerID));
                BTSend.sfReqGamePlay_SetGameStartTime(aPlayerIDs);
                aPlayer.PlayerReplicationInfo.IsSendGameStartTime = true;
            }
        }
    }
    //return;    
}

function BeginWaitingForStart()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x89 [Loop If]
    if(C != none)
    {
        // End:0x63
        if((C.Pawn != none) && C.PlayerReplicationInfo.bAdminSpecator == false)
        {
            C.GotoState('WaitingForStart');
        }
        C.ClientOnBeginWaitingForStart();
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    GameReplicationInfo.WaitingForStart = true;
    GameReplicationInfo.WaitingForStartCountDown = int(3.5000000);
    //return;    
}

function EndWaitingForStart()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x69 [Loop If]
    if(C != none)
    {
        // End:0x43
        if(C.Pawn != none)
        {
            C.GotoState('PlayerWalking');
        }
        C.ClientOnEndWaitingForStart();
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    GameReplicationInfo.WaitingForStart = false;
    GameReplicationInfo.WaitingForStartCountDown = -1;
    //return;    
}

function Class<Pawn> GetDefaultPlayerClass(Controller C)
{
    local PlayerController PC;
    local string PawnClassName;
    local Class<Pawn> PawnClass;

    PC = PlayerController(C);
    // End:0x63
    if(PC != none)
    {
        PawnClassName = PC.GetDefaultURL("Class");
        PawnClass = Class<Pawn>(DynamicLoadObject(PawnClassName, Class'Core.Class'));
        // End:0x63
        if(PawnClass != none)
        {
            return PawnClass;
        }
    }
    return Class<Pawn>(DynamicLoadObject(DefaultPlayerClassName, Class'Core.Class'));
    //return;    
}

event PostLogin(PlayerController NewPlayer)
{
    local Class<HUD> HudClass;
    local Class<ScoreBoard> ScoreboardClass, ResultScoreboardClass, ResultScoreboardBootyClass;

    // End:0xB0
    if(!bIsSaveGame)
    {
        // End:0x73
        if(GameStats != none)
        {
            GameStats.ConnectEvent(NewPlayer.PlayerReplicationInfo);
            GameStats.GameEvent("NameChange", NewPlayer.PlayerReplicationInfo.PlayerName, NewPlayer.PlayerReplicationInfo);
        }
        // End:0xB0
        if(!bDelayedStart)
        {
            bRestartLevel = false;
            // End:0x98
            if(bWaitingToStartMatch)
            {
                StartMatch();                
            }
            else
            {
                RestartPlayer(NewPlayer);
            }
            bRestartLevel = default.bRestartLevel;
        }
    }
    // End:0xE8
    if(HUDType == "")
    {
        Log("No HUDType specified in GameInfo", 'Log');        
    }
    else
    {
        HudClass = Class<HUD>(DynamicLoadObject(HUDType, Class'Core.Class'));
        // End:0x133
        if(HudClass == none)
        {
            Log("Can't find HUD class " $ HUDType, 'Error');
        }
    }
    // End:0x1E6
    if(ScoreBoardType != "")
    {
        // End:0x194
        if(Level.GetMatchMaker().BotTutorial)
        {
            ScoreboardClass = Class<ScoreBoard>(DynamicLoadObject("XInterface.xScoreBoardTutorial", Class'Core.Class'));            
        }
        else
        {
            ScoreboardClass = Class<ScoreBoard>(DynamicLoadObject(ScoreBoardType, Class'Core.Class'));
        }
        // End:0x1E6
        if(ScoreboardClass == none)
        {
            Log("Can't find ScoreBoard class " $ ScoreBoardType, 'Error');
        }
    }
    // End:0x20D
    if(ResultScoreBoardType != "")
    {
        ResultScoreboardClass = Class<ScoreBoard>(DynamicLoadObject(ResultScoreBoardType, Class'Core.Class'));
    }
    // End:0x234
    if(ResultScoreBoardBootyType != "")
    {
        ResultScoreboardBootyClass = Class<ScoreBoard>(DynamicLoadObject(ResultScoreBoardBootyType, Class'Core.Class'));
    }
    NewPlayer.ClientSetHUD(HudClass, ScoreboardClass, ResultScoreboardClass, ResultScoreboardBootyClass);
    SetWeaponViewShake(NewPlayer);
    // End:0x26D
    if(bIsSaveGame)
    {
        return;
    }
    // End:0x2B0
    if(NewPlayer.Pawn != none)
    {
        NewPlayer.Pawn.ClientSetRotation(NewPlayer.Pawn.Rotation);
    }
    // End:0x2CF
    if(VotingHandler != none)
    {
        VotingHandler.PlayerJoin(NewPlayer);
    }
    // End:0x2F7
    if(AccessControl != none)
    {
        NewPlayer.LoginDelay = AccessControl.LoginDelaySeconds;
    }
    NewPlayer.ClientCapBandwidth(NewPlayer.Player.CurrentNetSpeed);
    NotifyLogin(NewPlayer.PlayerReplicationInfo.PlayerID);
    Log((("New Player" @ NewPlayer.PlayerReplicationInfo.PlayerName) @ "id=") $ NewPlayer.GetPlayerIDHash());
    //return;    
}

function SetWeaponViewShake(PlayerController P)
{
    P.ClientSetWeaponViewShake(bWeaponShouldViewShake && bModViewShake);
    //return;    
}

function Logout(Controller Exiting)
{
    local bool bMessage;

    bMessage = true;
    // End:0x96
    if(PlayerController(Exiting) != none)
    {
        // End:0x5A
        if((AccessControl != none) && AccessControl.AdminLogout(PlayerController(Exiting)))
        {
            AccessControl.AdminExited(PlayerController(Exiting));
        }
        // End:0x8C
        if(PlayerController(Exiting).PlayerReplicationInfo.bOnlySpectator)
        {
            bMessage = false;
            NumSpectators--;            
        }
        else
        {
            NumPlayers--;
        }        
    }
    else
    {
        bMessage = false;
    }
    // End:0x122
    if(bMessage && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
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
    //return;    
}

function NotifyLogin(int NewPlayerID)
{
    local int i;
    local array<PlayerController> PCArray;

    GetPlayerControllerList(PCArray);
    i = 0;
    J0x12:

    // End:0x46 [Loop If]
    if(i < PCArray.Length)
    {
        PCArray[i].ServerRequestBanInfo(NewPlayerID);
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

function NotifyLogout(Controller Exiting)
{
    local Controller C;
    local PlayerController PC;

    BaseMutator.NotifyLogout(Exiting);
    // End:0xD0
    if((PlayerController(Exiting) != none) && Exiting.PlayerReplicationInfo != none)
    {
        C = Level.ControllerList;
        J0x4E:

        // End:0xD0 [Loop If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0xB9
            if((PC != none) && PC.ChatManager != none)
            {
                PC.ChatManager.UnTrackPlayer(Exiting.PlayerReplicationInfo.PlayerID);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x4E;
        }
    }
    //return;    
}

event AcceptInventory(Pawn PlayerPawn)
{
    //return;    
}

function AddGameSpecificInventory(Pawn P)
{
    local wWeapon newWeapon;
    local Class<wWeapon> WeapClass;

    WeapClass = BaseMutator.GetDefaultWeapon();
    // End:0x8A
    if((WeapClass != none) && P.FindInventoryType(WeapClass) == none)
    {
        newWeapon = Spawn(WeapClass,,, P.Location);
        // End:0x8A
        if(newWeapon != none)
        {
            newWeapon.GiveTo(P);
            newWeapon.bCanThrow = false;
        }
    }
    //return;    
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    local wWeapon newWeapon;
    local Class<wWeapon> WeapClass;

    WeapClass = BaseMutator.GetDefaultWeapon();
    // End:0x8A
    if((WeapClass != none) && PlayerPawn.FindInventoryType(WeapClass) == none)
    {
        newWeapon = Spawn(WeapClass,,, PlayerPawn.Location);
        // End:0x8A
        if(newWeapon != none)
        {
            newWeapon.GiveTo(PlayerPawn);
            newWeapon.bCanThrow = false;
        }
    }
    SetPlayerDefaults(PlayerPawn);
    //return;    
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
    //return;    
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x54 [Loop If]
    if(C != none)
    {
        C.NotifyKilled(Killer, Killed, KilledPawn);
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, Class<DamageType> Damage)
{
    // End:0x2E
    if(GameStats != none)
    {
        GameStats.KillEvent(KillType, Killer, Victim, Damage);
    }
    //return;    
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
    // End:0x69
    if(Killer != Killed)
    {
        ++Killer.PlayerReplicationInfo.KillSuccession;
    }
    byKillSuccession = byte(Min(Killer.PlayerReplicationInfo.KillSuccession, 255));
    C = Level.ControllerList;
    J0xA0:

    // End:0x38C [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x375
        if((((PC != none) && !bGameEnded) && !IsInState('MatchOver')) && kMM.InGamePlaying)
        {
            // End:0x23A
            if((C.GetTeamNum() == Killer.GetTeamNum()) && C.PlayerReplicationInfo != Killer.PlayerReplicationInfo)
            {
                fDist = VSize(C.Pawn.Location - Killer.Pawn.Location);
                // End:0x237
                if(fDist < Class'Engine_Decompressed.wMessage_Game'.default.MessageRange)
                {
                    Log(string(self) $ "ProcessKillMessage() iCode_Message [ class'wMessage_Game'.default.Code_AllyKillEnemy] ");
                    iCode_Message = Class'Engine_Decompressed.wMessage_Game'.default.Code_AllyKillEnemy;
                    PC.ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', iCode_Message, Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo);
                    // [Explicit Break]
                    goto J0x38C;
                }                
            }
            else
            {
                // End:0x375
                if((C.GetTeamNum() == Killed.GetTeamNum()) && C.PlayerReplicationInfo != Killed.PlayerReplicationInfo)
                {
                    fDist = VSize(C.Pawn.Location - Killed.Pawn.Location);
                    // End:0x375
                    if(fDist < Class'Engine_Decompressed.wMessage_Game'.default.MessageRange)
                    {
                        Log(string(self) $ "ProcessKillMessage() iCode_Message [ class'wMessage_Game'.default.Code_AllyDie] ");
                        iCode_Message = Class'Engine_Decompressed.wMessage_Game'.default.Code_AllyDie;
                        PC.ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', iCode_Message, Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo);
                        // [Explicit Break]
                        goto J0x38C;
                    }
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0xA0;
    }
    J0x38C:

    iSoundCase = -1;
    C = Level.ControllerList;
    J0x3AB:

    // End:0x920 [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x909
        if((((PC != none) && !bGameEnded) && !IsInState('MatchOver')) && kMM.InGamePlaying)
        {
            iArray = SendMessageKillSuccssion(Killer, PC, byKillSuccession);
            // End:0x846
            if((Killer.PlayerReplicationInfo == C.PlayerReplicationInfo) || Killer.Pawn == Pawn(PC.ViewTarget))
            {
                // End:0x496
                if(Killer.PlayerReplicationInfo == C.PlayerReplicationInfo)
                {
                    SendQuest_KillSuccession(Killer, byKillSuccession);
                }
                MyCollisionPart = byte(CollisionPart);
                MyWeaponType = byte(WeaponType);
                // End:0x4F5
                if(-1 != iArray)
                {
                    iConKillorHeadShot = ProcessKillMessageMulti(iArray, PC, Killer, Killed, SC.KDLog.KillWeapon);                    
                }
                else
                {
                    iCode_Message = Class'Engine_Decompressed.wMessage_Game'.default.Code_AllyKillEnemy;
                    PC.ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', iCode_Message, Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo);
                    // End:0x5F8
                    if((((((Killer != none) && Killer.PlayerReplicationInfo != none) && PC.ViewTarget != none) && Killer.PlayerReplicationInfo != PC.PlayerReplicationInfo) && Killer.Pawn == Pawn(PC.ViewTarget)) && (iConKillorHeadShot & 1) == 1)
                    {
                        SendMessageAddScore(PC, Killer, Killed, SC.KDLog.KillWeapon);
                    }
                }
                // End:0x688
                if((int(MyCollisionPart) == int(1)) && int(MyWeaponType) != int(13))
                {
                    // End:0x64C
                    if(PC.Pawn.bIsAiming)
                    {
                        iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_Headshot_Aim;                        
                    }
                    else
                    {
                        iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_Headshot;
                    }
                    PC.ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    iConKillorHeadShot = iConKillorHeadShot | 2;
                }
                // End:0x6D0
                if(bWallShot)
                {
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_WallShot;
                    PC.ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    iConKillorHeadShot = iConKillorHeadShot | 1024;
                }
                // End:0x778
                if((int(MyCollisionPart) == int(1)) && int(MyWeaponType) != int(13))
                {
                    iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_HeadShotKill;
                    // End:0x778
                    if((PlayerController(Killer) != none) && Killer.PlayerReplicationInfo == C.PlayerReplicationInfo)
                    {
                        PlayerController(Killer).ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', iCode_Message, SC.KillWeaponType, SC.KDLog.KillWeapon);
                    }
                }
                // End:0x843
                if(((Level.GetMatchMaker() != none) && Level.GetMatchMaker().BotTutorial) && int(MyWeaponType) == int(5))
                {
                    iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_KillGrenade;
                    // End:0x843
                    if((PlayerController(Killer) != none) && Killer.PlayerReplicationInfo == C.PlayerReplicationInfo)
                    {
                        PlayerController(Killer).ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', iCode_Message, SC.KillWeaponType, SC.KDLog.KillWeapon);
                    }
                }                
            }
            else
            {
                // End:0x909
                if(Killed.PlayerReplicationInfo == C.PlayerReplicationInfo)
                {
                    iCode_Message = Class'Engine_Decompressed.wMessage_Game'.default.Code_AllyDie;
                    PC.ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', iCode_Message, Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo);
                    iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_Death;
                    // End:0x909
                    if(PC != none)
                    {
                        PC.ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', iCode_Message, SC.KillWeaponType, SC.KDLog.KillWeapon);
                    }
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x3AB;
    }
    //return;    
}

function int ProcessKillMessageMulti(int iArray, Controller ReceiveController, Controller Killer, Controller Other, int KillWeapon)
{
    local int iConKillorHeadShot;

    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMultiKillMessage', iArray, Killer.PlayerReplicationInfo);
    iConKillorHeadShot = iConKillorHeadShot | 1;
    return iConKillorHeadShot;
    //return;    
}

function int SendMessageKillSuccssion(Controller Killer, PlayerController PC, byte byKillSuccession)
{
    local int iArray;

    iArray = -1;
    // End:0x2E
    if(int(byKillSuccession) >= 2)
    {
        iArray = Min(int(byKillSuccession), 16) - 2;
    }
    return iArray;
    //return;    
}

function SendQuest_KillSuccession(Controller Killer, byte byKillSuccession)
{
    local int iCode_Message;

    // End:0x1C
    if((Killer == none) || int(byKillSuccession) < 1)
    {
        return;
    }
    Log((((string(self) $ "SendQuest_KillSuccession() : ") $ Killer.PlayerReplicationInfo.PlayerName) $ " / byKillSuccession: ") $ string(byKillSuccession));
    switch(byKillSuccession)
    {
        // End:0xA0
        case 2:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_2Kill;
            // End:0x1AD
            break;
        // End:0xBC
        case 3:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_3Kill;
            // End:0x1AD
            break;
        // End:0xD8
        case 4:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_4Kill;
            // End:0x1AD
            break;
        // End:0xF4
        case 5:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_5Kill;
            // End:0x1AD
            break;
        // End:0x110
        case 6:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_6Kill;
            // End:0x1AD
            break;
        // End:0x12C
        case 7:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_7Kill;
            // End:0x1AD
            break;
        // End:0x148
        case 8:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_8Kill;
            // End:0x1AD
            break;
        // End:0x164
        case 9:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_9Kill;
            // End:0x1AD
            break;
        // End:0x180
        case 10:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_10Kill;
            // End:0x1AD
            break;
        // End:0x19C
        case 15:
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_15Kill;
            // End:0x1AD
            break;
        // End:0xFFFF
        default:
            iCode_Message = -1;
            // End:0x1AD
            break;
            break;
    }
    // End:0x1F7
    if(iCode_Message > 0)
    {
        PlayerController(Killer).ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', iCode_Message, SC.KillWeaponType, SC.KDLog.KillWeapon);
    }
    //return;    
}

function bool DoProcessKillMessage(Class<DamageType> DamageType)
{
    return DamageType != Class'Engine_Decompressed.Suicided';
    //return;    
}

function KDLOG_Initialize()
{
    local KillDeathLog empty;

    Log("KDLOG_Initialize");
    SC.KDLog = empty;
    SC.KDLogSaved = false;
    SC.AssistUIDs.Length = 0;
    SC.AssistType.Length = 0;
    //return;    
}

function KDLOG_Finalize()
{
    local int i, iPlayerID, iAssi;
    local wMatchUserInfo Killer, Killed;

    Log("KDLOG_Finalize");
    // End:0x44E
    if(((SC.KDLogSaved && SC.KDLog.CharKillUID != -1) && SC.KDLog.CharDeathUID != -1) && Level.GetMatchMaker().bHasChannelTCP)
    {
        Log((("[KDLOG_Finalize>BTSend.sfReqLogGetScore] CharDeathUID :" $ string(SC.KDLog.CharDeathUID)) $ " / DeathWeapon:") $ string(SC.KDLog.DeathWeapon));
        BTSend.sfReqLogGetScore(SC.KDLog, SC.AssistUIDs, SC.AssistType);
        i = 0;
        J0x13C:

        // End:0x23E [Loop If]
        if(i < SC.AssistUIDs.Length)
        {
            iPlayerID = SC.AssistUIDs[i];
            Killer = kMM.GetUserInfoByUID(iPlayerID);
            iAssi = int(SC.AssistType[i]);
            Log((((((("[GameInfo::KDLOG_Finalize::AssistList]: count:" $ string(i + 1)) $ "/AssistUIDs:") $ string(iPlayerID)) $ "/PlayerName:") $ Killer.UserName) $ "/AssistType") $ string(iAssi));
            i++;
            // [Loop Continue]
            goto J0x13C;
        }
        Killer = kMM.GetUserInfoByUID(SC.KDLog.CharKillUID);
        Killed = kMM.GetUserInfoByUID(SC.KDLog.CharDeathUID);
        // End:0x44E
        if((Killer != none) && Killed != none)
        {
            CombatLog((((((((((((((((((((("[KILL_EVENT] KillerName=" $ Killer.UserName) $ " KillerTeam=") $ string(Killer.TeamNum)) $ " KillXCoord=") $ string(SC.KDLog.KillXCoord)) $ " KillYCoord=") $ string(SC.KDLog.KillYCoord)) $ " KillZCoord=") $ string(SC.KDLog.KillZCoord)) $ " KillWeapon=") $ string(SC.KDLog.KillWeapon)) $ " KilledName=") $ Killed.UserName) $ " KilledTeam=") $ string(Killed.TeamNum)) $ " DeathXCoord=") $ string(SC.KDLog.DeathXCoord)) $ " DeathYCoord=") $ string(SC.KDLog.DeathYCoord)) $ " DeathZCoord=") $ string(SC.KDLog.DeathZCoord));
        }
    }
    SC.KDLogSaved = false;
    //return;    
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
    // End:0x39D
    if((SC.KDLogSaved && KillerUID != -1) && Level.GetMatchMaker().bHasChannelTCP)
    {
        UserInfo = kMM.GetUserInfoByUID(KillerUID);
        Log((((("[KDLOG_Finalize_HeliCopter>BTSend.sfReqGamePlay_GetChopper] KillerUID:" $ string(KillerUID)) $ "/PlayerName:") $ UserInfo.UserName) $ "/Assist Count:") $ string(SC.AssistUIDs.Length));
        fKillXCoord = SC.KDLog.KillXCoord;
        fKillYCoord = SC.KDLog.KillYCoord;
        fKillZCoord = SC.KDLog.KillZCoord;
        iKillPos = SC.KDLog.KillPos;
        iKillWeapon = SC.KDLog.KillWeapon;
        iKillWeaponPart = SC.KDLog.KillWeaponPart;
        iKillRange = SC.KDLog.KillRange;
        iKillDamage = SC.KDLog.KillDamage;
        iChopperCallerID = GetChopperCallerID(HeliCopter);
        strChopperCallerName = HeliCopter.Caller.PlayerReplicationInfo.PlayerName;
        fDeathXCoord = SC.KDLog.DeathXCoord;
        fDeathYCoord = SC.KDLog.DeathYCoord;
        fDeathZCoord = SC.KDLog.DeathZCoord;
        BTSend.sfReqGamePlay_GetChopper(KillerUID, SC.AssistUIDs, fKillXCoord, fKillYCoord, fKillZCoord, iKillPos, iKillWeapon, iKillWeaponPart, iKillRange, iKillDamage, iChopperCallerID, strChopperCallerName, fDeathXCoord, fDeathYCoord, fDeathZCoord);
        i = 0;
        J0x2C4:

        // End:0x39D [Loop If]
        if(i < SC.AssistUIDs.Length)
        {
            iPlayerID = SC.AssistUIDs[i];
            UserInfo = kMM.GetUserInfoByUID(iPlayerID);
            Log((((("[GameInfo::KDLOG_Finalize_HeliCopter::AssistList]: count:" $ string(i + 1)) $ "/AssistUIDs:") $ string(iPlayerID)) $ "/PlayerName:") $ UserInfo.UserName);
            i++;
            // [Loop Continue]
            goto J0x2C4;
        }
    }
    SC.KDLogSaved = false;
    //return;    
}

function int GetChopperCallerID(Controller HeliCopter)
{
    return HeliCopter.Caller.PlayerReplicationInfo.GetUID();
    //return;    
}

function int ExceptionKillWeapon(int iKillWeaponID, optional Class<DamageType> DamageType, optional int WeaponType)
{
    local int iResult;
    local string sDamageType;

    iResult = iKillWeaponID;
    switch(DamageType)
    {
        // End:0x1D
        case Class'Engine_Decompressed.wDamageAirStrike':
            // End:0x23
            break;
        // End:0xFFFF
        default:
            // End:0x23
            break;
            break;
    }
    sDamageType = string(DamageType);
    switch(sDamageType)
    {
        // End:0xFFFF
        default:
            // End:0x3D
            break;
            break;
    }
    return iResult;
    //return;    
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local Vehicle V;
    local string strDamageType;
    local int supplyID;
    local bool updateScore;
    local int iConKillorHeadShot;

    updateScore = false;
    iConKillorHeadShot = 0;
    strDamageType = string(DamageType);
    Killed.PlayerReplicationInfo.KillSuccession = 0;
    updateScore = IsSetKDLogData(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType, bWallShot);
    ProcessDeathMessage(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType, bWallShot);
    // End:0xC5
    if(Killed_Special(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType, bWallShot))
    {
        updateScore = true;
    }
    // End:0x1B5
    if(Killer == none)
    {
        // End:0x143
        if(((DamageType == Class'Engine_Decompressed.wDamageAirStrike') || strDamageType ~= "WWeapons_Res.wWeaponRes_Artillery") || strDamageType ~= "WWeapons_Res.wWeaponRes_PinpointBomb")
        {            
        }
        else
        {
            // End:0x1AD
            if(((DamageType == Class'Engine_Decompressed.wDamageHelicopter') || strDamageType ~= "WWeapons_Res.wWeaponRes_HeliGun") || strDamageType ~= "WWeapons_Res.wWeaponRes_HeliRPG7")
            {
            }
        }
        updateScore = true;
    }
    // End:0x1E8
    if(DoProcessKillMessage(DamageType))
    {
        ProcessKillMessage(Killer, Killed, CollisionPart, WeaponType, iConKillorHeadShot, bWallShot);
    }
    SC.KDLog.GetItemIDAfterKill = 0;
    // End:0x2D8
    if((Killed.Pawn != none) && DamageType != Class'Engine_Decompressed.wDamageChangedHost')
    {
        Killed.Pawn.SpawnMedals();
        supplyID = Killed.Pawn.SpawnSupplyItem();
        // End:0x27D
        if(255 == supplyID)
        {
            SC.KDLog.IsDropItem = 0;            
        }
        else
        {
            SC.KDLog.IsDropItem = 1;
            SC.KDLog.DropItemID = supplyID;
        }
        SC.KDLog.GetItemIDAfterKill = Killer.Pawn.SpawnBlackbox();
    }
    // End:0x39F
    if(updateScore)
    {
        ScoreKill(Killer, Killed);
        SendMessageAddScore(Killer, Killer, Killed, SC.KDLog.KillWeapon, iConKillorHeadShot);
        // End:0x38B
        if(Level.GetMatchMaker().kGame_GameMode == int(Level.GetMatchMaker().0))
        {
            // End:0x388
            if(myTeamMM.My_iTeam != Killer.GetTeamNum())
            {
                PushDeathPos(Killer.Location);
            }            
        }
        else
        {
            PushDeathPos(Killer.Location);
        }
    }
    // End:0x3C3
    if(int(KilledPawn.TypeOfWeapon) != int(18))
    {
        DiscardInventory(KilledPawn);
    }
    NotifyKilled(Killer, Killed, KilledPawn);
    // End:0x473
    if((bAllowVehicles && int(Level.NetMode) == int(NM_Standalone)) && PlayerController(Killed) != none)
    {
        V = VehicleList;
        J0x419:

        // End:0x473 [Loop If]
        if(V != none)
        {
            // End:0x45C
            if(Killed.GetTeamNum() == int(V.Team))
            {
                V.PlayerStartTime = 0.0000000;
            }
            V = V.NextVehicle;
            // [Loop Continue]
            goto J0x419;
        }
    }
    //return;    
}

function bool IsProcessKDLog(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x23
    if((Killer == none) || Killer.PlayerReplicationInfo == none)
    {
        return false;
    }
    // End:0x46
    if((Killed == none) || Killed.PlayerReplicationInfo == none)
    {
        return false;
    }
    // End:0x5A
    if(DamageType.default.SkipDeathIncrement)
    {
        return false;
    }
    return true;
    //return;    
}

function bool IsSetKDLogData(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local bool bSetKDLog;
    local string strDamageType;

    strDamageType = string(DamageType);
    bSetKDLog = IsProcessKDLog(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType, bWallShot);
    // End:0xA79
    if(bSetKDLog)
    {
        Log((((("[GameInfo::Killed] Killer=" $ Killer.PlayerReplicationInfo.PlayerName) $ " Victim=") $ Killed.PlayerReplicationInfo.PlayerName) $ " damageType=") $ strDamageType);
        SC.KDLogSaved = true;
        SC.KDLog.CharKillUID = self.GetCharKillUID(Killer);
        SC.KDLog.KillXCoord = Killer.Pawn.Location.X;
        SC.KDLog.KillYCoord = Killer.Pawn.Location.Y;
        SC.KDLog.KillZCoord = Killer.Pawn.Location.Z;
        SC.KDLog.KillPos = Killer.Pawn.GetPostureIndex();
        SC.KillWeaponType = WeaponType;
        SC.IsWeaponAiming = Killer.Pawn.bIsAiming;
        // End:0x21B
        if(Killer.Pawn.bIsAiming)
        {
            SC.KDLog.IsAimShot = 1;            
        }
        else
        {
            SC.KDLog.IsAimShot = 0;
        }
        // End:0x2AA
        if(WeaponType == int(18))
        {
            // End:0x28E
            if("WMission.wNDFGameInfo" == Level.GRI.GameClass)
            {
                SC.KDLog.KillWeapon = 5021;                
            }
            else
            {
                SC.KDLog.KillWeapon = 5017;
            }            
        }
        else
        {
            // End:0x382
            if(((DamageType == Class'Engine_Decompressed.wDamageAirStrike') || strDamageType ~= "WWeapons_Res.wWeaponRes_Artillery") || strDamageType ~= "WWeapons_Res.wWeaponRes_PinpointBomb")
            {
                // End:0x366
                if(strDamageType ~= "WWeapons_Res.wWeaponRes_PinpointBomb")
                {
                    SC.KDLog.KillWeapon = 50006;                    
                }
                else
                {
                    SC.KDLog.KillWeapon = 50000;
                }                
            }
            else
            {
                // End:0x3AC
                if(WeaponType == int(8))
                {
                    SC.KDLog.KillWeapon = 5003;                    
                }
                else
                {
                    // End:0x5A7
                    if(WeaponType == int(5))
                    {
                        // End:0x405
                        if(strDamageType ~= "WWeapons_Res.wWeaponRes_StunGrenade")
                        {
                            SC.KDLog.KillWeapon = 6002;                            
                        }
                        else
                        {
                            // End:0x44F
                            if(strDamageType ~= "WWeapons_Res.wWeaponRes_IncGrenade")
                            {
                                SC.KDLog.KillWeapon = 6005;                                
                            }
                            else
                            {
                                // End:0x49E
                                if(strDamageType ~= "WWeapons_Res.wWeaponRes_IncGrenadeFlame")
                                {
                                    SC.KDLog.KillWeapon = 50007;                                    
                                }
                                else
                                {
                                    // End:0x4F2
                                    if(strDamageType ~= "WWeapons_Res.wWeaponRes_SplitGrenadeFragment")
                                    {
                                        SC.KDLog.KillWeapon = 50008;                                        
                                    }
                                    else
                                    {
                                        // End:0x53E
                                        if(strDamageType ~= "WWeapons_Res.wWeaponRes_SplitGrenade")
                                        {
                                            SC.KDLog.KillWeapon = 7003;                                            
                                        }
                                        else
                                        {
                                            // End:0x58B
                                            if(strDamageType ~= "WWeapons_Res.wWeaponRes_SemtexGrenade")
                                            {
                                                SC.KDLog.KillWeapon = 6008;                                                
                                            }
                                            else
                                            {
                                                SC.KDLog.KillWeapon = 6000;
                                            }
                                        }
                                    }
                                }
                            }
                        }                        
                    }
                    else
                    {
                        // End:0x5D2
                        if(DamageType == Class'Engine_Decompressed.wDamageHelicopter')
                        {
                            SC.KDLog.KillWeapon = 5009;                            
                        }
                        else
                        {
                            // End:0x619
                            if(strDamageType ~= "WWeapons_Res.wWeaponRes_HeliGun")
                            {
                                SC.KDLog.KillWeapon = 50001;                                
                            }
                            else
                            {
                                // End:0x661
                                if(strDamageType ~= "WWeapons_Res.wWeaponRes_HeliRPG7")
                                {
                                    SC.KDLog.KillWeapon = 50002;                                    
                                }
                                else
                                {
                                    // End:0x723
                                    if(((DamageType == Class'Engine_Decompressed.wDamageRPG') || strDamageType ~= "WWeapons_Res.wWeaponRes_RPG7") || strDamageType ~= "WWeapons_Res.wWeaponRes_ATR")
                                    {
                                        // End:0x707
                                        if(strDamageType ~= "WWeapons_Res.wWeaponRes_RPG7")
                                        {
                                            SC.KDLog.KillWeapon = 5011;                                            
                                        }
                                        else
                                        {
                                            SC.KDLog.KillWeapon = 5001;
                                        }                                        
                                    }
                                    else
                                    {
                                        // End:0x770
                                        if(strDamageType ~= "WWeapons_Res.wWeaponRes_SatchelCharge")
                                        {
                                            SC.KDLog.KillWeapon = 7001;                                            
                                        }
                                        else
                                        {
                                            // End:0x79B
                                            if(DamageType == Class'Engine_Decompressed.wDamageMelee')
                                            {
                                                SC.KDLog.KillWeapon = 99999;                                                
                                            }
                                            else
                                            {
                                                // End:0x7C6
                                                if(DamageType == Class'Engine_Decompressed.wDamageStepOn')
                                                {
                                                    SC.KDLog.KillWeapon = 99998;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x839
                                                    if((Killer.Pawn != none) && Killer.Pawn.Weapon != none)
                                                    {
                                                        SC.KDLog.KillWeapon = Killer.Pawn.Weapon.BaseParams.iWeaponID;                                                        
                                                    }
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
        }
        // End:0x8C3
        if((Killer.Pawn != none) && Killer.Pawn.Weapon != none)
        {
            SC.KDLog.KillWeaponPart = Killer.Pawn.Weapon.Parts[0].PartsGroupID;            
        }
        else
        {
            SC.KDLog.KillWeaponPart = 0;
        }
        SC.KDLog.KillRange = int(VSize(Killer.Pawn.Location - Killed.Pawn.Location));
        SC.KDLog.KillBodyPart = byte(CollisionPart);
        // End:0x988
        if(Level.GRI.Teams[Killer.GetTeamNum()].IsUAVOn())
        {
            SC.KDLog.IsUAV = 1;            
        }
        else
        {
            SC.KDLog.IsUAV = 0;
        }
        SC.KDLog.CharDeathUID = GetDeathUID(Killed);
        SC.KDLog.DeathXCoord = Killed.Pawn.Location.X;
        SC.KDLog.DeathYCoord = Killed.Pawn.Location.Y;
        SC.KDLog.DeathZCoord = Killed.Pawn.Location.Z;
        SC.KDLog.DeathPos = Killed.Pawn.GetPostureIndex();
    }
    return bSetKDLog;
    //return;    
}

function int GetCharKillUID(Controller Killer)
{
    local int iUid;

    iUid = Killer.PlayerReplicationInfo.GetUID();
    return iUid;
    //return;    
}

function int GetDeathUID(Controller Killed)
{
    local int iUid;

    iUid = Killed.PlayerReplicationInfo.GetUID();
    return iUid;
    //return;    
}

function ProcessDeathMessage(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x16
    if(Killed.IsA('wAISentryGunController'))
    {
        return;
    }
    // End:0x1F0
    if(((Killed != none) && Killed.bIsPlayer) && !DamageType.default.SkipDeathIncrement)
    {
        Killed.PlayerReplicationInfo.Deaths += float(1);
        Killed.PlayerReplicationInfo.NetUpdateTime = FMin(Killed.PlayerReplicationInfo.NetUpdateTime, Level.TimeSeconds + (0.3000000 * FRand()));
        BroadcastDeathMessage(Killer, Killed, DamageType, CollisionPart, WeaponType);
        // End:0x144
        if((Killer == Killed) || Killer == none)
        {
            // End:0x117
            if(Killer == none)
            {
                KillEvent("K", none, Killed.PlayerReplicationInfo, DamageType);                
            }
            else
            {
                KillEvent("K", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
            }            
        }
        else
        {
            // End:0x1C6
            if((bTeamGame && Killer.PlayerReplicationInfo != none) && Killer.PlayerReplicationInfo.Team == Killed.PlayerReplicationInfo.Team)
            {
                KillEvent("TK", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);                
            }
            else
            {
                KillEvent("K", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
            }
        }
    }
    //return;    
}

function bool Killed_Special(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local int iUid;
    local bool bNeedUpdateScore, bHeli, bSentry;

    bHeli = Killed.IsA('wHelicopterController');
    bSentry = Killed.IsA('wAISentryGunController');
    // End:0x4B7
    if(bHeli || bSentry)
    {
        // End:0x4B7
        if((Killer != none) && kMM != none)
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
            iUid = Killer.PlayerReplicationInfo.GetUID();
            // End:0x351
            if(bHeli)
            {
                Log((("[GameInfo::Killed::wHelicopterController] Killer Id=" $ Killer.PlayerReplicationInfo.PlayerName) $ "/UID:") $ string(iUid));                
            }
            else
            {
                Log((("[GameInfo::Killed::wAISentryGunController] Killer Id=" $ Killer.PlayerReplicationInfo.PlayerName) $ "/UID:") $ string(iUid));
            }
            // End:0x44C
            if(bHeli)
            {
                // End:0x40F
                if(Killed.IsA('wFlyingDefenceBotController'))
                {
                    AllReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', Class'Engine_Decompressed.wMessage_Game'.default.Code_KilledFlyingDefeceBot, Killer.PlayerReplicationInfo, Killer.PlayerReplicationInfo, DamageType);                    
                }
                else
                {
                    AllReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', Class'Engine_Decompressed.wMessage_Game'.default.Code_KilledHelicopter, Killer.PlayerReplicationInfo, Killer.PlayerReplicationInfo, DamageType);
                }                
            }
            else
            {
                // End:0x48F
                if(bSentry)
                {
                    AllReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', Class'Engine_Decompressed.wMessage_Game'.default.Code_KilledSentryGun, Killer.PlayerReplicationInfo, Killer.PlayerReplicationInfo, DamageType);
                }
            }
            // End:0x4B7
            if(iUid != -1)
            {
                SC.KDLogSaved = true;
                bNeedUpdateScore = true;
            }
        }
    }
    return bNeedUpdateScore;
    //return;    
}

function bool PreventDeath(Pawn Killed, Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
    // End:0x0D
    if(GameRulesModifiers == none)
    {
        return false;
    }
    return GameRulesModifiers.PreventDeath(Killed, Killer, DamageType, HitLocation);
    //return;    
}

function bool PreventSever(Pawn Killed, name BoneName, int Damage, Class<DamageType> DamageType)
{
    // End:0x0D
    if(GameRulesModifiers == none)
    {
        return false;
    }
    return GameRulesModifiers.PreventSever(Killed, BoneName, Damage, DamageType);
    //return;    
}

function Class<DamageType> GetWDamageType(Class<DamageType> DamageType, int CollisionPart, int WeaponType, out int IsHeadShot, out int IsEnableAim)
{
    local Actor.CollisionPartsType MyCollisionPart;
    local Actor.eWeaponType MyWeaponType;

    MyCollisionPart = byte(CollisionPart);
    MyWeaponType = byte(WeaponType);
    // End:0x43
    if((int(MyCollisionPart) == int(1)) && int(MyWeaponType) != int(13))
    {
        IsHeadShot = 1;
    }
    switch(MyWeaponType)
    {
        // End:0x4F
        case 1:
        // End:0x54
        case 2:
        // End:0x59
        case 3:
        // End:0x5E
        case 4:
        // End:0x63
        case 6:
        // End:0x68
        case 7:
        // End:0x77
        case 9:
            IsEnableAim = 1;
            // End:0x7A
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(MyWeaponType)
    {
        // End:0x8C
        case 11:
            return Class'Engine_Decompressed.wDamageAirStrike';
        // End:0x97
        case 20:
            return Class'Engine_Decompressed.wDamagePinpointBomb';
        // End:0xA2
        case 13:
            return Class'Engine_Decompressed.wDamageHelicopter';
        // End:0xFFFF
        default:
            return DamageType;
            break;
    }
    //return;    
}

function int GetOptionalDeathMessageInfo(Controller Killer, Controller Killed, int IsHeadShot, int IsEnableAim)
{
    local int TempSwitch, IsAimShot;

    // End:0x38
    if(Killer.PlayerReplicationInfo != none)
    {
        TempSwitch = Min(Killer.PlayerReplicationInfo.KillSuccession + 1, 16);
    }
    TempSwitch = TempSwitch << 1;
    IsAimShot = int(Killer.Pawn.bIsAiming);
    // End:0x83
    if(IsEnableAim > 0)
    {
        TempSwitch = TempSwitch | IsAimShot;
    }
    TempSwitch = TempSwitch << 1;
    TempSwitch = TempSwitch | IsHeadShot;
    return TempSwitch;
    //return;    
}

function BroadcastDeathMessage(Controller Killer, Controller Other, Class<DamageType> DamageType, int CollisionPart, int WeaponType)
{
    local int TempSwitch, IsHeadShot, IsEnableAim;
    local Class<DamageType> TempDamageType;

    TempDamageType = GetWDamageType(DamageType, CollisionPart, WeaponType, IsHeadShot, IsEnableAim);
    TempSwitch = GetOptionalDeathMessageInfo(Killer, Other, IsHeadShot, IsEnableAim);
    // End:0x8E
    if(Killer.PlayerReplicationInfo != none)
    {
        BroadcastLocalized(self, DeathMessageClass, TempSwitch, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo, TempDamageType);        
    }
    else
    {
        BroadcastLocalized(self, DeathMessageClass, TempSwitch, Killer.GetPRI(), Other.PlayerReplicationInfo, TempDamageType);
    }
    //return;    
}

// Export UGameInfo::execParseKillMessage(FFrame&, void* const)
native static function string ParseKillMessage(string KillerName, string VictimName, string DeathMessage)
{
    //native.KillerName;
    //native.VictimName;
    //native.DeathMessage;        
}

function Kick(string S)
{
    // End:0x1F
    if(AccessControl != none)
    {
        AccessControl.Kick(S);
    }
    //return;    
}

function SessionKickBan(string S)
{
    // End:0x1F
    if(AccessControl != none)
    {
        AccessControl.SessionKickBan(S);
    }
    //return;    
}

function KickBan(string S)
{
    // End:0x1F
    if(AccessControl != none)
    {
        AccessControl.KickBan(S);
    }
    //return;    
}

function bool SameTeam(Controller c1, Controller c2)
{
    //return;    
}

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
    //return;    
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
    return true;
    //return;    
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType, optional int iWeaponType)
{
    local int OriginalDamage;
    local Armor FirstArmor, NextArmor;

    OriginalDamage = Damage;
    // End:0x30
    if(injured.PhysicsVolume.bNeutralZone)
    {
        Damage = 0;        
    }
    else
    {
        // End:0x47
        if(injured.InGodMode())
        {
            return 0;            
        }
        else
        {
            // End:0xF3
            if((injured.Inventory != none) && Damage > 0)
            {
                FirstArmor = injured.Inventory.PrioritizeArmor(Damage, DamageType, HitLocation);
                J0x95:

                // End:0xF3 [Loop If]
                if((FirstArmor != none) && Damage > 0)
                {
                    NextArmor = FirstArmor.NextArmor;
                    Damage = FirstArmor.ArmorAbsorbDamage(Damage, DamageType, HitLocation);
                    FirstArmor = NextArmor;
                    // [Loop Continue]
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
    //return;    
}

function bool ShouldRespawn(Pickup Other)
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return false;
    }
    return Other.RespawnTime != 0.0000000;
    //return;    
}

function bool PickupQuery(Pawn Other, Pickup Item)
{
    local byte bAllowPickup;

    // End:0x39
    if((GameRulesModifiers != none) && GameRulesModifiers.OverridePickupQuery(Other, Item, bAllowPickup))
    {
        return int(bAllowPickup) == 1;
    }
    // End:0x52
    if(Other.Inventory == none)
    {
        return true;        
    }
    else
    {
        return !Other.Inventory.HandlePickupQuery(Item);
    }
    //return;    
}

function DiscardInventory(Pawn Other)
{
    Other.Weapon = none;
    Other.SelectedItem = none;
    J0x20:

    // End:0x4C [Loop If]
    if(Other.Inventory != none)
    {
        Other.Inventory.Destroy();
        // [Loop Continue]
        goto J0x20;
    }
    //return;    
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
        J0x9E:

        // End:0x119 [Loop If]
        if(C != none)
        {
            // End:0x102
            if((PlayerController(C) != none) && Viewport(PlayerController(C).Player) != none)
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine_Decompressed.GameMessage', 2, Other.PlayerReplicationInfo);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x9E;
        }
    }
    //return;    
}

event bool ForcedChangeTeam(Controller Other, int N, bool bNewTeam)
{
    return ChangeTeam(Other, N, bNewTeam);
    //return;    
}

function bool ChangeTeam(Controller Other, int N, bool bNewTeam)
{
    return true;
    //return;    
}

function int GetTeamID_by_Balancing(int iTeamID, Controller C)
{
    return iTeamID;
    //return;    
}

function SendPlayer(PlayerController aPlayer, string URL)
{
    aPlayer.ClientTravel(URL, 2, true);
    //return;    
}

function RestartGame()
{
    local string NextMap;
    local MapList MyList;

    // End:0x21
    if((GameRulesModifiers != none) && GameRulesModifiers.HandleRestartGame())
    {
        return;
    }
    // End:0x2C
    if(bGameRestarted)
    {
        return;
    }
    bGameRestarted = true;
    // End:0x57
    if((VotingHandler != none) && !VotingHandler.HandleRestartGame())
    {
        return;
    }
    // End:0x103
    if((bChangeLevels && !bAlreadyChanged) && MapListType != "")
    {
        bAlreadyChanged = true;
        MyList = GetMapList(MapListType);
        // End:0xC0
        if(MyList != none)
        {
            NextMap = MyList.GetNextMap();
            MyList.Destroy();
        }
        // End:0xE0
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
    //return;    
}

function array<string> GetMapRotation()
{
    // End:0x1B
    if(MaplistHandler != none)
    {
        return MaplistHandler.GetCurrentMapRotation();
    }
    //return;    
}

function MapList GetMapList(string MapListClassType)
{
    local Class<MapList> MapListClass;

    // End:0x3B
    if(MapListClassType != "")
    {
        MapListClass = Class<MapList>(DynamicLoadObject(MapListClassType, Class'Core.Class'));
        // End:0x3B
        if(MapListClass != none)
        {
            return Spawn(MapListClass);
        }
    }
    return none;
    //return;    
}

function ChangeVoiceChannel(PlayerReplicationInfo PRI, int NewChannelIndex, int OldChannelIndex)
{
    //return;    
}

event Broadcast(Actor Sender, coerce string Msg, optional name Type)
{
    BroadcastHandler.Broadcast(Sender, Msg, Type);
    //return;    
}

function BroadcastTeam(Controller Sender, coerce string Msg, optional name Type)
{
    BroadcastHandler.BroadcastTeam(Sender, Msg, Type);
    //return;    
}

event BroadcastLocalized(Actor Sender, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    BroadcastHandler.AllowBroadcastLocalized(Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local Controller P;

    // End:0x2D
    if((GameRulesModifiers != none) && !GameRulesModifiers.CheckEndGame(Winner, Reason))
    {
        return false;
    }
    P = Level.ControllerList;
    J0x41:

    // End:0x81 [Loop If]
    if(P != none)
    {
        P.ClientGameEnded();
        P.GameHasEnded();
        P = P.nextController;
        // [Loop Continue]
        goto J0x41;
    }
    return true;
    //return;    
}

event bool CheckEndGameCondition()
{
    //return;    
}

function EndGame(PlayerReplicationInfo Winner, string Reason)
{
    // End:0x1F
    if(!CheckEndGame(Winner, Reason))
    {
        bOverTime = true;
        return;
    }
    bGameEnded = true;
    TriggerEvent('EndGame', self, none);
    EndLogging(Reason);
    //return;    
}

function TieOnTimeOver()
{
    BroadcastLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', Class'Engine_Decompressed.wMessage_Game'.default.Code_SuddenDeath);
    GameReplicationInfo.bStopCountDown = true;
    //return;    
}

function EndLogging(string Reason)
{
    // End:0x0D
    if(GameStats == none)
    {
        return;
    }
    GameStats.EndGame(Reason);
    GameStats.Destroy();
    GameStats = none;
    //return;    
}

function bool IsRespawnSpecialCase()
{
    return false;
    //return;    
}

function bool IsAnyPawnWithinRadius(NavigationPoint N)
{
    local int lp1;
    local float dist, PAWN_RADIUS;
    local Pawn P;

    PAWN_RADIUS = Class'Engine_Decompressed.Pawn'.default.CollisionRadius;
    lp1 = 0;
    J0x1B:

    // End:0x8F [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        dist = VSize(P.Location - N.Location);
        // End:0x85
        if(dist < PAWN_RADIUS)
        {
            return true;
        }
        lp1++;
        // [Loop Continue]
        goto J0x1B;
    }
    return false;
    //return;    
}

function bool IsRespawnPointFailedRecently(NavigationPoint S)
{
    // End:0x15
    if(PlayerStart(S) == none)
    {
        return false;        
    }
    else
    {
        return (Level.TimeSeconds - PlayerStart(S).LastSpawnFailTime) < SC.default.RespawnFailDuration;
    }
    //return;    
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x1D
    if(N.Class == Class'Engine_Decompressed.PlayerStart')
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
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
        Level.GetLocalPlayerController().myHUD.AddTextMessage("GetSafetestRespawnPoint", Class'Engine_Decompressed.GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
    }
    MAX_TRY = 3;
    SHUFFLE_COUNT = 25;
    enemies = GetEveryEnemyList(Team);
    Log("  Num Enemies = " $ string(enemies.Length));
    lp1 = 0;
    J0xCE:

    // End:0x192 [Loop If]
    if(lp1 < enemies.Length)
    {
        Log(((((((((("    " $ Pawn(enemies[lp1]).OwnerName) $ "(") $ string(enemies[lp1])) $ ")") $ " x=") $ string(enemies[lp1].Location.X)) $ ", y=") $ string(enemies[lp1].Location.Y)) $ ", z=") $ string(enemies[lp1].Location.Z));
        lp1++;
        // [Loop Continue]
        goto J0xCE;
    }
    lp1 = 0;
    J0x199:

    // End:0x2AC [Loop If]
    if(lp1 < starts.Length)
    {
        S = starts[lp1];
        // End:0x2A2
        if(skipAppropriateCheck || IsAppropriateRespawnPoint(S, Team))
        {
            minDist = 999999.0000000;
            lp2 = 0;
            J0x1EA:

            // End:0x24A [Loop If]
            if(lp2 < enemies.Length)
            {
                dist = VSize(enemies[lp2].Location - S.Location);
                // End:0x240
                if(minDist > dist)
                {
                    minDist = dist;
                }
                lp2++;
                // [Loop Continue]
                goto J0x1EA;
            }
            // End:0x27E
            if(!IsRespawnPointFailedRecently(S))
            {
                candidates[candidates.Length] = S;
                candidateMinDists[candidateMinDists.Length] = minDist;
            }
            candidates2[candidates2.Length] = S;
            candidateMinDists2[candidateMinDists2.Length] = minDist;
        }
        lp1++;
        // [Loop Continue]
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
    J0x33A:

    // End:0x413 [Loop If]
    if(lp1 < candidates.Length)
    {
        Log((((((((((("    " $ string(lp1)) $ ". name=") $ string(candidates[lp1].Name)) $ " min dist=") $ string(candidateMinDists[lp1])) $ " x=") $ string(candidates[lp1].Location.X)) $ ", y=") $ string(candidates[lp1].Location.Y)) $ ", z=") $ string(candidates[lp1].Location.Z));
        lp1++;
        // [Loop Continue]
        goto J0x33A;
    }
    Log("  Shuffle Candidates");
    lp1 = 0;
    J0x432:

    // End:0x4E8 [Loop If]
    if(lp1 < SHUFFLE_COUNT)
    {
        A = Rand(candidates.Length);
        B = Rand(candidates.Length);
        // End:0x4DE
        if(A != B)
        {
            tempPoint = candidates[A];
            dist = candidateMinDists[A];
            candidates[A] = candidates[B];
            candidateMinDists[A] = candidateMinDists[B];
            candidates[B] = tempPoint;
            candidateMinDists[B] = dist;
        }
        lp1++;
        // [Loop Continue]
        goto J0x432;
    }
    lp1 = 0;
    J0x4EF:

    // End:0x5C8 [Loop If]
    if(lp1 < candidates.Length)
    {
        Log((((((((((("    " $ string(lp1)) $ ". name=") $ string(candidates[lp1].Name)) $ " min dist=") $ string(candidateMinDists[lp1])) $ " x=") $ string(candidates[lp1].Location.X)) $ ", y=") $ string(candidates[lp1].Location.Y)) $ ", z=") $ string(candidates[lp1].Location.Z));
        lp1++;
        // [Loop Continue]
        goto J0x4EF;
    }
    lp1 = 1;
    J0x5CF:

    // End:0x6A5 [Loop If]
    if(lp1 < candidates.Length)
    {
        tempPoint = candidates[lp1];
        dist = candidateMinDists[lp1];
        lp2 = lp1 - 1;
        J0x60F:

        // End:0x673 [Loop If]
        if(lp2 >= 0)
        {
            // End:0x666
            if(candidateMinDists[lp2] < dist)
            {
                candidateMinDists[lp2 + 1] = candidateMinDists[lp2];
                candidates[lp2 + 1] = candidates[lp2];
                // [Explicit Continue]
                goto J0x669;
            }
            // [Explicit Break]
            goto J0x673;
            J0x669:

            lp2--;
            // [Loop Continue]
            goto J0x60F;
        }
        J0x673:

        candidateMinDists[lp2 + 1] = dist;
        candidates[lp2 + 1] = tempPoint;
        lp1++;
        // [Loop Continue]
        goto J0x5CF;
    }
    Log("  Sorted Candidates");
    lp1 = 0;
    J0x6C3:

    // End:0x79C [Loop If]
    if(lp1 < candidates.Length)
    {
        Log((((((((((("    " $ string(lp1)) $ ". name=") $ string(candidates[lp1].Name)) $ " min-dist=") $ string(candidateMinDists[lp1])) $ " x=") $ string(candidates[lp1].Location.X)) $ ", y=") $ string(candidates[lp1].Location.Y)) $ ", z=") $ string(candidates[lp1].Location.Z));
        lp1++;
        // [Loop Continue]
        goto J0x6C3;
    }
    lp1 = 0;
    J0x7A3:

    // End:0x803 [Loop If]
    if(lp1 < Min(candidates.Length, MAX_TRY))
    {
        // End:0x7E2
        if(IsSafeFromEnemySight(candidates[lp1], Team))
        {
            return candidates[lp1];
            // [Explicit Continue]
            goto J0x7F9;
        }
        Log("  Skipped " $ string(lp1));
        J0x7F9:

        lp1++;
        // [Loop Continue]
        goto J0x7A3;
    }
    Log("  safety failed");
    pickRandom = Rand(Min(candidates.Length, MAX_TRY));
    Log(("  Picked " $ string(pickRandom)) $ " randomly");
    return candidates[pickRandom];
    //return;    
}

function array<Pawn> GetRecentlySpawnedAllyList()
{
    local array<Pawn> allies;

    return allies;
    //return;    
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

    // End:0x2AE [Loop If]
    if(lp1 < allies.Length)
    {
        ally = allies[lp1];
        Log((((("  " $ ally.OwnerName) $ " LastDamageDealtTime=") $ string(ally.LastDamageDealtTime)) $ " LastDamageReceiveTime=") $ string(ally.LastDamageReceiveTime));
        // End:0x292
        if(((Level.TimeSeconds - ally.LastDamageDealtTime) > SC.default.SafeSpawn_DAMAGE_DEAL_TIME) && (Level.TimeSeconds - ally.LastDamageReceiveTime) > SC.default.SafeSpawn_DAMAGE_RECEIVE_TIME)
        {
            hasCloseEnemy = false;
            lpEnemy = 0;
            J0x159:

            // End:0x251 [Loop If]
            if(lpEnemy < enemies.Length)
            {
                dist = VSize(ally.Location - enemies[lpEnemy].Location);
                // End:0x247
                if(dist < SC.default.SafeSpawn_DISABLE_DISTANCE)
                {
                    // End:0x209
                    if(enemies[lpEnemy].IsA('Pawn'))
                    {
                        Log((("  " $ Pawn(enemies[lpEnemy]).OwnerName) @ "is to close dist=") $ string(dist));                        
                    }
                    else
                    {
                        Log((("  " $ string(enemies[lpEnemy])) @ "is to close dist=") $ string(dist));
                    }
                    hasCloseEnemy = true;
                    // [Explicit Break]
                    goto J0x251;
                }
                lpEnemy++;
                // [Loop Continue]
                goto J0x159;
            }
            J0x251:

            // End:0x26F
            if(hasCloseEnemy)
            {
                Log("    not picked");                
            }
            else
            {
                safeAllies[safeAllies.Length] = ally;
                Log("    picked");
            }
            // [Explicit Continue]
            goto J0x2A4;
        }
        Log("    not picked");
        J0x2A4:

        lp1++;
        // [Loop Continue]
        goto J0x57;
    }
    return safeAllies;
    //return;    
}

function bool IsAnyAllyAlive(byte Team)
{
    local Controller C;

    Log("[GameInfo::IsAnyAllyAlive] team=" $ string(Team));
    C = Level.ControllerList;
    J0x41:

    // End:0x109 [Loop If]
    if(C != none)
    {
        // End:0xF2
        if(((C.Pawn != none) && !C.Pawn.IsInState('Dying')) && C.Pawn.PlayerReplicationInfo != none)
        {
            // End:0xF2
            if(C.Pawn.GetTeamNum() == int(Team))
            {
                Log(("  " $ C.Pawn.OwnerName) $ " is alive");
                return true;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x41;
    }
    Log("  no ally is alive");
    return false;
    //return;    
}

function array<Pawn> GetEveryAllyList(byte Team)
{
    local int lp1;
    local Pawn P;
    local array<Pawn> allies;

    lp1 = 0;
    J0x07:

    // End:0xAA [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0xA0
        if(((P != none) && !P.IsInState('Dying')) && P.PlayerReplicationInfo != none)
        {
            // End:0xA0
            if(P.GetTeamNum() == int(Team))
            {
                allies[allies.Length] = P;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return allies;
    //return;    
}

function UpdatePositionLog()
{
    local int lp1;
    local Pawn P;
    local Vector vMoveDir;

    lp1 = 0;
    J0x07:

    // End:0x7B8 [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0x7AE
        if(((P != none) && !P.IsInState('Dying')) && P.PlayerReplicationInfo != none)
        {
            vMoveDir = P.Location - P.PrevLocation;
            vMoveDir.Z = 0.0000000;
            vMoveDir = Normal(vMoveDir);
            // End:0x55B
            if(vMoveDir == P.PrevMoveDir)
            {
                // End:0x558
                if(VSize(P.Acceleration) == 0.0000000)
                {
                    // End:0x312
                    if(P.PrevLocation != P.Location)
                    {
                        CombatLog((((((((((((((((((((("[MOVING_EVENT] CurTime=" $ string(Level.GetLocalPlayerController().myHUD.GetCurGameTime())) $ " UserName=") $ P.PlayerReplicationInfo.PlayerName) $ " TeamIndex=") $ string(P.PlayerReplicationInfo.SideID)) $ " WeaponID=") $ string(P.Weapon.BaseParams.iWeaponID)) $ " PosX=") $ string(P.Location.X)) $ " PosY=") $ string(P.Location.Y)) $ " PosZ=") $ string(P.Location.Z)) $ " PrevTime=") $ string(P.PrevTime)) $ " PrevPosX=") $ string(P.PrevInterpoLocation.X)) $ " PrevPosY=") $ string(P.PrevInterpoLocation.Y)) $ " PrevPosZ=") $ string(P.PrevInterpoLocation.Z));
                        P.PrevInterpoLocation = P.Location;
                        P.PrevTime = Level.GetLocalPlayerController().myHUD.GetCurGameTime();                        
                    }
                    else
                    {
                        // End:0x558
                        if(float(P.PrevTime - Level.GetLocalPlayerController().myHUD.GetCurGameTime()) > 10.0000000)
                        {
                            CombatLog((((((((((((((((((((("[MOVING_EVENT] CurTime=" $ string(Level.GetLocalPlayerController().myHUD.GetCurGameTime())) $ " UserName=") $ P.PlayerReplicationInfo.PlayerName) $ " TeamIndex=") $ string(P.PlayerReplicationInfo.SideID)) $ " WeaponID=") $ string(P.Weapon.BaseParams.iWeaponID)) $ " PosX=") $ string(P.Location.X)) $ " PosY=") $ string(P.Location.Y)) $ " PosZ=") $ string(P.Location.Z)) $ " PrevTime=") $ string(P.PrevTime)) $ " PrevPosX=") $ string(P.PrevInterpoLocation.X)) $ " PrevPosY=") $ string(P.PrevInterpoLocation.Y)) $ " PrevPosZ=") $ string(P.PrevInterpoLocation.Z));
                            P.PrevInterpoLocation = P.Location;
                            P.PrevTime = Level.GetLocalPlayerController().myHUD.GetCurGameTime();
                        }
                    }
                }                
            }
            else
            {
                // End:0x77D
                if(VSize(P.Acceleration) > 0.0000000)
                {
                    CombatLog((((((((((((((((((((("[MOVING_EVENT] CurTime=" $ string(Level.GetLocalPlayerController().myHUD.GetCurGameTime())) $ " UserName=") $ P.PlayerReplicationInfo.PlayerName) $ " TeamIndex=") $ string(P.PlayerReplicationInfo.SideID)) $ " WeaponID=") $ string(P.Weapon.BaseParams.iWeaponID)) $ " PosX=") $ string(P.Location.X)) $ " PosY=") $ string(P.Location.Y)) $ " PosZ=") $ string(P.Location.Z)) $ " PrevTime=") $ string(P.PrevTime)) $ " PrevPosX=") $ string(P.PrevInterpoLocation.X)) $ " PrevPosY=") $ string(P.PrevInterpoLocation.Y)) $ " PrevPosZ=") $ string(P.PrevInterpoLocation.Z));
                    P.PrevInterpoLocation = P.Location;
                    P.PrevTime = Level.GetLocalPlayerController().myHUD.GetCurGameTime();
                }
            }
            P.PrevLocation = P.Location;
            P.PrevMoveDir = vMoveDir;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function array<Actor> GetEveryEnemyList(byte myTeam)
{
    local int lp1;
    local Pawn P;
    local array<Actor> enemies;

    lp1 = 0;
    J0x07:

    // End:0xAA [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0xA0
        if(((P != none) && !P.IsInState('Dying')) && P.PlayerReplicationInfo != none)
        {
            // End:0xA0
            if(P.GetTeamNum() != int(myTeam))
            {
                enemies[enemies.Length] = P;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return enemies;
    //return;    
}

function array<Actor> GetEveryEnemyList2(byte myTeam)
{
    local int lp1;
    local Pawn P;
    local array<Actor> enemies;

    lp1 = 0;
    J0x07:

    // End:0xD3 [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0xC9
        if(((P != none) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.IsDead != true)
        {
            // End:0x9C
            if(P.PlayerReplicationInfo.IsInvulnerable == true)
            {
                // [Explicit Continue]
                goto J0xC9;
            }
            // End:0xC9
            if(P.GetTeamNum() != int(myTeam))
            {
                enemies[enemies.Length] = P;
            }
        }
        J0xC9:

        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    Sort_KillSuccessionOfEnemy(enemies);
    return enemies;
    //return;    
}

function array<Actor> GetDefenceModeEnemyList(byte myTeam)
{
    local int lp1;
    local Pawn P;
    local array<Actor> enemies;

    lp1 = 0;
    J0x07:

    // End:0x7B [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0x71
        if(P != none)
        {
            // End:0x71
            if(P.TeamIndex != int(myTeam))
            {
                enemies[enemies.Length] = P;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x93
    if(int(myTeam) == 1)
    {
        Sort_KillSuccessionOfEnemy(enemies);
    }
    return enemies;
    //return;    
}

function array<Actor> GetPersonalEnemyList(Pawn myPawn)
{
    local int lp1;
    local Pawn P;
    local array<Actor> enemies;

    lp1 = 0;
    J0x07:

    // End:0xCA [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = Level.PawnList[lp1];
        // End:0xC0
        if(((P != none) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.IsDead != true)
        {
            // End:0xC0
            if(P.PlayerReplicationInfo.PlayerID != myPawn.PlayerReplicationInfo.PlayerID)
            {
                enemies[enemies.Length] = P;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return enemies;
    //return;    
}

function Sort_KillSuccessionOfEnemy(out array<Actor> enemies)
{
    local int lp1, lp2;
    local Actor tmp;

    lp1 = 0;
    J0x07:

    // End:0xCE [Loop If]
    if(lp1 < (enemies.Length - 1))
    {
        lp2 = lp1 + 1;
        J0x28:

        // End:0xC4 [Loop If]
        if(lp2 < enemies.Length)
        {
            // End:0xBA
            if(Pawn(enemies[lp1]).PlayerReplicationInfo.KillSuccession < Pawn(enemies[lp2]).PlayerReplicationInfo.KillSuccession)
            {
                tmp = enemies[lp1];
                enemies[lp1] = enemies[lp2];
                enemies[lp2] = tmp;
            }
            lp2++;
            // [Loop Continue]
            goto J0x28;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    else
    {
        Log("  do not have recenlty spawned ally");
        safeAllyList = GetSafeAllyList(Team);
        // End:0xD8
        if(safeAllyList.Length > 0)
        {
            Log("  picking randomly from safe allies");
            pickedAlly = safeAllyList[Rand(safeAllyList.Length)];            
        }
        else
        {
            Log("  NSA: no safe allies");
            Log("  picking randomly from enemy allies");
            allyList = GetEveryAllyList(Team);
            pickedAlly = allyList[Rand(allyList.Length)];
        }
    }
    Log("  picked " $ pickedAlly.OwnerName);
    // End:0x1C1
    if(bLeaveRespawnLogInChat)
    {
        Level.GetLocalPlayerController().myHUD.AddTextMessage("Picked Ally=" $ pickedAlly.OwnerName, Class'Engine_Decompressed.GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
    }
    return pickedAlly;
    //return;    
}

function bool IsSafeFromEnemySight(NavigationPoint N, byte Team)
{
    local int lp1;
    local array<Actor> enemies;
    local Vector Foot, crouch, stand, enemyFoot, enemyCrouch, enemyStand;

    Log("[GameInfo::IsSafeFromEnemySight] team=" $ string(Team));
    Log((((((("  PointName=" $ string(N.Name)) $ " x=") $ string(N.Location.X)) $ " y=") $ string(N.Location.Y)) $ " z=") $ string(N.Location.Z));
    enemies = GetEveryEnemyList(Team);
    Foot = N.Location;
    crouch = Foot;
    crouch.Z += Class'Engine_Decompressed.Pawn'.default.CrouchHeight;
    stand = Foot;
    stand.Z += Class'Engine_Decompressed.Pawn'.default.EyeHeight;
    lp1 = 0;
    J0x125:

    // End:0x26D [Loop If]
    if(lp1 < enemies.Length)
    {
        enemyFoot = enemies[lp1].Location;
        // End:0x1D2
        if(enemies[lp1].IsA('Pawn'))
        {
            Log((((((("  Enemy " $ Pawn(enemies[lp1]).OwnerName) $ " at x=") $ string(enemyFoot.X)) $ " y=") $ string(enemyFoot.Y)) $ " z=") $ string(enemyFoot.Z));
        }
        enemyCrouch = enemyFoot;
        enemyCrouch.Z += Class'Engine_Decompressed.Pawn'.default.CrouchHeight;
        enemyStand = enemyFoot;
        enemyStand.Z += Class'Engine_Decompressed.Pawn'.default.EyeHeight;
        // End:0x259
        if(FastTrace(stand, enemyStand) && FastTrace(crouch, enemyCrouch))
        {
            Log("    i can see it!!");
            return false;
            // [Explicit Continue]
            goto J0x263;
        }
        Log("    ok");
        J0x263:

        lp1++;
        // [Loop Continue]
        goto J0x125;
    }
    return true;
    //return;    
}

function SortNavigationPoints(Actor center, out array<NavigationPoint> candidates, out array<float> candidateDists)
{
    SortNavigationPoints2(center.Location, candidates, candidateDists);
    //return;    
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

    // End:0x82 [Loop If]
    if(lp1 < candidates.Length)
    {
        dist = VSize(centerLoc - candidates[lp1].Location);
        candidateDists[candidateDists.Length] = dist;
        lp1++;
        // [Loop Continue]
        goto J0x33;
    }
    lp1 = 1;
    J0x89:

    // End:0x15F [Loop If]
    if(lp1 < candidates.Length)
    {
        N = candidates[lp1];
        dist = candidateDists[lp1];
        lp2 = lp1 - 1;
        J0xC9:

        // End:0x12D [Loop If]
        if(lp2 >= 0)
        {
            // End:0x120
            if(candidateDists[lp2] > dist)
            {
                candidateDists[lp2 + 1] = candidateDists[lp2];
                candidates[lp2 + 1] = candidates[lp2];
                // [Explicit Continue]
                goto J0x123;
            }
            // [Explicit Break]
            goto J0x12D;
            J0x123:

            lp2--;
            // [Loop Continue]
            goto J0xC9;
        }
        J0x12D:

        candidates[lp2 + 1] = N;
        candidateDists[lp2 + 1] = dist;
        lp1++;
        // [Loop Continue]
        goto J0x89;
    }
    Log("  sorted candidates");
    lp1 = 0;
    J0x17D:

    // End:0x1D5 [Loop If]
    if(lp1 < candidates.Length)
    {
        Log((("    name=" $ string(candidates[lp1].Name)) $ " dist=") $ string(candidateDists[lp1]));
        lp1++;
        // [Loop Continue]
        goto J0x17D;
    }
    //return;    
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
    // End:0xC8
    if(P != none)
    {
        Log((((((("  Ally Name=" $ P.OwnerName) $ " x=") $ string(P.Location.X)) $ " y=") $ string(P.Location.Y)) $ " z=") $ string(P.Location.Z));
    }
    Log("  creating candidates");
    lp1 = 0;
    J0xE8:

    // End:0x14A [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        S = EveryPlayerStarts[lp1];
        // End:0x140
        if((IsAppropriateRespawnPoint(S, Team)) && !IsRespawnPointFailedRecently(S))
        {
            candidates[candidates.Length] = S;
        }
        lp1++;
        // [Loop Continue]
        goto J0xE8;
    }
    SortNavigationPoints(A, candidates, candidateDists);
    Log("  returning");
    lp1 = 0;
    J0x175:

    // End:0x1EC [Loop If]
    if(lp1 < Min(candidates.Length, Count))
    {
        returnList[returnList.Length] = candidates[lp1];
        Log((("    name=" $ string(candidates[lp1].Name)) $ " dist=") $ string(candidateDists[lp1]));
        lp1++;
        // [Loop Continue]
        goto J0x175;
    }
    return returnList;
    //return;    
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

    DISABLE_DISTANCE = 2000.0000000;
    MAX_SAFE_CHECK = 3;
    Log("[GameInfo::GetRespawnPointRatingEnemy]");
    // End:0x109
    if(giveNearnessScore)
    {
        Log("  giving scores by closeness to the ally/flag");
        lp1 = 0;
        J0x7E:

        // End:0x106 [Loop If]
        if(lp1 < respawnCandidates.Length)
        {
            respawnCandidateScores[lp1] = float(int(Round(float(lp1) / float(2)))) / float(10);
            respawnCandidateEnabled[lp1] = 1;
            Log((("    " $ string(respawnCandidates[lp1].Name)) $ " score=") $ string(respawnCandidateScores[lp1]));
            lp1++;
            // [Loop Continue]
            goto J0x7E;
        }        
    }
    else
    {
        lp1 = 0;
        J0x110:

        // End:0x149 [Loop If]
        if(lp1 < respawnCandidates.Length)
        {
            respawnCandidateScores[lp1] = 0.0000000;
            respawnCandidateEnabled[lp1] = 1;
            lp1++;
            // [Loop Continue]
            goto J0x110;
        }
    }
    enemyList = GetEveryEnemyList(Team);
    Log("  giving scores by distance to closest enemy");
    lpCandidate = 0;
    J0x191:

    // End:0x335 [Loop If]
    if(lpCandidate < respawnCandidates.Length)
    {
        closestDistance = 99999.0000000;
        lpEnemy = 0;
        J0x1B3:

        // End:0x22B [Loop If]
        if(lpEnemy < enemyList.Length)
        {
            Distance = VSize(respawnCandidates[lpCandidate].Location - enemyList[lpEnemy].Location);
            // End:0x20F
            if(closestDistance > Distance)
            {
                closestDistance = Distance;
            }
            // End:0x221
            if(Distance < DISABLE_DISTANCE)
            {
                // [Explicit Break]
                goto J0x22B;
            }
            lpEnemy++;
            // [Loop Continue]
            goto J0x1B3;
        }
        J0x22B:

        Log((("    name=" $ string(respawnCandidates[lpCandidate].Name)) $ " closest enemy at ") $ string(closestDistance));
        // End:0x2A1
        if(closestDistance < DISABLE_DISTANCE)
        {
            respawnCandidateEnabled[lpCandidate] = 0;
            Log("      disabled");            
        }
        else
        {
            // End:0x2C6
            if(closestDistance < float(1700))
            {
                respawnCandidateScores[lpCandidate] += float(3);                
            }
            else
            {
                // End:0x2EB
                if(closestDistance < float(2600))
                {
                    respawnCandidateScores[lpCandidate] += float(2);                    
                }
                else
                {
                    // End:0x30C
                    if(closestDistance < float(3500))
                    {
                        respawnCandidateScores[lpCandidate] += float(1);
                    }
                }
            }
        }
        Log("      score=" $ string(respawnCandidateScores[lpCandidate]));
        lpCandidate++;
        // [Loop Continue]
        goto J0x191;
    }
    SHUFFLE_COUNT = 25;
    lp1 = 0;
    J0x344:

    // End:0x433 [Loop If]
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
        lp1++;
        // [Loop Continue]
        goto J0x344;
    }
    Log("  shuffled");
    lp1 = 0;
    J0x448:

    // End:0x4CC [Loop If]
    if(lp1 < respawnCandidates.Length)
    {
        Log((((((("    " $ string(lp1)) $ " - name=") $ string(respawnCandidates[lp1].Name)) $ " score=") $ string(respawnCandidateScores[lp1])) $ " enable=") $ string(respawnCandidateEnabled[lp1]));
        lp1++;
        // [Loop Continue]
        goto J0x448;
    }
    lp1 = 1;
    J0x4D3:

    // End:0x5E8 [Loop If]
    if(lp1 < respawnCandidateScores.Length)
    {
        tempScore = respawnCandidateScores[lp1];
        tempPoint = respawnCandidates[lp1];
        tempEnable = respawnCandidateEnabled[lp1];
        lp2 = lp1 - 1;
        J0x524:

        // End:0x5A2 [Loop If]
        if(lp2 >= 0)
        {
            // End:0x595
            if(tempScore < respawnCandidateScores[lp2])
            {
                respawnCandidateScores[lp2 + 1] = respawnCandidateScores[lp2];
                respawnCandidates[lp2 + 1] = respawnCandidates[lp2];
                respawnCandidateEnabled[lp2 + 1] = respawnCandidateEnabled[lp2];
                // [Explicit Continue]
                goto J0x598;
            }
            // [Explicit Break]
            goto J0x5A2;
            J0x598:

            lp2--;
            // [Loop Continue]
            goto J0x524;
        }
        J0x5A2:

        respawnCandidateScores[lp2 + 1] = tempScore;
        respawnCandidates[lp2 + 1] = tempPoint;
        respawnCandidateEnabled[lp2 + 1] = tempEnable;
        lp1++;
        // [Loop Continue]
        goto J0x4D3;
    }
    Log("  sorted");
    lp1 = 0;
    J0x5FB:

    // End:0x67F [Loop If]
    if(lp1 < respawnCandidates.Length)
    {
        Log((((((("    " $ string(lp1)) $ " - name=") $ string(respawnCandidates[lp1].Name)) $ " score=") $ string(respawnCandidateScores[lp1])) $ " enable=") $ string(respawnCandidateEnabled[lp1]));
        lp1++;
        // [Loop Continue]
        goto J0x5FB;
    }
    Log("  checking safety");
    checkLeft = MAX_SAFE_CHECK;
    lpCandidate = 0;
    J0x6A6:

    // End:0x7C9 [Loop If]
    if(lpCandidate < respawnCandidates.Length)
    {
        Log((("    " $ string(lpCandidate)) $ " name=") $ string(respawnCandidates[lpCandidate].Name));
        // End:0x7B1
        if(int(respawnCandidateEnabled[lpCandidate]) == 1)
        {
            // End:0x798
            if(IsSafeFromEnemySight(respawnCandidates[lpCandidate], Team))
            {
                Log("      return this");
                // End:0x789
                if(bLeaveRespawnLogInChat)
                {
                    Level.GetLocalPlayerController().myHUD.AddTextMessage("Score=" $ string(respawnCandidateScores[lpCandidate]), Class'Engine_Decompressed.GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
                }
                return respawnCandidates[lpCandidate];                
            }
            else
            {
                Log("      not safe");
                checkLeft--;
            }
        }
        // End:0x7BF
        if(checkLeft == 0)
        {
            // [Explicit Break]
            goto J0x7C9;
        }
        lpCandidate++;
        // [Loop Continue]
        goto J0x6A6;
    }
    J0x7C9:

    return none;
    //return;    
}

function LogFinalRespawnPoint(NavigationPoint respawnPoint, byte Team)
{
    local array<Actor> enemies;
    local int lp1;
    local float minDist, dist;
    local Pawn Pawn;

    enemies = GetEveryEnemyList(Team);
    Log("  distance to enemies");
    minDist = 99999.0000000;
    lp1 = 0;
    J0x3C:

    // End:0x209 [Loop If]
    if(lp1 < enemies.Length)
    {
        dist = VSize(respawnPoint.Location - enemies[lp1].Location);
        // End:0xA8
        if(minDist > dist)
        {
            minDist = dist;
            Pawn = Pawn(enemies[lp1]);
        }
        // End:0x168
        if(enemies[lp1].IsA('Pawn'))
        {
            Log((((((((("    name=" $ Pawn(enemies[lp1]).OwnerName) @ "dist=") $ string(dist)) @ "x=") $ string(enemies[lp1].Location.X)) @ "y=") $ string(enemies[lp1].Location.Y)) @ "z=") $ string(enemies[lp1].Location.Z));
            // [Explicit Continue]
            goto J0x1FF;
        }
        Log((((((((("    name=" $ string(enemies[lp1])) @ "dist=") $ string(dist)) @ "x=") $ string(enemies[lp1].Location.X)) @ "y=") $ string(enemies[lp1].Location.Y)) @ "z=") $ string(enemies[lp1].Location.Z));
        J0x1FF:

        lp1++;
        // [Loop Continue]
        goto J0x3C;
    }
    // End:0x287
    if(bLeaveRespawnLogInChat)
    {
        Level.GetLocalPlayerController().myHUD.AddTextMessage((("Closeset Enemy=" $ Pawn.OwnerName) @ "at dist=") $ string(minDist), Class'Engine_Decompressed.GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
    }
    Log((((((("  @@@final decision - name=" $ string(respawnPoint.Name)) $ " at x=") $ string(respawnPoint.Location.X)) $ " y=") $ string(respawnPoint.Location.Y)) $ " z=") $ string(respawnPoint.Location.Z));
    Log("@-------------------");
    //return;    
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
    // End:0xCC
    if(EverySDPlayerStarts.Length == 0)
    {
        Log("EverySDPlayerStarts.length == 0");
        // End:0xBC
        if(EveryPlayerStarts.Length == 0)
        {
            Log("EveryPlayerStarts.length == 0");
            // End:0xB8
            foreach AllActors(Class'Engine_Decompressed.NavigationPoint', N)
            {
                respawn = N;
                // End:0xB8
                break;                
            }                        
        }
        else
        {
            respawn = EveryPlayerStarts[0];
        }        
    }
    else
    {
        lp1 = 0;
        J0xD3:

        // End:0x15B [Loop If]
        if(lp1 < EverySDPlayerStarts.Length)
        {
            S = EverySDPlayerStarts[lp1];
            Type = S.eTeamType;
            // End:0x151
            if(((int(Type) == int(Team)) && !IsRespawnPointFailedRecently(S)) && !IsAnyPawnWithinRadius(S))
            {
                candidates[candidates.Length] = S;
            }
            lp1++;
            // [Loop Continue]
            goto J0xD3;
        }
        Log("length=" $ string(candidates.Length));
        // End:0x17F
        if(candidates.Length == 0)
        {            
        }
        else
        {
            S = candidates[Rand(candidates.Length)];
            Log((("trying" @ string(S.Name)) @ "type=") $ string(GetEnum(Enum'Core.Object.ESpawnTeam', int(S.eTeamType))));
            respawn = S;
        }
        // End:0x254
        if(respawn == none)
        {
            lp1 = 0;
            J0x1F4:

            // End:0x254 [Loop If]
            if(lp1 < EverySDPlayerStarts.Length)
            {
                S = EverySDPlayerStarts[lp1];
                Type = S.eTeamType;
                // End:0x24A
                if(int(Type) == int(Team))
                {
                    respawn = S;
                    // [Explicit Break]
                    goto J0x254;
                }
                lp1++;
                // [Loop Continue]
                goto J0x1F4;
            }
        }
    }
    J0x254:

    LogFinalRespawnPoint(respawn, Team);
    return respawn;
    //return;    
}

function LogNavigationPoints(array<NavigationPoint> ns)
{
    local int lp1;
    local PlayerStart S;

    Log("[LogNavigationPoints] at " $ string(Level.TimeSeconds));
    lp1 = 0;
    J0x36:

    // End:0xAF [Loop If]
    if(lp1 < ns.Length)
    {
        S = PlayerStart(ns[lp1]);
        Log((("    class=" $ string(S.Class)) $ " lastSpawnFailTime=") $ string(S.LastSpawnFailTime));
        lp1++;
        // [Loop Continue]
        goto J0x36;
    }
    //return;    
}

event bool IsSDRespawnTime()
{
    return ((float(GameReplicationInfo.ElapsedTime) < SDRespawnTime) || Level.GetMatchMaker().BeginnerMode) || Level.GetMatchMaker().IsSDRespawn();
    //return;    
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
        Log((((("[GameInfo::FindPlayerStart] at " $ string(Level.TimeSeconds)) $ " for ") $ Player.PlayerReplicationInfo.PlayerName) @ "or") @ string(Player.Name));        
    }
    else
    {
        Log(("[GameInfo::FindPlayerStart] at " $ string(Level.TimeSeconds)) $ " for Player=none");
    }
    // End:0x161
    if(none != Player)
    {
        // End:0x161
        if(none != Player.StartSpot)
        {
            // End:0x161
            if(int(Level.NetMode) == int(NM_Standalone))
            {
                // End:0x161
                if(bWaitingToStartMatch || (none != Player.PlayerReplicationInfo) && Player.PlayerReplicationInfo.bWaitingPlayer)
                {
                    return Player.StartSpot;
                }
            }
        }
    }
    // End:0x1A1
    if(GameRulesModifiers != none)
    {
        N = GameRulesModifiers.FindPlayerStart(Player, inTeam, incomingName);
        // End:0x1A1
        if(N != none)
        {
            return N;
        }
    }
    // End:0x1E0
    if(incomingName != "")
    {
        // End:0x1DF
        foreach AllActors(Class'Engine_Decompressed.Teleporter', Tel)
        {
            // End:0x1DE
            if(string(Tel.Tag) ~= incomingName)
            {                
                return Tel;
            }            
        }        
    }
    // End:0x257
    if((Player != none) && Player.PlayerReplicationInfo != none)
    {
        // End:0x249
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
    // End:0x278
    if(int(Team) == 255)
    {
        Team = 0;
    }
    // End:0x3F4
    if(Level.GetMatchMaker().TR_bNewRespawn)
    {
        bLeaveRespawnLogInChat = bLeaveRespawnLogInChatReal && Player == Level.GetLocalPlayerController();
        // End:0x2D4
        if(IsSDRespawnTime())
        {
            return FindPlayerStart_SD(Team);            
        }
        else
        {
            // End:0x2F6
            if(IsRespawnSpecialCase())
            {
                respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);                
            }
            else
            {
                // End:0x381
                if(IsAnyAllyAlive(Team))
                {
                    pickedAlly = PickAlly(Team);
                    respawnPoint = GetRespawnPointRatingEnemy(true, GetRespawnPointsSortedByClosenessTo(pickedAlly, Team, 5), Team);
                    // End:0x37E
                    if(respawnPoint == none)
                    {
                        Log("  RNAF: respawn near ally failed");
                        respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
                    }                    
                }
                else
                {
                    respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
                }
            }
            // End:0x3DB
            if(respawnPoint == none)
            {
                Log("!!!ACHTUNG!!!! NO RESPAWN POINT!");
                // End:0x3DA
                foreach AllActors(Class'Engine_Decompressed.NavigationPoint', respawnPoint)
                {
                    // End:0x3DA
                    break;                    
                }                
            }
            LogFinalRespawnPoint(respawnPoint, Team);
            return respawnPoint;
        }        
    }
    else
    {
        N = Level.NavigationPointList;
        J0x408:

        // End:0x46A [Loop If]
        if(N != none)
        {
            NewRating = RatePlayerStart(N, Team, Player);
            // End:0x453
            if(NewRating > BestRating)
            {
                BestRating = NewRating;
                BestStart = N;
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0x408;
        }
        // End:0x572
        if((BestStart == none) || ((PlayerStart(BestStart) == none) && Player != none) && Player.bIsPlayer)
        {
            Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
            BestRating = -100000000.0000000;
            // End:0x571
            foreach AllActors(Class'Engine_Decompressed.NavigationPoint', N)
            {
                NewRating = RatePlayerStart(N, 0, Player);
                // End:0x53C
                if(InventorySpot(N) != none)
                {
                    NewRating -= float(50);
                }
                NewRating += (float(20) * FRand());
                // End:0x570
                if(NewRating > BestRating)
                {
                    BestRating = NewRating;
                    BestStart = N;
                }                
            }            
        }
        return BestStart;
    }
    //return;    
}

function NavigationPoint FindPlayerStart_TU(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint respawnPoint;

    return respawnPoint;
    //return;    
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart P;

    P = PlayerStart(N);
    // End:0x51
    if(P != none)
    {
        // End:0x4B
        if(P.bSinglePlayerStart)
        {
            // End:0x45
            if(P.bEnabled)
            {
                return 1000.0000000;
            }
            return 20.0000000;
        }
        return 10.0000000;
    }
    return 0.0000000;
    //return;    
}

function bool CheckLives(PlayerReplicationInfo Scorer)
{
    return false;
    //return;    
}

function CheckScore(PlayerReplicationInfo Scorer)
{
    // End:0x26
    if((GameRulesModifiers != none) && GameRulesModifiers.CheckScore(Scorer))
    {
        return;
    }
    //return;    
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
    // End:0x29
    if(GameStats != none)
    {
        GameStats.ScoreEvent(Who, Points, Desc);
    }
    //return;    
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
    // End:0x29
    if(GameStats != none)
    {
        GameStats.TeamScoreEvent(Team, Points, Desc);
    }
    //return;    
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
    //return;    
}

function float GetAddScore(Controller Killer, Controller Other)
{
    // End:0x1D
    if(Other.IsA('wHelicopterController'))
    {
        return GameAddScore_KillHeli;        
    }
    else
    {
        // End:0x3A
        if(Other.IsA('wAISentryGunController'))
        {
            return 20.0000000;            
        }
        else
        {
            return GameAddScore;
        }
    }
    //return;    
}

function ScoreKill_Suicide(Controller Killer, Controller Other)
{
    // End:0x127
    if((Other != none) && Other.PlayerReplicationInfo != none)
    {
        Other.PlayerReplicationInfo.Score = FMax(0.0000000, Other.PlayerReplicationInfo.Score - GameDecScore);
        Other.PlayerReplicationInfo.fExp = FMax(0.0000000, Other.PlayerReplicationInfo.fExp - GameDecExp);
        Other.PlayerReplicationInfo.Point = FMax(0.0000000, Other.PlayerReplicationInfo.Point - GameDecPoint);
        Other.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
        ScoreEvent(Other.PlayerReplicationInfo, GameDecScore, "self_frag");
    }
    //return;    
}

function ScoreKill(Controller Killer, Controller Other)
{
    local int AddExp, AddPoint;
    local float addScore;

    // End:0x2F
    if((Killer == Other) || Killer == none)
    {
        ScoreKill_Suicide(Killer, Other);        
    }
    else
    {
        // End:0x3F7
        if(Killer.PlayerReplicationInfo != none)
        {
            GetMultykillBonusPoint(Killer, AddExp, AddPoint);
            addScore = GetAddScore(Killer, Other);
            Killer.PlayerReplicationInfo.Score += addScore;
            Killer.PlayerReplicationInfo.fExp += (GameAddExp + float(AddExp));
            Killer.PlayerReplicationInfo.Point += (GameAddPoint + float(AddPoint));
            Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
            Killer.PlayerReplicationInfo.Kills++;
            ScoreEvent(Killer.PlayerReplicationInfo, addScore, "frag");
            // End:0x18E
            if(Other.IsA('wHelicopterController'))
            {
                Killer.PlayerReplicationInfo.fExp += float(15);
                Killer.PlayerReplicationInfo.Point += float(5);                
            }
            else
            {
                // End:0x1DC
                if(Other.IsA('wAISentryGunController'))
                {
                    Killer.PlayerReplicationInfo.fExp += float(15);
                    Killer.PlayerReplicationInfo.Point += float(5);
                }
            }
            // End:0x1FF
            if(Killer.IsA('PlayerController') && GameAddScore != float(0))
            {
            }
            Other.PlayerReplicationInfo.fExp = FMax(0.0000000, Other.PlayerReplicationInfo.fExp - GameDecExp);
            Other.PlayerReplicationInfo.Point = FMax(0.0000000, Other.PlayerReplicationInfo.Point - GameDecPoint);
            PlayerController(Killer).ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_Kill, SC.KillWeaponType, SC.KDLog.KillWeapon);
            // End:0x325
            if(Level.GetMatchMaker().PlayWithBots)
            {
                PlayerController(Killer).ReceiveMessage_QuestType3(Class'Engine_Decompressed.wMessage_Quest', Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_KillInBotMode, SC.KillWeaponType, SC.KDLog.KillWeapon);
            }
            // End:0x38D
            if(SC.KDLog.KillWeapon == 99999)
            {
                PlayerController(Killer).ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_MeeleAttackKill, SC.KillWeaponType, SC.KDLog.KillWeapon);                
            }
            else
            {
                // End:0x3E7
                if(SC.IsWeaponAiming)
                {
                    PlayerController(Killer).ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_AimedKill, SC.KillWeaponType, SC.KDLog.KillWeapon);
                }
            }
            SetAssistPoint(Killer, Other);
        }
    }
    SendSeverScoreAndAssist(Killer, Other);
    // End:0x42B
    if(GameRulesModifiers != none)
    {
        GameRulesModifiers.ScoreKill(Killer, Other);
    }
    // End:0x457
    if((Killer != none) || MaxLives > 0)
    {
        CheckScore(Killer.PlayerReplicationInfo);
    }
    //return;    
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

    // End:0x1B7 [Loop If]
    if(iTemp < AssistList.Length)
    {
        PC = AssistList[iTemp];
        // End:0x1AD
        if(((PC != none) && PC.PlayerReplicationInfo != none) && PC != Killer)
        {
            iPlayerID = PC.PlayerReplicationInfo.GetUID();
            // End:0x1AD
            if(iPlayerID != -1)
            {
                SC.AssistUIDs[SC.AssistUIDs.Length] = iPlayerID;
                SC.AssistType[SC.AssistType.Length] = PC.PlayerReplicationInfo.AssistType;
                Log((((((string(self) $ " SendSeverScoreAndAssist : /PlayerID:") $ string(iPlayerID)) $ "/PlayerName:") $ PC.PlayerReplicationInfo.PlayerName) $ "/ AssistType:") $ string(PC.PlayerReplicationInfo.AssistType));
            }
        }
        iTemp++;
        // [Loop Continue]
        goto J0x47;
    }
    // End:0x1DF
    if(!Other.Pawn.IsA('wHelicopter'))
    {
        KDLOG_Finalize();        
    }
    else
    {
        iPlayerID = self.GetCharKillUID(Killer);
        KDLOG_Finalize_HeliCopter(iPlayerID, Killer, Other);
    }
    //return;    
}

function int GetAssistScore(out byte byAssistType, int iMessageCode)
{
    local float fAssistScore;

    switch(iMessageCode)
    {
        // End:0x2E
        case Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist:
            byAssistType = 3;
            fAssistScore = GameAssistScore;
            // End:0x82
            break;
        // End:0x55
        case Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist4:
            byAssistType = 4;
            fAssistScore = 4.0000000;
            // End:0x82
            break;
        // End:0x7C
        case Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist5:
            byAssistType = 5;
            fAssistScore = 5.0000000;
            // End:0x82
            break;
        // End:0xFFFF
        default:
            // End:0x82
            break;
            break;
    }
    Log((((string(self) $ "/ iMessageCode : ") $ string(iMessageCode)) $ " / fAssistScore :") $ string(fAssistScore));
    return int(fAssistScore);
    //return;    
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
        fAssistScore = 6.0000000;
        iMessageCode = Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist_Special;        
    }
    else
    {
        fAssistScore = GameAssistScore;
        iMessageCode = Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist;
    }
    iTemp = 0;
    J0x9C:

    // End:0x345 [Loop If]
    if(iTemp < AssistList.Length)
    {
        // End:0xD7
        if((AssistList[iTemp] == none) || Killer == AssistList[iTemp])
        {
            // [Explicit Continue]
            goto J0x33B;
        }
        // End:0x198
        if(kMM.IsFixedAssistPoint && Other.Pawn != none)
        {
            AssisterUID = AssistList[iTemp].PlayerReplicationInfo.GetUID();
            Log((string(self) $ "/ AssisterUID : ") $ string(AssisterUID));
            // End:0x180
            if(iMessageCode == Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist)
            {
                iMessageCode = Other.Pawn.GetAssistScore(AssisterUID);
            }
            fAssistScore = float(GetAssistScore(byAssistType, iMessageCode));
        }
        AssistList[iTemp].PlayerReplicationInfo.Score += fAssistScore;
        AssistList[iTemp].PlayerReplicationInfo.fExp += GameAssistExp;
        AssistList[iTemp].PlayerReplicationInfo.Point += GameAssistPoint;
        AssistList[iTemp].PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
        AssistList[iTemp].PlayerReplicationInfo.Assists++;
        AssistList[iTemp].PlayerReplicationInfo.AssistType = byAssistType;
        // End:0x2B1
        if(PlayerController(AssistList[iTemp]) != none)
        {
            PlayerController(AssistList[iTemp]).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Score', iMessageCode);
        }
        AssistList[iTemp].ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_Assist, SC.KillWeaponType, SC.KDLog.KillWeapon);
        // End:0x33B
        if((AssistList[iTemp].PlayerReplicationInfo != none) || MaxLives > 0)
        {
            CheckScore(AssistList[iTemp].PlayerReplicationInfo);
        }
        J0x33B:

        iTemp++;
        // [Loop Continue]
        goto J0x9C;
    }
    //return;    
}

function SendMessageAddScore(Controller ReceiveController, Controller Killer, Controller Other, int KillWeapon, optional int iConKillorHeadShot)
{
    local int addScore, iCode_Message;

    addScore = int(GetAddScore(Killer, Other));
    // End:0x37
    if((Killer == Other) || Killer == none)
    {        
    }
    else
    {
        // End:0x3EF
        if(Killer.IsA('PlayerController') && addScore != 0)
        {
            // End:0x95
            if(Other.IsA('wHelicopterController'))
            {
                PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Score', Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Heli_Killed);
                return;
            }
            // End:0xD2
            if(Other.IsA('wAISentryGunController'))
            {
                PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Score', Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Sentry);
                return;
            }
            // End:0x107
            if((iConKillorHeadShot & 1) == 0)
            {
                PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Score', Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Normal);
            }
            // End:0x131
            if(((iConKillorHeadShot & 2) == 2) || (iConKillorHeadShot & 1024) == 1024)
            {
                return;
            }
            switch(KillWeapon)
            {
                // End:0x140
                case 5011:
                // End:0x148
                case 5001:
                // End:0x185
                case 5003:
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_SpecialETC;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                // End:0x18D
                case 6002:
                // End:0x195
                case 6005:
                // End:0x19D
                case 50007:
                // End:0x1A5
                case 50008:
                // End:0x1AD
                case 7003:
                // End:0x1B5
                case 7001:
                // End:0x1BD
                case 6000:
                // End:0x1FA
                case 6008:
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_FragGrenade;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                // End:0x237
                case 99999:
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_Melee;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                // End:0x274
                case 99998:
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_StepOn;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                // End:0x2B1
                case 50000:
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_Artillery;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                // End:0x2B9
                case 5009:
                // End:0x2C1
                case 50001:
                // End:0x2FE
                case 50002:
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_Heli_Killer;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                // End:0x33B
                case 50006:
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_SpecialETC;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                // End:0x343
                case 5017:
                // End:0x380
                case 5021:
                    iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_Sentry;
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                // End:0xFFFF
                default:
                    // End:0x3BA
                    if(PlayerController(ReceiveController).Pawn.bIsAiming)
                    {
                        iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_Normal_Aim;                        
                    }
                    else
                    {
                        iCode_Message = Class'Engine_Decompressed.wSpecialKillMessage'.default.Code_MessageScore_Normal;
                    }
                    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine_Decompressed.wSpecialKillMessage', iCode_Message);
                    // End:0x3EF
                    break;
                    break;
            }
        }
    }
    //return;    
}

function float GetMultykillBonusPoint(Controller C, out int AddExp, out int AddPoint)
{
    local int MultyKill;

    // End:0x5E
    if(C.IsA('PlayerController'))
    {
        MultyKill = Min(PlayerController(C).MultiKillLevel, GameAddMultiKillExp.Length - 1);
        AddExp = int(GameAddMultiKillExp[MultyKill]);
        AddPoint = int(GameAddMultiKillPoint[MultyKill]);
    }
    return float(AddPoint);
    //return;    
}

function bool TooManyBots(Controller botToRemove)
{
    return false;
    //return;    
}

static function Texture GetRandomTeamSymbol(int Base)
{
    return none;
    //return;    
}

static function string FindTeamDesignation(GameReplicationInfo GRI, Actor A)
{
    return "";
    //return;    
}

static function string ParseChatPercVar(Mutator BaseMutator, Controller Who, string Cmd)
{
    // End:0x2A
    if(BaseMutator != none)
    {
        Cmd = BaseMutator.ParseChatPercVar(Who, Cmd);
    }
    // End:0x4F
    if(Who != none)
    {
        Cmd = Who.ParseChatPercVar(Cmd);
    }
    return Cmd;
    //return;    
}

static function string ParseMessageString(Mutator BaseMutator, Controller Who, string Message)
{
    return Message;
    //return;    
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
    // End:0x3DB
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
    else
    {
        Class'Engine_Decompressed.BroadcastHandler'.static.FillPlayInfo(PlayInfo);
    }
    PlayInfo.PopClass();
    // End:0x488
    if(Class'Engine_Decompressed.GameInfo'.default.VotingHandlerClass != none)
    {
        Class'Engine_Decompressed.GameInfo'.default.VotingHandlerClass.FillPlayInfo(PlayInfo);
        PlayInfo.PopClass();        
    }
    else
    {
        Log("GameInfo::FillPlayInfo class'Engine.GameInfo'.default.VotingHandlerClass = None");
    }
    //return;    
}

static function string GetDisplayText(string PropName)
{
    switch(PropName)
    {
        // End:0x22
        case "GameDifficulty":
            return default.GIPropsDisplayText[0];
        // End:0x3A
        case "bWeaponStay":
            return default.GIPropsDisplayText[1];
        // End:0x55
        case "MaxSpectators":
            return default.GIPropsDisplayText[4];
        // End:0x6D
        case "MaxPlayers":
            return default.GIPropsDisplayText[5];
        // End:0x84
        case "GoalScore":
            return default.GIPropsDisplayText[6];
        // End:0x9A
        case "MaxLives":
            return default.GIPropsDisplayText[7];
        // End:0xB1
        case "TimeLimit":
            return default.GIPropsDisplayText[8];
        // End:0xD1
        case "bEnableStatLogging":
            return default.GIPropsDisplayText[9];
        // End:0xF3
        case "bAllowWeaponThrowing":
            return default.GIPropsDisplayText[10];
        // End:0x111
        case "bAllowBehindview":
            return default.GIPropsDisplayText[11];
        // End:0x12D
        case "bAdminCanPause":
            return default.GIPropsDisplayText[12];
        // End:0x146
        case "MaxIdleTime":
            return default.GIPropsDisplayText[13];
        // End:0x16A
        case "bWeaponShouldViewShake":
            return default.GIPropsDisplayText[14];
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

static function string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x22
        case "GameDifficulty":
            return default.GIPropDescText[0];
        // End:0x3A
        case "bWeaponStay":
            return default.GIPropDescText[1];
        // End:0x55
        case "MaxSpectators":
            return default.GIPropDescText[4];
        // End:0x6D
        case "MaxPlayers":
            return default.GIPropDescText[5];
        // End:0x84
        case "GoalScore":
            return default.GIPropDescText[6];
        // End:0x9A
        case "MaxLives":
            return default.GIPropDescText[7];
        // End:0xB1
        case "TimeLimit":
            return default.GIPropDescText[8];
        // End:0xD1
        case "bEnableStatLogging":
            return default.GIPropDescText[9];
        // End:0xF3
        case "bAllowWeaponThrowing":
            return default.GIPropDescText[10];
        // End:0x111
        case "bAllowBehindview":
            return default.GIPropDescText[11];
        // End:0x12D
        case "bAdminCanPause":
            return default.GIPropDescText[12];
        // End:0x146
        case "MaxIdleTime":
            return default.GIPropDescText[13];
        // End:0x16A
        case "bWeaponShouldViewShake":
            return default.GIPropDescText[14];
        // End:0xFFFF
        default:
            return super.GetDescriptionText(PropName);
            break;
    }
    //return;    
}

static event bool AcceptPlayInfoProperty(string PropName)
{
    // End:0x16
    if(PropName == "MaxLives")
    {
        return false;
    }
    return super.AcceptPlayInfoProperty(PropName);
    //return;    
}

static function int OrderToIndex(int Order)
{
    return Order;
    //return;    
}

function ReviewJumpSpots(name TestLabel)
{
    //return;    
}

function string RecommendCombo(string ComboName)
{
    return ComboName;
    //return;    
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
    //return;    
}

function bool CanEnterVehicle(Vehicle V, Pawn P)
{
    return BaseMutator.CanEnterVehicle(V, P);
    //return;    
}

function DriverEnteredVehicle(Vehicle V, Pawn P)
{
    BaseMutator.DriverEnteredVehicle(V, P);
    //return;    
}

function bool CanLeaveVehicle(Vehicle V, Pawn P)
{
    return BaseMutator.CanLeaveVehicle(V, P);
    //return;    
}

function DriverLeftVehicle(Vehicle V, Pawn P)
{
    BaseMutator.DriverLeftVehicle(V, P);
    //return;    
}

function TeamInfo OtherTeam(TeamInfo Requester)
{
    return none;
    //return;    
}

exec function KillBots(int Num)
{
    //return;    
}

exec function AdminSay(string Msg)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0xAC [Loop If]
    if(C != none)
    {
        // End:0x95
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).ClearProgressMessages();
            PlayerController(C).SetProgressTime(6.0000000);
            PlayerController(C).SetProgressMessage(0, Msg, Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function RegisterVehicle(Vehicle V)
{
    V.NextVehicle = VehicleList;
    VehicleList = V;
    //return;    
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
    return none;
    //return;    
}

function int GetDefenderNum()
{
    return 255;
    //return;    
}

event SetGrammar()
{
    // End:0x17
    if(BeaconName != "")
    {
        LoadSRGrammar(BeaconName);
    }
    //return;    
}

// Export UGameInfo::execLoadSRGrammar(FFrame&, void* const)
native function LoadSRGrammar(string Grammar)
{
    //native.Grammar;        
}

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
    J0x2D:

    // End:0xFA [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0xE3
        if((((((PC != none) && PC.bIsPlayer) && PC.PlayerReplicationInfo != none) && !PC.PlayerReplicationInfo.bOnlySpectator) && !PC.PlayerReplicationInfo.bBot) && PC.Player != none)
        {
            ControllerArray[ControllerArray.Length] = PC;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x2D;
    }
    //return;    
}

function ParseVoiceCommand(PlayerController Sender, string RecognizedString)
{
    //return;    
}

static function AdjustBotInterface(bool bSinglePlayer)
{
    //return;    
}

event SceneStarted(SceneManager SM, Actor Other)
{
    //return;    
}

event SceneEnded(SceneManager SM, Actor Other)
{
    //return;    
}

event SceneAbort()
{
    //return;    
}

event NoTranslocatorKeyPressed(PlayerController PC)
{
    //return;    
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
    //return;    
}

static function string GetLoadingHint(PlayerController Ref, string MapName, Color HintColor)
{
    local string Hint;
    local int Attempt;

    // End:0x0E
    if(Ref == none)
    {
        return "";
    }
    J0x0E:

    // End:0x4E [Loop If]
    if((Hint == "") && ++Attempt < 10)
    {
        Hint = ParseLoadingHint(GetNextLoadHint(MapName), Ref, HintColor);
        // [Loop Continue]
        goto J0x0E;
    }
    return Hint;
    //return;    
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
    J0x25:

    Cmd = "";
    Result = "";
    CurrentHint $= Left(Hint, pos);
    Hint = Mid(Hint, pos + 1);
    pos = InStr(Hint, "%");
    // End:0x81
    if(pos == -1)
    {        
    }
    else
    {
        Cmd = Left(Hint, pos);
        Hint = Mid(Hint, pos + 1);
        Result = GetKeyBindName(Cmd, Ref);
        // End:0xDE
        if((Result == Cmd) || Result == "")
        {            
        }
        else
        {
            CurrentHint $= (((MakeColorCode(default.BindColor)) $ Result) $ (MakeColorCode(HintColor)));
            pos = InStr(Hint, "%");
            // End:0x25
            if(!((Hint == "") || pos == -1))
                goto J0x25;
        }
    }
    // End:0x15D
    if((Result != "") && Result != Cmd)
    {
        return CurrentHint $ Hint;
    }
    return "";
    //return;    
}

static function string GetKeyBindName(string Cmd, PlayerController Ref)
{
    local string BindStr;
    local array<string> Bindings;
    local int i, idx, BestIdx, Weight, BestWeight;

    // End:0x1F
    if((Ref == none) || Cmd == "")
    {
        return Cmd;
    }
    BestIdx = -1;
    BindStr = Ref.ConsoleCommand((("BINDINGTOKEY" @ "\"") $ Cmd) $ "\"");
    // End:0x156
    if(BindStr != "")
    {
        Split(BindStr, ",", Bindings);
        // End:0x156
        if(Bindings.Length > 0)
        {
            i = 0;
            J0x8C:

            // End:0x11C [Loop If]
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
                i++;
                // [Loop Continue]
                goto J0x8C;
            }
            // End:0x156
            if(BestIdx != -1)
            {
                return Ref.ConsoleCommand("LOCALIZEDKEYNAME" @ string(BestIdx));
            }
        }
    }
    return Cmd;
    //return;    
}

static function string GetNextLoadHint(string MapName)
{
    return "";
    //return;    
}

static function string MakeColorCode(Color NewColor)
{
    // End:0x1F
    if(int(NewColor.R) == 0)
    {
        NewColor.R = 1;
    }
    // End:0x3E
    if(int(NewColor.G) == 0)
    {
        NewColor.G = 1;
    }
    // End:0x5D
    if(int(NewColor.B) == 0)
    {
        NewColor.B = 1;
    }
    return ((Chr(27) $ Chr(int(NewColor.R))) $ Chr(int(NewColor.G))) $ Chr(int(NewColor.B));
    //return;    
}

static function int GetBindWeight(byte KeyNumber)
{
    // End:0x20
    if((int(KeyNumber) == 1) || int(KeyNumber) == 2)
    {
        return 100;
    }
    // End:0x41
    if((int(KeyNumber) >= 48) && int(KeyNumber) <= 90)
    {
        return 75;
    }
    // End:0x72
    if((int(KeyNumber) == 32) || (int(KeyNumber) >= 16) && int(KeyNumber) <= 18)
    {
        return 50;
    }
    // End:0x93
    if((int(KeyNumber) >= 37) && int(KeyNumber) <= 40)
    {
        return 45;
    }
    // End:0xA4
    if(int(KeyNumber) == 4)
    {
        return 40;
    }
    // End:0xC5
    if((int(KeyNumber) == 236) || int(KeyNumber) == 237)
    {
        return 35;
    }
    // End:0xF6
    if((int(KeyNumber) == 8) || (int(KeyNumber) >= 33) && int(KeyNumber) <= 40)
    {
        return 30;
    }
    // End:0x117
    if((int(KeyNumber) >= 96) && int(KeyNumber) <= 111)
    {
        return 25;
    }
    return 20;
    //return;    
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
    // End:0xAC
    if(MutatorClassName ~= "OnslaughtFull.MutVehicleArena")
    {
        return true;
    }
    return false;
    //return;    
}

static function bool AllowMutator(string MutatorClassName)
{
    // End:0x11
    if(MutatorClassName == default.MutatorClass)
    {
        return true;
    }
    // End:0x2E
    if(!default.bAllowVehicles && IsVehicleMutator(MutatorClassName))
    {
        return false;
    }
    return !Class'Engine_Decompressed.LevelInfo'.static.IsDemoBuild();
    //return;    
}

static function AddServerDetail(out ServerResponseLine ServerState, string RuleName, coerce string RuleValue)
{
    local int i;

    i = ServerState.ServerInfo.Length;
    ServerState.ServerInfo.Length = i + 1;
    ServerState.ServerInfo[i].key = RuleName;
    ServerState.ServerInfo[i].Value = RuleValue;
    //return;    
}

function string StripColor(string S)
{
    local int P;

    P = InStr(S, Chr(27));
    J0x11:

    // End:0x54 [Loop If]
    if(P >= 0)
    {
        S = Left(S, P) $ Mid(S, P + 4);
        P = InStr(S, Chr(27));
        // [Loop Continue]
        goto J0x11;
    }
    return S;
    //return;    
}

function bool JustStarted(float t)
{
    return Level.TimeSeconds < t;
    //return;    
}

function int MultiMinPlayers()
{
    return 0;
    //return;    
}

function WeakObjectives()
{
    //return;    
}

function DisableNextObjective()
{
    //return;    
}

simulated function bool IsRespawnRestrictionTime()
{
    return false;
    //return;    
}

function bool IsPawnAlive(Controller C)
{
    return (((!C.PlayerReplicationInfo.bOutOfLives && !C.PlayerReplicationInfo.bOnlySpectator) && !C.IsInState('Spectating')) && !C.IsInState('SpectatingGM')) && !C.IsInState('PlayerWaiting') || bHasRespawnRestriction && !IsRespawnRestrictionTime();
    //return;    
}

function DeadUse(PlayerController PC)
{
    //return;    
}

function CalcResultPoints()
{
    //return;    
}

function float GetResultPointRatio_Intervention(PlayerReplicationInfo PRI)
{
    return FMin(1.0000000, FMax(0.0000000, (float(GameReplicationInfo.ElapsedTime) - float(PRI.ElapsedTimeWhenIntervented)) / float(GameReplicationInfo.ElapsedTime)));
    //return;    
}

function array<int> GetTeamScores()
{
    return GameReplicationInfo.GetTeamScores();
    //return;    
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
    local byte IsAIClear;

    Log("[END] sendrawmatchresult");
    crlog("[GameInfo::SendRawMatchResult]");
    // End:0x4DA
    foreach kMM.playingLevelInfo.DynamicActors(Class'Engine_Decompressed.PlayerReplicationInfo', PRI)
    {
        // End:0x15A
        if(!PRI.IsConnected)
        {
            Log((((((((((((("[SendRawMatchResult][!IsConnected] Name=" $ PRI.PlayerName) $ " UID=") $ string(UID)) $ " Kills=") $ string(PRI.Kills)) $ " Deaths=") $ string(PRI.Deaths)) $ " EXP=") $ string(PRI.fExp)) $ " Point=") $ string(PRI.Point)) $ " Score=") $ string(PRI.Score));
            continue;            
        }
        // End:0x1B7
        if(PRI.bAdminSpecator)
        {
            Log((("[SendRawMatchResult][Admin] Name=" $ PRI.PlayerName) $ " UID=") $ string(UID));
            continue;            
        }
        // End:0x1E7
        if((200 == PRI.NPCID) || 201 == PRI.NPCID)
        {
            continue;            
        }
        UserInfo = kMM.GetUserInfoByUserName(PRI.PlayerName);
        UID = PRI.GetUID();
        // End:0x4D9
        if((bSendBot == true) || PRI.bBot == false)
        {
            UserIDs[UserIDs.Length] = UID;
            Kills[Kills.Length] = PRI.Kills;
            Assists[Assists.Length] = PRI.Assists;
            Deaths[Deaths.Length] = int(PRI.Deaths);
            Names[Names.Length] = PRI.PlayerName;
            // End:0x2EC
            if(UserInfo == none)
            {
                EXPs[EXPs.Length] = 0;
                Points[Points.Length] = 0;                
            }
            else
            {
                EXPs[EXPs.Length] = int(float(Max(0, int(PRI.fExp))) * UserInfo.GetBonusExP(Level.GameMgr));
                Points[Points.Length] = int(float(Max(0, int(PRI.Point))) * UserInfo.GetBonusPoint(Level.GameMgr));
                UserInfo.RoundPlayed = PRI.RoundPlayed;
                UserInfo.TimePlayed = PRI.TimePlayed;
            }
            Scores[Scores.Length] = int(PRI.Score);
            Log((((((((((((("[GameInfo::SendRawMatchResult] Name=" $ PRI.PlayerName) $ " UID=") $ string(UID)) $ " Kills=") $ string(PRI.Kills)) $ " Deaths=") $ string(PRI.Deaths)) $ " EXP=") $ string(PRI.fExp)) $ " Point=") $ string(PRI.Point)) $ " Score=") $ string(PRI.Score));
            RoundJoin[RoundJoin.Length] = PRI.RoundWhenIntervented;
            TimeJoin[TimeJoin.Length] = PRI.ElapsedTimeWhenIntervented;
        }        
    }    
    C = Level.ControllerList;
    J0x4EF:

    // End:0x5A3 [Loop If]
    if(C != none)
    {
        P = PlayerController(C);
        // End:0x58C
        if(P != none)
        {
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_MatchEnd;
            P.ReceiveMessage_QuestType1(Class'Engine_Decompressed.wMessage_Quest', iCode_Message);
            iCode_Message = Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_MatchEndInBotMode;
            // End:0x58C
            if(Level.GetMatchMaker().PlayWithBots)
            {
                P.ReceiveMessage_QuestType3(Class'Engine_Decompressed.wMessage_Quest', iCode_Message);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x4EF;
    }
    TeamScores = GetTeamScores();
    Log("[GameInfo::SendRawMatchResult] - Update Score / Game ElapsedTime : " $ string(GameReplicationInfo.ElapsedTime));
    IsAIClear = GetIsAIClear();
    BTSend.sfReqUpdateScore(kMM.kRoomID, UserIDs, Kills, Assists, Deaths, EXPs, Points, Scores, TeamScores, RoundJoin, TimeJoin, GameReplicationInfo.ElapsedTime, kMM.GameEndType, Names, IsAIClear);
    kMM.GetItemDurabilityInfo(PlayedOwnerID, PlayedTime, PlayedRound, PlayedUniqueItemID, PlayedSeconds, PlayedCount);
    Log("[GameInfo::SendRawMatchResult] - before cleaning");
    lp1 = 0;
    J0x6F1:

    // End:0x787 [Loop If]
    if(lp1 < PlayedOwnerID.Length)
    {
        Log((((((("OwnerID=" $ string(PlayedOwnerID[lp1])) $ " PlayedTime=") $ string(PlayedTime[lp1])) $ " PlayedSeconds=") $ string(PlayedSeconds[lp1])) $ " PlayedCount=") $ string(PlayedCount[lp1]));
        lp1++;
        // [Loop Continue]
        goto J0x6F1;
    }
    lp1 = 0;
    J0x78E:

    // End:0x802 [Loop If]
    if(lp1 < PlayedOwnerID.Length)
    {
        // End:0x7F8
        if(__NFUN_919__(PlayedUniqueItemID[lp1], 0))
        {
            PlayedOwnerID.Remove(lp1, 1);
            PlayedTime.Remove(lp1, 1);
            PlayedRound.Remove(lp1, 1);
            PlayedUniqueItemID.Remove(lp1, 1);
            PlayedSeconds.Remove(lp1, 1);
            PlayedCount.Remove(lp1, 1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x78E;
    }
    crlog("[GameInfo::SendRawMatchResult] - GetItemDurabilityInfo");
    lp1 = 0;
    J0x847:

    // End:0x8E1 [Loop If]
    if(lp1 < PlayedOwnerID.Length)
    {
        crlog((((((("OwnerID=" $ string(PlayedOwnerID[lp1])) $ " PlayedTime=") $ string(PlayedTime[lp1])) $ " PlayedSeconds=") $ string(PlayedSeconds[lp1])) $ " PlayedCount=") $ string(PlayedCount[lp1]));
        lp1++;
        // [Loop Continue]
        goto J0x847;
    }
    // End:0x943
    if(kMM.szGameClass ~= "wMission.wSDGameInfo")
    {
        BTSend.sfReqUpdateWeaponDurability(GameReplicationInfo.ElapsedTime, PlayedOwnerID, PlayedRound, PlayedUniqueItemID, PlayedSeconds, PlayedCount);        
    }
    else
    {
        BTSend.sfReqUpdateWeaponDurability(GameReplicationInfo.ElapsedTime, PlayedOwnerID, PlayedTime, PlayedUniqueItemID, PlayedSeconds, PlayedCount);
    }
    //return;    
}

function byte GetIsAIClear()
{
    return 0;
    //return;    
}

function SendMatchResult()
{
    Log("[CYH] GameInfo::SendMatchResult()");
    Log("[END] sendmatchresult");
    CalcResultPoints();
    SendRawMatchResult();
    //return;    
}

function int CountPlayers()
{
    local PlayerController PC;
    local int Count;

    Count = 0;
    // End:0x1F
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', PC)
    {
        Count++;        
    }    
    return Count;
    //return;    
}

function int GetTotalPlayedTime()
{
    return TimeLimit * 60;
    //return;    
}

function SendMatchOver()
{
    Log("[END] sendmatchover");
    Log("[CYH] GameInfo::SendMatchOver() IsOwner=" $ string(kMM.bIsOwner));
    // End:0xB9
    if(kMM.bIsOwner == true)
    {
        SendMatchResult();
        BTSend.sfReqGetBooty(kMM.kRoomID);
        BTSend.sfReqGameOver(kMM.kUID, kMM.kRoomID);
    }
    //return;    
}

function SendMatchOverEnd()
{
    Log("[CYH] GameInfo::SendMatchOverEnd() IsOwner=" $ string(kMM.bIsOwner));
    // End:0x66
    if(kMM.bIsOwner == true)
    {
        BTSend.sfReqGameOverEnd();
    }
    //return;    
}

function bool IsRightTimeForRespawn(Controller C)
{
    return IsInState('MatchInProgress');
    //return;    
}

function bool IsWarpPossible()
{
    return false;
    //return;    
}

function SendReqUpdateMyHostPriorityPoint(int Point)
{
    // End:0x1F
    if(BTSend != none)
    {
        BTSend.sfReqUpdateMyHostPriorityPoint(Point);
    }
    //return;    
}

function SendReqChangeWeaponSet(int PlayerID, int SlotIndex)
{
    // End:0x24
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_ChangeWeaponSet(PlayerID, SlotIndex);
    }
    //return;    
}

function SendGameStartTime(array<int> aPlayerIDs)
{
    // End:0x1F
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_SetGameStartTime(aPlayerIDs);
    }
    //return;    
}

function SendRoundStartTime(array<int> aPlayerIDs)
{
    // End:0x1F
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_SetRoundStartTime(aPlayerIDs);
    }
    //return;    
}

function bool CanPawnTakeDamage()
{
    return true;
    //return;    
}

function float GetSupplyRandom()
{
    local float fReturn;

    // End:0x2F
    if(SupplyRandIndex == -1)
    {
        SupplyRandIndex = Rand(Level.GameMgr.SupplyRandomArray.Length);
    }
    fReturn = Level.GameMgr.SupplyRandomArray[SupplyRandIndex];
    Log((("GetSupplyRandom Index : " $ string(SupplyRandIndex)) $ " / Random Value : ") $ string(fReturn));
    SupplyRandIndex++;
    // End:0xC6
    if(SupplyRandIndex >= Level.GameMgr.SupplyRandomArray.Length)
    {
        SupplyRandIndex = 0;
    }
    return fReturn;
    //return;    
}

function GetFlagsInfo(out int outNumFlags, out int outNumCapturedFlagsByTeam1, out int outNumCapturedFlagsByTeam2)
{
    outNumFlags = 0;
    outNumCapturedFlagsByTeam1 = 0;
    outNumCapturedFlagsByTeam2 = 0;
    //return;    
}

function Kill(Controller C)
{
    //return;    
}

function PushDeathPos(Vector vPos)
{
    nCurIndex = int(float(++nCurIndex) % float(MaxPlayers >> 1));
    DeathPos[nCurIndex] = vPos;
    //return;    
}

function array<Vector> GetDeathPosArray()
{
    return DeathPos;
    //return;    
}

function float GetAttackBuff()
{
    return 0.0000000;
    //return;    
}

function GetGameSpecificActions(Controller C, wNPCActions npcActions, out array<Object> Actions)
{
    //return;    
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    //return;    
}

event Actor GetNearFlag(Actor A)
{
    return none;
    //return;    
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    return true;
    //return;    
}

function PermitWeaponChangeInSpecialMode()
{
    //return;    
}

function int GetItemBuyID(int Index)
{
    return 0;
    //return;    
}

function int GetItemBuyPrice(int Index)
{
    return 0;
    //return;    
}

function float GetAddDamageRatio()
{
    return 1.0000000;
    //return;    
}

function float GetAddHealthRatio()
{
    return 1.0000000;
    //return;    
}

function bool IsEnableRepair()
{
    return false;
    //return;    
}

function bool SetRepairNuclear(int iValue)
{
    //return;    
}

function Actor GetNuclearReactor()
{
    return none;
    //return;    
}

defaultproperties
{
    fSendPingTime=10.0000000
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
    GameDifficulty=3.0000000
    AutoAim=1.0000000
    GameSpeed=1.0000000
    bSendBot=true
    HUDType="Engine.HUD"
    GoreLevelText[0]="None"
    GoreLevelText[1]="Low"
    GoreLevelText[2]="Max"
    MaxSpectators=4
    MaxPlayers=16
    CurrentID=1
    DefaultPlayerName="Player"
    FearCostFallOff=0.9500000
    DeathMessageClass=Class'Engine_Decompressed.LocalMessage'
    GameMessageClass=Class'Engine_Decompressed.GameMessage'
    MutatorClass="Engine.Mutator"
    AccessControlClass="Engine.AccessControl"
    BroadcastHandlerClass="Engine.BroadcastHandler"
    PlayerControllerClassName="Engine.PlayerController"
    GameReplicationInfoClass=Class'Engine_Decompressed.GameReplicationInfo'
    MaplistHandlerClass=Class'Engine_Decompressed.MaplistManager'
    GameStatsClass="IpDrv.MasterServerGameStats"
    RespawnTime=3.5000000
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
    NoBindString="[None]\"=\""
    BindColor=(R=128,G=128,B=0,A=255)
    GameAddScore=10.0000000
    GameAddScore_KillHeli=20.0000000
    GameAssistScore=3.0000000
    GameDecScore=10.0000000
    GameAddExp=15.0000000
    GameAssistExp=5.0000000
    GameDecExp=2.0000000
    GamePenaltyExp=15.0000000
    GameAddPoint=5.0000000
    GameAssistPoint=2.0000000
    GamePenaltyPoint=5.0000000
    GameAddMultiKillExp[0]=0.0000000
    GameAddMultiKillExp[1]=0.0000000
    GameAddMultiKillExp[2]=1.0000000
    GameAddMultiKillExp[3]=2.0000000
    GameAddMultiKillExp[4]=3.0000000
    GameAddMultiKillExp[5]=4.0000000
    GameAddMultiKillPoint[0]=0.0000000
    GameAddMultiKillPoint[1]=0.0000000
    GameAddMultiKillPoint[2]=1.0000000
    GameAddMultiKillPoint[3]=1.0000000
    GameAddMultiKillPoint[4]=2.0000000
    GameAddMultiKillPoint[5]=2.0000000
    SpawnWeaponPickupLocations=true
    UAVDuration=24
    UAVScanInterval=4
    SDRespawnTime=27.0000000
    ChangedHostCompleteCountDown_Initial=11
    RespawnRestrictionTime=-1
    nCurIndex=-1
}