class ASTurret_MG240w_Swivel extends ASTurret_Base
    notplaceable;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCollision(false, false, false);
    //return;    
}

simulated function UpdateSwivelRotation(Rotator TurretRotation)
{
    //return;    
}

defaultproperties
{
    Physics=5
    DrawScale=1.0000000
    bMovable=true
}