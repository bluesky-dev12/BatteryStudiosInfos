class BloodSplatter_Teen extends xScorch;

var Texture Splats[4];

simulated function PostBeginPlay()
{
    ProjTexture = Splats[Rand(3)];
    super.PostBeginPlay();
    //return;    
}

defaultproperties
{
    Splats[0]=Texture'FX_TEX.Hit_Effects.BloodDrip1_Teen'
    Splats[1]=Texture'FX_TEX.Hit_Effects.BloodDrip2_Teen'
    Splats[2]=Texture'FX_TEX.Hit_Effects.BloodDrip3_Teen'
    Splats[3]=Texture'FX_TEX.Hit_Effects.BloodDrip4_Teen'
    ProjTexture=Texture'FX_TEX.Hit_Effects.BloodDrip1_Teen'
    FOV=6
    bClipStaticMesh=true
    CullDistance=3000.0000000
}