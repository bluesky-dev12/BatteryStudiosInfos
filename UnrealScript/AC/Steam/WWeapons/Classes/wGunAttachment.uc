/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wGunAttachment.uc
 * Package Imports:
 *	WWeapons
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:18
 *
 *******************************************************************************/
class wGunAttachment extends wWeaponAttachment;

var class<wEmitter> mMuzFlashClass;
var wEmitter mMuzFlash3rd;
var class<Emitter> mMuzFlashEmitterClass;
var class<wEmitter> mSmokeClass;
var wEmitter mSmoke3rd;
var class<Emitter> mSmokeEmitterClass;
var class<wEmitter> mSilencerSmokeClass;
var wEmitter mSilencerSmoke3rd;
var class<Emitter> mSilencerSmokeEmitterClass;
var class<wEmitter> mShellCaseEmitterClass;
var wEmitter mShellCaseEmitter;
var class<Emitter> mTracerClass;
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

simulated function Destroyed()
{
    local int i;

    // End:0x17
    if(mTracer != none)
    {
        mTracer.Destroy();
    }
    i = 0;
    J0x1e:
    // End:0x57 [While If]
    if(i < 10)
    {
        // End:0x4d
        if(marrTracer[i] != none)
        {
            marrTracer[i].Destroy();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e;
    }
    // End:0x6e
    if(mMuzFlash3rd != none)
    {
        mMuzFlash3rd.Destroy();
    }
    // End:0x85
    if(mSmoke3rd != none)
    {
        mSmoke3rd.Destroy();
    }
    // End:0x9c
    if(mShellCaseEmitter != none)
    {
        mShellCaseEmitter.Destroy();
    }
    ClearParts();
    super(WeaponAttachment).Destroyed();
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
    // End:0x6f
    if(P != none && P.IsFirstPerson() && P.Weapon != none)
    {
        return P.Weapon.GetEffectStart();
    }
    // End:0x8c
    if(mMuzFlash3rd != none)
    {
        return mMuzFlash3rd.Location;
    }
    // End:0x92
    else
    {
        return Location;
    }
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
    // End:0x4a
    if(Instigator.Controller == PC && PC.Role < 4)
    {
        return;
    }
    i = 0;
    J0x51:
    // End:0x4e5 [While If]
    if(i < 10)
    {
        // End:0xb5
        if(stMBPF[i].mLastHitIdx < 0 || stMBPF[i].mHitActor[stMBPF[i].mLastHitIdx] == none || FRand() >= ResParams.default.fTracerPop)
        {
            return;
        }
        // End:0xd0
        if(Level.NetMode == 1)
        {
            return;
        }
        // End:0xf5
        if(marrTracer[i] == none)
        {
            marrTracer[i] = Spawn(mTracerClass);
        }
        // End:0x4b4
        if(marrTracer[i] != none)
        {
            SpawnLoc = GetTracerStart();
            // End:0x24d
            if(PlayerController(Instigator.Controller) == Level.GetLocalPlayerController() && Level.GetMatchMaker().bInverseWeapon)
            {
                vOriginSpawnLoc = SpawnLoc;
                LookDir = Instigator.Rotation;
                LookDir = Normalize(LookDir);
                lookVect = vect(1.0, 0.0, 0.0) >> LookDir;
                vWeaponByOwner = Owner.Location - SpawnLoc;
                vInverseWeaponByOwner.X = -vWeaponByOwner.X;
                vInverseWeaponByOwner.Y = -vWeaponByOwner.Y;
                vInverseWeaponByOwner.Z = -vWeaponByOwner.Z;
                SpawnLoc = Owner.Location + vWeaponByOwner + float(2) * lookVect * vInverseWeaponByOwner Dot lookVect;
                SpawnLoc.Z = vOriginSpawnLoc.Z;
            }
            marrTracer[i].SetLocation(SpawnLoc);
            hitDist = VSize(stMBPF[i].mvEffLocation[stMBPF[i].mLastHitIdx] - SpawnLoc) - mTracerPullback;
            SpawnDir = Normal(stMBPF[i].mvEffLocation[stMBPF[i].mLastHitIdx] - SpawnLoc);
            // End:0x4b4
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x51;
    }
}

function UpdatePenetrateHit(Actor mHitActor[6], Vector mHitLocation[6], Vector mHitNormal[6], Material mHitMaterial[6], int mLastHitIdx)
{
    local int i, Max;
    local stMultiBulletPerFire stTemp;

    super.UpdatePenetrateHit(mHitActor, mHitLocation, mHitNormal, mHitMaterial, 0);
    LastHitIdx = mLastHitIdx;
    stTemp.mLastHitIdx = mLastHitIdx;
    // End:0x61
    if(LastHitIdx > 0 && LastHitIdx < 3)
    {
        Max = LastHitIdx * 2;
    }
    // End:0x6c
    else
    {
        Max = LastHitIdx;
    }
    i = 0;
    J0x73:
    // End:0x176 [While If]
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
        ++ nRepOffset;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x73;
    }
    nIndexEffect[nBulletCntPerFire] = Max + 1;
    stMBPF[nBulletCntPerFire] = stTemp;
    RepLastHitIdx[nBulletCntPerFire] = stTemp.mLastHitIdx;
    ++ nBulletCntPerFire;
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
}

simulated function SpawnEmitter(class<Emitter> EmitterClass)
{
    // End:0x48
    if(Weapon == none || Weapon.ThirdPersonActor == none)
    {
        Spawn(EmitterClass, Instigator,, GetBoneCoords(GetBoneNameTip()).Origin, Rotation);
    }
    // End:0x86
    else
    {
        Spawn(EmitterClass, Instigator,, WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation3rd().Origin, Instigator.Rotation);
    }
}

simulated function MakeMuzzleFlash()
{
    // End:0x35
    if(mMuzFlash3rd == none)
    {
        mMuzFlash3rd = Spawn(mMuzFlashClass);
        // End:0x35
        if(mMuzFlash3rd != none)
        {
            AttachToBone(mMuzFlash3rd, GetBoneNameTip());
        }
    }
    // End:0x53
    if(mMuzFlash3rd != none)
    {
        ++ mMuzFlash3rd.mStartParticles;
    }
    // End:0x69
    else
    {
        // End:0x69
        if(mMuzFlashEmitterClass != none)
        {
            SpawnEmitter(mMuzFlashEmitterClass);
        }
    }
}

simulated function MakeSpawnShell(optional bool bRechamber)
{
    // End:0x25
    if(bRechamber == false && BaseParams.bRechamber == true)
    {
        return;
    }
    // End:0x45
    if(mShellCaseEmitter != none)
    {
        mShellCaseEmitter.Trigger(self, Instigator);
    }
}

simulated function name GetBoneNameTip()
{
    return 'tip';
}

simulated function name GetBoneNameRotation()
{
    return 'Bone_Flash';
}

simulated function name GetBoneNameSilencer()
{
    return 'Silencer_flash';
}

simulated function MakeSmoke()
{
    local Rotator R;

    // End:0xa1
    if(bAttachSilencer == true)
    {
        // End:0x41
        if(mSilencerSmoke3rd == none)
        {
            mSilencerSmoke3rd = Spawn(mSilencerSmokeClass);
            // End:0x41
            if(mSilencerSmoke3rd != none)
            {
                AttachToBone(mSilencerSmoke3rd, GetBoneNameSilencer());
            }
        }
        // End:0x5f
        if(mSilencerSmoke3rd != none)
        {
            ++ mSilencerSmoke3rd.mStartParticles;
        }
        // End:0x75
        else
        {
            // End:0x75
            if(mSilencerSmokeEmitterClass != none)
            {
                SpawnEmitter(mSilencerSmokeEmitterClass);
            }
        }
        R.Roll = Rand(65536);
        SetBoneRotation(GetBoneNameSilencer(), R, 0, 1.0);
    }
    // End:0x10a
    else
    {
        // End:0xd6
        if(mSmoke3rd == none)
        {
            mSmoke3rd = Spawn(mSmokeClass);
            // End:0xd6
            if(mSmoke3rd != none)
            {
                AttachToBone(mSmoke3rd, GetBoneNameTip());
            }
        }
        // End:0xf4
        if(mSmoke3rd != none)
        {
            ++ mSmoke3rd.mStartParticles;
        }
        // End:0x10a
        else
        {
            // End:0x10a
            if(mSmokeEmitterClass != none)
            {
                SpawnEmitter(mSmokeEmitterClass);
            }
        }
    }
}

simulated function FakeUpdateTracer(Vector LastHitLocation)
{
    local Vector SpawnLoc, SpawnDir, spawnVel;
    local float hitDist;
    local Rotator LookDir;
    local Vector lookVect, vInverseWeaponByOwner, vWeaponByOwner, vOriginSpawnLoc;

    // End:0x1b
    if(Level.NetMode == 1)
    {
        return;
    }
    // End:0x32
    if(FRand() >= ResParams.default.fTracerPop)
    {
        return;
    }
    ++ iSelfTraceCount;
    // End:0x4f
    if(iSelfTraceCount >= 10)
    {
        iSelfTraceCount = 0;
    }
    // End:0x78
    if(marrTracer[iSelfTraceCount] == none)
    {
        marrTracer[iSelfTraceCount] = Spawn(mTracerClass);
    }
    // End:0x417
    if(marrTracer[iSelfTraceCount] != none)
    {
        SpawnLoc = GetTracerStart();
        // End:0x1d2
        if(PlayerController(Instigator.Controller) == Level.GetLocalPlayerController() && Level.GetMatchMaker().bInverseWeapon)
        {
            vOriginSpawnLoc = SpawnLoc;
            LookDir = Instigator.Rotation;
            LookDir = Normalize(LookDir);
            lookVect = vect(1.0, 0.0, 0.0) >> LookDir;
            vWeaponByOwner = Owner.Location - SpawnLoc;
            vInverseWeaponByOwner.X = -vWeaponByOwner.X;
            vInverseWeaponByOwner.Y = -vWeaponByOwner.Y;
            vInverseWeaponByOwner.Z = -vWeaponByOwner.Z;
            SpawnLoc = Owner.Location + vWeaponByOwner + float(2) * lookVect * vInverseWeaponByOwner Dot lookVect;
            SpawnLoc.Z = vOriginSpawnLoc.Z;
        }
        marrTracer[iSelfTraceCount].SetLocation(SpawnLoc);
        hitDist = VSize(LastHitLocation - SpawnLoc) - mTracerPullback;
        SpawnDir = Normal(LastHitLocation - SpawnLoc);
        // End:0x417
        if(hitDist > mTracerMinDistance)
        {
            spawnVel = SpawnDir * mTracerSpeed;
            marrTracer[iSelfTraceCount].Emitters[0].StartVelocityRange.X.Min = spawnVel.X;
            marrTracer[iSelfTraceCount].Emitters[0].StartVelocityRange.X.Max = spawnVel.X;
            marrTracer[iSelfTraceCount].Emitters[0].StartVelocityRange.Y.Min = spawnVel.Y;
            marrTracer[iSelfTraceCount].Emitters[0].StartVelocityRange.Y.Max = spawnVel.Y;
            marrTracer[iSelfTraceCount].Emitters[0].StartVelocityRange.Z.Min = spawnVel.Z;
            marrTracer[iSelfTraceCount].Emitters[0].StartVelocityRange.Z.Max = spawnVel.Z;
            marrTracer[iSelfTraceCount].Emitters[0].LifetimeRange.Min = hitDist / mTracerSpeed;
            marrTracer[iSelfTraceCount].Emitters[0].LifetimeRange.Max = marrTracer[iSelfTraceCount].Emitters[0].LifetimeRange.Min;
            marrTracer[iSelfTraceCount].SpawnParticle(1);
        }
    }
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
        invlookvec.Z = 0.0;
    }
    invlookvec = Normal(invlookvec);
    dotv = invlookvec Dot HitNormal;
    dotv = Abs(dotv);
    // End:0x91
    if(dotv > 0.70)
    {
    }
    // End:0xc8
    else
    {
        Alpha = dotv / 0.70;
        invlookvec = invlookvec * Alpha + HitNormal * float(1) - Alpha;
    }
    Spawn(class'HitEffect'.static.GetHitEffectByMaterial(HitMaterial),,, HitLocation, rotator(invlookvec));
    // End:0x1d6
    if(!Level.bDropDetail && Level.DetailMode != 0 && SplashEffect != none && !Instigator.PhysicsVolume.bWaterVolume)
    {
        bTraceWater = true;
        HitActor = Trace(HitLocation, HitNormal, HitLocation, Instigator.Location, true);
        bTraceWater = false;
        // End:0x1d6
        if(FluidSurfaceInfo(HitActor) != none || PhysicsVolume(HitActor) != none && PhysicsVolume(HitActor).bWaterVolume)
        {
            Spawn(SplashEffect,,, HitLocation, rot(16384, 0, 0));
        }
    }
}

