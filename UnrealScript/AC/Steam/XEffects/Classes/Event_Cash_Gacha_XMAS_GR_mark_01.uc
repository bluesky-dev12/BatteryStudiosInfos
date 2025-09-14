/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\Event_Cash_Gacha_XMAS_GR_mark_01.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Event_Cash_Gacha_XMAS_GR_mark_01 extends xScorch;

function PostBeginPlay()
{
    // End:0x18
    if(FRand() < 0.750)
    {
        LifeSpan *= 3.50;
    }
    super.PostBeginPlay();
}

defaultproperties
{
    FrameBufferBlendingOp=2
    ProjTexture=FinalBlend'FX_TEX.Event_Cash_Gacha.FB_XMAs_explosion_mark_01'
    bClipStaticMesh=true
    CullDistance=3000.0
    LifeSpan=10.0
    DrawScale=4.30
}