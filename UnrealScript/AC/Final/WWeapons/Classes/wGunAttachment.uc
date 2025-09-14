class wGunAttachment extends wWeaponAttachment;

var Class<wEmitter> mMuzFlashClass;
var wEmitter mMuzFlash3rd;
var Class<Emitter> mMuzFlashEmitterClass;
var Class<wEmitter> mSmokeClass;
var wEmitter mSmoke3rd;
var Class<Emitter> mSmokeEmitterClass;
var Class<wEmitter> mSilencerSmokeClass;
var wEmitter mSilencerSmoke3rd;
var Class<Emitter> mSilencerSmokeEmitterClass;
var Class<wEmitter> mShellCaseEmitterClass;
var wEmitter mShellCaseEmitter;
var Class<Emitter> mTracerClass;
var() editinline Emitter mTracer;
var() editinline Emitter marrTracer[10];
var() float mTracerPullback;
var() float mTracerMinDistance;
var() float mTracerSpeed;
var Vector mOldHitLocation;
var wSkinShell wParts[3];
var float fPartsCullDistance;
var byte iSelfTraceCount;
var bool bAttachSilencer;
var bool bModMuzFlash;
var string strModMuzFlashClass;

simulated function Destroyed()
{
    local int i;

    // End:0x17
    if(mTracer != none)
    {
        mTracer.Destroy();
    }
    i = 0;
    J0x1E:

    // End:0x57 [Loop If]
    if(i < 10)
    {
        // End:0x4D
        if(marrTracer[i] != none)
        {
            marrTracer[i].Destroy();
        }
        i++;
        // [Loop Continue]
        goto J0x1E;
    }
    // End:0x6E
    if(mMuzFlash3rd != none)
    {
        mMuzFlash3rd.Destroy();
    }
    // End:0x85
    if(mSmoke3rd != none)
    {
        mSmoke3rd.Destroy();
    }
    // End:0x9C
    if(mShellCaseEmitter != none)
    {
        mShellCaseEmitter.Destroy();
    }
    ClearParts();
    super(WeaponAttachment).Destroyed();
    //return;    
}

simulated function Vector GetTracerStart()
{
    local Pawn P;

    // End:0x11
    if(Owner == none)
    {
        return Location;
    }
    P = Pawn(Owner);
    // End:0x6F
    if(((P != none) && P.IsFirstPerson()) && P.Weapon != none)
    {
        return P.Weapon.GetEffectStart();
    }
    // End:0x8C
    if(mMuzFlash3rd != none)
    {
        return mMuzFlash3rd.Location;        
    }
    else
    {
        return Location;
    }
    //return;    
}

