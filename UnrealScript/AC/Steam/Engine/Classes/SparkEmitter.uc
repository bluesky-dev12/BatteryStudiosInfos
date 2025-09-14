/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SparkEmitter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:10
 *
 *******************************************************************************/
class SparkEmitter extends ParticleEmitter
    native
    editinlinenew;

struct ParticleSparkData
{
    var float TimeBeforeVisible;
    var float TimeBetweenSegments;
    var Vector StartLocation;
    var Vector StartVelocity;
};

var(Spark) Range LineSegmentsRange;
var(Spark) Range TimeBeforeVisibleRange;
var(Spark) Range TimeBetweenSegmentsRange;
var transient array<ParticleSparkData> SparkData;
var transient VertexBuffer VertexBuffer;
var transient IndexBuffer IndexBuffer;
var transient int NumSegments;
var transient int VerticesPerParticle;
var transient int IndicesPerParticle;
var transient int PrimitivesPerParticle;

defaultproperties
{
    LineSegmentsRange=(Min=5.0,Max=5.0)
}