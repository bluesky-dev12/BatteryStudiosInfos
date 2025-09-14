/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicleFactory_Turret.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:7
 *
 *******************************************************************************/
class ASVehicleFactory_Turret extends ASVehicleFactory;

var array<Trigger_ASUseAndPossess> VTarray;

function PostBeginPlay()
{
    local Trigger_ASUseAndPossess VT;

    super.PostBeginPlay();
    // End:0x41
    foreach DynamicActors(class'Trigger_ASUseAndPossess', VT)
    {
        // End:0x40
        if(VT.PawnTag == VehicleTag)
        {
            VTarray[VTarray.Length] = VT;
        }                
    }
}

function VehicleSpawned()
{
    local int i;

    super.VehicleSpawned();
    // End:0x7c
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x19:
        // End:0x7c [While If]
        if(i < VTarray.Length)
        {
            ASTurret(Child).EntryTriggers[ASTurret(Child).EntryTriggers.Length] = VTarray[i];
            VTarray[i].VehicleSpawned();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x19;
        }
    }
}

event VehicleDestroyed(Vehicle V)
{
    local int i;

    super.VehicleDestroyed(V);
    // End:0x4d
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x1e:
        // End:0x4d [While If]
        if(i < VTarray.Length)
        {
            VTarray[i].VehicleDestroyed();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
    }
}

event VehicleUnPossessed(Vehicle V)
{
    local int i;

    super(SVehicleFactory).VehicleUnPossessed(V);
    // End:0x4d
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x1e:
        // End:0x4d [While If]
        if(i < VTarray.Length)
        {
            VTarray[i].VehicleUnPossessed();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
    }
}

event VehiclePossessed(Vehicle V)
{
    local int i;

    super.VehiclePossessed(V);
    // End:0x4d
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x1e:
        // End:0x4d [While If]
        if(i < VTarray.Length)
        {
            VTarray[i].VehiclePossessed();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
    }
}

event PrevVehicle(Vehicle V)
{
    local int i;

    // End:0x4b
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0x4b [While If]
        if(i < VTarray.Length)
        {
            VTarray[i].PrevVehicle(self, V);
            JumpToken-JumpToken(System.InvalidCastException: Unable to cast object of type 'EndFunctionParmsToken' to type 'JumpToken'.
   at UELib.Core.UStruct.UByteCodeDecompiler.JumpToken.Decompile()
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile())
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    J0x4b:
}

event NextVehicle(Vehicle V)
{
    local int i;

    // End:0x4b
    if(VTarray.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0x4b [While If]
        if(i < VTarray.Length)
        {
            VTarray[i].NextVehicle(self, V);
            JumpToken-JumpToken(System.InvalidCastException: Unable to cast object of type 'EndFunctionParmsToken' to type 'JumpToken'.
   at UELib.Core.UStruct.UByteCodeDecompiler.JumpToken.Decompile()
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile())
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    J0x4b:
}

defaultproperties
{
    bSpawnBuildEffect=true
    VehicleClassStr="UT2k4AssaultFull.ASTurret_BallTurret"
    AIVisibilityDist=25000.0
    VehicleClass=none
    DrawType=8
    DrawScale=5.0
    AmbientGlow=96
    bEdShouldSnap=true
}