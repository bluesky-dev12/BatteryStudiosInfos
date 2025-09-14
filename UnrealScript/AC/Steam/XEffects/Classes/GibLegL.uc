/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\GibLegL.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class GibLegL extends Gib
    notplaceable;

simulated function SetTeam(string strSTMeshName)
{
    local StaticMesh NewMesh;

    NewMesh = StaticMesh(DynamicLoadObject(strSTMeshName $ "LLeg_St", class'StaticMesh'));
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