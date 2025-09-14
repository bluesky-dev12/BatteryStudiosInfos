class wSeekingRocket extends wRocket;

var Actor Seeking;
var Vector InitialDir;

replication
{
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        InitialDir, Seeking;
}

simulated function Timer()
{
    local Vector ForceDir;
    local float VelMag;

    // End:0x24
    if(InitialDir == vect(0.0000000, 0.0000000, 0.0000000))
    {
        InitialDir = Normal(Velocity);
    }
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super(Actor).Timer();
    // End:0x125
    if((Seeking != none) && Seeking != Instigator)
    {
        ForceDir = Normal(Seeking.Location - Location);
        // End:0x11B
        if((ForceDir Dot InitialDir) > float(0))
        {
            VelMag = VSize(Velocity);
            // End:0xD5
            if(int(Seeking.Physics) == int(13))
            {
                ForceDir = Normal(((ForceDir * 0.8000000) * VelMag) + Velocity);                
            }
            else
            {
                ForceDir = Normal(((ForceDir * 0.5000000) * VelMag) + Velocity);
            }
            Velocity = VelMag * ForceDir;
            Acceleration += (float(5) * ForceDir);
        }
        SetRotation(Rotator(Velocity));
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super(wProjectile).PostBeginPlay();
    SetTimer(0.1000000, true);
    //return;    
}

defaultproperties
{
    iWeaponID=5011
}