/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Actor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:2
 *	Enums:21
 *	Structs:15
 *	Properties:276
 *	Functions:309
 *
 *******************************************************************************/
class Actor extends Object
    dependson(Player)
    dependson(Console)
    dependson(HUD)
    dependson(PhysicsVolume)
    dependson(NavigationPoint)
    dependson(Canvas)
    dependson(Vehicle)
    dependson(GameInfo)
    dependson(Mutator)
    native
    nativereplication
    abstract;

const MAXSTEPHEIGHT = 35.0;
const MINFLOORZ = 0.7;

enum CollisionPartsType
{
    CP_None,
    CP_Head,
    CP_UpperTorso,
    CP_LowerTorso,
    CP_UpperArm_L,
    CP_UpperArm_R,
    CP_LowerArm_L,
    CP_LowerArm_R,
    CP_UpperLeg_L,
    CP_UpperLeg_R,
    CP_LowerLeg_L,
    CP_LowerLeg_R,
    CP_Bomb_L,
    CP_Bomb_R,
    CP_Bomb_U,
    CP_Bomb_D,
    CP_ETC,
    CP_Head_Round
};

enum ELightType
{
    LT_None,
    LT_Steady,
    LT_Pulse,
    LT_Blink,
    LT_Flicker,
    LT_Strobe,
    LT_BackdropLight,
    LT_SubtlePulse,
    LT_TexturePaletteOnce,
    LT_TexturePaletteLoop,
    LT_FadeOut
};

enum ELightEffect
{
    LE_None,
    LE_TorchWaver,
    LE_FireWaver,
    LE_WateryShimmer,
    LE_Searchlight,
    LE_SlowWave,
    LE_FastWave,
    LE_CloudCast,
    LE_StaticSpot,
    LE_Shock,
    LE_Disco,
    LE_Warp,
    LE_Spotlight,
    LE_NonIncidence,
    LE_Shell,
    LE_OmniBumpMap,
    LE_Interference,
    LE_Cylinder,
    LE_Rotor,
    LE_Negative,
    LE_Sunlight,
    LE_QuadraticNonIncidence
};

enum EDrawType
{
    DT_None,
    DT_Sprite,
    DT_Mesh,
    DT_Brush,
    DT_RopeSprite,
    DT_VerticalSprite,
    DT_Terraform,
    DT_SpriteAnimOnce,
    DT_StaticMesh,
    DT_DrawType,
    DT_Particle,
    DT_AntiPortal,
    DT_LinkAntiPortalVolume,
    DT_FluidSurface,
    DT_CubemapVolume
};

enum EFilterState
{
    FS_Maybe,
    FS_Yes,
    FS_No
};

enum EPhysics
{
    PHYS_None,
    PHYS_Walking,
    PHYS_Falling,
    PHYS_Swimming,
    PHYS_Flying,
    PHYS_Rotating,
    PHYS_Projectile,
    PHYS_Interpolating,
    PHYS_MovingBrush,
    PHYS_Spider,
    PHYS_Trailer,
    PHYS_Ladder,
    PHYS_RootMotion,
    PHYS_Karma,
    PHYS_KarmaRagDoll,
    PHYS_Hovering,
    PHYS_CinMotion
};

enum eWeaponType
{
    WType_None,
    WType_AR,
    WType_SR,
    WType_SMG,
    WType_Pistol,
    WType_GR,
    WType_Shotgun,
    WType_RPG,
    WType_FlameThrower,
    WType_MG,
    WType_Demo,
    WType_AirStrike,
    WType_Melee,
    WType_Helicopter,
    WType_Telegraph_Airstrike,
    WType_Telegraph_Heli,
    WType_Telegraph_UAV,
    WType_Knife
};

enum ENetRole
{
    ROLE_None,
    ROLE_DumbProxy,
    ROLE_SimulatedProxy,
    ROLE_AutonomousProxy,
    ROLE_Authority
};

enum EUV2Mode
{
    UVM_MacroTexture,
    UVM_LightMap,
    UVM_Skin
};

enum ESurfaceTypes
{
    EST_Default,
    EST_ETC,
    EST_Rock,
    EST_Brick,
    EST_Concrete,
    EST_Dirt,
    EST_Metal,
    EST_Metal_pt,
    EST_Wood,
    EST_Plant,
    EST_Flesh,
    EST_Ice,
    EST_Snow,
    EST_Water,
    EST_Glass,
    EST_cotton,
    EST_blood_headshot,
    EST_blood,
    EST_blood_death,
    EST_blood_spurt,
    EST_crackwood,
    EST_plastic,
    EST_paper,
    EST_rubber,
    EST_carpet,
    EST_leaves,
    EST_cloth,
    EST_sand,
    EST_mud,
    EST_water_foot,
    EST_water_wall,
    EST_alien_tankersheld,
    EST_Custom10,
    EST_Custom11,
    EST_Custom12,
    EST_Custom13,
    EST_Custom14,
    EST_Custom15,
    EST_Custom16,
    EST_Custom17,
    EST_Custom18,
    EST_Custom19,
    EST_Custom20,
    EST_Custom21,
    EST_Custom22,
    EST_Custom23,
    EST_Custom24,
    EST_Custom25,
    EST_Custom26,
    EST_Custom27,
    EST_Custom28,
    EST_Custom29,
    EST_Custom30,
    EST_Custom31
};

enum ERenderStyle
{
    STY_None,
    STY_Normal,
    STY_Masked,
    STY_Translucent,
    STY_Modulated,
    STY_Alpha,
    STY_Additive,
    STY_Subtractive,
    STY_Particle,
    STY_AlphaZ
};

enum ESoundOcclusion
{
    OCCLUSION_Default,
    OCCLUSION_None,
    OCCLUSION_BSP,
    OCCLUSION_StaticMeshes
};

enum ESoundSlot
{
    SLOT_None,
    SLOT_Misc,
    SLOT_Pain,
    SLOT_Interact,
    SLOT_Ambient,
    SLOT_Talk,
    SLOT_Interface,
    SLOT_PlayerSoundAlly,
    SLOT_PlayerSoundEnemy,
    SLOT_HUDPART,
    SLOT_ETC_0,
    SLOT_ETC_1,
    SLOT_ETC_2,
    SLOT_ETC_3,
    SLOT_ETC_4,
    SLOT_ETC_5,
    SLOT_ETC_6,
    SLOT_ETC_7,
    SLOT_ETC_8
};

enum EMusicTransition
{
    MTRAN_None,
    MTRAN_Instant,
    MTRAN_Segue,
    MTRAN_Fade,
    MTRAN_FastFade,
    MTRAN_SlowFade
};

enum EForceType
{
    FT_None,
    FT_DragAlong,
    FT_Constant
};

enum ETravelType
{
    TRAVEL_Absolute,
    TRAVEL_Partial,
    TRAVEL_Relative
};

enum EDoubleClickDir
{
    DCLICK_None,
    DCLICK_Left,
    DCLICK_Right,
    DCLICK_Forward,
    DCLICK_Back,
    DCLICK_Active,
    DCLICK_Done
};

enum eKillZType
{
    KILLZ_None,
    KILLZ_Lava,
    KILLZ_Suicide
};

enum EFlagState
{
    FLAG_Home,
    FLAG_HeldFriendly,
    FLAG_HeldEnemy,
    FLAG_Down
};

enum ePlayerParts
{
    PParts_Head,
    PParts_Helmet,
    PParts_Accessory
};

enum EScaleMode
{
    SM_None,
    SM_Up,
    SM_Down,
    SM_Left,
    SM_Right
};

struct ActorRenderDataPtr
{
    var transient pointer Ptr;
};

struct LightRenderDataPtr
{
    var transient pointer Ptr;
};

struct BatchReference
{
    var int BatchIndex;
    var int ElementIndex;
};

struct PointRegion
{
    var ZoneInfo Zone;
    var int iLeaf;
    var byte ZoneNumber;
};

struct ProjectorRenderInfoPtr
{
    var transient pointer Ptr;
};

struct StaticMeshProjectorRenderInfoPtr
{
    var transient pointer Ptr;
};

struct KRBVec
{
    var float X;
    var float Y;
    var float Z;
};

struct KRigidBodyState
{
    var KRBVec Position;
    var Quat Quaternion;
    var KRBVec LinVel;
    var KRBVec AngVel;
};

struct KSimParams
{
    var float GammaPerSec;
    var float Epsilon;
    var float PenetrationOffset;
    var float PenetrationScale;
    var float ContactSoftness;
    var float MaxPenetration;
    var float MaxTimestep;
};

struct AnimRep
{
    var name AnimSequence;
    var bool bAnimLoop;
    var byte AnimRate;
    var byte AnimFrame;
    var byte TweenRate;
};

struct FireProperties
{
    var class<wAmmunition> AmmoClass;
    var class<wProjectile> ProjectileClass;
    var float WarnTargetPct;
    var float MaxRange;
    var bool bTossed;
    var bool bTrySplash;
    var bool bLeadTarget;
    var bool bInstantHit;
    var bool bInitialized;
};

struct native DigitSet
{
    var Material DigitTexture;
    var IntBox TextureCoords[11];
};

struct native SpriteWidget
{
    var Material WidgetTexture;
    var Actor.ERenderStyle RenderStyle;
    var IntBox TextureCoords;
    var float TextureScale;
    var Core.Object.EDrawPivot DrawPivot;
    var float PosX;
    var float PosY;
    var int OffsetX;
    var int OffsetY;
    var Actor.EScaleMode ScaleMode;
    var float Scale;
    var Color Tints[2];
};