simulated function UpdateTracer()
{
    local Vector SpawnLoc, SpawnDir, spawnVel;
    local float hitDist;
    local int i;
    local Rotator LookDir;
    local Vector lookVect, vInverseWeaponByOwner, vWeaponByOwner, vOriginSpawnLoc;
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x4A
    if((Instigator.Controller == PC) && int(PC.Role) < int(ROLE_Authority))
    {
        return;
    }
    i = 0;
    J0x51:

    // End:0x4E5 [Loop If]
    if(i < 10)
    {
        // End:0xB5
        if(((stMBPF[i].mLastHitIdx < 0) || stMBPF[i].mHitActor[stMBPF[i].mLastHitIdx] == none) || FRand() >= ResParams.default.fTracerPop)
        {
            return;
        }
        // End:0xD0
        if(int(Level.NetMode) == int(NM_DedicatedServer))
        {
            return;
        }
        // End:0xF5
        if(marrTracer[i] == none)
        {
            marrTracer[i] = Spawn(mTracerClass);
        }
        // End:0x4B4
        if(marrTracer[i] != none)
        {
            SpawnLoc = GetTracerStart();
            // End:0x24D
            if((PlayerController(Instigator.Controller) == Level.GetLocalPlayerController()) && Level.GetMatchMaker().bInverseWeapon)
            {
                vOriginSpawnLoc = SpawnLoc;
                LookDir = Instigator.Rotation;
                LookDir = Normalize(LookDir);
                lookVect = vect(1.0000000, 0.0000000, 0.0000000) >> LookDir;
                vWeaponByOwner = Owner.Location - SpawnLoc;
                vInverseWeaponByOwner.X = -vWeaponByOwner.X;
                vInverseWeaponByOwner.Y = -vWeaponByOwner.Y;
                vInverseWeaponByOwner.Z = -vWeaponByOwner.Z;
                SpawnLoc = Owner.Location + (vWeaponByOwner + ((float(2) * lookVect) * (vInverseWeaponByOwner Dot lookVect)));
                SpawnLoc.Z = vOriginSpawnLoc.Z;
            }
            marrTracer[i].SetLocation(SpawnLoc);
            hitDist = VSize(stMBPF[i].mvEffLocation[stMBPF[i].mLastHitIdx] - SpawnLoc) - mTracerPullback;
            SpawnDir = Normal(stMBPF[i].mvEffLocation[stMBPF[i].mLastHitIdx] - SpawnLoc);
            // End:0x4B4
            if(hitDist > mTracerMinDistance)
            {
                spawnVel = SpawnDir * mTracerSpeed;
                marrTracer[i].Emitters[0].StartVelocityRange.X.Min = spawnVel.X;
                marrTracer[i].Emitters[0].StartVelocityRange.X.Max = spawnVel.X;
                marrTracer[i].Emitters[0].StartVelocityRange.Y.Min = spawnVel.Y;
                marrTracer[i].Emitters[0].StartVelocityRange.Y.Max = spawnVel.Y;
                marrTracer[i].Emitters[0].StartVelocityRange.Z.Min = spawnVel.Z;
                marrTracer[i].Emitters[0].StartVelocityRange.Z.Max = spawnVel.Z;
                marrTracer[i].Emitters[0].LifetimeRange.Min = hitDist / mTracerSpeed;
                marrTracer[i].Emitters[0].LifetimeRange.Max = marrTracer[i].Emitters[0].LifetimeRange.Min;
                marrTracer[i].SpawnParticle(1);
            }
        }
        mOldHitLocation = stMBPF[i].mvEffLocation[stMBPF[i].mLastHitIdx];
        i++;
        // [Loop Continue]
        goto J0x51;
    }
    //return;    
}

function UpdatePenetrateHit(Actor mHitActor[6], Vector mHitLocation[6], Vector mHitNormal[6], Material mHitMaterial[6], int mLastHitIdx)
{
    local int i, Max;
    local stMultiBulletPerFire stTemp;

    super.UpdatePenetrateHit(mHitActor, mHitLocation, mHitNormal, mHitMaterial, 0);
    LastHitIdx = mLastHitIdx;
    stTemp.mLastHitIdx = mLastHitIdx;
    // End:0x61
    if((LastHitIdx > 0) && LastHitIdx < 3)
    {
        Max = LastHitIdx * 2;        
    }
    else
    {
        Max = LastHitIdx;
    }
    i = 0;
    J0x73:

    // End:0x176 [Loop If]
    if(i <= Max)
    {
        vEffLocation[i] = mHitLocation[i];
        HitActor[i] = mHitActor[i];
        HitNormal[i] = mHitNormal[i];
        HitMaterial[i] = mHitMaterial[i];
        stTemp.mvEffLocation[i] = vEffLocation[i];
        stTemp.mHitActor[i] = HitActor[i];
        stTemp.mHitNormal[i] = mHitNormal[i];
        stTemp.mHitMaterial[i] = HitMaterial[i];
        RepEffectLocation[nRepOffset] = vEffLocation[i];
        nRepOffset++;
        i++;
        // [Loop Continue]
        goto J0x73;
    }
    nIndexEffect[nBulletCntPerFire] = Max + 1;
    stMBPF[nBulletCntPerFire] = stTemp;
    RepLastHitIdx[nBulletCntPerFire] = stTemp.mLastHitIdx;
    nBulletCntPerFire++;
    //return;    
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial)
{
    local Vector tmpHitLocation[6];
    local Actor tmpHitActor[6];
    local Vector tmpHitNormal[6];
    local Material tmpHitMaterial[6];

    tmpHitActor[0] = HitActor;
    tmpHitNormal[0] = HitNormal;
    tmpHitMaterial[0] = HitMaterial;
    tmpHitLocation[0] = HitLocation;
    UpdatePenetrateHit(tmpHitActor, tmpHitLocation, tmpHitNormal, tmpHitMaterial, 0);
    //return;    
}

