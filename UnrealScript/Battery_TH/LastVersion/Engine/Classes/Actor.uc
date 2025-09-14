class Actor extends Object
    abstract
    native
    nativereplication;

const MAXSTEPHEIGHT = 35.0;
const MINFLOORZ = 0.7;

enum CollisionPartsType
{
    CP_None,                        // 0
    CP_Head,                        // 1
    CP_UpperTorso,                  // 2
    CP_LowerTorso,                  // 3
    CP_UpperArm_L,                  // 4
    CP_UpperArm_R,                  // 5
    CP_LowerArm_L,                  // 6
    CP_LowerArm_R,                  // 7
    CP_UpperLeg_L,                  // 8
    CP_UpperLeg_R,                  // 9
    CP_LowerLeg_L,                  // 10
    CP_LowerLeg_R,                  // 11
    CP_Bomb_L,                      // 12
    CP_Bomb_R,                      // 13
    CP_Bomb_U,                      // 14
    CP_Bomb_D,                      // 15
    CP_Helicopter,                  // 16
    CP_Head_Round,                  // 17
    CP_SentryG01_Axis,              // 18
    CP_SentryG01_LF,                // 19
    CP_SentryG01_RF,                // 20
    CP_SentryG01_B,                 // 21
    CP_SentryG01_Weapon             // 22
};

enum ELightType
{
    LT_None,                        // 0
    LT_Steady,                      // 1
    LT_Pulse,                       // 2
    LT_Blink,                       // 3
    LT_Flicker,                     // 4
    LT_Strobe,                      // 5
    LT_BackdropLight,               // 6
    LT_SubtlePulse,                 // 7
    LT_TexturePaletteOnce,          // 8
    LT_TexturePaletteLoop,          // 9
    LT_FadeOut                      // 10
};

enum ELightEffect
{
    LE_None,                        // 0
    LE_TorchWaver,                  // 1
    LE_FireWaver,                   // 2
    LE_WateryShimmer,               // 3
    LE_Searchlight,                 // 4
    LE_SlowWave,                    // 5
    LE_FastWave,                    // 6
    LE_CloudCast,                   // 7
    LE_StaticSpot,                  // 8
    LE_Shock,                       // 9
    LE_Disco,                       // 10
    LE_Warp,                        // 11
    LE_Spotlight,                   // 12
    LE_NonIncidence,                // 13
    LE_Shell,                       // 14
    LE_OmniBumpMap,                 // 15
    LE_Interference,                // 16
    LE_Cylinder,                    // 17
    LE_Rotor,                       // 18
    LE_Negative,                    // 19
    LE_Sunlight,                    // 20
    LE_QuadraticNonIncidence        // 21
};

enum EDrawType
{
    DT_None,                        // 0
    DT_Sprite,                      // 1
    DT_Mesh,                        // 2
    DT_Brush,                       // 3
    DT_RopeSprite,                  // 4
    DT_VerticalSprite,              // 5
    DT_Terraform,                   // 6
    DT_SpriteAnimOnce,              // 7
    DT_StaticMesh,                  // 8
    DT_DrawType,                    // 9
    DT_Particle,                    // 10
    DT_AntiPortal,                  // 11
    DT_LinkAntiPortalVolume,        // 12
    DT_FluidSurface,                // 13
    DT_CubemapVolume                // 14
};

enum EFilterState
{
    FS_Maybe,                       // 0
    FS_Yes,                         // 1
    FS_No                           // 2
};

enum EPhysics
{
    PHYS_None,                      // 0
    PHYS_Walking,                   // 1
    PHYS_Falling,                   // 2
    PHYS_Swimming,                  // 3
    PHYS_Flying,                    // 4
    PHYS_Rotating,                  // 5
    PHYS_Projectile,                // 6
    PHYS_Interpolating,             // 7
    PHYS_MovingBrush,               // 8
    PHYS_Spider,                    // 9
    PHYS_Trailer,                   // 10
    PHYS_Ladder,                    // 11
    PHYS_RootMotion,                // 12
    PHYS_Karma,                     // 13
    PHYS_KarmaRagDoll,              // 14
    PHYS_Hovering,                  // 15
    PHYS_CinMotion                  // 16
};

enum eWeaponType
{
    WType_None,                     // 0
    WType_AR,                       // 1
    WType_SR,                       // 2
    WType_SMG,                      // 3
    WType_Pistol,                   // 4
    WType_GR,                       // 5
    WType_Shotgun,                  // 6
    WType_RPG,                      // 7
    WType_FlameThrower,             // 8
    WType_MG,                       // 9
    WType_Demo,                     // 10
    WType_AirStrike,                // 11
    WType_Melee,                    // 12
    WType_Helicopter,               // 13
    WType_Telegraph_Airstrike,      // 14
    WType_Telegraph_Heli,           // 15
    WType_Telegraph_UAV,            // 16
    WType_Knife,                    // 17
    WType_SentryGun,                // 18
    WType_SentryGunPack,            // 19
    WType_PinpointBomb              // 20
};

enum ENetRole
{
    ROLE_None,                      // 0
    ROLE_DumbProxy,                 // 1
    ROLE_SimulatedProxy,            // 2
    ROLE_AutonomousProxy,           // 3
    ROLE_Authority                  // 4
};

enum EUV2Mode
{
    UVM_MacroTexture,               // 0
    UVM_LightMap,                   // 1
    UVM_Skin                        // 2
};

enum ESurfaceTypes
{
    EST_Default,                    // 0
    EST_ETC,                        // 1
    EST_Rock,                       // 2
    EST_Brick,                      // 3
    EST_Concrete,                   // 4
    EST_Dirt,                       // 5
    EST_Metal,                      // 6
    EST_Metal_pt,                   // 7
    EST_Wood,                       // 8
    EST_Plant,                      // 9
    EST_Flesh,                      // 10
    EST_Ice,                        // 11
    EST_Snow,                       // 12
    EST_Water,                      // 13
    EST_Glass,                      // 14
    EST_cotton,                     // 15
    EST_blood_headshot,             // 16
    EST_blood,                      // 17
    EST_blood_death,                // 18
    EST_blood_spurt,                // 19
    EST_crackwood,                  // 20
    EST_plastic,                    // 21
    EST_paper,                      // 22
    EST_rubber,                     // 23
    EST_carpet,                     // 24
    EST_leaves,                     // 25
    EST_cloth,                      // 26
    EST_sand,                       // 27
    EST_mud,                        // 28
    EST_water_foot,                 // 29
    EST_water_wall,                 // 30
    EST_alien_tankersheld,          // 31
    EST_Custom10,                   // 32
    EST_Custom11,                   // 33
    EST_Custom12,                   // 34
    EST_Custom13,                   // 35
    EST_Custom14,                   // 36
    EST_Custom15,                   // 37
    EST_Custom16,                   // 38
    EST_Custom17,                   // 39
    EST_Custom18,                   // 40
    EST_Custom19,                   // 41
    EST_Custom20,                   // 42
    EST_Custom21,                   // 43
    EST_Custom22,                   // 44
    EST_Custom23,                   // 45
    EST_Custom24,                   // 46
    EST_Custom25,                   // 47
    EST_Custom26,                   // 48
    EST_Custom27,                   // 49
    EST_Custom28,                   // 50
    EST_Custom29,                   // 51
    EST_Custom30,                   // 52
    EST_Custom31                    // 53
};

enum ERenderStyle
{
    STY_None,                       // 0
    STY_Normal,                     // 1
    STY_Masked,                     // 2
    STY_Translucent,                // 3
    STY_Modulated,                  // 4
    STY_Alpha,                      // 5
    STY_Additive,                   // 6
    STY_Subtractive,                // 7
    STY_Particle,                   // 8
    STY_AlphaZ                      // 9
};

enum ESoundOcclusion
{
    OCCLUSION_Default,              // 0
    OCCLUSION_None,                 // 1
    OCCLUSION_BSP,                  // 2
    OCCLUSION_StaticMeshes          // 3
};

enum ESoundSlot
{
    SLOT_None,                      // 0
    SLOT_Misc,                      // 1
    SLOT_Pain,                      // 2
    SLOT_Interact,                  // 3
    SLOT_Ambient,                   // 4
    SLOT_Talk,                      // 5
    SLOT_Interface,                 // 6
    SLOT_PlayerSoundAlly,           // 7
    SLOT_PlayerSoundEnemy,          // 8
    SLOT_HUDPART,                   // 9
    SLOT_ETC_0,                     // 10
    SLOT_ETC_1,                     // 11
    SLOT_ETC_2,                     // 12
    SLOT_ETC_3,                     // 13
    SLOT_ETC_4,                     // 14
    SLOT_ETC_5,                     // 15
    SLOT_ETC_6,                     // 16
    SLOT_ETC_7,                     // 17
    SLOT_ETC_8                      // 18
};

enum EMusicTransition
{
    MTRAN_None,                     // 0
    MTRAN_Instant,                  // 1
    MTRAN_Segue,                    // 2
    MTRAN_Fade,                     // 3
    MTRAN_FastFade,                 // 4
    MTRAN_SlowFade                  // 5
};

enum EForceType
{
    FT_None,                        // 0
    FT_DragAlong,                   // 1
    FT_Constant                     // 2
};

enum ETravelType
{
    TRAVEL_Absolute,                // 0
    TRAVEL_Partial,                 // 1
    TRAVEL_Relative                 // 2
};

enum EDoubleClickDir
{
    DCLICK_None,                    // 0
    DCLICK_Left,                    // 1
    DCLICK_Right,                   // 2
    DCLICK_Forward,                 // 3
    DCLICK_Back,                    // 4
    DCLICK_Active,                  // 5
    DCLICK_Done                     // 6
};

enum eKillZType
{
    KILLZ_None,                     // 0
    KILLZ_Lava,                     // 1
    KILLZ_Suicide                   // 2
};

