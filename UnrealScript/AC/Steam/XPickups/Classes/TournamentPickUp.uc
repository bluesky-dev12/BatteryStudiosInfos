/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\TournamentPickUp.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class TournamentPickUp extends Pickup;

function RespawnEffect()
{
    Spawn(class'PlayerSpawnEffect');
}

defaultproperties
{
    bAmbientGlow=true
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}