class ASTurret_Minigun_Swivel extends ASTurret_Base
    notplaceable;

simulated function UpdateSwivelRotation(Rotator TurretRotation)
{
    local Rotator SwivelRotation;

    SwivelRotation = TurretRotation;
    SwivelRotation.Pitch = 0;
    SetRotation(SwivelRotation);
    //return;    
}

defaultproperties
{
    Physics=5
    DrawScale=0.4200000
    bMovable=true
}