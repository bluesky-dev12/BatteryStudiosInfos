class wProcMesh extends Actor
    native
    exportstructs
    placeable;

enum EProcMeshType
{
    MT_Water,                       // 0
    MT_Deform                       // 1
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
var() Class<Effects> HitEffect;
var() Class<Effects> BigHitEffect;
var() float BigMomentumThreshold;
var() float BigTouchThreshold;
var() float ShootStrength;
var() float TouchStrength;
var() float InfluenceRadius;

// Export UwProcMesh::execProcPling(FFrame&, void* const)
native final function ProcPling(Vector Position, float Strength, float Radius, out Vector EffectLocation, out Vector EffectNormal)
{
    //native.Position;
    //native.Strength;
    //native.Radius;
    //native.EffectLocation;
    //native.EffectNormal;        
}

simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local Vector EffectNormal, EffectLocation;

    ProcPling(HitLocation, ShootStrength, 0.0000000, EffectLocation, EffectNormal);
    // End:0x56
    if((VSize(Momentum) > BigMomentumThreshold) && BigHitEffect != none)
    {
        Spawn(BigHitEffect, self,, EffectLocation, Rotator(EffectNormal));        
    }
    else
    {
        // End:0x77
        if(HitEffect != none)
        {
            Spawn(HitEffect, self,, EffectLocation, Rotator(EffectNormal));
        }
    }
    //return;    
}

simulated function Touch(Actor Other)
{
    local Vector touchLocation, EffectNormal, EffectLocation;
    local float touchValue;

    super.Touch(Other);
    // End:0x2E
    if((Other == none) || !Other.bDisturbFluidSurface)
    {
        return;
    }
    touchLocation = Other.Location;
    touchValue = VSize(Velocity);
    ProcPling(touchLocation, TouchStrength, Other.CollisionRadius, EffectLocation, EffectNormal);
    // End:0xAC
    if((touchValue > BigTouchThreshold) && BigHitEffect != none)
    {
        Spawn(BigHitEffect, self,, EffectLocation, Rotator(EffectNormal));        
    }
    else
    {
        // End:0xCD
        if(HitEffect != none)
        {
            Spawn(HitEffect, self,, EffectLocation, Rotator(EffectNormal));
        }
    }
    //return;    
}

defaultproperties
{
    Dampening=0.5000000
    DampeningRange=(Min=-4.0000000,Max=4.0000000)
    MovementClamp=(Min=-50.0000000,Max=50.0000000)
    ForceClamp=(Min=-20.0000000,Max=20.0000000)
    ForceAttenuation=1.0000000
    Tension=0.4000000
    RestTension=0.4000000
    CheckCollision=true
    Noise=0.1000000
    NoiseForce=(Min=-1.0000000,Max=1.0000000)
    NoiseTimer=(Min=2.0000000,Max=3.0000000)
    DrawType=10
    bLightingVisibility=false
    bNoDelete=true
    Texture=Texture'Engine.S_Emitter'
    CollisionRadius=80.0000000
    CollisionHeight=80.0000000
    bCollideActors=true
    bProjTarget=true
    bUseCylinderCollision=true
}