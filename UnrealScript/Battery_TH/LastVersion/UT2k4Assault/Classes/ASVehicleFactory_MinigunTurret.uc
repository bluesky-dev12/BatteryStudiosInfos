class ASVehicleFactory_MinigunTurret extends ASVehicleFactory;

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
    VehicleClass=Class'UT2k4Assault_Decompressed.ASTurret_Minigun'
    DrawType=8
    DrawScale=0.4200000
    AmbientGlow=96
    CollisionRadius=60.0000000
    CollisionHeight=39.0000000
    bEdShouldSnap=true
}