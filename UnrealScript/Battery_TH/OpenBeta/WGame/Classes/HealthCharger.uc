class HealthCharger extends wPickUpBase;

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0000000, 0.0000000, -4.0000000));
    //return;    
}

defaultproperties
{
    PowerUp=Class'XPickups.HealthPack'
    SpawnHeight=45.0000000
    NewPrePivot=(X=0.0000000,Y=0.0000000,Z=2.5000000)
    NewDrawScale=0.4500000
    DrawType=8
    Texture=none
    DrawScale=0.5000000
}