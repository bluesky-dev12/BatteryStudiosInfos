/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\RocketMark.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class RocketMark extends xScorch;

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
    ProjTexture=FinalBlend'FX_TEX.Hit_BulletHole.PB_explosion_mark'
    bClipStaticMesh=true
    CullDistance=3000.0
    LifeSpan=10.0
    DrawScale=4.30
}