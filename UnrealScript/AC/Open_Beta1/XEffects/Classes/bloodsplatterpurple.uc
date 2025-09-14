class bloodsplatterpurple extends xScorch;

var Texture Splats[3];

simulated function PostBeginPlay()
{
    ProjTexture = Splats[Rand(3)];
    super.PostBeginPlay();
    //return;    
}

defaultproperties
{
    FOV=6
    bClipStaticMesh=true
    CullDistance=7000.0000000
    LifeSpan=5.0000000
}