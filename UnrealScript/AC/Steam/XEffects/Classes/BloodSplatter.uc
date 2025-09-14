/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\BloodSplatter.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class BloodSplatter extends xScorch;

var Texture Splats[4];

simulated function PostBeginPlay()
{
    ProjTexture = Splats[Rand(3)];
    super.PostBeginPlay();
}

defaultproperties
{
    Splats[0]=Texture'FX_TEX.Hit_Effects.BloodDrip1'
    Splats[1]=Texture'FX_TEX.Hit_Effects.BloodDrip2'
    Splats[2]=Texture'FX_TEX.Hit_Effects.BloodDrip3'
    Splats[3]=Texture'FX_TEX.Hit_Effects.BloodDrip4'
    ProjTexture=Texture'FX_TEX.Hit_Effects.BloodDrip1'
    FOV=6
    bClipStaticMesh=true
    CullDistance=3000.0
}