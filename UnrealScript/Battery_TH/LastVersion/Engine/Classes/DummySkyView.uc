class DummySkyView extends Actor
    placeable;

event PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    Level.SkyViewLocation = Location;
    Destroy();
    //return;    
}
