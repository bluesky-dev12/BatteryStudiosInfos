/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\FX_WeaponLocker.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class FX_WeaponLocker extends Emitter;

function TurnOff(float t)
{
    bHidden = true;
    SetTimer(30.0, false);
}

function Timer()
{
    bHidden = false;
}

simulated function NotifyLocalPlayerDead(PlayerController PC)
{
    bHidden = false;
}

defaultproperties
{
    CullDistance=7000.0
    bNoDelete=true
}