/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTurret_FNM240_DF.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wTurret_FNM240_DF extends wTurret_FNM240;

function Reset()
{
    DamageInfo.Length = 0;
}

defaultproperties
{
    DefaultWeaponClassName="wWeapons.wWeapon_Turret_FNM240_DF"
}