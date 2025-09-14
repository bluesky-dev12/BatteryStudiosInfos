/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Scout.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class Scout extends Pawn
    native
    notplaceable;

var const float MaxLandingVelocity;

simulated function PreBeginPlay()
{
    Destroy();
}

defaultproperties
{
    AccelRate=1.0
    RemoteRole=0
    CollisionRadius=52.0
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bProjTarget=true
    bPathColliding=true
}