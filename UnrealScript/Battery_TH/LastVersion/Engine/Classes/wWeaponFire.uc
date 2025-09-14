class wWeaponFire extends Object
    native;

enum ESpreadStyle
{
    SStyle_None,                    // 0
    SStyle_Random,                  // 1
    SStyle_Line,                    // 2
    SStyle_Ring                     // 3
};

enum ESpreadStance
{
    SS_None,                        // 0
    SS_Stand,                       // 1
    SS_Ducked,                      // 2
    SS_Prone                        // 3
};

var() bool bSplashDamage;
var() bool bSplashJump;
var() bool bRecommendSplashDamage;
var() bool bTossed;
var() bool bLeadTarget;
var() bool bInstantHit;
var() bool bPawnRapidFireAnim;
var() bool bReflective;
var bool bTimerLoop;
var() bool bFireOnRelease;
var() bool bWaitForRelease;
var() bool bModeExclusive;
var bool bInputFire;
var bool bIsFiring;
var bool bNowWaiting;
var bool bServerDelayStopFire;
var bool bServerDelayStartFire;
var bool bInstantStop;
var() bool bAttachSmokeEmitter;
var() bool bAttachFlashEmitter;
var float TimerInterval;
var float NextTimerPop;
var() wWeapon Weapon;
var Pawn Instigator;
var LevelInfo Level;
var Actor Owner;
var float NextFireTime;
var() float PreFireTime;
var() float MaxHoldTime;
var() float HoldTime;
var() int ThisModeNum;
var float TransientSoundVolume;
var float TransientSoundRadius;
var() name PreFireAnim;
var() name FireAnim;
var() name FireLoopAnim;
var() name FireEndAnim;
var() name ReloadAnim;
var() float PreFireAnimRate;
var() float FireAnimRate;
var() float FireLoopAnimRate;
var() float FireEndAnimRate;
var() float ReloadAnimRate;
var() float TweenTime;
var() string FmodFireSound_Stereo;
var() string FmodFireSound;
var() string FmodReloadSound;
var() string FmodNoAmmoSound;
var() string FireForce;
var() string ReloadForce;
var() string NoAmmoForce;
var() float FireRate;
var float ServerStartFireTime;
var bool bEnableBustMode;
var bool IsFiringBustMode;
var int iFireRBC;
var int iFireCount;
var float fFireRBT;
var bool bReleasedFiring;
var() Class<wAmmunition> AmmoClass;
var() int AmmoPerFire;
var() int AmmoClipSize;
var() float Load;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var() Class<wProjectile> ProjectileClass;
var() float BotRefireRate;
var() float WarnTargetPct;
var() Class<wEmitter> FlashEmitterClass;
var() wEmitter FlashEmitter;
var() Class<Emitter> FlashFirstPersonEmitterClass;
var() Class<wEmitter> SmokeEmitterClass;
var() wEmitter SmokeEmitter;
var() Class<Emitter> SmokeFirstPersonEmitterClass;
var() float AimError;
var() float Spread;
var() wWeaponFire.ESpreadStyle SpreadStyle;
var int FireCount;
var int iPartsDamage;
var int iPartsDamage_Outer;
var float fPartsDamRange_Eff;
var float fPartsDamRange_Max;
var FireProperties SavedFireProperties;
var wWeaponBaseParams BaseParams;
var Class<wWeaponRes_Base> ResParams;
var bool bMakeRadarNoise;
var wWeaponFire.ESpreadStance SpreadStance;
var int nBulletPerfire;
var int AutoAimCount;

// Export UwWeaponFire::execGetCollisionPartsDamage(FFrame&, void* const)
native function float GetCollisionPartsDamage(int partsType)
{
    //native.partsType;        
}

simulated function SetTimer(float NewTimerRate, bool bLoop)
{
    bTimerLoop = bLoop;
    TimerInterval = NewTimerRate;
    NextTimerPop = Level.TimeSeconds + TimerInterval;
    //return;    
}

event Timer()
{
    //return;    
}

