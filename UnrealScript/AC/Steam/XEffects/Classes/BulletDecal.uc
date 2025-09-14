/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\BulletDecal.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class BulletDecal extends xScorch;

function PostBeginPlay()
{
    // End:0x18
    if(FRand() < 0.750)
    {
        LifeSpan *= 0.50;
    }
    super.PostBeginPlay();
}

defaultproperties
{
    RandomOrient=true
    ProjTexture=Texture'bulletpock'
    bClipStaticMesh=true
    CullDistance=3000.0
    bHighDetail=true
    LifeSpan=3.20
    DrawScale=0.180
}