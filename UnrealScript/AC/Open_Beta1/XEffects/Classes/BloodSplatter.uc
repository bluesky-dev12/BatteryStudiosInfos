class BloodSplatter extends xScorch;

var Texture Splats[4];

simulated function PostBeginPlay()
{
    ProjTexture = Splats[Rand(3)];
    super.PostBeginPlay();
    //return;    
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
    CullDistance=3000.0000000
}