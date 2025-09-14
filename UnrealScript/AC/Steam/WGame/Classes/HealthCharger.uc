/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\HealthCharger.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class HealthCharger extends wPickUpBase;

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0, 0.0, -4.0));
}

defaultproperties
{
    PowerUp=Class'XPickups.HealthPack'
    SpawnHeight=45.0
    NewPrePivot=(X=0.0,Y=0.0,Z=2.50)
    NewDrawScale=0.450
    DrawType=8
    Texture=none
    DrawScale=0.50
}