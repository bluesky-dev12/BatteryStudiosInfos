class HitEffect_heli_attack_BulletHole extends xScorch;

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
    ProjTexture=FinalBlend'FX_TEX.Hit_BulletHole.PB_explosion_mark_gr'
    bClipStaticMesh=true
    CullDistance=10000.0000000
    LifeSpan=15.0000000
    DrawScale=2.0000000
}