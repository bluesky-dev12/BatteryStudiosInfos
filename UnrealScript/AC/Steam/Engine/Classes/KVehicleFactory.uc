/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KVehicleFactory.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class KVehicleFactory extends SVehicleFactory
    placeable;

var() class<KVehicle> KVehicleClass;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local KVehicle CreatedVehicle;

    // End:0x11
    if(VehicleCount >= MaxVehicleCount)
    {
        return;
    }
    // End:0x58
    if(KVehicleClass != none)
    {
        CreatedVehicle = Spawn(KVehicleClass,,, Location, Rotation);
        // End:0x58
        if(CreatedVehicle != none)
        {
            ++ VehicleCount;
            CreatedVehicle.ParentFactory = self;
        }
    }
}
