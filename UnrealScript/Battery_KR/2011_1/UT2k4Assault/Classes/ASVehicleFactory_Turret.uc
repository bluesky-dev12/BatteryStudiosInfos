class ASVehicleFactory_Turret extends ASVehicleFactory;

var array<Trigger_ASUseAndPossess> VTarray;

function PostBeginPlay()
{
    local Trigger_ASUseAndPossess VT;

    super.PostBeginPlay();
    // End:0x41
    foreach DynamicActors(Class'UT2k4Assault_Decompressed.Trigger_ASUseAndPossess', VT)
    {
        // End:0x40
        if(VT.PawnTag == VehicleTag)
        {
            VTarray[VTarray.Length] = VT;
        }        
    }    
    //return;    
}

function VehicleSpawned()
{
    local int i;

    super.VehicleSpawned();
    // End:0x7C
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x19:

        // End:0x7C [Loop If]
        if(i < VTarray.Length)
        {
            ASTurret(Child).EntryTriggers[ASTurret(Child).EntryTriggers.Length] = VTarray[i];
            VTarray[i].VehicleSpawned();
            i++;
            // [Loop Continue]
            goto J0x19;
        }
    }
    //return;    
}

event VehicleDestroyed(Vehicle V)
{
    local int i;

    super.VehicleDestroyed(V);
    // End:0x4D
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x1E:

        // End:0x4D [Loop If]
        if(i < VTarray.Length)
        {
            VTarray[i].VehicleDestroyed();
            i++;
            // [Loop Continue]
            goto J0x1E;
        }
    }
    //return;    
}

event VehicleUnPossessed(Vehicle V)
{
    local int i;

    super(SVehicleFactory).VehicleUnPossessed(V);
    // End:0x4D
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x1E:

        // End:0x4D [Loop If]
        if(i < VTarray.Length)
        {
            VTarray[i].VehicleUnPossessed();
            i++;
            // [Loop Continue]
            goto J0x1E;
        }
    }
    //return;    
}

event VehiclePossessed(Vehicle V)
{
    local int i;

    super.VehiclePossessed(V);
    // End:0x4D
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x1E:

        // End:0x4D [Loop If]
        if(i < VTarray.Length)
        {
            VTarray[i].VehiclePossessed();
            i++;
            // [Loop Continue]
            goto J0x1E;
        }
    }
    //return;    
}

event PrevVehicle(Vehicle V)
{
    local int i;

    // End:0x4B
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x13:

        // End:0x4B [Loop If]
        if(i < VTarray.Length)
        {
            VTarray[i].PrevVehicle(self, V);
            // [Explicit Break]
            goto J0x4B;
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    J0x4B:

    //return;    
}

event NextVehicle(Vehicle V)
{
    local int i;

    // End:0x4B
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x13:

        // End:0x4B [Loop If]
        if(i < VTarray.Length)
        {
            VTarray[i].NextVehicle(self, V);
            // [Explicit Break]
            goto J0x4B;
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    J0x4B:

    //return;    
}

defaultproperties
{
    bSpawnBuildEffect=false
    VehicleClassStr="UT2k4AssaultFull.ASTurret_BallTurret"
    AIVisibilityDist=25000.0000000
    VehicleClass=none
    DrawType=8
    DrawScale=5.0000000
    AmbientGlow=96
    bEdShouldSnap=true
}