simulated function PreBeginPlay()
{
    //return;    
}

simulated function BeginPlay()
{
    //return;    
}

simulated function PostNetBeginPlay()
{
    //return;    
}

simulated event SetInitialState()
{
    GotoState('Auto');
    //return;    
}

simulated function PostBeginPlay()
{
    Load = float(AmmoPerFire);
    // End:0x1E
    if(bFireOnRelease)
    {
        bWaitForRelease = true;
    }
    // End:0x2F
    if(bWaitForRelease)
    {
        bNowWaiting = true;
    }
    //return;    
}

simulated function DestroyEffects()
{
    // End:0x17
    if(FlashEmitter != none)
    {
        FlashEmitter.Destroy();
    }
    // End:0x2E
    if(SmokeEmitter != none)
    {
        SmokeEmitter.Destroy();
    }
    //return;    
}

simulated function InitEffects()
{
    // End:0x0D
    if(!AllowEffects())
    {
        return;
    }
    // End:0x50
    if((FlashEmitterClass != none) && (FlashEmitter == none) || FlashEmitter.bDeleteMe)
    {
        FlashEmitter = Weapon.Spawn(FlashEmitterClass);
    }
    // End:0x93
    if((SmokeEmitterClass != none) && (SmokeEmitter == none) || SmokeEmitter.bDeleteMe)
    {
        SmokeEmitter = Weapon.Spawn(SmokeEmitterClass);
    }
    //return;    
}

simulated function bool AllowEffects()
{
    // End:0x36
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
    {
        return false;
    }
    return true;
    //return;    
}

function DoFireEffect()
{
    //return;    
}

function DoFireEffectForClient()
{
    //return;    
}

