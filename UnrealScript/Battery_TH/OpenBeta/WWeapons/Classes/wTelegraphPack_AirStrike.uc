class wTelegraphPack_AirStrike extends wTelegraphPack;

simulated function bool UseWeapon()
{
    return Instigator.Controller.CallAirFire();
    //return;    
}

simulated function UsedWeapon()
{
    super.UsedWeapon();
    wPlayer(Instigator.Controller).ServerCallAirStrike();
    Instigator.Controller.SkillBase.UseSupplyItem(0);
    //return;    
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.UseSupplyItem(0);
    Destroy();
    //return;    
}

defaultproperties
{
    InventoryGroup=5
}