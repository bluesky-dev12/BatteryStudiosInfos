class HoldSpot extends UnrealScriptedSequence;

var Vehicle HoldVehicle;

function Actor GetMoveTarget()
{
    // End:0x42
    if(HoldVehicle != none)
    {
        // End:0x26
        if(HoldVehicle.Health <= 0)
        {
            HoldVehicle = none;
        }
        // End:0x42
        if(HoldVehicle != none)
        {
            return HoldVehicle.GetMoveTargetFor(none);
        }
    }
    return self;
    //return;    
}

function FreeScript()
{
    Destroy();
    //return;    
}

defaultproperties
{
    bStatic=false
    bCollideWhenPlacing=false
}