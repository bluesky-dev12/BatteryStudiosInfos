/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\BloodSplatter_Teen.uc
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
class BloodSplatter_Teen extends xScorch;

var Texture Splats[4];

simulated function PostBeginPlay()
{
    ProjTexture = Splats[Rand(3)];
    super.PostBeginPlay();
}

defaultproperties
{
    Splats[0]=Texture'FX_TEX.Hit_Effects.BloodDrip1_china'
    Splats[1]=Texture'FX_TEX.Hit_Effects.BloodDrip2_china'
    Splats[2]=Texture'FX_TEX.Hit_Effects.BloodDrip3_china'
    Splats[3]=Texture'FX_TEX.Hit_Effects.BloodDrip4_china'
    ProjTexture=Texture'FX_TEX.Hit_Effects.BloodDrip1_china'
    FOV=6
    bClipStaticMesh=true
    CullDistance=3000.0
}