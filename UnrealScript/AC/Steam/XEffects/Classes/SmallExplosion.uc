/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\SmallExplosion.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SmallExplosion extends RocketExplosion;

function PostBeginPlay();

defaultproperties
{
    mSizeRange[0]=20.0
    mSizeRange[1]=40.0
    LightType=0
    bDynamicLight=true
}