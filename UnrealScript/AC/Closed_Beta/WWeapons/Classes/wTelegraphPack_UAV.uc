class wTelegraphPack_UAV extends wTelegraphPack;

simulated function bool UseWeapon()
{
    Instigator.Controller.CallUAV();
    Instigator.Controller.ServerUAV();
    return true;
    //return;    
}

simulated function UsedWeapon()
{
    super.UsedWeapon();
    Instigator.Controller.SkillBase.UseSupplyItem(2);
    //return;    
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.UseSupplyItem(2);
    Destroy();
    //return;    
}

defaultproperties
{
    InventoryGroup=6
}