/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\PlayerSpawnEffect.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class PlayerSpawnEffect extends Emitter;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2d
    if(Level.NetMode == 1)
    {
        LifeSpan = 0.150;
    }
    // End:0x5e
    else
    {
        // End:0x5e
        if(Level.GetLocalPlayerController().BeyondViewDistance(Location, CullDistance))
        {
            LifeSpan = 0.010;
        }
    }
}

defaultproperties
{
    AutoDestroy=true
    CullDistance=6500.0
    bNoDelete=true
    bNetTemporary=true
    RemoteRole=1
}