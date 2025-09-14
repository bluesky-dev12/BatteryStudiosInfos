class HitEffect_plant_BulletHole extends xScorch;

function PostBeginPlay()
{
    // End:0x18
    if(FRand() < 0.7500000)
    {
        LifeSpan *= 1.5000000;
    }
    super.PostBeginPlay();
    //return;    
}

defaultproperties
{
    FrameBufferBlendingOp=2
    ProjTexture=FinalBlend'FX_TEX.Hit_BulletHole.PB_plant_BulletHole'
    bClipStaticMesh=true
    CullDistance=10000.0000000
    LifeSpan=15.0000000
    DrawScale=0.3000000
}