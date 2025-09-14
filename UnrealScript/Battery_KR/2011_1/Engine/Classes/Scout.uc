class Scout extends Pawn
    native
    notplaceable;

var const float MaxLandingVelocity;

simulated function PreBeginPlay()
{
    Destroy();
    //return;    
}

defaultproperties
{
    AccelRate=1.0000000
    RemoteRole=0
    CollisionRadius=52.0000000
    bCollideActors=false
    bCollideWorld=false
    bBlockActors=false
    bProjTarget=false
    bPathColliding=true
}