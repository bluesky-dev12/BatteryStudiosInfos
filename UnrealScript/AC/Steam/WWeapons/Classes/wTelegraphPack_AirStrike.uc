/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wTelegraphPack_AirStrike.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class wTelegraphPack_AirStrike extends wTelegraphPack;

simulated function bool UseWeapon()
{
    return Instigator.Controller.CallAirFire();
}

simulated function UsedWeapon()
{
    super.UsedWeapon();
    wPlayer(Instigator.Controller).ServerCallAirStrike();
    Instigator.Controller.SkillBase.UseSupplyItem(0);
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.UseSupplyItem(0);
    Destroy();
}

defaultproperties
{
    InventoryGroup=6
}