function DrawMuzzleFlash(Canvas Canvas)
{
    // End:0x61
    if((SmokeEmitter != none) && SmokeEmitter.Base != Weapon)
    {
        SmokeEmitter.SetLocation(Weapon.GetEffectStart());
        Canvas.DrawActor(SmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    // End:0xC2
    if((FlashEmitter != none) && FlashEmitter.Base != Weapon)
    {
        FlashEmitter.SetLocation(Weapon.GetEffectStart());
        Canvas.DrawActor(FlashEmitter, false, false, Weapon.DisplayFOV);
    }
    //return;    
}

function FlashMuzzleFlash()
{
    local Actor ac;

    // End:0x27
    if(FlashEmitter != none)
    {
        FlashEmitter.Trigger(Weapon, Instigator);        
    }
    else
    {
        // End:0x79
        if(FlashFirstPersonEmitterClass != none)
        {
            ac = Spawn(FlashFirstPersonEmitterClass, Instigator,, WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st().Origin, Instigator.Rotation);
        }
    }
    //return;    
}

function StartMuzzleSmoke()
{
    // End:0x87
    if(!Level.bDropDetail)
    {
        // End:0x3B
        if(SmokeEmitter != none)
        {
            SmokeEmitter.Trigger(Weapon, Instigator);            
        }
        else
        {
            // End:0x87
            if(SmokeFirstPersonEmitterClass != none)
            {
                Spawn(SmokeFirstPersonEmitterClass, Instigator,, WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st().Origin, Instigator.Rotation);
            }
        }
    }
    //return;    
}

function ShakeView()
{
    local PlayerController P;
    local Rotator rMin, rMax;
    local int iPitch, iYaw;
    local float fDecayFastBeginTime;
    local Rotator Range;
    local float frange, frangeY;
    local bool bUseWT;
    local float fRandValue;

    P = PlayerController(Instigator.Controller);
    bUseWT = false;
    // End:0x84
    if(P != none)
    {
        bUseWT = (!P.bAimMode && Weapon.wt_BoundingMax > 0) || P.bAimMode && Weapon.wtAim_BoundingMax > 0;
    }
    // End:0x47C
    if(bUseWT)
    {
        // End:0x1CF
        if(P.bAimMode)
        {
            frange = 0.0000000;
            // End:0xDC
            if(Weapon.wt_index >= Weapon.wtAim_x.Length)
            {
                Weapon.wt_index = 0;
            }
            // End:0x102
            if(Weapon.wt_index > 80)
            {
                Weapon.wt_index = 75;
            }
            frangeY = Weapon.wtAim_y[Weapon.wt_index] + ((Weapon.wtAim_RandomMul * (FRand() - 0.5000000)) * Weapon.wtAim_RandomWeight[Weapon.wt_index]);
            frange = Weapon.wtAim_x[Weapon.wt_index] + ((Weapon.wtAim_RandomMul * (FRand() - 0.5000000)) * Weapon.wtAim_RandomWeight[Weapon.wt_index]);
            Weapon.wt_index++;            
        }
        else
        {
            frange = 0.0000000;
            // End:0x20C
            if(Weapon.wt_index >= Weapon.wt_x.Length)
            {
                Weapon.wt_index = 0;
            }
            // End:0x232
            if(Weapon.wt_index > 80)
            {
                Weapon.wt_index = 75;
            }
            frangeY = Weapon.wt_y[Weapon.wt_index] + ((Weapon.wt_RandomMul * (FRand() - 0.5000000)) * Weapon.wt_RandomWeight[Weapon.wt_index]);
            frange = Weapon.wt_x[Weapon.wt_index] + ((Weapon.wt_RandomMul * (FRand() - 0.5000000)) * Weapon.wt_RandomWeight[Weapon.wt_index]);
            Weapon.wt_index++;
        }
        // End:0x32B
        if((frange >= -0.0010000) && frange <= 0.0010000)
        {
            Range.Yaw = 0;            
        }
        else
        {
            // End:0x376
            if(frange > float(0))
            {
                Range.Yaw = int(float(int(float(32768) / 3.1415927)) * ((3.1415927 / 2.0000000) - Atan(1.0000000, frange)));                
            }
            else
            {
                // End:0x3BC
                if(frange < float(0))
                {
                    Range.Yaw = int(-32768.0000000 / 3.1415927 * ((3.1415927 / 2.0000000) - Atan(1.0000000, -frange)));
                }
            }
        }
        // End:0x3EB
        if((frangeY >= -0.0010000) && frangeY <= 0.0010000)
        {
            Range.Pitch = 0;            
        }
        else
        {
            // End:0x436
            if(frangeY > float(0))
            {
                Range.Pitch = int(float(int(float(32768) / 3.1415927)) * ((3.1415927 / 2.0000000) - Atan(1.0000000, frangeY)));                
            }
            else
            {
                // End:0x47C
                if(frangeY < float(0))
                {
                    Range.Pitch = int(-32768.0000000 / 3.1415927 * ((3.1415927 / 2.0000000) - Atan(1.0000000, -frangeY)));
                }
            }
        }
    }
    // End:0x822
    if(P != none)
    {
        // End:0x68C
        if(Weapon.IsA('wGun') && int(wGun(Weapon).AimState) == int(2))
        {
            fDecayFastBeginTime = BaseParams.fViewKickAds_DecayTimeFast;
            // End:0x53B
            if(bUseWT)
            {
                P.wShakeView(Range.Pitch, Range.Yaw, BaseParams.fViewKickAds_Accel, BaseParams.fViewKickAds_Decel, BaseParams.fViewKickAds_StayTime, BaseParams.fViewKickAds_DecaySpeed, fDecayFastBeginTime);                
            }
            else
            {
                rMin.Pitch = int(BaseParams.fViewKickAds_YMin);
                rMin.Yaw = int(BaseParams.fViewKickAds_XMin);
                rMax.Pitch = int(BaseParams.fViewKickAds_YMax);
                rMax.Yaw = int(BaseParams.fViewKickAds_XMax);
                fRandValue = FRand() * float(rMax.Pitch - rMin.Pitch);
                iPitch = int(fRandValue);
                fRandValue = FRand() * float(rMax.Yaw - rMin.Yaw);
                iYaw = int(fRandValue);
                iPitch = rMin.Pitch + iPitch;
                iYaw = rMin.Yaw + iYaw;
                P.wShakeView(iPitch, iYaw, BaseParams.fViewKickAds_Accel, BaseParams.fViewKickAds_Decel, BaseParams.fViewKickAds_StayTime, BaseParams.fViewKickAds_DecaySpeed, fDecayFastBeginTime);
            }            
        }
        else
        {
            fDecayFastBeginTime = BaseParams.fViewKickHip_DecayTimeFast;
            // End:0x70C
            if(bUseWT)
            {
                P.wShakeView(Range.Pitch, Range.Yaw, BaseParams.fViewKickHip_Accel, BaseParams.fViewKickHip_Decel, BaseParams.fViewKickHip_StayTime, BaseParams.fViewKickHip_DecaySpeed, fDecayFastBeginTime);                
            }
            else
            {
                rMin.Pitch = int(BaseParams.fViewKickHip_YMin);
                rMin.Yaw = int(BaseParams.fViewKickHip_XMin);
                rMax.Pitch = int(BaseParams.fViewKickHip_YMax);
                rMax.Yaw = int(BaseParams.fViewKickHip_XMax);
                iPitch = rMin.Pitch + Rand(rMax.Pitch - rMin.Pitch);
                iYaw = rMin.Yaw + Rand(rMax.Yaw - rMin.Yaw);
                P.wShakeView(iPitch, iYaw, BaseParams.fViewKickHip_Accel, BaseParams.fViewKickHip_Decel, BaseParams.fViewKickHip_StayTime, BaseParams.fViewKickHip_DecaySpeed, fDecayFastBeginTime);
            }
        }
    }
    //return;    
}

function ClientPlayForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Instigator.Controller);
    // End:0x4C
    if((PC != none) && PC.bEnableWeaponForceFeedback)
    {
        PC.ClientPlayForceFeedback(EffectName);
    }
    //return;    
}

function StopForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Instigator.Controller);
    // End:0x4C
    if((PC != none) && PC.bEnableWeaponForceFeedback)
    {
        PC.StopForceFeedback(EffectName);
    }
    //return;    
}

function Update(float dt)
{
    //return;    
}

function StartFiring()
{
    //return;    
}

function StopFiring()
{
    //return;    
}

function bool IsFiring()
{
    return bIsFiring;
    //return;    
}

event ModeTick(float dt)
{
    //return;    
}

simulated function SyncRandSeed()
{
    local int RandSeed, DeathCount;

    // End:0x23
    if((Instigator == none) || Instigator.PlayerReplicationInfo == none)
    {
        return;
    }
    DeathCount = int(Instigator.PlayerReplicationInfo.Deaths * float(107));
    RandSeed = (DeathCount + Instigator.PlayerReplicationInfo.PlayerID) + (Weapon.SRand_FireCount * 13);
    SRand(RandSeed);
    Rand(10000);
    Weapon.SRand_FireCount++;
    //return;    
}

event ModeDoFire()
{
    local int i;

    // End:0x3E
    if(!AllowFire())
    {
        // End:0x3C
        if(int(Instigator.TypeOfWeapon) == int(Instigator.18))
        {
            Instigator.StopFiring();
        }
        return;
    }
    // End:0x5F
    if(MaxHoldTime > 0.0000000)
    {
        HoldTime = FMin(HoldTime, MaxHoldTime);
    }
    // End:0x182
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        Weapon.SeverConsumeAmmo(ThisModeNum, Load);
        WeaponAttachment(Weapon.ThirdPersonActor).ClearArray();
        nBulletPerfire = Weapon.BaseParams.iBulletCount;
        // End:0xDD
        if(nBulletPerfire == 0)
        {
            nBulletPerfire = 1;
        }
        i = 0;
        J0xE4:

        // End:0x109 [Loop If]
        if(i < nBulletPerfire)
        {
            SyncRandSeed();
            DoFireEffect();
            i++;
            // [Loop Continue]
            goto J0xE4;
        }
        HoldTime = 0.0000000;
        // End:0x137
        if((Instigator == none) || Instigator.Controller == none)
        {
            return;
        }
        // End:0x173
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
    }
    // End:0x223
    if(Instigator.IsLocallyControlled())
    {
        ShakeView();
        PlayFiring();
        FlashMuzzleFlash();
        StartMuzzleSmoke();
        // End:0x220
        if(int(Weapon.Role) < int(ROLE_Authority))
        {
            nBulletPerfire = Weapon.BaseParams.iBulletCount;
            // End:0x1F4
            if(nBulletPerfire == 0)
            {
                nBulletPerfire = 1;
            }
            i = 0;
            J0x1FB:

            // End:0x220 [Loop If]
            if(i < nBulletPerfire)
            {
                SyncRandSeed();
                DoFireEffectForClient();
                i++;
                // [Loop Continue]
                goto J0x1FB;
            }
        }        
    }
    else
    {
        ServerPlayFiring();
    }
    Weapon.IncrementFlashCount(ThisModeNum);
    // End:0x295
    if(bFireOnRelease)
    {
        Log("bFireOnRelease");
        // End:0x277
        if(bIsFiring)
        {
            NextFireTime += (MaxHoldTime + FireRate);            
        }
        else
        {
            NextFireTime = Level.TimeSeconds + FireRate;
        }        
    }
    else
    {
        // End:0x2D2
        if(bEnableBustMode)
        {
            iFireCount++;
            // End:0x2C3
            if(iFireCount >= iFireRBC)
            {
                NextFireTime += FireRate;                
            }
            else
            {
                NextFireTime += fFireRBT;
            }            
        }
        else
        {
            NextFireTime += FireRate;
        }
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0000000;
    // End:0x35D
    if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        iFireCount = 0;
        Weapon.PutDown();
    }
    //return;    
}

