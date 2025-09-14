/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LevelInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:5
 *	Structs:1
 *	Properties:217
 *	Functions:57
 *
 *******************************************************************************/
class LevelInfo extends ZoneInfo
    dependson(ZoneInfo)
    dependson(wAILevelBase)
    dependson(wGameManager)
    dependson(wGameStateStorageSender)
    dependson(GameInfo)
    dependson(GameReplicationInfo)
    dependson(Actor)
    dependson(wMatchMaker)
    dependson(NavigationPoint)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    nativereplication
    notplaceable;

enum EPhysicsDetailLevel
{
    PDL_Low,
    PDL_Medium,
    PDL_High
};

enum EMeshLODDetailLevel
{
    MDL_Low,
    MDL_Medium,
    MDL_High,
    MDL_Ultra
};

enum ELevelAction
{
    LEVACT_None,
    LEVACT_Loading,
    LEVACT_Saving,
    LEVACT_Connecting,
    LEVACT_Precaching
};

enum ENetMode
{
    NM_Standalone,
    NM_DedicatedServer,
    NM_ListenServer,
    NM_Client
};

enum EPostProcessEffectMode
{
    PPEM_None,
    PPEM_ToneMapping,
    PPEM_HDRScene
};

struct native ToneElement
{
    var() Plane aBase;
    var() Plane bBalance;
    var() Plane cHighlight;
    var() float dFinalAdd;
};

