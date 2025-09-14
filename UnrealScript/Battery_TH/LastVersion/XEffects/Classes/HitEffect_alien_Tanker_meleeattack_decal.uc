class HitEffect_alien_Tanker_meleeattack_decal extends xScorch;

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
    ProjTexture=FinalBlend'FX_TEX.Hit_BulletHole.FB_alien_Tanker_meleeattack_decal'
    bClipStaticMesh=true
    CullDistance=2000.0000000
    LifeSpan=3.0000000
    DrawScale=0.4000000
}