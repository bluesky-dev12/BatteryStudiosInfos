/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wArrangeTurret.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:7
 *
 *******************************************************************************/
class wArrangeTurret extends Actor
    native
    placeable;

var() class<Vehicle> VehicleClass;
var() int MaxVehicleCount;
var int VehicleCount;
var NavigationPoint myMarker;

function PreBeginPlay()
{
    // End:0x2f
    if(!Level.Game.bAllowVehicles && !bNoDelete)
    {
        Destroy();
        return;
    }
    super.PreBeginPlay();
}

event VehicleDestroyed(Vehicle V)
{
    -- VehicleCount;
}

event VehiclePossessed(Vehicle V);
event VehicleUnPossessed(Vehicle V);
event Trigger(Actor Other, Pawn EventInstigator)
{
    local Vehicle CreatedVehicle;

    // End:0x1f
    if(!Level.Game.bAllowVehicles)
    {
        return;
    }
    // End:0x5c
    if(VehicleClass == none)
    {
        Log("SVehicleFactory:" @ string(self) @ "has no VehicleClass");
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
    // End:0xcc
    if(VehicleClass != none)
    {
        CreatedVehicle = Spawn(VehicleClass,,, Location, Rotation);
        // End:0xcc
        if(CreatedVehicle != none)
        {
            ++ VehicleCount;
            CreatedVehicle.ParentTurret = self;
        }
    }
}

function ForceDestroyVehicle();
function ForceSpawnVehicle();

defaultproperties
{
    MaxVehicleCount=1
    bHidden=true
    bNoDelete=true
    RemoteRole=0
    bDirectional=true
}