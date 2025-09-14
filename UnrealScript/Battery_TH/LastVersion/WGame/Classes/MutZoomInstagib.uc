class MutZoomInstagib extends MutInstaGib
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool MutatorIsAllowed()
{
    return true;
    //return;    
}

defaultproperties
{
    WeaponName="ZoomSuperShockRifle"
    WeaponString="xWeapons.ZoomSuperShockRifle"
    bAllowTranslocator=true
    DefaultWeaponName="xWeapons.ZoomSuperShockRifle"
    FriendlyName="? ????"
    Description="????? ???? ??? ??? ? ???, ???? ??? ?? ?? ???? ???? ???."
}