simulated function SpawnEmitter(Class<Emitter> EmitterClass)
{
    // End:0x48
    if((Weapon == none) || Weapon.ThirdPersonActor == none)
    {
        Spawn(EmitterClass, Instigator,, GetBoneCoords(GetBoneNameTip()).Origin, Rotation);        
    }
    else
    {
        Spawn(EmitterClass, Instigator,, WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation3rd().Origin, Instigator.Rotation);
    }
    //return;    
}

simulated function MakeMuzzleFlash()
{
    local bool bsu;

    // End:0xBD
    if(Instigator.IsFirstPerson() == false)
    {
        // End:0xAD
        if(mMuzFlash3rd == none)
        {
            mMuzFlash3rd = Spawn(mMuzFlashClass);
            // End:0xAA
            if(mMuzFlash3rd != none)
            {
                bsu = AttachToBone(mMuzFlash3rd, GetBoneNameTip());
                // End:0x76
                if((false == bsu) && wAIDefencePawn(Instigator) != none)
                {
                    mMuzFlash3rd = none;
                }
                // End:0x94
                if(mMuzFlash3rd != none)
                {
                    mMuzFlash3rd.mStartParticles++;                    
                }
                else
                {
                    // End:0xAA
                    if(mMuzFlashEmitterClass != none)
                    {
                        SpawnEmitter(mMuzFlashEmitterClass);
                    }
                }
            }            
        }
        else
        {
            mMuzFlash3rd.mStartParticles++;
        }
    }
    //return;    
}

simulated function MakeSpawnShell(optional bool bRechamber)
{
    // End:0x25
    if((bRechamber == false) && BaseParams.bRechamber == true)
    {
        return;
    }
    // End:0x5A
    if(false == Instigator.IsFirstPerson())
    {
        // End:0x5A
        if(mShellCaseEmitter != none)
        {
            mShellCaseEmitter.Trigger(self, Instigator);
        }
    }
    //return;    
}

simulated function name GetBoneNameTip()
{
    return 'tip';
    //return;    
}

simulated function name GetBoneNameRotation()
{
    return 'Bone_Flash';
    //return;    
}

simulated function name GetBoneNameSilencer()
{
    return 'Silencer_flash';
    //return;    
}

simulated function MakeSmoke()
{
    local Rotator R;

    // End:0xBE
    if(bAttachSilencer == true)
    {
        // End:0xBB
        if(false == Instigator.IsFirstPerson())
        {
            // End:0x82
            if(mSilencerSmoke3rd == none)
            {
                mSilencerSmoke3rd = Spawn(mSilencerSmokeClass);
                // End:0x69
                if(mSilencerSmoke3rd != none)
                {
                    AttachToBone(mSilencerSmoke3rd, GetBoneNameSilencer());
                    mSilencerSmoke3rd.mStartParticles++;                    
                }
                else
                {
                    // End:0x7F
                    if(mSilencerSmokeEmitterClass != none)
                    {
                        SpawnEmitter(mSilencerSmokeEmitterClass);
                    }
                }                
            }
            else
            {
                mSilencerSmoke3rd.mStartParticles++;
            }
            R.Roll = Rand(65536);
            SetBoneRotation(GetBoneNameSilencer(), R, 0, 1.0000000);
        }        
    }
    else
    {
        // End:0x144
        if(false == Instigator.IsFirstPerson())
        {
            // End:0x134
            if(mSmoke3rd == none)
            {
                mSmoke3rd = Spawn(mSmokeClass);
                // End:0x11B
                if(mSmoke3rd != none)
                {
                    AttachToBone(mSmoke3rd, GetBoneNameTip());
                    mSmoke3rd.mStartParticles++;                    
                }
                else
                {
                    // End:0x131
                    if(mSmokeEmitterClass != none)
                    {
                        SpawnEmitter(mSmokeEmitterClass);
                    }
                }                
            }
            else
            {
                mSmoke3rd.mStartParticles++;
            }
        }
    }
    //return;    
}

