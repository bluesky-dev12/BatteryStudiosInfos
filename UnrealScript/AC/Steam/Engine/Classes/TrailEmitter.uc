/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TrailEmitter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Structs:2
 *	Properties:14
 *	Functions:1
 *
 *******************************************************************************/
class TrailEmitter extends ParticleEmitter
    native
    editinlinenew;

enum ETrailShadeType
{
    PTTST_None,
    PTTST_RandomStatic,
    PTTST_RandomDynamic,
    PTTST_Linear,
    PTTST_PointLife
};

enum ETrailLocation
{
    PTTL_AttachedToParticle,
    PTTL_FollowEmitter
};

struct ParticleTrailData
{
    var Vector Location;
    var Color Color;
    var float Size;
    var int DoubleDummy1;
    var int DoubleDummy2;
};

struct ParticleTrailInfo
{
    var int TrailIndex;
    var int NumPoints;
    var Vector LastLocation;
    var Vector LastEmitterLocation;
};

var(Trail) TrailEmitter.ETrailShadeType TrailShadeType;
var(Trail) TrailEmitter.ETrailLocation TrailLocation;
var(Trail) int MaxPointsPerTrail;
var(Trail) float DistanceThreshold;
var(Trail) bool UseCrossedSheets;
var(Trail) int MaxTrailTwistAngle;
var(Trail) float PointLifeTime;
var transient array<ParticleTrailData> TrailData;
var transient array<ParticleTrailInfo> TrailInfo;
var transient VertexBuffer VertexBuffer;
var transient IndexBuffer IndexBuffer;
var transient int VerticesPerParticle;
var transient int IndicesPerParticle;
var transient int PrimitivesPerParticle;

// Export UTrailEmitter::execResetTrail(FFrame&, void* const)
native final function ResetTrail();

defaultproperties
{
    MaxPointsPerTrail=30
    DistanceThreshold=2.0
    MaxTrailTwistAngle=16384
}