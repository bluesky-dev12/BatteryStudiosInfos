class wTurret_FNM240_Base extends wTurret_Base
    notplaceable;

simulated function UpdateBaseRotation(Rotator TurretRotation)
{
    SetRotation(TurretRotation);
    //return;    
}

defaultproperties
{
    DrawType=2
    Physics=5
    Mesh=SkeletalMesh'WP_HW_FNM249.FNM249'
    bMovable=true
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
}