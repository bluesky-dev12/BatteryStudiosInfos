/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wWeaponBase.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class wWeaponBase extends wPickUpBase;

var() class<wWeapon> WeaponType;

function bool CheckForErrors()
{
    // End:0x47
    if(WeaponType == none || WeaponType.static.ShouldBeHidden())
    {
        Log(string(self) $ " ILLEGAL WEAPONTYPE " $ string(WeaponType));
        return true;
    }
    return super.CheckForErrors();
}

function byte GetInventoryGroup()
{
    // End:0x1a
    if(WeaponType != none)
    {
        return WeaponType.default.InventoryGroup;
    }
    return byte(999);
}

simulated function PostBeginPlay()
{
    // End:0x3d
    if(WeaponType != none)
    {
        PowerUp = WeaponType.default.PickupClass;
        // End:0x3d
        if(WeaponType.default.InventoryGroup == 0)
        {
            bDelayedSpawn = true;
        }
    }
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0, 0.0, -2.0));
}

defaultproperties
{
    SpiralEmitter=Class'XEffects.Spiral'
    NewPrePivot=(X=0.0,Y=0.0,Z=3.70)
    NewDrawScale=0.50
    DrawType=8
    Texture=none
    DrawScale=0.50
    CollisionRadius=60.0
    CollisionHeight=3.0
}