class KVehicleFactory extends SVehicleFactory
    placeable;

var() Class<KVehicle> KVehicleClass;

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
            VehicleCount++;
            CreatedVehicle.ParentFactory = self;
        }
    }
    //return;    
}
