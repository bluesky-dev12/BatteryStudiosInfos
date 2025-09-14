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
    J0x2A:

    // End:0x60 [Loop If]
    if(i < 6)
    {
        t.ObjectiveTag[i] = ObjectiveTag[i];
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    //return;    
}

defaultproperties
{
    bSpawnBuildEffect=false
    VehicleClass=Class'UT2k4Assault_Decompressed.ASTurret_MG240w'
    DrawType=2
    AmbientGlow=96
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
    bEdShouldSnap=true
}