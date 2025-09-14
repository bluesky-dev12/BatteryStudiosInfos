class wTurret_FNM240_Swivel extends wTurret_Base
    notplaceable;

simulated function UpdateSwivelRotation(Rotator TurretRotation)
{
    //return;    
}

defaultproperties
{
    StaticMesh=StaticMesh'WPS_HW.FNM249_Bipod'
    Physics=5
    bMovable=true
    CollisionRadius=40.0000000
    CollisionHeight=40.0000000
}