class wMeleeAttachment extends wWeaponAttachment;

function UpdatePenetrateHit(Actor mHitActor[6], Vector mHitLocation[6], Vector mHitNormal[6], Material mHitMaterial[6], int mLastHitIdx)
{
    local int i, Max;
    local stMultiBulletPerFire stTemp;

    super.UpdatePenetrateHit(mHitActor, mHitLocation, mHitNormal, mHitMaterial, 0);
    LastHitIdx = mLastHitIdx;
    stTemp.mLastHitIdx = mLastHitIdx;
    vEffLocation[0] = mHitLocation[0];
    HitActor[0] = mHitActor[0];
    HitNormal[0] = mHitNormal[0];
    HitMaterial[0] = mHitMaterial[0];
    stTemp.mvEffLocation[0] = vEffLocation[0];
    stTemp.mHitActor[0] = HitActor[0];
    stTemp.mHitNormal[0] = mHitNormal[0];
    stTemp.mHitMaterial[0] = HitMaterial[0];
    RepEffectLocation[0] = vEffLocation[0];
    stMBPF[0] = stTemp;
    //return;    
}

simulated event ThirdPersonEffects()
{
    // End:0x1A8
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x76
        if((int(FiringMode) == 0) || int(FiringMode) == 2)
        {
            // End:0x76
            if(int(OldSpawnHitCount) != int(SpawnHitCount))
            {
                // End:0x76
                if(int(FlashCount) == 0)
                {
                    OldSpawnHitCount = SpawnHitCount;
                    Instigator.MakeFireNoise();
                    MakeMeleeHitEffect();
                }
            }
        }
        // End:0x108
        if(wPawn(Instigator) != none)
        {
            // End:0xAA
            if(int(FlashCount) == 0)
            {
                wPawn(Instigator).StopFiring();                
            }
            else
            {
                // End:0xDA
                if(int(FiringMode) == 0)
                {
                    wPawn(Instigator).StartFiring(bHeavy, bRapidFire);                    
                }
                else
                {
                    // End:0x105
                    if(int(FiringMode) == 2)
                    {
                        wPawn(Instigator).PlayMelee(bMeleeKnifeOrButt);                        
                    }
                }
            }            
        }
        else
        {
            // End:0x1A6
            if((Vehicle(Instigator) != none) && Vehicle(Instigator).Driver != none)
            {
                // End:0x165
                if(int(FlashCount) == 0)
                {
                    wPawn(Vehicle(Instigator).Driver).StopFiring();                    
                }
                else
                {
                    // End:0x1A3
                    if(int(FiringMode) == 0)
                    {
                        wPawn(Vehicle(Instigator).Driver).StartFiring(bHeavy, bRapidFire);                        
                    }
                }                
            }
            else
            {
                return;
            }
        }
    }
    //return;    
}

defaultproperties
{
    AttachmentBone="lefthand"
}