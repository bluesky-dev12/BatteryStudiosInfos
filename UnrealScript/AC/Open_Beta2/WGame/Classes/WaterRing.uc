class WaterRing extends Emitter;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    //return;    
}

defaultproperties
{
    AutoDestroy=true
    bNoDelete=false
    bHighDetail=true
}