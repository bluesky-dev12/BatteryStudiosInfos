/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wFallingVolume.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wFallingVolume extends PhysicsVolume;

defaultproperties
{
    DamagePerSec=100.0
    DamageType=Class'Engine.fell'
    ViewFog=(X=0.5859380,Y=0.1953130,Z=0.0781250)
    bPainCausing=true
    bDestructive=true
    bNoInventory=true
    LocationName="??"
}