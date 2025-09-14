class BloodSpurt_Alien_Kappa extends wEmitter;

var Class<Actor> BloodDecalClass;
var Texture Splats[4];
var Vector HitDir;
var bool bMustShow;
var Class<Actor> HitEffectClass;

replication
{
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        HitDir, bMustShow;
}

simulated function PostNetBeginPlay()
{
    // End:0x22
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        WallSplat();        
    }
    else
    {
        LifeSpan = 0.2000000;
    }
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
    Spawn(HitEffectClass);
    //return;    
}

static function PrecacheContent(LevelInfo Level)
{
    local int i;

    super.PrecacheContent(Level);
    // End:0x4D
    if(default.BloodDecalClass != none)
    {
        i = 0;
        J0x1D:

        // End:0x4D [Loop If]
        if(i < 3)
        {
            Level.AddPrecacheMaterial(default.Splats[i]);
            i++;
            // [Loop Continue]
            goto J0x1D;
        }
    }
    //return;    
}

defaultproperties
{
    BloodDecalClass=Class'XEffects_Decompressed.BloodSplatter_Alien_Gamma'
    Splats[0]=Texture'FX_TEX.Hit_Effects.BloodDrip1_Alien'
    Splats[1]=Texture'FX_TEX.Hit_Effects.BloodDrip2_Alien'
    Splats[2]=Texture'FX_TEX.Hit_Effects.BloodDrip3_Alien'
    Splats[3]=Texture'FX_TEX.Hit_Effects.BloodDrip4_Alien'
    HitEffectClass=Class'XEffects_Decompressed.HitEffect_blood_Alien_Kappa'
    mRegen=false
    mStartParticles=0
    mMaxParticles=0
    mLifeRange[0]=1.0000000
    mLifeRange[1]=2.0000000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mDirDev=(X=0.1000000,Y=0.1000000,Z=0.1000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=85.0000000
    mMassRange[0]=0.0200000
    mMassRange[1]=0.0400000
    mAirResistance=0.6000000
    mRandOrient=true
    mSizeRange[0]=3.5000000
    mSizeRange[1]=5.0000000
    mGrowthRate=3.0000000
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    bOnlyRelevantToOwner=true
    RemoteRole=2
    LifeSpan=5.5000000
    DrawScale=1.8000000
    Skins[0]=Texture'FX_TEX.Hit_Effects.Blood_splatter_alien'
    Style=5
}