simulated function FakeUpdateTracer(Vector LastHitLocation)
{
    local Vector SpawnLoc, SpawnDir, spawnVel;
    local float hitDist;
    local Rotator LookDir;
    local Vector lookVect, vInverseWeaponByOwner, vWeaponByOwner, vOriginSpawnLoc;

    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x32
    if(FRand() >= ResParams.default.fTracerPop)
    {
        return;
    }
    iSelfTraceCount++;
    // End:0x4F
    if(int(iSelfTraceCount) >= 10)
    {
        iSelfTraceCount = 0;
    }
    // End:0x78
    if(marrTracer[int(iSelfTraceCount)] == none)
    {
        marrTracer[int(iSelfTraceCount)] = Spawn(mTracerClass);
    }
    // End:0x417
    if(marrTracer[int(iSelfTraceCount)] != none)
    {
        SpawnLoc = GetTracerStart();
        // End:0x1D2
        if((PlayerController(Instigator.Controller) == Level.GetLocalPlayerController()) && Level.GetMatchMaker().bInverseWeapon)
        {
            vOriginSpawnLoc = SpawnLoc;
            LookDir = Instigator.Rotation;
            LookDir = Normalize(LookDir);
            lookVect = vect(1.0000000, 0.0000000, 0.0000000) >> LookDir;
            vWeaponByOwner = Owner.Location - SpawnLoc;
            vInverseWeaponByOwner.X = -vWeaponByOwner.X;
            vInverseWeaponByOwner.Y = -vWeaponByOwner.Y;
            vInverseWeaponByOwner.Z = -vWeaponByOwner.Z;
            SpawnLoc = Owner.Location + (vWeaponByOwner + ((float(2) * lookVect) * (vInverseWeaponByOwner Dot lookVect)));
            SpawnLoc.Z = vOriginSpawnLoc.Z;
        }
        marrTracer[int(iSelfTraceCount)].SetLocation(SpawnLoc);
        hitDist = VSize(LastHitLocation - SpawnLoc) - mTracerPullback;
        SpawnDir = Normal(LastHitLocation - SpawnLoc);
        // End:0x417
        if(hitDist > mTracerMinDistance)
        {
            spawnVel = SpawnDir * mTracerSpeed;
            marrTracer[int(iSelfTraceCount)].Emitters[0].StartVelocityRange.X.Min = spawnVel.X;
            marrTracer[int(iSelfTraceCount)].Emitters[0].StartVelocityRange.X.Max = spawnVel.X;
            marrTracer[int(iSelfTraceCount)].Emitters[0].StartVelocityRange.Y.Min = spawnVel.Y;
            marrTracer[int(iSelfTraceCount)].Emitters[0].StartVelocityRange.Y.Max = spawnVel.Y;
            marrTracer[int(iSelfTraceCount)].Emitters[0].StartVelocityRange.Z.Min = spawnVel.Z;
            marrTracer[int(iSelfTraceCount)].Emitters[0].StartVelocityRange.Z.Max = spawnVel.Z;
            marrTracer[int(iSelfTraceCount)].Emitters[0].LifetimeRange.Min = hitDist / mTracerSpeed;
            marrTracer[int(iSelfTraceCount)].Emitters[0].LifetimeRange.Max = marrTracer[int(iSelfTraceCount)].Emitters[0].LifetimeRange.Min;
            marrTracer[int(iSelfTraceCount)].SpawnParticle(1);
        }
    }
    //return;    
}

