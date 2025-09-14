/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Vehicles\Classes\BulldogFactory.uc
 * Package Imports:
 *	Vehicles
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class BulldogFactory extends KVehicleFactory;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local KVehicle CreatedVehicle;

    // End:0x16
    if(EventInstigator.IsA('Vehicle'))
    {
        return;
    }
    // End:0x48
    if(VehicleCount >= MaxVehicleCount)
    {
        // End:0x46
        if(EventInstigator != none)
        {
            EventInstigator.ReceiveLocalizedMessage(class'BulldogMessage', 2);
        }
        return;
    }
    // End:0xac
    if(KVehicleClass != none)
    {
        CreatedVehicle = Spawn(KVehicleClass,,, Location, Rotation);
        // End:0x92
        if(CreatedVehicle != none)
        {
            ++ VehicleCount;
            CreatedVehicle.ParentFactory = self;
        }
        // End:0xac
        else
        {
            Log("Couldn't spawn Bulldog");
        }
    }
}

defaultproperties
{
    KVehicleClass=class'Bulldog'
}