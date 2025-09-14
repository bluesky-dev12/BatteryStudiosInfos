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
    Splats[0]=Texture'FX_TEX.Hit_Effects.BloodDrip1_china'
    Splats[1]=Texture'FX_TEX.Hit_Effects.BloodDrip2_china'
    Splats[2]=Texture'FX_TEX.Hit_Effects.BloodDrip3_china'
    Splats[3]=Texture'FX_TEX.Hit_Effects.BloodDrip4_china'
    ProjTexture=Texture'FX_TEX.Hit_Effects.BloodDrip1_china'
    FOV=6
    bClipStaticMesh=true
    CullDistance=3000.0000000
}