struct native NumericWidget
{
    var Actor.ERenderStyle RenderStyle;
    var int MinDigitCount;
    var float TextureScale;
    var Core.Object.EDrawPivot DrawPivot;
    var float PosX;
    var float PosY;
    var int OffsetX;
    var int OffsetY;
    var Color Tints[2];
    var int bPadWithZeroes;
    var transient int Value;
};

struct native CalCoordsW
{
    var float X1;
    var float Y1;
    var float X2;
    var float Y2;
    var float XL;
    var float YL;
    var float U;
    var float V;
    var float UL;
    var float VL;
    var float fWidth;
    var float fHeight;
};

var(Lighting) Actor.ELightType LightType;
var(Lighting) Actor.ELightEffect LightEffect;
var(LightColor) byte LightHue;
var(LightColor) byte LightSaturation;
var(LightColor) float LightBrightness;
var(Lighting) float LightRadius;
var(Lighting) byte LightPeriod;
var(Lighting) byte LightPhase;
var(Lighting) byte LightCone;
var(LightColor) float LightBrightnessScale;
var(LightColor) float PawnLightBrightnessScale;
var(Display) const Actor.EDrawType DrawType;
var native const Actor.EFilterState StaticFilterState;
var(Display) const StaticMesh StaticMesh;
var const Actor Owner;
var const Actor Base;
var const Material BaseMaterial;
var native const ActorRenderDataPtr ActorRenderData;
var native const LightRenderDataPtr LightRenderData;
var native const int RenderRevision;
var int FunctionReplicateCount;
var int VariableReplicateCount;
var native const array<BatchReference> StaticSectionBatches;
var(Display) const name ForcedVisibilityZoneTag;
var(Display) float CullDistance;
var(Lighting) float fLightScale;
var(Lighting) bool bSpecialLit;
var(Lighting) bool bActorShadows;
var(Lighting) bool bCorona;
var(Lighting) bool bDirectionalCorona;
var(Lighting) bool bAttenByLife;
var(Lighting) bool bLightingVisibility;
var(Display) bool bUseDynamicLights;
var bool bLightChanged;
var bool bDramaticLighting;
var() const bool bStatic;
var(Advanced) bool bHidden;
var(Advanced) const bool bNoDelete;
var const bool bDeleteMe;
var const transient bool bTicked;
var(Lighting) bool bDynamicLight;
var(Lighting) bool bEnvironmentLight;
var bool bTimerLoop;
var bool bOnlyOwnerSee;
var(Advanced) bool bHighDetail;
var(Advanced) bool bSuperHighDetail;
var bool bOnlyDrawIfAttached;
var(Advanced) bool bStasis;
var bool bTrailerAllowRotation;
var bool bTrailerSameRotation;
var bool bTrailerPrePivot;
var bool bWorldGeometry;
var(Display) bool bAcceptsProjectors;
var bool bOrientOnSlope;
var const bool bOnlyAffectPawns;
var(Display) bool bDisableSorting;
var(Movement) bool bIgnoreEncroachers;
var bool bShowOctreeNodes;
var bool bWasSNFiltered;
var const transient bool bShouldStopKarma;
var const bool bDetailAttachment;
var const bool bNetTemporary;
var bool bOnlyRelevantToOwner;
var const transient bool bNetDirty;
var bool bAlwaysRelevant;
var bool bReplicateInstigator;
var bool bReplicateMovement;
var bool bSkipActorPropertyReplication;
var bool bUpdateSimulatedPosition;
var bool bTearOff;
var bool bOnlyDirtyReplication;
var bool bReplicateAnimations;
var const bool bNetInitialRotation;
var bool bCompressedPosition;
var bool bAlwaysZeroBoneOffset;
var bool bIgnoreVehicles;
var(Display) bool bDeferRendering;
var bool bBadStateCode;
var bool bSkipTimerInChangedHost;
var bool bSkipLifeSpanInChangedHost;
var int nOldActor;
var array<Object> DestroyListeners;
var(Movement) const Actor.EPhysics Physics;
var Actor.ENetRole RemoteRole;
var Actor.ENetRole Role;
var const transient int NetTag;
var float NetUpdateTime;
var localized float NetUpdateFrequency;
var float NetPriority;
var Pawn Instigator;
var(Sound) Sound AmbientSound;
var const name AttachmentBone;
var const LevelInfo Level;
var const transient Level XLevel;
var(Advanced) float LifeSpan;
var float LifeSpanReplicated;
var float LifeSpanReplicatedClient;
var const PointRegion Region;
var float TimerRate;
var(Display) Material OverlayMaterial;
var(Display) const Mesh Mesh;
var transient float LastRenderTime;
var(Events) name Tag;
var transient array<int> Leaves;
var(Events) name Event;
var Inventory Inventory;
var const float TimerCounter;
var transient MeshInstance MeshInstance;
var(Display) float LODBias;
var(Object) name InitialState;
var(Object) name Group;
var const array<Actor> Touching;
var const transient array<transient pointer> OctreeNodes;
var const transient Box OctreeBox;
var const transient Vector OctreeBoxCenter;
var const transient Vector OctreeBoxRadii;
var const Actor Deleted;
var const float LatentFloat;
var native const int CollisionTag;
var const transient int JoinedTag;
var const PhysicsVolume PhysicsVolume;
var(Movement) const Vector Location;
var(Movement) const Rotator Rotation;
var(Movement) Vector Velocity;
var Vector Acceleration;
var float fLeanAcc;
var Vector vLeanVel;
var Vector vLeanAcc;
var const Vector CachedLocation;
var const Rotator CachedRotation;
var Matrix CachedLocalToWorld;
var(Movement) name AttachTag;
var const array<Actor> Attached;
var const Vector RelativeLocation;
var const Rotator RelativeRotation;
var const Matrix HardRelMatrix;
var native const array<ProjectorRenderInfoPtr> Projectors;
var native const array<StaticMeshProjectorRenderInfoPtr> StaticMeshProjectors;
var(Display) Material Texture;
var StaticMeshInstance StaticMeshInstance;
var const export Model Brush;
var(Display) const float DrawScale;
var(Display) const Vector DrawScale3D;
var(Display) Vector PrePivot;
var bool bSyncCollsionSizeHK;
var(Display) array<Material> Skins;
var Material RepSkin;
var(Display) byte AmbientGlow;
var(Display) byte MaxLights;
var(Display) Actor.EUV2Mode UV2Mode;
var(Display) export ConvexVolume AntiPortal;
var(Display) Material UV2Texture;
var(Display) int UV2TextureSize;
var(Display) Material UV2DirectionalLightmaps;
var(Display) float ScaleGlow;
var(Display) Material EnvironmentMap;
var int CurrentLODLevel;
var(Shadow) bool bShadowMap;
var(Shadow) bool bSelfShadowCast;
var(Shadow) bool bExcludeVisibilityTest;
var(DOF) bool bIsFar;
var(Advanced) bool bDontBatch;
var(Collision) Actor.ESurfaceTypes SurfaceType;
var(Display) Actor.ERenderStyle Style;
var(Display) bool bUnlit;
var(Display) bool bShadowCast;
var(Display) bool bStaticLighting;
var(Display) bool bUseLightingFromBase;
var bool bHurtEntry;
var(Advanced) bool bGameRelevant;
var(Advanced) bool bCollideWhenPlacing;
var bool bTravel;
var(Advanced) bool bMovable;
var bool bDestroyInPainVolume;
var bool bCanBeDamaged;
var(Advanced) bool bShouldBaseAtStartup;
var bool bPendingDelete;
var bool bAnimByOwner;
var bool bOwnerNoSee;
var(Advanced) bool bCanTeleport;
var bool bClientAnim;
var bool bDisturbFluidSurface;
var float FluidSurfaceShootStrengthMod;
var const bool bAlwaysTick;
var(Sound) bool bFullVolume;
var bool bNotifyLocalPlayerTeamReceived;
var(Movement) bool bHardAttach;
var bool bForceSkelUpdate;
var const bool bClientAuthoritative;
var bool bNotDrawSelf;
var(Sound) byte SoundVolume;
var(Sound) byte SoundPitch;
var(Sound) Actor.ESoundOcclusion SoundOcclusion;
var(Sound) float SoundRadius;
var(Sound) float TransientSoundVolume;
var(Sound) float TransientSoundRadius;
var(Collision) const float CollisionRadius;
var(Collision) const float CollisionHeight;
var(Collision) const bool bCollideActors;
var bool bCollideWorld;
var(Collision) bool bBlockActors;
var bool bBlockPlayers;
var bool bBlockProjectiles;
var(Collision) bool bProjTarget;
var(Collision) bool bBlockZeroExtentTraces;
var(Collision) bool bBlockNonZeroExtentTraces;
var(Collision) bool bAutoAlignToTerrain;
var(Collision) bool bUseCylinderCollision;
var(Collision) const bool bBlockKarma;
var bool bBlocksTeleport;
var(Display) bool bAlwaysFaceCamera;
var bool bNetNotify;
var bool bClientTrigger;
var bool bUseCollisionStaticMesh;
var bool bSmoothKarmaStateUpdates;
var bool bIgnoreOutOfWorld;
var(Movement) bool bBounce;
var(Movement) bool bFixedRotationDir;
var(Movement) bool bRotateToDesired;
var(Movement) bool bIgnoreTerminalVelocity;
var(Movement) bool bOrientToVelocity;
var bool bInterpolating;
var const bool bJustTeleported;
var(Movement) float Mass;
var(Movement) float Buoyancy;
var(Movement) Rotator RotationRate;
var(Movement) Rotator DesiredRotation;
var bool DesiredRotationCheck_Yaw;
var bool DesiredRotationCheck_Pitch;
var bool DesiredRotationCheck_Roll;
var float DesiredRotationThreshold_Yaw;
var float DesiredRotationThreshold_Pitch;
var float DesiredRotationThreshold_Roll;
var Actor PendingTouch;
var const Vector ColLocation;
var(Events) name ExcludeTag[8];
var(Karma) export editinline KarmaParamsCollision KParams;
var native const int KStepTag;
var float AccumKarmaAngleError;
var AnimRep SimAnim;
var(Force) Actor.EForceType ForceType;
var(Force) float ForceRadius;
var(Force) float ForceScale;
var(Force) float ForceNoise;
var const bool bNetInitial;
var const bool bNetOwner;
var const bool bNetRelevant;
var const bool bDemoRecording;
var const bool bClientDemoRecording;
var const bool bRepClientDemo;
var const bool bClientDemoNetFunc;
var const bool bDemoOwner;
var bool bNoRepMesh;
var bool bNotOnDedServer;
var bool bAlreadyPrecachedMaterials;
var bool bAlreadyPrecachedMeshes;
var bool bAlreadyPrecachedSkeletalMeshes;
var(Advanced) bool bHiddenEd;
var(Advanced) bool bHiddenEdGroup;
var(Advanced) bool bDirectional;
var const bool bSelected;
var(Advanced) bool bEdShouldSnap;
var transient bool bEdSnap;
var const transient bool bTempEditor;
var bool bObsolete;
var(Collision) bool bPathColliding;
var transient bool bPathTemp;
var bool bScriptInitialized;
var(Advanced) bool bLockLocation;
var bool bTraceWater;
var(Advanced) bool bNoProne;
var class<LocalMessage> MessageClass;
var(Display) float OverlayTimer;
var(Display) transient float ClientOverlayTimer;
var(Display) transient float ClientOverlayCounter;
var Material HighDetailOverlay;