event ModeHoldFire()
{
    // End:0x18
    if(Instigator.IsLocallyControlled())
    {
        PlayStartHold();
    }
    //return;    
}

simulated function bool AllowFire()
{
    // End:0x1F
    if(!Instigator.Controller.AllowFire())
    {
        return false;
    }
    // End:0x4E
    if(int(Weapon.MeleeState) == int(1))
    {
        Weapon.ClientStopFire(ThisModeNum);
        return false;
    }
    return Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire;
    //return;    
}

function ServerPlayFiring()
{
    Instigator.FmodSpecPlaySound(FmodFireSound_Stereo, 0, FireAnimRate,, false);
    Instigator.FmodPlaySound(FmodFireSound, 0, FireAnimRate,, true,,, true);
    //return;    
}

function PlayPreFire()
{
    // End:0x45
    if((Weapon.Mesh != none) && Weapon.HasAnim(PreFireAnim))
    {
        Weapon.PlayAnim(PreFireAnim, PreFireAnimRate, TweenTime);
    }
    //return;    
}

function PlayStartHold()
{
    //return;    
}

function PlayFiring()
{
    // End:0x8A
    if(Weapon.Mesh != none)
    {
        // End:0x6F
        if(FireCount > 0)
        {
            // End:0x51
            if(Weapon.HasAnim(FireLoopAnim))
            {
                Weapon.PlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000);                
            }
            else
            {
                Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
            }            
        }
        else
        {
            Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
        }
    }
    Instigator.FmodPlaySoundUseID(FmodFireSound_Stereo, 0, FireAnimRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
    // End:0x110
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        Instigator.FmodPlaySound(FmodFireSound, 0, FireAnimRate,, false,,, true);
    }
    ClientPlayForceFeedback(FireForce);
    FireCount++;
    //return;    
}

function PlayFireEnd()
{
    // End:0x45
    if((Weapon.Mesh != none) && Weapon.HasAnim(FireEndAnim))
    {
        Weapon.PlayAnim(FireEndAnim, FireEndAnimRate, TweenTime);
    }
    //return;    
}

