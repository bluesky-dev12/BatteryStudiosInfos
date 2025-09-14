/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\GravityTrigger.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class GravityTrigger extends Triggers;

var() float GravityZ;
var() name VolumeTag;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local PhysicsVolume PV;
    local Vector XYDir;
    local float ZDiff, Time;
    local JumpPad j;
    local NavigationPoint N;

    // End:0x12
    if(Role < 4)
    {
        return;
    }
    // End:0x208
    foreach AllActors(class'PhysicsVolume', PV, VolumeTag)
    {
        PV.Gravity.Z = FMax(PV.Gravity.Z, GravityZ);
        PV.NetUpdateTime = Level.TimeSeconds - float(1);
        PV.bAlwaysRelevant = true;
        PV.RemoteRole = 1;
        // End:0xcf
        if(PV.IsA('DefaultPhysicsVolume'))
        {
            Level.DefaultGravity = PV.Gravity.Z;
        }
        N = Level.NavigationPointList;
        J0xe3:
        // End:0x207 [While If]
        if(N != none)
        {
            // End:0x1f0
            if(N.IsA('JumpPad') && PV.Encompasses(N))
            {
                j = JumpPad(N);
                // End:0x1f0
                if(j != none)
                {
                    XYDir = j.JumpTarget.Location - j.Location;
                    ZDiff = XYDir.Z;
                    Time = 2.50 * j.JumpZModifier * Sqrt(Abs(ZDiff / GravityZ));
                    j.JumpVelocity = XYDir / Time;
                    j.JumpVelocity.Z = ZDiff / Time - 0.50 * GravityZ * Time;
                }
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0xe3;
        }                
    }
}

defaultproperties
{
    GravityZ=-300.0
    bCollideActors=true
}