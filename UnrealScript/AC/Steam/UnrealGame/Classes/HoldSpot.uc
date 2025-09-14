/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\HoldSpot.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
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
}

function FreeScript()
{
    Destroy();
}

defaultproperties
{
    bStatic=true
    bCollideWhenPlacing=true
}