enum EFlagState
{
    FLAG_Home,                      // 0
    FLAG_HeldFriendly,              // 1
    FLAG_HeldEnemy,                 // 2
    FLAG_Down                       // 3
};

enum ePlayerParts
{
    PParts_Helmet,                  // 0
    PParts_Accessory,               // 1
    PParts_Backpack,                // 2
    PParts_Pouch,                   // 3
    PParts_Camouflage               // 4
};

enum ePlayerGoreParts
{
    GPParts_Head,                   // 0
    GPParts_Helmet,                 // 1
    GPParts_Accessory               // 2
};

enum EScaleMode
{
    SM_None,                        // 0
    SM_Up,                          // 1
    SM_Down,                        // 2
    SM_Left,                        // 3
    SM_Right                        // 4
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
    var Class<wAmmunition> AmmoClass;
    var Class<wProjectile> ProjectileClass;
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
    var Object.EDrawPivot DrawPivot;
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
    var Object.EDrawPivot DrawPivot;
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
var(Fmod) string FmodAmbientSound;
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
var bool bUseRelativeBaseRotation;
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
var(Collision) bool bForceCollision;
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
var Class<LocalMessage> MessageClass;
var(Display) float OverlayTimer;
var(Display) transient float ClientOverlayTimer;
var(Display) transient float ClientOverlayCounter;
var Material HighDetailOverlay;

replication
{
    // Pos:0x6E4
    unreliable if(bDemoRecording)
        FmodDemoPlaySound;

    // Pos:0x000
    reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && (((int(RemoteRole) == int(ROLE_AutonomousProxy)) && bNetInitial) || ((int(RemoteRole) == int(ROLE_SimulatedProxy)) && bNetInitial || bUpdateSimulatedPosition) && (Base == none) || Base.bWorldGeometry) || (int(RemoteRole) == int(ROLE_DumbProxy)) && (Base == none) || Base.bWorldGeometry)
        Location;

