/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wTelegraphPack_UAV.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class wTelegraphPack_UAV extends wTelegraphPack;

simulated function bool UseWeapon()
{
    Instigator.Controller.CallUAV();
    Instigator.Controller.ServerUAV();
    return true;
}

simulated function UsedWeapon()
{
    super.UsedWeapon();
    Instigator.Controller.SkillBase.UseSupplyItem(2);
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.UseSupplyItem(2);
    Destroy();
}

defaultproperties
{
    InventoryGroup=6
}