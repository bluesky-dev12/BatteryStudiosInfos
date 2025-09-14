/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ParticleEmitter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:10
 *	Structs:6
 *	Properties:169
 *	Functions:3
 *
 *******************************************************************************/
class ParticleEmitter extends Object
    native
    editinlinenew
    abstract;

enum EBlendMode
{
    BM_MODULATE,
    BM_MODULATE2X,
    BM_MODULATE4X,
    BM_ADD,
    BM_ADDSIGNED,
    BM_ADDSIGNED2X,
    BM_SUBTRACT,
    BM_ADDSMOOTH,
    BM_BLENDDIFFUSEALPHA,
    BM_BLENDTEXTUREALPHA,
    BM_BLENDFACTORALPHA,
    BM_BLENDTEXTUREALPHAPM,
    BM_BLENDCURRENTALPHA,
    BM_PREMODULATE,
    BM_MODULATEALPHA_ADDCOLOR,
    BM_MODULATEINVALPHA_ADDCOLOR,
    BM_MODULATEINVCOLOR_ADDALPHA,
    BM_HACK
};

enum EParticleDrawStyle
{
    PTDS_Regular,
    PTDS_AlphaBlend,
    PTDS_Modulated,
    PTDS_Translucent,
    PTDS_AlphaModulate_MightNotFogCorrectly,
    PTDS_Darken,
    PTDS_Brighten
};

enum EParticleCoordinateSystem
{
    PTCS_Independent,
    PTCS_Relative,
    PTCS_Absolute
};

enum EParticleRotationSource
{
    PTRS_None,
    PTRS_Actor,
    PTRS_Offset,
    PTRS_Normal
};

enum EParticleVelocityDirection
{
    PTVD_None,
    PTVD_StartPositionAndOwner,
    PTVD_OwnerAndStartPosition,
    PTVD_AddRadial
};

enum EParticleStartLocationShape
{
    PTLS_Box,
    PTLS_Sphere,
    PTLS_Polar,
    PTLS_All
};

enum EParticleEffectAxis
{
    PTEA_NegativeX,
    PTEA_PositiveZ
};

enum EParticleCollisionSound
{
    PTSC_None,
    PTSC_LinearGlobal,
    PTSC_LinearLocal,
    PTSC_Random
};

enum EParticleMeshSpawning
{
    PTMS_None,
    PTMS_Linear,
    PTMS_Random
};

enum ESkelLocationUpdate
{
    PTSU_None,
    PTSU_SpawnOffset,
    PTSU_Location
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
var(Local) Core.Object.EDetailMode DetailMode;
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
native function SpawnParticle(int Amount);
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
    LowDetailFactor=0.650
    ExtentMultiplier=(X=1.0,Y=1.0,Z=1.0)
    DampingFactorRange=(X=(Min=1.0,Max=1.0),Y=(Min=1.0,Max=1.0),Z=(Min=1.0,Max=1.0))
    SpawnFromOtherEmitter=-1
    ColorMultiplierRange=(X=(Min=1.0,Max=1.0),Y=(Min=1.0,Max=1.0),Z=(Min=1.0,Max=1.0))
    Opacity=1.0
    FadeOutFactor=(X=0.0,Y=3368904000000000.0,Z=0.0,W=0.0)
    FadeInFactor=(X=0.0,Y=3368904000000000.0,Z=0.0,W=0.0)
    MaxParticles=10
    AddLocationFromOtherEmitter=-1
    StartMassRange=(Min=1.0,Max=1.0)
    VelocityScaleRange=(X=(Min=1.0,Max=1.0),Y=(Min=1.0,Max=1.0),Z=(Min=1.0,Max=1.0))
    MeshScaleRange=(X=(Min=1.0,Max=1.0),Y=(Min=1.0,Max=1.0),Z=(Min=1.0,Max=1.0))
    MeshNormal=(X=0.0,Y=0.0,Z=1.0)
    SpinCCWorCW=(X=0.50,Y=0.50,Z=0.50)
    StartSizeRange=(X=(Min=100.0,Max=100.0),Y=(Min=100.0,Max=100.0),Z=(Min=100.0,Max=100.0))
    ScaleSizeByVelocityMultiplier=(X=1.0,Y=1.0,Z=1.0)
    ScaleSizeByVelocityMax=10000000.0
    SkeletalScale=(X=1.0,Y=1.0,Z=1.0)
    RelativeBoneIndexRange=(Min=0.0,Max=1.0)
    DrawStyle=3
    Texture=Texture'S_Emitter'
    SecondsBeforeInactive=1.0
    LifetimeRange=(Min=4.0,Max=4.0)
    AddVelocityFromOtherEmitter=-1
    AddVelocityMultiplierRange=(X=(Min=1.0,Max=1.0),Y=(Min=1.0,Max=1.0),Z=(Min=1.0,Max=1.0))
    ForceCullDistanceOnUseCollision=true
}