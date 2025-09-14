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
    super(Actor).Destroyed();
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

    // End:0x24
    if((mHitActor == none) || FRand() >= ResParams.default.fTracerPop)
    {
        return;
    }
    // End:0x3F
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x58
    if(mTracer == none)
    {
        mTracer = Spawn(mTracerClass);
    }
    // End:0x25C
    if(mTracer != none)
    {
        SpawnLoc = GetTracerStart();
        mTracer.SetLocation(SpawnLoc);
        hitDist = VSize(mHitLocation - SpawnLoc) - mTracerPullback;
        SpawnDir = Normal(mHitLocation - SpawnLoc);
        // End:0x25C
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
    mOldHitLocation = mHitLocation;
    //return;    
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial)
{
    SpawnHitCount++;
    mHitLocation = HitLocation;
    mHitActor = HitActor;
    mHitNormal = HitNormal;
    mHitMaterial = HitMaterial;
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
    R.Roll = Rand(65536);
    SetBoneRotation(GetBoneNameRotation(), R, 0, 1.0000000);
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
        R.Roll = Rand(65536);
        SetBoneRotation(GetBoneNameRotation(), R, 0, 1.0000000);
    }
    //return;    
}

simulated event ThirdPersonEffects()
{
    local PlayerController PC;
    local Vector invlookvec;
    local float dotv, Alpha;

    // End:0x212
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x212
        if(int(FiringMode) == 0)
        {
            WeaponLight();
            PC = Level.GetLocalPlayerController();
            // End:0x1B0
            if(int(OldSpawnHitCount) != int(SpawnHitCount))
            {
                OldSpawnHitCount = SpawnHitCount;
                GetHitInfo();
                // End:0x195
                if(((Instigator != none) && Instigator.Controller == PC) || VSize(PC.ViewTarget.Location - mHitLocation) < float(4000))
                {
                    invlookvec = Instigator.Location - mHitLocation;
                    // End:0xF5
                    if(invlookvec.Z < float(0))
                    {
                        invlookvec.Z = 0.0000000;
                    }
                    invlookvec = Normal(invlookvec);
                    dotv = invlookvec Dot mHitNormal;
                    dotv = Abs(dotv);
                    // End:0x133
                    if(dotv > 0.7000000)
                    {                        
                    }
                    else
                    {
                        Alpha = dotv / 0.7000000;
                        invlookvec = (invlookvec * Alpha) + (mHitNormal * (float(1) - Alpha));
                    }
                    Spawn(Class'XWeapons.HitEffect'.static.GetHitEffectByMaterial(mHitMaterial),,, mHitLocation, Rotator(invlookvec));
                    CheckForSplash();
                }
                // End:0x1B0
                if(bAttachSilencer == false)
                {
                    Instigator.MakeFireNoise();
                }
            }
            // End:0x212
            if(int(FlashCount) > 0)
            {
                // End:0x1EE
                if(PC.IsInState('Spectating') && PC.ViewTarget == Instigator)
                {                    
                }
                else
                {
                    // End:0x200
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

    ClearParts();
    PartsParam = Level.GameMgr.GetAddPartsGroupParam(iAddPartsID);
    // End:0x43
    if(PartsParam.iAddPartID == -1)
    {
        return;
    }
    // End:0x15D
    if(PartsParam.iSightID != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSightID);
        // End:0x15D
        if(ItemResParam.iItemResourceID != -1)
        {
            newStMesh = Level.GameMgr.GetItemResourceStaticMesh(PartsParam.iSightID, true);
            wParts[0] = Spawn(Class'Engine.wSkinShell', self);
            wParts[0].SetDrawType(8);
            wParts[0].SetStaticMesh(newStMesh);
            wParts[0].SetBase(self);
            wParts[0].SetOwner(self);
            wParts[0].bAnimByOwner = false;
            wParts[0].CullDistance = fPartsCullDistance;
            AttachToBone(wParts[0], 'Sight');
        }
    }
    bAttachSilencer = false;
    // End:0x287
    if(PartsParam.iSilencerID != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
        // End:0x287
        if(ItemResParam.iItemResourceID != -1)
        {
            newStMesh = Level.GameMgr.GetItemResourceStaticMesh(PartsParam.iSilencerID, true);
            wParts[1] = Spawn(Class'Engine.wSkinShell', self);
            wParts[1].SetDrawType(8);
            wParts[1].SetStaticMesh(newStMesh);
            wParts[1].SetBase(self);
            wParts[1].SetOwner(self);
            wParts[1].bAnimByOwner = false;
            wParts[1].CullDistance = fPartsCullDistance;
            AttachToBone(wParts[1], 'Silencer');
            bAttachSilencer = true;
        }
    }
    // End:0x3A9
    if(PartsParam.iSightID_Sub != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSightID_Sub);
        // End:0x3A9
        if(ItemResParam.iItemResourceID != -1)
        {
            newStMesh = Level.GameMgr.GetItemResourceStaticMesh(PartsParam.iSightID_Sub, true);
            wParts[2] = Spawn(Class'Engine.wSkinShell', self);
            wParts[2].SetDrawType(8);
            wParts[2].SetStaticMesh(newStMesh);
            wParts[2].SetBase(self);
            wParts[2].SetOwner(self);
            wParts[2].bAnimByOwner = false;
            wParts[2].CullDistance = fPartsCullDistance;
            AttachToBone(wParts[2], 'Sight');
        }
    }
    // End:0x3F0
    if(iPainting_Item_ID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, PartsParam.iAddPartID, true, iPainting_Item_ID);        
    }
    else
    {
        // End:0x449
        if(PartsParam.iPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, PartsParam.iAddPartID, true, PartsParam.iPaintingID);            
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
    mTracerPullback=50.0000000
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