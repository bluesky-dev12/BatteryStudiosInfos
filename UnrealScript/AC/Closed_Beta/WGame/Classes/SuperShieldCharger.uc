class SuperShieldCharger extends wPickUpBase;

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0000000, 0.0000000, -1.0000000));
    //return;    
}

defaultproperties
{
    PowerUp=Class'XPickups.SuperShieldPack'
    SpawnHeight=60.0000000
    bDelayedSpawn=true
    DrawType=8
    Texture=none
    DrawScale=0.8000000
}