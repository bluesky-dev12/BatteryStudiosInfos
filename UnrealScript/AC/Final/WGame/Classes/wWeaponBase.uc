class wWeaponBase extends wPickUpBase;

var() Class<wWeapon> WeaponType;

function bool CheckForErrors()
{
    // End:0x47
    if((WeaponType == none) || WeaponType.static.ShouldBeHidden())
    {
        Log((string(self) $ " ILLEGAL WEAPONTYPE ") $ string(WeaponType));
        return true;
    }
    return super.CheckForErrors();
    //return;    
}

function byte GetInventoryGroup()
{
    // End:0x1A
    if(WeaponType != none)
    {
        return WeaponType.default.InventoryGroup;
    }
    return byte(999);
    //return;    
}

simulated function PostBeginPlay()
{
    // End:0x3D
    if(WeaponType != none)
    {
        PowerUp = WeaponType.default.PickupClass;
        // End:0x3D
        if(int(WeaponType.default.InventoryGroup) == 0)
        {
            bDelayedSpawn = true;
        }
    }
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0000000, 0.0000000, -2.0000000));
    //return;    
}

defaultproperties
{
    SpiralEmitter=Class'XEffects.Spiral'
    NewPrePivot=(X=0.0000000,Y=0.0000000,Z=3.7000000)
    NewDrawScale=0.5000000
    DrawType=8
    Texture=none
    DrawScale=0.5000000
    CollisionRadius=60.0000000
    CollisionHeight=3.0000000
}