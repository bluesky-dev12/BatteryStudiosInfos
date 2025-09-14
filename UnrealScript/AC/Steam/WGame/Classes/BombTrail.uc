/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\BombTrail.uc
 * Package Imports:
 *	WGame
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class BombTrail extends SpeedTrail;

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x15
    if(bNetNotify)
    {
        PostNetReceive();
    }
}

simulated event PostNetReceive()
{
    local Actor OldBase;

    // End:0x4a
    if(Base != none)
    {
        OldBase = Base;
        SetLocation(Base.Location);
        SetBase(OldBase);
        SetRelativeLocation(vect(0.0, 0.0, 0.0));
        bNetNotify = false;
    }
}

defaultproperties
{
    mDirDev=(X=0.0,Y=0.0,Z=0.0)
    mPosDev=(X=0.0,Y=0.0,Z=0.0)
    bHardAttach=true
    bNetNotify=true
}