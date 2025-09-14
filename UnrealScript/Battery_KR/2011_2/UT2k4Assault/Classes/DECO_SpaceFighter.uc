class DECO_SpaceFighter extends Decoration;

function Landed(Vector HitNormal)
{
    //return;    
}

function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    //return;    
}

function TakeDamage(int NDamage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    //return;    
}

singular function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    //return;    
}

singular function BaseChange()
{
    //return;    
}

function Bump(Actor Other)
{
    //return;    
}

defaultproperties
{
    DrawType=8
    RemoteRole=0
    DrawScale=3.0000000
    AmbientGlow=48
    bMovable=false
    bCanBeDamaged=false
    bShouldBaseAtStartup=false
    bCollideActors=true
    bBlockActors=true
    bBlockKarma=true
    bEdShouldSnap=true
}