class Event_Cash_Gacha_Easter_GR_mark_02 extends xScorch;

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
    ProjTexture=FinalBlend'FX_TEX.Event_Cash_Gacha.FB_easter_B_explo_mark_01'
    bClipStaticMesh=true
    CullDistance=3000.0000000
    LifeSpan=10.0000000
    DrawScale=2.5999999
}