var array<CombatSituationPoint> CSReviewPoints;
var array<CombatSituationLine> CSReviewLines;
var array<CombatSituationNameTag> CSReviewNameTags;
var array<CombatSituationArrow> CSReviewArrows;
var array<CombatSituationSphere> CSReviewSpheres;
var int iQueuedSendBytes;
var int iQueuedRecvBytes;
var float TimeDilation;
var float AppDeltaTime;
var float TimeSeconds;
var float PlayTimeSeconds;
var transient int Year;
var transient int Month;
var transient int Day;
var transient int DayOfWeek;
var transient int Hour;
var transient int Minute;
var transient int Second;
var transient int Millisecond;
var float PauseDelay;
var(LevelSummary) localized string Title;
var(LevelSummary) string Author;
var(LevelSummary) string Description;
var(LevelSummary) Material Screenshot;
var(LevelSummary) string DecoTextName;
var(LevelSummary) int IdealPlayerCountMin;
var(LevelSummary) int IdealPlayerCountMax;
var(LevelSummary) string ExtraInfo;
var(SinglePlayer) int SinglePlayerTeamSize;
var(RadarMap) Material RadarMapImage;
var(RadarMap) float CustomRadarRange;
var bool bDoTraceNativeInstant;
var bool bServiceBuildHK;
var class<PrecacheInterface> PCI;
var bool bServiceBuild;
var bool bServiceTestBuild;
var bool bTeenVersion;
var bool bConnectDMZ;
var() LevelInfo.EPhysicsDetailLevel PhysicsDetailLevel;
var() LevelInfo.EMeshLODDetailLevel MeshLODDetailLevel;
var(Karma) float KarmaTimeScale;
var(Karma) float RagdollTimeScale;
var(Karma) int MaxRagdolls;
var(Karma) float KarmaGravScale;
var(Karma) bool bKStaticFriction;
var() bool bKNoInit;
var int LastTaunt[2];
var float DecalStayScale;
var() localized string LevelEnterText;
var() string LocalizedPkg;
var PlayerReplicationInfo Pauser;
var LevelSummary Summary;
var string VisibleGroups;
var(LevelSummary) bool HideFromMenus;
var() bool bLonePlayer;
var bool bBegunPlay;
var bool bPlayersOnly;
var bool bFreezeKarma;
var const Core.Object.EDetailMode DetailMode;
var bool bDropDetail;
var bool bAggressiveLOD;
var bool bStartup;
var bool bLowSoundDetail;
var bool bPathsRebuilt;
var bool bHasPathNodes;
var bool bLevelChange;
var bool bShouldPreload;
var bool bDesireSkinPreload;
var bool bKickLiveIdlers;
var bool bSkinsPreloaded;
var bool bClassicView;
var(RadarMap) bool bShowRadarMap;
var(RadarMap) bool bUseTerrainForRadarRange;
var bool bIsSaveGame;
var(SaveGames) bool bSupportSaveGames;
var bool bNeverPrecache;
var() int LevelTextureLODBias;
var float AnimMeshGlobalLOD;
var() Vector CameraLocationDynamic;
var() Vector CameraLocationTop;
var() Vector CameraLocationFront;
var() Vector CameraLocationSide;
var() Rotator CameraRotationDynamic;
var(Audio) string Song;
var(Audio) float PlayerDoppler;
var(Audio) float MusicVolumeOverride;
var(Minimap) TexRotator BG;
var(Minimap) Vector TextureCoord1;
var(Minimap) Vector WorldCoord1;
var(Minimap) Vector TextureCoord2;
var(Minimap) Vector WorldCoord2;
var(Minimap) Vector AirStrikeLocation;
var(Minimap) Vector MinimapCropCoords1;
var(Minimap) Vector MinimapCropCoords2;
var(Minimap) Material BigmapBG;
var(Minimap) Vector BigmapTextureCoord1;
var(Minimap) Vector BigmapTextureCoord2;
var(Minimap) Vector BigmapMinimapCropCoords1;
var(Minimap) Vector BigmapMinimapCropCoords2;
var bool IsAirStriking;
var float fAirStrikeFadeTime;
var int AirStrikeTeamIndex;
var bool bLevelPrecached;
var() float Brightness;
var Texture DefaultTexture;
var Texture WireframeTexture;
var Texture WhiteSquareTexture;
var Texture LargeVertex;
var int HubStackLevel;
var transient LevelInfo.ELevelAction LevelAction;
var transient GameReplicationInfo GRI;
var LevelInfo.ENetMode NetMode;
var string ComputerName;
var string EngineVersion;
var string MinNetVersion;
var string AuthLogin_AccountID;
var string AuthLogin_GUID;
var int AuthLogin_ChannelingType;
var string AuthLogin_AuthKey;
var string AuthLogin_RegionKey;
var float DeltaTime;
var() string DefaultGameType;
var() string PreCacheGame;
var GameInfo Game;
var float DefaultGravity;
var float LastVehicleCheck;
var() float StallZ;
var const NavigationPoint NavigationPointList;
var const Controller ControllerList;
var private PlayerController LocalPlayerController;
var const wGameStateStorageSender GSSSList;
var(Headlights) bool bUseHeadlights;
var(Headlights) float HeadlightScaling;
var string NextURL;
var bool bNextItems;
var float NextSwitchCountdown;
var transient ObjectPool ObjectPool;
var transient array<Material> PrecacheMaterials;
var transient array<StaticMesh> PrecacheStaticMeshes;
var transient array<Mesh> PrecacheSkeletalMeshes;
var(Camouflage) StaticMesh IndoorCamouflageMesh;
var(Camouflage) float IndoorMeshDrawscale;
var(Camouflage) StaticMesh OutdoorCamouflageMesh;
var(Camouflage) float OutdoorMeshDrawscale;
var(DustColor) Color DustColor;
var(DustColor) Color WaterDustColor;
var float MoveRepSize;
var float MaxClientFrameRate;
var float MaxTimeMargin;
var float TimeMarginSlack;
var float MinTimeMargin;
var const PlayerController ReplicationViewer;
var const Actor ReplicationViewTarget;
var const wCharacterManager CharMgr;
var const wWeaponManager WeaponMgr;
var const wGameManager GameMgr;
var const ItemIterator ItemItr;
var array<int> WeaponTotalAmmos;
var array<int> WeaponCurrentAmmos;
var array<int> WeaponClassNumbers;
var array<int> WeaponAddPartsID;
var int TeamIndex;
var int Kills;
var int Assists;
var int Deaths;
var int EXPs;
var int Points;
var int Scores;
var array<int> MainWeaponIDs;
var array<int> MainWeaponUsingSeconds;
var array<Pawn> Helicopters;
var array<Vehicle> Vehicles;
var array<Pawn> PawnList;
var array<Pickup> SupplyList_Health;
var array<Pickup> SupplyList_Artillery;
var array<Pickup> SupplyList_Helicopter;
var array<Pickup> SupplyList_UAV;
var array<Pickup> Medals;
var array<wProjectile> Grenades;
var(Tone_Default) byte PPE_ElementIndex;
var(Tone_List_ShaderOn) array<ToneElement> SOn_PostEffects;
var(Tone_List_ShaderOff) array<ToneElement> SOff_PostEffects;
var(Tone_a_PostProcessEffectMode) LevelInfo.EPostProcessEffectMode PPE_a_Mode;
var(Glow) float Glow_SkyScale;
var(Glow) float Glow_GaussMultiplier;
var(Glow) float Glow_GaussMean;
var(Glow) float Glow_GaussStdDev;
var(Glow) float SunShafts_Decay;
var(Glow) float SunShafts_Weight;
var(Glow) float SunShafts_Density;
var(Glow) float SunShafts_Exposure;
var(Glow) float SunShafts_HeightScale;
var(Glow) Color SunShafts_Color;
var(AmbientOcclusion) float MaxOcclusionDistance;
var(AmbientOcclusion) float OcclusionExponent;
var(AmbientOcclusion) float FullyOccludedSamplesFraction;
var() bool bUseSDRespawnInTeamGame;
var float fLowDetailBias;
var float fMediumDetailBias;
var float fHighDetailBias;
var float fUltraDetailBias;
var bool bTestFlag1;
var bool bTestFlag2;
var bool bTestFlag3;
var float fTestValue1;
var float fTestValue2;
var float fTestValue3;
var() array<VisibilityItemArray> Visibility;
var int VisibilityOneRowCount;
var array<int> VisibilityNew;
var NavigationPoint InfluenceCurNav;
var int InfluenceStepSize;
var float InfluenceDistFactor;
var wAILevelBase AILevel;
var float fMoveLogTimer;
var UserzoneInfo kUserzoneInfo;
var Vector SkyViewLocation;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        TimeDilation, Pauser,
        IsAirStriking, AirStrikeTeamIndex,
        DefaultGravity;

    // Pos:0x18
    reliable if(bNetInitial && Role == 4)
        KarmaTimeScale, RagdollTimeScale,
        KarmaGravScale;

}

