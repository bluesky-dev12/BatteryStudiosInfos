/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wTelegraphPack_Heli.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class wTelegraphPack_Heli extends wTelegraphPack;

simulated function bool UseWeapon()
{
    return Instigator.Controller.CallHelicopter();
}

simulated function UsedWeapon()
{
    super.UsedWeapon();
    Instigator.Controller.SkillBase.UseSupplyItem(1);
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.UseSupplyItem(1);
    Destroy();
}

defaultproperties
{
    InventoryGroup=6
}