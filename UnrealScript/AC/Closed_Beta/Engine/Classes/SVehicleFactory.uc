class SVehicleFactory extends Actor
    native
    placeable;

var() Class<Vehicle> VehicleClass;
var() int MaxVehicleCount;
var int VehicleCount;
var NavigationPoint myMarker;

function PreBeginPlay()
{
    // End:0x2F
    if(!Level.Game.bAllowVehicles && !bNoDelete)
    {
        Destroy();
        return;
    }
    super.PreBeginPlay();
    //return;    
}

event VehicleDestroyed(Vehicle V)
{
    VehicleCount--;
    //return;    
}

event VehiclePossessed(Vehicle V)
{
    //return;    
}

event VehicleUnPossessed(Vehicle V)
{
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Vehicle CreatedVehicle;

    // End:0x1F
    if(!Level.Game.bAllowVehicles)
    {
        return;
    }
    // End:0x5C
    if(VehicleClass == none)
    {
        Log(("SVehicleFactory:" @ string(self)) @ "has no VehicleClass");
        return;
    }
    // End:0x74
    if(!EventInstigator.IsA('UnrealPawn'))
    {
        return;
    }
    // End:0x85
    if(VehicleCount >= MaxVehicleCount)
    {
        return;
    }
    // End:0xCC
    if(VehicleClass != none)
    {
        CreatedVehicle = Spawn(VehicleClass,,, Location, Rotation);
        // End:0xCC
        if(CreatedVehicle != none)
        {
            VehicleCount++;
            CreatedVehicle.ParentFactory = self;
        }
    }
    //return;    
}

defaultproperties
{
    MaxVehicleCount=1
    bHidden=true
    bNoDelete=true
    RemoteRole=0
    Texture=Texture'Engine.S_KVehFact'
    bDirectional=true
}