// Export ULevelInfo::execLoadKilllog(FFrame&, void* const)
native function bool LoadKilllog(string szPath, int nCommand, optional int nOption);
// Export ULevelInfo::execLoadUserzone(FFrame&, void* const)
native function bool LoadUserzone(string szPath, int nCommand, optional string szUserName);
// Export ULevelInfo::execLoadUsermove(FFrame&, void* const)
native function bool LoadUsermove(string szPath, int nCommand, optional int nCombatNum, optional string szUserName);
// Export ULevelInfo::execResetCombationSituationReview(FFrame&, void* const)
native function ResetCombationSituationReview();
// Export ULevelInfo::execSetCapture(FFrame&, void* const)
native function SetCapture(bool bCapture);
// Export ULevelInfo::execIsCapturing(FFrame&, void* const)
native function bool IsCapturing();
// Export ULevelInfo::execSetCaptureResoultion(FFrame&, void* const)
native function SetCaptureResoultion(int iValue);
// Export ULevelInfo::execSetCaptureQuality(FFrame&, void* const)
native function SetCaptureQuality(int iValue);
// Export ULevelInfo::execGetMatchMaker(FFrame&, void* const)
native function wMatchMaker GetMatchMaker();
// Export ULevelInfo::execIsUseGraphicOption(FFrame&, void* const)
native function bool IsUseGraphicOption(string OptionName);
// Export ULevelInfo::execDetailChange(FFrame&, void* const)
native simulated function DetailChange(Core.Object.EDetailMode NewDetailMode);
// Export ULevelInfo::execIsEntry(FFrame&, void* const)
native simulated function bool IsEntry();
// Export ULevelInfo::execUpdateDistanceFogLOD(FFrame&, void* const)
native simulated function UpdateDistanceFogLOD(float LOD);
// Export ULevelInfo::execForceLoadTexture(FFrame&, void* const)
native simulated function ForceLoadTexture(Texture Texture);
// Export ULevelInfo::execGetPhysicsVolume(FFrame&, void* const)
native simulated function PhysicsVolume GetPhysicsVolume(Vector loc);
function wAILevelBase GetAILevel()
{
    // End:0x34
    if(AILevel == none)
    {
        AILevel = Spawn(class<wAILevelBase>(DynamicLoadObject("WGame.wAILevel", class'Class')));
    }
    return AILevel;
}

