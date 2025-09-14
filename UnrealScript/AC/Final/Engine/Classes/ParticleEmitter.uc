class ParticleEmitter extends Object
    abstract
    native
    editinlinenew;

enum EBlendMode
{
    BM_MODULATE,                    // 0
    BM_MODULATE2X,                  // 1
    BM_MODULATE4X,                  // 2
    BM_ADD,                         // 3
    BM_ADDSIGNED,                   // 4
    BM_ADDSIGNED2X,                 // 5
    BM_SUBTRACT,                    // 6
    BM_ADDSMOOTH,                   // 7
    BM_BLENDDIFFUSEALPHA,           // 8
    BM_BLENDTEXTUREALPHA,           // 9
    BM_BLENDFACTORALPHA,            // 10
    BM_BLENDTEXTUREALPHAPM,         // 11
    BM_BLENDCURRENTALPHA,           // 12
    BM_PREMODULATE,                 // 13
    BM_MODULATEALPHA_ADDCOLOR,      // 14
    BM_MODULATEINVALPHA_ADDCOLOR,   // 15
    BM_MODULATEINVCOLOR_ADDALPHA,   // 16
    BM_HACK                         // 17
};

enum EParticleDrawStyle
{
    PTDS_Regular,                   // 0
    PTDS_AlphaBlend,                // 1
    PTDS_Modulated,                 // 2
    PTDS_Translucent,               // 3
    PTDS_AlphaModulate_MightNotFogCorrectly,// 4
    PTDS_Darken,                    // 5
    PTDS_Brighten                   // 6
};

enum EParticleCoordinateSystem
{
    PTCS_Independent,               // 0
    PTCS_Relative,                  // 1
    PTCS_Absolute                   // 2
};

enum EParticleRotationSource
{
    PTRS_None,                      // 0
    PTRS_Actor,                     // 1
    PTRS_Offset,                    // 2
    PTRS_Normal                     // 3
};

enum EParticleVelocityDirection
{
    PTVD_None,                      // 0
    PTVD_StartPositionAndOwner,     // 1
    PTVD_OwnerAndStartPosition,     // 2
    PTVD_AddRadial                  // 3
};

enum EParticleStartLocationShape
{
    PTLS_Box,                       // 0
    PTLS_Sphere,                    // 1
    PTLS_Polar,                     // 2
    PTLS_All                        // 3
};

enum EParticleEffectAxis
{
    PTEA_NegativeX,                 // 0
    PTEA_PositiveZ                  // 1
};

enum EParticleCollisionSound
{
    PTSC_None,                      // 0
    PTSC_LinearGlobal,              // 1
    PTSC_LinearLocal,               // 2
    PTSC_Random                     // 3
};

enum EParticleMeshSpawning
{
    PTMS_None,                      // 0
    PTMS_Linear,                    // 1
    PTMS_Random                     // 2
};

enum ESkelLocationUpdate
{
    PTSU_None,                      // 0
    PTSU_SpawnOffset,               // 1
    PTSU_Location                   // 2
};

struct ParticleTimeScale
{
    var() float RelativeTime;
    var() float RelativeSize;
};

struct ParticleRevolutionScale
{
    var() float RelativeTime;
    var() Vector RelativeRevolution;
};

struct ParticleColorScale
{
    var() float RelativeTime;
    var() Color Color;
};

struct ParticleVelocityScale
{
    var() float RelativeTime;
    var() Vector RelativeVelocity;
};

struct Particle
{
    var Vector Location;
    var Vector OldLocation;
    var Vector Velocity;
    var Vector StartSize;
    var Vector SpinsPerSecond;
    var Vector StartSpin;
    var Vector RevolutionCenter;
    var Vector RevolutionsPerSecond;
    var Vector RevolutionsMultiplier;
    var Vector Size;
    var Vector StartLocation;
    var Vector ColorMultiplier;
    var Vector VelocityMultiplier;
    var Vector OldMeshLocation;
    var Color Color;
    var float Time;
    var float MaxLifetime;
    var float Mass;
    var int HitCount;
    var int Flags;
    var int Subdivision;
    var int BoneIndex;
};

struct ParticleSound
{
    var() Sound Sound;
    var() Range Radius;
    var() Range Pitch;
    var() int Weight;
    var() Range Volume;
    var() Range Probability;
};