replication
{
    // Pos:0x00
    reliable if(!bSkipActorPropertyReplication || bNetInitial && bReplicateMovement && RemoteRole == 3 && bNetInitial || RemoteRole == 2 && bNetInitial || bUpdateSimulatedPosition && Base == none || Base.bWorldGeometry || RemoteRole == 1 && Base == none || Base.bWorldGeometry)
        Location;

    // Pos:0xb7
    reliable if(!bSkipActorPropertyReplication || bNetInitial && bReplicateMovement && DrawType == 2 || DrawType == 8 && RemoteRole == 3 && bNetInitial || RemoteRole == 2 && bNetInitial || bUpdateSimulatedPosition && Base == none || Base.bWorldGeometry || RemoteRole == 1 && Base == none || Base.bWorldGeometry)
        Rotation;

    // Pos:0x192
    reliable if(!bSkipActorPropertyReplication || bNetInitial && bReplicateMovement && RemoteRole <= 2)
        Base, bOnlyDrawIfAttached;

    // Pos:0x1c2
    reliable if(!bSkipActorPropertyReplication || bNetInitial && bReplicateMovement && RemoteRole <= 2 && Base != none && !Base.bWorldGeometry)
        AttachmentBone, RelativeLocation,
        RelativeRotation;

    // Pos:0x215
    reliable if(!bSkipActorPropertyReplication || bNetInitial && bReplicateMovement && RemoteRole == 2 && bNetInitial || bUpdateSimulatedPosition || RemoteRole == 1 && Physics == 2)
        Velocity;

    // Pos:0x27f
    reliable if(!bSkipActorPropertyReplication || bNetInitial && bReplicateMovement && RemoteRole == 2 && bNetInitial || RemoteRole == 1)
        Physics;

    // Pos:0x2cc
    reliable if(!bSkipActorPropertyReplication || bNetInitial && bReplicateMovement && RemoteRole <= 2)
        bRotateToDesired, RotationRate,
        DesiredRotation, bFixedRotationDir;

    // Pos:0x2fc
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && !bNetOwner || !bClientAnim)
        AmbientSound;

    // Pos:0x33b
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && !bNetOwner || !bClientAnim && AmbientSound != none)
        SoundRadius, SoundVolume,
        SoundPitch;

    // Pos:0x387
    reliable if(Role < 4)
        ServerSpecPlaySoundHK;

    // Pos:0x394
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && DrawType == 2 && bReplicateAnimations)
        SimAnim;

    // Pos:0x3d6
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4)
        bHidden, bNotDrawSelf;

    // Pos:0x3fb
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty)
        Style, Texture,
        bCollideActors, DrawScale,
        bOnlyOwnerSee, bCollideWorld,
        DrawType, bClientTrigger,
        RepSkin;

    // Pos:0x42b
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && bCollideActors || bCollideWorld)
        bIgnoreEncroachers, bBlockActors,
        bProjTarget;

    // Pos:0x471
    reliable if(bSyncCollsionSizeHK && !bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && bCollideActors || bCollideWorld)
        CollisionHeight, CollisionRadius;

    // Pos:0x4c2
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4)
        bNetOwner, LightType,
        bTearOff, Role,
        RemoteRole;

    // Pos:0x4e7
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && bNetOwner)
        Owner;

    // Pos:0x522
    reliable if(Role == 4)
        Inventory, LifeSpanReplicated;

    // Pos:0x52f
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && bReplicateInstigator)
        Instigator;

    // Pos:0x56a
    reliable if(bNetDirty && Role == 4)
        OverlayTimer, OverlayMaterial;

    // Pos:0x582
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && DrawType == 2)
        AmbientGlow, bUnlit;

    // Pos:0x5c4
    reliable if(bSyncCollsionSizeHK && !bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && DrawType == 2)
        PrePivot;

    // Pos:0x611
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && !bNoRepMesh && DrawType == 2)
        Mesh;

    // Pos:0x660
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && DrawType == 8)
        StaticMesh;

    // Pos:0x6a2
    reliable if(!bSkipActorPropertyReplication || bNetInitial && Role == 4 && bNetDirty && LightType != 0)
        bSpecialLit, LightPhase,
        LightPeriod, LightRadius,
        LightBrightness, LightSaturation,
        LightHue, LightEffect;

    // Pos:0x6e4
    unreliable if(bDemoRecording)
        DemoPlaySound;

    // Pos:0x6ea
    reliable if(Role == 4)
        TakeHeadRoundBullet;

}

