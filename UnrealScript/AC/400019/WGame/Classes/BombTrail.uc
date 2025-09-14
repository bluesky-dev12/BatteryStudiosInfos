class BombTrail extends SpeedTrail;

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x15
    if(bNetNotify)
    {
        PostNetReceive();
    }
    //return;    
}

simulated event PostNetReceive()
{
    local Actor OldBase;

    // End:0x4A
    if(Base != none)
    {
        OldBase = Base;
        SetLocation(Base.Location);
        SetBase(OldBase);
        SetRelativeLocation(vect(0.0000000, 0.0000000, 0.0000000));
        bNetNotify = false;
    }
    //return;    
}

defaultproperties
{
    mDirDev=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    mPosDev=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    bHardAttach=true
    bNetNotify=true
}