var(Collision) bool UseCollision;
var(Collision) bool UseCollisionPlanes;
var(Collision) bool UseMaxCollisions;
var(Collision) bool UseSpawnedVelocityScale;
var(Color) bool UseColorScale;
var(Fading) bool FadeOut;
var(Fading) bool FadeIn;
var(Force) bool UseActorForces;
var(General) bool ResetAfterChange;
var(Local) bool RespawnDeadParticles;
var(Local) bool AutoDestroy;
var(Local) bool AutoReset;
var(Local) bool Disabled;
var bool Backup_Disabled;
var(Local) bool DisableFogging;
var(MeshSpawning) bool VelocityFromMesh;
var(MeshSpawning) bool UniformMeshScale;
var(MeshSpawning) bool UniformVelocityScale;
var(MeshSpawning) bool UseColorFromMesh;
var(MeshSpawning) bool SpawnOnlyInDirectionOfNormal;
var(Rendering) bool AlphaTest;
var(Rendering) bool AcceptsProjectors;
var(Rendering) bool ZTest;
var(Rendering) bool ZWrite;
var(Revolution) bool UseRevolution;
var(Revolution) bool UseRevolutionScale;
var(Rotation) bool SpinParticles;
var(Rotation) bool DampRotation;
var(Size) bool UseSizeScale;
var(Size) bool UseAbsoluteTimeForSizeScale;
var(Size) bool UseRegularSizeScale;
var(Size) bool UniformSize;
var(Size) bool DetermineVelocityByLocationDifference;
var(Size) bool ScaleSizeXByVelocity;
var(Size) bool ScaleSizeYByVelocity;
var(Size) bool ScaleSizeZByVelocity;
var(Spawning) bool AutomaticInitialSpawning;
var(Texture) bool BlendBetweenSubdivisions;
var(Texture) bool UseSubdivisionScale;
var(Texture) bool UseRandomSubdivision;
var(Trigger) bool TriggerDisabled;
var(Trigger) bool ResetOnTrigger;
var(Velocity) bool UseVelocityScale;
var(Velocity) bool AddVelocityFromOwner;
var(Performance) float LowDetailFactor;
var(Acceleration) Vector Acceleration;
var(Collision) Vector ExtentMultiplier;
var(Collision) RangeVector DampingFactorRange;
var(Collision) array<Plane> CollisionPlanes;
var(Collision) Range MaxCollisions;
var(Collision) int SpawnFromOtherEmitter;
var(Collision) int SpawnAmount;
var(Collision) RangeVector SpawnedVelocityScaleRange;
var(Color) array<ParticleColorScale> ColorScale;
var(Color) float ColorScaleRepeats;
var(Color) RangeVector ColorMultiplierRange;
var(Color) float Opacity;
var(Fading) Plane FadeOutFactor;
var(Fading) float FadeOutStartTime;
var(Fading) Plane FadeInFactor;
var(Fading) float FadeInEndTime;
var(General) ParticleEmitter.EParticleCoordinateSystem CoordinateSystem;
var(General) const int MaxParticles;
var(General) ParticleEmitter.EParticleEffectAxis EffectAxis;
var(Local) Range AutoResetTimeRange;
var(Local) string Name;
var(Local) Object.EDetailMode DetailMode;
var(Location) Vector StartLocationOffset;
var(Location) RangeVector StartLocationRange;
var(Location) int AddLocationFromOtherEmitter;
var(Location) ParticleEmitter.EParticleStartLocationShape StartLocationShape;
var(Location) Range SphereRadiusRange;
var(Location) RangeVector StartLocationPolarRange;
var(Mass) Range StartMassRange;
var(MeshSpawning) StaticMesh MeshSpawningStaticMesh;
var(MeshSpawning) ParticleEmitter.EParticleMeshSpawning MeshSpawning;
var(MeshSpawning) RangeVector VelocityScaleRange;
var(MeshSpawning) RangeVector MeshScaleRange;
var(MeshSpawning) Vector MeshNormal;
var(MeshSpawning) Range MeshNormalThresholdRange;
var(Rendering) int AlphaRef;
var(Revolution) RangeVector RevolutionCenterOffsetRange;
var(Revolution) RangeVector RevolutionsPerSecondRange;
var(Revolution) array<ParticleRevolutionScale> RevolutionScale;
var(Revolution) float RevolutionScaleRepeats;
var(Rotation) ParticleEmitter.EParticleRotationSource UseRotationFrom;
var(Rotation) Rotator RotationOffset;
var(Rotation) Vector SpinCCWorCW;
var(Rotation) RangeVector SpinsPerSecondRange;
var(Rotation) RangeVector StartSpinRange;
var(Rotation) RangeVector RotationDampingFactorRange;
var(Rotation) Vector RotationNormal;
var(Size) array<ParticleTimeScale> SizeScale;
var(Size) float SizeScaleRepeats;
var(Size) RangeVector StartSizeRange;
var(Size) Vector ScaleSizeByVelocityMultiplier;
var(Size) float ScaleSizeByVelocityMax;
var(SkeletalMesh) ParticleEmitter.ESkelLocationUpdate UseSkeletalLocationAs;
var(SkeletalMesh) Actor SkeletalMeshActor;
var(SkeletalMesh) Vector SkeletalScale;
var(SkeletalMesh) Range RelativeBoneIndexRange;
var(Sound) array<ParticleSound> Sounds;
var(Sound) ParticleEmitter.EParticleCollisionSound SpawningSound;
var(Sound) Range SpawningSoundIndex;
var(Sound) Range SpawningSoundProbability;
var(Sound) ParticleEmitter.EParticleCollisionSound CollisionSound;
var(Sound) Range CollisionSoundIndex;
var(Sound) Range CollisionSoundProbability;
var(Spawning) float ParticlesPerSecond;
var(Spawning) float InitialParticlesPerSecond;
var(Texture) ParticleEmitter.EParticleDrawStyle DrawStyle;
var(Texture) Texture Texture;
var(Texture) int TextureUSubdivisions;
var(Texture) int TextureVSubdivisions;
var(Texture) array<float> SubdivisionScale;
var(Texture) int SubdivisionStart;
var(Texture) int SubdivisionEnd;
var(Tick) float SecondsBeforeInactive;
var(Tick) float MinSquaredVelocity;
var(Time) Range InitialTimeRange;
var(Time) Range LifetimeRange;
var(Time) Range InitialDelayRange;
var(Trigger) Range SpawnOnTriggerRange;
var(Trigger) float SpawnOnTriggerPPS;
var(Velocity) RangeVector StartVelocityRange;
var(Velocity) Range StartVelocityRadialRange;
var(Velocity) Vector MaxAbsVelocity;
var(Velocity) RangeVector VelocityLossRange;
var(Velocity) bool RotateVelocityLossRange;
var(Velocity) int AddVelocityFromOtherEmitter;
var(Velocity) RangeVector AddVelocityMultiplierRange;
var(Velocity) ParticleEmitter.EParticleVelocityDirection GetVelocityDirectionFrom;
var(Velocity) array<ParticleVelocityScale> VelocityScale;
var(Velocity) float VelocityScaleRepeats;
var(Warmup) float WarmupTicksPerSecond;
var(Warmup) float RelativeWarmupTime;
var(Culling) float CullDistance;
var(Culling) bool DisableIfCulled;
var(Culling) bool ForceCullDistanceOnUseCollision;
var transient Emitter Owner;
var transient bool Initialized;
var transient bool Inactive;
var transient bool RealDisableFogging;
var transient bool AllParticlesDead;
var transient bool WarmedUp;
var transient float InactiveTime;
var transient array<Particle> Particles;
var transient int ParticleIndex;
var transient int ActiveParticles;
var transient float PPSFraction;
var transient Box BoundingBox;
var transient Vector RealExtentMultiplier;
var transient int OtherIndex;
var transient float InitialDelay;
var transient Vector GlobalOffset;
var transient float TimeTillReset;
var transient int PS2Data;
var transient int MaxActiveParticles;
var transient int CurrentCollisionSoundIndex;
var transient int CurrentSpawningSoundIndex;
var transient int CurrentMeshSpawningIndex;
var transient float MaxSizeScale;
var transient int KillPending;
var transient int DeferredParticles;
var transient Vector RealMeshNormal;
var transient array<Vector> MeshVertsAndNormals;
var transient int CurrentSpawnOnTrigger;
var transient int RenderableParticles;
var transient RangeVector RealVelocityLossRange;

