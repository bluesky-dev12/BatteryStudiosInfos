class BulletDecal extends xScorch;

function PostBeginPlay()
{
    // End:0x18
    if(FRand() < 0.7500000)
    {
        LifeSpan *= 0.5000000;
    }
    super.PostBeginPlay();
    //return;    
}

defaultproperties
{
    RandomOrient=false
    ProjTexture=Texture'XEffects_Decompressed.bulletpock'
    bClipStaticMesh=true
    CullDistance=3000.0000000
    bHighDetail=true
    LifeSpan=3.2000000
    DrawScale=0.1800000
}