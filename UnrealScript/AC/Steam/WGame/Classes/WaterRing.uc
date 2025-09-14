/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\WaterRing.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class WaterRing extends Emitter;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
}

defaultproperties
{
    AutoDestroy=true
    bNoDelete=true
    bHighDetail=true
}