simulated function FakeThirdPersonEffects(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial)
{
    local Vector invlookvec, StartLocation;
    local float dotv, Alpha;

    StartLocation = Instigator.Location;
    invlookvec = StartLocation - HitLocation;
    StartLocation = HitLocation;
    // End:0x53
    if(invlookvec.Z < float(0))
    {
        invlookvec.Z = 0.0000000;
    }
    invlookvec = Normal(invlookvec);
    dotv = invlookvec Dot HitNormal;
    dotv = Abs(dotv);
    // End:0x91
    if(dotv > 0.7000000)
    {        
    }
    else
    {
        Alpha = dotv / 0.7000000;
        invlookvec = (invlookvec * Alpha) + (HitNormal * (float(1) - Alpha));
    }
    Spawn(Class'XWeapons.HitEffect'.static.GetHitEffectByMaterial(HitMaterial),,, HitLocation, Rotator(invlookvec));
    // End:0x1D6
    if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && SplashEffect != none) && !Instigator.PhysicsVolume.bWaterVolume)
    {
        bTraceWater = true;
        HitActor = Trace(HitLocation, HitNormal, HitLocation, Instigator.Location, true);
        bTraceWater = false;
        // End:0x1D6
        if((FluidSurfaceInfo(HitActor) != none) || (PhysicsVolume(HitActor) != none) && PhysicsVolume(HitActor).bWaterVolume)
        {
            Spawn(SplashEffect,,, HitLocation, rot(16384, 0, 0));
        }
    }
    //return;    
}

simulated event ThirdPersonEffects()
{
    local PlayerController PC;
    local Vector invlookvec, StartLocation;
    local float dotv, Alpha;
    local int i, Max, nIndex, nOffset;

    // End:0x4C3
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x482
        if(int(FiringMode) == 0)
        {
            WeaponLight();
            PC = Level.GetLocalPlayerController();
            Log(((("OldSpawnHitCount = " @ string(OldSpawnHitCount)) $ " ") $ "SpawnHitCount = ") @ string(SpawnHitCount));
            // End:0x41D
            if(int(OldSpawnHitCount) != int(SpawnHitCount))
            {
                nOffset = 0;
                nIndex = 0;
                J0xA4:

                // End:0x13A [Loop If]
                if(nIndex < nBulletCntPerFire)
                {
                    i = 0;
                    J0xBA:

                    // End:0x102 [Loop If]
                    if(i < nIndexEffect[nIndex])
                    {
                        stMBPF[nIndex].mvEffLocation[i] = RepEffectLocation[i + nOffset];
                        i++;
                        // [Loop Continue]
                        goto J0xBA;
                    }
                    nOffset += nIndexEffect[nIndex];
                    stMBPF[nIndex].mLastHitIdx = RepLastHitIdx[nIndex];
                    nIndex++;
                    // [Loop Continue]
                    goto J0xA4;
                }
                nOffset = 0;
                nIndex = 0;
                J0x148:

                // End:0x402 [Loop If]
                if(nIndex < nBulletCntPerFire)
                {
                    // End:0x18D
                    if((LastHitIdx > 0) && LastHitIdx < 3)
                    {
                        Max = stMBPF[nIndex].mLastHitIdx * 2;                        
                    }
                    else
                    {
                        Max = stMBPF[nIndex].mLastHitIdx;
                    }
                    OldSpawnHitCount = SpawnHitCount;
                    StartLocation = Instigator.Location;
                    i = 0;
                    J0x1C9:

                    // End:0x3F8 [Loop If]
                    if(i <= Max)
                    {
                        GetHitInfo(nIndex, i);
                        // End:0x3EE
                        if(((Instigator != none) && (Instigator.Controller != PC) || int(PC.Role) == int(ROLE_Authority)) && VSize(PC.ViewTarget.Location - stMBPF[nIndex].mvEffLocation[i]) < float(4000))
                        {
                            invlookvec = StartLocation - stMBPF[nIndex].mvEffLocation[i];
                            StartLocation = stMBPF[nIndex].mvEffLocation[i];
                            // End:0x2C8
                            if(invlookvec.Z < float(0))
                            {
                                invlookvec.Z = 0.0000000;
                            }
                            invlookvec = Normal(invlookvec);
                            dotv = invlookvec Dot stMBPF[nIndex].mHitNormal[i];
                            dotv = Abs(dotv);
                            // End:0x317
                            if(dotv > 0.7000000)
                            {                                
                            }
                            else
                            {
                                Alpha = dotv / 0.7000000;
                                invlookvec = (invlookvec * Alpha) + (stMBPF[nIndex].mHitNormal[i] * (float(1) - Alpha));
                            }
                            Log((("Decal = " @ string(stMBPF[nIndex].mvEffLocation[i])) $ " i = ") @ string(i));
                            Spawn(Class'XWeapons.HitEffect'.static.GetHitEffectByMaterial(stMBPF[nIndex].mHitMaterial[i]),,, stMBPF[nIndex].mvEffLocation[i], Rotator(invlookvec));
                            CheckForSplash(nIndex, i);
                        }
                        i++;
                        // [Loop Continue]
                        goto J0x1C9;
                    }
                    nIndex++;
                    // [Loop Continue]
                    goto J0x148;
                }
                // End:0x41D
                if(bAttachSilencer == false)
                {
                    Instigator.MakeFireNoise();
                }
            }
            // End:0x47F
            if(int(FlashCount) > 0)
            {
                // End:0x45B
                if(PC.IsInState('Spectating') && PC.ViewTarget == Instigator)
                {                    
                }
                else
                {
                    // End:0x46D
                    if(bAttachSilencer == false)
                    {
                        MakeMuzzleFlash();
                    }
                    MakeSmoke();
                    MakeSpawnShell();
                    UpdateTracer();
                }
            }            
        }
        else
        {
            // End:0x4C3
            if(int(FiringMode) == 2)
            {
                // End:0x4C3
                if(int(OldSpawnHitCount) != int(SpawnHitCount))
                {
                    OldSpawnHitCount = SpawnHitCount;
                    Instigator.MakeFireNoise();
                    MakeMeleeHitEffect();
                }
            }
        }
    }
    super.ThirdPersonEffects();
    //return;    
}