// Export UActor::execConsoleCommand(FFrame&, void* const)
native function string ConsoleCommand(string Command, optional bool bWriteToLog);
// Export UActor::execCopyObjectToClipboard(FFrame&, void* const)
native function CopyObjectToClipboard(Object obj);
// Export UActor::execTextToSpeech(FFrame&, void* const)
native function TextToSpeech(string Text, float Volume);
// Export UActor::execError(FFrame&, void* const)
native(233) final function Error(coerce string S);
// Export UActor::execShouldBeHidden(FFrame&, void* const)
native static final function bool ShouldBeHidden();
// Export UActor::execSleep(FFrame&, void* const)
native(256) final latent function Sleep(float Seconds);
// Export UActor::execSetCollision(FFrame&, void* const)
native(262) final function SetCollision(optional bool NewColActors, optional bool NewBlockActors, optional bool NewBlockPlayers);
// Export UActor::execSetCollisionSize(FFrame&, void* const)
native(283) final function bool SetCollisionSize(float NewRadius, float NewHeight);
// Export UActor::execSetDrawScale(FFrame&, void* const)
native final function SetDrawScale(float NewScale);
// Export UActor::execSetDrawScale3D(FFrame&, void* const)
native final function SetDrawScale3D(Vector NewScale3D);
// Export UActor::execSetStaticMesh(FFrame&, void* const)
native final function SetStaticMesh(StaticMesh NewStaticMesh);
// Export UActor::execSetDrawType(FFrame&, void* const)
native final function SetDrawType(Actor.EDrawType NewDrawType);
// Export UActor::execMove(FFrame&, void* const)
native(266) final function bool Move(Vector Delta);
// Export UActor::execSetLocation(FFrame&, void* const)
native(267) final function bool SetLocation(Vector NewLocation);
// Export UActor::execSetRotation(FFrame&, void* const)
native(299) final function bool SetRotation(Rotator NewRotation);
// Export UActor::execSetRelativeRotation(FFrame&, void* const)
native final function bool SetRelativeRotation(Rotator NewRotation);
// Export UActor::execSetRelativeLocation(FFrame&, void* const)
native final function bool SetRelativeLocation(Vector NewLocation);
// Export UActor::execMoveSmooth(FFrame&, void* const)
native(3969) final function bool MoveSmooth(Vector Delta, optional bool TestCollide);
// Export UActor::execAutonomousPhysics(FFrame&, void* const)
native(3971) final function AutonomousPhysics(float DeltaSeconds);
// Export UActor::execSetBaseMaterial(FFrame&, void* const)
native final function SetBaseMaterial(Material NewBaseMaterial);
// Export UActor::execSetBase(FFrame&, void* const)
native(298) final function SetBase(Actor NewBase, optional Vector NewFloor);
// Export UActor::execSetOwner(FFrame&, void* const)
native(272) final function SetOwner(Actor NewOwner);
// Export UActor::execIsJoinedTo(FFrame&, void* const)
native final function bool IsJoinedTo(Actor Other);
// Export UActor::execGetMeshName(FFrame&, void* const)
native final function string GetMeshName();
// Export UActor::execPlayAnim(FFrame&, void* const)
native(259) final function bool PlayAnim(name Sequence, optional float Rate, optional float TweenTime, optional int Channel);
// Export UActor::execLoopAnim(FFrame&, void* const)
native(260) final function bool LoopAnim(name Sequence, optional float Rate, optional float TweenTime, optional int Channel);
// Export UActor::execTweenAnim(FFrame&, void* const)
native(294) final function bool TweenAnim(name Sequence, float Time, optional int Channel);
// Export UActor::execIsAnimating(FFrame&, void* const)
native(282) final function bool IsAnimating(optional int Channel);
// Export UActor::execFinishAnim(FFrame&, void* const)
native(261) final latent function FinishAnim(optional int Channel);
// Export UActor::execHasAnim(FFrame&, void* const)
native(263) final function bool HasAnim(name Sequence);
// Export UActor::execStopAnimating(FFrame&, void* const)
native final function StopAnimating(optional bool ClearAllButBase);
// Export UActor::execFreezeAnimAt(FFrame&, void* const)
native final function FreezeAnimAt(float Time, optional int Channel);
// Export UActor::execSetAnimFrame(FFrame&, void* const)
native final function SetAnimFrame(float Time, optional int Channel, optional int UnitFlag);
// Export UActor::execIsTweening(FFrame&, void* const)
native final function bool IsTweening(int Channel);
// Export UActor::execAnimStopLooping(FFrame&, void* const)
native final function AnimStopLooping(optional int Channel);
// Export UActor::execPlayLIPSincAnim(FFrame&, void* const)
native final function PlayLIPSincAnim(name LIPSincAnimName, optional float Volume, optional float Radius, optional float Pitch);
// Export UActor::execStopLIPSincAnim(FFrame&, void* const)
native final function StopLIPSincAnim();
// Export UActor::execHasLIPSincAnim(FFrame&, void* const)
native final function bool HasLIPSincAnim(name LIPSincAnimName);
// Export UActor::execIsPlayingLIPSincAnim(FFrame&, void* const)
native final function bool IsPlayingLIPSincAnim();
// Export UActor::execCurrentLIPSincAnim(FFrame&, void* const)
native final function string CurrentLIPSincAnim();
event LIPSincAnimEnd();
event AnimEnd(int Channel);
// Export UActor::execEnableChannelNotify(FFrame&, void* const)
native final function EnableChannelNotify(int Channel, int Switch);
// Export UActor::execGetNotifyChannel(FFrame&, void* const)
native final function int GetNotifyChannel();
// Export UActor::execLinkSkelAnim(FFrame&, void* const)
native final simulated function LinkSkelAnim(MeshAnimation Anim, optional Mesh NewMesh);
// Export UActor::execLinkMesh(FFrame&, void* const)
native final simulated function LinkMesh(Mesh NewMesh, optional bool bKeepAnim);
// Export UActor::execBoneRefresh(FFrame&, void* const)
native final function BoneRefresh();
// Export UActor::execAnimBlendParams(FFrame&, void* const)
native final function AnimBlendParams(int Stage, optional float BlendAlpha, optional float InTime, optional float OutTime, optional name BoneName, optional bool bGlobalPose);
// Export UActor::execAnimBlendToAlpha(FFrame&, void* const)
native final function AnimBlendToAlpha(int Stage, float TargetAlpha, float TimeInterval);
// Export UActor::execGetBoneCoords(FFrame&, void* const)
native final function Coords GetBoneCoords(name BoneName);
// Export UActor::execGetBoneRotation(FFrame&, void* const)
native final function Rotator GetBoneRotation(name BoneName, optional int Space);
// Export UActor::execGetRootLocation(FFrame&, void* const)
native final function Vector GetRootLocation();
// Export UActor::execGetRootRotation(FFrame&, void* const)
native final function Rotator GetRootRotation();
// Export UActor::execGetRootLocationDelta(FFrame&, void* const)
native final function Vector GetRootLocationDelta();
// Export UActor::execGetRootRotationDelta(FFrame&, void* const)
native final function Rotator GetRootRotationDelta();
// Export UActor::execAttachToBone(FFrame&, void* const)
native final function bool AttachToBone(Actor Attachment, name BoneName);
// Export UActor::execDetachFromBone(FFrame&, void* const)
native final function bool DetachFromBone(Actor Attachment);
// Export UActor::execLockRootMotion(FFrame&, void* const)
native final function LockRootMotion(int Lock);
// Export UActor::execSetBoneScale(FFrame&, void* const)
native final function SetBoneScale(int Slot, optional float BoneScale, optional name BoneName);
// Export UActor::execSetBoneDirection(FFrame&, void* const)
native final function SetBoneDirection(name BoneName, Rotator BoneTurn, optional Vector BoneTrans, optional float Alpha, optional int Space);
// Export UActor::execSetBoneLocation(FFrame&, void* const)
native final function SetBoneLocation(name BoneName, optional Vector BoneTrans, optional float Alpha);
// Export UActor::execSetBoneRotation(FFrame&, void* const)
native final simulated function SetBoneRotation(name BoneName, optional Rotator BoneTurn, optional int Space, optional float Alpha);
// Export UActor::execGetAnimParams(FFrame&, void* const)
native final function GetAnimParams(int Channel, out name OutSeqName, out float OutAnimFrame, out float OutAnimRate);
// Export UActor::execAnimIsInGroup(FFrame&, void* const)
native final function bool AnimIsInGroup(int Channel, name GroupName);
// Export UActor::execGetClosestBone(FFrame&, void* const)
native final function name GetClosestBone(Vector loc, Vector ray, out float boneDist, optional name BiasBone, optional float BiasDistance);
// Export UActor::execUpdateURL(FFrame&, void* const)
native final function UpdateURL(string NewOption, string NewValue, bool bSaveDefault);
// Export UActor::execGetUrlOption(FFrame&, void* const)
native final function string GetUrlOption(string Option);
// Export UActor::execGetRenderBoundingSphere(FFrame&, void* const)
native final function Plane GetRenderBoundingSphere();
// Export UActor::execDrawDebugLine(FFrame&, void* const)
native final function DrawDebugLine(Vector LineStart, Vector LineEnd, byte R, byte G, byte B);
// Export UActor::execDrawStayingDebugLine(FFrame&, void* const)
native final function DrawStayingDebugLine(Vector LineStart, Vector LineEnd, byte R, byte G, byte B);
// Export UActor::execDrawDebugCircle(FFrame&, void* const)
native final function DrawDebugCircle(Vector Base, Vector X, Vector Y, float Radius, int NumSides, byte R, byte G, byte B);
// Export UActor::execDrawDebugSphere(FFrame&, void* const)
native final function DrawDebugSphere(Vector Base, float Radius, int NumDivisions, byte R, byte G, byte B);
// Export UActor::execClearStayingDebugLines(FFrame&, void* const)
native final function ClearStayingDebugLines();
// Export UActor::execDebugClock(FFrame&, void* const)
native final function DebugClock();
// Export UActor::execDebugUnclock(FFrame&, void* const)
native final function DebugUnclock();
// Export UActor::execFinishInterpolation(FFrame&, void* const)
native(301) final latent function FinishInterpolation();
// Export UActor::execSetPhysics(FFrame&, void* const)
native(3970) final function SetPhysics(Actor.EPhysics newPhysics);
// Export UActor::execOnlyAffectPawns(FFrame&, void* const)
native final function OnlyAffectPawns(bool B);
// Export UActor::execKGetSimParams(FFrame&, void* const)
native final function KGetSimParams(out KSimParams SimParams);
// Export UActor::execKSetSimParams(FFrame&, void* const)
native final function KSetSimParams(KSimParams SimParams);
// Export UActor::execKGetRBQuaternion(FFrame&, void* const)
native final function Quat KGetRBQuaternion();
// Export UActor::execKGetRigidBodyState(FFrame&, void* const)
native final function KGetRigidBodyState(out KRigidBodyState RBstate);
// Export UActor::execKDrawRigidBodyState(FFrame&, void* const)
native final function KDrawRigidBodyState(KRigidBodyState RBstate, bool AltColour);
// Export UActor::execKRBVecToVector(FFrame&, void* const)
native final function Vector KRBVecToVector(KRBVec RBvec);
// Export UActor::execKRBVecFromVector(FFrame&, void* const)
native final function KRBVec KRBVecFromVector(Vector V);
// Export UActor::execKSetMass(FFrame&, void* const)
native final function KSetMass(float Mass);
// Export UActor::execKGetMass(FFrame&, void* const)
native final function float KGetMass();
// Export UActor::execKSetInertiaTensor(FFrame&, void* const)
native final function KSetInertiaTensor(Vector it1, Vector it2);
// Export UActor::execKGetInertiaTensor(FFrame&, void* const)
native final function KGetInertiaTensor(out Vector it1, out Vector it2);
// Export UActor::execKSetDampingProps(FFrame&, void* const)
native final function KSetDampingProps(float lindamp, float angdamp);
// Export UActor::execKGetDampingProps(FFrame&, void* const)
native final function KGetDampingProps(out float lindamp, out float angdamp);
// Export UActor::execKSetFriction(FFrame&, void* const)
native final function KSetFriction(float friction);
// Export UActor::execKGetFriction(FFrame&, void* const)
native final function float KGetFriction();
// Export UActor::execKSetRestitution(FFrame&, void* const)
native final function KSetRestitution(float rest);
// Export UActor::execKGetRestitution(FFrame&, void* const)
native final function float KGetRestitution();
// Export UActor::execKSetCOMOffset(FFrame&, void* const)
native final function KSetCOMOffset(Vector offset);
// Export UActor::execKGetCOMOffset(FFrame&, void* const)
native final function KGetCOMOffset(out Vector offset);
// Export UActor::execKGetCOMPosition(FFrame&, void* const)
native final function KGetCOMPosition(out Vector pos);
// Export UActor::execKSetImpactThreshold(FFrame&, void* const)
native final function KSetImpactThreshold(float thresh);
// Export UActor::execKGetImpactThreshold(FFrame&, void* const)
native final function float KGetImpactThreshold();
// Export UActor::execKWake(FFrame&, void* const)
native final function KWake();
// Export UActor::execKIsAwake(FFrame&, void* const)
native final function bool KIsAwake();
// Export UActor::execKAddImpulse(FFrame&, void* const)
native final function KAddImpulse(Vector Impulse, Vector Position, optional name BoneName);
// Export UActor::execKAddAngularImpulse(FFrame&, void* const)
native final function KAddAngularImpulse(Vector AngImpulse);
// Export UActor::execKSetStayUpright(FFrame&, void* const)
native final function KSetStayUpright(bool stayUpright, bool allowRotate);
// Export UActor::execKSetStayUprightParams(FFrame&, void* const)
native final function KSetStayUprightParams(float stiffness, float damping);
// Export UActor::execKSetBlockKarma(FFrame&, void* const)
native final function KSetBlockKarma(bool newBlock);
// Export UActor::execKSetActorGravScale(FFrame&, void* const)
native final function KSetActorGravScale(float ActorGravScale);
// Export UActor::execKGetActorGravScale(FFrame&, void* const)
native final function float KGetActorGravScale();
// Export UActor::execKDisableCollision(FFrame&, void* const)
native final function KDisableCollision(Actor Other);
// Export UActor::execKEnableCollision(FFrame&, void* const)
native final function KEnableCollision(Actor Other);
// Export UActor::execKSetSkelVel(FFrame&, void* const)
native final function KSetSkelVel(Vector Velocity, optional Vector AngVelocity, optional bool AddToCurrent);
// Export UActor::execKGetSkelMass(FFrame&, void* const)
native final function float KGetSkelMass();
// Export UActor::execKFreezeRagdoll(FFrame&, void* const)
native final function KFreezeRagdoll();
// Export UActor::execKScaleJointLimits(FFrame&, void* const)
native final function KScaleJointLimits(float Scale, float stiffness);
// Export UActor::execKAddBoneLifter(FFrame&, void* const)
native final function KAddBoneLifter(name BoneName, InterpCurve LiftVel, float LateralFriction, InterpCurve Softness);
// Export UActor::execKRemoveLifterFromBone(FFrame&, void* const)
native final function KRemoveLifterFromBone(name BoneName);
// Export UActor::execKRemoveAllBoneLifters(FFrame&, void* const)
native final function KRemoveAllBoneLifters();
// Export UActor::execKMakeRagdollAvailable(FFrame&, void* const)
native final function KMakeRagdollAvailable();
// Export UActor::execKIsRagdollAvailable(FFrame&, void* const)
native final function bool KIsRagdollAvailable();
event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm);
event KVelDropBelow();
event KSkelConvulse();
event KApplyForce(out Vector Force, out Vector Torque);
event bool KUpdateState(out KRigidBodyState NewState);
// Export UActor::execClock(FFrame&, void* const)
native final function Clock(out float Time);
// Export UActor::execUnClock(FFrame&, void* const)
native final function UnClock(out float Time);
// Export UActor::execAllowMusicPlayback(FFrame&, void* const)
native final function AllowMusicPlayback(bool Allow);
// Export UActor::execPlayStream(FFrame&, void* const)
native final function int PlayStream(string Song, optional bool UseMusicVolume, optional float Volume, optional float FadeInTime, optional float SeekTime);
// Export UActor::execStopStream(FFrame&, void* const)
native final function StopStream(int Handle, optional float FadeOutTime);
// Export UActor::execSeekStream(FFrame&, void* const)
native final function int SeekStream(int Handle, float Seconds);
// Export UActor::execAdjustVolume(FFrame&, void* const)
native final function bool AdjustVolume(int Handle, float NewVolume);
// Export UActor::execPauseStream(FFrame&, void* const)
native final function bool PauseStream(int Handle);
// Export UActor::execPlayMusic(FFrame&, void* const)
native final function int PlayMusic(string Song, optional float FadeInTime, optional float InitialSeekTime);
// Export UActor::execIsPlayingMusic(FFrame&, void* const)
native final function bool IsPlayingMusic(int SongHandle);
// Export UActor::execStopMusic(FFrame&, void* const)
native final function StopMusic(int SongHandle, optional float FadeOutTime);
// Export UActor::execStopAllMusic(FFrame&, void* const)
native final function StopAllMusic(optional float FadeOutTime);
// Export UActor::execStopAllMusicAndClearQueue(FFrame&, void* const)
native final function StopAllMusicAndClearQueue(optional float FadeOutTime);
// Export UActor::execGetMusicDuration(FFrame&, void* const)
native final function float GetMusicDuration(int SongHandle);
// Export UActor::execIsPenetrate(FFrame&, void* const)
native final function bool IsPenetrate();
event Destroyed()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x37 [While If]
    if(lp1 < DestroyListeners.Length)
    {
        DestroyListeners[lp1].NotifyDestroyed(self);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    DestroyListeners.Length = 0;
}

