class BloodHit_spurt_Alien extends BloodSpurt;

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    //return;    
}

simulated function WallSplat()
{
    local Vector WallHit, WallNormal;
    local Actor WallActor;

    // End:0x0D
    if(BloodDecalClass == none)
    {
        return;
    }
    // End:0x5D
    if(HitDir == vect(0.0000000, 0.0000000, 0.0000000))
    {
        // End:0x4D
        if(Owner != none)
        {
            HitDir = Location - Owner.Location;            
        }
        else
        {
            HitDir.Z = -1.0000000;
        }
    }
    HitDir = Normal(HitDir);
    WallActor = Trace(WallHit, WallNormal, Location + (float(350) * HitDir), Location, false);
    // End:0xCC
    if(WallActor != none)
    {
        Spawn(BloodDecalClass,,, WallHit + (float(20) * (WallNormal + VRand())), Rotator(-WallNormal));
    }
    Spawn(Class'XEffects_Decompressed.HitEffect_blood_spurt_Alien');
    //return;    
}
