/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\BloodSplatter_Alien_Omega.uc
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
class BloodSplatter_Alien_Omega extends xScorch;

var Texture Splats[4];

simulated function PostBeginPlay()
{
    ProjTexture = Splats[Rand(3)];
    super.PostBeginPlay();
}

defaultproperties
{
    Splats[0]=Texture'FX_TEX.Hit_Effects.BloodDrip1_Alien'
    Splats[1]=Texture'FX_TEX.Hit_Effects.BloodDrip2_Alien'
    Splats[2]=Texture'FX_TEX.Hit_Effects.BloodDrip3_Alien'
    Splats[3]=Texture'FX_TEX.Hit_Effects.BloodDrip4_Alien'
    ProjTexture=Texture'FX_TEX.Hit_Effects.BloodDrip1_Alien'
    FOV=6
    bClipStaticMesh=true
    CullDistance=3000.0
}