function RegisterDestroyListener(Object o)
{
    DestroyListeners[DestroyListeners.Length] = o;
}

simulated function CheckLifeSpanReplicated()
{
    // End:0x25
    if(LifeSpanReplicated != LifeSpanReplicatedClient)
    {
        LifeSpanReplicatedClient = LifeSpanReplicated;
        LifeSpan = LifeSpanReplicated;
    }
}

event GainedChild(Actor Other);
event LostChild(Actor Other);
event Tick(float DeltaTime);
event PostNetReceive();
event ClientTrigger();
event Trigger(Actor Other, Pawn EventInstigator);
event UnTrigger(Actor Other, Pawn EventInstigator);
event BeginEvent();
event EndEvent();
simulated function TimerPop(VolumeTimer t);
event Timer();
event HitWall(Vector HitNormal, Actor HitWall, Material HitMaterial);
event Falling();
event Landed(Vector HitNormal);
event ZoneChange(ZoneInfo NewZone);
event PhysicsVolumeChange(PhysicsVolume NewVolume);
event Touch(Actor Other);
event PostTouch(Actor Other);
event UnTouch(Actor Other);
event Bump(Actor Other);
event BaseChange();
event Attach(Actor Other);
event Detach(Actor Other);
event Actor SpecialHandling(Pawn Other);
event bool EncroachingOn(Actor Other);
event EncroachedBy(Actor Other);
event RanInto(Actor Other);
event FinishedInterpolation()
{
    bInterpolating = false;
}

event EndedRotation();
event UsedBy(Pawn User);
simulated event FellOutOfWorld(Actor.eKillZType KillType)
{
    SetPhysics(0);
    Destroy();
}

event KilledBy(Pawn EventInstigator);
event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
function bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType);
event TakeHeadRoundBullet(Vector HitLocation, int WeaponType);
// Export UActor::execGetNameFromStr(FFrame&, void* const)
native function bool GetNameFromStr(string strName, out name retName);
// Export UActor::execTrace(FFrame&, void* const)
native(277) final function Actor Trace(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional Vector Extent, optional out Material Material, optional out Actor.CollisionPartsType CollPart);
// Export UActor::execMultiTrace(FFrame&, void* const)
native final function MultiTrace(out BtrTraceResult BtrResult, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional bool bTraceMaterial, optional Vector Extent);
// Export UActor::execFastTrace(FFrame&, void* const)
native(548) final function bool FastTrace(Vector TraceEnd, optional Vector TraceStart);
// Export UActor::execTraceThisActor(FFrame&, void* const)
native final function bool TraceThisActor(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, Vector TraceStart, optional Vector Extent);
// Export UActor::execTraceThisActorHitPart(FFrame&, void* const)
native final function bool TraceThisActorHitPart(out Vector HitLocation, out Vector HitNormal, out byte HitCollisionPart, Vector TraceEnd, Vector TraceStart, optional Vector Extent);
// Export UActor::execSpawn(FFrame&, void* const)
native(278) final function Actor Spawn(class<Actor> SpawnClass, optional Actor SpawnOwner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation, optional bool bNoCollisionFail);
// Export UActor::execDestroy(FFrame&, void* const)
native(279) final function bool Destroy();
event TornOff();
// Export UActor::execSetTimer(FFrame&, void* const)
native(280) final function SetTimer(float NewTimerRate, bool bLoop);
event PreSaveGame();
event PostLoadSavedGame();
// Export UActor::execfPlaySound(FFrame&, void* const)
native function int fPlaySound(string fileName, optional Actor.ESoundSlot Slot, optional bool bNoOverride, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner);
// Export UActor::execPlaySoundHK(FFrame&, void* const)
native function int PlaySoundHK(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner);
// Export UActor::execSpecPlaySoundHK(FFrame&, void* const)
native function int SpecPlaySoundHK(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner);
function int ServerSpecPlaySoundHK(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    return SpecPlaySoundHK(Sound, Slot, Volume, bNoOverride, Radius, Pitch, Attenuate, Loop, SellectTeam, bExceptOwner);
}

