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
var() float mTracerPullback;
var() float mTracerMinDistance;
var() float mTracerSpeed;
var Vector mOldHitLocation;
var wSkinShell wParts[3];
var float fPartsCullDistance;
var bool bAttachSilencer;

simulated function Destroyed()
{
    // End:0x17
    if(mTracer != none)
    {
        mTracer.Destroy();
    }
    // End:0x2E
    if(mMuzFlash3rd != none)
    {
        mMuzFlash3rd.Destroy();
    }
    // End:0x45
    if(mSmoke3rd != none)
    {
        mSmoke3rd.Destroy();
    }
    // End:0x5C
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

    // End:0x2F
    if((arrEffData[LastHitIdx].HitActor == none) || FRand() >= ResParams.default.fTracerPop)
    {
        return;
    }
    // End:0x4A
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x63
    if(mTracer == none)
    {
        mTracer = Spawn(mTracerClass);
    }
    // End:0x273
    if(mTracer != none)
    {
        SpawnLoc = GetTracerStart();
        mTracer.SetLocation(SpawnLoc);
        hitDist = VSize(arrEffLocation[LastHitIdx] - SpawnLoc) - mTracerPullback;
        SpawnDir = Normal(arrEffLocation[LastHitIdx] - SpawnLoc);
        // End:0x273
        if(hitDist > mTracerMinDistance)
        {
            spawnVel = SpawnDir * mTracerSpeed;
            mTracer.Emitters[0].StartVelocityRange.X.Min = spawnVel.X;
            mTracer.Emitters[0].StartVelocityRange.X.Max = spawnVel.X;
            mTracer.Emitters[0].StartVelocityRange.Y.Min = spawnVel.Y;
            mTracer.Emitters[0].StartVelocityRange.Y.Max = spawnVel.Y;
            mTracer.Emitters[0].StartVelocityRange.Z.Min = spawnVel.Z;
            mTracer.Emitters[0].StartVelocityRange.Z.Max = spawnVel.Z;
            mTracer.Emitters[0].LifetimeRange.Min = hitDist / mTracerSpeed;
            mTracer.Emitters[0].LifetimeRange.Max = mTracer.Emitters[0].LifetimeRange.Min;
            mTracer.SpawnParticle(1);
        }
    }
    mOldHitLocation = arrEffLocation[LastHitIdx];
    //return;    
}

