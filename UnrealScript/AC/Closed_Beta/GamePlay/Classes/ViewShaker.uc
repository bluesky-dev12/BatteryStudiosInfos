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
    if((LocalPlayer != none) && VSize(Location - LocalPlayer.ViewTarget.Location) < ShakeRadius)
    {
        LocalPlayer.ShakeView(RotMag, RotRate, RotTime, OffsetMag, OffsetRate, OffsetTime);
    }
    C = Level.ControllerList;
    J0x8D:

    // End:0x12E [Loop If]
    if(C != none)
    {
        // End:0x117
        if(((PlayerController(C) != none) && C != LocalPlayer) && VSize(Location - PlayerController(C).ViewTarget.Location) < ShakeRadius)
        {
            C.ShakeView(RotMag, RotRate, RotTime, OffsetMag, OffsetRate, OffsetTime);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x8D;
    }
    //return;    
}

defaultproperties
{
    ShakeRadius=2000.0000000
    OffsetMag=(X=10.0000000,Y=10.0000000,Z=10.0000000)
    OffsetRate=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
    OffsetTime=3.0000000
    bCollideActors=false
}