// Export ULevelInfo::execUpdateInfluence(FFrame&, void* const)
native function UpdateInfluence();
function bool IsVisible(NavigationPoint S, NavigationPoint E, optional int sStance, optional int eStance)
{
    return IsVisibleByVisID(S.VisID, E.VisID, sStance, eStance);
}

function bool IsVisibleByVisID(int sVisID, int eVisID, optional int sStance, optional int eStance)
{
    local int i, R, t;

    i = VisibilityNew[VisibilityOneRowCount * sVisID + eVisID];
    t = 1 << sStance * 4 + eStance;
    R = i & t;
    return R > 0;
}

// Export ULevelInfo::execGetClosestNavigationPoint(FFrame&, void* const)
native function NavigationPoint GetClosestNavigationPoint(Vector V);
function NavigationPoint GetRandomNavigationPointAround(Vector V)
{
    local NavigationPoint nav;
    local array<NavigationPoint> candidates;
    local float dist, threshold;

    threshold = 1000.0;
    J0x0b:
    // End:0xb1 [While If]
    if(true)
    {
        nav = NavigationPointList;
        J0x1a:
        // End:0x7a [While If]
        if(nav != none)
        {
            dist = VSize(nav.Location - V);
            // End:0x63
            if(dist < threshold)
            {
                candidates[candidates.Length] = nav;
            }
            nav = nav.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x1a;
        }
        // End:0x98
        if(candidates.Length > 1)
        {
            return candidates[Rand(candidates.Length)];
        }
        // End:0xa0
        else
        {
            candidates.Length = 0;
        }
        threshold += float(600);
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

event Tick(float DeltaTime);
simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    DecalStayScale = float(Max(int(DecalStayScale), 1));
}

simulated function class<GameInfo> GetGameClass()
{
    local class<GameInfo> G;

    // End:0x2c
    if(Level.Game != none)
    {
        return Level.Game.Class;
    }
    // End:0x72
    if(GRI != none && GRI.GameClass != "")
    {
        G = class<GameInfo>(DynamicLoadObject(GRI.GameClass, class'Class'));
    }
    // End:0x83
    if(G != none)
    {
        return G;
    }
    // End:0xaa
    if(DefaultGameType != "")
    {
        G = class<GameInfo>(DynamicLoadObject(DefaultGameType, class'Class'));
    }
    return G;
}

simulated event PrecacheInit()
{
    local wMatchMaker MM;

    // End:0xa1
    if(PCI == none)
    {
        MM = GetMatchMaker();
        // End:0x6c
        if(MM != none && MM.kIsDSHost == false)
        {
            PCI = class<PrecacheInterface>(DynamicLoadObject("WGame.PrecacheGameClient", class'Class'));
        }
        // End:0xa1
        else
        {
            PCI = class<PrecacheInterface>(DynamicLoadObject("WGame.PrecacheDedicatedServer", class'Class'));
        }
    }
}

simulated event FillPrecacheMaterialsArray(bool FullPrecache)
{
    local Actor A;
    local class<GameInfo> G;
    local bool bRealDesire;

    // End:0x12
    if(NetMode == 1)
    {
        return;
    }
    // End:0x122
    if(!bSkinsPreloaded || FullPrecache)
    {
        // End:0x4a
        if(Game != none)
        {
            G = Game.Class;
        }
        // End:0x90
        else
        {
            // End:0x90
            if(GRI != none && GRI.GameClass != "")
            {
                G = class<GameInfo>(DynamicLoadObject(GRI.GameClass, class'Class'));
            }
        }
        // End:0xb9
        if(G != none)
        {
            PrecacheInit();
            G.static.PrecacheGameTextures(self);
            bSkinsPreloaded = true;
        }
        // End:0xdf
        if(G == none)
        {
            G = class<GameInfo>(DynamicLoadObject(PreCacheGame, class'Class'));
        }
        // End:0x122
        if(G != none)
        {
            bRealDesire = bDesireSkinPreload;
            bDesireSkinPreload = false;
            PrecacheInit();
            G.static.PrecacheGameTextures(self);
            bDesireSkinPreload = bRealDesire;
        }
    }
    // End:0x172
    foreach AllActors(class'Actor', A)
    {
        // End:0x171
        if(!A.bAlreadyPrecachedMaterials || FullPrecache)
        {
            A.UpdatePrecacheMaterials();
            A.bAlreadyPrecachedMaterials = true;
        }                
    }
}

simulated function PrecacheAnnouncements();
simulated event FillPrecacheStaticMeshesArray(bool FullPrecache)
{
    local Actor A;
    local class<GameInfo> G;

    // End:0x12
    if(NetMode == 1)
    {
        return;
    }
    // End:0xaa
    if(Game == none)
    {
        // End:0x63
        if(GRI != none && GRI.GameClass != "")
        {
            G = class<GameInfo>(DynamicLoadObject(GRI.GameClass, class'Class'));
        }
        // End:0x89
        if(G == none)
        {
            G = class<GameInfo>(DynamicLoadObject(PreCacheGame, class'Class'));
        }
        // End:0xaa
        if(G != none)
        {
            PrecacheInit();
            G.static.PrecacheGameStaticMeshes(self);
        }
    }
    // End:0xfa
    foreach AllActors(class'Actor', A)
    {
        // End:0xf9
        if(!A.bAlreadyPrecachedMeshes || FullPrecache)
        {
            A.UpdatePrecacheStaticMeshes();
            A.bAlreadyPrecachedMeshes = true;
        }                
    }
}

simulated event FillPrecacheSkeletalMeshesArray(bool FullPrecache)
{
    local Actor A;
    local class<GameInfo> G;

    // End:0x12
    if(NetMode == 1)
    {
        return;
    }
    // End:0xaa
    if(Game == none)
    {
        // End:0x63
        if(GRI != none && GRI.GameClass != "")
        {
            G = class<GameInfo>(DynamicLoadObject(GRI.GameClass, class'Class'));
        }
        // End:0x89
        if(G == none)
        {
            G = class<GameInfo>(DynamicLoadObject(PreCacheGame, class'Class'));
        }
        // End:0xaa
        if(G != none)
        {
            PrecacheInit();
            G.static.PrecacheGameSkeletalMeshes(self);
        }
    }
    // End:0xfa
    foreach AllActors(class'Actor', A)
    {
        // End:0xf9
        if(!A.bAlreadyPrecachedSkeletalMeshes || FullPrecache)
        {
            A.UpdatePrecacheSkeletalMeshes();
            A.bAlreadyPrecachedSkeletalMeshes = true;
        }                
    }
}

simulated function AddPrecacheMaterial(Material mat)
{
    local int Index;

    // End:0x12
    if(NetMode == 1)
    {
        return;
    }
    // End:0x1f
    if(mat == none)
    {
        return;
    }
    Index = Level.PrecacheMaterials.Length;
    PrecacheMaterials.Insert(Index, 1);
    PrecacheMaterials[Index] = mat;
}

simulated function ResetPrecacheMaterials()
{
    PrecacheMaterials.Length = 0;
}

simulated function AddPrecacheStaticMesh(StaticMesh stat)
{
    local int Index;

    // End:0x12
    if(NetMode == 1)
    {
        return;
    }
    // End:0x1f
    if(stat == none)
    {
        return;
    }
    Index = Level.PrecacheStaticMeshes.Length;
    PrecacheStaticMeshes.Insert(Index, 1);
    PrecacheStaticMeshes[Index] = stat;
}

simulated function ResetPrecacheStaticMesh()
{
    PrecacheStaticMeshes.Length = 0;
}

simulated function AddPrecacheSkeletalMesh(Mesh mes)
{
    local int Index;

    // End:0x12
    if(NetMode == 1)
    {
        return;
    }
    // End:0x1f
    if(mes == none)
    {
        return;
    }
    Index = Level.PrecacheSkeletalMeshes.Length;
    PrecacheSkeletalMeshes.Insert(Index, 1);
    PrecacheSkeletalMeshes[Index] = mes;
}

simulated function ResetPrecacheSkeletalMeshes()
{
    PrecacheSkeletalMeshes.Length = 0;
}

// Export ULevelInfo::execGetLocalURL(FFrame&, void* const)
native simulated function string GetLocalURL();
// Export ULevelInfo::execIsDemoBuild(FFrame&, void* const)
native static final simulated function bool IsDemoBuild();
// Export ULevelInfo::execIsSoftwareRendering(FFrame&, void* const)
native static final simulated function bool IsSoftwareRendering();
// Export ULevelInfo::execGetAddressURL(FFrame&, void* const)
native simulated function string GetAddressURL();
// Export ULevelInfo::execIsPendingConnection(FFrame&, void* const)
native simulated function bool IsPendingConnection();
event ServerTravel(string URL, bool bItems)
{
    // End:0x39
    if(InStr(URL, "%") >= 0)
    {
        Log("URL Contains illegal character '%'.");
        return;
    }
    // End:0x7e
    if(InStr(URL, ":") >= 0 || InStr(URL, "/") >= 0 || InStr(URL, "\\") >= 0)
    {
        Log("URL blocked");
        return;
    }
    // End:0xdd
    if(NextURL == "")
    {
        bLevelChange = true;
        bNextItems = bItems;
        NextURL = URL;
        // End:0xd2
        if(Game != none)
        {
            Game.ProcessServerTravel(URL, bItems);
        }
        // End:0xdd
        else
        {
            NextSwitchCountdown = 0.0;
        }
    }
}

function ThisIsNeverExecuted()
{
    local DefaultPhysicsVolume P;

    P = none;
}

function Reset()
{
    DefaultGravity = default.DefaultGravity;
    ConsoleCommand("OBJ GARBAGE");
    super(Actor).Reset();
}

simulated event PreBeginPlay()
{
    local int iTest;

    super.PreBeginPlay();
    ObjectPool = new (XLevel) class'ObjectPool';
    iTest = int(ConsoleCommand("GETCONFIG_INT Graphics MeshLODDetailLevel"));
    switch(iTest)
    {
        // End:0x68
        case 0:
            MeshLODDetailLevel = 0;
            // End:0x9a
            break;
        // End:0x77
        case 1:
            MeshLODDetailLevel = 1;
            // End:0x9a
            break;
        // End:0x87
        case 2:
            MeshLODDetailLevel = 2;
            // End:0x9a
            break;
        // End:0x97
        case 3:
            MeshLODDetailLevel = 3;
            // End:0x9a
            break;
        // End:0xffff
        default:
            default.MeshLODDetailLevel = MeshLODDetailLevel;
            iTest = int(ConsoleCommand("GETCONFIG_INT Graphics PhysicsDetailLevel"));
            switch(iTest)
            {
                // End:0xf4
                case 0:
                    PhysicsDetailLevel = 0;
                    // End:0x116
                    break;
                // End:0x103
                case 1:
                    PhysicsDetailLevel = 1;
                    // End:0x116
                    break;
                // End:0x113
                case 2:
                    PhysicsDetailLevel = 2;
                    // End:0x116
                    break;
                // End:0xffff
                default:
                    default.PhysicsDetailLevel = PhysicsDetailLevel;
                    iTest = int(ConsoleCommand("GETCONFIG_INT Graphics DecalStayScale"));
                    default.DecalStayScale = float(iTest);
}

simulated function PlayerController GetLocalPlayerController()
{
    local PlayerController PC;

    // End:0x1b
    if(Level.NetMode == 1)
    {
        return none;
    }
    // End:0x2c
    if(LocalPlayerController != none)
    {
        return LocalPlayerController;
    }
    // End:0x64
    foreach DynamicActors(class'PlayerController', PC)
    {
        // End:0x63
        if(Viewport(PC.Player) != none)
        {
            LocalPlayerController = PC;
        }
        // End:0x64
        else
        {
            continue;
        }        
    }
    return LocalPlayerController;
}

event SetNoUpdateAllGSSS()
{
    local wGameStateStorageSender GSSS;
    local int GSSSCount;

    GSSSCount = 0;
    // End:0x30
    foreach DynamicActors(class'wGameStateStorageSender', GSSS)
    {
        GSSS.bNoUpdateData = true;
        ++ GSSSCount;                
    }
    Log("wGameStateStorageSender::SetNoUpdateAll() GSSS Count:" $ string(GSSSCount));
}

simulated function ClearInvalidCache()
{
    local int lp1;

    lp1 = PawnList.Length - 1;
    J0x0f:
    // End:0x41 [While If]
    if(lp1 >= 0)
    {
        // End:0x37
        if(PawnList[lp1] == none)
        {
            PawnList.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    lp1 = Helicopters.Length - 1;
    J0x50:
    // End:0x82 [While If]
    if(lp1 >= 0)
    {
        // End:0x78
        if(Helicopters[lp1] == none)
        {
            Helicopters.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    lp1 = SupplyList_Artillery.Length - 1;
    J0x91:
    // End:0xc3 [While If]
    if(lp1 >= 0)
    {
        // End:0xb9
        if(SupplyList_Artillery[lp1] == none)
        {
            SupplyList_Artillery.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x91;
    }
    lp1 = SupplyList_Health.Length - 1;
    J0xd2:
    // End:0x104 [While If]
    if(lp1 >= 0)
    {
        // End:0xfa
        if(SupplyList_Health[lp1] == none)
        {
            SupplyList_Health.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0xd2;
    }
    lp1 = SupplyList_Helicopter.Length - 1;
    J0x113:
    // End:0x145 [While If]
    if(lp1 >= 0)
    {
        // End:0x13b
        if(SupplyList_Helicopter[lp1] == none)
        {
            SupplyList_Helicopter.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x113;
    }
    lp1 = Medals.Length - 1;
    J0x154:
    // End:0x186 [While If]
    if(lp1 >= 0)
    {
        // End:0x17c
        if(Medals[lp1] == none)
        {
            Medals.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x154;
    }
    lp1 = SupplyList_UAV.Length - 1;
    J0x195:
    // End:0x1c7 [While If]
    if(lp1 >= 0)
    {
        // End:0x1bd
        if(SupplyList_UAV[lp1] == none)
        {
            SupplyList_UAV.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x195;
    }
}

simulated function bool GetIsTeenVersion()
{
    return bTeenVersion;
}

simulated function bool GetIsNoGore()
{
    return GetIsTeenVersion() || !GameMgr.bUseGore;
}

simulated function bool GetIsUseRagdoll()
{
    return GameMgr.bUseRagdoll;
}

simulated function bool GetIsUseMouseRevision()
{
    return GameMgr.bUseMouseRevision;
}

simulated function bool GetIsUseStanceToggle()
{
    return GameMgr.bUseStanceToggle;
}

simulated function bool GetIsUseAdvCamShake()
{
    return GameMgr.bUseAdvCamShake;
}

simulated function bool GetIsServiceBuild()
{
    return bServiceBuild && !bServiceTestBuild;
}

simulated function bool GetIsForceServiceBuild()
{
    return bServiceBuild;
}

simulated function bool GetIsConnectDMZ()
{
    return bConnectDMZ;
}

event OnDisconnect()
{
    // End:0x1a
    if(AILevel != none)
    {
        AILevel.ClearReferences();
    }
}

defaultproperties
{
    TimeDilation=1.10
    Title="Title not found."
    Author="Anonymous"
    IdealPlayerCountMin=6
    IdealPlayerCountMax=10
    CustomRadarRange=10000.0
    bDoTraceNativeInstant=true
    bTeenVersion=true
    PhysicsDetailLevel=1
    MeshLODDetailLevel=1
    KarmaTimeScale=0.90
    RagdollTimeScale=1.0
    MaxRagdolls=4
    KarmaGravScale=1.0
    bKStaticFriction=true
    DecalStayScale=2.0
    VisibleGroups="None"
    DetailMode=2
    bShowRadarMap=true
    bUseTerrainForRadarRange=true
    AnimMeshGlobalLOD=1.0
    MusicVolumeOverride=-1.0
    TextureCoord1=(X=359.0,Y=73.0,Z=0.0)
    WorldCoord1=(X=3265.0,Y=5470.0,Z=0.0)
    TextureCoord2=(X=-3265.0,Y=5470.0,Z=0.0)
    WorldCoord2=(X=0.0,Y=512.0,Z=0.0)
    Brightness=1.0
    DefaultTexture=Texture'DefaultTexture'
    WireframeTexture=Texture'WhiteSquareTexture'
    WhiteSquareTexture=Texture'WhiteSquareTexture'
    LargeVertex=Texture'LargeVertex'
    PreCacheGame="wGame.wTeamGame"
    DefaultGravity=-1300.0
    StallZ=10000.0
    bUseHeadlights=true
    HeadlightScaling=1.0
    IndoorMeshDrawscale=1.0
    OutdoorMeshDrawscale=1.0
    WaterDustColor=(R=255,G=255,B=255,A=0)
    MoveRepSize=42.0
    MaxClientFrameRate=90.0
    MaxTimeMargin=1.0
    TimeMarginSlack=1.350
    MinTimeMargin=-1.0
    Glow_SkyScale=0.10
    Glow_GaussMultiplier=0.50
    Glow_GaussStdDev=1.0
    SunShafts_Decay=0.90
    SunShafts_Weight=0.10
    SunShafts_Density=0.80
    SunShafts_Exposure=2.0
    SunShafts_HeightScale=1.0
    SunShafts_Color=(R=255,G=160,B=122,A=0)
    MaxOcclusionDistance=300.0
    OcclusionExponent=2.0
    FullyOccludedSamplesFraction=0.50
    fLowDetailBias=1.220
    fMediumDetailBias=1.0
    fHighDetailBias=0.720
    fUltraDetailBias=0.330
    fTestValue1=1.0
    fTestValue2=0.40
    fTestValue3=150.0
    InfluenceStepSize=5
    InfluenceDistFactor=2500.0
    bWorldGeometry=true
    bAlwaysRelevant=true
    RemoteRole=1
    bHiddenEd=true
}