function UpdatePenetrateHit(EffectData EffData[6], Vector HitLocation[6], int mLastHitIdx)
{
    local int i, Max;

    SpawnHitCount++;
    LastHitIdx = mLastHitIdx;
    // End:0x3D
    if((LastHitIdx > 0) && LastHitIdx < 3)
    {
        Max = LastHitIdx * 2;        
    }
    else
    {
        Max = LastHitIdx;
    }
    i = 0;
    J0x4F:

    // End:0x96 [Loop If]
    if(i <= Max)
    {
        arrEffLocation[i] = HitLocation[i];
        arrEffData[i] = EffData[i];
        i++;
        // [Loop Continue]
        goto J0x4F;
    }
    //return;    
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial)
{
    local EffectData EffData[6];
    local Vector HitLoc[6];
    local int i;

    EffData[0].HitActor = HitActor;
    EffData[0].HitNormal = HitNormal;
    EffData[0].HitMaterial = HitMaterial;
    HitLoc[0] = HitLocation;
    UpdatePenetrateHit(EffData, HitLoc, 0);
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
    local Rotator R;

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
        mMuzFlash3rd.mStartParticles++;        
    }
    else
    {
        // End:0x69
        if(mMuzFlashEmitterClass != none)
        {
            SpawnEmitter(mMuzFlashEmitterClass);
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
    // End:0x45
    if(mShellCaseEmitter != none)
    {
        mShellCaseEmitter.Trigger(self, Instigator);
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

    // End:0xA1
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
        // End:0x5F
        if(mSilencerSmoke3rd != none)
        {
            mSilencerSmoke3rd.mStartParticles++;            
        }
        else
        {
            // End:0x75
            if(mSilencerSmokeEmitterClass != none)
            {
                SpawnEmitter(mSilencerSmokeEmitterClass);
            }
        }
        R.Roll = Rand(65536);
        SetBoneRotation(GetBoneNameSilencer(), R, 0, 1.0000000);        
    }
    else
    {
        // End:0xD6
        if(mSmoke3rd == none)
        {
            mSmoke3rd = Spawn(mSmokeClass);
            // End:0xD6
            if(mSmoke3rd != none)
            {
                AttachToBone(mSmoke3rd, GetBoneNameTip());
            }
        }
        // End:0xF4
        if(mSmoke3rd != none)
        {
            mSmoke3rd.mStartParticles++;            
        }
        else
        {
            // End:0x10A
            if(mSmokeEmitterClass != none)
            {
                SpawnEmitter(mSmokeEmitterClass);
            }
        }
    }
    //return;    
}

simulated event ThirdPersonEffects()
{
    local PlayerController PC;
    local Vector invlookvec, StartLocation;
    local float dotv, Alpha;
    local int i, Max;

    // End:0x2C1
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x2C1
        if(int(FiringMode) == 0)
        {
            WeaponLight();
            PC = Level.GetLocalPlayerController();
            // End:0x25F
            if(int(OldSpawnHitCount) != int(SpawnHitCount))
            {
                // End:0x7F
                if((LastHitIdx > 0) && LastHitIdx < 3)
                {
                    Max = LastHitIdx * 2;                    
                }
                else
                {
                    Max = LastHitIdx;
                }
                OldSpawnHitCount = SpawnHitCount;
                StartLocation = Instigator.Location;
                i = 0;
                J0xB0:

                // End:0x244 [Loop If]
                if(i <= Max)
                {
                    GetHitInfo(i);
                    // End:0x23A
                    if(((Instigator != none) && Instigator.Controller == PC) || VSize(PC.ViewTarget.Location - arrEffLocation[i]) < float(4000))
                    {
                        invlookvec = StartLocation - arrEffLocation[i];
                        StartLocation = arrEffLocation[i];
                        // End:0x16E
                        if(invlookvec.Z < float(0))
                        {
                            invlookvec.Z = 0.0000000;
                        }
                        invlookvec = Normal(invlookvec);
                        dotv = invlookvec Dot arrEffData[i].HitNormal;
                        dotv = Abs(dotv);
                        // End:0x1B7
                        if(dotv > 0.7000000)
                        {                            
                        }
                        else
                        {
                            Alpha = dotv / 0.7000000;
                            invlookvec = (invlookvec * Alpha) + (arrEffData[i].HitNormal * (float(1) - Alpha));
                        }
                        Spawn(Class'XWeapons.HitEffect'.static.GetHitEffectByMaterial(arrEffData[i].HitMaterial),,, arrEffLocation[i], Rotator(invlookvec));
                        CheckForSplash(i);
                    }
                    i++;
                    // [Loop Continue]
                    goto J0xB0;
                }
                // End:0x25F
                if(bAttachSilencer == false)
                {
                    Instigator.MakeFireNoise();
                }
            }
            // End:0x2C1
            if(int(FlashCount) > 0)
            {
                // End:0x29D
                if(PC.IsInState('Spectating') && PC.ViewTarget == Instigator)
                {                    
                }
                else
                {
                    // End:0x2AF
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
    //return;    
}

simulated event wLoadOut(int iID, int iAddPartsID)
{
    super(WeaponAttachment).wLoadOut(iID, iAddPartsID);
    mMuzFlashClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_3rd, Class'Core.Class'));
    // End:0x63
    if(mMuzFlashClass == none)
    {
        mMuzFlashEmitterClass = Class<Emitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_3rd, Class'Core.Class'));
    }
    mSmokeClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_3rd, Class'Core.Class'));
    // End:0xB6
    if(mSmokeClass == none)
    {
        mSmokeEmitterClass = Class<Emitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_3rd, Class'Core.Class'));
    }
    mSilencerSmokeClass = Class<wEmitter>(DynamicLoadObject("Xeffects.Silencer_smoke_3RD", Class'Core.Class'));
    // End:0x127
    if(mSilencerSmokeClass == none)
    {
        mSilencerSmokeEmitterClass = Class<Emitter>(DynamicLoadObject("Xeffects.Silencer_smoke_3RD", Class'Core.Class'));
    }
    mShellCaseEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell_3rd, Class'Core.Class'));
    // End:0x1AF
    if(mShellCaseEmitterClass != none)
    {
        mShellCaseEmitter = Spawn(mShellCaseEmitterClass, self);
        // End:0x19F
        if(wTurret_FNM240(Instigator) != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(mShellCaseEmitter, 'shell');            
        }
        else
        {
            AttachToBone(mShellCaseEmitter, 'shell');
        }
    }
    AddParts(iID, iAddPartsID);
    //return;    
}

simulated function AddParts(int iWeaponID, int iAddPartsID)
{
    local wPartsGroupParam PartsParam;
    local wItemResourceParam ItemResParam;
    local StaticMesh newStMesh;
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
    // End:0x547
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x547
        if((wcpp.iItemID > 0) && wcpp.iPartID == iSilencerPartID)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x547
            if(ItemResParam.iItemResourceID != -1)
            {
                wParts[1] = Spawn(Class'Engine.wSkinShell');
                wParts[1].SetDrawType(8);
                wParts[1].SetStaticMesh(Level.GameMgr.GetItemResourceStaticMesh(wcpp.iItemID, true));
                wParts[1].SetBase(self);
                wParts[1].SetOwner(self);
                wParts[1].bAnimByOwner = false;
                wParts[1].CullDistance = fPartsCullDistance;
                // End:0x535
                if(Len(ItemResParam.strRes_3rd_AF_Gore) > 1)
                {
                    wParts[1].Skins[0] = Material(DynamicLoadObject(ItemResParam.strRes_3rd_AF_Gore, Class'Engine.Material'));
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
    else
    {
        // End:0x5D5
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