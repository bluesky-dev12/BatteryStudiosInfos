class ShieldCharger extends wPickUpBase;

function PostBeginPlay()
{
    // End:0x66
    if((Level.Title ~= "IronDeity") && Name == 'ShieldCharger0')
    {
        SpawnHeight = 130.0000000;
        super.PostBeginPlay();
        // End:0x64
        if(myPickUp != none)
        {
            myPickUp.PrePivot.Z = 85.0000000;
        }
        return;
    }
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0000000, 0.0000000, -2.0000000));
    //return;    
}

defaultproperties
{
    PowerUp=Class'XPickups.ShieldPack'
    SpawnHeight=45.0000000
    bDelayedSpawn=true
    DrawType=8
    Texture=none
    DrawScale=0.7000000
}