simulated event wLoadOut(int iID, int iAddPartsID)
{
    local int i;
    local string strMuzClass;

    super(WeaponAttachment).wLoadOut(iID, iAddPartsID);
    AddParts(iID, iAddPartsID);
    // End:0x37
    if(bModMuzFlash)
    {
        strMuzClass = strModMuzFlashClass;        
    }
    else
    {
        strMuzClass = ResParams.default.szClass_Muzz_3rd;
    }
    mMuzFlashClass = Class<wEmitter>(DynamicLoadObject(strMuzClass, Class'Core.Class'));
    // End:0x8C
    if(mMuzFlashClass == none)
    {
        mMuzFlashEmitterClass = Class<Emitter>(DynamicLoadObject(strMuzClass, Class'Core.Class'));
    }
    mSmokeClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_3rd, Class'Core.Class'));
    // End:0xDF
    if(mSmokeClass == none)
    {
        mSmokeEmitterClass = Class<Emitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_3rd, Class'Core.Class'));
    }
    mSilencerSmokeClass = Class<wEmitter>(DynamicLoadObject("Xeffects.Silencer_smoke_3RD", Class'Core.Class'));
    // End:0x150
    if(mSilencerSmokeClass == none)
    {
        mSilencerSmokeEmitterClass = Class<Emitter>(DynamicLoadObject("Xeffects.Silencer_smoke_3RD", Class'Core.Class'));
    }
    mShellCaseEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell_3rd, Class'Core.Class'));
    // End:0x1D8
    if(mShellCaseEmitterClass != none)
    {
        mShellCaseEmitter = Spawn(mShellCaseEmitterClass, self);
        // End:0x1C8
        if(wTurret_FNM240(Instigator) != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(mShellCaseEmitter, 'shell');            
        }
        else
        {
            AttachToBone(mShellCaseEmitter, 'shell');
        }
    }
    //return;    
}

