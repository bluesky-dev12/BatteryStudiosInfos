class wTelegraphPack_Heli extends wTelegraphPack;

simulated function bool UseWeapon()
{
    return Instigator.Controller.CallHelicopter();
    //return;    
}

simulated function UsedWeapon()
{
    Instigator.Controller.SkillBase.UseSupplyItem(1);
    //return;    
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.UseSupplyItem(1);
    Destroy();
    //return;    
}

defaultproperties
{
    InventoryGroup=6
}