// Export UActor::execPlaySoundHK2(FFrame&, void* const)
native function int PlaySoundHK2(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner, optional Vector SoundLocation);
// Export UActor::execSpecPlaySoundHK2(FFrame&, void* const)
native function int SpecPlaySoundHK2(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner, optional Vector SoundLocation);
// Export UActor::execPlaySound(FFrame&, void* const)
native(264) final function int PlaySound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner);
// Export UActor::execPlayOwnedSound(FFrame&, void* const)
native final simulated function int PlayOwnedSound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner);
// Export UActor::execDemoPlaySound(FFrame&, void* const)
native simulated event DemoPlaySound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate);
// Export UActor::execStopSound(FFrame&, void* const)
native final simulated function StopSound(Actor.ESoundSlot Slot, optional bool bNoOverride);
// Export UActor::execStopAllSound(FFrame&, void* const)
native final simulated function StopAllSound();
// Export UActor::execStopAllSoundByActor(FFrame&, void* const)
native final simulated function StopAllSoundByActor();
// Export UActor::execStopLoopSoundByActor(FFrame&, void* const)
native final simulated function StopLoopSoundByActor();
// Export UActor::execStopSoundHK(FFrame&, void* const)
native final simulated function bool StopSoundHK(int SourceID);
// Export UActor::execIsSoundPlayingHK(FFrame&, void* const)
native final simulated function bool IsSoundPlayingHK(int SourceID);
// Export UActor::execGetSoundDuration(FFrame&, void* const)
native final function float GetSoundDuration(Sound Sound);
// Export UActor::execPlayFeedbackEffect(FFrame&, void* const)
native(566) final function PlayFeedbackEffect(string EffectName);
// Export UActor::execStopFeedbackEffect(FFrame&, void* const)
native(567) final function StopFeedbackEffect(optional string EffectName);
// Export UActor::execChangeSpringFeedbackEffect(FFrame&, void* const)
native(568) final function ChangeSpringFeedbackEffect(string EffectName, float CenterX, float CenterY);
// Export UActor::execChangeBaseParamsFeedbackEffect(FFrame&, void* const)
native(569) final function ChangeBaseParamsFeedbackEffect(string EffectName, optional float DirectionX, optional float DirectionY, optional float Gain);
// Export UActor::execForceFeedbackSupported(FFrame&, void* const)
native final function bool ForceFeedbackSupported(optional bool Enable);
// Export UActor::execMakeNoise(FFrame&, void* const)
native(512) final function MakeNoise(float Loudness);
// Export UActor::execPlayerCanSeeMe(FFrame&, void* const)
native(532) final function bool PlayerCanSeeMe();
// Export UActor::execSuggestFallVelocity(FFrame&, void* const)
native final function Vector SuggestFallVelocity(Vector Destination, Vector Start, float MaxZ, float MaxXYSpeed);
event bool PreTeleport(Teleporter InTeleporter);
event PostTeleport(Teleporter OutTeleporter);
event BeginPlay();
// Export UActor::execResetStaticFilterState(FFrame&, void* const)
native final function ResetStaticFilterState();
// Export UActor::execAddToPackageMap(FFrame&, void* const)
native final function AddToPackageMap(optional string PackageName);
// Export UActor::execGetMapName(FFrame&, void* const)
native(539) final function string GetMapName(string NameEnding, string MapName, int Dir);
// Export UActor::execGetNextSkin(FFrame&, void* const)
native(545) final function GetNextSkin(string Prefix, string CurrentSkin, int Dir, out string SkinName, out string SkinDesc);
// Export UActor::execGetURLMap(FFrame&, void* const)
native(547) final function string GetURLMap(optional bool bIncludeOptions);
// Export UActor::execGetNextInt(FFrame&, void* const)
native final function string GetNextInt(string ClassName, int Num);
// Export UActor::execGetNextIntDesc(FFrame&, void* const)
native final function GetNextIntDesc(string ClassName, int Num, out string Entry, out string Description);
// Export UActor::execGetAllInt(FFrame&, void* const)
native static final function GetAllInt(string MetaClass, array<string> Entries);
// Export UActor::execGetAllIntDesc(FFrame&, void* const)
native static final function GetAllIntDesc(string MetaClass, out array<string> Entry, out array<string> Description);
// Export UActor::execGetCacheEntry(FFrame&, void* const)
native final function bool GetCacheEntry(int Num, out string Guid, out string fileName);
// Export UActor::execMoveCacheEntry(FFrame&, void* const)
native final function bool MoveCacheEntry(string Guid, optional string NewFilename);
// Export UActor::execAllActors(FFrame&, void* const)
native(304) final iterator function AllActors(class<Actor> baseClass, out Actor Actor, optional name MatchTag);
// Export UActor::execDynamicActors(FFrame&, void* const)
native(313) final iterator function DynamicActors(class<Actor> baseClass, out Actor Actor, optional name MatchTag);
// Export UActor::execChildActors(FFrame&, void* const)
native(305) final iterator function ChildActors(class<Actor> baseClass, out Actor Actor);
// Export UActor::execBasedActors(FFrame&, void* const)
native(306) final iterator function BasedActors(class<Actor> baseClass, out Actor Actor);
// Export UActor::execTouchingActors(FFrame&, void* const)
native(307) final iterator function TouchingActors(class<Actor> baseClass, out Actor Actor);
// Export UActor::execTraceActors(FFrame&, void* const)
native(309) final iterator function TraceActors(class<Actor> baseClass, out Actor Actor, out Vector HitLoc, out Vector HitNorm, Vector End, optional Vector Start, optional Vector Extent);
// Export UActor::execRadiusActors(FFrame&, void* const)
native(310) final iterator function RadiusActors(class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc);
// Export UActor::execVisibleActors(FFrame&, void* const)
native(311) final iterator function VisibleActors(class<Actor> baseClass, out Actor Actor, optional float Radius, optional Vector loc);
// Export UActor::execVisibleCollidingActors(FFrame&, void* const)
native(312) final iterator function VisibleCollidingActors(class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc, optional bool bIgnoreHidden);
// Export UActor::execCollidingActors(FFrame&, void* const)
native(321) final iterator function CollidingActors(class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc);
// Export UActor::execIterateActorArray(FFrame&, void* const)
native final iterator function IterateActorArray(array<Actor> ActorArray, class<Actor> baseClass, out Actor Actor, optional name MatchTag);
// Export UActor::execIterateObjectArray(FFrame&, void* const)
native final iterator function IterateObjectArray(array<Object> ObjectArray, Class baseClass, out Object Object);
// Export UActor::execSubtract_ColorColor(FFrame&, void* const)
native(549) static final operator(20) Color -(Color A, Color B);
// Export UActor::execMultiply_FloatColor(FFrame&, void* const)
native(550) static final operator(16) Color *(float A, Color B);
// Export UActor::execAdd_ColorColor(FFrame&, void* const)
native(551) static final operator(20) Color +(Color A, Color B);
// Export UActor::execMultiply_ColorFloat(FFrame&, void* const)
native(552) static final operator(16) Color *(Color A, float B);
event RecoverFromBadStateCode();
function RenderOverlays(Canvas Canvas);
event RenderTexture(ScriptedTexture Tex);
event PreBeginPlay()
{
    // End:0x55
    if(!bGameRelevant && Level.NetMode != 3 && !Level.Game.BaseMutator.CheckRelevance(self))
    {
        Destroy();
    }
    // End:0x8b
    else
    {
        // End:0x8b
        if(Level.DetailMode == 0 && CullDistance == default.CullDistance)
        {
            CullDistance *= 0.80;
        }
    }
}

function ForceBegin()
{
    PreBeginPlay();
    BeginPlay();
    PostBeginPlay();
    PostNetBeginPlay();
    SetInitialState();
    MatchStarting();
}

