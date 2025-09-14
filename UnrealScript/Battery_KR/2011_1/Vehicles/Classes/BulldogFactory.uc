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
            EventInstigator.ReceiveLocalizedMessage(Class'Vehicles_Decompressed.BulldogMessage', 2);
        }
        return;
    }
    // End:0xAC
    if(KVehicleClass != none)
    {
        CreatedVehicle = Spawn(KVehicleClass,,, Location, Rotation);
        // End:0x92
        if(CreatedVehicle != none)
        {
            VehicleCount++;
            CreatedVehicle.ParentFactory = self;            
        }
        else
        {
            Log("Couldn't spawn Bulldog");
        }
    }
    //return;    
}

defaultproperties
{
    KVehicleClass=Class'Vehicles_Decompressed.Bulldog'
}