function Rotator AdjustAim(Vector Start, float InAimError)
{
    // End:0xA6
    if(!SavedFireProperties.bInitialized)
    {
        SavedFireProperties.AmmoClass = AmmoClass;
        SavedFireProperties.ProjectileClass = ProjectileClass;
        SavedFireProperties.WarnTargetPct = WarnTargetPct;
        SavedFireProperties.MaxRange = MaxRange();
        SavedFireProperties.bTossed = bTossed;
        SavedFireProperties.bTrySplash = bRecommendSplashDamage;
        SavedFireProperties.bLeadTarget = bLeadTarget;
        SavedFireProperties.bInstantHit = bInstantHit;
        SavedFireProperties.bInitialized = true;
    }
    return Instigator.super(wWeaponFire).AdjustAim(SavedFireProperties, Start, int(InAimError));
    //return;    
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Instigator.Location + Instigator.EyePosition();
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.SetDrawColor(0, byte(255), 0);
    //return;    
}

function float MaxRange()
{
    return 5000.0000000;
    //return;    
}

function Actor Spawn(Class<Actor> SpawnClass, optional Actor SpawnOwner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation)
{
    return Weapon.Spawn(SpawnClass, SpawnOwner, SpawnTag, SpawnLocation, SpawnRotation);
    //return;    
}

function Actor Trace(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional Vector Extent, optional out Material Material)
{
    return Weapon.Trace(HitLocation, HitNormal, TraceEnd, TraceStart, bTraceActors, Extent, Material);
    //return;    
}

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    AmmoPerFire = BaseParams.iBulletCount / BaseParams.iBulletCount;
    switch(BaseParams.iFireMode)
    {
        // End:0x6B
        case 0:
            bWaitForRelease = true;
            // End:0x90
            break;
        // End:0x7A
        case 1:
            bWaitForRelease = false;
            // End:0x90
            break;
        // End:0x8A
        case 2:
            bWaitForRelease = true;
            // End:0x90
            break;
        // End:0xFFFF
        default:
            // End:0x90
            break;
            break;
    }
    // End:0xF8
    if(ResParams.default.szClass_Muzz_1st != "")
    {
        FlashEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, Class'Core.Class'));
        // End:0xF8
        if(FlashEmitterClass == none)
        {
            FlashFirstPersonEmitterClass = Class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, Class'Core.Class'));
        }
    }
    // End:0x160
    if(ResParams.default.szClass_Smoke_1st != "")
    {
        SmokeEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, Class'Core.Class'));
        // End:0x160
        if(SmokeEmitterClass == none)
        {
            SmokeFirstPersonEmitterClass = Class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, Class'Core.Class'));
        }
    }
    FmodFireSound = ResParams.default.fsound_Fire;
    FmodFireSound_Stereo = ResParams.default.fsound_Fire_Stereo;
    FireRate = BaseParams.fRateOfFire;
    iFireRBC = BaseParams.iRoundBurstCount;
    fFireRBT = BaseParams.fRoundBurstTime;
    iFireCount = 0;
    // End:0x1DE
    if(iFireRBC > 0)
    {
        bEnableBustMode = true;
    }
    //return;    
}

function SetSpreadStance(wWeaponFire.ESpreadStance ss)
{
    SpreadStance = ss;
    //return;    
}

function MakeFireNoise()
{
    // End:0x18
    if(bMakeRadarNoise)
    {
        Instigator.MakeFireNoise();
    }
    //return;    
}

