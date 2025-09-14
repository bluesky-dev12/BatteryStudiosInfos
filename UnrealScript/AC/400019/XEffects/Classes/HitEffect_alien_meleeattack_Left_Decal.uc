class HitEffect_alien_meleeattack_Left_Decal extends xScorch;

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
    RandomOrient=false
    FrameBufferBlendingOp=2
    ProjTexture=FinalBlend'FX_TEX.Hit_BulletHole.FB_alien_meleeattack_decal_left'
    bClipStaticMesh=true
    CullDistance=2000.0000000
    LifeSpan=6.0000000
    DrawScale=0.3000000
}