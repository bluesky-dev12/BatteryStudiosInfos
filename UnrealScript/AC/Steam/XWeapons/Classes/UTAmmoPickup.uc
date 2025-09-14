/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\UTAmmoPickup.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UTAmmoPickup extends Ammo;

function RespawnEffect()
{
    Spawn(class'PlayerSpawnEffect');
}

defaultproperties
{
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}