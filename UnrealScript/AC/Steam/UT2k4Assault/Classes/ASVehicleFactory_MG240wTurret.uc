/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicleFactory_MG240wTurret.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class ASVehicleFactory_MG240wTurret extends ASVehicleFactory;

var() name ObjectiveTag[6];

function VehicleSpawned()
{
    local ASTurret t;
    local int i;

    super.VehicleSpawned();
    t = ASTurret(Child);
    // End:0x23
    if(t == none)
    {
        return;
    }
    i = 0;
    J0x2a:
    // End:0x60 [While If]
    if(i < 6)
    {
        t.ObjectiveTag[i] = ObjectiveTag[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
}

defaultproperties
{
    bSpawnBuildEffect=true
    VehicleClass=class'ASTurret_MG240w'
    DrawType=2
    AmbientGlow=96
    CollisionRadius=0.0
    CollisionHeight=0.0
    bEdShouldSnap=true
}