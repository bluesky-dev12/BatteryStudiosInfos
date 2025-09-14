/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wProcMesh.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:25
 *	Functions:3
 *
 *******************************************************************************/
class wProcMesh extends Actor
    native
    exportstructs
    placeable;

enum EProcMeshType
{
    MT_Water,
    MT_Deform
};

struct ProcMeshVertex
{
    var Vector Position;
    var Vector Normal;
    var Color Color;
    var float U;
    var float V;
};

var const array<ProcMeshVertex> Vertices;
var const array<int> SectionOffsets;
var() float Dampening;
var() Range DampeningRange;
var() Range MovementClamp;
var() Range ForceClamp;
var() float ForceAttenuation;
var() float Tension;
var() float RestTension;
var() bool CheckCollision;
var() float Noise;
var() Range NoiseForce;
var() Range NoiseTimer;
var transient float NoiseCounter;
var() wProcMesh.EProcMeshType ProcType;
var(Force) bool bForceAffected;
var() bool bRigidEdges;
var const transient pointer pProcData;
var() class<Effects> HitEffect;
var() class<Effects> BigHitEffect;
var() float BigMomentumThreshold;
var() float BigTouchThreshold;
var() float ShootStrength;
var() float TouchStrength;
var() float InfluenceRadius;

// Export UwProcMesh::execProcPling(FFrame&, void* const)
native final function ProcPling(Vector Position, float Strength, float Radius, out Vector EffectLocation, out Vector EffectNormal);
simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local Vector EffectNormal, EffectLocation;

    ProcPling(HitLocation, ShootStrength, 0.0, EffectLocation, EffectNormal);
    // End:0x56
    if(VSize(Momentum) > BigMomentumThreshold && BigHitEffect != none)
    {
        Spawn(BigHitEffect, self,, EffectLocation, rotator(EffectNormal));
    }
    // End:0x77
    else
    {
        // End:0x77
        if(HitEffect != none)
        {
            Spawn(HitEffect, self,, EffectLocation, rotator(EffectNormal));
        }
    }
}

simulated function Touch(Actor Other)
{
    local Vector touchLocation, EffectNormal, EffectLocation;
    local float touchValue;

    super.Touch(Other);
    // End:0x2e
    if(Other == none || !Other.bDisturbFluidSurface)
    {
        return;
    }
    touchLocation = Other.Location;
    touchValue = VSize(Velocity);
    ProcPling(touchLocation, TouchStrength, Other.CollisionRadius, EffectLocation, EffectNormal);
    // End:0xac
    if(touchValue > BigTouchThreshold && BigHitEffect != none)
    {
        Spawn(BigHitEffect, self,, EffectLocation, rotator(EffectNormal));
    }
    // End:0xcd
    else
    {
        // End:0xcd
        if(HitEffect != none)
        {
            Spawn(HitEffect, self,, EffectLocation, rotator(EffectNormal));
        }
    }
}

defaultproperties
{
    Dampening=0.50
    DampeningRange=(Min=-4.0,Max=4.0)
    MovementClamp=(Min=-50.0,Max=50.0)
    ForceClamp=(Min=-20.0,Max=20.0)
    ForceAttenuation=1.0
    Tension=0.40
    RestTension=0.40
    CheckCollision=true
    Noise=0.10
    NoiseForce=(Min=-1.0,Max=1.0)
    NoiseTimer=(Min=2.0,Max=3.0)
    DrawType=10
    bLightingVisibility=true
    bNoDelete=true
    Texture=Texture'S_Emitter'
    CollisionRadius=80.0
    CollisionHeight=80.0
    bCollideActors=true
    bProjTarget=true
    bUseCylinderCollision=true
}