event DamageLog(Pawn Victim, float fDam, float fDist, Actor.CollisionPartsType CParts)
{
    local string szType, szName, szParts;

    // End:0x20
    if(!Level.GetLocalPlayerController().bDamageLog)
    {
        return;
    }
    // End:0x68
    if((Instigator.Controller != Level.GetLocalPlayerController()) && Victim.Controller != Level.GetLocalPlayerController())
    {
        return;
    }
    // End:0x88
    if(Victim.PlayerReplicationInfo.PlayerName == "")
    {
        return;
    }
    // End:0xDA
    if(Instigator.Controller == Level.GetLocalPlayerController())
    {
        szType = "[Attack]";
        szName = Victim.PlayerReplicationInfo.PlayerName;        
    }
    else
    {
        szType = "[Defend]";
        szName = Instigator.PlayerReplicationInfo.PlayerName;
    }
    switch(CParts)
    {
        // End:0x122
        case 1:
            szParts = "Head";
            // End:0x37D
            break;
        // End:0x13D
        case 2:
            szParts = "Upper Torso";
            // End:0x37D
            break;
        // End:0x158
        case 3:
            szParts = "Lower Torso";
            // End:0x37D
            break;
        // End:0x173
        case 4:
            szParts = "Upper Arm L";
            // End:0x37D
            break;
        // End:0x18E
        case 5:
            szParts = "Upper Arm R";
            // End:0x37D
            break;
        // End:0x1A9
        case 6:
            szParts = "Lower Arm L";
            // End:0x37D
            break;
        // End:0x1C4
        case 7:
            szParts = "Lower Arm R";
            // End:0x37D
            break;
        // End:0x1DF
        case 8:
            szParts = "Upper Leg L";
            // End:0x37D
            break;
        // End:0x1FA
        case 9:
            szParts = "Upper Leg R";
            // End:0x37D
            break;
        // End:0x215
        case 10:
            szParts = "Lower Leg L";
            // End:0x37D
            break;
        // End:0x230
        case 11:
            szParts = "Lower Leg R";
            // End:0x37D
            break;
        // End:0x246
        case 12:
            szParts = "Bomb L";
            // End:0x37D
            break;
        // End:0x25C
        case 13:
            szParts = "Bomb R";
            // End:0x37D
            break;
        // End:0x272
        case 14:
            szParts = "Bomb U";
            // End:0x37D
            break;
        // End:0x288
        case 15:
            szParts = "Bomb D";
            // End:0x37D
            break;
        // End:0x2A2
        case 16:
            szParts = "Helicoptor";
            // End:0x37D
            break;
        // End:0x2BC
        case 17:
            szParts = "Head round";
            // End:0x37D
            break;
        // End:0x2DF
        case 18:
            szParts = "Bone_SentryG01_Axis";
            // End:0x37D
            break;
        // End:0x300
        case 19:
            szParts = "Bone_SentryG01_LF";
            // End:0x37D
            break;
        // End:0x321
        case 20:
            szParts = "Bone_SentryG01_RF";
            // End:0x37D
            break;
        // End:0x341
        case 21:
            szParts = "Bone_SentryG01_B";
            // End:0x37D
            break;
        // End:0x366
        case 22:
            szParts = "Bone_SentryG01_Weapon";
            // End:0x37D
            break;
        // End:0x36B
        case 0:
        // End:0xFFFF
        default:
            szParts = "None";
            // End:0x37D
            break;
            break;
    }
    Level.GetLocalPlayerController().myHUD.AddTextMessage((((((((((((((((szType $ " ") $ string(fDam)) $ " / ") $ szName) $ " / ") $ BaseParams.strName) $ " / ") $ string(0)) $ " / ") $ string(fDist)) $ " / ") $ szParts) $ " / ") $ "0%") $ " / ") $ string(Level.TimeSeconds), Class'Engine.GameMessage', Instigator.Controller.PlayerReplicationInfo);
    //return;    
}

defaultproperties
{
    bInstantHit=true
    TransientSoundVolume=1.0000000
    TransientSoundRadius=300.0000000
    PreFireAnim="PreFire"
    FireAnim="Fire"
    FireLoopAnim="FireLoop"
    FireEndAnim="FireEnd"
    ReloadAnim="Reload"
    PreFireAnimRate=1.0000000
    FireAnimRate=1.0000000
    FireLoopAnimRate=1.0000000
    FireEndAnimRate=1.0000000
    ReloadAnimRate=1.0000000
    FireRate=0.5000000
    BotRefireRate=0.9500000
    AimError=600.0000000
}