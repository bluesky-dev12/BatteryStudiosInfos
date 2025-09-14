/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\BloodSpurt_Alien_Eta.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:3
 *
 *******************************************************************************/
class BloodSpurt_Alien_Eta extends wEmitter;

var class<Actor> BloodDecalClass;
var Texture Splats[4];
var Vector HitDir;
var bool bMustShow;
var class<Actor> HitEffectClass;

replication
{
    // Pos:0x00
    reliable if(bNetInitial && Role == 4)
        HitDir, bMustShow;

}

simulated function PostNetBeginPlay()
{
    // End:0x22
    if(Level.NetMode != 1)
    {
        WallSplat();
    }
    // End:0x2d
    else
    {
        LifeSpan = 0.20;
    }
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
    Spawn(HitEffectClass);
}

static function PrecacheContent(LevelInfo Level)
{
    local int i;

    super.PrecacheContent(Level);
    // End:0x4d
    if(default.BloodDecalClass != none)
    {
        i = 0;
        J0x1d:
        // End:0x4d [While If]
        if(i < 3)
        {
            Level.AddPrecacheMaterial(default.Splats[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1d;
        }
    }
}

defaultproperties
{
    BloodDecalClass=class'BloodSplatter_Alien_Eta'
    Splats[0]=Texture'FX_TEX.Hit_Effects.BloodDrip1_Alien'
    Splats[1]=Texture'FX_TEX.Hit_Effects.BloodDrip2_Alien'
    Splats[2]=Texture'FX_TEX.Hit_Effects.BloodDrip3_Alien'
    Splats[3]=Texture'FX_TEX.Hit_Effects.BloodDrip4_Alien'
    HitEffectClass=class'HitEffect_blood_Alien_Eta'
    mRegen=true
    mStartParticles=0
    mMaxParticles=0
    mLifeRange[0]=1.0
    mLifeRange[1]=2.0
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mDirDev=(X=0.10,Y=0.10,Z=0.10)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=85.0
    mMassRange[0]=0.020
    mMassRange[1]=0.040
    mAirResistance=0.60
    mRandOrient=true
    mSizeRange[0]=3.50
    mSizeRange[1]=5.0
    mGrowthRate=3.0
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    bOnlyRelevantToOwner=true
    RemoteRole=2
    LifeSpan=5.50
    DrawScale=1.60
    Skins=// Object reference not set to an instance of an object.
    
    Style=5
}