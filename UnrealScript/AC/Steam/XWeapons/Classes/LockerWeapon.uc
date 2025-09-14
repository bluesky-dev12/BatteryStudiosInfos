/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\LockerWeapon.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class LockerWeapon extends Emitter;

simulated function Reset();

defaultproperties
{
    CullDistance=7000.0
    bNoDelete=true
    bDeferRendering=true
    bUnlit=true
}