class RocketMark extends xScorch;

function PostBeginPlay()
{
    // End:0x18
    if(FRand() < 0.7500000)
    {
        LifeSpan *= 3.5000000;
    }
    super.PostBeginPlay();
    //return;    
}

defaultproperties
{
    FrameBufferBlendingOp=2
    ProjTexture=FinalBlend'FX_TEX.Hit_BulletHole.PB_explosion_mark'
    bClipStaticMesh=true
    CullDistance=3000.0000000
    LifeSpan=10.0000000
    DrawScale=4.3000002
}