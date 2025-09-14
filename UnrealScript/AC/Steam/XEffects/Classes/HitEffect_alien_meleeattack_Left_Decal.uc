/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HitEffect_alien_meleeattack_Left_Decal.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class HitEffect_alien_meleeattack_Left_Decal extends xScorch;

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
    ProjTexture=FinalBlend'FX_TEX.Hit_BulletHole.FB_alien_meleeattack_decal_left'
    bClipStaticMesh=true
    CullDistance=2000.0
    LifeSpan=1.0
    DrawScale=0.180
}