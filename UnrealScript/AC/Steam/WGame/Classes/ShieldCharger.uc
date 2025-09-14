/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\ShieldCharger.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ShieldCharger extends wPickUpBase;

function PostBeginPlay()
{
    // End:0x66
    if(Level.Title ~= "IronDeity" && Name == 'ShieldCharger0')
    {
        SpawnHeight = 130.0;
        super.PostBeginPlay();
        // End:0x64
        if(myPickUp != none)
        {
            myPickUp.PrePivot.Z = 85.0;
        }
        return;
    }
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0, 0.0, -2.0));
}

defaultproperties
{
    PowerUp=Class'XPickups.ShieldPack'
    SpawnHeight=45.0
    bDelayedSpawn=true
    DrawType=8
    Texture=none
    DrawScale=0.70
}