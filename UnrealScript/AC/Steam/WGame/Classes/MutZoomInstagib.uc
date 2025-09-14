/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutZoomInstagib.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class MutZoomInstagib extends MutInstaGib
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

function bool MutatorIsAllowed()
{
    return true;
}

defaultproperties
{
    WeaponName=ZoomSuperShockRifle
    WeaponString="xWeapons.ZoomSuperShockRifle"
    bAllowTranslocator=true
    DefaultWeaponName="xWeapons.ZoomSuperShockRifle"
    FriendlyName="? ????"
    Description="????? ???? ??? ??? ? ???, ???? ??? ?? ?? ???? ???? ???."
}