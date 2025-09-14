/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\ShieldEffect3rd.uc
 * Package Imports:
 *	XWeapons
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:5
 *
 *******************************************************************************/
class ShieldEffect3rd extends AimedAttachment;

var float Brightness;
var float DesiredBrightness;
var int HitCount;
var int OldHitCount;
var ShieldSparks Sparks;

replication
{
    // Pos:0x00
    reliable if(Role == 4 && !bHidden)
        HitCount;

}

simulated function Destroyed()
{
    // End:0x17
    if(Sparks != none)
    {
        Sparks.Destroy();
    }
}

simulated function Flash(int Drain)
{
    // End:0xee
    if(Level.NetMode != 1)
    {
        // End:0x32
        if(Sparks == none)
        {
            Sparks = Spawn(class'ShieldSparks');
        }
        // End:0xa1
        if(Instigator != none && Instigator.IsFirstPerson())
        {
            Sparks.SetLocation(Location + vect(0.0, 0.0, 20.0) + VRand() * 12.0);
            Sparks.SetRotation(Rotation);
            Sparks.mStartParticles = 16;
        }
        // End:0xee
        else
        {
            // End:0xee
            if(EffectIsRelevant(Location, false))
            {
                Sparks.SetLocation(Location + VRand() * 8.0);
                Sparks.SetRotation(Rotation);
                Sparks.mStartParticles = 16;
            }
        }
    }
    Brightness = FMin(Brightness + float(Drain / 2), 250.0);
    Skins[0] = Skins[1];
    SetTimer(0.20, false);
}

simulated function Timer()
{
    Skins[0] = default.Skins[0];
}

function SetBrightness(int B, bool Hit)
{
    DesiredBrightness = FMin(50.0 + float(B * 2), 250.0);
    // End:0x37
    if(Hit)
    {
        ++ HitCount;
        Flash(50);
    }
}

simulated function PostNetReceive()
{
    // End:0x1d
    if(OldHitCount == -1)
    {
        OldHitCount = HitCount;
    }
    // End:0x3f
    else
    {
        // End:0x3f
        if(HitCount != OldHitCount)
        {
            Flash(50);
            OldHitCount = HitCount;
        }
    }
}

defaultproperties
{
    Brightness=250.0
    DesiredBrightness=250.0
    OldHitCount=-1
    BaseOffset=(X=0.0,Y=0.0,Z=10.0)
    AimedOffset=(X=28.0,Y=28.0,Z=34.0)
    DownwardBias=16.0
    DrawType=8
    bHidden=true
    bReplicateInstigator=true
    Physics=10
    RemoteRole=2
    DrawScale=3.20
    AmbientGlow=250
    bUnlit=true
    bOwnerNoSee=true
    bNetNotify=true
}