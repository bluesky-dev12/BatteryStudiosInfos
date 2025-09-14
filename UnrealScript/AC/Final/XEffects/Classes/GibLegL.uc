class GibLegL extends Gib
    notplaceable;

simulated function SetTeam(string strSTMeshName)
{
    local StaticMesh NewMesh;

    NewMesh = StaticMesh(DynamicLoadObject(strSTMeshName $ "LLeg_St", Class'Engine.StaticMesh'));
    SetStaticMesh(NewMesh);
    //return;    
}

defaultproperties
{
    TrailClass=Class'XEffects_Decompressed.BloodJet'
    DampenFactor=0.3500000
    DrawType=8
    CollisionRadius=10.0000000
    CollisionHeight=10.0000000
    bUseCylinderCollision=false
    Mass=3000.0000000
}