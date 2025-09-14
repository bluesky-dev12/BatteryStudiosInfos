class wTelegraphPack_Heli extends wTelegraphPack;

simulated function bool UseWeapon()
{
    return Instigator.Controller.ActivateSupplyItem(Instigator.Controller, 2);
    //return;    
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.RemoveSupplyItem(2);
    Destroy();
    //return;    
}

defaultproperties
{
    InventoryGroup=6
}