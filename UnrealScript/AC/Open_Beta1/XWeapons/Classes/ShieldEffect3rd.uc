class ShieldEffect3rd extends AimedAttachment;

var float Brightness;
var float DesiredBrightness;
var int HitCount;
var int OldHitCount;
var ShieldSparks Sparks;

replication
{
    // Pos:0x000
    reliable if((int(Role) == int(ROLE_Authority)) && !bHidden)
        HitCount;
}

simulated function Destroyed()
{
    // End:0x17
    if(Sparks != none)
    {
        Sparks.Destroy();
    }
    //return;    
}

simulated function Flash(int Drain)
{
    // End:0xEE
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x32
        if(Sparks == none)
        {
            Sparks = Spawn(Class'XEffects.ShieldSparks');
        }
        // End:0xA1
        if((Instigator != none) && Instigator.IsFirstPerson())
        {
            Sparks.SetLocation((Location + vect(0.0000000, 0.0000000, 20.0000000)) + (VRand() * 12.0000000));
            Sparks.SetRotation(Rotation);
            Sparks.mStartParticles = 16;            
        }
        else
        {
            // End:0xEE
            if(EffectIsRelevant(Location, false))
            {
                Sparks.SetLocation(Location + (VRand() * 8.0000000));
                Sparks.SetRotation(Rotation);
                Sparks.mStartParticles = 16;
            }
        }
    }
    Brightness = FMin(Brightness + float(Drain / 2), 250.0000000);
    Skins[0] = Skins[1];
    SetTimer(0.2000000, false);
    //return;    
}

simulated function Timer()
{
    Skins[0] = default.Skins[0];
    //return;    
}

function SetBrightness(int B, bool Hit)
{
    DesiredBrightness = FMin(50.0000000 + float(B * 2), 250.0000000);
    // End:0x37
    if(Hit)
    {
        HitCount++;
        Flash(50);
    }
    //return;    
}

simulated function PostNetReceive()
{
    // End:0x1D
    if(OldHitCount == -1)
    {
        OldHitCount = HitCount;        
    }
    else
    {
        // End:0x3F
        if(HitCount != OldHitCount)
        {
            Flash(50);
            OldHitCount = HitCount;
        }
    }
    //return;    
}

defaultproperties
{
    Brightness=250.0000000
    DesiredBrightness=250.0000000
    OldHitCount=-1
    BaseOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
    AimedOffset=(X=28.0000000,Y=28.0000000,Z=34.0000000)
    DownwardBias=16.0000000
    DrawType=8
    bHidden=true
    bReplicateInstigator=true
    Physics=10
    RemoteRole=2
    DrawScale=3.2000000
    AmbientGlow=250
    bUnlit=true
    bOwnerNoSee=true
    bNetNotify=true
}