simulated event ThirdPersonEffects()
{
    local PlayerController PC;
    local Vector invlookvec, StartLocation;
    local float dotv, Alpha;
    local int i, Max, nIndex, nOffset;

    // End:0x47f
    if(Level.NetMode != 1)
    {
        // End:0x47f
        if(FiringMode == 0)
        {
            WeaponLight();
            PC = Level.GetLocalPlayerController();
            Log("OldSpawnHitCount = " @ string(OldSpawnHitCount) $ " " $ "SpawnHitCount = " @ string(SpawnHitCount));
            // End:0x41d
            if(OldSpawnHitCount != SpawnHitCount)
            {
                nOffset = 0;
                nIndex = 0;
                J0xa4:
                // End:0x13a [While If]
                if(nIndex < nBulletCntPerFire)
                {
                    i = 0;
                    J0xba:
                    // End:0x102 [While If]
                    if(i < nIndexEffect[nIndex])
                    {
                        stMBPF[nIndex].mvEffLocation[i] = RepEffectLocation[i + nOffset];
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0xba;
                    }
                    nOffset += nIndexEffect[nIndex];
                    stMBPF[nIndex].mLastHitIdx = RepLastHitIdx[nIndex];
                    ++ nIndex;
                    // This is an implied JumpToken; Continue!
                    goto J0xa4;
                }
                nOffset = 0;
                nIndex = 0;
                J0x148:
                // End:0x402 [While If]
                if(nIndex < nBulletCntPerFire)
                {
                    // End:0x18d
                    if(LastHitIdx > 0 && LastHitIdx < 3)
                    {
                        Max = stMBPF[nIndex].mLastHitIdx * 2;
                    }
                    // End:0x1a3
                    else
                    {
                        Max = stMBPF[nIndex].mLastHitIdx;
                    }
                    OldSpawnHitCount = SpawnHitCount;
                    StartLocation = Instigator.Location;
                    i = 0;
                    J0x1c9:
                    // End:0x3f8 [While If]
                    if(i <= Max)
                    {
                        GetHitInfo(nIndex, i);
                        // End:0x3ee
                        if(Instigator != none && Instigator.Controller != PC || PC.Role == 4 && VSize(PC.ViewTarget.Location - stMBPF[nIndex].mvEffLocation[i]) < float(4000))
                        {
                            invlookvec = StartLocation - stMBPF[nIndex].mvEffLocation[i];
                            StartLocation = stMBPF[nIndex].mvEffLocation[i];
                            // End:0x2c8
                            if(invlookvec.Z < float(0))
                            {
                                invlookvec.Z = 0.0;
                            }
                            invlookvec = Normal(invlookvec);
                            dotv = invlookvec Dot stMBPF[nIndex].mHitNormal[i];
                            dotv = Abs(dotv);
                            // End:0x317
                            if(dotv > 0.70)
                            {
                            }
                            // End:0x35f
                            else
                            {
                                Alpha = dotv / 0.70;
                                invlookvec = invlookvec * Alpha + stMBPF[nIndex].mHitNormal[i] * float(1) - Alpha;
                            }
                            Log("Decal = " @ string(stMBPF[nIndex].mvEffLocation[i]) $ " i = " @ string(i));
                            Spawn(class'HitEffect'.static.GetHitEffectByMaterial(stMBPF[nIndex].mHitMaterial[i]),,, stMBPF[nIndex].mvEffLocation[i], rotator(invlookvec));
                            CheckForSplash(nIndex, i);
                        }
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x1c9;
                    }
                    ++ nIndex;
                    // This is an implied JumpToken; Continue!
                    goto J0x148;
                }
                // End:0x41d
                if(bAttachSilencer == false)
                {
                    Instigator.MakeFireNoise();
                }
            }
            // End:0x47f
            if(FlashCount > 0)
            {
                // End:0x45b
                if(PC.IsInState('Spectating') && PC.ViewTarget == Instigator)
                {
                }
                // End:0x47f
                else
                {
                    // End:0x46d
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
    }
    super.ThirdPersonEffects();
}

simulated event wLoadOut(int iID, int iAddPartsID)
{
    local int i;

    super(WeaponAttachment).wLoadOut(iID, iAddPartsID);
    mMuzFlashClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_3rd, class'Class'));
    // End:0x63
    if(mMuzFlashClass == none)
    {
        mMuzFlashEmitterClass = class<Emitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_3rd, class'Class'));
    }
    mSmokeClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_3rd, class'Class'));
    // End:0xb6
    if(mSmokeClass == none)
    {
        mSmokeEmitterClass = class<Emitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_3rd, class'Class'));
    }
    mSilencerSmokeClass = class<wEmitter>(DynamicLoadObject("Xeffects.Silencer_smoke_3RD", class'Class'));
    // End:0x127
    if(mSilencerSmokeClass == none)
    {
        mSilencerSmokeEmitterClass = class<Emitter>(DynamicLoadObject("Xeffects.Silencer_smoke_3RD", class'Class'));
    }
    mShellCaseEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell_3rd, class'Class'));
    // End:0x1af
    if(mShellCaseEmitterClass != none)
    {
        mShellCaseEmitter = Spawn(mShellCaseEmitterClass, self);
        // End:0x19f
        if(wTurret_FNM240(Instigator) != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(mShellCaseEmitter, 'shell');
        }
        // End:0x1af
        else
        {
            AttachToBone(mShellCaseEmitter, 'shell');
        }
    }
    AddParts(iID, iAddPartsID);
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
    // End:0xa1
    if(wcip.iItemID <= 0 || wcip.iItemID != iWeaponID)
    {
        return;
    }
    // End:0x253
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x250
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x250
            if(ItemResParam.iItemResourceID != -1)
            {
                wParts[0] = Spawn(class'wSkinShell');
                wParts[0].SetDrawType(8);
                wParts[0].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                wParts[0].SetBase(self);
                wParts[0].SetOwner(self);
                wParts[0].bAnimByOwner = false;
                wParts[0].CullDistance = fPartsCullDistance;
                // End:0x23e
                if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                {
                    wParts[0].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, class'Material'));
                }
                AttachToBone(wParts[0], 'Sight');
            }
        }
    }
    // End:0x267
    else
    {
        iSubSightPartItemID = wcip.iSightOffAddItemID;
    }
    // End:0x3a8
    if(iSubSightPartItemID > 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(iSubSightPartItemID);
        // End:0x3a8
        if(ItemResParam.iItemResourceID != -1)
        {
            wParts[2] = Spawn(class'wSkinShell');
            wParts[2].SetDrawType(8);
            wParts[2].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(iSubSightPartItemID, true));
            wParts[2].SetBase(self);
            wParts[2].SetOwner(self);
            wParts[2].bAnimByOwner = false;
            wParts[2].CullDistance = fPartsCullDistance;
            // End:0x395
            if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
            {
                wParts[2].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, class'Material'));
            }
            AttachToBone(wParts[2], 'Sight');
        }
    }
    // End:0x547
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x547
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSilencerPartID)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x547
            if(ItemResParam.iItemResourceID != -1)
            {
                wParts[1] = Spawn(class'wSkinShell');
                wParts[1].SetDrawType(8);
                wParts[1].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                wParts[1].SetBase(self);
                wParts[1].SetOwner(self);
                wParts[1].bAnimByOwner = false;
                wParts[1].CullDistance = fPartsCullDistance;
                // End:0x535
                if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                {
                    wParts[1].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, class'Material'));
                }
                AttachToBone(wParts[1], 'Silencer');
            }
        }
    }
    // End:0x585
    if(iPainting_Item_ID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID, true, iPainting_Item_ID);
    }
    // End:0x5dd
    else
    {
        // End:0x5d5
        if(wcip.iDefaultPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID, true, wcip.iDefaultPaintingID);
        }
        // End:0x5dd
        else
        {
            Skins.Length = 0;
        }
    }
}

simulated function ClearParts()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5e [While If]
    if(i < 3)
    {
        // End:0x54
        if(wParts[i] != none)
        {
            DetachFromBone(wParts[i]);
            wParts[i].Destroy();
            wParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

defaultproperties
{
    mTracerClass=Class'XEffects.Warfare_Tracer'
    mTracerPullback=700.0
    mTracerSpeed=20000.0
    fPartsCullDistance=2000.0
    SplashEffect=Class'WGame.BulletSplash'
    LightType=2
    LightEffect=13
    LightHue=30
    LightSaturation=150
    LightBrightness=255.0
    LightRadius=16.0
    LightPeriod=3
}