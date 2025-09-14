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
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x208
    foreach AllActors(Class'Engine.PhysicsVolume', PV, VolumeTag)
    {
        PV.Gravity.Z = FMax(PV.Gravity.Z, GravityZ);
        PV.NetUpdateTime = Level.TimeSeconds - float(1);
        PV.bAlwaysRelevant = true;
        PV.RemoteRole = ROLE_DumbProxy;
        // End:0xCF
        if(PV.IsA('DefaultPhysicsVolume'))
        {
            Level.DefaultGravity = PV.Gravity.Z;
        }
        N = Level.NavigationPointList;
        J0xE3:

        // End:0x207 [Loop If]
        if(N != none)
        {
            // End:0x1F0
            if(N.IsA('JumpPad') && PV.Encompasses(N))
            {
                j = JumpPad(N);
                // End:0x1F0
                if(j != none)
                {
                    XYDir = j.JumpTarget.Location - j.Location;
                    ZDiff = XYDir.Z;
                    Time = (2.5000000 * j.JumpZModifier) * Sqrt(Abs(ZDiff / GravityZ));
                    j.JumpVelocity = XYDir / Time;
                    j.JumpVelocity.Z = (ZDiff / Time) - ((0.5000000 * GravityZ) * Time);
                }
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0xE3;
        }        
    }    
    //return;    
}

defaultproperties
{
    GravityZ=-300.0000000
    bCollideActors=false
}