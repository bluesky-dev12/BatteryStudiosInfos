/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SuperShieldCharger.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SuperShieldCharger extends wPickUpBase;

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0, 0.0, -1.0));
}

defaultproperties
{
    PowerUp=Class'XPickups.SuperShieldPack'
    SpawnHeight=60.0
    bDelayedSpawn=true
    DrawType=8
    Texture=none
    DrawScale=0.80
}