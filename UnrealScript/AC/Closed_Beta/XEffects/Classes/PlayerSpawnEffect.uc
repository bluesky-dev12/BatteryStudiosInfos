class PlayerSpawnEffect extends Emitter;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2D
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        LifeSpan = 0.1500000;        
    }
    else
    {
        // End:0x5E
        if(Level.GetLocalPlayerController().BeyondViewDistance(Location, CullDistance))
        {
            LifeSpan = 0.0100000;
        }
    }
    //return;    
}

defaultproperties
{
    AutoDestroy=true
    CullDistance=6500.0000000
    bNoDelete=false
    bNetTemporary=true
    RemoteRole=1
}