    // Pos:0x0B7
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && (int(DrawType) == int(2)) || int(DrawType) == int(8)) && (((int(RemoteRole) == int(ROLE_AutonomousProxy)) && bNetInitial) || ((int(RemoteRole) == int(ROLE_SimulatedProxy)) && bNetInitial || bUpdateSimulatedPosition) && (Base == none) || Base.bWorldGeometry) || (int(RemoteRole) == int(ROLE_DumbProxy)) && (Base == none) || Base.bWorldGeometry)
        Rotation;

    // Pos:0x192
    reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && int(RemoteRole) <= int(ROLE_SimulatedProxy))
        Base, bOnlyDrawIfAttached;

    // Pos:0x1C2
    reliable if(((((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && int(RemoteRole) <= int(ROLE_SimulatedProxy)) && Base != none) && !Base.bWorldGeometry)
        AttachmentBone, RelativeLocation, 
        RelativeRotation;

    // Pos:0x215
    reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && ((int(RemoteRole) == int(ROLE_SimulatedProxy)) && bNetInitial || bUpdateSimulatedPosition) || (int(RemoteRole) == int(ROLE_DumbProxy)) && int(Physics) == int(2))
        Velocity;

    // Pos:0x27F
    reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && ((int(RemoteRole) == int(ROLE_SimulatedProxy)) && bNetInitial) || int(RemoteRole) == int(ROLE_DumbProxy))
        Physics;

    // Pos:0x2CC
    reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && int(RemoteRole) <= int(ROLE_SimulatedProxy))
        DesiredRotation, RotationRate, 
        bFixedRotationDir, bRotateToDesired;

    // Pos:0x2FC
    reliable if(((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && !bNetOwner || !bClientAnim)
        AmbientSound;

    // Pos:0x33B
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && !bNetOwner || !bClientAnim) && AmbientSound != none)
        SoundPitch, SoundRadius, 
        SoundVolume;

    // Pos:0x387
    reliable if(int(Role) < int(ROLE_Authority))
        FmodServerSpecPlaySound;

    // Pos:0x394
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && int(DrawType) == int(2)) && bReplicateAnimations)
        SimAnim;

    // Pos:0x3D6
    reliable if((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority))
        bHidden, bNotDrawSelf;

    // Pos:0x3FB
    reliable if(((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty)
        DrawScale, DrawType, 
        RepSkin, Style, 
        Texture, bClientTrigger, 
        bCollideActors, bCollideWorld, 
        bOnlyOwnerSee;

    // Pos:0x42B
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && bCollideActors || bCollideWorld)
        bBlockActors, bIgnoreEncroachers, 
        bProjTarget;

    // Pos:0x471
    reliable if((((bSyncCollsionSizeHK && !bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && bCollideActors || bCollideWorld)
        CollisionHeight, CollisionRadius;

    // Pos:0x4C2
    reliable if((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority))
        LightType, RemoteRole, 
        Role, bNetOwner, 
        bTearOff;

    // Pos:0x4E7
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && bNetOwner)
        Owner;

    // Pos:0x522
    reliable if(int(Role) == int(ROLE_Authority))
        Inventory, LifeSpanReplicated;

    // Pos:0x52F
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && bReplicateInstigator)
        Instigator;

    // Pos:0x56A
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        OverlayMaterial, OverlayTimer;

    // Pos:0x582
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && int(DrawType) == int(2))
        AmbientGlow, bUnlit;

    // Pos:0x5C4
    reliable if((((bSyncCollsionSizeHK && !bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && int(DrawType) == int(2))
        PrePivot;

    // Pos:0x611
    reliable if(((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && !bNoRepMesh) && int(DrawType) == int(2))
        Mesh;

    // Pos:0x660
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && int(DrawType) == int(8))
        StaticMesh;

    // Pos:0x6A2
    reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && int(LightType) != int(0))
        LightBrightness, LightEffect, 
        LightHue, LightPeriod, 
        LightPhase, LightRadius, 
        LightSaturation, bSpecialLit;

    // Pos:0x6EA
    reliable if(int(Role) == int(ROLE_Authority))
        TakeHeadRoundBullet;
}

// Export UActor::execConsoleCommand(FFrame&, void* const)
native function string ConsoleCommand(string Command, optional bool bWriteToLog)
{
    //native.Command;
    //native.bWriteToLog;        
}

// Export UActor::execCopyObjectToClipboard(FFrame&, void* const)
native function CopyObjectToClipboard(Object obj)
{
    //native.obj;        
}

// Export UActor::execTextToSpeech(FFrame&, void* const)
native function TextToSpeech(string Text, float Volume)
{
    //native.Text;
    //native.Volume;        
}

// Export UActor::execError(FFrame&, void* const)
native(233) final function Error(coerce string S)
{
    //native.S;        
}

// Export UActor::execShouldBeHidden(FFrame&, void* const)
native static final function bool ShouldBeHidden();

// Export UActor::execSleep(FFrame&, void* const)
native(256) final latent function Sleep(float Seconds)
{
    //native.Seconds;        
}

// Export UActor::execSetCollision(FFrame&, void* const)
native(262) final function SetCollision(optional bool NewColActors, optional bool NewBlockActors, optional bool NewBlockPlayers)
{
    //native.NewColActors;
    //native.NewBlockActors;
    //native.NewBlockPlayers;        
}

// Export UActor::execSetCollisionSize(FFrame&, void* const)
native(283) final function bool SetCollisionSize(float NewRadius, float NewHeight)
{
    //native.NewRadius;
    //native.NewHeight;        
}

// Export UActor::execSetDrawScale(FFrame&, void* const)
native final function SetDrawScale(float NewScale)
{
    //native.NewScale;        
}

// Export UActor::execSetDrawScale3D(FFrame&, void* const)
native final function SetDrawScale3D(Vector NewScale3D)
{
    //native.NewScale3D;        
}

// Export UActor::execSetStaticMesh(FFrame&, void* const)
native final function SetStaticMesh(StaticMesh NewStaticMesh)
{
    //native.NewStaticMesh;        
}

// Export UActor::execSetDrawType(FFrame&, void* const)
native final function SetDrawType(Actor.EDrawType NewDrawType)
{
    //native.NewDrawType;        
}

// Export UActor::execMove(FFrame&, void* const)
native(266) final function bool Move(Vector Delta)
{
    //native.Delta;        
}

// Export UActor::execSetLocation(FFrame&, void* const)
native(267) final function bool SetLocation(Vector NewLocation)
{
    //native.NewLocation;        
}

// Export UActor::execSetRotation(FFrame&, void* const)
native(299) final function bool SetRotation(Rotator NewRotation)
{
    //native.NewRotation;        
}

// Export UActor::execSetForceRotation(FFrame&, void* const)
native final function bool SetForceRotation(Rotator NewRotation)
{
    //native.NewRotation;        
}

// Export UActor::execSetRelativeRotation(FFrame&, void* const)
native final function bool SetRelativeRotation(Rotator NewRotation)
{
    //native.NewRotation;        
}

// Export UActor::execSetRelativeLocation(FFrame&, void* const)
native final function bool SetRelativeLocation(Vector NewLocation)
{
    //native.NewLocation;        
}

// Export UActor::execMoveSmooth(FFrame&, void* const)
native(3969) final function bool MoveSmooth(Vector Delta, optional bool TestCollide)
{
    //native.Delta;
    //native.TestCollide;        
}

// Export UActor::execAutonomousPhysics(FFrame&, void* const)
native(3971) final function AutonomousPhysics(float DeltaSeconds)
{
    //native.DeltaSeconds;        
}

// Export UActor::execSetBaseMaterial(FFrame&, void* const)
native final function SetBaseMaterial(Material NewBaseMaterial)
{
    //native.NewBaseMaterial;        
}

// Export UActor::execSetBase(FFrame&, void* const)
native(298) final function SetBase(Actor NewBase, optional Vector NewFloor)
{
    //native.NewBase;
    //native.NewFloor;        
}

// Export UActor::execSetOwner(FFrame&, void* const)
native(272) final function SetOwner(Actor NewOwner)
{
    //native.NewOwner;        
}

// Export UActor::execIsJoinedTo(FFrame&, void* const)
native final function bool IsJoinedTo(Actor Other)
{
    //native.Other;        
}

// Export UActor::execGetMeshName(FFrame&, void* const)
native final function string GetMeshName();

// Export UActor::execPlayAnim(FFrame&, void* const)
native(259) final function bool PlayAnim(name Sequence, optional float Rate, optional float TweenTime, optional int Channel)
{
    //native.Sequence;
    //native.Rate;
    //native.TweenTime;
    //native.Channel;        
}

// Export UActor::execLoopAnim(FFrame&, void* const)
native(260) final function bool LoopAnim(name Sequence, optional float Rate, optional float TweenTime, optional int Channel)
{
    //native.Sequence;
    //native.Rate;
    //native.TweenTime;
    //native.Channel;        
}

// Export UActor::execTweenAnim(FFrame&, void* const)
native(294) final function bool TweenAnim(name Sequence, float Time, optional int Channel)
{
    //native.Sequence;
    //native.Time;
    //native.Channel;        
}

// Export UActor::execIsAnimating(FFrame&, void* const)
native(282) final function bool IsAnimating(optional int Channel)
{
    //native.Channel;        
}

// Export UActor::execFinishAnim(FFrame&, void* const)
native(261) final latent function FinishAnim(optional int Channel)
{
    //native.Channel;        
}

// Export UActor::execHasAnim(FFrame&, void* const)
native(263) final function bool HasAnim(name Sequence)
{
    //native.Sequence;        
}

// Export UActor::execStopAnimating(FFrame&, void* const)
native final function StopAnimating(optional bool ClearAllButBase)
{
    //native.ClearAllButBase;        
}

// Export UActor::execFreezeAnimAt(FFrame&, void* const)
native final function FreezeAnimAt(float Time, optional int Channel)
{
    //native.Time;
    //native.Channel;        
}

// Export UActor::execSetAnimFrame(FFrame&, void* const)
native final function SetAnimFrame(float Time, optional int Channel, optional int UnitFlag)
{
    //native.Time;
    //native.Channel;
    //native.UnitFlag;        
}

// Export UActor::execIsTweening(FFrame&, void* const)
native final function bool IsTweening(int Channel)
{
    //native.Channel;        
}

// Export UActor::execAnimStopLooping(FFrame&, void* const)
native final function AnimStopLooping(optional int Channel)
{
    //native.Channel;        
}

// Export UActor::execPlayLIPSincAnim(FFrame&, void* const)
native final function PlayLIPSincAnim(name LIPSincAnimName, optional float Volume, optional float Radius, optional float Pitch)
{
    //native.LIPSincAnimName;
    //native.Volume;
    //native.Radius;
    //native.Pitch;        
}

// Export UActor::execStopLIPSincAnim(FFrame&, void* const)
native final function StopLIPSincAnim();

// Export UActor::execHasLIPSincAnim(FFrame&, void* const)
native final function bool HasLIPSincAnim(name LIPSincAnimName)
{
    //native.LIPSincAnimName;        
}

// Export UActor::execIsPlayingLIPSincAnim(FFrame&, void* const)
native final function bool IsPlayingLIPSincAnim();

// Export UActor::execCurrentLIPSincAnim(FFrame&, void* const)
native final function string CurrentLIPSincAnim();

event LIPSincAnimEnd()
{
    //return;    
}

event AnimEnd(int Channel)
{
    //return;    
}

// Export UActor::execEnableChannelNotify(FFrame&, void* const)
native final function EnableChannelNotify(int Channel, int Switch)
{
    //native.Channel;
    //native.Switch;        
}

// Export UActor::execGetNotifyChannel(FFrame&, void* const)
native final function int GetNotifyChannel();

// Export UActor::execLinkSkelAnim(FFrame&, void* const)
native final simulated function LinkSkelAnim(MeshAnimation Anim, optional Mesh NewMesh)
{
    //native.Anim;
    //native.NewMesh;        
}

// Export UActor::execLinkMesh(FFrame&, void* const)
native final simulated function LinkMesh(Mesh NewMesh, optional bool bKeepAnim)
{
    //native.NewMesh;
    //native.bKeepAnim;        
}

// Export UActor::execBoneRefresh(FFrame&, void* const)
native final function BoneRefresh();

// Export UActor::execAnimBlendParams(FFrame&, void* const)
native final function AnimBlendParams(int Stage, optional float BlendAlpha, optional float InTime, optional float OutTime, optional name BoneName, optional bool bGlobalPose)
{
    //native.Stage;
    //native.BlendAlpha;
    //native.InTime;
    //native.OutTime;
    //native.BoneName;
    //native.bGlobalPose;        
}

// Export UActor::execAnimBlendToAlpha(FFrame&, void* const)
native final function AnimBlendToAlpha(int Stage, float TargetAlpha, float TimeInterval)
{
    //native.Stage;
    //native.TargetAlpha;
    //native.TimeInterval;        
}

// Export UActor::execGetBoneCoords(FFrame&, void* const)
native final function Coords GetBoneCoords(name BoneName)
{
    //native.BoneName;        
}

// Export UActor::execGetBoneRotation(FFrame&, void* const)
native final function Rotator GetBoneRotation(name BoneName, optional int Space)
{
    //native.BoneName;
    //native.Space;        
}

// Export UActor::execGetRootLocation(FFrame&, void* const)
native final function Vector GetRootLocation();

// Export UActor::execGetRootRotation(FFrame&, void* const)
native final function Rotator GetRootRotation();

// Export UActor::execGetRootLocationDelta(FFrame&, void* const)
native final function Vector GetRootLocationDelta();

// Export UActor::execGetRootRotationDelta(FFrame&, void* const)
native final function Rotator GetRootRotationDelta();

// Export UActor::execAttachToBone(FFrame&, void* const)
native final function bool AttachToBone(Actor Attachment, name BoneName)
{
    //native.Attachment;
    //native.BoneName;        
}

// Export UActor::execDetachFromBone(FFrame&, void* const)
native final function bool DetachFromBone(Actor Attachment)
{
    //native.Attachment;        
}

// Export UActor::execLockRootMotion(FFrame&, void* const)
native final function LockRootMotion(int Lock)
{
    //native.Lock;        
}

// Export UActor::execSetBoneScale(FFrame&, void* const)
native final function SetBoneScale(int Slot, optional float BoneScale, optional name BoneName)
{
    //native.Slot;
    //native.BoneScale;
    //native.BoneName;        
}

// Export UActor::execSetBoneDirection(FFrame&, void* const)
native final function SetBoneDirection(name BoneName, Rotator BoneTurn, optional Vector BoneTrans, optional float Alpha, optional int Space)
{
    //native.BoneName;
    //native.BoneTurn;
    //native.BoneTrans;
    //native.Alpha;
    //native.Space;        
}

// Export UActor::execSetBoneLocation(FFrame&, void* const)
native final function SetBoneLocation(name BoneName, optional Vector BoneTrans, optional float Alpha)
{
    //native.BoneName;
    //native.BoneTrans;
    //native.Alpha;        
}

// Export UActor::execSetBoneRotation(FFrame&, void* const)
native final simulated function SetBoneRotation(name BoneName, optional Rotator BoneTurn, optional int Space, optional float Alpha)
{
    //native.BoneName;
    //native.BoneTurn;
    //native.Space;
    //native.Alpha;        
}

// Export UActor::execGetAnimParams(FFrame&, void* const)
native final function GetAnimParams(int Channel, out name OutSeqName, out float OutAnimFrame, out float OutAnimRate)
{
    //native.Channel;
    //native.OutSeqName;
    //native.OutAnimFrame;
    //native.OutAnimRate;        
}

// Export UActor::execAnimIsInGroup(FFrame&, void* const)
native final function bool AnimIsInGroup(int Channel, name GroupName)
{
    //native.Channel;
    //native.GroupName;        
}

// Export UActor::execGetClosestBone(FFrame&, void* const)
native final function name GetClosestBone(Vector loc, Vector ray, out float boneDist, optional name BiasBone, optional float BiasDistance)
{
    //native.loc;
    //native.ray;
    //native.boneDist;
    //native.BiasBone;
    //native.BiasDistance;        
}

// Export UActor::execUpdateURL(FFrame&, void* const)
native final function UpdateURL(string NewOption, string NewValue, bool bSaveDefault)
{
    //native.NewOption;
    //native.NewValue;
    //native.bSaveDefault;        
}

// Export UActor::execGetUrlOption(FFrame&, void* const)
native final function string GetUrlOption(string Option)
{
    //native.Option;        
}

// Export UActor::execGetRenderBoundingSphere(FFrame&, void* const)
native final function Plane GetRenderBoundingSphere();

// Export UActor::execDrawDebugLine(FFrame&, void* const)
native final function DrawDebugLine(Vector LineStart, Vector LineEnd, byte R, byte G, byte B)
{
    //native.LineStart;
    //native.LineEnd;
    //native.R;
    //native.G;
    //native.B;        
}

// Export UActor::execDrawStayingDebugLine(FFrame&, void* const)
native final function DrawStayingDebugLine(Vector LineStart, Vector LineEnd, byte R, byte G, byte B)
{
    //native.LineStart;
    //native.LineEnd;
    //native.R;
    //native.G;
    //native.B;        
}

// Export UActor::execDrawDebugCircle(FFrame&, void* const)
native final function DrawDebugCircle(Vector Base, Vector X, Vector Y, float Radius, int NumSides, byte R, byte G, byte B)
{
    //native.Base;
    //native.X;
    //native.Y;
    //native.Radius;
    //native.NumSides;
    //native.R;
    //native.G;
    //native.B;        
}

// Export UActor::execDrawDebugSphere(FFrame&, void* const)
native final function DrawDebugSphere(Vector Base, float Radius, int NumDivisions, byte R, byte G, byte B)
{
    //native.Base;
    //native.Radius;
    //native.NumDivisions;
    //native.R;
    //native.G;
    //native.B;        
}

// Export UActor::execClearStayingDebugLines(FFrame&, void* const)
native final function ClearStayingDebugLines();

// Export UActor::execDebugClock(FFrame&, void* const)
native final function DebugClock();

// Export UActor::execDebugUnclock(FFrame&, void* const)
native final function DebugUnclock();

// Export UActor::execFinishInterpolation(FFrame&, void* const)
native(301) final latent function FinishInterpolation();

// Export UActor::execSetPhysics(FFrame&, void* const)
native(3970) final function SetPhysics(Actor.EPhysics newPhysics)
{
    //native.newPhysics;        
}

// Export UActor::execOnlyAffectPawns(FFrame&, void* const)
native final function OnlyAffectPawns(bool B)
{
    //native.B;        
}

// Export UActor::execKGetSimParams(FFrame&, void* const)
native final function KGetSimParams(out KSimParams SimParams)
{
    //native.SimParams;        
}

// Export UActor::execKSetSimParams(FFrame&, void* const)
native final function KSetSimParams(KSimParams SimParams)
{
    //native.SimParams;        
}

// Export UActor::execKGetRBQuaternion(FFrame&, void* const)
native final function Quat KGetRBQuaternion();

// Export UActor::execKGetRigidBodyState(FFrame&, void* const)
native final function KGetRigidBodyState(out KRigidBodyState RBstate)
{
    //native.RBstate;        
}

// Export UActor::execKDrawRigidBodyState(FFrame&, void* const)
native final function KDrawRigidBodyState(KRigidBodyState RBstate, bool AltColour)
{
    //native.RBstate;
    //native.AltColour;        
}

// Export UActor::execKRBVecToVector(FFrame&, void* const)
native final function Vector KRBVecToVector(KRBVec RBvec)
{
    //native.RBvec;        
}

// Export UActor::execKRBVecFromVector(FFrame&, void* const)
native final function KRBVec KRBVecFromVector(Vector V)
{
    //native.V;        
}

// Export UActor::execKSetMass(FFrame&, void* const)
native final function KSetMass(float Mass)
{
    //native.Mass;        
}

// Export UActor::execKGetMass(FFrame&, void* const)
native final function float KGetMass();

// Export UActor::execKSetInertiaTensor(FFrame&, void* const)
native final function KSetInertiaTensor(Vector it1, Vector it2)
{
    //native.it1;
    //native.it2;        
}

// Export UActor::execKGetInertiaTensor(FFrame&, void* const)
native final function KGetInertiaTensor(out Vector it1, out Vector it2)
{
    //native.it1;
    //native.it2;        
}

// Export UActor::execKSetDampingProps(FFrame&, void* const)
native final function KSetDampingProps(float lindamp, float angdamp)
{
    //native.lindamp;
    //native.angdamp;        
}

// Export UActor::execKGetDampingProps(FFrame&, void* const)
native final function KGetDampingProps(out float lindamp, out float angdamp)
{
    //native.lindamp;
    //native.angdamp;        
}

// Export UActor::execKSetFriction(FFrame&, void* const)
native final function KSetFriction(float friction)
{
    //native.friction;        
}

// Export UActor::execKGetFriction(FFrame&, void* const)
native final function float KGetFriction();

// Export UActor::execKSetRestitution(FFrame&, void* const)
native final function KSetRestitution(float rest)
{
    //native.rest;        
}

// Export UActor::execKGetRestitution(FFrame&, void* const)
native final function float KGetRestitution();

// Export UActor::execKSetCOMOffset(FFrame&, void* const)
native final function KSetCOMOffset(Vector offset)
{
    //native.offset;        
}

// Export UActor::execKGetCOMOffset(FFrame&, void* const)
native final function KGetCOMOffset(out Vector offset)
{
    //native.offset;        
}

// Export UActor::execKGetCOMPosition(FFrame&, void* const)
native final function KGetCOMPosition(out Vector pos)
{
    //native.pos;        
}

// Export UActor::execKSetImpactThreshold(FFrame&, void* const)
native final function KSetImpactThreshold(float thresh)
{
    //native.thresh;        
}

// Export UActor::execKGetImpactThreshold(FFrame&, void* const)
native final function float KGetImpactThreshold();

// Export UActor::execKWake(FFrame&, void* const)
native final function KWake();

// Export UActor::execKIsAwake(FFrame&, void* const)
native final function bool KIsAwake();

// Export UActor::execKAddImpulse(FFrame&, void* const)
native final function KAddImpulse(Vector Impulse, Vector Position, optional name BoneName)
{
    //native.Impulse;
    //native.Position;
    //native.BoneName;        
}

// Export UActor::execKAddAngularImpulse(FFrame&, void* const)
native final function KAddAngularImpulse(Vector AngImpulse)
{
    //native.AngImpulse;        
}

// Export UActor::execKSetStayUpright(FFrame&, void* const)
native final function KSetStayUpright(bool stayUpright, bool allowRotate)
{
    //native.stayUpright;
    //native.allowRotate;        
}

// Export UActor::execKSetStayUprightParams(FFrame&, void* const)
native final function KSetStayUprightParams(float stiffness, float damping)
{
    //native.stiffness;
    //native.damping;        
}

// Export UActor::execKSetBlockKarma(FFrame&, void* const)
native final function KSetBlockKarma(bool newBlock)
{
    //native.newBlock;        
}

// Export UActor::execKSetActorGravScale(FFrame&, void* const)
native final function KSetActorGravScale(float ActorGravScale)
{
    //native.ActorGravScale;        
}

// Export UActor::execKGetActorGravScale(FFrame&, void* const)
native final function float KGetActorGravScale();

// Export UActor::execKDisableCollision(FFrame&, void* const)
native final function KDisableCollision(Actor Other)
{
    //native.Other;        
}

// Export UActor::execKEnableCollision(FFrame&, void* const)
native final function KEnableCollision(Actor Other)
{
    //native.Other;        
}

// Export UActor::execKSetSkelVel(FFrame&, void* const)
native final function KSetSkelVel(Vector Velocity, optional Vector AngVelocity, optional bool AddToCurrent)
{
    //native.Velocity;
    //native.AngVelocity;
    //native.AddToCurrent;        
}

// Export UActor::execKGetSkelMass(FFrame&, void* const)
native final function float KGetSkelMass();

// Export UActor::execKFreezeRagdoll(FFrame&, void* const)
native final function KFreezeRagdoll();

// Export UActor::execKScaleJointLimits(FFrame&, void* const)
native final function KScaleJointLimits(float Scale, float stiffness)
{
    //native.Scale;
    //native.stiffness;        
}

// Export UActor::execKAddBoneLifter(FFrame&, void* const)
native final function KAddBoneLifter(name BoneName, InterpCurve LiftVel, float LateralFriction, InterpCurve Softness)
{
    //native.BoneName;
    //native.LiftVel;
    //native.LateralFriction;
    //native.Softness;        
}

// Export UActor::execKRemoveLifterFromBone(FFrame&, void* const)
native final function KRemoveLifterFromBone(name BoneName)
{
    //native.BoneName;        
}

// Export UActor::execKRemoveAllBoneLifters(FFrame&, void* const)
native final function KRemoveAllBoneLifters();

// Export UActor::execKMakeRagdollAvailable(FFrame&, void* const)
native final function KMakeRagdollAvailable();

// Export UActor::execKIsRagdollAvailable(FFrame&, void* const)
native final function bool KIsRagdollAvailable();

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
    //return;    
}

event KVelDropBelow()
{
    //return;    
}

event KSkelConvulse()
{
    //return;    
}

event KApplyForce(out Vector Force, out Vector Torque)
{
    //return;    
}

event bool KUpdateState(out KRigidBodyState NewState)
{
    //return;    
}

// Export UActor::execClock(FFrame&, void* const)
native final function Clock(out float Time)
{
    //native.Time;        
}

// Export UActor::execUnClock(FFrame&, void* const)
native final function UnClock(out float Time)
{
    //native.Time;        
}

// Export UActor::execAllowMusicPlayback(FFrame&, void* const)
native final function AllowMusicPlayback(bool Allow)
{
    //native.Allow;        
}

// Export UActor::execPlayStream(FFrame&, void* const)
native final function int PlayStream(string Song, optional bool UseMusicVolume, optional float Volume, optional float FadeInTime, optional float SeekTime)
{
    //native.Song;
    //native.UseMusicVolume;
    //native.Volume;
    //native.FadeInTime;
    //native.SeekTime;        
}

// Export UActor::execStopStream(FFrame&, void* const)
native final function StopStream(int Handle, optional float FadeOutTime)
{
    //native.Handle;
    //native.FadeOutTime;        
}

// Export UActor::execSeekStream(FFrame&, void* const)
native final function int SeekStream(int Handle, float Seconds)
{
    //native.Handle;
    //native.Seconds;        
}

// Export UActor::execAdjustVolume(FFrame&, void* const)
native final function bool AdjustVolume(int Handle, float NewVolume)
{
    //native.Handle;
    //native.NewVolume;        
}

// Export UActor::execPauseStream(FFrame&, void* const)
native final function bool PauseStream(int Handle)
{
    //native.Handle;        
}

// Export UActor::execPlayMusic(FFrame&, void* const)
native final function int PlayMusic(string Song, optional float FadeInTime, optional float InitialSeekTime)
{
    //native.Song;
    //native.FadeInTime;
    //native.InitialSeekTime;        
}

// Export UActor::execIsPlayingMusic(FFrame&, void* const)
native final function bool IsPlayingMusic(int SongHandle)
{
    //native.SongHandle;        
}

// Export UActor::execStopMusic(FFrame&, void* const)
native final function StopMusic(int SongHandle, optional float FadeOutTime)
{
    //native.SongHandle;
    //native.FadeOutTime;        
}

// Export UActor::execStopAllMusic(FFrame&, void* const)
native final function StopAllMusic(optional float FadeOutTime)
{
    //native.FadeOutTime;        
}

// Export UActor::execStopAllMusicAndClearQueue(FFrame&, void* const)
native final function StopAllMusicAndClearQueue(optional float FadeOutTime)
{
    //native.FadeOutTime;        
}

// Export UActor::execGetMusicDuration(FFrame&, void* const)
native final function float GetMusicDuration(int SongHandle)
{
    //native.SongHandle;        
}

// Export UActor::execIsPenetrate(FFrame&, void* const)
native final function bool IsPenetrate();

event Destroyed()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(lp1 < DestroyListeners.Length)
    {
        DestroyListeners[lp1].NotifyDestroyed(self);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    DestroyListeners.Length = 0;
    //return;    
}

function RegisterDestroyListener(Object o)
{
    DestroyListeners[DestroyListeners.Length] = o;
    //return;    
}

simulated function CheckLifeSpanReplicated()
{
    // End:0x25
    if(LifeSpanReplicated != LifeSpanReplicatedClient)
    {
        LifeSpanReplicatedClient = LifeSpanReplicated;
        LifeSpan = LifeSpanReplicated;
    }
    //return;    
}

event GainedChild(Actor Other)
{
    //return;    
}

event LostChild(Actor Other)
{
    //return;    
}

event Tick(float DeltaTime)
{
    //return;    
}

event PostNetReceive()
{
    //return;    
}

event ClientTrigger()
{
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    //return;    
}

event UnTrigger(Actor Other, Pawn EventInstigator)
{
    //return;    
}

event BeginEvent()
{
    //return;    
}

event EndEvent()
{
    //return;    
}

simulated function TimerPop(VolumeTimer t)
{
    //return;    
}

event Timer()
{
    //return;    
}

event HitWall(Vector HitNormal, Actor HitWall, Material HitMaterial)
{
    //return;    
}

event Falling()
{
    //return;    
}

event Landed(Vector HitNormal)
{
    //return;    
}

event ZoneChange(ZoneInfo NewZone)
{
    //return;    
}

event PhysicsVolumeChange(PhysicsVolume NewVolume)
{
    //return;    
}

event Touch(Actor Other)
{
    //return;    
}

event PostTouch(Actor Other)
{
    //return;    
}

event UnTouch(Actor Other)
{
    //return;    
}

event Bump(Actor Other)
{
    //return;    
}

event BaseChange()
{
    //return;    
}

event Attach(Actor Other)
{
    //return;    
}

event Detach(Actor Other)
{
    //return;    
}

event Actor SpecialHandling(Pawn Other)
{
    //return;    
}

event bool EncroachingOn(Actor Other)
{
    //return;    
}

event EncroachedBy(Actor Other)
{
    //return;    
}

event RanInto(Actor Other)
{
    //return;    
}

event FinishedInterpolation()
{
    bInterpolating = false;
    //return;    
}

event EndedRotation()
{
    //return;    
}

event UsedBy(Pawn User)
{
    //return;    
}

simulated event FellOutOfWorld(Actor.eKillZType KillType)
{
    SetPhysics(0);
    Destroy();
    //return;    
}

event KilledBy(Pawn EventInstigator)
{
    //return;    
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    //return;    
}

function bool HealDamage(int Amount, Controller Healer, Class<DamageType> DamageType)
{
    //return;    
}

event TakeHeadRoundBullet(Vector HitLocation, int WeaponType)
{
    //return;    
}

// Export UActor::execGetNameFromStr(FFrame&, void* const)
native function bool GetNameFromStr(string strName, out name retName)
{
    //native.strName;
    //native.retName;        
}

// Export UActor::execTrace(FFrame&, void* const)
native(277) final function Actor Trace(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional Vector Extent, optional out Material Material, optional out Actor.CollisionPartsType CollPart)
{
    //native.HitLocation;
    //native.HitNormal;
    //native.TraceEnd;
    //native.TraceStart;
    //native.bTraceActors;
    //native.Extent;
    //native.Material;
    //native.CollPart;        
}

// Export UActor::execMultiTrace(FFrame&, void* const)
native final function MultiTrace(out BtrTraceResult BtrResult, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional bool bTraceMaterial, optional Vector Extent)
{
    //native.BtrResult;
    //native.TraceEnd;
    //native.TraceStart;
    //native.bTraceActors;
    //native.bTraceMaterial;
    //native.Extent;        
}

// Export UActor::execFastTrace(FFrame&, void* const)
native(548) final function bool FastTrace(Vector TraceEnd, optional Vector TraceStart)
{
    //native.TraceEnd;
    //native.TraceStart;        
}

// Export UActor::execTraceThisActor(FFrame&, void* const)
native final function bool TraceThisActor(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, Vector TraceStart, optional Vector Extent)
{
    //native.HitLocation;
    //native.HitNormal;
    //native.TraceEnd;
    //native.TraceStart;
    //native.Extent;        
}

// Export UActor::execTraceThisActorHitPart(FFrame&, void* const)
native final function bool TraceThisActorHitPart(out Vector HitLocation, out Vector HitNormal, out byte HitCollisionPart, Vector TraceEnd, Vector TraceStart, optional Vector Extent, optional bool bSkipHead)
{
    //native.HitLocation;
    //native.HitNormal;
    //native.HitCollisionPart;
    //native.TraceEnd;
    //native.TraceStart;
    //native.Extent;
    //native.bSkipHead;        
}

// Export UActor::execSpawn(FFrame&, void* const)
native(278) final function Actor Spawn(Class<Actor> SpawnClass, optional Actor SpawnOwner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation, optional bool bNoCollisionFail)
{
    //native.SpawnClass;
    //native.SpawnOwner;
    //native.SpawnTag;
    //native.SpawnLocation;
    //native.SpawnRotation;
    //native.bNoCollisionFail;        
}

// Export UActor::execDestroy(FFrame&, void* const)
native(279) final function bool Destroy();

event TornOff()
{
    //return;    
}

// Export UActor::execSetTimer(FFrame&, void* const)
native(280) final function SetTimer(float NewTimerRate, bool bLoop)
{
    //native.NewTimerRate;
    //native.bLoop;        
}

event PreSaveGame()
{
    //return;    
}

event PostLoadSavedGame()
{
    //return;    
}

// Export UActor::execFmodPlaySound(FFrame&, void* const)
native function int FmodPlaySound(string fileName, optional Actor.ESoundSlot Slot, optional float Pitch, optional bool bNoOverride, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    //native.fileName;
    //native.Slot;
    //native.Pitch;
    //native.bNoOverride;
    //native.Attenuate;
    //native.Loop;
    //native.SellectTeam;
    //native.bExceptOwner;        
}

// Export UActor::execFmodPlayOwnedSound(FFrame&, void* const)
native function int FmodPlayOwnedSound(string fileName, optional Actor.ESoundSlot Slot, optional float Pitch, optional bool bNoOverride, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    //native.fileName;
    //native.Slot;
    //native.Pitch;
    //native.bNoOverride;
    //native.Attenuate;
    //native.Loop;
    //native.SellectTeam;
    //native.bExceptOwner;        
}

// Export UActor::execFmodSpecPlaySound(FFrame&, void* const)
native function int FmodSpecPlaySound(string fileName, optional Actor.ESoundSlot Slot, optional float Pitch, optional bool bNoOverride, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    //native.fileName;
    //native.Slot;
    //native.Pitch;
    //native.bNoOverride;
    //native.Attenuate;
    //native.Loop;
    //native.SellectTeam;
    //native.bExceptOwner;        
}

// Export UActor::execFmodPlaySoundUseID(FFrame&, void* const)
native function int FmodPlaySoundUseID(string fileName, optional Actor.ESoundSlot Slot, optional float Pitch, optional bool bNoOverride, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    //native.fileName;
    //native.Slot;
    //native.Pitch;
    //native.bNoOverride;
    //native.Attenuate;
    //native.Loop;
    //native.SellectTeam;
    //native.bExceptOwner;        
}

function int FmodServerSpecPlaySound(string fileName, optional Actor.ESoundSlot Slot, optional float Pitch, optional bool bNoOverride, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    return FmodSpecPlaySound(fileName, Slot, Pitch, bNoOverride, Attenuate, Loop, SellectTeam, bExceptOwner);
    //return;    
}

// Export UActor::execFmodPlaySoundLocal(FFrame&, void* const)
native function int FmodPlaySoundLocal(string fileName, optional Actor.ESoundSlot Slot, optional float Pitch, optional bool bNoOverride, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner, optional Vector soundLocation)
{
    //native.fileName;
    //native.Slot;
    //native.Pitch;
    //native.bNoOverride;
    //native.Attenuate;
    //native.Loop;
    //native.SellectTeam;
    //native.bExceptOwner;
    //native.soundLocation;        
}

// Export UActor::execFmodDemoPlaySound(FFrame&, void* const)
native simulated event FmodDemoPlaySound(string SoundName, optional Actor.ESoundSlot Slot, optional float Pitch, optional bool bNoOverride, optional bool Attenuate)
{
    //native.SoundName;
    //native.Slot;
    //native.Pitch;
    //native.bNoOverride;
    //native.Attenuate;        
}

// Export UActor::execStopSound(FFrame&, void* const)
native final simulated function StopSound(Actor.ESoundSlot Slot, optional bool bNoOverride)
{
    //native.Slot;
    //native.bNoOverride;        
}

// Export UActor::execStopAllSound(FFrame&, void* const)
native final simulated function StopAllSound();

// Export UActor::execStopAllSoundByActor(FFrame&, void* const)
native final simulated function StopAllSoundByActor();

// Export UActor::execStopLoopSoundByActor(FFrame&, void* const)
native final simulated function StopLoopSoundByActor();

// Export UActor::execStopSoundUseID(FFrame&, void* const)
native final simulated function bool StopSoundUseID(int SoundID)
{
    //native.SoundID;        
}

// Export UActor::execIsSoundPlayingUseID(FFrame&, void* const)
native final simulated function bool IsSoundPlayingUseID(int SoundID)
{
    //native.SoundID;        
}

// Export UActor::execGetSoundDuration(FFrame&, void* const)
native final function float GetSoundDuration(string Sound)
{
    //native.Sound;        
}

// Export UActor::execPlayFeedbackEffect(FFrame&, void* const)
native(566) final function PlayFeedbackEffect(string EffectName)
{
    //native.EffectName;        
}

// Export UActor::execStopFeedbackEffect(FFrame&, void* const)
native(567) final function StopFeedbackEffect(optional string EffectName)
{
    //native.EffectName;        
}

// Export UActor::execChangeSpringFeedbackEffect(FFrame&, void* const)
native(568) final function ChangeSpringFeedbackEffect(string EffectName, float CenterX, float CenterY)
{
    //native.EffectName;
    //native.CenterX;
    //native.CenterY;        
}

// Export UActor::execChangeBaseParamsFeedbackEffect(FFrame&, void* const)
native(569) final function ChangeBaseParamsFeedbackEffect(string EffectName, optional float DirectionX, optional float DirectionY, optional float Gain)
{
    //native.EffectName;
    //native.DirectionX;
    //native.DirectionY;
    //native.Gain;        
}

// Export UActor::execForceFeedbackSupported(FFrame&, void* const)
native final function bool ForceFeedbackSupported(optional bool Enable)
{
    //native.Enable;        
}

// Export UActor::execMakeNoise(FFrame&, void* const)
native(512) final function MakeNoise(float Loudness)
{
    //native.Loudness;        
}

// Export UActor::execPlayerCanSeeMe(FFrame&, void* const)
native(532) final function bool PlayerCanSeeMe();

// Export UActor::execSuggestFallVelocity(FFrame&, void* const)
native final function Vector SuggestFallVelocity(Vector Destination, Vector Start, float MaxZ, float MaxXYSpeed)
{
    //native.Destination;
    //native.Start;
    //native.MaxZ;
    //native.MaxXYSpeed;        
}

event bool PreTeleport(Teleporter InTeleporter)
{
    //return;    
}

event PostTeleport(Teleporter OutTeleporter)
{
    //return;    
}

event BeginPlay()
{
    //return;    
}

// Export UActor::execResetStaticFilterState(FFrame&, void* const)
native final function ResetStaticFilterState();

// Export UActor::execAddToPackageMap(FFrame&, void* const)
native final function AddToPackageMap(optional string PackageName)
{
    //native.PackageName;        
}

// Export UActor::execGetMapName(FFrame&, void* const)
native(539) final function string GetMapName(string NameEnding, string MapName, int Dir)
{
    //native.NameEnding;
    //native.MapName;
    //native.Dir;        
}

// Export UActor::execGetNextSkin(FFrame&, void* const)
native(545) final function GetNextSkin(string Prefix, string CurrentSkin, int Dir, out string SkinName, out string SkinDesc)
{
    //native.Prefix;
    //native.CurrentSkin;
    //native.Dir;
    //native.SkinName;
    //native.SkinDesc;        
}

// Export UActor::execGetURLMap(FFrame&, void* const)
native(547) final function string GetURLMap(optional bool bIncludeOptions)
{
    //native.bIncludeOptions;        
}

// Export UActor::execGetNextInt(FFrame&, void* const)
native final function string GetNextInt(string ClassName, int Num)
{
    //native.ClassName;
    //native.Num;        
}

// Export UActor::execGetNextIntDesc(FFrame&, void* const)
native final function GetNextIntDesc(string ClassName, int Num, out string Entry, out string Description)
{
    //native.ClassName;
    //native.Num;
    //native.Entry;
    //native.Description;        
}

// Export UActor::execGetAllInt(FFrame&, void* const)
native static final function GetAllInt(string MetaClass, array<string> Entries)
{
    //native.MetaClass;
    //native.Entries;        
}

// Export UActor::execGetAllIntDesc(FFrame&, void* const)
native static final function GetAllIntDesc(string MetaClass, out array<string> Entry, out array<string> Description)
{
    //native.MetaClass;
    //native.Entry;
    //native.Description;        
}

// Export UActor::execGetCacheEntry(FFrame&, void* const)
native final function bool GetCacheEntry(int Num, out string Guid, out string fileName)
{
    //native.Num;
    //native.Guid;
    //native.fileName;        
}

// Export UActor::execMoveCacheEntry(FFrame&, void* const)
native final function bool MoveCacheEntry(string Guid, optional string NewFilename)
{
    //native.Guid;
    //native.NewFilename;        
}

// Export UActor::execAllActors(FFrame&, void* const)
native(304) final iterator function AllActors(Class<Actor> baseClass, out Actor Actor, optional name MatchTag)
{
    //native.baseClass;
    //native.Actor;
    //native.MatchTag;        
}

// Export UActor::execDynamicActors(FFrame&, void* const)
native(313) final iterator function DynamicActors(Class<Actor> baseClass, out Actor Actor, optional name MatchTag)
{
    //native.baseClass;
    //native.Actor;
    //native.MatchTag;        
}

// Export UActor::execChildActors(FFrame&, void* const)
native(305) final iterator function ChildActors(Class<Actor> baseClass, out Actor Actor)
{
    //native.baseClass;
    //native.Actor;        
}

// Export UActor::execBasedActors(FFrame&, void* const)
native(306) final iterator function BasedActors(Class<Actor> baseClass, out Actor Actor)
{
    //native.baseClass;
    //native.Actor;        
}

// Export UActor::execTouchingActors(FFrame&, void* const)
native(307) final iterator function TouchingActors(Class<Actor> baseClass, out Actor Actor)
{
    //native.baseClass;
    //native.Actor;        
}

// Export UActor::execTraceActors(FFrame&, void* const)
native(309) final iterator function TraceActors(Class<Actor> baseClass, out Actor Actor, out Vector HitLoc, out Vector HitNorm, Vector End, optional Vector Start, optional Vector Extent)
{
    //native.baseClass;
    //native.Actor;
    //native.HitLoc;
    //native.HitNorm;
    //native.End;
    //native.Start;
    //native.Extent;        
}

// Export UActor::execRadiusActors(FFrame&, void* const)
native(310) final iterator function RadiusActors(Class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc)
{
    //native.baseClass;
    //native.Actor;
    //native.Radius;
    //native.loc;        
}

// Export UActor::execVisibleActors(FFrame&, void* const)
native(311) final iterator function VisibleActors(Class<Actor> baseClass, out Actor Actor, optional float Radius, optional Vector loc)
{
    //native.baseClass;
    //native.Actor;
    //native.Radius;
    //native.loc;        
}

// Export UActor::execVisibleCollidingActors(FFrame&, void* const)
native(312) final iterator function VisibleCollidingActors(Class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc, optional bool bIgnoreHidden)
{
    //native.baseClass;
    //native.Actor;
    //native.Radius;
    //native.loc;
    //native.bIgnoreHidden;        
}

// Export UActor::execCollidingActors(FFrame&, void* const)
native(321) final iterator function CollidingActors(Class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc)
{
    //native.baseClass;
    //native.Actor;
    //native.Radius;
    //native.loc;        
}

// Export UActor::execIterateActorArray(FFrame&, void* const)
native final iterator function IterateActorArray(array<Actor> ActorArray, Class<Actor> baseClass, out Actor Actor, optional name MatchTag)
{
    //native.ActorArray;
    //native.baseClass;
    //native.Actor;
    //native.MatchTag;        
}

// Export UActor::execIterateObjectArray(FFrame&, void* const)
native final iterator function IterateObjectArray(array<Object> ObjectArray, Class baseClass, out Object Object)
{
    //native.ObjectArray;
    //native.baseClass;
    //native.Object;        
}

// Export UActor::execSubtract_ColorColor(FFrame&, void* const)
native(549) static final operator(20) Color -(Color A, Color B)
{
    //native.A;
    //native.B;        
}

// Export UActor::execMultiply_FloatColor(FFrame&, void* const)
native(550) static final operator(16) Color *(float A, Color B)
{
    //native.A;
    //native.B;        
}

// Export UActor::execAdd_ColorColor(FFrame&, void* const)
native(551) static final operator(20) Color +(Color A, Color B)
{
    //native.A;
    //native.B;        
}

// Export UActor::execMultiply_ColorFloat(FFrame&, void* const)
native(552) static final operator(16) Color *(Color A, float B)
{
    //native.A;
    //native.B;        
}

event RecoverFromBadStateCode()
{
    //return;    
}

function RenderOverlays(Canvas Canvas)
{
    //return;    
}

event RenderTexture(ScriptedTexture Tex)
{
    //return;    
}

event PreBeginPlay()
{
    // End:0x55
    if((!bGameRelevant && int(Level.NetMode) != int(NM_Client)) && !Level.Game.BaseMutator.CheckRelevance(self))
    {
        Destroy();        
    }
    else
    {
        // End:0x8B
        if((int(Level.DetailMode) == int(0)) && CullDistance == default.CullDistance)
        {
            CullDistance *= 0.8000000;
        }
    }
    //return;    
}

function ForceBegin()
{
    PreBeginPlay();
    BeginPlay();
    PostBeginPlay();
    PostNetBeginPlay();
    SetInitialState();
    MatchStarting();
    //return;    
}

event BroadcastLocalizedMessage(Class<LocalMessage> MessageClass, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    Level.Game.BroadcastLocalized(self, MessageClass, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

event PostBeginPlay()
{
    //return;    
}

simulated event SetInitialState()
{
    bScriptInitialized = true;
    // End:0x21
    if(InitialState != 'None')
    {
        GotoState(InitialState);        
    }
    else
    {
        GotoState('Auto');
    }
    //return;    
}

simulated event SetGRIInitialState()
{
    //return;    
}

event PostNetBeginPlay()
{
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    local int i;

    // End:0x58
    if(Skins.Length > 0)
    {
        i = 0;
        J0x13:

        // End:0x58 [Loop If]
        if(i < Skins.Length)
        {
            // End:0x4E
            if(Skins[i] != none)
            {
                Level.AddPrecacheMaterial(Skins[i]);
            }
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    // End:0x3E
    if(((int(DrawType) == int(8)) && !bStatic) && !bNoDelete)
    {
        Level.AddPrecacheStaticMesh(StaticMesh);
    }
    //return;    
}

simulated function UpdatePrecacheSkeletalMeshes()
{
    // End:0x3E
    if(((int(DrawType) == int(2)) && !bStatic) && !bNoDelete)
    {
        Level.AddPrecacheSkeletalMesh(Mesh);
    }
    //return;    
}

simulated function UpdateAnnouncements()
{
    //return;    
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    //return;    
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float damageScale, dist;
    local Vector Dir;

    // End:0x0B
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x1C6
    foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
    {
        // End:0x1C5
        if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
            Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
            // End:0x1C5
            if(((Instigator != none) && Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
            {
                Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, DamageType, Momentum, HitLocation);
            }
        }        
    }    
    bHurtEntry = false;
    //return;    
}

function bool CheckForErrors()
{
    // End:0x1E
    if(bObsolete)
    {
        Log(string(self) $ " is Obsolete");
    }
    return bObsolete;
    //return;    
}

event TravelPreAccept()
{
    //return;    
}

event TravelPostAccept()
{
    //return;    
}

function BecomeViewTarget()
{
    //return;    
}

function POVChanged(PlayerController PC, bool bBehindViewChanged)
{
    //return;    
}

simulated function string GetHumanReadableName()
{
    return GetItemName(string(Class));
    //return;    
}

function SetDisplayProperties(Actor.ERenderStyle NewStyle, Material NewTexture, bool bLighting)
{
    Style = NewStyle;
    Texture = NewTexture;
    bUnlit = bLighting;
    //return;    
}

function SetDefaultDisplayProperties()
{
    Style = default.Style;
    Texture = default.Texture;
    bUnlit = default.bUnlit;
    //return;    
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return "";
    //return;    
}

function MatchStarting()
{
    //return;    
}

function SetGRI(GameReplicationInfo GRI)
{
    //return;    
}

function string GetDebugName()
{
    return GetItemName(string(self));
    //return;    
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
    Canvas.SetPos(4.0000000, YPos);
    Canvas.SetDrawColor(byte(255), 0, 0);
    t = GetDebugName();
    // End:0xAF
    if(bDeleteMe)
    {
        t = t $ " DELETED (bDeleteMe == true)";
    }
    Canvas.DrawText(t, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x2FB
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        t = "ROLE ";
        switch(Role)
        {
            // End:0x149
            case ROLE_None:
                t = t $ "None";
                // End:0x1D7
                break;
            // End:0x169
            case 1:
                t = t $ "DumbProxy";
                // End:0x1D7
                break;
            // End:0x18E
            case 2:
                t = t $ "SimulatedProxy";
                // End:0x1D7
                break;
            // End:0x1B4
            case 3:
                t = t $ "AutonomousProxy";
                // End:0x1D7
                break;
            // End:0x1D4
            case 4:
                t = t $ "Authority";
                // End:0x1D7
                break;
            // End:0xFFFF
            default:
                break;
        }
        t = t $ " REMOTE ROLE ";
        switch(RemoteRole)
        {
            // End:0x215
            case ROLE_None:
                t = t $ "None";
                // End:0x2A3
                break;
            // End:0x235
            case 1:
                t = t $ "DumbProxy";
                // End:0x2A3
                break;
            // End:0x25A
            case 2:
                t = t $ "SimulatedProxy";
                // End:0x2A3
                break;
            // End:0x280
            case 3:
                t = t $ "AutonomousProxy";
                // End:0x2A3
                break;
            // End:0x2A0
            case 4:
                t = t $ "Authority";
                // End:0x2A3
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x2C4
        if(bTearOff)
        {
            t = t $ " Tear Off";
        }
        Canvas.DrawText(t, false);
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
    }
    t = "Physics ";
    switch(Physics)
    {
        // End:0x32D
        case 0:
            t = t $ "None";
            // End:0x4A2
            break;
        // End:0x34B
        case 1:
            t = t $ "Walking";
            // End:0x4A2
            break;
        // End:0x369
        case 2:
            t = t $ "Falling";
            // End:0x4A2
            break;
        // End:0x388
        case 3:
            t = t $ "Swimming";
            // End:0x4A2
            break;
        // End:0x3A5
        case 4:
            t = t $ "Flying";
            // End:0x4A2
            break;
        // End:0x3C4
        case 5:
            t = t $ "Rotating";
            // End:0x4A2
            break;
        // End:0x3E5
        case 6:
            t = t $ "Projectile";
            // End:0x4A2
            break;
        // End:0x409
        case 7:
            t = t $ "Interpolating";
            // End:0x4A2
            break;
        // End:0x42B
        case 8:
            t = t $ "MovingBrush";
            // End:0x4A2
            break;
        // End:0x448
        case 9:
            t = t $ "Spider";
            // End:0x4A2
            break;
        // End:0x466
        case 10:
            t = t $ "Trailer";
            // End:0x4A2
            break;
        // End:0x483
        case 11:
            t = t $ "Ladder";
            // End:0x4A2
            break;
        // End:0x49F
        case 13:
            t = t $ "Karma";
            // End:0x4A2
            break;
        // End:0xFFFF
        default:
            break;
    }
    t = (((t $ " in physicsvolume ") $ (GetItemName(string(PhysicsVolume)))) $ " on base ") $ (GetItemName(string(Base)));
    // End:0x514
    if(bBounce)
    {
        t = t $ " - will bounce";
    }
    Canvas.DrawText(t, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("PrePivot: " $ string(PrePivot), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("Location: " $ string(Location)) $ " Rotation ") $ string(Rotation), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("Velocity: " $ string(Velocity)) $ " Speed ") $ string(VSize(Velocity))) $ " Speed2D ") $ string(VSize(Velocity - (Velocity.Z * vect(0.0000000, 0.0000000, 1.0000000)))), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("Acceleration: " $ string(Acceleration), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawColor.B = 0;
    Canvas.DrawText((("Collision Radius " $ string(CollisionRadius)) $ " Height ") $ string(CollisionHeight));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("Collides with Actors " $ string(bCollideActors)) $ ", world ") $ string(bCollideWorld)) $ ", proj. target ") $ string(bProjTarget));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("Blocks Actors " $ string(bBlockActors));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    t = "Touching ";
    // End:0x854
    foreach TouchingActors(Class'Engine.Actor', A)
    {
        t = (t $ (GetItemName(string(A)))) $ " ";        
    }    
    // End:0x882
    if(t == "Touching ")
    {
        t = "Touching nothing";
    }
    Canvas.DrawText(t, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawColor.R = 0;
    t = "Rendered: ";
    switch(Style)
    {
        // End:0x8FB
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
        // End:0xFFFF
        default:
            break;
    }
    switch(DrawType)
    {
        // End:0x9B9
        case 0:
            t = t $ " None";
            // End:0xACC
            break;
        // End:0x9D8
        case 1:
            t = t $ " Sprite ";
            // End:0xACC
            break;
        // End:0x9F5
        case 2:
            t = t $ " Mesh ";
            // End:0xACC
            break;
        // End:0xA13
        case 3:
            t = t $ " Brush ";
            // End:0xACC
            break;
        // End:0xA36
        case 4:
            t = t $ " RopeSprite ";
            // End:0xACC
            break;
        // End:0xA5D
        case 5:
            t = t $ " VerticalSprite ";
            // End:0xACC
            break;
        // End:0xA7F
        case 6:
            t = t $ " Terraform ";
            // End:0xACC
            break;
        // End:0xAA6
        case 7:
            t = t $ " SpriteAnimOnce ";
            // End:0xACC
            break;
        // End:0xAC9
        case 8:
            t = t $ " StaticMesh ";
            // End:0xACC
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xC32
    if(int(DrawType) == int(2))
    {
        t = t $ (GetItemName(string(Mesh)));
        // End:0xB77
        if(Skins.Length > 0)
        {
            t = t $ " skins: ";
            i = 0;
            J0xB20:

            // End:0xB77 [Loop If]
            if(i < Skins.Length)
            {
                // End:0xB47
                if(Skins[i] == none)
                {
                    // [Explicit Break]
                    goto J0xB77;
                    // [Explicit Continue]
                    goto J0xB6D;
                }
                t = (t $ (GetItemName(string(Skins[i])))) $ ", ";
                J0xB6D:

                i++;
                // [Loop Continue]
                goto J0xB20;
            }
        }
        J0xB77:

        Canvas.DrawText(t, false);
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        GetAnimParams(0, Anim, frame, Rate);
        t = (((("AnimSequence " $ string(Anim)) $ " Frame ") $ string(frame)) $ " Rate ") $ string(Rate);
        // End:0xC2F
        if(bAnimByOwner)
        {
            t = t $ " Anim by Owner";
        }        
    }
    else
    {
        // End:0xC6B
        if((int(DrawType) == int(1)) || int(DrawType) == int(7))
        {
            t = t $ string(Texture);            
        }
        else
        {
            // End:0xC8F
            if(int(DrawType) == int(3))
            {
                t = t $ string(Brush);
            }
        }
    }
    Canvas.DrawText(t, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawColor.B = byte(255);
    Canvas.DrawText((((("Tag: " $ string(Tag)) $ " Event: ") $ string(Event)) $ " STATE: ") $ string(GetStateName()), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("Instigator " $ (GetItemName(string(Instigator)))) $ " Owner ") $ (GetItemName(string(Owner))));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((((("Timer: " $ string(TimerCounter)) $ " LifeSpan ") $ string(LifeSpan)) $ " AmbientSound ") $ string(AmbientSound)) $ " volume ") $ string(SoundVolume));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

final simulated function bool NearSpot(Vector Spot)
{
    local Vector Dir;

    Dir = Location - Spot;
    // End:0x2A
    if(Abs(Dir.Z) > CollisionHeight)
    {
        return false;
    }
    Dir.Z = 0.0000000;
    return VSize(Dir) <= CollisionRadius;
    //return;    
}

final simulated function bool TouchingActor(Actor A)
{
    local Vector Dir;

    Dir = Location - A.Location;
    // End:0x43
    if(Abs(Dir.Z) > (CollisionHeight + A.CollisionHeight))
    {
        return false;
    }
    Dir.Z = 0.0000000;
    return VSize(Dir) <= (CollisionRadius + A.CollisionRadius);
    //return;    
}

simulated function StartInterpolation()
{
    GotoState('None');
    SetCollision(true, false);
    bCollideWorld = false;
    bInterpolating = true;
    SetPhysics(0);
    //return;    
}

function Reset()
{
    //return;    
}

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
    foreach DynamicActors(Class'Engine.Actor', A, EventName)
    {
        A.Trigger(Other, EventInstigator);        
    }    
    N = Level.NavigationPointList;
    J0x55:

    // End:0xBC [Loop If]
    if(N != none)
    {
        // End:0xA5
        if(N.bStatic && N.Tag == EventName)
        {
            N.Trigger(Other, EventInstigator);
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x55;
    }
    //return;    
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
    foreach DynamicActors(Class'Engine.Actor', A, EventName)
    {
        A.UnTrigger(Other, EventInstigator);        
    }    
    N = Level.NavigationPointList;
    J0x55:

    // End:0xBC [Loop If]
    if(N != none)
    {
        // End:0xA5
        if(N.bStatic && N.Tag == EventName)
        {
            N.UnTrigger(Other, EventInstigator);
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x55;
    }
    //return;    
}

function bool IsInVolume(Volume aVolume)
{
    local Volume V;

    // End:0x23
    foreach TouchingActors(Class'Engine.Volume', V)
    {
        // End:0x22
        if(V == aVolume)
        {            
            return true;
        }        
    }    
    return false;
    //return;    
}

function bool IsInPain()
{
    local PhysicsVolume V;

    // End:0x3E
    foreach TouchingActors(Class'Engine.PhysicsVolume', V)
    {
        // End:0x3D
        if(V.bPainCausing && V.DamagePerSec > float(0))
        {            
            return true;
        }        
    }    
    return false;
    //return;    
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
    //return;    
}

simulated function bool CanSplash()
{
    return false;
    //return;    
}

function Vector GetCollisionExtent()
{
    local Vector Extent;

    Extent = CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
    Extent.Z = CollisionHeight;
    return Extent;
    //return;    
}

static function Crash()
{
    assert(false);
    //return;    
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
    // End:0x90
    if(((OverlayMaterial == none) || OverlayMaterial == mat) || bOverride)
    {
        OverlayMaterial = mat;
        // End:0x56
        if(OverlayTimer == Time)
        {
            OverlayTimer = Time + 0.0010000;            
        }
        else
        {
            OverlayTimer = Time;
        }
        ClientOverlayTimer = OverlayTimer;
        ClientOverlayCounter = OverlayTimer;
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
    //return;    
}

simulated function bool CheckMaxEffectDistance(PlayerController P, Vector SpawnLocation)
{
    return !P.BeyondViewDistance(SpawnLocation, 0.0000000);
    //return;    
}

simulated function bool EffectIsRelevant(Vector SpawnLocation, bool bForceDedicated)
{
    local PlayerController P;
    local bool bResult;

    // End:0x20
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return bForceDedicated;
    }
    // End:0x44
    if(int(Level.NetMode) != int(NM_Client))
    {
        bResult = true;        
    }
    else
    {
        // End:0x68
        if((Instigator != none) && Instigator.IsHumanControlled())
        {
            return true;            
        }
        else
        {
            // End:0x9C
            if(SpawnLocation == Location)
            {
                bResult = (Level.TimeSeconds - LastRenderTime) < float(3);                
            }
            else
            {
                // End:0xD8
                if((Instigator != none) && (Level.TimeSeconds - Instigator.LastRenderTime) < float(3))
                {
                    bResult = true;
                }
            }
        }
    }
    // End:0x1D8
    if(bResult)
    {
        P = Level.GetLocalPlayerController();
        // End:0x122
        if((P == none) || P.ViewTarget == none)
        {
            bResult = false;            
        }
        else
        {
            // End:0x154
            if(P.Pawn == Instigator)
            {
                bResult = CheckMaxEffectDistance(P, SpawnLocation);                
            }
            else
            {
                // End:0x1C1
                if((Vector(P.Rotation) Dot (SpawnLocation - P.ViewTarget.Location)) < 0.0000000)
                {
                    bResult = VSize(P.ViewTarget.Location - SpawnLocation) < float(1600);                    
                }
                else
                {
                    bResult = CheckMaxEffectDistance(P, SpawnLocation);
                }
            }
        }
    }
    return bResult;
    //return;    
}

function bool SelfTriggered()
{
    return false;
    //return;    
}

function bool TeamLink(int TeamNum)
{
    return false;
    //return;    
}

function SetDelayedDamageInstigatorController(Controller C)
{
    //return;    
}

function NotifyLocalPlayerDead(PlayerController PC)
{
    //return;    
}

function NotifyLocalPlayerTeamReceived()
{
    //return;    
}

event alllog(coerce string Msg)
{
    ctlog(Msg);
    clog(Msg);
    Log(Msg);
    //return;    
}

event ctlog(coerce string Msg)
{
    // End:0x62
    if(Level.GetLocalPlayerController().myHUD != none)
    {
        Level.GetLocalPlayerController().myHUD.AddTextMessage(Msg, Class'Engine.GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
    }
    //return;    
}

simulated event clog(coerce string Msg)
{
    // End:0x4A
    if(Level.GetLocalPlayerController() != none)
    {
        Level.GetLocalPlayerController().Player.Console.Message(Msg, 1.0000000);
    }
    //return;    
}

function crlog(coerce string Msg)
{
    Log(Msg);
    __NFUN_270__(Msg);
    //return;    
}

event dblog(coerce string Msg)
{
    clog(Msg);
    Log(Msg);
    //return;    
}

event rpclog(coerce string rpc)
{
    // End:0x107
    if((((((((rpc == "ServerMove") || rpc == "ShortServerMove") || rpc == "DualServerMove") || rpc == "ShortClientAdjustPosition") || rpc == "ServerUpdatePing") || rpc == "ServerSetwShakeRotation") || rpc == "ServerSetwShockRotation") || rpc == "ServerSetwBreathRotation")
    {        
    }
    else
    {
        dblog("RPC - " $ rpc);
    }
    //return;    
}

function InitBot(int Grade)
{
    //return;    
}

function bool IsStationary()
{
    return true;
    //return;    
}

function float GetDotH(Vector V)
{
    local float Dot;
    local Vector X, Y, Z, Dir;

    GetAxes(Rotation, X, Y, Z);
    X.Z = 0.0000000;
    Dir = V - Location;
    Dir.Z = 0.0000000;
    Dot = Normal(Dir) Dot Normal(X);
    return Dot;
    //return;    
}

function float GetAngleH(Vector V)
{
    return Acos(GetDotH(V));
    //return;    
}

function RecoverFromHostChange()
{
    //return;    
}

function PawnBaseDied()
{
    //return;    
}

function bool BlocksShotAt(Actor Other)
{
    return false;
    //return;    
}

event SunLightDirectionUpdate(Vector direction)
{
    //return;    
}

function OnBeginRound()
{
    //return;    
}

function OnEndRound()
{
    //return;    
}

defaultproperties
{
    LightBrightnessScale=1.0000000
    PawnLightBrightnessScale=1.0000000
    DrawType=1
    fLightScale=1.0000000
    bLightingVisibility=true
    bAcceptsProjectors=true
    bReplicateMovement=true
    bDeferRendering=true
    RemoteRole=1
    Role=4
    NetUpdateFrequency=100.0000000
    NetPriority=1.0000000
    LODBias=1.0000000
    bUseRelativeBaseRotation=true
    Texture=Texture'Engine.S_Actor'
    DrawScale=1.0000000
    DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    bSyncCollsionSizeHK=true
    MaxLights=4
    UV2TextureSize=128
    ScaleGlow=1.0000000
    CurrentLODLevel=-1
    Style=1
    bMovable=true
    FluidSurfaceShootStrengthMod=1.0000000
    SoundVolume=128
    SoundPitch=64
    SoundRadius=64.0000000
    TransientSoundVolume=0.3000000
    TransientSoundRadius=105.0000000
    CollisionRadius=22.0000000
    CollisionHeight=22.0000000
    bBlockZeroExtentTraces=true
    bBlockNonZeroExtentTraces=true
    bSmoothKarmaStateUpdates=true
    bJustTeleported=true
    Mass=100.0000000
    DesiredRotationCheck_Yaw=true
    DesiredRotationThreshold_Yaw=2000.0000000
    DesiredRotationThreshold_Pitch=2000.0000000
    DesiredRotationThreshold_Roll=2000.0000000
    ForceNoise=0.5000000
    MessageClass=Class'Engine.LocalMessage'
}