simulated function AddParts(int iWeaponID, int iAddPartsID)
{
    local wItemResourceParam ItemResParam;
    local wWeaponCustomInfoParam wcip;
    local wWeaponCustomPartsParam wcpp;
    local int iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID, iSubSightPartItemID;

    ClearParts();
    iSightPartID = iAddPartsID & 1023;
    iBarrelPartID = iAddPartsID & 130048;
    iSilencerPartID = iAddPartsID & 16646144;
    iGunstockPartID = iAddPartsID & 2130706432;
    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iWeaponID);
    // End:0xA1
    if((wcip.iItemID <= 0) || wcip.iItemID != iWeaponID)
    {
        return;
    }
    // End:0x253
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x250
        if((wcpp.iItemID > 0) && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x250
            if(ItemResParam.iItemResourceID != -1)
            {
                wParts[0] = Spawn(Class'Engine.wSkinShell');
                wParts[0].SetDrawType(8);
                wParts[0].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                wParts[0].SetBase(self);
                wParts[0].SetOwner(self);
                wParts[0].bAnimByOwner = false;
                wParts[0].CullDistance = fPartsCullDistance;
                // End:0x23E
                if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                {
                    wParts[0].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, Class'Engine.Material'));
                }
                AttachToBone(wParts[0], 'Sight');
            }
        }        
    }
    else
    {
        iSubSightPartItemID = wcip.iSightOffAddItemID;
    }
    // End:0x3A8
    if(iSubSightPartItemID > 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(iSubSightPartItemID);
        // End:0x3A8
        if(ItemResParam.iItemResourceID != -1)
        {
            wParts[2] = Spawn(Class'Engine.wSkinShell');
            wParts[2].SetDrawType(8);
            wParts[2].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(iSubSightPartItemID, true));
            wParts[2].SetBase(self);
            wParts[2].SetOwner(self);
            wParts[2].bAnimByOwner = false;
            wParts[2].CullDistance = fPartsCullDistance;
            // End:0x395
            if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
            {
                wParts[2].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, Class'Engine.Material'));
            }
            AttachToBone(wParts[2], 'Sight');
        }
    }
    bAttachSilencer = false;
    // End:0x59C
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x59C
        if((wcpp.iItemID > 0) && wcpp.iPartID == iSilencerPartID)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x59C
            if(ItemResParam.iItemResourceID != -1)
            {
                // End:0x499
                if(Len(ItemResParam.strRes_3rd_RSA_Backpack) > 1)
                {
                    strModMuzFlashClass = ResParams.default.szClass_Muzz_3rd $ ItemResParam.strRes_3rd_RSA_Backpack;
                    bModMuzFlash = true;                    
                }
                else
                {
                    wParts[1] = Spawn(Class'Engine.wSkinShell');
                    wParts[1].SetDrawType(8);
                    wParts[1].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                    wParts[1].SetBase(self);
                    wParts[1].SetOwner(self);
                    wParts[1].bAnimByOwner = false;
                    wParts[1].CullDistance = fPartsCullDistance;
                    // End:0x582
                    if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                    {
                        wParts[1].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, Class'Engine.Material'));
                    }
                    AttachToBone(wParts[1], 'Silencer');
                    bAttachSilencer = true;
                }
            }
        }
    }
    // End:0x5DA
    if(iPainting_Item_ID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID, true, iPainting_Item_ID);        
    }
    else
    {
        // End:0x62A
        if(wcip.iDefaultPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID, true, wcip.iDefaultPaintingID);            
        }
        else
        {
            Skins.Length = 0;
        }
    }
    //return;    
}

simulated function ClearParts()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5E [Loop If]
    if(i < 3)
    {
        // End:0x54
        if(wParts[i] != none)
        {
            DetachFromBone(wParts[i]);
            wParts[i].Destroy();
            wParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    mTracerClass=Class'XEffects.Warfare_Tracer'
    mTracerPullback=700.0000000
    mTracerSpeed=20000.0000000
    fPartsCullDistance=2000.0000000
    SplashEffect=Class'WGame.BulletSplash'
    LightType=2
    LightEffect=13
    LightHue=30
    LightSaturation=150
    LightBrightness=255.0000000
    LightRadius=16.0000000
    LightPeriod=3
}