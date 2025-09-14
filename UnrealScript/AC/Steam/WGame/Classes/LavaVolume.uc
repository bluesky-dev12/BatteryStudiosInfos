/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\LavaVolume.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class LavaVolume extends PhysicsVolume;

defaultproperties
{
    DamagePerSec=40.0
    DamageType=Class'Engine.FellLava'
    FluidFriction=4.0
    ViewFog=(X=0.5859380,Y=0.1953130,Z=0.0781250)
    bPainCausing=true
    bDestructive=true
    bNoInventory=true
    KExtraLinearDamping=0.80
    KExtraAngularDamping=0.10
    LocationName="???"
    RemoteRole=0
}