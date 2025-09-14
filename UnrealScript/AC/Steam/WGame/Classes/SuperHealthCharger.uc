/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SuperHealthCharger.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SuperHealthCharger extends wPickUpBase;

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0, 0.0, -1.0));
}

defaultproperties
{
    PowerUp=Class'XPickups.SuperHealthPack'
    SpawnHeight=60.0
    bDelayedSpawn=true
    NewPrePivot=(X=0.0,Y=0.0,Z=2.750)
    NewDrawScale=0.70
    DrawType=8
    Texture=none
    DrawScale=0.80
}