event BroadcastLocalizedMessage(class<LocalMessage> MessageClass, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    Level.Game.BroadcastLocalized(self, MessageClass, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

event PostBeginPlay();
simulated event SetInitialState()
{
    bScriptInitialized = true;
    // End:0x21
    if(InitialState != 'None')
    {
        GotoState(InitialState);
    }
    // End:0x28
    else
    {
        GotoState('Auto');
    }
}

simulated event SetGRIInitialState();
event PostNetBeginPlay();
simulated function UpdatePrecacheMaterials()
{
    local int i;

    // End:0x58
    if(Skins.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0x58 [While If]
        if(i < Skins.Length)
        {
            // End:0x4e
            if(Skins[i] != none)
            {
                Level.AddPrecacheMaterial(Skins[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
}

simulated function UpdatePrecacheStaticMeshes()
{
    // End:0x3e
    if(DrawType == 8 && !bStatic && !bNoDelete)
    {
        Level.AddPrecacheStaticMesh(StaticMesh);
    }
}

simulated function UpdatePrecacheSkeletalMeshes()
{
    // End:0x3e
    if(DrawType == 2 && !bStatic && !bNoDelete)
    {
        Level.AddPrecacheSkeletalMesh(Mesh);
    }
}

simulated function UpdateAnnouncements();
simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds);
simulated function HurtRadius(float DamageAmount, float DamageRadius, class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float damageScale, dist;
    local Vector Dir;

    // End:0x0b
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x1c6
    foreach VisibleCollidingActors(class'Actor', Victims, DamageRadius, HitLocation)
    {
        // End:0x1c5
        if(Victims != self && Victims.Role == 4 && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0, VSize(Dir));
            Dir = Dir / dist;
            damageScale = 1.0 - FMax(0.0, dist - Victims.CollisionRadius / DamageRadius);
            Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - 0.50 * Victims.CollisionHeight + Victims.CollisionRadius * Dir, damageScale * Momentum * Dir, DamageType);
            // End:0x1c5
            if(Instigator != none && Vehicle(Victims) != none && Vehicle(Victims).Health > 0)
            {
                Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, DamageType, Momentum, HitLocation);
            }
        }                
    }
    bHurtEntry = false;
}

function bool CheckForErrors()
{
    // End:0x1e
    if(bObsolete)
    {
        Log(string(self) $ " is Obsolete");
    }
    return bObsolete;
}

event TravelPreAccept();
event TravelPostAccept();
function BecomeViewTarget();
function POVChanged(PlayerController PC, bool bBehindViewChanged);
simulated function string GetHumanReadableName()
{
    return GetItemName(string(Class));
}

function SetDisplayProperties(Actor.ERenderStyle NewStyle, Material NewTexture, bool bLighting)
{
    Style = NewStyle;
    Texture = NewTexture;
    bUnlit = bLighting;
}

function SetDefaultDisplayProperties()
{
    Style = default.Style;
    Texture = default.Texture;
    bUnlit = default.bUnlit;
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return "";
}

function MatchStarting();
function SetGRI(GameReplicationInfo GRI);
function string GetDebugName()
{
    return GetItemName(string(self));
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string t;
    local float XL;
    local int i;
    local Actor A;
    local name Anim;
    local float frame, Rate;

    Canvas.Style = 1;
    Canvas.StrLen("TEST", XL, YL);
    YPos = YPos + YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.SetDrawColor(byte(255), 0, 0);
    t = GetDebugName();
    // End:0xaf
    if(bDeleteMe)
    {
        t = t $ " DELETED (bDeleteMe == true)";
    }
    Canvas.DrawText(t, false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x2fb
    if(Level.NetMode != 0)
    {
        t = "ROLE ";
        switch(Role)
        {
            // End:0x149
            case 0:
                t = t $ "None";
                // End:0x1d7
                break;
            // End:0x169
            case 1:
                t = t $ "DumbProxy";
                // End:0x1d7
                break;
            // End:0x18e
            case 2:
                t = t $ "SimulatedProxy";
                // End:0x1d7
                break;
            // End:0x1b4
            case 3:
                t = t $ "AutonomousProxy";
                // End:0x1d7
                break;
            // End:0x1d4
            case 4:
                t = t $ "Authority";
                // End:0x1d7
                break;
            // End:0xffff
            default:
                t = t $ " REMOTE ROLE ";
                switch(RemoteRole)
                {
                    // End:0x215
                    case 0:
                        t = t $ "None";
                        // End:0x2a3
                        break;
                    // End:0x235
                    case 1:
                        t = t $ "DumbProxy";
                        // End:0x2a3
                        break;
                    // End:0x25a
                    case 2:
                        t = t $ "SimulatedProxy";
                        // End:0x2a3
                        break;
                    // End:0x280
                    case 3:
                        t = t $ "AutonomousProxy";
                        // End:0x2a3
                        break;
                    // End:0x2a0
                    case 4:
                        t = t $ "Authority";
                        // End:0x2a3
                        break;
                    // End:0xffff
                    default:
                        // End:0x2c4
                        if(bTearOff)
                        {
                            t = t $ " Tear Off";
                        }
                        Canvas.DrawText(t, false);
                        YPos += YL;
                        Canvas.SetPos(4.0, YPos);
                    }
                    t = "Physics ";
                    switch(Physics)
                    {
                        // End:0x32d
                        case 0:
                            t = t $ "None";
                            // End:0x4a2
                            break;
                        // End:0x34b
                        case 1:
                            t = t $ "Walking";
                            // End:0x4a2
                            break;
                        // End:0x369
                        case 2:
                            t = t $ "Falling";
                            // End:0x4a2
                            break;
                        // End:0x388
                        case 3:
                            t = t $ "Swimming";
                            // End:0x4a2
                            break;
                        // End:0x3a5
                        case 4:
                            t = t $ "Flying";
                            // End:0x4a2
                            break;
                        // End:0x3c4
                        case 5:
                            t = t $ "Rotating";
                            // End:0x4a2
                            break;
                        // End:0x3e5
                        case 6:
                            t = t $ "Projectile";
                            // End:0x4a2
                            break;
                        // End:0x409
                        case 7:
                            t = t $ "Interpolating";
                            // End:0x4a2
                            break;
                        // End:0x42b
                        case 8:
                            t = t $ "MovingBrush";
                            // End:0x4a2
                            break;
                        // End:0x448
                        case 9:
                            t = t $ "Spider";
                            // End:0x4a2
                            break;
                        // End:0x466
                        case 10:
                            t = t $ "Trailer";
                            // End:0x4a2
                            break;
                        // End:0x483
                        case 11:
                            t = t $ "Ladder";
                            // End:0x4a2
                            break;
                        // End:0x49f
                        case 13:
                            t = t $ "Karma";
                            // End:0x4a2
                            break;
                        // End:0xffff
                        default:
                            t = t $ " in physicsvolume " $ GetItemName(string(PhysicsVolume)) $ " on base " $ GetItemName(string(Base));
                            // End:0x514
                            if(bBounce)
                            {
                                t = t $ " - will bounce";
                            }
                            Canvas.DrawText(t, false);
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            Canvas.DrawText("PrePivot: " $ string(PrePivot), false);
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            Canvas.DrawText("Location: " $ string(Location) $ " Rotation " $ string(Rotation), false);
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            Canvas.DrawText("Velocity: " $ string(Velocity) $ " Speed " $ string(VSize(Velocity)) $ " Speed2D " $ string(VSize(Velocity - Velocity.Z * vect(0.0, 0.0, 1.0))), false);
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            Canvas.DrawText("Acceleration: " $ string(Acceleration), false);
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            Canvas.DrawColor.B = 0;
                            Canvas.DrawText("Collision Radius " $ string(CollisionRadius) $ " Height " $ string(CollisionHeight));
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            Canvas.DrawText("Collides with Actors " $ string(bCollideActors) $ ", world " $ string(bCollideWorld) $ ", proj. target " $ string(bProjTarget));
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            Canvas.DrawText("Blocks Actors " $ string(bBlockActors));
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            t = "Touching ";
                            // End:0x854
                            foreach TouchingActors(class'Actor', A)
                            {
                                t = t $ GetItemName(string(A)) $ " ";                                                                
                            }
                            // End:0x882
                            if(t == "Touching ")
                            {
                                t = "Touching nothing";
                            }
                            Canvas.DrawText(t, false);
                            YPos += YL;
                            Canvas.SetPos(4.0, YPos);
                            Canvas.DrawColor.R = 0;
                            t = "Rendered: ";
                            switch(Style)
                            {
                                // End:0x8fb
                                case 0:
                                    t = t;
                                    // End:0x996
                                    break;
                                // End:0x918
                                case 1:
                                    t = t $ "Normal";
                                    // End:0x996
                                    break;
                                // End:0x935
                                case 2:
                                    t = t $ "Masked";
                                    // End:0x996
                                    break;
                                // End:0x957
                                case 3:
                                    t = t $ "Translucent";
                                    // End:0x996
                                    break;
                                // End:0x977
                                case 4:
                                    t = t $ "Modulated";
                                    // End:0x996
                                    break;
                                // End:0x993
                                case 5:
                                    t = t $ "Alpha";
                                    // End:0x996
                                    break;
                                // End:0xffff
                                default:
                                    switch(DrawType)
                                    {
                                        // End:0x9b9
                                        case 0:
                                            t = t $ " None";
                                            // End:0xacc
                                            break;
                                        // End:0x9d8
                                        case 1:
                                            t = t $ " Sprite ";
                                            // End:0xacc
                                            break;
                                        // End:0x9f5
                                        case 2:
                                            t = t $ " Mesh ";
                                            // End:0xacc
                                            break;
                                        // End:0xa13
                                        case 3:
                                            t = t $ " Brush ";
                                            // End:0xacc
                                            break;
                                        // End:0xa36
                                        case 4:
                                            t = t $ " RopeSprite ";
                                            // End:0xacc
                                            break;
                                        // End:0xa5d
                                        case 5:
                                            t = t $ " VerticalSprite ";
                                            // End:0xacc
                                            break;
                                        // End:0xa7f
                                        case 6:
                                            t = t $ " Terraform ";
                                            // End:0xacc
                                            break;
                                        // End:0xaa6
                                        case 7:
                                            t = t $ " SpriteAnimOnce ";
                                            // End:0xacc
                                            break;
                                        // End:0xac9
                                        case 8:
                                            t = t $ " StaticMesh ";
                                            // End:0xacc
                                            break;
                                        // End:0xffff
                                        default:
                                            // End:0xc32
                                            if(DrawType == 2)
                                            {
                                                t = t $ GetItemName(string(Mesh));
                                                // End:0xb77
                                                if(Skins.Length > 0)
                                                {
                                                    t = t $ " skins: ";
                                                    i = 0;
                                                    J0xb20:
                                                    // End:0xb77 [While If]
                                                    if(i < Skins.Length)
                                                    {
                                                        // End:0xb47
                                                        if(Skins[i] == none)
                                                        {
                                                            // This is an implied JumpToken;
                                                            goto J0xb77;
                                                        }
                                                        // End:0xb6d
                                                        else
                                                        {
                                                            t = t $ GetItemName(string(Skins[i])) $ ", ";
                                                        }
                                                        ++ i;
                                                        // This is an implied JumpToken; Continue!
                                                        goto J0xb20;
                                                    }
                                                }
                                                J0xb77:
                                                Canvas.DrawText(t, false);
                                                YPos += YL;
                                                Canvas.SetPos(4.0, YPos);
                                                GetAnimParams(0, Anim, frame, Rate);
                                                t = "AnimSequence " $ string(Anim) $ " Frame " $ string(frame) $ " Rate " $ string(Rate);
                                                // End:0xc2f
                                                if(bAnimByOwner)
                                                {
                                                    t = t $ " Anim by Owner";
                                                }
                                            }
                                            // End:0xc8f
                                            else
                                            {
                                                // End:0xc6b
                                                if(DrawType == 1 || DrawType == 7)
                                                {
                                                    t = t $ string(Texture);
                                                }
                                                // End:0xc8f
                                                else
                                                {
                                                    // End:0xc8f
                                                    if(DrawType == 3)
                                                    {
                                                        t = t $ string(Brush);
                                                    }
                                                }
                                            }
                                            Canvas.DrawText(t, false);
                                            YPos += YL;
                                            Canvas.SetPos(4.0, YPos);
                                            Canvas.DrawColor.B = byte(255);
                                            Canvas.DrawText("Tag: " $ string(Tag) $ " Event: " $ string(Event) $ " STATE: " $ string(GetStateName()), false);
                                            YPos += YL;
                                            Canvas.SetPos(4.0, YPos);
                                            Canvas.DrawText("Instigator " $ GetItemName(string(Instigator)) $ " Owner " $ GetItemName(string(Owner)));
                                            YPos += YL;
                                            Canvas.SetPos(4.0, YPos);
                                            Canvas.DrawText("Timer: " $ string(TimerCounter) $ " LifeSpan " $ string(LifeSpan) $ " AmbientSound " $ string(AmbientSound) $ " volume " $ string(SoundVolume));
                                            YPos += YL;
                                            Canvas.SetPos(4.0, YPos);
}

final simulated function bool NearSpot(Vector Spot)
{
    local Vector Dir;

    Dir = Location - Spot;
    // End:0x2a
    if(Abs(Dir.Z) > CollisionHeight)
    {
        return false;
    }
    Dir.Z = 0.0;
    return VSize(Dir) <= CollisionRadius;
}

final simulated function bool TouchingActor(Actor A)
{
    local Vector Dir;

    Dir = Location - A.Location;
    // End:0x43
    if(Abs(Dir.Z) > CollisionHeight + A.CollisionHeight)
    {
        return false;
    }
    Dir.Z = 0.0;
    return VSize(Dir) <= CollisionRadius + A.CollisionRadius;
}

simulated function StartInterpolation()
{
    GotoState('None');
    SetCollision(true, false);
    bCollideWorld = false;
    bInterpolating = true;
    SetPhysics(0);
}

function Reset();
simulated event TriggerEvent(name EventName, Actor Other, Pawn EventInstigator)
{
    local Actor A;
    local NavigationPoint N;

    // End:0x11
    if(EventName == 'None')
    {
        return;
    }
    // End:0x40
    foreach DynamicActors(class'Actor', A, EventName)
    {
        A.Trigger(Other, EventInstigator);                
    }
    N = Level.NavigationPointList;
    J0x55:
    // End:0xbc [While If]
    if(N != none)
    {
        // End:0xa5
        if(N.bStatic && N.Tag == EventName)
        {
            N.Trigger(Other, EventInstigator);
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x55;
    }
}

function UntriggerEvent(name EventName, Actor Other, Pawn EventInstigator)
{
    local Actor A;
    local NavigationPoint N;

    // End:0x11
    if(EventName == 'None')
    {
        return;
    }
    // End:0x40
    foreach DynamicActors(class'Actor', A, EventName)
    {
        A.UnTrigger(Other, EventInstigator);                
    }
    N = Level.NavigationPointList;
    J0x55:
    // End:0xbc [While If]
    if(N != none)
    {
        // End:0xa5
        if(N.bStatic && N.Tag == EventName)
        {
            N.UnTrigger(Other, EventInstigator);
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x55;
    }
}

function bool IsInVolume(Volume aVolume)
{
    local Volume V;

    // End:0x23
    foreach TouchingActors(class'Volume', V)
    {
        // End:0x22
        if(V == aVolume)
        {
            break;
            return true;
        }                
    }
    return false;
}

function bool IsInPain()
{
    local PhysicsVolume V;

    // End:0x3e
    foreach TouchingActors(class'PhysicsVolume', V)
    {
        // End:0x3d
        if(V.bPainCausing && V.DamagePerSec > float(0))
        {
            break;
            return true;
        }                
    }
    return false;
}

function PlayTeleportEffect(bool bOut, bool bSound);
simulated function bool CanSplash()
{
    return false;
}

function Vector GetCollisionExtent()
{
    local Vector Extent;

    Extent = CollisionRadius * vect(1.0, 1.0, 0.0);
    Extent.Z = CollisionHeight;
    return Extent;
}

static function Crash()
{
    assert(false);
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
    // End:0x90
    if(OverlayMaterial == none || OverlayMaterial == mat || bOverride)
    {
        OverlayMaterial = mat;
        // End:0x56
        if(OverlayTimer == Time)
        {
            OverlayTimer = Time + 0.0010;
        }
        // End:0x61
        else
        {
            OverlayTimer = Time;
        }
        ClientOverlayTimer = OverlayTimer;
        ClientOverlayCounter = OverlayTimer;
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
}

simulated function bool CheckMaxEffectDistance(PlayerController P, Vector SpawnLocation)
{
    return !P.BeyondViewDistance(SpawnLocation, 0.0);
}

simulated function bool EffectIsRelevant(Vector SpawnLocation, bool bForceDedicated)
{
    local PlayerController P;
    local bool bResult;

    // End:0x20
    if(Level.NetMode == 1)
    {
        return bForceDedicated;
    }
    // End:0x44
    if(Level.NetMode != 3)
    {
        bResult = true;
    }
    // End:0xd8
    else
    {
        // End:0x68
        if(Instigator != none && Instigator.IsHumanControlled())
        {
            return true;
        }
        // End:0xd8
        else
        {
            // End:0x9c
            if(SpawnLocation == Location)
            {
                bResult = Level.TimeSeconds - LastRenderTime < float(3);
            }
            // End:0xd8
            else
            {
                // End:0xd8
                if(Instigator != none && Level.TimeSeconds - Instigator.LastRenderTime < float(3))
                {
                    bResult = true;
                }
            }
        }
    }
    // End:0x1d8
    if(bResult)
    {
        P = Level.GetLocalPlayerController();
        // End:0x122
        if(P == none || P.ViewTarget == none)
        {
            bResult = false;
        }
        // End:0x1d8
        else
        {
            // End:0x154
            if(P.Pawn == Instigator)
            {
                bResult = CheckMaxEffectDistance(P, SpawnLocation);
            }
            // End:0x1d8
            else
            {
                // End:0x1c1
                if(vector(P.Rotation) Dot SpawnLocation - P.ViewTarget.Location < 0.0)
                {
                    bResult = VSize(P.ViewTarget.Location - SpawnLocation) < float(1600);
                }
                // End:0x1d8
                else
                {
                    bResult = CheckMaxEffectDistance(P, SpawnLocation);
                }
            }
        }
    }
    return bResult;
}

function bool SelfTriggered()
{
    return false;
}

function bool TeamLink(int TeamNum)
{
    return false;
}

function SetDelayedDamageInstigatorController(Controller C);
function NotifyLocalPlayerDead(PlayerController PC);
function NotifyLocalPlayerTeamReceived();
event alllog(coerce string Msg)
{
    ctlog(Msg);
    clog(Msg);
    Log(Msg);
}

event ctlog(coerce string Msg)
{
    // End:0x62
    if(Level.GetLocalPlayerController().myHUD != none)
    {
        Level.GetLocalPlayerController().myHUD.AddTextMessage(Msg, class'GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
    }
}

simulated event clog(coerce string Msg)
{
    // End:0x4a
    if(Level.GetLocalPlayerController() != none)
    {
        Level.GetLocalPlayerController().Player.Console.Message(Msg, 1.0);
    }
}

function crlog(coerce string Msg)
{
    Log(Msg);
    UnresolvedNativeFunction_97(Msg);
}

event dblog(coerce string Msg)
{
    clog(Msg);
    Log(Msg);
}

event rpclog(coerce string rpc)
{
    // End:0x107
    if(rpc == "ServerMove" || rpc == "ShortServerMove" || rpc == "DualServerMove" || rpc == "ShortClientAdjustPosition" || rpc == "ServerUpdatePing" || rpc == "ServerSetwShakeRotation" || rpc == "ServerSetwShockRotation" || rpc == "ServerSetwBreathRotation")
    {
    }
    // End:0x11c
    else
    {
        dblog("RPC - " $ rpc);
    }
}

function InitBot(int Grade);
function bool IsStationary()
{
    return true;
}

function float GetDotH(Vector V)
{
    local float Dot;
    local Vector X, Y, Z, Dir;

    GetAxes(Rotation, X, Y, Z);
    X.Z = 0.0;
    Dir = V - Location;
    Dir.Z = 0.0;
    Dot = Normal(Dir) Dot Normal(X);
    return Dot;
}

function float GetAngleH(Vector V)
{
    return Acos(GetDotH(V));
}

function RecoverFromHostChange();
function PawnBaseDied();
function bool BlocksShotAt(Actor Other)
{
    return false;
}

event SunLightDirectionUpdate(Vector direction);
function OnBeginRound();
function OnEndRound();

defaultproperties
{
    LightBrightnessScale=1.0
    PawnLightBrightnessScale=1.0
    DrawType=1
    fLightScale=1.0
    bLightingVisibility=true
    bAcceptsProjectors=true
    bReplicateMovement=true
    bDeferRendering=true
    RemoteRole=1
    Role=4
    NetUpdateFrequency=100.0
    NetPriority=1.0
    LODBias=1.0
    Texture=Texture'S_Actor'
    DrawScale=1.0
    DrawScale3D=(X=1.0,Y=1.0,Z=1.0)
    bSyncCollsionSizeHK=true
    MaxLights=4
    UV2TextureSize=128
    ScaleGlow=1.0
    CurrentLODLevel=-1
    Style=1
    bMovable=true
    FluidSurfaceShootStrengthMod=1.0
    SoundVolume=128
    SoundPitch=64
    SoundRadius=64.0
    TransientSoundVolume=0.30
    TransientSoundRadius=105.0
    CollisionRadius=22.0
    CollisionHeight=22.0
    bBlockZeroExtentTraces=true
    bBlockNonZeroExtentTraces=true
    bSmoothKarmaStateUpdates=true
    bJustTeleported=true
    Mass=100.0
    DesiredRotationCheck_Yaw=true
    DesiredRotationThreshold_Yaw=2000.0
    DesiredRotationThreshold_Pitch=2000.0
    DesiredRotationThreshold_Roll=2000.0
    ForceNoise=0.50
    MessageClass=class'LocalMessage'
}