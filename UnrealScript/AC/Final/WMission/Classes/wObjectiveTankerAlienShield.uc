class wObjectiveTankerAlienShield extends Actor
    notplaceable;

var Actor AttachedActor;

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x43
    if(Owner != none)
    {
        Owner.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, Class'Engine.wDamageUnknown', CollisionPart, WeaponType, bWallShot);
    }
    //return;    
}

defaultproperties
{
    DrawType=8
    StaticMesh=StaticMesh'FX_StaticMesh.Map.alien_tankersheld'
    bDeferRendering=false
    RemoteRole=0
    SurfaceType=31
    Style=5
    bUnlit=true
    bCollideActors=true
    bProjTarget=true
    bForceCollision=true
}