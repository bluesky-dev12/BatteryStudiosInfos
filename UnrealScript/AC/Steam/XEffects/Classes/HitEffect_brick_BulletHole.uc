/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HitEffect_brick_BulletHole.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class HitEffect_brick_BulletHole extends xScorch;

function PostBeginPlay()
{
    // End:0x18
    if(FRand() < 0.750)
    {
        LifeSpan *= 1.50;
    }
    super.PostBeginPlay();
}

defaultproperties
{
    FrameBufferBlendingOp=2
    ProjTexture=FinalBlend'FX_TEX.Hit_BulletHole.PB_brick_BulletHole'
    bClipStaticMesh=true
    CullDistance=10000.0
    LifeSpan=15.0
    DrawScale=0.30
}