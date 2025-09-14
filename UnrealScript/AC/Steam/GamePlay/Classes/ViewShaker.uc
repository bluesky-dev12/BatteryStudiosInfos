/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ViewShaker.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:1
 *
 *******************************************************************************/
class ViewShaker extends Triggers;

var() float ShakeRadius;
var() Vector RotMag;
var() Vector RotRate;
var() float RotTime;
var() Vector OffsetMag;
var() Vector OffsetRate;
var() float OffsetTime;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    local Controller C;
    local PlayerController LocalPlayer;

    LocalPlayer = Level.GetLocalPlayerController();
    // End:0x79
    if(LocalPlayer != none && VSize(Location - LocalPlayer.ViewTarget.Location) < ShakeRadius)
    {
        LocalPlayer.ShakeView(RotMag, RotRate, RotTime, OffsetMag, OffsetRate, OffsetTime);
    }
    C = Level.ControllerList;
    J0x8d:
    // End:0x12e [While If]
    if(C != none)
    {
        // End:0x117
        if(PlayerController(C) != none && C != LocalPlayer && VSize(Location - PlayerController(C).ViewTarget.Location) < ShakeRadius)
        {
            C.ShakeView(RotMag, RotRate, RotTime, OffsetMag, OffsetRate, OffsetTime);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x8d;
    }
}

defaultproperties
{
    ShakeRadius=2000.0
    OffsetMag=(X=10.0,Y=10.0,Z=10.0)
    OffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    OffsetTime=3.0
    bCollideActors=true
}