class wTelegraphPack_UAV extends wTelegraphPack;

simulated function bool UseWeapon()
{
    return Instigator.Controller.ActivateSupplyItem(Instigator.Controller, 1);
    //return;    
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.RemoveSupplyItem(1);
    Destroy();
    //return;    
}

defaultproperties
{
    InventoryGroup=6
}