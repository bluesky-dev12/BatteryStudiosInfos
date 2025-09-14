class wTelegraphPack_AirStrike extends wTelegraphPack;

simulated function bool UseWeapon()
{
    return Instigator.Controller.ActivateSupplyItem(Instigator.Controller, 3);
    //return;    
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.RemoveSupplyItem(3);
    Destroy();
    //return;    
}

defaultproperties
{
    InventoryGroup=6
}