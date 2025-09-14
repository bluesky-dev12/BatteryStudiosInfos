/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\GibArmR.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class GibArmR extends Gib
    notplaceable;

simulated function SetTeam(string strSTMeshName)
{
    local StaticMesh NewMesh;

    NewMesh = StaticMesh(DynamicLoadObject(strSTMeshName $ "RArm_St", class'StaticMesh'));
    SetStaticMesh(NewMesh);
}

defaultproperties
{
    TrailClass=class'BloodJet'
    DampenFactor=0.350
    DrawType=8
    CollisionRadius=10.0
    CollisionHeight=10.0
    bUseCylinderCollision=true
    Mass=3000.0
}