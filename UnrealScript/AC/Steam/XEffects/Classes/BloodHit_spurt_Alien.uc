/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\BloodHit_spurt_Alien.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class BloodHit_spurt_Alien extends BloodSpurt;

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
}

simulated function WallSplat()
{
    local Vector WallHit, WallNormal;
    local Actor WallActor;

    // End:0x0d
    if(BloodDecalClass == none)
    {
        return;
    }
    // End:0x5d
    if(HitDir == vect(0.0, 0.0, 0.0))
    {
        // End:0x4d
        if(Owner != none)
        {
            HitDir = Location - Owner.Location;
        }
        // End:0x5d
        else
        {
            HitDir.Z = -1.0;
        }
    }
    HitDir = Normal(HitDir);
    WallActor = Trace(WallHit, WallNormal, Location + float(350) * HitDir, Location, false);
    // End:0xcc
    if(WallActor != none)
    {
        Spawn(BloodDecalClass,,, WallHit + float(20) * WallNormal + VRand(), rotator(-WallNormal));
    }
    Spawn(class'HitEffect_blood_spurt_Alien');
}