// Export UParticleEmitter::execSpawnParticle(FFrame&, void* const)
native function SpawnParticle(int Amount)
{
    //native.Amount;        
}

// Export UParticleEmitter::execTrigger(FFrame&, void* const)
native function Trigger();

// Export UParticleEmitter::execReset(FFrame&, void* const)
native function Reset();

defaultproperties
{
    RespawnDeadParticles=true
    UniformMeshScale=true
    UniformVelocityScale=true
    AlphaTest=true
    ZTest=true
    UseRegularSizeScale=true
    AutomaticInitialSpawning=true
    TriggerDisabled=true
    LowDetailFactor=0.6500000
    ExtentMultiplier=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    DampingFactorRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
    SpawnFromOtherEmitter=-1
    ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
    Opacity=1.0000000
    FadeOutFactor=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
    FadeInFactor=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
    MaxParticles=10
    AddLocationFromOtherEmitter=-1
    StartMassRange=(Min=1.0000000,Max=1.0000000)
    VelocityScaleRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
    MeshScaleRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
    MeshNormal=(X=0.0000000,Y=0.0000000,Z=1.0000000)
    SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.5000000)
    StartSizeRange=(X=(Min=100.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
    ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    ScaleSizeByVelocityMax=10000000.0000000
    SkeletalScale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    RelativeBoneIndexRange=(Min=0.0000000,Max=1.0000000)
    DrawStyle=3
    Texture=Texture'Engine_Decompressed.S_Emitter'
    SecondsBeforeInactive=1.0000000
    LifetimeRange=(Min=4.0000000,Max=4.0000000)
    AddVelocityFromOtherEmitter=-1
    AddVelocityMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
    ForceCullDistanceOnUseCollision=true
}