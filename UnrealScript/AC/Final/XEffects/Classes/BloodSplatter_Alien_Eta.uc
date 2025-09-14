class BloodSplatter_Alien_Eta extends xScorch;

var Texture Splats[4];

simulated function PostBeginPlay()
{
    ProjTexture = Splats[Rand(3)];
    super.PostBeginPlay();
    //return;    
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
    CullDistance=3000.0000000
}